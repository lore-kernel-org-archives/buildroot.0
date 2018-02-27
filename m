From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 17:01:47 +0100
Subject: [Buildroot] [git commit] dependencies.mk: check for valid host-tar
 before other host dependencies
Message-ID: <20180227160401.B34A281298@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c09cb82b75f30eba7a9daaae5e77a604f6e49c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-{cmake,lzip,xz} needs host-tar to extract their source code tarball, so
we need to ensure that host-tar gets added to DEPENDENCIES_HOST_PREREQ
before these in case they are both needed, otherwise the tools will fail to
extract.

With the upcoming change to blacklist modern tar versions this situation is
likely to trigger more often.

The real solution to this issue is the <foo>_EXTRACT_DEPENDENCIES rework,
but that series is a bit too intrusive to add this close to 2018.02, so
therefore this hack.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index 4f606f849d..3fc235863c 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -12,7 +12,10 @@
 define suitable-host-package
 $(shell support/dependencies/check-host-$(1).sh $(2))
 endef
--include $(sort $(wildcard support/dependencies/check-host-*.mk))
+# host utilities needs host-tar to extract the source code tarballs, so
+# ensure check-host-tar.mk is included before the rest
+include support/dependencies/check-host-tar.mk
+-include $(sort $(filter-out %-tar.mk,$(wildcard support/dependencies/check-host-*.mk)))
 
 ifeq ($(BR2_CCACHE),y)
 DEPENDENCIES_HOST_PREREQ += host-ccache
