From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 19:33:24 +0200
Subject: [Buildroot] [PATCH 10/35] pkg-generic: implement a
	<pkg>-external-deps target
In-Reply-To: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1427650429-9293-11-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/pkg-generic.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 22b3fb9..08e4cad 100644
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
-- 
2.1.0
