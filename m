From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 22 Oct 2017 16:17:52 +0200
Subject: [Buildroot] [PATCH 2/2] dependencies: correct dependencies for
	top-level parallel build
In-Reply-To: <20171022141752.26105-1-arnout@mind.be>
References: <20171022141752.26105-1-arnout@mind.be>
Message-ID: <20171022141752.26105-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 4932c8a7cc94277b3d53cecd935f725b91cfa9fe introduced the
core-dependencies target to make sure that the dependencies.sh script
runs before we attempt to compile any host tool, so that the absence of
a compiler is properly detected. However, this relied on the
left-to-right evaluation of dependencies. This will no longer be true
when we enable top-level parallel build.

Fix this by letting DEPENDENCIES_HOST_PREREQ depend on
core-dependencies.

Note that it is not possible to remove the
dependencies <- core-dependencies. Indeed, it is possible that
DEPENDENCIES_HOST_PREREQ is completely empty, and in that case we still
need to check core-dependencies.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/dependencies/dependencies.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index 80ba48a6a7..4f606f849d 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -24,6 +24,8 @@ core-dependencies:
 
 $(DEPENDENCIES_HOST_PREREQ): HOSTCC=$(HOSTCC_NOCCACHE)
 $(DEPENDENCIES_HOST_PREREQ): HOSTCXX=$(HOSTCXX_NOCCACHE)
+$(DEPENDENCIES_HOST_PREREQ): core-dependencies
+
 dependencies: core-dependencies $(DEPENDENCIES_HOST_PREREQ)
 
 ################################################################################
-- 
2.15.0.rc1
