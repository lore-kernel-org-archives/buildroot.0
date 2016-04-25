From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Apr 2016 23:08:50 +0200
Subject: [Buildroot] [PATCH 4/5] toolchain-external: align library
 locations in target and staging dir
In-Reply-To: <1455304826-10557-5-git-send-email-patrickdepinguin@gmail.com>
References: <1455304826-10557-1-git-send-email-patrickdepinguin@gmail.com>
 <1455304826-10557-5-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20160425230850.761f4f41@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Feb 2016 20:20:25 +0100, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> The toolchain-external logic is roughly:
> - populate the staging dir by rsyncing the entire ${ARCH_LIB_DIR} and
>   usr/${ARCH_LIB_DIR} from sysroot.
> - populate the target dir by explictly copying some libraries from sysroot
>   into target/lib and some other libraries in target/usr/lib, the split
>   being hardcoded into buildroot regardless of the location in the sysroot.
> 
> This means that a library libfoo could be located in:
>   staging/lib/libfoo.so
>   target/usr/lib/libfoo.so
> 
> When debugging an application that links against this library, gdb will
> fruitlessly search for 'usr/lib/libfoo.so' in staging, and then suggest to
> use 'set solib-search-path' which is a hack, really.
> 
> To solve the problem, we need to make sure that libraries from the toolchain
> are installed in the same relative location in staging and target.
> Achieve this by:
> - replacing the convoluted search for libraries using for+find in sysroot
>   with a simple find in staging.
> - determining DESTDIR for each library individually based on the location in
>   staging.
> - treating LIB_EXTERNAL_LIBS and USR_LIB_EXTERNAL_LIBS equivalently
> 
> These changes also allow for the removal of most arguments to
> copy_toolchain_lib_root in the method itself and their callers.
> 
> Test procedure:
> - set configuration for a given toolchain
> - make clean toolchain
> - find output/target | sort > /tmp/out-before
> - apply patch
> - make clean toolchain
> - find output/target | sort > /tmp/out-after
> - diff -u /tmp/out-before /tmp/out-after
> 
> The only changes should be some libraries moving from lib to usr/lib or vice
> versa. Notable examples being libstdc++ and libatomic.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  package/glibc/glibc.mk                             |  2 +-
>  toolchain/helpers.mk                               | 57 ++--------------------
>  toolchain/toolchain-external/toolchain-external.mk | 39 ++++-----------
>  3 files changed, 15 insertions(+), 83 deletions(-)

I've made a few changes:

    [Thomas:
     - use -L instead of -follow in the find invocation, as suggested by
       Arnout.
     - move the BR2_STATIC_LIBS condition as a make condition rather than
       a shell condition, as suggested by Arnout.]

And applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
