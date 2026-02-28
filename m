Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3571AFEE4D4
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 14:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D445F417FF;
	Sat, 28 Feb 2026 14:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Le6aKvZKXa4r; Sat, 28 Feb 2026 14:49:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEF8D4180D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772290150;
	bh=joStTlZG27MEDZ51iFc8tqnCQauyzv6pH9or9mzqGzo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gsmgfVq8fh0ntShYA8YBmEHJBUmHMHiFt40fPnZnsKsjzzr+nOwg2ebYh+l4Lpqxz
	 Pm8tb72TtnDx5wGgd4+xeIf0rs9i1HeqTyittpn3a+OAiNLjKaVdGSK9bMbSauTJ6D
	 qQqqt3/qEZEEm0amQH1O/WhIQgSASCV882BMW5kqUcM4vLZlmtElxXKO6Uew/OtVsB
	 LWIMkqzRqARvU8KF3uUv4MFg1kGidJZrza2xlLpP9NfOZOKi+dKgSi1kV/qIRSydqH
	 fzYGtrgx9XQIW3rqVwwGazxqhtp9ghANYCpL+ZwqiyiKGzZ0zLnGbgyHswV7NiHWSq
	 eJKtYgJGu/zFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEF8D4180D;
	Sat, 28 Feb 2026 14:49:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A0E01D3
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 14:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FEA84185E
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 14:49:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HIiHstm4gDfB for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 14:49:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 99F4B417FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99F4B417FF
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99F4B417FF
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 14:49:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9C2AB19F593;
 Sat, 28 Feb 2026 15:49:03 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Feb 2026 15:49:03 +0100
MIME-Version: 1.0
Date: Sat, 28 Feb 2026 15:49:03 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260226201639.1240017-1-bernd@kuhls.net>
References: <20260226201639.1240017-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <ddf369e359207775ce675f3b1dbcae13@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772290145;
 bh=wjxVTOm6mKYEfNAAtcAH0MvSRNFHbNfF0fYkE3sX8Bo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jbmHuJ3tI76bWU16SCPo2VDU+PRY53MkBj5PEwcBG69Rg/LUSzIXp1xk6BZwUQpsd
 q5wAffSDC/8T1eDy88LjKH19DptKV5u4ao/VG4/vQHPYOxKaT/nJK3V3dxx+ePNAa7
 9pxHAemboL1ESL8V2AI1FMTfrfkBhv1KpRC1Zh4Rco/z4/7hQNQB7uEj0mRHxW23EJ
 RUEDHVSV/DVCik+96/Iq/HssnSuxH5tWapWqrANaavq0jNLz5WaJJQFWZSaCWoKP7q
 telzYObhWphr/xU24ZiqrwZgVMv41B/rdE9WUC8CE8HytetHdpnj035srZKbE0P7zC
 nGLCVRU/EqK5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jbmHuJ3t
Subject: Re: [Buildroot] [PATCH/next 1/1] package/piglit: bump version to
 git 3051e13ae1
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

On 26/02/2026 21:16, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
