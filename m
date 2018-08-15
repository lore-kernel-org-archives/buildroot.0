From: Mirza Krak <mirza.krak@northern.tech>
Date: Wed, 15 Aug 2018 09:16:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-golang: fix illegal variable
 reference
Message-ID: <20180815071609.6722-1-mirza.krak@northern.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

References to variables inside $(eval) blocks must be with a double
dollar sign, otherwise we end up with unintuitive and undesired behavior
according to the description in pkg-generic.mk

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
---
 package/pkg-golang.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index bf178622b5..6eacd14180 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -77,9 +77,9 @@ $(2)_INSTALL_BINS ?= $(1)
 # of GOPATH. It usually resolves around domain/vendor/software. By default, we
 # derive domain/vendor/software from the upstream URL of the project, but we
 # allow $(2)_SRC_SUBDIR to be overridden if needed.
-$(2)_SRC_DOMAIN = $$(call domain,$($(2)_SITE))
-$(2)_SRC_VENDOR = $$(word 1,$$(subst /, ,$$(call notdomain,$($(2)_SITE))))
-$(2)_SRC_SOFTWARE = $$(word 2,$$(subst /, ,$$(call notdomain,$($(2)_SITE))))
+$(2)_SRC_DOMAIN = $$(call domain,$$($(2)_SITE))
+$(2)_SRC_VENDOR = $$(word 1,$$(subst /, ,$$(call notdomain,$$($(2)_SITE))))
+$(2)_SRC_SOFTWARE = $$(word 2,$$(subst /, ,$$(call notdomain,$$($(2)_SITE))))
 
 $(2)_SRC_SUBDIR ?= $$($(2)_SRC_DOMAIN)/$$($(2)_SRC_VENDOR)/$$($(2)_SRC_SOFTWARE)
 $(2)_SRC_PATH = $$(@D)/$$($(2)_WORKSPACE)/src/$$($(2)_SRC_SUBDIR)
-- 
2.18.0
