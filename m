From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 16 Oct 2014 12:30:54 -0500
Subject: [Buildroot] [PATCH v3 2/2] ntp: Adding pps support to ntpd
In-Reply-To: <1413480654-59217-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1413480654-59217-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1413480654-59217-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bryan Brinsko <bryan.brinsko@rockwellcollins.com>

Added an option for the ntpd application to support pps inputs.

Signed-off-by: Bryan Brinsko <bryan.brinsko@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes v1 -> v2
 - Updated Config.in option description (Suggested Thomas P)
 - Added conf opts to disable PPS when not selected (Suggested Thomas P)

 package/ntp/Config.in | 7 +++++++
 package/ntp/ntp.mk    | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/package/ntp/Config.in b/package/ntp/Config.in
index 858a9ad..c92ae93 100644
--- a/package/ntp/Config.in
+++ b/package/ntp/Config.in
@@ -34,6 +34,13 @@ config BR2_PACKAGE_NTP_NTPD
 	  system date and time in sync and optionally serving time and date
 	  information on the network via the NTP protocol.
 
+config BR2_PACKAGE_NTP_NTPD_ATOM_PPS
+	bool "PPS support"
+	depends on BR2_PACKAGE_NTP_NTPD
+	select BR2_PACKAGE_PPS_TOOLS
+	help
+	  Compile ntpd with the ability to use an ATOM PPS source.
+
 config BR2_PACKAGE_NTP_NTPDATE
 	bool "ntpdate"
 	help
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 7c2cb8e..bb950a1 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -34,6 +34,13 @@ else
 	NTP_CONF_OPTS += --without-ntpsnmpd
 endif
 
+ifeq ($(BR2_PACKAGE_NTP_NTPD_ATOM_PPS),y)
+	NTP_CONF_OPTS += --enable-ATOM
+	NTP_DEPENDENCIES += pps-tools
+else
+	NTP_CONF_OPTS += --disable-ATOM
+endif
+
 define NTP_PATCH_FIXUPS
 	$(SED) "s,^#if.*__GLIBC__.*_BSD_SOURCE.*$$,#if 0," $(@D)/ntpd/refclock_pcf.c
 	$(SED) '/[[:space:](]rindex[[:space:]]*(/s/[[:space:]]*rindex[[:space:]]*(/ strrchr(/g' $(@D)/ntpd/*.c
-- 
1.9.1
