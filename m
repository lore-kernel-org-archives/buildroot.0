From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Apr 2021 23:28:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/libglib2: fix dbus system
 socket location
In-Reply-To: <20210415144226.2354048-1-jpcartal@free.fr>
References: <20210415144226.2354048-1-jpcartal@free.fr>
Message-ID: <20210419232810.4ceef826@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jean-Pierre,

+Norbert in Cc, since he changed the DBus socket location in commit
6b9a75a5bd1b1a559b7352003588d1461de8c4d1.

On Thu, 15 Apr 2021 16:42:26 +0200
Jean-pierre Cartal <jpcartal@free.fr> wrote:

> Fix dbus system socket location moved from
> /var/run/dbus/system_bus_socket to /run/dbus/system_bus_socket
> 
> Signed-off-by: Jean-pierre Cartal <jpcartal@free.fr>
> ---
>  package/libglib2/0005-dbus-system-socket-path.patch | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 package/libglib2/0005-dbus-system-socket-path.patch
> 
> diff --git a/package/libglib2/0005-dbus-system-socket-path.patch b/package/libglib2/0005-dbus-system-socket-path.patch
> new file mode 100644
> index 0000000000..bb2ec33dc6
> --- /dev/null
> +++ b/package/libglib2/0005-dbus-system-socket-path.patch
> @@ -0,0 +1,11 @@
> +diff -Naur libglib2-2.66.8.orig/gio/gdbusaddress.c libglib2-2.66.8/gio/gdbusaddress.c
> +--- libglib2-2.66.8.orig/gio/gdbusaddress.c     2021-03-18 14:47:48.256693000 +0100
> ++++ libglib2-2.66.8/gio/gdbusaddress.c  2021-04-15 16:14:28.519296584 +0200
> +@@ -1331,7 +1331,7 @@
> +
> +       if (ret == NULL)
> +         {
> +-          ret = g_strdup ("unix:path=/var/run/dbus/system_bus_socket");
> ++          ret = g_strdup ("unix:path=/run/dbus/system_bus_socket");
> +         }
> +       break;

On the form, all patches in Buildroot need to have a proper commit
description and Signed-off-by line.

But on the actual content, I am wondering if this is the right
direction to take. Do we want to keep this non-upstreamable patch
around forever ?

According to commit 6b9a75a5bd1b1a559b7352003588d1461de8c4d1, /var/run
is supposed to be a symlink to /run, so your patch should be a no-op.
Both our systemd and sysv skeletons ensure this symlink exist.

Could you provide more details about the issue ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
