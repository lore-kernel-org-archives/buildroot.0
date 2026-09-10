Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B97C79FBF
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 18:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1111440B79;
	Thu, 10 Sep 2026 18:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 86elrh2Tg42V; Thu, 10 Sep 2026 18:51:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5452E40B84
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789066308;
	b=g1+0JtWPxbneYHCkneT799DAy2d0OPW8XGcpIVLvHfWQO9V8jB/2wqQo7U1CuSMbGNyS
	 NU04G/EpP0yYQDvBHb8sw4kbTVb8B11xkJ02wEczYuqmZMCwc0b4zB+Xy7lhqrla8YsHd
	 9WbP3zuC5LT+oOQ8KhICGCZtV0X+RvmyU4oHGkI5TdiXm36Y7sdFmclNOBdx2FA4s/JgG
	 QKXqHP0hE//gcd6fPyp5FgYjbOqN66p7j/oWQ1LJezY7rHZD1z0q6xiQQhBrG2U7Jm+C/
	 sc/haYyoC/Rpj5B3ThF7uua1lHGRPLC2Damf7QCkR0Qy6mIfIzUCHEtY0aEwsHuKVtQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789066308;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=1YGfhSLTxWGrdrsJidVIgAneNWNUpEL+3LO5sdzm31I=;
	b=ag6rYDL6gAx+vbindsKMT7qGV2j/K6YBTuKtDEfYDqwDePEw1E9TugsWeOvVMhdBphmS
	 6mGYmSxOAGUnrdpioHBNpspInG2C2ij/57/0YdaSANJ5ozgS1akUZV1X5z09ZSpVq+QCM
	 IJ2xla5euryde+0kL/KKKeY/vMROhzWDQoY6+9ubCgDn7P+wWwxpkrd8gj1boCywdTU+h
	 LIYiK4zUSATEnAeQAz4DLlCEiRF+SseeZ6vH8g0J6qduUnAKOh9Vyelg6+EhufjhxNguF
	 J4MM0ZFLuEu4QUx3J+Khi1MTggHFmGb2IW9d+RJRgWMbKcQwp+9CGNJtHPtFvFmNNEw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789066308;
	bh=1YGfhSLTxWGrdrsJidVIgAneNWNUpEL+3LO5sdzm31I=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XHgB7boGUxFu1vT/xuKQYLkjEp9HhS4NvI+5QmnoT8pxvOBnSi76qFxeVmxKXEb/S
	 T68OqSn7xn4ZtR1oZ5u1eS5Glhoo1jGdSMPhjtnlSCVRfC8UBh8wMN1qgSU9gykRsJ
	 wkUz9GuS0Lrqf5RIShksS3TMbG9o68rj7cPjv46UuOygfBVU7l7g4Q4Q+1+LPSmZhv
	 LzrFnflbjlVR5SB8XJ+k3Qlz268RHpukmNWPjbqwSnq7Lr3di2UFiuYvXIyVBCCgX3
	 GRGfS/IOYMbnFCYJ4UW6tJma928U5oG3h+kXXQdNbWX1cqiXu9/vF7LPIp1zv1l3Nv
	 bbkps37K4A+hA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5452E40B84;
	Thu, 10 Sep 2026 18:51:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B61549D
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 18:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98ED060BCA
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 18:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QDwp0QgwiTq8 for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 18:51:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 591FC60BA1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789066305;
 b=Qp4Hp24f/pt/7h3q/9ZTxfb/AjzmG/KxwQmDedCJtESilUTHZC4/IALbWnz1hsi+4EfR
 i0LRN82tiMp6ZO44C0SaYJCT/PXym64VQVgEf02qMwrG+WVDtPGQ8FPOMWL05KMGMNlUK
 6IFQqZOG01vMBavQQWzeZ95NILYLzDJ/3TtgIVf+jnydqadJ+DdDSW4DVE5NgZABpueiL
 CmRGi7HTm8vSsfPwXubZJCrQQZxXgtS5aKNXf68irzbAfuvJ3zYzb0iAwAoBYKaA+oXWl
 q7Thr9G3Xy3OHOpdCuwwOAQ97pWchDSiEAohhKWkJymIFq2oZJ3pPl7wIs+ftyiLhoA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789066305;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=LLGkr4Ny0qAbkDmIa3AFU9sWki8lSxvA/zTov8plU/M=;
 b=PWVXmd3uLqCXXCY85pdqUnrUaP3TFT/UprfiMwLQD/HX8FO1bvV0YYng6YuTpmFWxcLV
 Vw6tVNuSWbtN9tgLhJloLAP3iWFD4fxxRETxHL7GrhAnm15kHyYCuq1THUbA4jLvodYoe
 B5jB4WMAgusloVGh4EjCFL13kFztWspqcp9C8J11RQsTmFT+28i4yPCO2DLfmcrH91BA9
 5ZiMxGha3QFzh2d/M0grDqtQqUOuCr8XRpJUy8rNasDJ1Ng9qk5Sg3c+5n4uFcXEDL0V8
 RnVQzrmfbGyN5/8MTol1Rx1X535GFX1bawHlIlItcGvgoFhkopapWZWlYd0t248avtw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gEheE9MG; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 591FC60BA1
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 18:51:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id AFA3613F86E;
 Thu, 10 Sep 2026 20:51:41 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 10 Sep 2026 20:51:41 +0200
MIME-Version: 1.0
Date: Thu, 10 Sep 2026 20:51:41 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260910174530.1421838-1-giulio.benetti@benettiengineering.com>
References: <20260910174530.1421838-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <8a630fecf754c4a8eb80eaa196d14abf@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/libfuse3: security bump to version
 3.18.3
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

On 10/09/2026 19:45, Giulio Benetti wrote:
> Release notes:
> https://github.com/libfuse/libfuse/releases/tag/fuse-3.18.3
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
