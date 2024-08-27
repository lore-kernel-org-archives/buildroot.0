Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53F7C54731
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 17:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A91FB4039B;
	Tue, 27 Aug 2024 17:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tuWg9nIwHNvL; Tue, 27 Aug 2024 17:00:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69AAA40469
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69AAA40469;
	Tue, 27 Aug 2024 17:00:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C8A971BF4E5
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 17:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1F85404EF
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 17:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rH-H3xLFI6YA for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 17:00:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4C7C14039B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C7C14039B
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C7C14039B
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 17:00:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5110FF804;
 Tue, 27 Aug 2024 17:00:30 +0000 (UTC)
Date: Tue, 27 Aug 2024 19:00:30 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240827190030.422a34aa@windsurf>
In-Reply-To: <ZsmaNs8OCMDI+vs1@waldemar-brodkorb.de>
References: <ZsmaNs8OCMDI+vs1@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724778031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1UJ67MtU+hzp1rEQJllQU1thFzpk9233lyCio0plaWw=;
 b=NBTLl0qvROo0xkNrKamp/YYv09F2w/h/R5s+zr/GgW1n9v4GpWKkxsNpO4wcPRwTUQCLZy
 ojIHeRN0YFKGEWIAcT1oShpiNoGQFcKnb396PJNbziQooYxhe0hWyEMIET1dcnbgUVc903
 1VPgUHDIUleFY9f0jzzSoMSsZQCfsJmMIaznISbdHJMrICKitZ78zDTUDh+mp2wECA16/q
 07cuzk8AzJYTI5Co+hcvgDe/ac7irhf4m8AYnOgBNt9iCbXzWDIB5xGK28xSShloG2FiP8
 1IF09qn4o7ZoXVYsxOBrl74kVPtrqal2u+r9PSDxRzSpWIZQJvz0thuL59SL8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NBTLl0qv
Subject: Re: [Buildroot] [PATCH] package/szip: update SZIP_SITE
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

On Sat, 24 Aug 2024 10:30:46 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> diff --git a/package/szip/szip.mk b/package/szip/szip.mk
> index 7a8a5a82e6..d8b83ed82a 100644
> --- a/package/szip/szip.mk
> +++ b/package/szip/szip.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  SZIP_VERSION = 2.1.1
> -SZIP_SITE = http://www.hdfgroup.org/ftp/lib-external/szip/2.1.1/src
> +SZIP_SITE = https://docs.hdfgroup.org/archive/support/ftp/lib-external/szip/2.1.1/src

                                                                               ^^^^^ replaced by $(SZIP_VERSION)

And applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
