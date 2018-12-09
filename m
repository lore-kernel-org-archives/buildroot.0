From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 16:57:08 +0100
Subject: [Buildroot] [PATCH] pkgconf: bump to 1.5.3, change upstream
In-Reply-To: <20180908200507.23939-1-thomas.petazzoni@bootlin.com>
References: <20180908200507.23939-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181209165708.7f0475ad@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  8 Sep 2018 22:05:07 +0200, Thomas Petazzoni wrote:
> The pkgconf project now has a website at pkgconf.org, and hosts its
> tarballs at https://distfiles.dereferenced.org/pkgconf/, so this
> commit updates the upstream location, and uses the xz-compressed
> tarball as well.
> 
> pkgconf is bumped to 1.5.3. What prompted this update is the fact that
> GStreamer uses the --define-prefix option when calling pkg-config, and
> this option didn't exist in pkgconf 0.9.2.
> 
> The patch 0001-Fix-all-variables-sysroot-prefix-problem.patch is
> dropped, because pkgconf now behaves properly, by prefixing all paths
> with the sysroot. This has been verified by testing libdir and
> includedir in zlib.pc, and adding some dummy pkgdatadir, mapdir and
> sdkdir variables:
> 
> $ cat staging/usr/lib/pkgconfig/zlib.pc
> prefix=/usr
> exec_prefix=${prefix}
> libdir=${exec_prefix}/lib
> sharedlibdir=${libdir}
> includedir=${prefix}/include
> pkgdatadir=${prefix}/pouet
> mapdir=${prefix}/this/is/map/dir
> sdkdir=${prefix}/this/is/sdk/dir
> [...]
> 
> $ ./host/bin/pkg-config --variable=libdir zlib
> ./host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib
> $ ./host/bin/pkg-config --variable=includedir zlib
> ./host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include
> $ ./host/bin/pkg-config --variable=mapdir zlib
> ./host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/this/is/map/dir
> $ ./host/bin/pkg-config --variable=sdkdir zlib
> ./host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/this/is/sdk/dir
> $ ./host/bin/pkg-config --variable=pkgdatadir zlib
> ./host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/pouet
> 
> So, the 0001-Fix-all-variables-sysroot-prefix-problem patch is no
> longer necessary.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Of course, updating pkgconf has the potential of breaking lots of
> things, that's why I would suggest to update early in the development
> cycle, to leave us enough time to resolve issues.
> ---
>  ...-Fix-all-variables-sysroot-prefix-problem.patch | 64 ----------------------
>  package/pkgconf/Config.in                          |  2 +-
>  package/pkgconf/pkgconf.hash                       |  2 +-
>  package/pkgconf/pkgconf.mk                         |  6 +-
>  4 files changed, 5 insertions(+), 69 deletions(-)
>  delete mode 100644 package/pkgconf/0001-Fix-all-variables-sysroot-prefix-problem.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
