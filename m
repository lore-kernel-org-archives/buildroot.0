Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E60C3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 20:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBCD36080E;
	Mon, 12 Aug 2024 20:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g_OacgEj1Fmv; Mon, 12 Aug 2024 20:14:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6A886080F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6A886080F;
	Mon, 12 Aug 2024 20:14:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7690C1BF344
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 716A06080F
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:14:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gGVGWTbkYwi3 for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 20:14:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3692F6080E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3692F6080E
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3692F6080E
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 20:14:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 827381BF203;
 Mon, 12 Aug 2024 20:14:49 +0000 (UTC)
Date: Mon, 12 Aug 2024 22:14:48 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240812221448.40e4d87a@windsurf>
In-Reply-To: <ZrhLQMty5kRy7Oo4@waldemar-brodkorb.de>
References: <ZrhLQMty5kRy7Oo4@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723493689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p4lBoXV4mNhkHj/zqJmj/xanumlLjOYLnwpc6LsnA44=;
 b=Ku4KZ21usfyAeUwqX12q1jX7ABFxMUsaC30LupbHplgEIYxriU2z3VA6acmQz0VlfzItdk
 RjZx0YLBv7CN2o09QVAoJy0uSH3Gnz8MYw3opDiCiRqRsSCg8nSdH9LceiXBhUuN3Y6hVJ
 k/NvV3tStbLNgfUlVotOAlpMKQpCNK/X8bqswc/DaVVxJwDpAgFkcK3ppjUtZsVE3civ/9
 ORXf5TkZs8o4cVcqVwqVW03mPDR7P038KlbjqHQOGG3UfzyJwHsHrEpZIN7wyDiRjGhRx9
 Irpzk/D2KWEdIGKzQRLclhM+D4zyX85b/tQtPSUCOvVxaAfjxccmhyn+Ju/GEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ku4KZ21u
Subject: Re: [Buildroot] [PATCH next] package/hiawatha: update to 11.6
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Waldemar,

On Sun, 11 Aug 2024 07:25:20 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> See here for a changelog:
> https://hiawatha.leisink.net/changelog
> 
> Update Config.in to use the new homepage.
> Update download site to use the new homepage.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/hiawatha/Config.in     | 2 +-
>  package/hiawatha/hiawatha.hash | 2 +-
>  package/hiawatha/hiawatha.mk   | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)

You're going to hate me, but this bump also doesn't build.

Try to build:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_HIAWATHA=y
# BR2_TARGET_ROOTFS_TAR is not set

Successful before your bump, fails after your bump.

Also, it is worth nothing that there is also an issue with the 11.2
version of hiawatha: the hash we have in Buildroot no longer matches
the one from the upstream tarball:

ERROR: while checking hashes from package/hiawatha/hiawatha.hash
ERROR: hiawatha-11.2.tar.gz has wrong sha256 hash:
ERROR: expected: 99c64f76927f93469f062ab76b74eb79a397ea4be12da86bf746b2bb57cf1bc5
ERROR: got     : e00a659225b5f201b1fd81014277bcfe96da476a165f92fc057f3d7036c8b993
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

It "works" because we fallback to sources.buildroot.net, which has the
"right" tarball, but it would be nice to understand what's going on.

Could you have a look?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
