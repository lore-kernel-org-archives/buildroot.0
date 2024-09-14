Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D29C021A9
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 18:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B01881DFE;
	Sat, 14 Sep 2024 18:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yksdnLuay5SQ; Sat, 14 Sep 2024 18:37:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1300F81E02
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1300F81E02;
	Sat, 14 Sep 2024 18:37:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4449C1BF31D
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3304D400D1
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bo40RN3rmZXm for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 18:37:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA6A3400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA6A3400B8
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA6A3400B8
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 18:37:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21E2BC0002;
 Sat, 14 Sep 2024 18:37:53 +0000 (UTC)
Date: Sat, 14 Sep 2024 20:37:51 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240914203751.43505f79@windsurf>
In-Reply-To: <Zs+99wYrw042nBi/@waldemar-brodkorb.de>
References: <Zs+99wYrw042nBi/@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726339073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XKiqM208fumiohDvuEnjnOHiH2cZzk84FU6PAlHf80I=;
 b=j9wO/0UkNWFng4UpREJK6y2VqUIz1bxVUoMPthIffmLMCTjN0v2DJQIhLyMHWJ5vcB6L+p
 /oko0Zu5HbARyCZEEOPdKoY2vMAoEIxfyzGhAwRC13KjwZ//PwDKOByu4xCDpFzt+v7Zls
 PSr7yFXnPkzTR9ZjeZD/OujefDZcFyasb5TUP5R8WHnizELIiQHe5MVLAu4bmmisbOwF6c
 4TZ85GDboDyidmrkUmWwrlkuqCROi/MLFkFs7FmjGberlVDmCA1KNglhUf0KqyZEaH/DEW
 NyRHNwVAWuzSuMP/QNEUMLjTqy9TKyJUbAQK6iO3FzLezQLe7gJTpy6s2Syt9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j9wO/0Uk
Subject: Re: [Buildroot] [PATCH next] package/zabbix: update to 7.0.3
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

On Thu, 29 Aug 2024 02:16:55 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Update to maintained and stable 7.0.3 version.
> 
> Patch 0002 does no longer apply. Libressl support is not supported
> for our version of Libressl.

I've handled this by changing:

ifeq ($(BR2_PACKAGE_OPENSSL),y)

to:

ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)

in zabbix.mk.

Applied with this change, plus a follow-up commit to fix option
indentation (unrelated to the version bump).

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
