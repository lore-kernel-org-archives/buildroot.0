From: Marc Egli <marc.egli@hsr.ch>
Date: Thu, 3 Dec 2009 15:46:44 +0100
Subject: [Buildroot] [PATCH] Adding openbox to buildroot
In-Reply-To: <1CB99035-2FC1-42B4-B73D-02CAF7A55020@hsr.ch>
References: <867286CD-192F-48CE-8C3A-00D988A93C6B@hsr.ch>
	<4d28d4b50912020911h52ef1e70j88e8c5b592fc66f@mail.gmail.com>
	<1CB99035-2FC1-42B4-B73D-02CAF7A55020@hsr.ch>
Message-ID: <E4FA5C22-0830-422A-85D1-EBE98B463FA9@hsr.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

i have finished my changes to the openbox package. it also add's libxcursor and startupnotification to the dependencies if they are in the br config

diff --git a/package/Config.in b/package/Config.in
index c5a2365..d2028cf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -348,6 +348,7 @@ comment "X Window managers"
 source "package/matchbox/Config.in"
 source "package/metacity/Config.in"
 source "package/blackbox/Config.in"
+source "package/openbox/Config.in"
 
 comment "X applications"
 source "package/alsamixergui/Config.in"
diff --git a/package/openbox/Config.in b/package/openbox/Config.in
new file mode 100644
index 0000000..53167e6
--- /dev/null
+++ b/package/openbox/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_OPENBOX
+       bool "openbox windowmanager"
+       select BR2_PACKAGE_PANGO
+       select BR2_PACKAGE_LIBGLIB2
+       select BR2_PACKAGE_LIBXML2
+       depends on BR2_PACKAGE_XORG7
+       help
+               http://icculus.org/openbox/index.php/Main_Page lightwight windowmanager
+
diff --git a/package/openbox/openbox.mk b/package/openbox/openbox.mk
new file mode 100644
index 0000000..9305a41
--- /dev/null
+++ b/package/openbox/openbox.mk
@@ -0,0 +1,24 @@
+#############################################################
+#
+# openbox
+#
+#############################################################
+
+OPENBOX_VERSION = 3.4.7.2
+OPENBOX_SOURCE = openbox-$(OPENBOX_VERSION).tar.gz
+OPENBOX_SITE = http://icculus.org/openbox/releases
+OPENBOX_DEPENDENCIES = libglib2 pango libxml2 xserver_xorg-server
+#OPENBOX_LIBTOOL_PATCH=NO
+OPENBOX_INSTALL_STAGING=YES
+OPENBOX_INSTALL_TARGET=YES
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
+        OPENBOX_DEPENDENCIES += libxcursor
+endif
+ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
+        OPENBOX_DEPENDENCIES += startup-notification
+endif
+
+
+$(eval $(call AUTOTARGETS,package,openbox))
+

Am 02.12.2009 um 19:20 schrieb Marc Egli:

> good question
> these are the Dependencies written on the openbox homepage:
> 	? C compiler (such as GCC)
> 	? Libc library and headers (development package)
> 	? Xlib library and headers (development package)
> 	? Glib-2 library and headers (development package)
> 	? LibXML-2 library and headers (development package)
> 	? Pango library and headers (development package)
> 	? Startup-notification library and headers (development package) - optional but recommended
> 	? XCursor library and headers (development package) - optional but recommended
> 	? Pkg-config
> i think c compiler libc and pkg config are always here if you build buildroot.
> so i need the name of xlib i have to put into OPENBOX_DEPENDENCIES,
> i'll also add those 2 optional dependencies with an if to add it if they are present.
> i hope to get back with a better version soon, and any hint's are welcome
> Am 02.12.2009 um 18:11 schrieb Lionel Landwerlin:
> 
>> On Wed, Dec 2, 2009 at 6:02 PM, Marc Egli <marc.egli@hsr.ch> wrote:
>>> --- /dev/null
>>> +++ b/package/openbox/openbox.mk
>>> @@ -0,0 +1,16 @@
>>> +#############################################################
>>> +#
>>> +# openbox
>>> +#
>>> +#############################################################
>>> +
>>> +OPENBOX_VERSION = 3.4.7.2
>>> +OPENBOX_SOURCE = openbox-$(OPENBOX_VERSION).tar.gz
>>> +OPENBOX_SITE = http://icculus.org/openbox/releases
>>> +OPENBOX_DEPENDENCIES = libglib2 pango libxml2
>> 
>> No x11 dependencies ?
>> 
>>> +#OPENBOX_LIBTOOL_PATCH=NO
>>> +OPENBOX_INSTALL_STAGING=YES
>>> +OPENBOX_INSTALL_TARGET=YES
>>> +
>>> +$(eval $(call AUTOTARGETS,package,openbox))
>>> +
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091203/d5d7377c/attachment.htm>
