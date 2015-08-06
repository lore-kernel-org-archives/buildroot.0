From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 09:12:18 +0200
Subject: [Buildroot] [git commit] package/tz: fix incorrect timezone setting
	for uclibc
Message-ID: <20150806071231.73A8281E8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e6884604ea88316ffa47ff2c1d57604eb9146ba3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to the doc file from <uclibc-src>/docs/
Glibc_vs_uClibc_Differences.txt, the uclibc library read the
TZ environment variable, or the /etc/TZ file; the /etc/TZ file
should be a single line, ending with a newline, containing the
TZ setting.  For example: echo CST6CDT > /etc/TZ

Whereas the tzdump cmd would output two lines like this:
  # Asia/Shanghai
  CST-8

This make the uclibc could not read the correct TZ setting, therefore
e.g. the 'busybox date' cmd always show the UTC timezone.

This fix remove the redundant first line from the tzdump output.

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tz/tz.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tz/tz.mk b/package/tz/tz.mk
index 349d73f..7a756eb 100644
--- a/package/tz/tz.mk
+++ b/package/tz/tz.mk
@@ -14,7 +14,7 @@ define TZ_BUILD_CMDS
 	(cd $(HOST_DIR)/usr/share/zoneinfo/posix/;                 \
 		for i in $$(find . -type f); do                    \
 			mkdir -p $(@D)/output/$$(dirname $$i);         \
-			$(TZDUMP) -p . -q $${i#./} > $(@D)/output/$$i; \
+			$(TZDUMP) -p . -q $${i#./} | sed '1d' > $(@D)/output/$$i; \
 		done                                               \
 	)
 endef
