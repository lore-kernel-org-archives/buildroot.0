From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Mon, 28 Dec 2020 17:11:29 +0100
Subject: [Buildroot] [PATCH v2 09/14] package/iputils: add SELinux module
In-Reply-To: <20201228161134.303992-1-maxime.chevallier@bootlin.com>
References: <20201228161134.303992-1-maxime.chevallier@bootlin.com>
Message-ID: <20201228161134.303992-10-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for the iputils is added by the admin/netutils module in the
SELinux refpolicy for the following tools :
 - arping
 - ping
 - tracepath
 - traceroute6

Support for rdisc is added by services/rdisc.

Support for tftpd is added by services/tftp.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V1 -> V2: Use a per-tool module selection, for rdisc and tftpd,
according to Antoine's review

 package/iputils/iputils.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 4f8d9cb768..b1d71b38f2 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -27,6 +27,22 @@ IPUTILS_CONF_OPTS += \
 	-DBUILD_TRACEROUTE6=$(if $(BR2_PACKAGE_IPUTILS_TRACEROUTE6),true,false) \
 	-DBUILD_NINFOD=$(if $(BR2_PACKAGE_IPUTILS_NINFOD),true,false)
 
+# Selectively select the appropriate SELinux refpolicy modules
+ifneq ($(BR2_PACKAGE_IPUTILS_ARPING)\
+	$(BR2_PACKAGE_IPUTILS_PING)\
+	$(BR2_PACKAGE_IPUTILS_TRACEPATH)\
+	$(BR2_PACKAGE_IPUTILS_TRACEROUTE6),)
+IPUTILS_SELINUX_MODULES += netutils
+endif
+
+ifeq ($(BR2_PACKAGE_IPUTILS_RDISC),y)
+IPUTILS_SELINUX_MODULES += rdisc
+endif
+
+ifeq ($(BR2_PACKAGE_IPUTILS_TFTPD),y)
+IPUTILS_SELINUX_MODULES += tftp
+endif
+
 #
 # arping
 #
-- 
2.25.4
