Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AE2F99C8E
	for <buildroot@archiver.kernel.org>; Sat, 18 Apr 2026 19:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5E5660E37;
	Sat, 18 Apr 2026 19:16:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pB_4kmttm-R6; Sat, 18 Apr 2026 19:16:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B187D60E1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776539793;
	bh=jBEC5M97Aq1k/yM3uCXYmx2LU+tirUOiAXyaKexCgz4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FvSXKkAduswuidAnOwVtY3Uxa2YcPCwEb5GjgkQDgaAarZ1ZS5i3FF4zBYvInz7ga
	 bAYf4vtS5EYw0BrsrRvrNXlDDNK8ZMeMlkGXEpn02a+Xz36kmq7wx9BaOzLzDuMGjS
	 6djQgvCs4RAdF34DmOjjNFEKpvsuvBoCuciDf7KOt7fv4F8t1Wytm9x+myGc6V3oVW
	 UmB+snBOMhtpIrd4n3bpF150khMTRc4kVzFnmZ0GG7UylioEbaEfKoTLH6KFtlM+wa
	 lmto3Err/mP+sVPJvDcSeS8CoOOkqcDeKO18RYpHaEuaOTsSs3XiEmD5vnSJLoqumW
	 rtIO2CDJ0TlRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B187D60E1A;
	Sat, 18 Apr 2026 19:16:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BCAE369
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 19:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C5F860E1A
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 19:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qWGUKiBuUDap for <buildroot@buildroot.org>;
 Sat, 18 Apr 2026 19:16:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 76D7960DB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76D7960DB5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76D7960DB5
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 19:16:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 48EF513F8B5;
 Sat, 18 Apr 2026 21:16:28 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 18 Apr 2026 21:16:28 +0200
MIME-Version: 1.0
Date: Sat, 18 Apr 2026 21:16:28 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260418143237.669585-1-bernd@kuhls.net>
References: <20260418143237.669585-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <932aa4379728c9b85c9e3781f4fc9366@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776539789;
 bh=LPo+X+odXe48SawCpTyDfKrszj4lhbVTmdit79LM2Eg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C+rGX+kMTU6JVsZh4VJYhDGSHURhzdcOtjnIW6fCR8ikI0o83giQvG8K6tom1Irzc
 iSoa93vHRFjy+8QbRAed6P4K8FskfexQBjqJcKxh2lwnSpSKCpjX/w5oTR7Mfd5cLv
 ck9k3RLcq+yVzQUHZPBaokNboLHB4n3BzwCtAczRpfAEtip3v9WOdzSnmdK8RXrOB4
 2R9hs4QI4LF7iHKOlTtg62ViSyikrdMPi609hcsus3RMfPWnB0Fjt4uGewSAZ6kZFV
 Y4ZDE6U29HfVoMNEyOjhym7Vl5Qt0e5qgDZQb+PklYm7896c3sPm6IJv5xu+eVZvLD
 aDrQxP4FDn0bA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=C+rGX+kM
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6, 12, 18, 19}.x series
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

Hi Bernd,

Thanks for the patch.

On 18/04/2026 16:32, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  linux/before-6.17/linux.hash                 | 10 +++++-----
>  linux/from-6.17/linux.hash                   |  4 ++--
>  package/linux-headers/{5.10.252 => 5.10.253} |  0
>  package/linux-headers/{5.15.202 => 5.15.203} |  0
>  package/linux-headers/{6.1.168 => 6.1.169}   |  0
>  package/linux-headers/{6.12.81 => 6.12.82}   |  0
>  package/linux-headers/{6.18.22 => 6.18.23}   |  0
>  package/linux-headers/{6.19.12 => 6.19.13}   |  0
>  package/linux-headers/{6.6.134 => 6.6.135}   |  0

Any specific reason for not updating the default versions in
package/linux-headers/Config.in.host
or did you forget?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
