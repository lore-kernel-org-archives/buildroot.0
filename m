Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F87EC52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 14:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8A4681EE0;
	Fri, 23 Aug 2024 14:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rc-lT44SOU2G; Fri, 23 Aug 2024 14:52:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A42D81EF0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A42D81EF0;
	Fri, 23 Aug 2024 14:52:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7486C1BF345
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 14:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61C6740277
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 14:52:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TE9l35FwcTUy for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 14:52:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 12AE140129
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12AE140129
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12AE140129
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 14:52:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 876211BF204;
 Fri, 23 Aug 2024 14:52:14 +0000 (UTC)
Date: Fri, 23 Aug 2024 16:52:13 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20240823165213.50536c51@windsurf>
In-Reply-To: <20240823090030.2263352-1-aperez@igalia.com>
References: <20240823090030.2263352-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724424736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=leVcdHPnFPqD7MRvVi51g1Fgoiqs2dQGCyQj/mnYvJA=;
 b=YUGV7MGVHfMg/nA+lozvd3lH8ZYA0NBLnnHdHTVkciSMNC7uNcYGejj1CazEL0TOr373SQ
 WXggspYXrCPQkCo1GNQKlVN6UbXv1ooW7JQnlzcCGwt1tGyJuO1QPP/4se4I4mLa66hVfJ
 CyOUSJmHz4RdikvnLtXNkkik/vtiBiVte5g6CC0s29GeZc2cSA8U8b75lzmkCbWxUQOyHw
 DPDUfYgAXltypU8IaR7SmozPzV8SFzX3INZGsMMzlFCyEwecn6oeHC+uzSZRR2vIg95tu7
 V+xR87iMkNiiLiW5BEPFP1PV7BpWoebovp3P+95x/Jpy6wMEgDlTweKAjYxY+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YUGV7MGV
Subject: Re: [Buildroot] [PATCH] package/xdg-dbus-proxy: bump to version
 0.1.6
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

On Fri, 23 Aug 2024 12:00:28 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Maintenance release: fixes memory leaks, improves compatibility with
> sdbus, etc. Release notes:
> 
>   https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.6
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/xdg-dbus-proxy/xdg-dbus-proxy.hash | 4 ++--
>  package/xdg-dbus-proxy/xdg-dbus-proxy.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
