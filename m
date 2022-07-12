Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55240C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Jul 2022 16:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96D3C4018B;
	Tue, 12 Jul 2022 16:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96D3C4018B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UVBt0MbxQCTu; Tue, 12 Jul 2022 16:30:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C6B5401FB;
	Tue, 12 Jul 2022 16:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C6B5401FB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE3261BF3C8
 for <buildroot@lists.busybox.net>; Tue, 12 Jul 2022 16:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A833560C30
 for <buildroot@lists.busybox.net>; Tue, 12 Jul 2022 16:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A833560C30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xHUz35NbWCRB for <buildroot@lists.busybox.net>;
 Tue, 12 Jul 2022 16:30:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F45E600CD
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F45E600CD
 for <buildroot@buildroot.org>; Tue, 12 Jul 2022 16:30:18 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 9-20020a1c0209000000b003a2dfdebe47so4272200wmc.3
 for <buildroot@buildroot.org>; Tue, 12 Jul 2022 09:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a+ffjXRaXascOmXN6PtRnJNV/XJal2xHi05onDzg0Go=;
 b=0gbpyknp3HNevP5gTCvLOzILbmAupmRJ7AMT1fZLP3ROh6/NN4acB0zNYnKIeQSaQB
 0mDzm6uXq7NcEYwZf9itBSc9NViRTspWLJxM0dy2iUXwt+BY5v/bu1j6bzLBpOFFekzD
 6enpNpZRtsN3Lfg3GUCjQsfWrxIUrWb2LfFXDfe8+SfvxoJK98PCdwJPLXHjc2+QF3Aw
 SelqQ1RKh/rNIQrW7gw5GKmoN0fnrgcFVTFs22+IzrHz13N3aq7wY5n9zZ66V4NXHrVX
 OwgGgrfi3YbFNhKj9woxaNRf221RXBbmX/H19skR+Ydall8HFLaUejGBgL846OULdGO0
 9VHw==
X-Gm-Message-State: AJIora9CyVjfz0xeTe1yvSPT9/f/ULwy/WTqOR1vLOvX0A+pk1lqkgCx
 S0pW+re+Pb07F1dkMXuRy7iQZF2jidQ=
X-Google-Smtp-Source: AGRyM1tko3CjuUaFSLFvU3gylQthnEMhw9f0h9ehJiHsg1rwUL2uf+PgflJFNO2v5z2aH4BjjBBjxg==
X-Received: by 2002:a05:600c:4f05:b0:3a1:67df:a116 with SMTP id
 l5-20020a05600c4f0500b003a167dfa116mr4891160wmq.103.1657643416179; 
 Tue, 12 Jul 2022 09:30:16 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 bg30-20020a05600c3c9e00b003a2e86ef806sm6006051wmb.11.2022.07.12.09.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 09:30:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 12 Jul 2022 18:27:12 +0200
Message-Id: <20220712162712.1582871-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a+ffjXRaXascOmXN6PtRnJNV/XJal2xHi05onDzg0Go=;
 b=KW1C5Sjgscw4zfwqHb8npgt7v4sdR+2r4RfNzi+aLuQA7dtE66/kbSyw+HlaDxsXJk
 4VsunxTLEc2AUDgeM7oP5+o8vBNNuLHj7jDn3Pux34SCtCSqQp524NkEt7IPa/4ktArW
 ZPk0o41KEAHfL4jlO6LfttdSJX4Ht7zLG1hEA2rsh21QhpMMAAUw0k6yMSa3RTnfWz6d
 oOzmo30zAEIBRq3Sz5IGnR4ruYLssTA0vqL/KeNFkidYI0o/80f7+cP2pXeUSiIckjZB
 4bMSDOgPocf9jRvHEv5MAD0yjHJaAvyz8obd21eTxPhIhaq8qXnoq42bYwRcmXejGV1U
 BWNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KW1C5Sjg
Subject: [Buildroot] [PATCH 1/1] package/harfbuzz: fix build with gcc < 7
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc < 7 raised since bump to
version 4.4.0 in commit e186b4d89dcd3eb9fae557959181d7176e7c873c:

In file included from ../src/hb.hh:473:0,
                 from ../src/hb-buffer-verify.cc:27:
../src/hb-cplusplus.hh:170:13: error: specialization of 'template<class _Tp> struct std::hash' in different namespace [-fpermissive]
 struct std::hash<hb::shared_ptr<T>>
             ^

Fixes:
 - http://autobuild.buildroot.org/results/3fe7526b685368007ae0f66e15ef2b27d30d5063

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-cplusplus-Fix-build-on-GCC-7.patch   | 50 +++++++++++++++++
 .../0003-GSUB-Fix-build-on-GCC-7.patch        | 56 +++++++++++++++++++
 2 files changed, 106 insertions(+)
 create mode 100644 package/harfbuzz/0002-cplusplus-Fix-build-on-GCC-7.patch
 create mode 100644 package/harfbuzz/0003-GSUB-Fix-build-on-GCC-7.patch

