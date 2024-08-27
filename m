Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCACC5472F
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 16:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9470E40585;
	Tue, 27 Aug 2024 16:40:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z5d4eURi80Xv; Tue, 27 Aug 2024 16:40:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 683EF40611
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 683EF40611;
	Tue, 27 Aug 2024 16:40:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 65FA81BF4E5
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5290A40611
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:40:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pGPgmKN_Sc-E for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 16:40:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F189640585
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F189640585
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F189640585
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 16:39:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 008CDE0003;
 Tue, 27 Aug 2024 16:39:57 +0000 (UTC)
Date: Tue, 27 Aug 2024 18:39:56 +0200
To: Paul Cercueil <paul@crapouillou.net>
Message-ID: <20240827183956.4d2f7df2@windsurf>
In-Reply-To: <20240826114757.150278-1-paul@crapouillou.net>
References: <20240826114757.150278-1-paul@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724776798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YTdJIL9PXsVHHNGPa3bHZygoLUAx04ax3s5Rr3dEIo8=;
 b=HujFW0IAi5za2VN2WDx6bDUw/WUiHIVS4n4V44wW4eXf9x9i5dEwrE/74EKPQAMqdd2huI
 pfjdEP3d2yNZuk6A4R3yW3r0eLcjXrcgzI2ZDvWGO677Ox+aB0muzQiOZlXf2fdBe0AU2e
 c3rZCZLeuBciyUt3GYEqIuBifWEo4iBH6yFgyLeCFrI+6Ygk7bKRkIqVoD1SqLkcAD4ff9
 AFtNY68TGfo/5OQRBi+ZRICRjYswpbqj9IZM5clN4lHWmkDzZ1RcylyV+os7FZnWTH/hdy
 wTiwa8DDgC561iP8fyijmRsC3mK2sJR4/BxgD0N+GKCufJXJDgJxLxKMIvCEVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HujFW0IA
Subject: Re: [Buildroot] [PATCH 1/1] package/umtprd: bump to version 1.6.8
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

On Mon, 26 Aug 2024 13:47:57 +0200
Paul Cercueil <paul@crapouillou.net> wrote:

> https://github.com/viveris/uMTP-Responder/blob/umtprd-1.6.8/Release-notes.txt
> 
> Drop the patch 0001-Fix-output_dir-make-dependency.patch which is not
> needed anymore.
> 
> Swap "$(MAKE) $(TARGET_CONFIGURE_OPTS)" to
> "$(TARGET_CONFIGURE_OPTS) $(MAKE)", otherwise the package does not
> build.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../0001-Fix-output_dir-make-dependency.patch | 46 -------------------
>  package/umtprd/umtprd.hash                    |  2 +-
>  package/umtprd/umtprd.mk                      |  4 +-
>  3 files changed, 3 insertions(+), 49 deletions(-)
>  delete mode 100644 package/umtprd/0001-Fix-output_dir-make-dependency.patch

A small update was missing in the .checkpackageignore file, now that
the patch is gone. I fixed that up and applied to next. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
