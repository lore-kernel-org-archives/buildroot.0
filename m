Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C738CCD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 07:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E25080F0E;
	Sat, 30 May 2026 07:39:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yVMTOpFUDNcf; Sat, 30 May 2026 07:39:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D8638103B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780126768;
	bh=dLkhZ+6Zmrgh0JEge6730IRYHjWi30o9c7Deum0jn70=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a84XjdRUn0z5Z8sgrME/FfQI1aaMv4UxOCVxl2Kd/f3rFbFg7FnrS1JZUhhLKY3DD
	 ieCeHbGobiw35OueFEqllYLOS2EPJhZjrakWHKr3F0bkA+W12oTOkw45/gFdL5gVWn
	 xKhnXaN9vae+E2kTQcqkXNikzGlXsasuKUEp7T736Ii+f5lknNfuoEjr6SRP3WmGqO
	 EzjqSe5DNlTiUV1O6O7V8XwH+2/kesxspNayMtYtyvwWWY9m/sSeV6ZTKXeZYNpmD/
	 o/nVef1A1H+r4+o3j6NBKUzw+77gPQC2i+59N88DyZg6jz+Aa+TWZBS/hPFS5z4aQw
	 /X8aOW2Mv73zA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D8638103B;
	Sat, 30 May 2026 07:39:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B4016D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 07:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CE8880F0E
 for <buildroot@buildroot.org>; Sat, 30 May 2026 07:39:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qK3J9KUuq3xa for <buildroot@buildroot.org>;
 Sat, 30 May 2026 07:39:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CDB3680E97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDB3680E97
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDB3680E97
 for <buildroot@buildroot.org>; Sat, 30 May 2026 07:39:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4853FA4C344A;
 Sat, 30 May 2026 09:39:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41486)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTEHy-000000007Uj-1Hka;
 Sat, 30 May 2026 07:39:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 30 May 2026 09:39:21 +0200
Message-ID: <20260530073921.263279-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780126762;
 bh=esC/bGmfo3SSbtGZKa4d/UKf6P8eiHGmoHZa8r6exzM=;
 h=From:To:Cc:Subject:Date:From;
 b=UqgIIUDarifcQ35YD+hkJqlKRHI9bgrJqAAbCQOM7dvflhgCZEAgE6yS4vcmI3G6Q
 S8DoUM9xPmzmx3Wf3iGEBut5NjyFFEGbNhs58PbWgxoDwz0MxyF01Rl5M7GzJX+G9D
 KmGjW47ZPYYk+NsGQemqVHjOXPGixFZocvYnVqKt5iFz3FyKZyhgDjbXWPxWVuPp93
 iPkiONRbILIGyFU2KUPzhYCzIMzeoCOnmbsTOD9mq/VCTDBjJ1gTPzcLhk0BJkRiRX
 +Du1fuOkF9pD65npb2OvJFALXbfCo1BilkZ4mOae4usW+ATjrP2cVaEm++ZoLvTCjy
 h38Owk8TZgnpQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=UqgIIUDa
Subject: [Buildroot] [PATCH 1/1] package/flatbuffers: bump version to
 25.12.19-2026-02-06-03fffb2
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

https://github.com/google/flatbuffers/releases/tag/v25.12.19-2026-02-06-03fffb2
https://github.com/google/flatbuffers/releases/tag/v25.12.19
https://github.com/google/flatbuffers/releases/tag/v25.9.23

Rebased patch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines pass with the exception of an ICE on
bootlin-m68k-5208-uclibc:
https://gitlab.com/bkuhls/buildroot/-/commits/c1d1e048d1e6a2ac9c19eb27582c77f9512391a5

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
index e7174e326e..ed4202514d 100644
--- a/package/flatbuffers/flatbuffers.hash
+++ b/package/flatbuffers/flatbuffers.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b9c2df49707c57a48fc0923d52b8c73beb72d675f9d44b2211e4569be40a7421  flatbuffers-25.2.10.tar.gz
+sha256  ccbce58684691de1e7d51f5e87786266b37d06ab66e9dfe2d0ec106fe50aace0  flatbuffers-25.12.19-2026-02-06-03fffb2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
index d49d01161d..ca0d5fa225 100644
--- a/package/flatbuffers/flatbuffers.mk
+++ b/package/flatbuffers/flatbuffers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLATBUFFERS_VERSION = 25.2.10
+FLATBUFFERS_VERSION = 25.12.19-2026-02-06-03fffb2
 FLATBUFFERS_SITE = $(call github,google,flatbuffers,v$(FLATBUFFERS_VERSION))
 FLATBUFFERS_LICENSE = Apache-2.0
 FLATBUFFERS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
