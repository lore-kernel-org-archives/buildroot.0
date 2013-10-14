From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Oct 2013 11:15:11 -0300
Subject: [Buildroot] [PATCH 3/3] boost: fix build failures after version bump
In-Reply-To: <1381760111-1271-1-git-send-email-gustavo@zacarias.com.ar>
References: <1381760111-1271-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1381760111-1271-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/boost/boost.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 8f2c2db..8a1a8f7 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -25,7 +25,9 @@ HOST_BOOST_FLAGS = --without-icu \
 	serialization signals system test thread timer wave)
 
 # atomic library compile only with upstream version, wait for next release
-BOOST_WITHOUT_FLAGS = python atomic
+# coroutine breaks on some weak toolchains and it's new for 1.54+
+# log breaks with some toolchain combinations and it's new for 1.54+
+BOOST_WITHOUT_FLAGS = atomic coroutine log python
 
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTEXT),,context)
-- 
1.8.1.5
