From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 3 Sep 2014 16:10:49 +0100
Subject: [Buildroot] [PATCH] boost: Force the target ABI for MIPS
	architecture
Message-ID: <1409757049-63061-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The default ABI used in boost is 'sysv' which is not valid for MIPS.
Given the boost build system doesn't detect the right ABI when we are
cross-compiling, we fix this by passing the right ABI directly to the
boost options for the target.

Related:
  https://svn.boost.org/trac/boost/ticket/10442

Fixes:
  http://autobuild.buildroot.net/results/79f/79fe4caffb9a3b9f1b203498a589a5172bd0acea/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/boost/boost.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 2cd76ce..ac67e3c 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -82,6 +82,7 @@ HOST_BOOST_OPT += toolset=gcc threading=multi variant=release link=shared \
 
 BOOST_OPT += toolset=gcc \
 	     threading=multi \
+	     abi=$(if $(BR2_MIPS_OABI32),o32,sysv) \
 	     variant=$(if $(BR2_ENABLE_DEBUG),debug,release) \
 	     link=$(if $(BR2_PREFER_STATIC_LIB),static,shared) \
 	     runtime-link=$(if $(BR2_PREFER_STATIC_LIB),static,shared)
-- 
1.7.1
