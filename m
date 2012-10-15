From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Oct 2012 10:21:33 +0200
Subject: [Buildroot] [git commit] pkg-infra: correct the source name for
	host-only packages
Message-ID: <20121015082204.B335399871@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=79bfcd556027901b847cae063cbcfbedf75e394a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Host-only package that don't define their <PKG>_SOURCE variable would
default to host-<pkg>-<version>.tar.gz.  It's more logical to remove
the host- prefix in this case.

This problem is most apparent with host-only packages downloaded from
version control, because they never define <PKG>_SOURCE.

Reported by Thomas Petazzoni and initial analysis by Luca Ceresoli.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pkg-generic.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ffe7dfb..270da60 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -231,7 +231,7 @@ ifndef $(2)_SOURCE
  ifdef $(3)_SOURCE
   $(2)_SOURCE = $($(3)_SOURCE)
  else
-  $(2)_SOURCE			?= $$($(2)_BASE_NAME).tar.gz
+  $(2)_SOURCE			?= $$($(2)_RAWNAME)-$$($(2)_VERSION).tar.gz
  endif
 endif
 
