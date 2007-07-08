From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sun, 8 Jul 2007 13:55:19 +0200
Subject: [Buildroot] busybox package configuration
In-Reply-To: <0707081257070.8395@somehost>
References: <0707081257070.8395@somehost>
Message-ID: <20070708115519.GG4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 08, 2007 at 01:14:51PM +0200, Cristian Ionescu-Idbohrn wrote:
>I mended the Config.in file:
>
>Index: Config.in
>===================================================================
>--- Config.in	(revision 19026)
>+++ Config.in	(working copy)
>@@ -100,6 +100,7 @@
> 	default "package/busybox/busybox-1.5.0.config" if BR2_BUSYBOX_VERSION_1_5_0
> 	default "package/busybox/busybox-1.5.0.config" if BR2_BUSYBOX_VERSION_1_5_1
> 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_6_0
>+	default "package/busybox/busybox-1.6.1.config" if BR2_BUSYBOX_VERSION_1_6_1
> 	help
> 	  Some people may wish to use their own modified BusyBox configuration
> 	  file, and will specify their config file location with this option.
>
>created a busybox-1.6.1.config file in package/busybox, did a 'make
>menuconfig' in topdir and expected to see the
>package/busybox/busybox-1.6.1.config preselected.  But no joy :(  I still
>needed to manually enter the config file path into the field.
>
>I can also see that the BR2_PACKAGE_BUSYBOX_CONFIG variable in busybox.mk
>is empty when making a busybox-<something> target.  There's some make
>magic I do not possess :(  Any ideas?

No magic involved. Consider the sequence you were doing:
1) make conf
1a) you select 1.6.1, i forgot to add a default for this version ->
    empty BR2_PACKAGE_BUSYBOX_CONFIG
1b) you add the line above.
1c) re-conf. A default (empty string) is present, so no default is set

I suggest you
svn up
sed -i -e "/BR2_PACKAGE_BUSYBOX_CONFIG/d"
make oldconfig

HTH,
