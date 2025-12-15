Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DE6D5B870
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0BDE81DE3;
	Mon, 15 Dec 2025 21:37:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ECljKmmJIoDO; Mon, 15 Dec 2025 21:37:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3DE581DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765834632;
	bh=F+65aYtP0yJHJu1Z4wbRQJca6B8OwBDVHwfHBHdgBlw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ifgYUZSkcB8abOHUP2Nwn+wtObvivkJxyxjHjSJk/nUt1QzCOQwvVCZ56/pNW9LPI
	 tliOOofsq70ClWUcNcWnvtW1SEg4TS3Ix9oGpcJAKFRQg0RR87DPRo6m2KF0NBsHx6
	 Hz8p0AhPnB2PxybdEU2KrRPz+47MqCce2iNVfwxLnz5oITG9JNwS9gdmyEa0O4LvkN
	 fcSPXBXCelLBCpZxLgra6w71yN24Fr2EYqBGjEM/ZSZFMV5UnaGFqyh+g9iO5Ll0IV
	 AD1l2isbdI0vWge5ZxPDEz5k6xy+jC637hyGX6nurlhnqiwSOyEbosBCg23JtExx6Y
	 PBgPJovMB5edw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3DE581DE5;
	Mon, 15 Dec 2025 21:37:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 411DF117
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2788281DE5
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CSsab-PIjD4H for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:37:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0CB5181DE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CB5181DE3
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CB5181DE3
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:37:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 956064E41C13
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:37:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4D5D460664;
 Mon, 15 Dec 2025 21:37:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 098CE11940E73; Mon, 15 Dec 2025 22:37:04 +0100 (CET)
Date: Mon, 15 Dec 2025 22:37:03 +0100
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Grim Delcour <grim.delcour@barco.com>
Message-ID: <20251215223703.53475301@windsurf>
In-Reply-To: <20251207201705.4154936-1-thomas@devoogdt.com>
References: <20251207201705.4154936-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765834625; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=GJFhdjTpsGM3lJhMqzEISTbQxoKsuoeXfCdSxVlzpi4=;
 b=ObIqILwzPM6qW0hr2d/w2cdy72+EQTg62BKfJpQ8NKQVN0TrL/dyDdJOMy+ybbhgrzWjhw
 Ehewkb6yg+v8dGuXST+hv0cNAP0arr6FBSdgHUX5hvZEJujU5DftYi1yQ8gdjtrZB0io29
 v5Y3FEE/rC0PTURSxGLflYxN8enW9/G8uS9ROFfIXUAb59RNQeH3crm36muSgUNABA5WPG
 j8e52wyEzmh3SoA0/8fpbRI/FtlpbfWiLDBWBCnNDFQpIa13O4zxZjwsK3Kr1bF8nJr9jR
 CJJGUZH9pBJ6KUIgt/AfFV6tE03zyN0nFLb8VLSaWu7mFCTNiq4N8UdiwuqCpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ObIqILwz
Subject: Re: [Buildroot] [PATCH] package/fluent-bit: bump to 4.2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Dec 2025 21:17:05 +0100
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> This is a major release that introduces new features,
> including one highlighted in the release notes:
> 
> "The v4.2 release introduces a powerful new Direct Routing
>  capability that allows inputs to specify routes directly to
>  outputs, bypassing the traditional routing mechanism."
> 
> But it also brings some security fixes. Not all of
> them are relevant, but some piece of lecture can be found here [1].
> 
> News:
> - https://fluentbit.io/announcements/v4.1.0/
> - https://fluentbit.io/announcements/v4.1.1/
> - https://fluentbit.io/announcements/v4.2.0/
> 
> The patch 0001-plugins-kafka-fix-cmake-cross-compile-error.patch
> can be dropped as it has been merged upstream [2].
> 
> [1] https://www.theregister.com/2025/11/24/fluent_bit_cves/
> [2] https://github.com/fluent/fluent-bit/pull/9600
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> ---
>  ...ibrdkafka-only-require-a-C-compiler.patch} |  2 +-
>  ...-kafka-fix-cmake-cross-compile-error.patch | 47 -------------------
>  package/fluent-bit/fluent-bit.hash            |  2 +-
>  package/fluent-bit/fluent-bit.mk              |  2 +-
>  4 files changed, 3 insertions(+), 50 deletions(-)
>  rename package/fluent-bit/{0002-lib-librdkafka-only-require-a-C-compiler.patch => 0001-lib-librdkafka-only-require-a-C-compiler.patch} (98%)
>  delete mode 100644 package/fluent-bit/0001-plugins-kafka-fix-cmake-cross-compile-error.patch

Applied to master after listing the CVEs fixed, and updating the title
to indicate that this is a security bump.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
