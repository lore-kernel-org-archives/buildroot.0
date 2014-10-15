From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 15 Oct 2014 15:37:55 -0500
Subject: [Buildroot] [PATCH 2/2] ntp: Adding pps support to ntpd
In-Reply-To: <1413405475-5179-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1413405475-5179-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1413405475-5179-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bryan Brinsko <bryan.brinsko@rockwellcollins.com>

Added an option for the ntpd application to support pps inputs.

Signed-off-by: Bryan Brinsko <bryan.brinsko@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/ntp/Config.in | 7 +++++++
 package/ntp/ntp.mk    | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/package/ntp/Config.in b/package/ntp/Config.in
index 858a9ad..7722757 100644
--- a/package/ntp/Config.in
+++ b/package/ntp/Config.in
@@ -34,6 +34,13 @@ config BR2_PACKAGE_NTP_NTPD
 	  system date and time in sync and optionally serving time and date
 	  information on the network via the NTP protocol.
 
+config BR2_PACKAGE_NTP_NTPD_ATOM_PPS
+	bool "ntpd-pps"
+	depends on BR2_PACKAGE_NTP_NTPD
+	select BR2_PACKAGE_PPS_TOOLS
+	help
+	  Compile ntpd with the ability to use an ATOM PPS source.
+
 config BR2_PACKAGE_NTP_NTPDATE
 	bool "ntpdate"
 	help
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 7c2cb8e..51598ba 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -34,6 +34,11 @@ else
 	NTP_CONF_OPTS += --without-ntpsnmpd
 endif
 
+ifeq ($(BR2_PACKAGE_NTP_NTPD_ATOM_PPS),y)
+	NTP_CONF_OPTS += --enable-ATOM
+	NTP_DEPENDENCIES += pps-tools
+endif
+
 define NTP_PATCH_FIXUPS
 	$(SED) "s,^#if.*__GLIBC__.*_BSD_SOURCE.*$$,#if 0," $(@D)/ntpd/refclock_pcf.c
 	$(SED) '/[[:space:](]rindex[[:space:]]*(/s/[[:space:]]*rindex[[:space:]]*(/ strrchr(/g' $(@D)/ntpd/*.c
-- 
1.9.1
