From: Jeroen Roovers <jer@airfi.aero>
Date: Mon, 28 Aug 2017 17:56:04 +0200
Subject: [Buildroot] [PATCH] pppd: Do not overwrite /etc/resolv.conf
Message-ID: <20170828155604.24229-1-jer@airfi.aero>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With option usepeerdns, pppd by default writes to /etc/ppp/resolv.conf,
which is not very useful and might be impossible. However, when more
than one interface can be used for DNS resolution, pppd will overwrite
any existing entries when /etc/resolv.conf is used instead, which is
bad. Fix this by setting the path to a place we assume is always
writeable, /tmp/ppp-resolv.conf, and which does not interfere with other
mechanisms that write DNS resolver configurations.
---
 package/pppd/pppd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 6139c5b085..47937730d5 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -36,10 +36,10 @@ PPPD_POST_EXTRACT_HOOKS += PPPD_DROP_INTERNAL_IF_PPOL2TP_H
 
 # pppd defaults to /etc/ppp/resolv.conf, which not be writable and is
 # definitely not useful since the C library only uses
-# /etc/resolv.conf. Therefore, we change pppd to use /etc/resolv.conf
+# /etc/resolv.conf. Therefore, we change pppd to use /tmp/ppp-resolv.conf
 # instead.
 define PPPD_SET_RESOLV_CONF
-	$(SED) 's,ppp/resolv.conf,resolv.conf,' $(@D)/pppd/pathnames.h
+	$(SED) 's,/etc/ppp/resolv.conf,/tmp/ppp-resolv.conf,' $(@D)/pppd/pathnames.h
 endef
 PPPD_POST_EXTRACT_HOOKS += PPPD_SET_RESOLV_CONF
 
-- 
2.14.1
