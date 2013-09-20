From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 20 Sep 2013 11:04:39 +0200
Subject: [Buildroot] [PATCH] luaposix: remove IPv6 constraint
Message-ID: <1379667879-30002-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luaposix/Config.in                   |    3 --
 package/luaposix/luaposix-without-IPv6.patch |   55 ++++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 3 deletions(-)
 create mode 100644 package/luaposix/luaposix-without-IPv6.patch

diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
index beae8e4..922fd9e 100644
--- a/package/luaposix/Config.in
+++ b/package/luaposix/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LUAPOSIX
 	bool "luaposix"
-	depends on BR2_INET_IPV6
 	select BR2_PACKAGE_LUABITOP if BR2_PACKAGE_LUA
 	# LuaBitOp is already included in LuaJIT
 	help
@@ -13,5 +12,3 @@ config BR2_PACKAGE_LUAPOSIX
 
 	  https://github.com/luaposix/luaposix
 
-comment "luaposix requires a toolchain with IPv6 support"
-	depends on !BR2_INET_IPV6
diff --git a/package/luaposix/luaposix-without-IPv6.patch b/package/luaposix/luaposix-without-IPv6.patch
new file mode 100644
index 0000000..f187882
--- /dev/null
+++ b/package/luaposix/luaposix-without-IPv6.patch
@@ -0,0 +1,55 @@
+fix without IPv6
+
+see https://github.com/luaposix/luaposix/pull/117
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/ext/posix/posix.c
+===================================================================
+--- a/ext/posix/posix.c
++++ b/ext/posix/posix.c
+@@ -3637,6 +3637,7 @@
+ 					break;
+ 			}
+ 			break;
++#if defined(IPV6_JOIN_GROUP) && defined(IPV6_LEAVE_GROUP)
+ 		case IPPROTO_IPV6:
+ 			switch(optname) {
+ 				case IPV6_JOIN_GROUP:
+@@ -3650,6 +3651,7 @@
+ 					break;
+ 			}
+ 			break;
++#endif
+ 		case IPPROTO_TCP:
+ 			switch(optname) {
+ 				default:
+@@ -4697,13 +4699,27 @@
+ 	MENTRY( AI_V4MAPPED	);
+ 	MENTRY( AI_ALL		);
+ 	MENTRY( AI_ADDRCONFIG	);
++#endif
+ 
++#ifdef IPV6_JOIN_GROUP
+ 	MENTRY( IPV6_JOIN_GROUP		);
++#endif
++#ifdef IPV6_LEAVE_GROUP
+ 	MENTRY( IPV6_LEAVE_GROUP	);
++#endif
++#ifdef IPV6_MULTICAST_HOPS
+ 	MENTRY( IPV6_MULTICAST_HOPS	);
++#endif
++#ifdef IPV6_MULTICAST_IF
+ 	MENTRY( IPV6_MULTICAST_IF	);
++#endif
++#ifdef IPV6_MULTICAST_LOOP
+ 	MENTRY( IPV6_MULTICAST_LOOP	);
++#endif
++#ifdef IPV6_UNICAST_HOPS
+ 	MENTRY( IPV6_UNICAST_HOPS	);
++#endif
++#ifdef IPV6_V6ONLY
+ 	MENTRY( IPV6_V6ONLY		);
+ #endif
+ #undef MENTRY
+
-- 
1.7.9.5
