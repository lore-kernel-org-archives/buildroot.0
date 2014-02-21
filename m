From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 Feb 2014 23:17:52 +0100
Subject: [Buildroot] [PATCH 1/3] Makefile: internally use absolute paths to
	BR2_EXTERNAL
In-Reply-To: <cover.1393020340.git.yann.morin.1998@free.fr>
References: <cover.1393020340.git.yann.morin.1998@free.fr>
Message-ID: <fe4af64de250841875483a827e6f4684fad64f71.1393020340.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Using a relative path for BR2_EXTERNAL, and using an external defconfig,
such as in (from a Buildroot top-dir):
    make O=.. BR2_EXTERNAL=.. foo_defconfig

is broken. It is unclear why the %_defconfig rule recurses in that case.

This patch internaly makes BR2_EXTERNAL canonical (ie. makes it an absolute
path), and checks the directory exists.

Reported-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Romain Naour <romain.naour@openwide.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1->v2:
  - fix override BR2_EXTERNAL  (J?r?my)
  - only one error message  (Arnout)
---
 Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Makefile b/Makefile
index 98d32c0..4766160 100644
--- a/Makefile
+++ b/Makefile
@@ -119,6 +119,11 @@ ifeq ($(BR2_EXTERNAL),)
   override BR2_EXTERNAL = support/dummy-external
   $(shell rm -f $(BR2_EXTERNAL_FILE))
 else
+  _BR2_EXTERNAL = $(shell cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd)
+  ifeq ($(_BR2_EXTERNAL),)
+    $(error BR2_EXTERNAL='$(BR2_EXTERNAL)' does not exist, relatively to $(TOPDIR))
+  endif
+  override BR2_EXTERNAL := $(_BR2_EXTERNAL)
   $(shell echo BR2_EXTERNAL ?= $(BR2_EXTERNAL) > $(BR2_EXTERNAL_FILE))
 endif
 
-- 
1.8.1.2
