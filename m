From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Mon, 11 May 2009 20:30:24 +0200
Subject: [Buildroot] [PATCH] qtopia4: Add kconfig option to
	build	linuxis mouse driver
In-Reply-To: <20090511182221.GQ7314@mx.loc>
References: <1242065043-1191-1-git-send-email-mroth@nessie.de>
	<20090511182221.GQ7314@mx.loc>
Message-ID: <20090511183024.GR7314@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 11, 2009 at 08:22:21PM +0200, Bernhard Reutner-Fischer wrote:
>On Mon, May 11, 2009 at 08:04:03PM +0200, Michael Roth wrote:
>>'linuxis' is a mouse driver for the Linux event interface
>>(/dev/input/eventX).
>>
>>This driver can be built only as a plugin.
>>
>>Signed-off-by: Michael Roth <mroth@nessie.de>
>>---
>> package/qtopia4/Config.mouse.in |    3 +++
>> package/qtopia4/qtopia4.mk      |    6 +++++-
>> 2 files changed, 8 insertions(+), 1 deletions(-)
>>
>>diff --git a/package/qtopia4/Config.mouse.in b/package/qtopia4/Config.mouse.in
>>index 7b39460..9788b10 100644
>>--- a/package/qtopia4/Config.mouse.in
>>+++ b/package/qtopia4/Config.mouse.in
>>@@ -9,6 +9,9 @@ config BR2_PACKAGE_QTOPIA4_MOUSE_BUS
>> config BR2_PACKAGE_QTOPIA4_MOUSE_LINUXTP
>> 	bool "linuxtp"
>> 
>>+config BR2_PACKAGE_QTOPIA4_MOUSE_LINUXIS
>>+	bool "linuxis (plugin)"
>	default n
>	# which is, IIRC the default anyway. If yes, this comment and the
>	# default is moot, of course
>	help
>	  Describe what that thing does
>
>>+
>> config BR2_PACKAGE_QTOPIA4_MOUSE_YOPY
>> 	bool "yopy"
>> 
>>diff --git a/package/qtopia4/qtopia4.mk b/package/qtopia4/qtopia4.mk
>>index a198a41..eb28ff0 100644
>>--- a/package/qtopia4/qtopia4.mk
>>+++ b/package/qtopia4/qtopia4.mk
>>@@ -151,6 +151,9 @@ QTOPIA4_CONFIGURE += -qt-mouse-linuxtp
>> else
>> QTOPIA4_CONFIGURE += -no-mouse-linuxtp
>> endif
>>+ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_LINUXIS),y)
>>+QTOPIA4_CONFIGURE += -plugin-mouse-linuxis

QTOPIA4_PLUGINS_INSTALL += mousedrivers

and tweak \"imageformats\" while at it, then..
>>+endif
>> ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_YOPY),y)
>> QTOPIA4_CONFIGURE += -qt-mouse-yopy
>> else
>>@@ -485,8 +488,9 @@ qtopia4-gui: $(STAGING_DIR)/usr/lib/libQtCore.la
>> 	cp -dpf $(STAGING_DIR)/usr/lib/fonts/helvetica*.qpf $(TARGET_DIR)/usr/lib/fonts
>> 	cp -dpf $(STAGING_DIR)/usr/lib/fonts/fixed*.qpf $(TARGET_DIR)/usr/lib/fonts
>> 	cp -dpf $(STAGING_DIR)/usr/lib/fonts/micro*.qpf $(TARGET_DIR)/usr/lib/fonts
>>-	# Install image plugins if they are built
>->+	# Install image and/or mousedriver plugins if they are built
>+	# Install plugins if they are built
>
>Avoids unwarranted comment jitter.
>
	for plug_install in $(QTOPIA4_PLUGINS_INSTALL);do \
		$(call QTOPIA4_INSTALL_PLUGINS,$$plug_install); \
	done
->> 	$(call QTOPIA4_INSTALL_PLUGINS,imageformats)
->>+	$(call QTOPIA4_INSTALL_PLUGINS,mousedrivers)

for additional bonus and cleanup-points ;)

You could even do somthing like my tree WRT GCC_COMMON_PREREQ
to automatically rebuild and re-install that package in case the
user changed one of these knobs, fwiw. Talks to Jacmet to pickup that
additional dependency cleanup- or tweak.
Cheers,

>> ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
>> 	cp -dpf $(STAGING_DIR)/usr/lib/libQtGui.so.* $(TARGET_DIR)/usr/lib/
>> endif
>
>Care to resend?
>TIA,
