From: Patrick <kpa_info@yahoo.fr>
Date: Thu, 10 Jan 2013 11:21:25 +0100
Subject: [Buildroot] [PATCH 1/2] Adding yavta (Yet Another V4L2 Test
 Application) as a package
In-Reply-To: <20130109165905.1fccde74@skate>
References: <1357734594-8211-1-git-send-email-kpa_info@yahoo.fr>
 <20130109165905.1fccde74@skate>
Message-ID: <50EE9625.1080603@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/09/2013 04:59 PM, Thomas Petazzoni wrote:
> Dear kpa_info at yahoo.fr,
>
> It looks pretty good! I have a few comments below.
>
> On Wed,  9 Jan 2013 13:29:53 +0100, kpa_info at yahoo.fr wrote:
>> From: Patrick Gerber <kpa_info@yahoo.fr>
>>
>>
>> Signed-off-by: Patrick Gerber <kpa_info@yahoo.fr>
>> ---
>>   package/multimedia/Config.in       |    1 +
>>   package/multimedia/yavta/Config.in |    4 ++++
>>   package/multimedia/yavta/yavta.mk  |   21 +++++++++++++++++++++
>>   3 files changed, 26 insertions(+)
>>   create mode 100644 package/multimedia/yavta/Config.in
>>   create mode 100644 package/multimedia/yavta/yavta.mk
>>
>> diff --git a/package/multimedia/Config.in
>> b/package/multimedia/Config.in index 273d9bc..da558ca 100644
>> --- a/package/multimedia/Config.in
>> +++ b/package/multimedia/Config.in
>> @@ -24,4 +24,5 @@ source "package/multimedia/pulseaudio/Config.in"
>>   source "package/multimedia/tidsp-binaries/Config.in"
>>   source "package/multimedia/vorbis-tools/Config.in"
>>   source "package/multimedia/wavpack/Config.in"
>> +source "package/multimedia/yavta/Config.in"
>>   endmenu
>> diff --git a/package/multimedia/yavta/Config.in
>> b/package/multimedia/yavta/Config.in new file mode 100644
>> index 0000000..3cca5c1
>> --- /dev/null
>> +++ b/package/multimedia/yavta/Config.in
>> @@ -0,0 +1,4 @@
>> +config BR2_PACKAGE_YAVTA
>> +	bool "yavta"
>> +	help
>> +	  Yet Another V4L2 Test Application
>
> Here, we want a empty line, and then the upstream URL of the
> corresponding project.
>
> See
> http://buildroot.org/downloads/manual/manual.html#_literal_config_in_literal_file.
>
>
>> +YAVTA_VERSION = 82ff2efdb9787737b9f21b6f4759f077c827b238
>> +YAVTA_SITE = git://git.ideasonboard.org/yavta.git
>> +YAVTA_LICENSE = GPLv2
>> +YAVTA_LICENSE_FILES = COPYING.GPL
>> +
>> +define YAVTA_BUILD_CMDS
>> +$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)"
>
> This line could be intended with one tab, and could be written as
> follows:
>
> 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
>
> TARGET_CONFIGURE_OPTS contains the proper CC and CFLAGS definitions.
>
>> +endef
>> +
>> +define YAVTA_INSTALL_TARGET_CMDS
>> +install -m 0755 -D $(@D)/yavta $(TARGET_DIR)/usr/bin/yavta
>
> Indentation, and install -> $(INSTALL)
>
> 	$(INSTALL) -m 0755 -D $(@D)/yavta $(TARGET_DIR)/usr/bin/yavta
>
>> +endef
>> +
>> +$(eval $(generic-package))
>
> Otherwise, looks good!
>
> Thomas
>

Dear Thomas,

Please find below the new version of the patch according to your comments.

Patrick


From: Patrick Gerber <kpa_info@yahoo.fr>


Signed-off-by: Patrick Gerber <kpa_info@yahoo.fr>
---
  package/multimedia/Config.in       |    1 +
  package/multimedia/yavta/Config.in |    4 ++++
  package/multimedia/yavta/yavta.mk  |   21 +++++++++++++++++++++
  3 files changed, 26 insertions(+)
  create mode 100644 package/multimedia/yavta/Config.in
  create mode 100644 package/multimedia/yavta/yavta.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 273d9bc..da558ca 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -24,4 +24,5 @@ source "package/multimedia/pulseaudio/Config.in"
  source "package/multimedia/tidsp-binaries/Config.in"
  source "package/multimedia/vorbis-tools/Config.in"
  source "package/multimedia/wavpack/Config.in"
+source "package/multimedia/yavta/Config.in"
  endmenu
diff --git a/package/multimedia/yavta/Config.in 
b/package/multimedia/yavta/Config.in
new file mode 100644
index 0000000..3cca5c1
--- /dev/null
+++ b/package/multimedia/yavta/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_YAVTA
+	bool "yavta"
+	help
+	  Yet Another V4L2 Test Application
+
+	  http://git.ideasonboard.org/yavta.git		
diff --git a/package/multimedia/yavta/yavta.mk 
b/package/multimedia/yavta/yavta.mk
new file mode 100644
index 0000000..1aa5574
--- /dev/null
+++ b/package/multimedia/yavta/yavta.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# yavta
+#
+#############################################################
+
+YAVTA_VERSION = 82ff2efdb9787737b9f21b6f4759f077c827b238
+YAVTA_SITE = git://git.ideasonboard.org/yavta.git
+YAVTA_LICENSE = GPLv2
+YAVTA_LICENSE_FILES = COPYING.GPL
+
+define YAVTA_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define YAVTA_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/yavta $(TARGET_DIR)/usr/bin/yavta
+endef
+
+$(eval $(generic-package))
-- 1.7.9.5
