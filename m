From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 14 Jul 2016 16:08:02 -0500
Subject: [Buildroot] [PATCH] ntp: Adding support for SHM clocks
Message-ID: <1468530482-58311-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: ynadupur <yugendra.sai.babu.nadupuru@rockwellcollins.com>

Description:

    In order for gpsd to work with the new version of ntpd, an enable option
    must be added to the configure step of ntp that allows for support of
    SHM Clocks to be attached through shared memory.

Signed-off-by:[YUGENDRA SAI BABU NADUPURU]<yugendra.sai.babu.nadupuru@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/ntp/Config.in | 6 ++++++
 package/ntp/ntp.mk    | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/ntp/Config.in b/package/ntp/Config.in
index 1763225..ad5914e 100644
--- a/package/ntp/Config.in
+++ b/package/ntp/Config.in
@@ -42,6 +42,12 @@ config BR2_PACKAGE_NTP_NTPD_ATOM_PPS
 	help
 	  Compile ntpd with the ability to use an ATOM PPS source.
 
+config BR2_PACKAGE_NTP_NTP_SHM_CLK
+	bool "SHM clock support"
+	help
+	 Compile ntp with support for a SHM clock attached through shared
+	 memory.
+
 config BR2_PACKAGE_NTP_NTPDATE
 	bool "ntpdate"
 	help
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 8d3a6f3..8481bc8 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -42,6 +42,12 @@ else
 NTP_CONF_OPTS += --disable-ATOM
 endif
 
+ifeq ($(BR2_PACKAGE_NTP_NTP_SHM_CLK),y)
+	NTP_CONF_OPTS += --enable-SHM
+else
+	NTP_CONF_OPTS += --disable-SHM
+endif
+
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTP_KEYGEN) += util/ntp-keygen
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTP_WAIT) += scripts/ntp-wait/ntp-wait
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPDATE) += ntpdate/ntpdate
-- 
1.9.1
