Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4279DF9D0EC
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 19:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 188CD6F4FB;
	Tue, 14 Apr 2026 19:16:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QjLLDXA3wDay; Tue, 14 Apr 2026 19:16:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D9F66F4F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776194183;
	bh=WmO42WmiBWS92VY+xYjRcBRMAdE3QOQsLg90YNtDvGs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GLlRP21XzjtZz4zlTyyAnD4h/LX/K9To9ZYe+TVGZwiq/V0Uz6lpvo5WDwdu9qEIV
	 ySM5j+tlSRvE3dC1aVVjtgqutuWv+Lf4RlYGPOoLCS02p+g/tBA1Klrsi56HTm1ISb
	 +HiLGYUR6HPE6sMQCkwHntOLzFl2Dn4aEtxeCsrz4mTiAWQQ5IMnnutLZVE7JVFMcm
	 bVfCV4yZ3elDOZy6B96SOkHC4VhVFnoOeKv+hCBDvsO3b3ShtvqUsUQpVYbqXRpSV/
	 rVmF02s92i+MUYhBspAk2CKfbHPxBJx2LwjMImdkMUb6Y2Q9D0p3l8DGVfYi8Atro5
	 QGzcvQq15KLNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D9F66F4F6;
	Tue, 14 Apr 2026 19:16:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DDCED237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFB1F6F4F6
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:16:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5F3oQEgDtBtz for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 19:16:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C6AD96F4E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6AD96F4E6
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C6AD96F4E6
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:16:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 959F52003C6;
 Tue, 14 Apr 2026 21:16:16 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Apr 2026 21:16:16 +0200
MIME-Version: 1.0
Date: Tue, 14 Apr 2026 21:16:16 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
In-Reply-To: <20260408082103.4125427-2-buildroot@heine.tech>
References: <20260408082103.4125427-2-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.14
Message-ID: <f22a42420d466a6a75f173574662134f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776194179;
 bh=nxpqXDZ4QrH4kgAHHAyIpTNOPk6khYjhe/qnTRUsxYE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cq6ihhZl8RJN36DtZEFeXVs2sYpwGX8wQ0vEgrBmjJnCvQrGjp3/NiwOoShTOlMjD
 2uGLyuSeRJHtg2O3UT8KSqRu/rpO1ej82CvxE9AUl8A1QecW0Wn0ohOxg+SsfFbYxw
 aY+AW2dTAiP1lg1T7TReCqnDTrMoPPV+zo62Bb7DYcSlaw/6Bp2GBnap9T7V2f4jOd
 LtxLqy5nGCNyuT4P3RpOF1H9dOsTAMXi5wWcQDB8YHn1WFPSHEX7tCbPhFBRC/wsGT
 gggA/HVddecfYQMk6/2J1xzYyL60ObHEu41yWpZC0JyyxKwzyTltCvIU1xmRrb3/hv
 xn2oktYUUfdGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cq6ihhZl
Subject: Re: [Buildroot] [PATCH] package/{python-}protobuf: bump to version
 34.1
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

On 08/04/2026 10:21, Michael Nosthoff via buildroot wrote:
> Changelog:
> https://github.com/protocolbuffers/protobuf/releases/tag/v34.1
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
