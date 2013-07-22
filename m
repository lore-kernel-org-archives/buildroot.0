From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 22 Jul 2013 08:55:51 +0200
Subject: [Buildroot] [PATCH v3 1/1] dropwatch: new package
In-Reply-To: <1374451763-17956-1-git-send-email-tjlee@ambarella.com> (Tzu-Jung
 Lee's message of "Mon, 22 Jul 2013 08:09:23 +0800")
References: <CAEvN+1jnT+8CXC+gtHO-Pu1zPz9K181f6D6TsZ01CErbiuC6jw@mail.gmail.com>
 <1374451763-17956-1-git-send-email-tjlee@ambarella.com>
Message-ID: <87ob9vozgo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "T" == Tzu-Jung Lee <roylee17@gmail.com> writes:

 T> Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
 T> ---

 T> v3 adopts all the review comments against v2 from Peter.

 T>  package/Config.in                           |  1 +
 T>  package/dropwatch/Config.in                 | 10 ++++++++++
 T>  package/dropwatch/dropwatch-1.4-build.patch | 27 ++++++++++++++++++++++++++
 T>  package/dropwatch/dropwatch.mk              | 30 +++++++++++++++++++++++++++++
 T>  4 files changed, 68 insertions(+)
 T>  create mode 100644 package/dropwatch/Config.in
 T>  create mode 100644 package/dropwatch/dropwatch-1.4-build.patch
 T>  create mode 100644 package/dropwatch/dropwatch.mk

 T> diff --git a/package/Config.in b/package/Config.in
 T> index b8011c7..1216450 100644
 T> --- a/package/Config.in
 T> +++ b/package/Config.in
 T> @@ -22,6 +22,7 @@ source "package/cache-calibrator/Config.in"
 T>  source "package/dhrystone/Config.in"
 T>  source "package/dstat/Config.in"
 T>  source "package/dmalloc/Config.in"
 T> +source "package/dropwatch/Config.in"
 T>  source "package/gdb/Config.in"
 T>  source "package/iozone/Config.in"
 T>  source "package/kexec/Config.in"
 T> diff --git a/package/dropwatch/Config.in b/package/dropwatch/Config.in
 T> new file mode 100644
 T> index 0000000..c7fc933
 T> --- /dev/null
 T> +++ b/package/dropwatch/Config.in
 T> @@ -0,0 +1,10 @@
 T> +config BR2_PACKAGE_DROPWATCH
 T> +	bool "dropwatch"
 T> +	select BR2_PACKAGE_BINUTILS
 T> +	select BR2_PACKAGE_READLINE
 T> +	select BR2_PACKAGE_LIBNL
 T> +	help
 T> +	  Dropwatch is an interactive utility for monitoring and recording packets
 T> +	  that are dropped by the kernel

Line too long. It should be wrapped around column 70 to fit menuconfig
in a normal 80x24 terminal.

 T> +++ b/package/dropwatch/dropwatch.mk
 T> @@ -0,0 +1,30 @@
 T> +################################################################################
 T> +#
 T> +# dropwatch
 T> +#
 T> +################################################################################
 T> +
 T> +DROPWATCH_VERSION = 1.4
 T> +DROPWATCH_SOURCE = dropwatch-$(DROPWATCH_VERSION).tar.bz2
 T> +DROPWATCH_SITE = https://git.fedorahosted.org/cgit/dropwatch.git/snapshot/
 T> +DROPWATCH_DEPENDENCIES = binutils libnl readline

It uses pkg-config to find the libnl headers, so you also need
host-pkgconf.

 T> +DROPWATCH_LICENSE = GPLv2+

main.c explicitly says GPLv2, and the only reference to the typical 'any
later version' is in COPYING, so it should be GPLv2

 T> +DROPWATCH_LICENSE_FILE = COPYING

The variable is called ..FILES (S at the end).

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
