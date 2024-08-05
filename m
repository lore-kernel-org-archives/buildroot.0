Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D2BC3DA4A
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 07:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85B8B80DBD;
	Mon,  5 Aug 2024 07:19:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SUNMxdKoA5YV; Mon,  5 Aug 2024 07:19:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98A9380DBF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98A9380DBF;
	Mon,  5 Aug 2024 07:19:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1ECE81BF333
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 07:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CA4F402AA
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 07:19:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SKoyPwgsGzAr for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 07:19:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7670C402A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7670C402A8
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7670C402A8
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 07:19:09 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id E5D2635363D0; Mon,  5 Aug 2024 09:19:07 +0200 (CEST)
Date: Mon, 5 Aug 2024 09:19:07 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZrB864k8wPy8ljX9@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1722842347; bh=oL4vw1AqJ3WXYs7evFq2TXm2UwmiJQH6X49IQkNMN4w=;
 h=Date:From:To:Subject:From;
 b=QtYphTvPiJbuyNiezySDLpwqOmKLwqPAsNnvJDiDEN6Uhgmg/Prx8Awr4HIa7Sy55
 g4HcmmpsyHX0dLL4ZQrXc/WYgU74uT/AkFNEEp15cDkLGMtw2AiimXJKMbbkGItf7W
 01CBvl6Gvv7fTwjzTmICVy8gJw98CxxTMj3FW+HQ/rJKivlMj4HXDjrqAnOL9bBDpG
 wzHqKpHD1jMubPtNq+dNUcHh8APC6TAqOti+hOhYakR+4cIfNkEx0KK9aVRP8jiQQG
 5qmjDtf4JRcfYyE6zHA/6ijAXbZUEN1x+CcaibMHlzLOfs48MsXOS8fm0CkN500rVj
 fGX9qtNBsKNsw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=QtYphTvP
Subject: [Buildroot] [PATCH v2] package/fluent-bit: fix SSP compile issues
 with uClibc-ng
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Let's disable Security flags for the Buildsystem and
let it handled by Buildroot itself.

Fixes:
 - http://autobuild.buildroot.net/results/c9e/c9ed27a51a68429b2ed2d8eebb1afc919ecbead1/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1->v2:
  - use Buildroot security hardening flags and disable security
    flags in fluent-bit entirely (suggested by Thomas P.)
---
 package/fluent-bit/fluent-bit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 5463682e45..10e639a3d5 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -15,6 +15,7 @@ FLUENT_BIT_DEPENDENCIES = host-bison host-flex libyaml openssl
 FLUENT_BIT_CONF_OPTS += \
 	-DFLB_DEBUG=No \
 	-DFLB_RELEASE=Yes \
+	-DFLB_SECURITY=No \
 	-DFLB_EXAMPLES=No \
 	-DFLB_CHUNK_TRACE=No \
 	-DFLB_PREFER_SYSTEM_LIBS=Yes \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
