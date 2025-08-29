Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C00CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 21:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A449541241;
	Fri, 29 Aug 2025 21:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g_Mcm1Ik7Nku; Fri, 29 Aug 2025 21:52:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E28CB412CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E28CB412CE;
	Fri, 29 Aug 2025 21:52:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 302F2D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 21:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15B7361ACF
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 21:52:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3qI3F7_GZk1 for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 21:52:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3CCE961ACD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CCE961ACD
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3CCE961ACD
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 21:52:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2145B4E40C2C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 21:51:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D1854605F1;
 Fri, 29 Aug 2025 21:51:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 223F01C228AF3; 
 Fri, 29 Aug 2025 23:51:56 +0200 (CEST)
Date: Fri, 29 Aug 2025 23:51:55 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <20250829235155.721a4774@windsurf>
In-Reply-To: <aLIR6yJyANhTHgfj@waldemar-brodkorb.de>
References: <20250829170522.2436314-1-thomas.petazzoni@bootlin.com>
 <aLIR6yJyANhTHgfj@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756504318; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=LCEKmlCmP3lRkoVEJ49b1ENWRL8epidN06RwE6jeNrM=;
 b=lGiqrc3yHkgcE/NOcmLrkXLx3RScwD09w4zdgX/35CpySQK8OtvmFc/FpswGSgeW6Nh7PM
 nQ9sTonA5S458Jj86f9S/tgWAGwz+gMTzKpw4T0T5izl/j5J6abkEvaNLEqCyj3T/BuMa+
 QAIBURqnuM5ccJBDKB4JyzttF8vqmGWtgXNINFDRUnC8qbI6Ta1Kz6+Mn4FxlS8sgq6/mx
 uEg5n8ewxUOG7xQ22M96zJ/5o8g/JVev7vUtz5lDzwzaJwG7qZ7OuzW2/UaPYYW2k0LaDv
 Cj0/xmAJYzw14sl8vYQvW2tHBLsoRMG5TXCdKbTrHMO+5IuypqW1mIuuXxb2vA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=lGiqrc3y
Subject: Re: [Buildroot] [PATCH] package/asterisk: fix build caused by
 libjwt bump
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 29 Aug 2025 22:47:39 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> > Waldemar: you did the bump of libjwt. Are you using this library?
> > Independently of Asterisk?  
> 
> No, I am fine with that change.

Sorry, but that doesn't really answer my question. You are both the
maintainer of package/libjwt and package/asterisk, and you bumped
package/libjwt, which is only used by package/asterisk, without testing
that it doesn't break asterisk.

Now that asterisk uses a bundled libjwt, do we need to keep the
separate libjwt package?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
