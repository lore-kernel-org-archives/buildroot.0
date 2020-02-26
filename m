From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2020 16:16:39 +0100
Subject: [Buildroot] [git commit] package/linux-tools: filter debugging
 symbols for hyperv
Message-ID: <20200226152402.32C218E9CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15d065c97c4ae6d57d207c2ef28663a7a77afa27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Workaround for:

ld: hv_vss_daemon.o: unable to initialize decompress status for section .debug_info
ld: hv_vss_daemon.o: unable to initialize decompress status for section .debug_info
hv_vss_daemon.o: file not recognized: File format not recognized

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-tools/linux-tool-hv.mk.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-hv.mk.in b/package/linux-tools/linux-tool-hv.mk.in
index 6996c55271..e638fecfc6 100644
--- a/package/linux-tools/linux-tool-hv.mk.in
+++ b/package/linux-tools/linux-tool-hv.mk.in
@@ -16,7 +16,7 @@ HV_hv_kvp_daemon = hypervkvpd
 HV_hv_fcopy_daemon = hypervfcopyd
 HV_hv_vss_daemon = hypervvssd
 
-HV_MAKE_OPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"
+HV_MAKE_OPTS = CC="$(TARGET_CC)" CFLAGS="$(filter-out -g%,$(TARGET_CFLAGS))"
 
 define HV_BUILD_CMDS
 	$(Q)for prog in $(HV_PROGS_y); do \
