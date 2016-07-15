From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 13:11:06 +0200
Subject: [Buildroot] [git commit] ntp: add support for SHM clocks
Message-ID: <20160715111632.6BF0E82230@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c091ecda8743683102f9cccffa15f10b55b52ef3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order for gpsd to work with the new version of ntpd, an enable
option must be added to the configure step of ntp that allows for
support of SHM clocks to be attached through shared memory.

Signed-off-by: Yugendra Sai Babu Nadupuru <yugendra.sai.babu.nadupuru@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ntp/Config.in | 6 ++++++
 package/ntp/ntp.mk    | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/ntp/Config.in b/package/ntp/Config.in
index 1763225..8ce9a5b 100644
--- a/package/ntp/Config.in
+++ b/package/ntp/Config.in
@@ -19,6 +19,12 @@ config BR2_PACKAGE_NTP_NTP_KEYGEN
 	help
 	  Create a NTP host key
 
+config BR2_PACKAGE_NTP_NTP_SHM_CLK
+	bool "SHM clock support"
+	help
+	  Compile ntp with support for a SHM clock attached through
+	  shared memory.
+
 config BR2_PACKAGE_NTP_NTP_WAIT
 	bool "ntp-wait"
 	depends on BR2_PACKAGE_PERL
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 8d3a6f3..7d203a5 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -42,6 +42,12 @@ else
 NTP_CONF_OPTS += --disable-ATOM
 endif
 
+ifeq ($(BR2_PACKAGE_NTP_NTP_SHM_CLK),y)
+NTP_CONF_OPTS += --enable-SHM
+else
+NTP_CONF_OPTS += --disable-SHM
+endif
+
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTP_KEYGEN) += util/ntp-keygen
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTP_WAIT) += scripts/ntp-wait/ntp-wait
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPDATE) += ntpdate/ntpdate
