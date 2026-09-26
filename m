Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34663C98318
	for <buildroot@archiver.kernel.org>; Sat, 26 Sep 2026 09:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B460F60847;
	Sat, 26 Sep 2026 09:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QBJEnPmcHYIg; Sat, 26 Sep 2026 09:48:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BFEFA60702
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790416094;
	b=jOmX1JqZ6H7nZhe+H2GfYd5zFKz5QnVucxbZ54O+cUHsEn6IrcjOD6GPfqtoc+0+FpYE
	 JQ6czG5m+Z4Psu32S7G4hcbKEwskNz7H7xArIvDryhEI7GXODcL7OlRGlxx3gY60K+nPA
	 sN9DSpqKb/IeqPlYUIRQ9cNnm6/Mcg0fxV/s0FolGrcNCbqSpkp5miVOe3+pqjJH3z9O0
	 q0ht781uDTnyUUSbEZQwtyeyyTeeh0/AFmKs8JFlhDkGFrr8PMh3zF5aYRerLNsBECGkn
	 1SsBD3HnE+AN/wB2n77YZQ8pzRjt354T1QHmQzZ5AAEmRt92uBLqnlCJ4NgW+OnZtxQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790416094;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=P57CcFCfss4riQIltSVN0kDLzIKCEUYwojO7b2zfRGk=;
	b=OA1YMJndAZQTTvtnq+I4BR9ucvyzaTExsKShbzITdSpvlb4lGLSqu926Zhp/+wMm1i3C
	 M3UuX1YmN3tPU+P/mgEhnLkYESSwssm6/cn/UXpN+XPGr6Xxt1WOep4fpHz18V2gVorY7
	 fX3TEwu0JHReFTt21ZhHXibsLh0YYCVwK3wQTnV5QOS1uniLVJqG0eqR59xu9di83ZvNA
	 BKtt2I+vwoF6SR3wYT/1Y4RFx5j2WnF28qksMB4hwRmTq3j0IEdSeM7T2UyPKLcjh2p85
	 pngD91063wyXlskn8uT7gm+hNyDUtQaWpXkAaSTfsOfZJy2HRvx11j+tKHwwn1GBZ1A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790416094;
	bh=P57CcFCfss4riQIltSVN0kDLzIKCEUYwojO7b2zfRGk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lo9wwO38GV5Mi7fKIEFlMQ/MlCxkeNxNtrM9xIPHnKnGnUKwSrsYr2+UZZJtmw8oQ
	 ciay6AsxOfI16l0emmQuHxxvB9Fdx78qKAvXEjAU5IT6E/g0qgzHjZ1Cc+Tu0dJply
	 z4FH5tmR+u6448CIh1U41AAVTs1qEmXSGlaRRtClRG9gisdc+nZa+RDr7FGaJNYZcK
	 0LO5jfpEx+pBQm8LbNL9W2DFdzJGqHk6KxxneJW/iG24QslAQofBJdygX3k8d2Em2M
	 8mijddi+vFmRLBuzifrHKNGTglTXUSdk3rufTOtbWcJ50iFMRJdiJD35tOZgtjMr+i
	 9aKNLllGhOU4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFEFA60702;
	Sat, 26 Sep 2026 09:48:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D957F194
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 09:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAB5C60702
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 09:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eEDEnKcASjHn for <buildroot@buildroot.org>;
 Sat, 26 Sep 2026 09:48:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 14D02606F0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790416092;
 b=hNsSN9AO++i7U0ZJ2OwFEXXg1OPxurQDxQ9kNgrsci2/vKRqJI4BvuUgSRwSLN8WJQeH
 2lXyZV2iuwb8L5YgHYjkalaU9+zlX3muHjYO8rgYc2r+G2I4aO3Oth7XNpchLagOfZaGI
 Q+7BPez8PeY3AB6OCVEMrJ5u9JwN0HgBYrvj269sXFvfjsGfPcnu0RR1nH3H104z6Yzc0
 SgLdlPonyOu4YLDxawJSx9y4+t7L0MwRIdVoAO4T+bSUZEeZx0ZNo2GOc0cRVOnEDIsBw
 ZUNNIxG0e6JWKbHADPTdXu4TdxpsZHWJHLbO56bO5QIPkur3a4tmkCc3bwtBygH/QZg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790416092;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=NEDf2AKtWXhZkNbxGzTa8Vl3uGCfdd46mBpu8qo/U6E=;
 b=AWi5JdsUtT/nzHJ0ssJiN56hxpNREt9+x/no/B/PLFtonLb/aVrwof7JRydBzDXSHVdW
 E7K2wHvbqE7zPf6+yk4LIWXIZ5AlRwO+hF8a38c26XovowRok6qsf7g5IuLOvWqK67rwa
 4D3qz/IGXkRNt1pT0+2+TrFCv8GnfAqHxAh/G3ds08MOJMgONu0Vdjdy+TfP3LM1StC2s
 61cqs6s16veKbQ5XnLqtaUQ92uMoYx6vD6penC87QWbZSqJpNJaIn+0folhb0nVzf5erZ
 /vO9S3G/M0/nFa1j/WpU6cN6CRvAiX2G5pWKdr8G7yeOeTLZcRp3FWB1QxcVGqExNXw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nGp8LMNF; 
 arc=none smtp.remote-ip=212.27.42.2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14D02606F0
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 09:48:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id CAE642003A4;
 Sat, 26 Sep 2026 11:48:06 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 26 Sep 2026 11:48:06 +0200
MIME-Version: 1.0
Date: Sat, 26 Sep 2026 11:48:06 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260925200003.3565628-1-bernd@kuhls.net>
References: <20260925200003.3565628-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <76f7c8c59675a9671a922b359238bfd0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/php: security bump version to
 8.5.11
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

On 25/09/2026 22:00, Bernd Kuhls wrote:
> https://news-web.php.net/php.announce/506
> https://www.php.net/ChangeLog-8.php#8.5.11
> https://github.com/php/php-src/blob/php-8.5.11/NEWS
> 
> Fixes CVE-2025-1218, CVE-2025-14181, CVE-2026-6103, CVE-2026-17545,
> CVE-2026-91765, CVE-2026-91766, CVE-2026-91767, CVE-2026-91768,
> CVE-2026-91769, CVE-2026-92842 & CVE-2026-93682.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
