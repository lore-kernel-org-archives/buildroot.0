From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 17:23:31 +0200
Subject: [Buildroot] [git commit] ntp: Adding pps support to ntpd
Message-ID: <20141019152824.BA0AEAF9C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7cfaff261136880fbc93f92179d5c46e1f7d4232
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added an option for the ntpd application to support pps inputs.

Signed-off-by: Bryan Brinsko <bryan.brinsko@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ntp/Config.in |    7 +++++++
 package/ntp/ntp.mk    |    7 +++++++
 2 files changed, 14 insertions(+), 0 deletions(-)

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
