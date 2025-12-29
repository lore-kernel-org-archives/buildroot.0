Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE970E8FDB1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 08:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC213404F5;
	Mon, 29 Dec 2025 08:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2MGzmx8uOtFi; Mon, 29 Dec 2025 08:48:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ED39404F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766998102;
	bh=Sc3KSrz1cwtbx3R2paDgYmHX9J5Q0Zkzu1ZQ2gz6gV4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LCI2vXJ60AcDCmvBHB5ozMgf2pj9wlJ5MHpGvflC3oswE8itHRD0cL2glfsIsuEWG
	 7GoVR7suoLh0sjRl+6Z/t3zJuxucK4dgqhUsweaImmA/al5y35z+u+eq23jVQE2Z87
	 pC85x9eACRld7bekZfaSdHwj6p9qLkbznZ+ft1vU4/JcBZAMmw4i5r0W9ljqQIJbN6
	 FOWQdrpZEjPXIUbsB2P+KQkxV+kbx/f7iKx3yYprtbxaIMNDS/FsXZ/1O3afJSgaRZ
	 2FWVMS5ycR6F2O9rMi5fWD2K3IVQDRQ/1/GnBQ6jUSkrIG0vjjoLVZzTL7/C6UPzTI
	 LiTH0yA4CXFIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ED39404F6;
	Mon, 29 Dec 2025 08:48:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CD838D8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 08:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3B0E813AB
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 08:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGFd3hfAnWx4 for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 08:48:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD9718136D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD9718136D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD9718136D
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 08:48:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0C80CA4C0C55;
 Mon, 29 Dec 2025 09:48:18 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55792)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1va8vJ-000000002tg-0lUS;
 Mon, 29 Dec 2025 08:48:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 29 Dec 2025 09:48:17 +0100
Message-ID: <20251229084817.841995-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766998098;
 bh=2IiRYloLztHbZrOFCThKg5vJqfj6JUbhHR5anKnGQ6o=;
 h=From:To:Cc:Subject:Date:From;
 b=eOMNI1V0273Envx2+6U/0cSHSqEz3iG3/OMNqGDddO/apMQ6WtpPxmbc/mjqzp2qv
 g5sbFjgEWsnN3lD8Nts/2gndez8Iam3dKKQRgLKGjAPM6arBl9bZFnSduTtE4bfHqi
 0prqAS/ls/rrxEBqD/v48oQWvTDdYtDs2UWTXwadkF1jkJVo4ljA/2w14unoHiiuXs
 jCbF1nTuEq1oN/NXQDtpdSZbtIzUo0IyoOv6BDMMl/1gdjcQQIazHp95mwXhxuMGcT
 EhJA7Ly7ll5YpEwLmvLdC3CBtdqaRW6v/gGlg942kApzFuZKFnqxLeW6nlblNH24aV
 Z1O3FstQuzE+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=eOMNI1V0
Subject: [Buildroot] [PATCH 1/1] package/flatbuffers: bump version to
 25.12.19
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/google/flatbuffers/releases/tag/v25.12.19
https://github.com/google/flatbuffers/releases/tag/v25.9.23

Rebased patch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...001-include-flatbuffers-base.h-fix-build-on-musl.patch | 8 ++++----
 package/flatbuffers/flatbuffers.hash                      | 2 +-
 package/flatbuffers/flatbuffers.mk                        | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch b/package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch
index 872db03045..d409cd1fe5 100644
--- a/package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch
+++ b/package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch
@@ -31,7 +31,7 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Upstream status: Rejected:
  https://github.com/google/flatbuffers/pull/6773]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-(rebased and added fix for uClibc-build, rebased again for 24.3.25)
+(rebased and added fix for uClibc-build, rebased again for 25.12.19)
 ---
  include/flatbuffers/base.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -41,13 +41,13 @@ index de7898dc..101c7598 100644
 --- a/include/flatbuffers/base.h
 +++ b/include/flatbuffers/base.h
 @@ -270,7 +270,8 @@ namespace flatbuffers {
-   // strtoull_l}.
+   // strtoull_l} on platforms that support them.
    #if (defined(_MSC_VER) && _MSC_VER >= 1800) || \
-       (defined(__ANDROID_API__) && __ANDROID_API__>= 21) || \
+       (defined(__ANDROID__) && defined(__ANDROID_API__) && __ANDROID_API__>= 26) || \
 -      (defined(_XOPEN_VERSION) && (_XOPEN_VERSION >= 700)) && \
 +      (defined(_XOPEN_VERSION) && (_XOPEN_VERSION >= 700) && \
 +        defined(__GLIBC__) && !defined(__UCLIBC__)) && \
-         (!defined(__Fuchsia__) && !defined(__ANDROID_API__))
+       !defined(__Fuchsia__)
      #define FLATBUFFERS_LOCALE_INDEPENDENT 1
    #else
 -- 
diff --git a/package/flatbuffers/flatbuffers.hash b/package/flatbuffers/flatbuffers.hash
index e7174e326e..3964caf2fe 100644
--- a/package/flatbuffers/flatbuffers.hash
+++ b/package/flatbuffers/flatbuffers.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b9c2df49707c57a48fc0923d52b8c73beb72d675f9d44b2211e4569be40a7421  flatbuffers-25.2.10.tar.gz
+sha256  f81c3162b1046fe8b84b9a0dbdd383e24fdbcf88583b9cb6028f90d04d90696a  flatbuffers-25.12.19.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
index d49d01161d..75c2e58794 100644
--- a/package/flatbuffers/flatbuffers.mk
+++ b/package/flatbuffers/flatbuffers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLATBUFFERS_VERSION = 25.2.10
+FLATBUFFERS_VERSION = 25.12.19
 FLATBUFFERS_SITE = $(call github,google,flatbuffers,v$(FLATBUFFERS_VERSION))
 FLATBUFFERS_LICENSE = Apache-2.0
 FLATBUFFERS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
