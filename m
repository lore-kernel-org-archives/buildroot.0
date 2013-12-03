From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Dec 2013 09:47:01 +0100
Subject: [Buildroot] [PATCH] smbnetfs: new package 0.5.3a
In-Reply-To: <20131202230903.GA3906@gmail.com>
References: <20131202230903.GA3906@gmail.com>
Message-ID: <20131203094701.08480f23@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andrew Ruder,

Thanks for this contribution as well!

On Mon, 2 Dec 2013 17:09:03 -0600, Andrew Ruder wrote:
> Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
> ---
>  package/Config.in                                   |  1 +
>  package/smbnetfs/Config.in                          | 16 ++++++++++++++++
>  package/smbnetfs/smbnetfs-compile-with-uclibc.patch | 14 ++++++++++++++

We now normally wants patches to carry a sequence number, even if there
is only one patch. So something like:

	smbnetfs-01-compile-with-uclibc.patch

for example. See
http://buildroot.org/downloads/manual/manual.html#patch-policy for
details.

>  package/smbnetfs/smbnetfs.mk                        | 11 +++++++++++
>  4 files changed, 42 insertions(+)
>  create mode 100644 package/smbnetfs/Config.in
>  create mode 100644 package/smbnetfs/smbnetfs-compile-with-uclibc.patch
>  create mode 100644 package/smbnetfs/smbnetfs.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 6fb063d..4854383 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -148,6 +148,7 @@ source "package/makedevs/Config.in"
>  source "package/mtd/Config.in"
>  source "package/nfs-utils/Config.in"
>  source "package/ntfs-3g/Config.in"
> +source "package/smbnetfs/Config.in"
>  source "package/squashfs/Config.in"
>  source "package/squashfs3/Config.in"
>  source "package/sshfs/Config.in"
> diff --git a/package/smbnetfs/Config.in b/package/smbnetfs/Config.in
> new file mode 100644
> index 0000000..fdc8167
> --- /dev/null
> +++ b/package/smbnetfs/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_SMBNETFS
> +	bool "smbnetfs"
> +	depends on BR2_PACKAGE_SAMBA
> +	select BR2_PACKAGE_SAMBA_LIBSMBCLIENT
> +	select BR2_PACKAGE_LIBFUSE
> +	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
> +	help
> +        A user-space filesystem that contains an entire
> +        SMB/NMB network under a single mount point.
> +        Workgroups, servers, and shares can be browsed much
> +        like the Network Neighborhood in Microsoft Window.
> +
> +        http://smbnetfs.sourceforge.net/

Indentation of the help text is wrong. It should be one tab + two
spaces.

> +comment "smbnetfs needs samba"
> +	depends on !BR2_PACKAGE_SAMBA

I'm not sure here if we want to depend on Samba, or select Samba.
Usually, we prefer "select" so that things are transparent for the
user. However, when the thing being selected is "big", and fairly
obvious for the user (like the Python interpreter being needed to build
a Python module), we use depends on. I'm not sure which choice to make
here.

However, what is sure is that you forgot to inherit the toolchain
dependencies of libfuse: they should be added.

> diff --git a/package/smbnetfs/smbnetfs-compile-with-uclibc.patch b/package/smbnetfs/smbnetfs-compile-with-uclibc.patch
> new file mode 100644
> index 0000000..e5e9065
> --- /dev/null
> +++ b/package/smbnetfs/smbnetfs-compile-with-uclibc.patch
> @@ -0,0 +1,14 @@

All patches should have a description + Signed-off-by. Also, it would
be good if you could submit that patch upstream, so that it gets
integrated in a future release.

> +Index: smbnetfs-0.5.3a/src/common.c
> +===================================================================
> +--- smbnetfs-0.5.3a.orig/src/common.c	2013-11-15 11:22:27.520088835 -0600
> ++++ smbnetfs-0.5.3a/src/common.c	2013-11-15 11:22:37.384088834 -0600
> +@@ -4,7 +4,9 @@
> + #include <stdarg.h>
> + #include <string.h>
> + #include <pthread.h>
> ++#ifdef HAVE_BACKTRACE
> + #include <execinfo.h>
> ++#endif
> + 
> + #include "common.h"
> + 
> diff --git a/package/smbnetfs/smbnetfs.mk b/package/smbnetfs/smbnetfs.mk
> new file mode 100644
> index 0000000..1e01bd8
> --- /dev/null
> +++ b/package/smbnetfs/smbnetfs.mk
> @@ -0,0 +1,11 @@
> +################################################################################
> +#
> +# smbnetfs
> +#
> +################################################################################
> +
> +SMBNETFS_VERSION = 0.5.3a
> +SMBNETFS_SOURCE = smbnetfs-$(SMBNETFS_VERSION).tar.bz2
> +SMBNETFS_SITE = http://downloads.sourceforge.net/smbnetfs
> +
> +$(eval $(autotools-package))

No SMBNETFS_DEPENDENCIES to ensure libfuse, libiconv and samba are
built before smbnetfs?

Also, we now request all new packages to have SMBNETFS_LICENSE and
SMBNETFS_LICENSE_FILES.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
