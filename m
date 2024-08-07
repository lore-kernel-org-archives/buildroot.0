Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86A6C52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 10:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93BDC80592;
	Wed,  7 Aug 2024 10:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wKd4mVe9kBAb; Wed,  7 Aug 2024 10:24:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9899980853
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9899980853;
	Wed,  7 Aug 2024 10:24:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0FB241BF97F
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F08C740553
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:24:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sb3n30srDFR7 for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 10:24:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9E5F5401FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E5F5401FC
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E5F5401FC
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 10:24:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32D1B60004;
 Wed,  7 Aug 2024 10:24:34 +0000 (UTC)
Date: Wed, 7 Aug 2024 12:24:33 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240807122433.196dd69e@windsurf>
In-Reply-To: <20240807082251.59331-1-buildroot@bubu1.eu>
References: <20240807082251.59331-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723026274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nsAoMoOvF9StRnt12px4zKBG69ipl/iZAL5+K+v9ik4=;
 b=Ze4krEJc7UB1HNhasHJbcQ4ncbpWQ441uHl1oECvb9gz9PnSUbbeozea1smX2eOp7sAYLF
 HxJDiHvoYUDCsE2lsfm81EWDF3DcDP8JTane+RSTELVEg5WXsd4caIFVCXJkyoZphYlisS
 BW0pHn+pu33NTUrfnrHJcLdP01LqWJ43MbzY+XbmEky8y2d+Ch/DrtLQnro0G1BdKcNLM8
 JNpUWdwKZWumSWiN427Ta824jrR6BMGiCuXh7GPJThrJkStodUJiYWZQSwzdaelEtMehDc
 rVJH7ctevBtnZaFW8+fefas7r1xp0hoDGXl9c5J4X/oe2LsY2kyaS8ZJBHn9SA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ze4krEJc
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 version 5.0.8
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
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  7 Aug 2024 10:22:50 +0200
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Django 5.0.7 fixes the following CVEs:
> 
> * CVE-2024-38875: Potential denial-of-service vulnerability in django.utils.html.urlize()
> * CVE-2024-39329: Username enumeration through timing difference for users with unusable passwords
> * CVE-2024-39330: Potential directory-traversal via Storage.save()
> * CVE-2024-39614: Potential denial-of-service vulnerability in get_supported_language_variant()
> 
> Django 5.0.8 fixes the following CVEs:
> 
> * CVE-2024-41989: Memory exhaustion in django.utils.numberformat.floatformat()
> * CVE-2024-41990: Potential denial-of-service vulnerability in django.utils.html.urlize()
> * CVE-2024-41991: Potential denial-of-service vulnerability in django.utils.html.urlize() and AdminURLFieldWidget
> * CVE-2024-42005: Potential SQL injection in QuerySet.values() and values_list()
> 
> Further release Notes: https://docs.djangoproject.com/en/5.0/releases/
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/python-django/python-django.hash | 4 ++--
>  package/python-django/python-django.mk   | 4 ++--
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
