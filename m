Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FABCD4F21
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 20:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0F6B821CD;
	Tue, 12 May 2026 20:18:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GwsF4OaGCyTH; Tue, 12 May 2026 20:18:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0021E821C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778617120;
	bh=OvzAIAVaDaliyVhZG7NegsfUWbX03ofMILB5P0mmWYU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=O+fOge1aWwuT1g/lszqs2opqq4YbusYLcG9Ehoxp11rbwZiW4ZZW5Pg6N6NLRk4YH
	 wIjnHgk7d6QTkKzwl89M5hb3G8JEK6kPa3o0lECOKgaMV82Kn9uGxNDwJeadauIaTq
	 ytf26Uk+AMMPQK0KroowMZxsITP+VHf3D9lpqUyuUoRUTveFFBuB8u/L1JHFm5cQw5
	 oFEddD3YZ/pyYAnWgcvnpXnVg36Cmyh1Yy+ELZ7zfpua/Tj/c0Dj+4TK29lp9qy9Oj
	 RcxvGkq2aRgxfD6C6MCEeBZTU8AdnxsxkmoNsQD16LtzFzwD9eMWkBoEAt0q1DGxaX
	 1zDWqNYGkqrjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0021E821C4;
	Tue, 12 May 2026 20:18:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D3CB4270
 for <buildroot@buildroot.org>; Tue, 12 May 2026 20:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9FCA60DE5
 for <buildroot@buildroot.org>; Tue, 12 May 2026 20:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KkmDU8z4yG2l for <buildroot@buildroot.org>;
 Tue, 12 May 2026 20:18:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D7F1360C05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7F1360C05
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7F1360C05
 for <buildroot@buildroot.org>; Tue, 12 May 2026 20:18:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id AB3D960129;
 Tue, 12 May 2026 22:18:34 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 12 May 2026 22:18:34 +0200
MIME-Version: 1.0
Date: Tue, 12 May 2026 22:18:34 +0200
To: Dowan Gullient <dowan.gullient@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260512080736.319856-1-dowan.gullient@smile.fr>
References: <20260512080736.319856-1-dowan.gullient@smile.fr>
User-Agent: Webmail Free/1.6.14
Message-ID: <8f74691ce9b08f1262295262435f95e0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778617115;
 bh=ljQ3KxMSkS4xZhRpWAXx+T+KxhK1d0wpM5QdU0nDzsU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ha1r4/cG+LchoZQYVy9gCpgj+J8JE9Jg98Vk+NW/RvmSJBimQ2qxaVRVuFexRdwcL
 hsCnj9MFBJRePZC1ECuF27eadVHd/ZJak79JJdIApey0QgKlOBdL/COmO1AXS6dOFb
 wLCY4Ot2HjEf75aNJFbN2Eup7uSDhlGneC6eUuzzec3+ePNl1ufKA3/8nOUlF68vq3
 ZUEnFcgzrWG1TnMu7qgK07LQ0ofNBUHUXPe7Eem9kT/Vz8PfkvDM4OA4G/jWzO8QL9
 jaOgPVcP6QCQd4x7YqjMet0MNAL3gyTbjAJBxsb+PYronPB8B0dvZLzkVKHbAlfBvf
 DgRwH2nw3KYtA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ha1r4/cG
Subject: Re: [Buildroot] [PATCH] support/testing : test_file_capabilities :
 Fix build failure
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

On 12/05/2026 10:07, Dowan Gullient via buildroot wrote:
> In my previous commit on this test I simply forgot to add the "arm/" 
> prefix.
> Since Linux 6.5, .dts files have been moved to "arch/arm/boot/dts/" and 
> the
> test was not able to find the file anymore, which caused the build to 
> fail.
> 
> Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>

Applied to master, thanks. For info, I slightly reworded the commit log. 
See:
https://gitlab.com/buildroot.org/buildroot/-/commit/ba604325c4329f637834ad4e9b9feff14054cc9f

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
