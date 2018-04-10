From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Tue, 10 Apr 2018 10:15:29 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-04-09
In-Reply-To: <20180410060022.4CF112071F@mail.bootlin.com>
References: <20180410060022.4CF112071F@mail.bootlin.com>
Message-ID: <c4f7202a-5609-9c3d-81b8-9209fe7497e4@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On 10/04/2018 08:00, Thomas Petazzoni wrote:
> Hello,
>
> Build statistics for 2018-04-09
> ===============================
>
> Results for branch 'master'
> ===========================
>
> Classification of failures by reason
> ------------------------------------
>
>                   mesa3d-18.0.0 | 1
>
> Detail of failures
> ------------------
>      
>        x86_64 |                  mesa3d-18.0.0 | NOK | http://autobuild.buildroot.net/results/b81c12d529c66a028e2297ea5ce1d6930324fa69 |
>
We have the following problem: llvm-config (host version installed in STAGING_DIR)
is not being able to link correctly with the libc of the host system. This happens
in the following scenario: target architecture = x86_64 and target libc != glibc
(assuming host system has glibc).

As the RPATH specifies $ORIGIN/../lib and the binary is located in STAGING_DIR/usr/bin,
it tries to link with the libc of the target, resulting in:

./llvm-config: error while loading shared libraries: libc.so.0: cannot open shared object file:
	No such file or directory.

It is important that llvm-config is located in STAGING, as it returns linker flags and
include directories relative to its location:

For example, when installed in STAGING_DIR/usr/bin:

./llvm-config --ldflags
-L/home/vakor/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib

But when installed in HOST_DIR/bin

./llvm-config --ldflags
-L/home/vakor/buildroot/output/host/lib

The quick solution would be to change the RPATH to HOST_DIR/lib after copying it to STAGING,
so we'll also need either chrpath or patchelf. Otherwise, we can do a wrapper script in
STAGING that calls llvm-config from host, but this will have some outputs that are hardcoded
and will be more difficult to maintain in case llvm-config is modified in future versions.

I would like to know which would be an appropriate solution for this, any suggestions are
welcome.

Thanks in advance,

Valentin
