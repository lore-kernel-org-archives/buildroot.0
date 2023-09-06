Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D738EE14D3
	for <buildroot@archiver.kernel.org>; Wed,  6 Sep 2023 19:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E7EF415BC;
	Wed,  6 Sep 2023 19:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E7EF415BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ODmS32dfGlW; Wed,  6 Sep 2023 19:25:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3651641598;
	Wed,  6 Sep 2023 19:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3651641598
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 386241BF983
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 123CE81489
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:24:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 123CE81489
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 40BlQBelhh2a for <buildroot@lists.busybox.net>;
 Wed,  6 Sep 2023 19:24:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26B888146D
 for <buildroot@buildroot.org>; Wed,  6 Sep 2023 19:24:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26B888146D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12584869A4; Wed,  6 Sep 2023 19:24:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Sep 2023 21:18:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7488b4d685657e7d724d18ab1e7982e2148e271
X-Git-Newrev: 0ef48995a14389a2d8a40fa47ba0d0a731903fc5
X-Patchwork-Hint: ignore
Message-Id: <20230906192455.12584869A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zeromq: Fix building against gcc-13
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ef48995a14389a2d8a40fa47ba0d0a731903fc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

`gcc-13` added an assert to standard headers to make sure custom
allocators have intended implementation of rebind type instead
of inherited rebind. gcc change:
https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=64c986b49558a7

Taken from upstream commit bdd471fa17100fe84f64da348951dab3ee4780bb

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../zeromq/0001-define-missing-rebind-type.patch   | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/package/zeromq/0001-define-missing-rebind-type.patch b/package/zeromq/0001-define-missing-rebind-type.patch
new file mode 100644
index 0000000000..f7484931e8
--- /dev/null
+++ b/package/zeromq/0001-define-missing-rebind-type.patch
@@ -0,0 +1,62 @@
+From 438d5d88392baffa6c2c5e0737d9de19d6686f0d Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Tue, 20 Dec 2022 21:45:16 +0000
+Subject: [PATCH] src/secure_allocator.hpp: define missing 'rebind' type
+
+`gcc-13` added an assert to standard headers to make sure custom
+allocators have intended implementation of rebind type instead
+of inherited rebind. gcc change:
+    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=64c986b49558a7
+
+Without the fix build fails on this week's `gcc-13` as:
+
+    [ 92%] Building CXX object tests/CMakeFiles/test_security_curve.dir/test_security_curve.cpp.o
+    In file included from /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/ext/alloc_traits.h:34,
+                     from /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/bits/stl_uninitialized.h:64,
+                     from /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/memory:69,
+                     from tests/../src/secure_allocator.hpp:42,
+                     from tests/../src/curve_client_tools.hpp:49,
+                     from tests/test_security_curve.cpp:53:
+    /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/bits/alloc_traits.h: In instantiation of 'struct std::__allocator_traits_base::__rebind<zmq::secure_allocator_t<unsigned char>, unsigned char, void>':
+    /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/bits/alloc_traits.h:94:11:   required by substitution of 'template<class _Alloc, class _Up> using std::__alloc_rebind = typename std::__allocator_traits_base::__rebind<_Alloc, _Up>::type [with _Alloc = zmq::secure_allocator_t<unsigned char>; _Up = unsigned char]'
+    /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/bits/alloc_traits.h:228:8:   required by substitution of 'template<class _Alloc> template<class _Tp> using std::allocator_traits< <template-parameter-1-1> >::rebind_alloc = std::__alloc_rebind<_Alloc, _Tp> [with _Tp = unsigned char; _Alloc = zmq::secure_allocator_t<unsigned char>]'
+    /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/ext/alloc_traits.h:126:65:   required from 'struct __gnu_cxx::__alloc_traits<zmq::secure_allocator_t<unsigned char>, unsigned char>::rebind<unsigned char>'
+    /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/bits/stl_vector.h:88:21:   required from 'struct std::_Vector_base<unsigned char, zmq::secure_allocator_t<unsigned char> >'
+    /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/bits/stl_vector.h:423:11:   required from 'class std::vector<unsigned char, zmq::secure_allocator_t<unsigned char> >'
+    tests/../src/curve_client_tools.hpp:64:76:   required from here
+    /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/bits/alloc_traits.h:70:31: error: static assertion failed: allocator_traits<A>::rebind_alloc<A::value_type> must be A
+       70 |                         _Tp>::value,
+          |                               ^~~~~
+
+The change adds trivial `rebind` definition with expected return type
+and satisfies conversion requirements.
+
+Upstream: merged. Commit: bdd471fa17100fe84f64da348951dab3ee4780bb
+Signed-off-by: Sergei Trofimovich <slyich@gmail.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ src/secure_allocator.hpp | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/src/secure_allocator.hpp b/src/secure_allocator.hpp
+index e0871dcc99..5e97368911 100644
+--- a/src/secure_allocator.hpp
++++ b/src/secure_allocator.hpp
+@@ -99,6 +99,17 @@ bool operator!= (const secure_allocator_t<T> &, const secure_allocator_t<U> &)
+ #else
+ template <typename T> struct secure_allocator_t : std::allocator<T>
+ {
++    secure_allocator_t () ZMQ_DEFAULT;
++
++    template <class U>
++    secure_allocator_t (const secure_allocator_t<U> &) ZMQ_NOEXCEPT
++    {
++    }
++
++    template <class U> struct rebind
++    {
++        typedef secure_allocator_t<U> other;
++    };
+ };
+ #endif
+ }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
