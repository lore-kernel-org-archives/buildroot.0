Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128CCC25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 20:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8ECF42555;
	Fri, 10 May 2024 20:11:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lFpMXJ0ZwgnS; Fri, 10 May 2024 20:11:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 654C04254B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 654C04254B;
	Fri, 10 May 2024 20:11:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FE891BF995
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A08B42544
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vff0c7nsi6wS for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 20:10:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CC52542541
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC52542541
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC52542541
 for <buildroot@buildroot.org>; Fri, 10 May 2024 20:10:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C73B40003;
 Fri, 10 May 2024 20:10:55 +0000 (UTC)
Date: Fri, 10 May 2024 22:10:54 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240510221054.6a3e81c3@windsurf>
In-Reply-To: <20240325130636.156426-1-buildroot@bubu1.eu>
References: <20240325130636.156426-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715371855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BrQldHk+twfBfQf5U36Q0ew3KNk9qv4G/dYEdJUFCY0=;
 b=aRXge5zluxqlWuT2cw50848uMW9eC+r97HBrNSznPb0qs5SWdt4SEl8MqeuP8HVOwidD43
 jiujlJq2WBDojJ5MM4QPnWLC+/35rWE8iFBb1h02EiEcVbQXdCPAyhVnn2mPNWcg8ufAkS
 4YKDU0I9NXDCs4EJzhi97gpROPlXinK+DYtQZNL+z6s5n6DgKN+e0mHt20Xw/5gJa4Fd4k
 LITcjcQC8tfMMOYeLnl9e87JWjM5LFmxpy5qTVDt2WEr/GoUnhBMa3CGz1nlhwi4qNqC6F
 nJNp10P793xsXOaTZRljrb+MOWWx55k71WNs3QJJKoVcwf2iBe/y5G7fUCNKlQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aRXge5zl
Subject: Re: [Buildroot] [PATCH 1/2] package/python-pytest: bump to 8.1.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 25 Mar 2024 14:06:35 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Remove no longer used attrs dependency (already since 7.3.0[1]).
> 
> Changelog:
> https://docs.pytest.org/en/stable/changelog.html#pytest-8-1-1-2024-03-08
> 
> [1] https://docs.pytest.org/en/stable/changelog.html#pytest-7-3-0-2023-04-08
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/python-pytest/Config.in          | 1 -
>  package/python-pytest/python-pytest.hash | 6 +++---
>  package/python-pytest/python-pytest.mk   | 4 ++--
>  3 files changed, 5 insertions(+), 6 deletions(-)

Series applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
