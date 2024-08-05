Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566E5C3DA4A
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 13:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0512C40286;
	Mon,  5 Aug 2024 13:49:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pj1DKbfGTtDY; Mon,  5 Aug 2024 13:49:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C51174023F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C51174023F;
	Mon,  5 Aug 2024 13:49:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D17C11BF334
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 13:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE7BF400D3
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 13:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QX1wO-4W1CEK for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 13:49:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 51AD640010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51AD640010
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51AD640010
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 13:49:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E2481C0006;
 Mon,  5 Aug 2024 13:48:57 +0000 (UTC)
Date: Mon, 5 Aug 2024 15:48:56 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20240805154856.41f06fb1@windsurf>
In-Reply-To: <20240805115224.3473431-1-aperez@igalia.com>
References: <20240805115224.3473431-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722865737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3IqoLKhieN3TjxuiOnUc4YEHDr2IcOQuMuvdpq0HPWA=;
 b=Er9MW23OwSxAtWPEMSGCIuCUkUm8NDaLflJsiaoVfXBMgoL8pdC3bPxyd4vVX6DieaeFaz
 g1z6rmcEMuVWJTK6AzvK0Fw7BIic5aYWpBoT0G3i3m5qIs2BZIftAI6/0Hnq/fDbSEpVib
 CuLewPBF7z/EIYU+Ea/M1SG7UTQiQy66IhNBEijC7lR4INfa0guQDRlQ5zhKecyFgoo/kA
 FNejIwVmM8kPdoUjpzQU8jQi57bsaq0kEDQU+6z6+QuoaSjE77T5plx0lkKRiwLFqnTTSC
 xVohSlT4+kr651p6zhOmijTlsxuIcT2iLMznzu6tC5QFw/r8+tEuQfP0ltFWPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Er9MW23O
Subject: Re: [Buildroot] [PATCH 1/1] package/libavif: security bump to
 version 1.1.1
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

Hello Adrian,

On Mon,  5 Aug 2024 14:52:22 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> The release notes for version 1.1.0 mention fixes for memory handling
> issues and bugs found out by fuzzing, which is the reason why this may
> be considered a security update, despite them not having CVEs assigned:
> 
>   https://github.com/AOMediaCodec/libavif/releases/tag/v1.1.0
>   https://github.com/AOMediaCodec/libavif/releases/tag/v1.1.1
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/libavif/libavif.hash | 2 +-
>  package/libavif/libavif.mk   | 9 +++++----
>  2 files changed, 6 insertions(+), 5 deletions(-)

This update breaks legal-info:

ERROR: while checking hashes from package/libavif/libavif.hash
ERROR: LICENSE has wrong sha256 hash:
ERROR: expected: 10952217a6d404de8bf8a997fbea9b88f682df1fe98cb9b9f467ade641525639
ERROR: got     : 165abf92cc04b39e80d29cadea7a6a7e8fddf59407d4ad2616507a7ebe8216f9
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

the hash of the license file needs to be updated, with an explanation
in the commit log detailing why the license file changed (especially to
confirm that there's no impact on the licensing conditions).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
