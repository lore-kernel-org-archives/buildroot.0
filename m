Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB95CF364AF
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 19:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1643240FE4;
	Thu,  9 Apr 2026 19:12:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xlTlL6ZZh62P; Thu,  9 Apr 2026 19:12:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A17CA40C05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775761926;
	bh=Q+iTqj7xI4pC+b+Wtg3DIV/KTrPna+7QOscXJPLNZmY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TvbWq0YbcvVSLVDp5y8l5nU3tEDiUA53wil2SNQ6UHxHA0+kST/i1paxawPhbL/m2
	 dSLjHjrV6i16yuC6BzA+C0AmdkHNRlbm7MH5km2G/tB4QLD39gcWBTqdWu4eHTk+z+
	 tFFN4nIdIfbmUtdiP7c24s4sJLd2TQqK/O/lmqjsCvD8wgY6LaQ/CBmRtb78+yU0YI
	 RI1qklF4cvBrQSet7DZDgH5Ny3o9ppNnJnZIwGkSxG8UPGd7L1bPWcTOxUeWZLahCs
	 u//ix0xE1FrHY8Fw1gHOoClVr+p4xdHoTf81bdPEvIdS2XvJIukBSwEtGBh8ZkHSfq
	 i82OObaC6zE5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A17CA40C05;
	Thu,  9 Apr 2026 19:12:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 083FF194
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 19:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDEA440C05
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 19:12:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AYjI25pAoVmB for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 19:12:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ED78A40C03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED78A40C03
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED78A40C03
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 19:12:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 57A4420039C;
 Thu,  9 Apr 2026 21:12:01 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 09 Apr 2026 21:12:01 +0200
MIME-Version: 1.0
Date: Thu, 09 Apr 2026 21:12:01 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260409131639.278687-1-bernd@kuhls.net>
References: <20260409131639.278687-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <f1d97d9310f4b3b38bbc44aadbac5131@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775761922;
 bh=COLzXpbqIChvs2kjzQxH4BQruALEGESYFdkmt+7bAgI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C7V9MwIeodIzrcJmkajRlRzgDBMcuMi7v4BLFmIQbFN57o/yAk7lCWmFM3uFoRVT0
 EA702Z3Yg5Vf7/iaemylf4Ll3AhEpUBT+GWTnU9yg+UbvHDux4ouLRl9oJGDKFhCXR
 g5/PJIMjAmisiKnwZdoCpinTMyTLP6K6UAkea0TTP5/lmf43vNT0lnf8cgJMBSqwC9
 D2sZMLuNYClacH0dyrCG3uaZc2UljGm4UXbjz9jpeSiBRufsXFPdEjnv0qaba31wuN
 QfdIcGvYBLyPXjLV4Umcc3OPxe3TlzEQpQyFEhoHj4tVLxkI08UQQcwqRO0we8mMV2
 xSTVuuI7JCAbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=C7V9MwIe
Subject: Re: [Buildroot] [PATCH 1/1] package/libpng: security bump to
 version 1.6.57
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

On 09/04/2026 15:16, Bernd Kuhls wrote:
> https://github.com/pnggroup/libpng/blob/v1.6.57/ANNOUNCE
> 
> Fixes CVE-2026-34757:
> https://github.com/pnggroup/libpng/security/advisories/GHSA-6fr7-g8h7-v645
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
