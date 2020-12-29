From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 12:01:09 +0100
Subject: [Buildroot] [PATCH 01/10 v3] core/pkg-infra: prepare for alternate
 default source archives
In-Reply-To: <cover.1609239666.git.yann.morin.1998@free.fr>
References: <cover.1609239666.git.yann.morin.1998@free.fr>
Message-ID: <7d52ccdb9dd1b0e56d1a3720e649f52693ee1c68.1609239666.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The .tar.gz default extension is historical, and we initially used
to only fetch tarballs from remote sites.

When we introduced downloads from VCS repositories, we kept that
extension, and kept compressing with gz, by lack of good reason to
switch to some other compression scheme.

However, nowadays, we will want to change the way we construct the
tarballs we generate from VCS. This will de facto change the hashes
of those tarballs.

So we will want that the archives we generate do not clash with the
existing ones, so we need another filename. Thus, we need a way to
be able to use a different extension when we generate archives from
VCS.

Note that we do not need to play the host-defaults-to-target-value
dance we do for the _SOURCE variable, because this is a purely internal
variable, not exposed to packages, and as such, is not documented.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Vincent Fazio <vfazio@xes-inc.com>
---
 package/pkg-generic.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 621fb91424..6a9389f1b5 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -514,11 +514,12 @@ ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 $(2)_VERSION = custom
 endif
 
+$(2)_SOURCE_EXT = .tar.gz
 ifndef $(2)_SOURCE
  ifdef $(3)_SOURCE
   $(2)_SOURCE = $$($(3)_SOURCE)
  else ifdef $(2)_VERSION
-  $(2)_SOURCE			?= $$($(2)_BASENAME_RAW).tar.gz
+  $(2)_SOURCE			?= $$($(2)_BASENAME_RAW)$$($(2)_SOURCE_EXT)
  endif
 endif
 
-- 
2.25.1
