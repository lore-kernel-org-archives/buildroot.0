Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D197E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 14:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EC6680E3F;
	Sun, 28 Dec 2025 14:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GsFeZKZQe34U; Sun, 28 Dec 2025 14:48:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CBDB81026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766933330;
	bh=5EJ0Qx0DpsjGOuEhVMFhukEQHyysc0iBY+lpHw7pY+E=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=LWith9s0vuLdUXPYiApbQwJrt2dsLUuM+CdCcPEFz8swaUZDS7f5JgJD2bzG2csn1
	 IIURxaMhUIYem8+P+BBzac2ILYu372NsZ0LCq5fZoB4QXsMEbg8y7QclJ/JsAf/sn/
	 TwiqM3v2UFfMWrLffFUECtuDAHjS/RiLzBCajlc7OtonPQ5HBoU4GtEUI1/HhLY2iH
	 ySBPb7QcVW4sCNVgdb0yU5EUkINE32RlG2vkHSykRiTzLqH8bFQuWt0R5Iq7SIGszE
	 eNO0zyeTBEPYgXvT5uHH9c1FoQimonqblyEKhU6/30Mffg71bvM/wKfytQddw4MJet
	 Vy5J4GrYO46Mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CBDB81026;
	Sun, 28 Dec 2025 14:48:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CF541E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 14:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2955B6081F
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 14:48:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9PFYS7weersc for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 14:48:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 45F616075E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45F616075E
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45F616075E
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 14:48:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 5A46B1A24C6;
 Sun, 28 Dec 2025 14:48:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2F5BB60725;
 Sun, 28 Dec 2025 14:48:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5CFEC11978DFD; Sun, 28 Dec 2025 15:48:43 +0100 (CET)
Date: Sun, 28 Dec 2025 15:48:42 +0100
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20251228154842.29feb75b@windsurf>
In-Reply-To: <20251201112621.242137-1-thomas@devoogdt.com>
References: <877bv7ii70.fsf@dell.be.48ers.dk>
 <20251201112621.242137-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766933324; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6WJ53zJPwVVDs2CvAdaKYdafUTPLPXY0Qurehf1Pf1s=;
 b=Ohx4swS/q/+Xz3vXV3adlJYCWaKbQCePxFqd0G3dNcvEG7K6yJIi6ezqKlBynqxcWURkdO
 caX+AICPIYeAPpy93aEXKiUTcHK+JSLp+b1CgUXbk59Tj6yNWAY+uQVoK5SPunKRhKwXYo
 5nLadPRVX2D4BLNjUNVGf0Owgi1pGr6qZ5r62Fu7mANKjGz6Oal3NAxjq7qGdOLUD85j43
 pgvhzRFiWOWpW/PKa344UjGT7mSPm+dvMuhZXd6wu6BbXJrVJYM2nEuP+rkvYbB/0iP9K6
 hGnyyGd8kk/xaKIt7gv2y9B5RRhKNSJqqNTa8YEMbcOhjMl/XpgW8phE8j/uQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Ohx4swS/
Subject: Re: [Buildroot] [PATCH v2 1/2] package/yq: add new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: thomas.devoogdt@barco.com, christian@aperture.us, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Mon,  1 Dec 2025 12:26:20 +0100
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 
> Version 4.45.2 was selected as newer versions require Go 1.24 [1],
> which is not yet available in Buildroot 2025.02.x.
> 
> [1] https://github.com/mikefarah/yq/commit/5bc2cd03da9139160db70901ffb8002bf6e242d5
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Thanks, both patches applied, but squashed into a single patch. Indeed,
there's no point in adding a new package and bumping it right after.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
