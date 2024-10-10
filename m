Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D51D2444F
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5525C415CC;
	Thu, 10 Oct 2024 21:37:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PR-XFqmuPppS; Thu, 10 Oct 2024 21:37:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92F9D41393
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92F9D41393;
	Thu, 10 Oct 2024 21:37:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 015A11BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E55CC81F77
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pf-D3gzajjnP for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:36:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D474081F71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D474081F71
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D474081F71
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:36:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F23F40007;
 Thu, 10 Oct 2024 21:36:30 +0000 (UTC)
Date: Thu, 10 Oct 2024 23:35:04 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241010233504.3e7d27fb@windsurf>
In-Reply-To: <20241009171508.3840258-1-james.hilliard1@gmail.com>
References: <20241009171508.3840258-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728596190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WpaNqsaZjSbODJPdelf624FFfdTv07XOSuhhF9JHV04=;
 b=ikePRdGbLMmtcujHJUBxx2egqg/5blA+SkPlgcZO/OjFrlVdiS04s1Ix87XyaUnkKpepmD
 vPE0E96v+kuMIqE9NjXQSnAWQoQxeL5NLhQgyHuGlNXcLQAIYvPBNN3koChqYvr6g3XMFX
 BYLfBnygbShwGBzd9L/3lSqEn21ZYgKdxcpiV3S9EmKHVeAzH3yh0MwrcuzOmfXEJ9s2tb
 heW/i38fji1AEsqg8Nc1Gb6Hu+zbvAwvfunE4HbPr2c0c0BQw9Gnggm7uyN4aflSkkcOI/
 Lm6hrcTX6PQKyXvvdzfH/ZJxzjmH2jCqhtwcvyROFNpMKv5d25xQ/mnbsn5MNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ikePRdGb
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pycryptodomex: bump to
 version 3.21.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  9 Oct 2024 11:15:08 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pycryptodomex/python-pycryptodomex.hash | 4 ++--
>  package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
