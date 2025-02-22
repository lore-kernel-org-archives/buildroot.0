Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439B3C021B2
	for <buildroot@archiver.kernel.org>; Sat, 22 Feb 2025 17:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01F7A40755;
	Sat, 22 Feb 2025 17:08:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NlN2ZhK-puRM; Sat, 22 Feb 2025 17:08:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E541940774
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E541940774;
	Sat, 22 Feb 2025 17:08:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D16EFD92
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 17:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1354606BF
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 17:08:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5MeNqGV6_fqq for <buildroot@buildroot.org>;
 Sat, 22 Feb 2025 17:08:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B1A0B60628
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1A0B60628
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B1A0B60628
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 17:08:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 215A12003BE;
 Sat, 22 Feb 2025 18:08:29 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Feb 2025 18:08:29 +0100
MIME-Version: 1.0
Date: Sat, 22 Feb 2025 18:08:29 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250222140150.1437287-1-peter@korsgaard.com>
References: <20250222140150.1437287-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <0443f0c9082e07a208c6b7a2e88cb5bc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740244110;
 bh=mhvZAoSSKlCWVBNOARUWgVSrz1+IggSZ3TdLMboSg2o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pIKtQLpRS0RhKXJu9QpX0fr/B8enQB7SkloiJvq1+Ml1PPLVmtuuEC95n9zI6/jSB
 1QFvtlP+garW+fn4brXuZBY5TKhsyhVwKpMqC0H8llIS/mgkjRU1p9v37ThaMkW7We
 QWRIToQZRtttPqKprdC1EMZf+vcy1lzfYqj2LtZkRdjHfBvCEbcWxiqv1RidnGn2d8
 AL3+RVkmgr3iw9BKGQNnmGCob8UOrsWDjmJ5/SC7QlQCSOQzl0h1QFzmp1ViELiuKC
 A0IAcTsy+HodspNRl1rRWMmyCx26ybYe0pcm4InMKzTujXlmhy7de5Bod1h1y3xF2f
 RzvZKpVSdQI3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pIKtQLpR
Subject: Re: [Buildroot] [PATCH] package/rnnoise: fix builds with
 BR2_OPTIMIZE_FAST
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 22/02/2025 15:01, Peter Korsgaard wrote:
> Fixes 
> https://autobuild.buildroot.org/results/3e954cf8e4365d81e58949df50db7e82bf0d0ebf/
> 
> Rnnoise refuses to build with -Ofast unless FLOAT_APPROX is defined:
> 
> src/arch.h:171:2: error: #error Cannot build libopus with -ffast-math 
> unless
> FLOAT_APPROX is defined.  This could result in crashes on extreme (e.g.
> NaN) input
> 
> So do that.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
