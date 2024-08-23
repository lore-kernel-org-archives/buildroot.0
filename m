Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B80C531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 17:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAED741314;
	Fri, 23 Aug 2024 17:07:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aj31WpyfgDbS; Fri, 23 Aug 2024 17:07:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A7354134F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A7354134F;
	Fri, 23 Aug 2024 17:07:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B5C41BF306
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28D62612F7
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:07:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6VtTFUJz-rAc for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 17:07:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0C3DA60644
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C3DA60644
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C3DA60644
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 17:07:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B9DDE0002;
 Fri, 23 Aug 2024 17:07:35 +0000 (UTC)
Date: Fri, 23 Aug 2024 19:07:34 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240823190734.294b4458@windsurf>
In-Reply-To: <20240822181830.65052-1-bernd@kuhls.net>
References: <20240822181830.65052-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724432855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JUTe+7yyQfrGqbmOvQ3mU3g6yyvpNUDgJely1vHVVmk=;
 b=BmJODBnlyVBO2+cIG7gyuBHgQxURByuT+Hw88Y8SgJwRrNZiSTRuOh4HEWvg8pvYpjqsqS
 Hcj5ni01h7o0rLMgQTDfws2FxyyH+UP5s9iMS35IHbzw1sTJmRAg8E+eJ1DjrNYXlbMoQy
 IV5WetRN0TtSvoBCENRI8vcNachjoLNQo4UU1ldsDD6XlL3Zq4cJllLTrY6RzRKHCzHagh
 tYBArb/AiTn0yeZ8ywC5XKG1Sx9QOr616YCptKTdAL81iAKzGnIn6YF+bJLiOOgXoeBlkO
 zdqWrH4sAqo0U9LTxEhmzDCsqPz8Mwl4Kiu9nd61OYL80ZDzEVzB9YsvTwaW5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BmJODBnl
Subject: Re: [Buildroot] [PATCH/next 1/7] package/kodi-inputstream-adaptive:
 bump version to 21.5.2-Omega
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

On Thu, 22 Aug 2024 20:18:24 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
>  package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied PATCH 1 to PATCH 6 to the next branch. I left PATCH 7/7 aside
because I asked a question about it.

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
