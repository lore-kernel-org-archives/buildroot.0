Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0237C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 21:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6814D81B83;
	Wed,  8 Nov 2023 21:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6814D81B83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qvXGUwY5Q1zb; Wed,  8 Nov 2023 21:11:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 708B381B23;
	Wed,  8 Nov 2023 21:11:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 708B381B23
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 91B661BF4DD
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 21:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BBE6819CC
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 21:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BBE6819CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GDGejVwxOqzt for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 21:10:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55F74819BE
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 21:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55F74819BE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4402786D64; Wed,  8 Nov 2023 21:10:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 21:33:54 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 045333fd3316742ee86bd585b7f9849c810884a7
X-Git-Newrev: a436418b6f11a54ede2ce44b7b28fdd4a8997303
X-Patchwork-Hint: ignore
Message-Id: <20231108211052.4402786D64@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/websocketpp: fix
 build with C++20
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a436418b6f11a54ede2ce44b7b28fdd4a8997303
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

websocketpp had some ill-formed usage of template parameters which was
finally removed in C++20. Hence build fails when building with C++20
support enabled.

The patch is already in the develop branch but no new release was
done.

There are no autobuilder failures because websocketpp is a header-only
library, and there are no packages in Buildroot that depned on
websocketpp.

A build issue was encountered when bumping an internal project to
C++20. This issue triggered quite some bug reports in the project [0]
and there are backports to other package managers like vcpkg [1] and
conan [2].

[0] https://github.com/zaphoyd/websocketpp/pull/1060
[1] https://github.com/microsoft/vcpkg/pull/23669
[2] https://github.com/conan-io/conan-center-index/pull/15295

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
[Thomas: extend commit log with details provided by Michael.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9ac1a76fcf255a9b8d2ce15514595e02275efc8e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/websocketpp/0001-fix_cpp20_build.patch | 108 +++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
