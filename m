Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0246DC982DD
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDEC860E0B;
	Fri, 18 Sep 2026 19:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jEH-GT3wrpTS; Fri, 18 Sep 2026 19:37:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C983960E16
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789760276;
	b=Go5Y3DgtFWya4otNdRLk+/zPuzbcrA2sCBpBUnxqibeVmfkwB9tMOzhIidCJqAB93sKA
	 CZkH9Mp8C3Dwp3NYWs7L1jdo/KFDIl184Aa1AqB3v7flMs5S9q1QVXsYSYjQjxLFxAaI9
	 Zdd0OkoQkk1uEokKcmdkLfX7lxK4UlMB7byQGDzLEOGhAXLFZ85JB1HPKamAgfS8JDl/h
	 ChJUW6qaIk7NwFl7o5gFJm7Ie3tmYwe/zu9RrNxZk8Xkwh70q+TX9LlFfeuRbfOvWa0Dc
	 eYHh6Cm5pFaiaqa2OIesM+/gY9siP4tv+N4k5jXDx+s8xLqtVRgn+unB4QR4stgQ+Yw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789760276;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=+Xmr8t2+U0qum0tHqLdvu3IAXnZjwicKTJqeBKDHF5A=;
	b=QU0jWqNkaiD8w+06ajVktcQnKQWIu0sjA1sMSehyJ+sWpAOJfWkIB1Y/Uh3ognL+jQ45
	 2g1RMmin/h+W6B5XXpcfDGRn11yESmtUtqtnoPJpeYzkVxtsj7rl/pAk6W7gWPufi4a9+
	 y8PBwDkxhDXjZkPa8IaYegG1B6UMVrYjLajkM2uDMmKodLXO/v3yID6w8io8Lm/zjsnCY
	 4py+SvoHzhcntb0dNihddu1E6IWfnB8Vp4mB8jVerSTCHsRZwpzuw3pLuNUFlv/tIuGJs
	 6V3u+WyiUZeN+BA2vHKB75yJkpz2BtFHhAr6abRHTHikKsFcLW9ubcDSJt8Y94lin/w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789760276;
	bh=+Xmr8t2+U0qum0tHqLdvu3IAXnZjwicKTJqeBKDHF5A=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kXSt1xtkKx6Oy/FCpF2hfieeFE3z4+8JmPKWWbzJWevnPrum9lZLnPxTMFWOadrg4
	 hm7VoFrMx4wWh63ei4Irs6/g6ITQDxV1K9QqVnZ3mdzwkv5DwzwKF0EQUUOuhc+aHQ
	 GY0i04HfjwkcKvj/pUpWEiJj5XVUXCnIDGHof1YnhKNOsxcn20AVtZ4wZFth62o1Mz
	 9dyGxrcKUbL3RD5/VFs1tTl+CQWgb1nMNSezE7YzPzEalRmootAzzpWPiX0D40OlhW
	 ZNdeCO/SqmYvm2JLsG91f+mO4z6cT2gBwqrapQaoFg1A+m3nr0hX7wB2htezTdRtqv
	 xF9xYYRDt9+Sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C983960E16;
	Fri, 18 Sep 2026 19:37:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08BB025B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0605540B0F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ndGzRiTZYX5X for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:37:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3371540AFB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789760275;
 b=j9WkFrBvoAFTIfmufO0OQmMpDTsTR+j1QEaysNfxH/8w85e11E1gn7Rb74UQFiUm3nhd
 vBe4tkFnoJrtP16BHf8djHXplinOzSILJcWM+6L2ORDL6vi1ZfDTVa9gLqhi+QPbcJUlE
 MNWzWur1Eo5RR1bUDjSq98vtJo4y6QIz/8CWDCftrl10zCjKjH/971yhSyqOa3idaFCm4
 He+LZzOVVkrfmPW+f/CxjKD39v78Hc/+f/6ksRcww40kxN+PC0RRafnvxRZxIunmFWb+9
 O4STTkem0Y2aSD0+ydz0KmPqA9e4w9t5fHgO6aePWYbVVI7bGL7dK+uGPtlerWt+xEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789760275;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=T/JR0DrHp32PTe4agHc9Y9FuHwK/GdEFt2rCIcF5CSw=;
 b=m5ti/o0BrApSHcjVnMePVq6Nys7y+b3OoV+KPAUwIN/48eov0D8MNQ2UcMKIE9ybdmO+
 TLkNB44LlcvnP5NcMaZC6pNGihiLU0Hu+v/Y5YYZLTzs++BhAcseD0MfNxF37ZE2eEMjZ
 u4A6Lia58WY/ihmnRuTeBreujZN8rAMttu4ld9hpgNSkzJNhR78wo+3dxvudo2IohaMFB
 XaSWVMq0rvc2zj7SW5bOpE66JVuCMYD/0l1AOGfqf4m4CrPfsCJh5xMK7fd28BMLFwXwY
 ZabYulSxXuEYJA9lbgv8lG6wkDsXwkCi29DffNqSD1rjS8ug96Eaiej3f7AcDikdn5g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hyu15jML; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3371540AFB
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:37:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id E2C2578034E;
 Fri, 18 Sep 2026 21:37:50 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 18 Sep 2026 21:37:50 +0200
MIME-Version: 1.0
Date: Fri, 18 Sep 2026 21:37:50 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Stefan Hager <stefan.hager@ginzinger.com>
In-Reply-To: <20260915215100.2031555-1-thomas.petazzoni@bootlin.com>
References: <20260915215100.2031555-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <3f1d774f767f4e7d3d8433cf1d0aef9b@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/tensorflow-lite: propagate
 libabseil-cpp dependency
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

On 15/09/2026 23:50, Thomas Petazzoni via buildroot wrote:
> BR2_PACKAGE_TENSORFLOW_LITE selects BR2_PACKAGE_LIBABSEIL_CPP without
> propagating its depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS,
> which this commit fixes.
> 
> Note that this doesn't create any functional change: tensorflow-lite
> is anyway limited to ARM, ARM64, x86 32-bit and x86 64-bit, all of
> which are supported by libabseil-cpp.
> 
> Fixes: fd29fee3a3ac0ce45404ed256d2059836c352728 
> ("package/tensorflow-lite: new package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
