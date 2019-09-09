From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 9 Sep 2019 09:26:57 -0500
Subject: [Buildroot] [PATCH v2 01/12] package/clang: help host-clang to
 find our external toolchain
In-Reply-To: <20190907094027.9537-2-romain.naour@smile.fr>
References: <20190907094027.9537-1-romain.naour@smile.fr>
 <20190907094027.9537-2-romain.naour@smile.fr>
Message-ID: <CANQCQpYgj1f_zuPSNYY720=0GZ6BjjOWQb_km6sJ+muq1xG_uw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Sat, Sep 7, 2019 at 4:40 AM Romain Naour <romain.naour@smile.fr> wrote:
>
> To build libfuzzer package Matthew Weber noticed that (host) clang
> doesn't run on the host without "-B $(HOST_DIR)/opt/ext-toolchain"
> option. This option add a new search path for binaries and object
> files used implicitly.
>
> Without -B clang fail to link due to missing crtbeging.o file and libgcc:
> output/host/bin/aarch64-linux-gnu-ld: cannot find crtbegin.o: No such file or directory
> output/host/bin/aarch64-linux-gnu-ld: cannot find -lgcc
>
> Indeed, clang search path doesn't include the dafault cross-gcc's search paths:
>
> $ output/host/bin/clang -print-search-dirs
> programs: = output/host/bin:output/host/bin:/..//bin
> libraries: = output/host/lib/clang/8.0.0:
>              output/host/bin/../lib64:
>              /lib/../lib64:
>              /usr/lib/../lib64:
>              output/host/bin/../lib:
>              /lib:/usr/lib
>
> Here is the same command for cross-gcc:
>
> $ output/host/bin/aarch64-linux-gnu-gcc -print-search-dirs
> install: output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/
> programs: = output/host/opt/ext-toolchain/bin/../libexec/gcc/aarch64-linux-gnu/8.3.0/:
>             output/host/opt/ext-toolchain/bin/../libexec/gcc/:
>             output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/aarch64-linux-gnu/8.3.0/:
>             output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/
> libraries: = output/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/:
>              output/host/opt/ext-toolchain/bin/../lib/gcc/:
>              output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/lib/aarch64-linux-gnu/8.3.0/:
>              output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/lib/../lib64/:
>              output/host/aarch64-buildroot-linux-gnu/sysroot/lib/aarch64-linux-gnu/8.3.0/:
>              output/host/aarch64-buildroot-linux-gnu/sysroot/lib/../lib64/:
>              output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/aarch64-linux-gnu/8.3.0/:
>              output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/../lib64/:
>              output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/lib/:
>              output/host/aarch64-buildroot-linux-gnu/sysroot/lib/:
>              output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/
>
> We can see that gcc default search path contains
> "output/host/opt/ext-toolchain" directory where the external toolchain
> has been extracted.
>
> Since we want to use clang without additional option like -B,
> patch clang in order to use GCC_INSTALL_PREFIX instead of
> using automatic detection (which doesn't work for Buildroot).
>
> We eventually want to relocate the Buildroot SDK containing the clang
> cross-compiler, so we provide a relative path to GCC_INSTALL_PREFIX
> in order to avoid to hardcode the path to the GCC toolchain.
>
> Also the path between clang and the GCC external toolchain is not always
> the same, we have the following case:
>
> * Toolchain to be downloaded and installed
>   The toolchain is extracted into $(HOST_DIR)/opt/ext-toolchain, so the
>   path is "../opt/ext-toolchain".
>
> * Pre-installed toolchain
>   The toolchain is localed somewhere in the host filesystem and
>   defined by the user using BR2_TOOLCHAIN_EXTERNAL_PATH.
>
> So, set GCC_INSTALL_PREFIX using realpath:
>
> -DGCC_INSTALL_PREFIX:PATH=`realpath --relative-to=$(HOST_DIR)/bin/ $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)`
>
> When we use a Buildroot's internal toolchain, clang will find theses
> crt*.o files and libgcc.
>
> http://lists.busybox.net/pipermail/buildroot/2019-August/256204.html
>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
> Cc: Valentin Korenblit <valentinkorenblit@gmail.com>

My test consisted of applying this cross compiler series to master and
then applying the compilier-rt series.  In the compiler-rt series, the
-B option was dropped from the build of libfuzzer and the runtime test
was successful in building (ie it found the sysroot based on this
patch's path fix).

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
