From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 14 May 2013 17:17:09 +0200
Subject: [Buildroot] [git commit] legal-info: fail trying to copy a
	non-existent license file
Message-ID: <20130514151955.E4EFD9A1DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=376c3aad61dbeb8e2126e13658fd150b70746afb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If a package's _LICENSE_FILES contains the name of a non-existent file,
the make process would continue and return true, unless the
non-existent file is the last listed.

Fix this wrong beaviour by failing with an error when any of the listed
files is missing.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pkg-generic.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b55b5f0..56fca6b 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -508,9 +508,7 @@ ifeq ($(call qstrip,$$($(2)_LICENSE_FILES)),)
 	@$(call legal-license-nofiles,$$($(2)_RAWNAME))
 	@$(call legal-warning-pkg,$$($(2)_RAWNAME),cannot save license ($(2)_LICENSE_FILES not defined))
 else
-	@for F in $$($(2)_LICENSE_FILES); do \
-		$(call legal-license-file,$$($(2)_RAWNAME),$$$${F},$$($(2)_DIR)/$$$${F}); \
-		done
+	@$(foreach F,$($(2)_LICENSE_FILES),$(call legal-license-file,$$($(2)_RAWNAME),$(F),$$($(2)_DIR)/$(F))$$(sep))
 endif
 ifeq ($$($(2)_REDISTRIBUTE),YES)
 # Copy the source tarball (just hardlink if possible)
