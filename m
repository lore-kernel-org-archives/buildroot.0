Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED17CC3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 09:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4DFC4057B;
	Wed,  7 Aug 2024 09:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GqkliVIWuBS9; Wed,  7 Aug 2024 09:28:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A488405D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A488405D5;
	Wed,  7 Aug 2024 09:28:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2ACE11BF2CE
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 09:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 516274057B
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 09:28:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5M1ReuDljQ1a for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 09:28:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C54BF405D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C54BF405D1
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C54BF405D1
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 09:28:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A9F71C0005;
 Wed,  7 Aug 2024 09:28:30 +0000 (UTC)
Date: Wed, 7 Aug 2024 11:28:29 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240807112829.45e1c4cb@windsurf>
In-Reply-To: <ZrL8C1qwlKLMafsT@waldemar-brodkorb.de>
References: <ZrL8C1qwlKLMafsT@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723022910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tKHvG3eAcrAfYpacFeMxMKg0nVl19mT7Lm0wN2freRk=;
 b=ixBxfPiiVPFUnJJumLLV7ef6x/A7/q4Jp6tjz1xqiBXZF6Q01i0mMCgIYxRRN2kuX1L0fS
 DBZCHxrHMRepy4Ds8cIR6TbJ0VVkPCY+++PgKv0kCeL7EFM/AEDf89Qo4snht8I8Td0azd
 8RxKzvC4IUeF5Oa+mW4wS5i9eGBPGvAkDngVNn8TZi6haD/vm1281OlJJq3M1Nl4yTt/H1
 xTbNepK3Z42PkUqDic6y/tbTS6gPqDtZmVk5Wq1pCCVezNsS+AdotrxQ9Q9ARqRJhICMF+
 J9ZBpjO3pGwLa/7STh4yIWnTMkzbawTlKbWAA1TQuR+26Yyn+JJAvemAt0odag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ixBxfPii
Subject: Re: [Buildroot] [PATCH 0/3] Upgrade to Binutils 2.43
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

Hello Waldemar,

On Wed, 7 Aug 2024 06:46:03 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> This series of patches update binutils to version 2.43, doing the
> usual dance:
> 
>  1. Add 2.43
>  2. Make 2.42 the default
>  3. Drop 2.40

Thanks for the patch series. If you don't mind, I will keep it for the
"next" release, once we open the next branch. Indeed, we want to cut
-rc1 soon, and I don't want to merge this this late in the release
cycle.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
