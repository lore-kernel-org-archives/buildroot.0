Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4E7E7DEF0
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 14:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91036407BB;
	Mon,  2 Feb 2026 14:51:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W2qpms82S3ZY; Mon,  2 Feb 2026 14:51:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFD6D40693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770043896;
	bh=Ab/qOoJDEDttD6RREhRBrdjf7VctUzUqd3qUxQBWJMM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kkh+QtFw9brIzeow2wwDmpddo99Q6Gs6q+2FpFfeLL/kKfeplCaslmhYolePWnzto
	 O3xYTXUzSsuHA1qeZ/cAeJIdwSFlmDeV/WDnKOMu+BAsm5h6UtYchRYsQgwCj7NU6D
	 d2vynfY5rkrh8N9SVwgTaGNBZ76lv5AassEF2SsXKaf1r/ASQaYKyMVNVOoI9k6K1E
	 Jj19cBVcMn+amC8+rUJqyjJSzVqJOoT5nsvTtTVzvziPGG9qiLvLM64/9OUBI3Yu/N
	 jc5lMdxrxxw0ttIxbNx8UQb971js1sXVaToivMH19CFwE35ASLqkCcVqMxcww0okaD
	 ZNTYwVYT65lxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFD6D40693;
	Mon,  2 Feb 2026 14:51:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CC2DF23E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5CE9822F1
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:51:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CBOWr5wZZVBe for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 14:51:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A0C98822EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0C98822EE
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0C98822EE
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:51:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 947374E423CA;
 Mon,  2 Feb 2026 14:51:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 692A960767;
 Mon,  2 Feb 2026 14:51:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 22682119A8891; Mon,  2 Feb 2026 15:51:28 +0100 (CET)
Date: Mon, 2 Feb 2026 15:51:28 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aYCydXJJM7dK-Udn@windsurf>
References: <20251204223855.3571710-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251204223855.3571710-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770043889; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=7t353ElCTL8/m/bmXKXvSv1WaT7yAAAyzib8oIgrSzU=;
 b=dnwAopRHGuNvWpMA/I/AzSgXjDrLe/LweJSNpQsnyC1fmrai2wxg31rRXuyf4WnCJ/yd2Y
 ozTKCaWsK8orvL2HY1+nBHzDIecxOTdIIFJRo1VsLwAdqJ+l8vT0qRkCGqjDP0rmIZISG7
 zuKDUiMDph5HGzjFN+787gkpu+7hdJbqu3/PF2T3uXHbnoJS26B6+HbZaauiOb5alMHFm/
 qYmKtMMYJlxIIBdTmdKZB+drPOLjfgQBIc2pzyvyxX+ZKiqlnFZDGKEKZxeOPaUZHyQkOS
 gnsefs4xmtYnCwCBsxQyJz5Gx5NyZyEsEtKhbLDIfk42/Vf8WT2YPZ9KFRu5TA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=dnwAopRH
Subject: Re: [Buildroot] [PATCH 1/1] package/vsftpd: fix build with newer gcc
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

Hello,

On Thu, Dec 04, 2025 at 11:38:55PM +0100, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/661/661edeafc949390df397fd40a8035330238cbe8a/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

The details in this commit message were a bit scarce. What is "newer
gcc"? Also when I tried building vsftpd with gcc 15.x, it just worked,
until I realized that it would only fail to build when OpenSSL was
enabled. It would have been nice to have both bits of information
mentioned in the commit message. So I improved a bit the commit
message when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
