From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Sep 2020 23:20:47 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/dhcpdump: fix
 build without pod2man
Message-ID: <20200928211214.966C58D4B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d1201d1be3dd982dc7e437bf1239bfed13a8b7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Use dhcpdump target to avoid building dhcpdump.8 as it will raise the
following build failure if pod2man is not available:

pod2man --section 8 \
	--date "23 June 2008" \
	--name "DHCPDUMP" \
	--center "User Contributed Software" \
	dhcpdump.pod dhcpdump.8
/bin/sh: pod2man: command not found
make[1]: *** [Makefile:11: dhcpdump.8] Error 127

Fixes:
 - http://autobuild.buildroot.org/results/db3be149ec71de8376f685a6a9f027191d9bccc9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 698dcb61ea8ab81f92091dba372e996611d1168d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcpdump/dhcpdump.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
index 2413812880..ec9571c0af 100644
--- a/package/dhcpdump/dhcpdump.mk
+++ b/package/dhcpdump/dhcpdump.mk
@@ -20,7 +20,7 @@ DHCPDUMP_CFLAGS = $(TARGET_CFLAGS) -DHAVE_STRSEP
 
 define DHCPDUMP_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC) $(DHCPDUMP_CFLAGS) \
-		-D_GNU_SOURCE" LIBS="$(DHCPDUMP_LIBS)"
+		-D_GNU_SOURCE" LIBS="$(DHCPDUMP_LIBS)" dhcpdump
 endef
 
 define DHCPDUMP_INSTALL_TARGET_CMDS
