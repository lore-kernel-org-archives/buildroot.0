From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jan 2018 23:37:59 +0100
Subject: [Buildroot] [git commit] dependencies: correct dependencies for
 top-level parallel build
Message-ID: <20180108223809.E7E9E7FDDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=390780d5626f5d8613dab22928ae90051d169ab1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/dependencies/dependencies.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index 80ba48a..4f606f8 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -24,6 +24,8 @@ core-dependencies:
 
 $(DEPENDENCIES_HOST_PREREQ): HOSTCC=$(HOSTCC_NOCCACHE)
 $(DEPENDENCIES_HOST_PREREQ): HOSTCXX=$(HOSTCXX_NOCCACHE)
+$(DEPENDENCIES_HOST_PREREQ): core-dependencies
+
 dependencies: core-dependencies $(DEPENDENCIES_HOST_PREREQ)
 
 ################################################################################
