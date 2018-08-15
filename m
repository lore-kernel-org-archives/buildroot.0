From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Aug 2018 14:32:46 +0200
Subject: [Buildroot] [git commit] package/pkg-golang: post-pone evaluation
 of variables
Message-ID: <20180815122852.262D28155C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4eccbe3ef975fa7dcc8984fa9a19c778752d70af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As explained in pkg-generic.mk, all variable references inside the
inner-xxx-package should use $$(...). Otherwise, they are evaluated
too early, and will not contain the expected value. In the content of
the pkg-golang infrastructure, the <pkg>_SRC_DOMAIN, <pkg>_SRC_VENDOR
and <pkg>_SRC_SOFTWARE variables were not properly escaping their
reference to the $$($(2)_SITE) variable.

This was not visible until now, as only target Go packages were
supported, where $(2)_SITE was always defined prior to this macro
being expanded. With the upcoming support of host Go packages, we need
to fix this, as $(2)_SITE may be defined later, inherited from
$(3)_SITE.

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
[Thomas: rework commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
