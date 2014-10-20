From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 20 Oct 2014 18:32:32 -0300
Subject: [Buildroot] [PATCH] pppd: set resolv.conf directory appropiately
Message-ID: <1413840752-16362-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

/etc/ppp/resolv.conf might not be writable and it's not useful, switch
to standard /etc/resolv.conf
If users don't want to update dns lookup entries they shouldn't use the
"userpeerdns" option.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pppd/pppd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index eb06eec..384b868 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -35,6 +35,13 @@ endef
 
 PPPD_POST_EXTRACT_HOOKS += PPPD_DROP_INTERNAL_IF_PPOL2TP_H
 
+# pppd defaults to /etc/ppp/resolv.conf
+# That might not be writable and definitely not useful
+define PPPD_SET_RESOLV_CONF
+	$(SED) 's,ppp/resolv.conf,resolv.conf,' $(@D)/pppd/pathnames.h
+endef
+PPPD_POST_EXTRACT_HOOKS += PPPD_SET_RESOLV_CONF
+
 define PPPD_CONFIGURE_CMDS
 	$(SED) 's/FILTER=y/#FILTER=y/' $(PPPD_DIR)/pppd/Makefile.linux
 	$(SED) 's/ifneq ($$(wildcard \/usr\/include\/pcap-bpf.h),)/ifdef FILTER/' $(PPPD_DIR)/*/Makefile.linux
-- 
2.0.4
