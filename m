From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jun 2017 22:27:00 +0200
Subject: [Buildroot] [git commit] boost: module context affected by GCC bug
	64735
Message-ID: <20170615202622.71EC48047F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b139cb5dbef065e8769c35607245b5a795d808ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building boosts module context is affected by GCC bug 64735 [1]:

```
./boost/context/execution_context_v2.hpp:298:31: error: 'exception_ptr' is not a member of 'std'
     auto p = std::make_tuple( std::exception_ptr{}, std::move( data) );
```

This is because `exception_ptr` from libstdc++ is not available for
architectures not supporting always lock-free atomic ints.

Note, that this bug is fixed in GCC 7.

Fixes:
http://autobuild.buildroot.net/results/f4e/f4e8a3727f19f7df4a1c45efe3603422fafd4af5/

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=64735

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index f0a2385..50d0ff8 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -67,6 +67,7 @@ config BR2_PACKAGE_BOOST_CONTEXT
 	bool "boost-context"
 	depends on ((BR2_arm || BR2_armeb) && BR2_ARM_CPU_HAS_ARM) || \
 		BR2_i386 || BR2_mips || BR2_mipsel || BR2_powerpc || BR2_x86_64
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_BOOST_COROUTINE
 	bool "boost-coroutine"
