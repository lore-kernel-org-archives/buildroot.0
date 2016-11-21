From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 21:54:51 +0100
Subject: [Buildroot] [git commit] ptpd2: fix bfin compile by avoiding gcc bug
Message-ID: <20161121210349.E6BC08190D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5a51555f81d3e0b0261efb9db34cc9c8c9d2463
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  http://autobuild.buildroot.net/results/cb967c8af006caa9272e800968f794ca018a7a27
  http://autobuild.buildroot.net/results/9a046dc5ef390e562b89338f0afeaef14b945458

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Thomas: also pass TARGET_CFLAGS.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ptpd2/ptpd2.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/ptpd2/ptpd2.mk b/package/ptpd2/ptpd2.mk
index da6a106..d53b135 100644
--- a/package/ptpd2/ptpd2.mk
+++ b/package/ptpd2/ptpd2.mk
@@ -24,6 +24,12 @@ else
 PTPD2_CONF_OPTS += --disable-snmp
 endif
 
+# GCC bug with Os/O1/O2/O3
+# internal compiler error: in gen_add2_insn, at optabs.c:4454
+ifeq ($(BR2_bfin),y)
+PTPD2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O0"
+endif
+
 define PTPD2_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/ptpd2/S65ptpd2 \
 		$(TARGET_DIR)/etc/init.d/S65ptpd2