diff --git a/package/harfbuzz/0002-cplusplus-Fix-build-on-GCC-7.patch b/package/harfbuzz/0002-cplusplus-Fix-build-on-GCC-7.patch
new file mode 100644
index 0000000000..de2955d8b5
--- /dev/null
+++ b/package/harfbuzz/0002-cplusplus-Fix-build-on-GCC-7.patch
@@ -0,0 +1,50 @@
+From 7b51bc95d9cf0d9a2e91a37319fa34e4e5f26927 Mon Sep 17 00:00:00 2001
+From: Kleis Auke Wolthuizen <github@kleisauke.nl>
+Date: Wed, 6 Jul 2022 12:58:15 +0200
+Subject: [PATCH] [cplusplus] Fix build on GCC < 7
+
+[Retrieved from:
+https://github.com/harfbuzz/harfbuzz/commit/7b51bc95d9cf0d9a2e91a37319fa34e4e5f26927]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/hb-cplusplus.hh | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/src/hb-cplusplus.hh b/src/hb-cplusplus.hh
+index 86d0452080..f06a32d912 100644
+--- a/src/hb-cplusplus.hh
++++ b/src/hb-cplusplus.hh
+@@ -166,8 +166,14 @@ HB_DEFINE_VTABLE (unicode_funcs);
+ 
+ } // namespace hb
+ 
++/* Workaround for GCC < 7, see:
++ * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=56480
++ * https://stackoverflow.com/a/25594741 */
++namespace std {
++
++
+ template<typename T>
+-struct std::hash<hb::shared_ptr<T>>
++struct hash<hb::shared_ptr<T>>
+ {
+     std::size_t operator()(const hb::shared_ptr<T>& v) const noexcept
+     {
+@@ -177,7 +183,7 @@ struct std::hash<hb::shared_ptr<T>>
+ };
+ 
+ template<typename T>
+-struct std::hash<hb::unique_ptr<T>>
++struct hash<hb::unique_ptr<T>>
+ {
+     std::size_t operator()(const hb::unique_ptr<T>& v) const noexcept
+     {
+@@ -187,6 +193,8 @@ struct std::hash<hb::unique_ptr<T>>
+ };
+ 
+ 
++} // namespace std
++
+ #endif /* __cplusplus */
+ 
+ #endif /* HB_CPLUSPLUS_HH */
diff --git a/package/harfbuzz/0003-GSUB-Fix-build-on-GCC-7.patch b/package/harfbuzz/0003-GSUB-Fix-build-on-GCC-7.patch
new file mode 100644
index 0000000000..d3355443b7
--- /dev/null
+++ b/package/harfbuzz/0003-GSUB-Fix-build-on-GCC-7.patch
@@ -0,0 +1,56 @@
+From 79eb0f74860fb6309e3162b4f17f98481c05a318 Mon Sep 17 00:00:00 2001
+From: Kleis Auke Wolthuizen <github@kleisauke.nl>
+Date: Wed, 6 Jul 2022 13:29:55 +0200
+Subject: [PATCH] [GSUB] Fix build on GCC < 7
+
+[Retrieved (and backported) from:
+https://github.com/harfbuzz/harfbuzz/commit/79eb0f74860fb6309e3162b4f17f98481c05a318]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/OT/Layout/GSUB/GSUB.hh     | 5 +++--
+ src/hb-ot-layout-gsub-table.hh | 8 ++++----
+ 2 files changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/src/OT/Layout/GSUB/GSUB.hh b/src/OT/Layout/GSUB/GSUB.hh
+index 372862e2bb..750dca1da3 100644
+--- a/src/OT/Layout/GSUB/GSUB.hh
++++ b/src/OT/Layout/GSUB/GSUB.hh
+@@ -5,9 +5,10 @@
+ #include "Common.hh"
+ #include "SubstLookup.hh"
+ 
+-using OT::Layout::GSUB::SubstLookup;
+-
+ namespace OT {
++
++using Layout::GSUB::SubstLookup;
++
+ namespace Layout {
+ 
+ /*
+diff --git a/src/hb-ot-layout-gsub-table.hh b/src/hb-ot-layout-gsub-table.hh
+index 1eca613b6a..50301ff1d9 100644
+--- a/src/hb-ot-layout-gsub-table.hh
++++ b/src/hb-ot-layout-gsub-table.hh
+@@ -32,9 +32,8 @@
+ #include "OT/Layout/GSUB/GSUB.hh"
+ 
+ namespace OT {
+-
+-using Layout::GSUB::SubstLookup;
+-using Layout::GSUB::ExtensionSubst;
++namespace Layout {
++namespace GSUB {
+ 
+ // TODO(garretrieger): Move into the new layout directory.
+ /* Out-of-class implementation for methods recursing */
+@@ -82,7 +81,8 @@ inline bool SubstLookup::dispatch_recurse_func<hb_ot_apply_context_t> (hb_ot_app
+ }
+ #endif
+ 
+-
++} /* namespace GSUB */
++} /* namespace Layout */
+ } /* namespace OT */
+ 
+ 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
