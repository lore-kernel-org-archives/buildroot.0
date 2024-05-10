Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A15C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 21:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6869404A3;
	Fri, 10 May 2024 21:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LK_Xad1oPSdk; Fri, 10 May 2024 21:34:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04F744060D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04F744060D;
	Fri, 10 May 2024 21:34:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6A8BA1BF36A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 644214060D
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6kkSgVbOnKCE for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 21:34:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5DC73404A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DC73404A3
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5DC73404A3
 for <buildroot@buildroot.org>; Fri, 10 May 2024 21:34:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 79A0F240002;
 Fri, 10 May 2024 21:34:00 +0000 (UTC)
Date: Fri, 10 May 2024 23:33:59 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240510233359.1d023b58@windsurf>
In-Reply-To: <20240307103848.27961-1-fontaine.fabrice@gmail.com>
References: <20240307103848.27961-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715376840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8XFy3qYMYfwHljKkJ+ML/ZXGbIympovzxnEA0CSwmQA=;
 b=Bbgeqt1oerWw/juxDgd9/YfD6g1jKR4YC+OjTnhOlSMJAbMgGbeiAerj9k8wd5fFP7ZvmD
 2IXi7hGgGMoWw2bUGAhbxlPMqUlOSKNq1jPz5Eq2xzvY/aoNLeN9iUstm/VBcvrI5gVtnf
 Y6v9J6cOJibR4QinCGApNwJfnyerhId9+5BZuwq6KOzusxGP2P3x1daXfsiXTSATqOV9nD
 pdKtTFoZGT94TStI8YN5oaNsKUkAElFeBv1+ohdJcDh5zClhXLrC6fhsPmvQJf0WFBaJF+
 syTeoGqBCDcwcshBTJbez6FLLLvcEzosXPQUORITwUJdjcY4cWKXiDCND2AplA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Bbgeqt1o
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/binutils-bare-metal: fix CPE ID
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
Cc: Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>,
 Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  7 Mar 2024 11:38:48 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 11b439ce1bd28506051fff14646f8bbdbbbe58d8 forgot to set
> HOST_BINUTILS_BARE_METAL_CPE_ID_PRODUCT
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Move product after vendor

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
