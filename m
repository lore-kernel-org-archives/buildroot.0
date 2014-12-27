From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Dec 2014 15:50:20 +0100
Subject: [Buildroot] [PATCH v2] package/nftables: do not build docs
Message-ID: <1419691820-4044-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building docs requires dblatex with a working Jade Wrapper (jw) which
may well be missing on the build machine, and we do not build our own.

Since docs are anyway removed from the target, just do not build them.

Tell ./configure that we do not have the required tools:
  - DBLATEX=no to disable PDF generation
  - DOCBOOK2X_MAN=no, DOCBOOK2MAN=no and DB2X_DOCBOOK2MAN=no to disable
    manpage generation

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v1 -> v2:
  - do not touch Makefile.am, do not autoreconf, just pre-seed
    appropriate variables so ./configure concludes it does not have
    the required tools  (Thomas)
---
 package/nftables/nftables.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 9f18df7..6be05ed 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -22,6 +22,10 @@ endif
 
 NFTABLES_CONF_ENV = \
 	ac_cv_prog_CONFIG_PDF=no \
-	LIBS="$(NFTABLES_LIBS)"
+	LIBS="$(NFTABLES_LIBS)" \
+	DBLATEX=no \
+	DOCBOOK2X_MAN=no \
+	DOCBOOK2MAN=no \
+	DB2X_DOCBOOK2MAN=no
 
 $(eval $(autotools-package))
-- 
1.9.1
