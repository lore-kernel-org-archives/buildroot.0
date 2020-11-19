From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Nov 2020 22:23:45 +0100
Subject: [Buildroot] [PATCH 1/7] core/pkg-infra: prepare for alternate
 default source archives
In-Reply-To: <cover.1605821010.git.yann.morin.1998@free.fr>
References: <cover.1605821010.git.yann.morin.1998@free.fr>
Message-ID: <290464f65f82952a8b2ae2672d330aff1f43e29f.1605821010.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The .tar.gz default extension is historical, and we initially used to
only fetch tarballs from remote sites.

When we introduced downloads from VCS repositories, we kept that
extension, and kept compressing with gz, by lack of good reason to
switch to some other compression scheme.

However, nowadays, we will want to change the way we construct the
tarballs we generate from VCS. This will de facto change the hashes of
those tarballs.

If we were to keep the .tar.gz extension (and compression), then we'd
have a problem with older archives that would no longer match the newer
hashes (when someone uses s.b.o. for example), or the other way around
(if we updated the archives on s.b.o and someone uses an older
Buildroot).

So we will want that the archives we generate do not clash with the
existing ones, so needs another filename. So, we need a way to be able
to use a different extension, whatever we'll want to use when we
generate archives from VCS.

Note that we do not need to play the host-defaults-to-target-value
dance we do for the _SOURCE variable, because this is a purely internal
variable, not exposed to packages.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Vincent Fazio <vfazio@xes-inc.com>
---
 package/pkg-generic.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 54de03da03..5fe1bfe0e2 100644
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
