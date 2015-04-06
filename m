From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 11:06:43 +0200
Subject: [Buildroot] [git commit] pkg-generic: implement a
	<pkg>-external-deps target
Message-ID: <20150406093206.B226E800FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=31d12a8408778fbc73627b8853ead766771a1249
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit implements a new <pkg>-external-deps target in the
pkg-generic package infrastructure. This target simply displays the
list of file names that are needed for <pkg> to build (source tarball,
patches, extra downloads).

In the case of the usage of <pkg>_OVERRIDE_SRCDIR, the path to the
overriden source directory is displayed, prepended by file://. This
matches what the code is currently doing in .stamp_rsync_sourced.

This new target is not currently being used in this commit, but
followup commits will make use of it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 0d95541..1c19947 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -546,6 +546,11 @@ $$($(2)_TARGET_EXTRACT):	$$($(2)_TARGET_SOURCE)
 $(1)-depends:		$$($(2)_FINAL_DEPENDENCIES)
 
 $(1)-source:		$$($(2)_TARGET_SOURCE)
+
+$(1)-external-deps:
+	@for p in $$($(2)_SOURCE) $$($(2)_PATCH) $$($(2)_EXTRA_DOWNLOADS) ; do \
+		echo `basename $$$$p` ; \
+	done
 else
 # In the package override case, the sequence of steps
 #  source, by rsyncing
@@ -564,6 +569,9 @@ $(1)-extract:		$(1)-rsync
 $(1)-rsync:		$$($(2)_TARGET_RSYNC)
 
 $(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
+
+$(1)-external-deps:
+	@echo "file://$$($(2)_OVERRIDE_SRCDIR)"
 endif
 
 $(1)-show-version:
