Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AB5C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 17:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD97540137;
	Thu,  9 May 2024 17:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6V4DJ0-Zrtf1; Thu,  9 May 2024 17:23:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79CBC401F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79CBC401F6;
	Thu,  9 May 2024 17:23:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 259321BF2F0
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 17:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1054E83D86
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 17:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zrW8WpDNfxOH for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 17:23:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1BE0683D77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BE0683D77
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BE0683D77
 for <buildroot@buildroot.org>; Thu,  9 May 2024 17:23:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 0A5E6FF808;
 Thu,  9 May 2024 17:23:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu,  9 May 2024 19:23:24 +0200
Message-ID: <20240509172325.1493586-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715275407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=04NqKFG3/CfCFxNuaLTaHp32gB+LTxyxMQhuNGf/cpw=;
 b=A73X+t3e/4pVe+h+RZ+NQaqtWx9HbX2BZw2stkqaVIeSCgAHncZ1mAI9I3ma4dMugQWkC2
 eEoDnYbgBrrvrS+gMtFSYeYk8f7OCopRYyD9lgweFduQ98HOw37uot8m/jj9ZEo7K/ev8k
 Jb51UyWMIdVwbjWMTZu8qWecwvRlvwtOGViW/SwKpjqn7ohPe+8VI39oMccFVGZYyTejZG
 dwAnmiYY+2CUhE9tYZedQtiJ3Lefq4eh4ZlycRH0JayI95A5BtSZid3qox6rwmcz0pje2f
 A6v/y1GXNGDQMMT47SPmDaTuV2wvT5BPfrkQKdhU88nrcK9AeZobUWTrj6ezig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A73X+t3e
Subject: [Buildroot] [PATCH] package/pkg-generic.mk: really make DL_SUBDIR
 inheritance work
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While bumping kodi, we figured out that the kodi-texturepacker and
kodi-jsonschemabuilder were both re-downloading the main Kodi tarball,
even though they contain:

KODI_JSONSCHEMABUILDER_DL_SUBDIR = kodi
KODI_TEXTUREPACKER_DL_SUBDIR = kodi

Both are host packages, and turns out that changing those variables to
HOST_ ones made the download sharing work.

Commit efa7712b092950c92f994e2ee30c120a64e5451b ("package/pkg-generic:
host variant inherits target download settings") introduced
inheritance of host variables from target variables from a number of
variables, including DL_SUBDIR. But it missed the fact that earlier in
pkg-generic.mk, the following line was defined:

  $(2)_DL_SUBDIR ?= $$($(2)_RAWNAME)

So, when this later code kicked in:

 ifndef $(2)_DL_SUBDIR
  ifdef $(3)_DL_SUBDIR
   $(2)_DL_SUBDIR = $$($(3)_DL_SUBDIR)
  endif
 endif

In fact it never did anything because $(2)_DL_SUBDIR would never be
undefined. This commit fixes this issue by properly adjusting the
logic to inherit the value of the target variable when it exists, or
defaulting to $$($(2)_RAWNAME) otherwise.

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 577a148c1e..a2749320c3 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -525,7 +525,6 @@ endif
 
 $(2)_BASENAME	= $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
 $(2)_BASENAME_RAW = $$(if $$($(2)_VERSION),$$($(2)_RAWNAME)-$$($(2)_VERSION),$$($(2)_RAWNAME))
-$(2)_DL_SUBDIR ?= $$($(2)_RAWNAME)
 $(2)_DL_DIR = $$(DL_DIR)/$$($(2)_DL_SUBDIR)
 $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASENAME)
 
@@ -538,6 +537,8 @@ endif
 ifndef $(2)_DL_SUBDIR
  ifdef $(3)_DL_SUBDIR
   $(2)_DL_SUBDIR = $$($(3)_DL_SUBDIR)
+ else
+  $(2)_DL_SUBDIR = $$($(2)_RAWNAME)
  endif
 endif
 
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
