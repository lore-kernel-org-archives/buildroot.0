From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Oct 2013 15:09:10 -0300
Subject: [Buildroot] [PATCH 2/2] iptables: add support for connlabel match
	and nfnl_osf
In-Reply-To: <1383156550-15805-1-git-send-email-gustavo@zacarias.com.ar>
References: <1383156550-15805-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1383156550-15805-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iptables/iptables.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 13ad0ca..6547069 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -16,6 +16,16 @@ IPTABLES_CONF_OPT = --libexecdir=/usr/lib --with-kernel=$(STAGING_DIR)/usr
 # Because of iptables-01-fix-static-link.patch
 IPTABLES_AUTORECONF = YES
 
+# For connlabel match
+ifeq ($(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),y)
+IPTABLES_DEPENDENCIES += libnetfilter_conntrack
+endif
+
+# For nfnl_osf
+ifeq ($(BR2_PACKAGE_LIBNFNETLINK),y)
+IPTABLES_DEPENDENCIES += libnfnetlink
+endif
+
 define IPTABLES_TARGET_SYMLINK_CREATE
 	ln -sf xtables-multi $(TARGET_DIR)/usr/sbin/iptables
 	ln -sf xtables-multi $(TARGET_DIR)/usr/sbin/iptables-save
-- 
1.8.1.5
