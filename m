From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Nov 2017 18:47:50 +0100
Subject: [Buildroot] [git commit] boost: fix handling of
 BR2_PACKAGE_BOOST_FIBER option
Message-ID: <20171103174207.8DF39810FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e559557ac713707c6160da3facf251476f99925
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 657dbfa00af724c2539a08eaaf0c8044dd4051d7 ("boost: add fiber
module"), introduced:

BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FILESYSTEM),,fiber)

which obviously is a typo, and should have been:

BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FIBER),,fiber)

Due to this, the fiber module gets compiled even if
BR2_PACKAGE_BOOST_FIBER is disabled, causing build failures when NPTL
is not available (the fiber library needs NPTL threads).

Fixes:

  http://autobuild.buildroot.net/results/c8b58bf37b565e7a4dd7959e0d9c1cec993758ba/
  http://autobuild.buildroot.net/results/df6f9d51ee766a6f8fca986cdc7476d148dad53e/
  http://autobuild.buildroot.net/results/fecc16df052ac5b14d3b15e174c7026dfcc8fd33/

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/boost.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 750b40f..864a07f 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -26,7 +26,7 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTEXT),,context)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_COROUTINE),,coroutine)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_DATE_TIME),,date_time)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_EXCEPTION),,exception)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FILESYSTEM),,fiber)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FIBER),,fiber)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FILESYSTEM),,filesystem)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_GRAPH),,graph)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_GRAPH_PARALLEL),,graph_parallel)
