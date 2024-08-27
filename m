Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CBAC5472F
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 16:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C3B340553;
	Tue, 27 Aug 2024 16:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M3eJrVCyJEdU; Tue, 27 Aug 2024 16:28:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23D3E405FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23D3E405FB;
	Tue, 27 Aug 2024 16:28:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 41F881BF4E5
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DDC68100C
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TuR20cn9RQ_s for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 16:28:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1133680EB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1133680EB5
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1133680EB5
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 16:28:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9AACE0004;
 Tue, 27 Aug 2024 16:27:57 +0000 (UTC)
Date: Tue, 27 Aug 2024 18:27:57 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240827182757.7b1028f9@windsurf>
In-Reply-To: <Zs1ORw93VJBVAm5L@waldemar-brodkorb.de>
References: <Zs1ORw93VJBVAm5L@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724776078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vSOpPwGA4lssPFRt/huwbCFVMaOrunQJmzKRpITvBos=;
 b=WFRVAqxY80zni0644HMpSa+y9o1xOhDZSMXUPzGnYWnlzy9pormP6NrN2vZnY7JOk31eE2
 2PAx5RecDlS1l1I43JDjKUPtEuj9SYWF8VqecpVlJo9Ka9lHraLjlfyLehci6Ba0Jbfw01
 96X1OFT5OR9GVg/TDA198SvvDK2PT1KkRKk8FzfO7aED7hoRGLVTZMBv1JWeinA+FAq56B
 dNLyIb8u/fzS5iO/pQWlOxWaWckER81dOjxXbw9gp1Y93T4rhHyN0/HdHocJmyp874wV3q
 ngtMtWvKq3LTIG9jYb1R+ykpgrotfK35jaJl/vhdar/pAspPE8fuL8xNDglaXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WFRVAqxY
Subject: Re: [Buildroot] [PATCH] package/enscript: fix gcc 14.x compile issue
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

On Tue, 27 Aug 2024 05:55:51 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Fixes:
> 
>  http://autobuild.buildroot.org/results/eb5/eb53b42db0d4bcaf574380d5a89a096cc4ce4b14
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...ible-implicit-declaration-of-built-i.patch | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/enscript/0001-Solving-incompatible-implicit-declaration-of-built-i.patch

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
