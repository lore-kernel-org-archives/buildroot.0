Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1763DC83F3E
	for <buildroot@archiver.kernel.org>; Tue,  5 Sep 2023 17:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9779040130;
	Tue,  5 Sep 2023 17:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9779040130
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ysqA1llYfhd; Tue,  5 Sep 2023 17:21:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A9AD4024E;
	Tue,  5 Sep 2023 17:20:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A9AD4024E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 334BB1BF2BF
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 17:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 192F160BDD
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 17:20:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 192F160BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FPv7WCV12t_I for <buildroot@lists.busybox.net>;
 Tue,  5 Sep 2023 17:20:57 +0000 (UTC)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0CF8660AD8
 for <buildroot@buildroot.org>; Tue,  5 Sep 2023 17:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CF8660AD8
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1bf1935f6c2so453755ad.1
 for <buildroot@buildroot.org>; Tue, 05 Sep 2023 10:20:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693934456; x=1694539256;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TstPlL9yGGrCBt2r2aAZn0AF0x9vbjRNM66+sbziHSU=;
 b=AgE2hMlUmiS4I2j8n5QSGImXB6idDOPSR8PxfH2dtH7Y6uH8ftaiknp+TBvZore9Ti
 L49886QgXW4HPjpoHfLuE61r1YjO5DJl3+QDgM1D/HGaNrNtqck1GQnftk+o1qDrsXue
 4GRgToFjLR/jIxUqZGZscuTuvo1S/wNWeDV2zfymJ3Crf47LlaB/oxMD/sloHEt4oBCD
 w46cK7XNsfIA4ggQPQLi5HJzdzVGyjf4r3/ZRksvnbW+77JAUSpbIDqW+DNztAMV7cWO
 VV+2nhhC3poSCak82pTJ3Zxqn629x5IqO/VCb2hOxG42caLkZoSEphyfhV7Yjtcd/tHa
 7xYw==
X-Gm-Message-State: AOJu0YzZHI3lXv0nyv+8J6S/lSa67id6tu49STkLtyQuxjB17O2Orq0t
 f3R1jIPAcE2gnJfQ1WpFsK5l0nDOkffPo7qELj0=
X-Google-Smtp-Source: AGHT+IG9eJAUb4q5iy7z29ehy7hrH4LuL45BPVSJJ4+VCMy7rGuemhXbiUItyN7XvceN8c9miGDlMg==
X-Received: by 2002:a17:902:ab54:b0:1b8:8682:62fb with SMTP id
 ij20-20020a170902ab5400b001b8868262fbmr15072819plb.4.1693934456017; 
 Tue, 05 Sep 2023 10:20:56 -0700 (PDT)
Received: from Adam-laptop.lan ([172.56.200.156])
 by smtp.gmail.com with ESMTPSA id
 y19-20020a170902ed5300b001bdccf6b8c9sm9591048plb.127.2023.09.05.10.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 10:20:55 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  5 Sep 2023 11:20:52 -0600
Message-Id: <20230905172052.891552-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693934456; x=1694539256;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TstPlL9yGGrCBt2r2aAZn0AF0x9vbjRNM66+sbziHSU=;
 b=FesJRighTPP22iOKOSvvwyd9jlHOh5srtslpJdor99VmLIoJCGFa3fUJjeo+07pxBq
 6kaj6avxw960PCuME4MbPBUnPiTM9fIOOZFvXvLWLS4ol71tD11c9rXZnmPGmMfekXL2
 GlKWclykP5HN/7gTXiuhlHDjRHiwPZov9yYoE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=FesJRigh
Subject: [Buildroot] [PATCH 1/1] package/zeromq: Fix building against gcc-13
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

`gcc-13` added an assert to standard headers to make sure custom
allocators have intended implementation of rebind type instead
of inherited rebind. gcc change:
https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=64c986b49558a7

Taken from upstream commit bdd471fa17100fe84f64da348951dab3ee4780bb

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../0001-define-missing-rebind-type.patch     | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 package/zeromq/0001-define-missing-rebind-type.patch

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
