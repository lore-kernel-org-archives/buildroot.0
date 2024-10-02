Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0148FCF8542
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90DCF41427;
	Wed,  2 Oct 2024 21:20:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C0WuugMmzttl; Wed,  2 Oct 2024 21:20:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B91104141D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B91104141D;
	Wed,  2 Oct 2024 21:20:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8BB891BF5EA
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B1A741C05
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UrM2WKao81XW for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:20:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C546941C02
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C546941C02
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C546941C02
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 21:20:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3F2C240002;
 Wed,  2 Oct 2024 21:20:33 +0000 (UTC)
Date: Wed, 2 Oct 2024 23:20:32 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20241002232032.39bf97d4@windsurf>
In-Reply-To: <20240926061512.13021-1-bernd@kuhls.net>
References: <20240926061512.13021-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727904033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fk6cxoPLKbdreulq0HulxqIAVYitK6CNCbP1LAqO+YQ=;
 b=FJBiMBi+sHElXPiQEeGxiGT8CvpkzpIHm1E/ra3EY+rT5Ks75L7B37Qt9L4OF8u0TsDrtq
 QHLcDwZeoE7WOxReB7j3Qua3Vpf4Xj02fJkw7ZD9hpuZQSmVxxViWzUFG/vwc/YawB0lNK
 1X1r6T28BZ52dzDcB5KkwYylctspN/kmvYt+BGfJTDi8IO2xApox7l3yOtuK0wdzGLplVr
 UJGzDBRy0giNjIBqbhs1sd4G2Yn0OUwN2DxG0VQt09GVwAFfNTmCBgKflOzHbCm0ZrWFsM
 lukbe7SOUs2MxTXva0ipZGVjKoKr7Jx8akeoqjCD2a48OiVPAIIeB3U3vvT1/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FJBiMBi+
Subject: Re: [Buildroot] [PATCH 1/2] package/libilbc: switch to github
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

On Thu, 26 Sep 2024 08:15:11 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> The previous repo is not available anymore.
> 
> Fixes:
> https://autobuild.buildroot.org/results/8c8b073ce163131763fca978b400e596fcf39e62
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> This patch is suitable to be backported to LTS releases.

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
