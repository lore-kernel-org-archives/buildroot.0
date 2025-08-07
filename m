Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DF6C87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 22:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40A0C81193;
	Thu,  7 Aug 2025 22:52:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nOiQtvtclJnh; Thu,  7 Aug 2025 22:52:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EB7C8117B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EB7C8117B;
	Thu,  7 Aug 2025 22:52:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E29959CF
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 22:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8C14406EC
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 22:52:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ZXGQwJu0EUg for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 22:52:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 380354066E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 380354066E
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 380354066E
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 22:52:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 67DA278034E;
 Fri,  8 Aug 2025 00:52:14 +0200 (CEST)
Received: from ip099.116-187-66.sogetel.net ([66.187.116.99:51534])
 via ip099.116-187-66.sogetel.net ([66.187.116.99]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 08 Aug 2025 00:52:14 +0200
MIME-Version: 1.0
Date: Fri, 08 Aug 2025 00:52:14 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250807100710.587721-1-peter@korsgaard.com>
References: <20250807100710.587721-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <5addfe6471db8bba62bfd3e21646481d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754607135;
 bh=nn+6ETrUgtTK/awBJmoYZpJ6Lum9hz5f3AHD7mhfnCI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lThs38lECU9Q5JyLD1yosD2liUmnSCwlfyWun+AkrSMNTF4XDg/w2fyMLlYg0BXLj
 jo3FjLml4FuXO0CRFP433qc5H6HPhbknMpO+/n9jWNNB6T60S7DURjtKFRcbnusEIu
 nPgJgtALMf86N/PePP6ASc5aIj406/7dMIGNqnkhlGOvYQQhFCIUT2grFuu4e1dTNk
 G5hyPlqENOvkSCFqDrFV3a5bVgGAzmVtmitGlZ0+sOkXt8Him91FrEj6PEHiRBuwLJ
 OdDJ7biu9ePwdpty3s+44dBwYhrcAa3/WY7uHz4IAicU5hYtb3Pv6SMGLKL3llhq8z
 BW1HBx5NMgg3A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lThs38lE
Subject: Re: [Buildroot] [PATCH] support/testing: test_gstreamer1: raise
 tesseract-ocr timeout to 15s
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 07/08/2025 12:07, Peter Korsgaard wrote:
> On my laptop (i5-8365U), running cross-tesseract-ocr in QEMU takes
> longer than the default timeout (5s), causing the test to fail:
> 
>  # time tesseract frame10.png output
>  Error in pixReadMemTiff: function not present
>  Error in pixReadMem: tiff: no pix returned
>  Error in pixaGenerateFontFromString: pix not made
>  Error in bmfCreate: font pixa not made
>  Estimating resolution as 157
>  real    0m 8.17s
>  user    0m 5.36s
>  sys     0m 2.79s
> 
> So extend the assertRunOk() timeout with ~2x that similar to how it is 
> done
> for the gst-launch-1.0 pipeline.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
