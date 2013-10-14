From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Oct 2013 22:52:50 +0200
Subject: [Buildroot] [git commit] boost: fix build failures after version
	bump
Message-ID: <20131014205309.629BD9B9FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=611dfe6cb55ed72d7df3b7c102f4a723248a4037
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build failures that happened after the version bump such as:
http://autobuild.buildroot.net/results/570/570b091702763b29843d9207bc14dea67085fea0/
http://autobuild.buildroot.net/results/c26/c26498f1a4e6bcbc3a2dfce6a51fa7d21b72f21f/
and other failures by disabling the new (1.54+) coroutine and log
libraries which weren't handled and hence enabled by default.

These also made the target size bigger and build times longer
unnecessarily.

When/if they are needed for some future user this can be revisited and
their proper conditions for enablement assesed.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/boost/boost.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index a745ce1..b0b3352 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -17,7 +17,9 @@ BOOST_DEPENDENCIES =
 BOOST_FLAGS =
 
 # atomic library compile only with upstream version, wait for next release
-BOOST_WITHOUT_FLAGS = python atomic
+# coroutine breaks on some weak toolchains and it's new for 1.54+
+# log breaks with some toolchain combinations and it's new for 1.54+
+BOOST_WITHOUT_FLAGS = atomic coroutine log python
 
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTEXT),,context)
