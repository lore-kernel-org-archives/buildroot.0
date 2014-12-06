From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Dec 2014 12:13:51 +0100
Subject: [Buildroot] [PATCH 1/9 v2] pkg-infra: allow specifying the local
	tarball name when calling DOWNLOAD
In-Reply-To: <cover.1417863715.git.yann.morin.1998@free.fr>
References: <cover.1417863715.git.yann.morin.1998@free.fr>
Message-ID: <06a1390c4a03389c008b4d11abd1095a552a56e1.1417863715.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a second optinal argument to the DOWNLOAD macro, to define the local
filename of the tarball.

If not specified, defaults to the basename of the remote URI.

This will be needed to be able to differentiate the upstream filename
from the local filename, which may differ in some cases.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1 -> v2:
  - retain the ability to not pass the local filename
---
 package/pkg-download.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index f3409bd..5bd8eac 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -245,13 +245,15 @@ endef
 # 3) BR2_BACKUP_SITE if enabled, unless BR2_PRIMARY_SITE_ONLY is set
 #
 # Argument 1 is the source location
+# Argument 2 is the local filename, without any path component, optional;
+#            if not specified, defaults to the basename of $(1)
 #
 # E.G. use like this:
 # $(call DOWNLOAD,$(FOO_SITE))
 ################################################################################
 
 define DOWNLOAD
-	$(call DOWNLOAD_INNER,$(1),$(notdir $(1)))
+	$(call DOWNLOAD_INNER,$(1),$(if $(2),$(2),$(notdir $(1))))
 endef
 
 define DOWNLOAD_INNER
-- 
1.9.1
