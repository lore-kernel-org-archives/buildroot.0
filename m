From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 3 Nov 2015 22:03:14 +0100
Subject: [Buildroot] [PATCH] boost: fix sparc64 compile,
	set the correct instruction-set
Message-ID: <20151103210313.GA25989@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The default for sparc is v7, which doesn't work for sparc64.
Use ultrasparc for sparc64.
Fixes following autobuild errors:
http://autobuild.buildroot.net/results/0cad0a6eddc153098bb6d1501afd1cf4a57a82d1/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/boost/boost.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 80325b0..d91baf1 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -89,6 +89,10 @@ BOOST_OPTS += toolset=gcc \
 	     abi=$(BOOST_ABI) \
 	     variant=$(if $(BR2_ENABLE_DEBUG),debug,release)
 
+ifeq ($(BR2_sparc64),y)
+BOOST_OPTS += architecture=sparc instruction-set=ultrasparc
+endif
+
 # By default, Boost build and installs both the shared and static
 # variants. Override that if we want static only or shared only.
 ifeq ($(BR2_STATIC_LIBS),y)
-- 
1.7.10.4
