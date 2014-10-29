From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Oct 2014 23:25:38 +0100
Subject: [Buildroot] [git commit] pppd: set resolv.conf directory
	appropiately
Message-ID: <20141029222553.8BB19B5824@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=94b890be7bc059fb10dec215d4ead0c2d4296ae1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

/etc/ppp/resolv.conf might not be writable and it's not useful, switch
to standard /etc/resolv.conf
If users don't want to update dns lookup entries they shouldn't use the
"userpeerdns" option.

[Thomas: slightly reword the comment in the code.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pppd/pppd.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index eb06eec..0a88251 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -35,6 +35,15 @@ endef
 
 PPPD_POST_EXTRACT_HOOKS += PPPD_DROP_INTERNAL_IF_PPOL2TP_H
 
+# pppd defaults to /etc/ppp/resolv.conf, which not be writable and is
+# definitely not useful since the C library only uses
+# /etc/resolv.conf. Therefore, we change pppd to use /etc/resolv.conf
+# instead.
+define PPPD_SET_RESOLV_CONF
+	$(SED) 's,ppp/resolv.conf,resolv.conf,' $(@D)/pppd/pathnames.h
+endef
+PPPD_POST_EXTRACT_HOOKS += PPPD_SET_RESOLV_CONF
+
 define PPPD_CONFIGURE_CMDS
 	$(SED) 's/FILTER=y/#FILTER=y/' $(PPPD_DIR)/pppd/Makefile.linux
 	$(SED) 's/ifneq ($$(wildcard \/usr\/include\/pcap-bpf.h),)/ifdef FILTER/' $(PPPD_DIR)/*/Makefile.linux
