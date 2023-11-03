Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0645C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 11:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A865417D0;
	Fri,  3 Nov 2023 11:25:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A865417D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id at_AWzuLb0GO; Fri,  3 Nov 2023 11:25:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB01E41847;
	Fri,  3 Nov 2023 11:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB01E41847
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E05691BF3AA
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 11:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B935A70491
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 11:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B935A70491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M62tBn6ZDMH1 for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 11:25:05 +0000 (UTC)
X-Greylist: delayed 506 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 03 Nov 2023 11:25:04 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0A9B70463
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0A9B70463
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 11:25:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 327011814B9; Fri,  3 Nov 2023 12:16:28 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri,  3 Nov 2023 12:16:12 +0100
Message-Id: <20231103111618.548198-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1699010193; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Cvzj6J2DT37vT4Nyb7g2R3qsjwWP/xfH1+621mRLdmM=;
 b=nHAsj7P7or6JAKUEZd9mXqq/KENp2n9txv+Mezfwb/aJzq6it+eTl2W57yo3XGIT6RUnq2
 3Hla/JsW8j4ED0pr/BXxylfH1mkgw4EX5sxWvQY+QwD9qRdJtPpqJLHK44B5z+MOYeibfh
 5PjNVkITxnLNHx2bTsKzh25RZ/yJrJ4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=nHAsj7P7
Subject: [Buildroot] [PATCH] package/websocketpp: fix build with C++20
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Ryan Barnett <ryan.barnett@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

websocketpp had some ill-formed usage of template parameters which was
finally removed in C++20. Hence build fails when building with C++20 support
enabled.

The patch is already in the develop branch but no new release was done.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 .../websocketpp/0001-fix_cpp20_build.patch    | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 package/websocketpp/0001-fix_cpp20_build.patch

diff --git a/package/websocketpp/0001-fix_cpp20_build.patch b/package/websocketpp/0001-fix_cpp20_build.patch
new file mode 100644
index 0000000000..77b2292051
--- /dev/null
+++ b/package/websocketpp/0001-fix_cpp20_build.patch
@@ -0,0 +1,108 @@
+From 3197a520eb4c1e4754860441918a5930160373eb Mon Sep 17 00:00:00 2001
+From: Peter Thorson <git@zaphoyd.com>
+Date: Tue, 29 Jun 2021 09:13:12 -0500
+Subject: [PATCH] [core] Remove the use of simple template ids as they have
+ been removed in c++20.
+ https://timsong-cpp.github.io/cppwp/n4861/diff.cpp17.class#2 references #991
+
+Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
+Upstream: https://github.com/zaphoyd/websocketpp/commit/3197a520eb4c1e4754860441918a5930160373eb
+---
+ websocketpp/endpoint.hpp              |  2 +-
+ websocketpp/logger/basic.hpp          | 14 +++++++-------
+ websocketpp/roles/server_endpoint.hpp |  6 +++---
+ 3 files changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/websocketpp/endpoint.hpp b/websocketpp/endpoint.hpp
+index 825eaa46d..10f525689 100644
+--- a/websocketpp/endpoint.hpp
++++ b/websocketpp/endpoint.hpp
+@@ -111,7 +111,7 @@ class endpoint : public config::transport_type, public config::endpoint_base {
+ 
+ 
+     /// Destructor
+-    ~endpoint<connection,config>() {}
++    ~endpoint() {}
+ 
+     #ifdef _WEBSOCKETPP_DEFAULT_DELETE_FUNCTIONS_
+         // no copy constructor because endpoints are not copyable
+diff --git a/websocketpp/logger/basic.hpp b/websocketpp/logger/basic.hpp
+index 84514130e..4c9d83649 100644
+--- a/websocketpp/logger/basic.hpp
++++ b/websocketpp/logger/basic.hpp
+@@ -58,33 +58,33 @@ namespace log {
+ template <typename concurrency, typename names>
+ class basic {
+ public:
+-    basic<concurrency,names>(channel_type_hint::value h =
++    basic(channel_type_hint::value h =
+         channel_type_hint::access)
+       : m_static_channels(0xffffffff)
+       , m_dynamic_channels(0)
+       , m_out(h == channel_type_hint::error ? &std::cerr : &std::cout) {}
+ 
+-    basic<concurrency,names>(std::ostream * out)
++    basic(std::ostream * out)
+       : m_static_channels(0xffffffff)
+       , m_dynamic_channels(0)
+       , m_out(out) {}
+ 
+-    basic<concurrency,names>(level c, channel_type_hint::value h =
++    basic(level c, channel_type_hint::value h =
+         channel_type_hint::access)
+       : m_static_channels(c)
+       , m_dynamic_channels(0)
+       , m_out(h == channel_type_hint::error ? &std::cerr : &std::cout) {}
+ 
+-    basic<concurrency,names>(level c, std::ostream * out)
++    basic(level c, std::ostream * out)
+       : m_static_channels(c)
+       , m_dynamic_channels(0)
+       , m_out(out) {}
+ 
+     /// Destructor
+-    ~basic<concurrency,names>() {}
++    ~basic() {}
+ 
+     /// Copy constructor
+-    basic<concurrency,names>(basic<concurrency,names> const & other)
++    basic(basic<concurrency,names> const & other)
+      : m_static_channels(other.m_static_channels)
+      , m_dynamic_channels(other.m_dynamic_channels)
+      , m_out(other.m_out)
+@@ -97,7 +97,7 @@ class basic {
+ 
+ #ifdef _WEBSOCKETPP_MOVE_SEMANTICS_
+     /// Move constructor
+-    basic<concurrency,names>(basic<concurrency,names> && other)
++    basic(basic<concurrency,names> && other)
+      : m_static_channels(other.m_static_channels)
+      , m_dynamic_channels(other.m_dynamic_channels)
+      , m_out(other.m_out)
+diff --git a/websocketpp/roles/server_endpoint.hpp b/websocketpp/roles/server_endpoint.hpp
+index 4a5865eff..04fee18f9 100644
+--- a/websocketpp/roles/server_endpoint.hpp
++++ b/websocketpp/roles/server_endpoint.hpp
+@@ -75,11 +75,11 @@ class server : public endpoint<connection<config>,config> {
+     }
+ 
+     /// Destructor
+-    ~server<config>() {}
++    ~server() {}
+ 
+ #ifdef _WEBSOCKETPP_DEFAULT_DELETE_FUNCTIONS_
+     // no copy constructor because endpoints are not copyable
+-    server<config>(server<config> &) = delete;
++    server(server<config> &) = delete;
+ 
+     // no copy assignment operator because endpoints are not copyable
+     server<config> & operator=(server<config> const &) = delete;
+@@ -87,7 +87,7 @@ class server : public endpoint<connection<config>,config> {
+ 
+ #ifdef _WEBSOCKETPP_MOVE_SEMANTICS_
+     /// Move constructor
+-    server<config>(server<config> && o) : endpoint<connection<config>,config>(std::move(o)) {}
++    server(server<config> && o) : endpoint<connection<config>,config>(std::move(o)) {}
+ 
+ #ifdef _WEBSOCKETPP_DEFAULT_DELETE_FUNCTIONS_
+     // no move assignment operator because of const member variables
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
