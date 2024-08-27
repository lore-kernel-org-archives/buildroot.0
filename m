Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A29C54731
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 16:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 318DE4064F;
	Tue, 27 Aug 2024 16:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W_1kr0fj_9md; Tue, 27 Aug 2024 16:44:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA63740654
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA63740654;
	Tue, 27 Aug 2024 16:44:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 746251BF4E5
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D9DD8056E
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RKnVe3rCR63j for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 16:44:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B037680549
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B037680549
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B037680549
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 16:44:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4B6660003;
 Tue, 27 Aug 2024 16:44:18 +0000 (UTC)
Date: Tue, 27 Aug 2024 18:44:18 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240827184418.61d18700@windsurf>
In-Reply-To: <ZswCynAhR6LqiAGJ@waldemar-brodkorb.de>
References: <ZswCynAhR6LqiAGJ@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724777058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BsL4uEkyg/MwTj7NOj7Gf5zReIAcIN7tM1HIy0oF7nM=;
 b=kclrw4YhdeLeXIRmAx0WfXsoHwtzv7qcz2Hjy0NPcICOye7F1OFPaMtwrV6460Oyk+YV3a
 WP5ZfcruXhve7+f5FkNN6inCmA/124ejsJRmjPAyS79fwrpQr7/19Ms8J+Tg70K6A7ltaG
 2XJ8pIMCEeMLw/GgItHfvMuZXFKTsBG20zHgeRAB1DRIbzACgXgrjT18NwYATAq7AWb9oH
 LhtoJ3CfxcxEXeSDaJcLbAJNMxOzLxaopvWRBx8XdIyqYe0iNaSCnP3GQB56RjOWISrGP2
 Xc8FF66MzwAQT7SzoglY43/oWa8PFtThoJjrqvbFpQeCmrPvPjNF4n9/wV4HOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kclrw4Yh
Subject: Re: [Buildroot] [PATCH next] package/wireshark: update to 4.2.6
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

On Mon, 26 Aug 2024 06:21:30 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> For release notes see following page:
> https://www.wireshark.org/docs/relnotes/wireshark-4.2.6.html
> 
> Support for QT6 was disabled in this update and could be
> added in a later commit.
> 
> Patch 0001 is upstream.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  .checkpackageignore                           |  1 -
>  ...-CMAKE_-EXE_LINKER_FLAGS-SYSROOT-if-.patch | 31 -------------------
>  package/wireshark/wireshark.hash              |  6 ++--
>  package/wireshark/wireshark.mk                |  4 +--
>  4 files changed, 5 insertions(+), 37 deletions(-)
>  delete mode 100644 package/wireshark/0001-cmake-lemon-wipe-CMAKE_-EXE_LINKER_FLAGS-SYSROOT-if-.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
