From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Mar 2013 19:25:36 +0100
Subject: [Buildroot] [PATCH] ussp-push: new package
In-Reply-To: <1355094387-22886-3-git-send-email-s.martin49@gmail.com>
References: <1355094387-22886-1-git-send-email-s.martin49@gmail.com>
 <1355094387-22886-3-git-send-email-s.martin49@gmail.com>
Message-ID: <20130309192536.23eabcab@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Mon, 10 Dec 2012 00:06:23 +0100, Samuel Martin wrote:

> +	select BR2_PACKAGE_OPENOBEX
> +	select BR2_PACKAGE_BLUEZ_UTILS

bluez utils depends on mmu, wchar, threads and isn't available on
avr32. You should carry those dependencies as well.

> +	help
> +	  ussp-push is an OBEX object pusher for Linux, using the BlueZ
> +	  BlueTooth stack.
> +
> +	  http://www.xmailserver.org/ussp-push.html
> diff --git a/package/ussp-push/ussp-push-fix-build-against-bluez-4.patch b/package/ussp-push/ussp-push-fix-build-against-bluez-4.patch
> new file mode 100644
> index 0000000..0694bfb
> --- /dev/null
> +++ b/package/ussp-push/ussp-push-fix-build-against-bluez-4.patch
> @@ -0,0 +1,15 @@
> +Fix build against bluez4.
> +
> +Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> +
> +--- ussp-push-0.11.orig/src/obex_socket.c	2012-11-01 09:58:51.049538708 +0100
> ++++ ussp-push-0.11/src/obex_socket.c	2012-11-01 12:10:10.719506951 +0100
> +@@ -197,7 +197,7 @@ static int bt_sock_name2bth(int devid, c
> + 	for (i = 0; i < niinf; i++) {
> + 		char devname[128];
> + 
> +-		if (hci_remote_name(dd, &piinf[i].bdaddr, sizeof(devname) - 1,
> ++		if (hci_read_remote_name(dd, &piinf[i].bdaddr, sizeof(devname) - 1,
> + 				    devname, 100000) >= 0) {
> + 			if (strcasecmp(devname, btname) == 0) {
> + 				*btaddr = piinf[i].bdaddr;
> diff --git a/package/ussp-push/ussp-push.mk b/package/ussp-push/ussp-push.mk
> new file mode 100644
> index 0000000..6f322ab
> --- /dev/null
> +++ b/package/ussp-push/ussp-push.mk
> @@ -0,0 +1,13 @@
> +#############################################################
> +#
> +# ussp-push
> +#
> +#############################################################
> +USSP_PUSH_VERSION = 0.11
> +USSP_PUSH_SITE = http://www.xmailserver.org
> +USSP_PUSH_LICENSE = GPLv2

License is apparently GPLv2+.

> +USSP_PUSH_LICENSE_FILES = COPYING
> +
> +USSP_PUSH_DEPENDENCIES = bluez_utils openobex
> +
> +$(eval $(autotools-package))

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
