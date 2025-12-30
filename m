Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DEEEE0203
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 21:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1D9160BB6;
	Tue, 30 Dec 2025 21:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XKdhdWDjI3Uj; Tue, 30 Dec 2025 21:06:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37BC460BBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767128790;
	bh=x2HsYMMejLyKgWhE8jr10hLOGGdR9dJjBFLT13TGDV4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hDcb0AmuLgylnOyUIC+ZZ56FTvE/zPH6RaRW4SgG+un/Y3bLU/CY0pHEmR3xbqkYQ
	 ioNsWmeOHTDLgpfLFmA05Hwa6hbcsLwWGvQcAyYIthE+K8gE5aV9muU2Rq6Fv1Y/Au
	 lyLZBbp9Nm33o+d1wqP84L8xfNuz5OhgqUq3CRRqhZIMfLcR5DaIlnUVmLj6NLZIGP
	 +WNh1mCVWv7uAxluuyvGo6jiUAxLo62O4zbJAC1gXzi/VVZOj8/7QCnrCb8QPg7Kd2
	 mwnZRhQe/CVHxkSL+ibiQ194N9tGOIzVvvoxxI6Q72tP/iiV/ucOepsxMZVIY2Kz0i
	 +6Nh9nUsE5FUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37BC460BBB;
	Tue, 30 Dec 2025 21:06:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BA1CD8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31EA1405C1
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQPfXudz-JBQ for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 21:06:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0097B405C9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0097B405C9
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:06:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F068687CA9; Tue, 30 Dec 2025 21:06:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 21:51:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d10726a1a1c60f934ef7022d188eb231ea174fb0
X-Git-Newrev: b79eb5a28f50b54078eff5c92fb2c00ac05a2882
X-Patchwork-Hint: ignore
Message-Id: <20251230210621.F068687CA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webkit: fix gcc >= 14.x
 build issue
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b79eb5a28f50b54078eff5c92fb2c00ac05a2882
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add another patch from Fedora, also used in Arch Linux to fix a gcc >=
14.x build issue:

build/qt5webkit-5.212.0-alpha4/Source/WebCore/page/csp/ContentSecurityPolicy.cpp:235:56:   required from here
  235 |             if ((policy.get()->*allowed)(std::make_pair(algorithm, digest)))
      |                                          ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
host/opt/ext-toolchain/aarch64-buildroot-linux-gnu/include/c++/14.3.0/type_traits:1246:52: error: non-constant
condition for static assertion
 1246 |       static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ore-page-csp-ContentSecurityPolicy.cpp-fi.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/qt5/qt5webkit/0013-Source-WebCore-page-csp-ContentSecurityPolicy.cpp-fi.patch b/package/qt5/qt5webkit/0013-Source-WebCore-page-csp-ContentSecurityPolicy.cpp-fi.patch
new file mode 100644
index 0000000000..ab6137dd28
--- /dev/null
+++ b/package/qt5/qt5webkit/0013-Source-WebCore-page-csp-ContentSecurityPolicy.cpp-fi.patch
@@ -0,0 +1,45 @@
+From 286e0280a55949d62b2163d68c827539c141d487 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 28 Dec 2025 18:35:45 +0100
+Subject: [PATCH] Source/WebCore/page/csp/ContentSecurityPolicy.cpp: fix build
+ with gcc >= 14.x
+
+Fixes:
+
+/home/thomas/buildroot/br/output-all/build/qt5webkit-5.212.0-alpha4/Source/WebCore/page/csp/ContentSecurityPolicy.cpp:235:56:   required from here
+  235 |             if ((policy.get()->*allowed)(std::make_pair(algorithm, digest)))
+      |                                          ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
+/home/thomas/buildroot/br/output-all/host/opt/ext-toolchain/aarch64-buildroot-linux-gnu/include/c++/14.3.0/type_traits:1246:52: error: non-constant
+condition for static assertion
+ 1246 |       static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
+      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
+
+Patch used in Fedora and Arch Linux:
+
+  https://src.fedoraproject.org/rpms/qt5-qtwebkit/raw/rawhide/f/qtwebkit-fix-build-gcc14.patch
+  https://aur.archlinux.org/packages/qt5-webkit
+
+Upstream: dead
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ Source/WebCore/page/csp/ContentSecurityPolicy.cpp | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Source/WebCore/page/csp/ContentSecurityPolicy.cpp b/Source/WebCore/page/csp/ContentSecurityPolicy.cpp
+index 9e726d5fe10c..989a59a6122f 100644
+--- a/Source/WebCore/page/csp/ContentSecurityPolicy.cpp
++++ b/Source/WebCore/page/csp/ContentSecurityPolicy.cpp
+@@ -231,8 +231,9 @@ bool isAllowedByAllWithHashFromContent(const CSPDirectiveListVector& policies, c
+         auto cryptoDigest = CryptoDigest::create(toCryptoDigestAlgorithm(algorithm));
+         cryptoDigest->addBytes(contentCString.data(), contentCString.length());
+         Vector<uint8_t> digest = cryptoDigest->computeHash();
++        ContentSecurityPolicyHash hash = std::make_pair(algorithm, digest);
+         for (auto& policy : policies) {
+-            if ((policy.get()->*allowed)(std::make_pair(algorithm, digest)))
++            if ((policy.get()->*allowed)(hash))
+                 return true;
+         }
+     }
+-- 
+2.52.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
