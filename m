Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AD4C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D5C2408EF;
	Sat, 13 Jul 2024 14:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XZTcVbKr-4iL; Sat, 13 Jul 2024 14:26:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10765410B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10765410B0;
	Sat, 13 Jul 2024 14:26:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DEF511BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9FB481E80
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:26:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vsv_tvJIUo7O for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:26:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6FA5181E76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FA5181E76
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6FA5181E76
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:26:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86C771BF204;
 Sat, 13 Jul 2024 14:26:16 +0000 (UTC)
Date: Sat, 13 Jul 2024 16:26:15 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240713162615.42294a06@windsurf>
In-Reply-To: <ZpJIyk4HUUwuvaTE@waldemar-brodkorb.de>
References: <ZpJIyk4HUUwuvaTE@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720880776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j9fe+4NF/9kerOji4A1CHEUggXi6CGztnBsgfWiwr/o=;
 b=gdTZrFJ6ZX9kZL1ya4kEt03d3Cn3GAP6Yofjpt5U/v9h6vJegaLFje/nOVw47I8iuBS5Bm
 9VQTPKoaWDZNfkKtBDSxPICcUrRYolOoGimmb+Vy7UphE1HEkEf2c9PKGcSBmYSHEj2hiQ
 PcmXPkEHu085qO1VWnJ+c82QJbw17yN3MTY1iyFnaiIyZq0V6E7YlT52Ml0SyeIJunR+Ip
 dr/+iErPpslJPZ0LB7BmAxHHgBt/5lpVT3w7NJW7dkiVQXADSBYY+mnIbRwh94bv9+69ix
 nJPY7El/hePx7Ah+4xp+JOPhuk3P0+bAPEQV+P1acg8TJR3S/T7D1dsLI7Mg8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gdTZrFJ6
Subject: Re: [Buildroot] [PATCH] package/squid: update to 6.10
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

On Sat, 13 Jul 2024 11:28:42 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> The ESI feature is now disabled by default. Use --enable-esi if needed.
> 
> See here for other changes:
> https://github.com/squid-cache/squid/commits/v6
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/squid/squid.hash | 8 ++++----
>  package/squid/squid.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
