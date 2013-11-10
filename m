From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 00:53:48 +0100
Subject: [Buildroot] [git commit] iptables: add support for connlabel match
	and nfnl_osf
Message-ID: <20131111001017.ED3F79BB7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b835171cf9db23095c669b872dbaa15fc1e99898
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iptables/iptables.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

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
