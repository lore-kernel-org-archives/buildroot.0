Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E48C55182
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 19:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBAB880C27;
	Mon,  3 Aug 2026 19:10:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G9mRO0N2lOeB; Mon,  3 Aug 2026 19:10:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5244580BEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785784223;
	bh=jz9fcsFRaxONeRZ12bwk7ZbTFISBjXMj/QlqVK5Wz5A=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UMI+gPhuLHpH4M3GGYhsYQ4MBQ4DRjoxuBBg9Sp04aJpHQJCJPlirFA1lhENqvU5d
	 5NPDKR9+slYXx8QjwCD5cPbl4yqZkCBdLM1slegE1AwAY5JKh7nldMUa/4hUjxNGw0
	 1WcuQySKV4kcQX9AqxsioHWUKkEeuZsupGBDDNcK0Db0V8J+dAW5eU8GkRVnjh2ak2
	 CHHvTPd87pGNDjYRq8yjXdkUQEOySDNSr+Qjtbd6RnpsV/EllXfb4wLHLp9uuYyVgf
	 fftjNgETU0PLX5Zl69n2p0Eev+pCNGr4t6+85HwFaYiMs0qFgbVjh7qIgNT6i1MY8l
	 e+Y0oTTKSbmnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5244580BEA;
	Mon,  3 Aug 2026 19:10:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FEA52CE
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 19:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25BD280C27
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 19:10:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A41M1dKdCzFN for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 19:10:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EAAF480C04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAAF480C04
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAAF480C04
 for <buildroot@busybox.net>; Mon,  3 Aug 2026 19:10:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 826845FFAF;
 Mon,  3 Aug 2026 21:10:16 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 03 Aug 2026 21:10:16 +0200
MIME-Version: 1.0
Date: Mon, 03 Aug 2026 21:10:16 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
In-Reply-To: <20260803081917.391134-1-francois.perrad.86@gmail.com>
References: <20260803081917.391134-1-francois.perrad.86@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <f314781160b64ae3d00af1aff35c5834@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785784217;
 bh=J7Kq8SPICHwanHHo5+20UuKKu2D8gtZF51tBEsl8A80=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QuR3MtpbgCwE1E+Vo3HPZSUd7pmtuQB6OykCVUCbHsPAQUsnLURjpw7WC3p3yYjfr
 E52wEfLxaGMgiTEDTXeX+ODGlXdEESUwxZ98tViprBk1i2Jo6F83o4cp+d4Z8h8s7d
 HfT1NR+k6R5mcXTA1owCY79I6ify7/AMN8hXrzyY59lV9Uf1N+1M+6/2Sg70VfoGVH
 uT+S3kiHb0KjZf6uKZSiqFDv1i7DKF9vTz1CntGpgZKGV4FVFEAPCAByeoi9ArgmL1
 PMguKMbGD/jPuVwqcYRJyo6OkpsqlmrrIUnmzgJ8a4QXW47qAbP3cB0+6T6zUCL88V
 CREKuZXYSzQqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QuR3Mtpb
Subject: Re: [Buildroot] [PATCH] package/perl: security bump to version
 5.42.3
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

On 03/08/2026 10:19, Francois Perrad wrote:
> fix CVE-2026-8376 - Buffer overflow in Perl_study_chunk
> fix CVE-2026-57432 - Buffer overflow in S_measure_struct
> fix CVE-2026-13221 - Regex trie 16-bit field overflow
> 
> For release notes, see:
> https://perldoc.perl.org/5.42.3/perl5423delta
> 
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
