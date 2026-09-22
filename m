Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B34C982F1
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 10:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F3CE80DD3;
	Tue, 22 Sep 2026 10:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 712CYxwjg_yZ; Tue, 22 Sep 2026 10:20:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 064AF80DCC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790072443;
	b=UUJRZ39o3npp38BkWilEZLcU+/0Y1Q3mXinM3oJWgNu9JIX65nnnj2D8XLO5S5UklOb/
	 8IWBVfu6CcLs9pS1oQUdLyA/gYGiHxwkusYTyO9Irt9tTBZc5hRJkBVt+eP2L/PtoqlMJ
	 qfkTLEb8PwiC+tpdWcG/WqSv0cLjP3AM3d73J9BBYxu3C2p43tJ/r61VPfO4e3rw2Ihuz
	 SVOfIUuDaB3siFdppoeWhtK5olB+ga2XfZ55t4yOUps0hHEh7blHI8nqUG2tuyokPzAeb
	 25OLYfF8X4xrrZAgWj53bE1HCc1nVwoX4fODliwaPPlGfVilGelXSoHTJ96IhAl0xtg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790072443;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=wmrxsww172w2kiOuqGeUn7uqWcamhFV4nQmtNh0GdjY=;
	b=plu+yqW9wLbGS8wdUBPGFUtjCxYVhZriDBNzKlWtqh1APiYwvDk0hHkuBvL33Z1WNGJF
	 +d9BIlzAb8GTqeAvxc8lLaUNnuZoJ3KVXGcHBlzjnlIUuLG7DCEikfs/wYCIn6+Uhtm0w
	 nuNgOB/9s/Ko1XHavnX9NPo6FqW3MOGLSvELRAcKMo5++xUitBJmoZFf0JQvgi9jftRiZ
	 fqlTgR2Kwpz37u1ZXkJn/e3PjJCZzt+2zmCvm+pyDO9vNmO7Gf/6TautnVCx6bW92dYJD
	 GEWTt7dwOqJ2FBf1yaXJYhA5eNI2mU26SjU1Fg8DMS9t8wLqW9BVbRp377GxO7oP3OQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790072443;
	bh=wmrxsww172w2kiOuqGeUn7uqWcamhFV4nQmtNh0GdjY=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=sWRtchRPM282hxJgyYgblaJyuGN2+v+R1g5y3CQmHwZYVaCCkhzcUyk3eCAN9zehx
	 V0V1ATMSSMVOy3b9CwY6uoIQ4UiWBe5y+l2+yz16hhhccx5JnmXpYl8HwMHObYgK4K
	 x/WlzMRmGp0Tsdtj2evXJO8j3eA/PS8//XgqAG7C8FPS69WUbyD0GNucBIo9UXw+f6
	 bnNDlT8mQis/uQOQwAncuqD49WLCHSZX7BMXe8pG5qKDF1+AseZr+DBNL3BbUUWauV
	 GuE4nCMimGCQrdunTar8i6lrAyLn1liFN3wBwe6b/50Q8uoE/Wl629Y0s5BAPz4KRG
	 9AkKwPw8bciNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 064AF80DCC;
	Tue, 22 Sep 2026 10:20:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B3F013B
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8861A400F9
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QMNcxzMdovOM for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 10:20:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 03FDC40099
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790072440;
 b=DINVE0WOUBzI5uE7AoJVa6BD0NOA7fVHfnPwp5phCPFjZVIqUe6Xb0plXZfUUUie99dV
 1n6ck3M85YzqEdJU5FwLjAVzk3UoRHedkLPbQLgIGVf05ii1YvomaiOd+owBGt5a+Hzg+
 6SHtnRl0d1qP5WMkMc88lLj4xIlsViDtbGA+Z5caB6RUP0fecYYdQ2iCIkYFlsj2LOeZK
 EnbVCI0kUv3Maqkt2pjiYvmTvbQCKbH7ofGVHMjFPv0Q3hbe8a79xWgbb7V0dSOz/AB3H
 Jt27p3DOuMR1ORQrXJIuOeCkD1q7pGB2YlxPk6J+ay3UGWx/Xnf0j7CBxG0zqU2CWmw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790072440;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=IIAEE0nESdBpeFaq59VCLDVeEW1z9utJcIloppOTdw0=;
 b=A9YC7YyyDTbb+/vEWZV3JQbTaXtjeXiftHj7fUOYjI4ysxj3DPxhdL2JRtN2KORMcnFp
 WMqVii0LF6zuGfgQ7ItyAuGCW7awC327RRkagZugEwkHVmEA9avZJm3YiXIHnEqpduHFv
 lVpTwDg/eFQKPOizIbz98jdKbwWluVwEqRErWtVzyM8WyCKubeP2F+Pmr1kkJaLAR24tv
 Wq6FDw/gVs4APmUQi2iYVHL+qZoFzmejLFyiAbsznv971yeRkdHK+JwuauCISJH9j2Kps
 B9Q0CjymiKoxpy51cvbvLa1e/Wbvu6esFiH7cTnammXmaX/4eK+3436URLILHSFtBgA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=QqTRfjjl; 
 arc=none smtp.remote-ip=212.227.15.18
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03FDC40099
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:20:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNswE-1xOHXQ3oRU-00PfJ3; Tue, 22
 Sep 2026 12:20:37 +0200
Message-ID: <b8a22a39-53f4-4a2e-b163-44547b9b6c9c@gmx.de>
Date: Tue, 22 Sep 2026 12:20:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260922062915.83688-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260922062915.83688-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:LvW5xgQAnWS0s7umfQYaWnz+9RwsHO0V1Fhvg8Iv9JAd2Kjm/hL
 m8ypwZ377Y8ZGQkL+V3fb4eouPkWvGEKozQB4rA1cEoeE8RMqS9B9mu4jzRVTl7ihloOIy6
 27r/GJtpj6nVp4xEA84MYafxY29IZ/gKrx5uZ7GG4gL+ZMaC9Sc1gLELEe74gB3TlBp3dco
 ZFnlJgd9nHgo6PjcT83Bg==
UI-OutboundReport: notjunk:1;M01:P0:hZoj4bsYR+g=;HsNKOt5I7VZ/5QUPPuO+VxsIaXt
 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
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.12.x,
 6.18.x, 7.2.x series
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 22.09.26 um 08:29 schrieb Bernd Kuhls:
> Update the latest kernel releases to:
>   - 6.12.110 -> 6.12.111
>   - 6.18.52 -> 6.18.53
>   - 7.2.6 -> 7.2.7
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thank you.

> ---
>   linux/{7.2.6 => 7.2.7}                       | 0
>   linux/Config.in                              | 2 +-
>   linux/before-6.17/linux.hash                 | 2 +-
>   linux/from-6.17/linux.hash                   | 4 ++--
>   package/linux-headers/{6.12.110 => 6.12.111} | 0
>   package/linux-headers/{6.18.52 => 6.18.53}   | 0
>   package/linux-headers/{7.2.6 => 7.2.7}       | 0
>   package/linux-headers/Config.in.host         | 6 +++---
>   8 files changed, 7 insertions(+), 7 deletions(-)
>   rename linux/{7.2.6 => 7.2.7} (100%)
>   rename package/linux-headers/{6.12.110 => 6.12.111} (100%)
>   rename package/linux-headers/{6.18.52 => 6.18.53} (100%)
>   rename package/linux-headers/{7.2.6 => 7.2.7} (100%)
> 
> diff --git a/linux/7.2.6 b/linux/7.2.7
> similarity index 100%
> rename from linux/7.2.6
> rename to linux/7.2.7
> diff --git a/linux/Config.in b/linux/Config.in
> index 19c845a608..be3fa803cb 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
>   
>   config BR2_LINUX_KERNEL_VERSION
>   	string
> -	default "7.2.6" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "7.2.7" if BR2_LINUX_KERNEL_LATEST_VERSION
>   	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>   	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>   	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
> diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
> index dea492b9b5..fc203c9097 100644
> --- a/linux/before-6.17/linux.hash
> +++ b/linux/before-6.17/linux.hash
> @@ -1,5 +1,5 @@
>   # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  8cee19e1839bb6ff4d5254d761933ae6ab670492d5ed030e09a80538320d5c4c  linux-6.12.110.tar.xz
> +sha256  9e59dc67624188fa12a6601f9598499cd6662a9066be572b59f935e3d7849810  linux-6.12.111.tar.xz
>   sha256  b74a43d0630809b7871cc906ac155e956cbc0b2e78a7451f5e6c8bfcb1208c30  linux-6.6.157.tar.xz
>   sha256  ed4d0acb1307c235230c89efc094e210e6290593f94a7e617f28b1001101a33a  linux-6.1.188.tar.xz
>   # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
> diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
> index 9b4e1eafed..7ed646686c 100644
> --- a/linux/from-6.17/linux.hash
> +++ b/linux/from-6.17/linux.hash
> @@ -1,8 +1,8 @@
>   # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
> -sha256  039aef84f2b0994aeda3f4fcfc3d02ec9d7a9bbb9020ea264c43f446c860f606  linux-7.2.6.tar.xz
> +sha256  4ac34c47db2540ffb2713943f8d891ff1702e0ba6934525a493b7d1cad43145a  linux-7.2.7.tar.xz
>   
>   # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  2b69564f7d4fea0c859b1959ba33709ee6e9139bd100e30a853b57159a8221b8  linux-6.18.52.tar.xz
> +sha256  4d6fba95c2244b08a7b4144a4d38b9be4fb31abb5e7682ae40bb5cb11374cfe0  linux-6.18.53.tar.xz
>   
>   # Licenses hashes
>   sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
> diff --git a/package/linux-headers/6.12.110 b/package/linux-headers/6.12.111
> similarity index 100%
> rename from package/linux-headers/6.12.110
> rename to package/linux-headers/6.12.111
> diff --git a/package/linux-headers/6.18.52 b/package/linux-headers/6.18.53
> similarity index 100%
> rename from package/linux-headers/6.18.52
> rename to package/linux-headers/6.18.53
> diff --git a/package/linux-headers/7.2.6 b/package/linux-headers/7.2.7
> similarity index 100%
> rename from package/linux-headers/7.2.6
> rename to package/linux-headers/7.2.7
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index f855af4a79..dfad885f1a 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -480,9 +480,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
>   	default "5.15.221"	if BR2_KERNEL_HEADERS_5_15
>   	default "6.1.188"	if BR2_KERNEL_HEADERS_6_1
>   	default "6.6.157"	if BR2_KERNEL_HEADERS_6_6
> -	default "6.12.110"	if BR2_KERNEL_HEADERS_6_12
> -	default "6.18.52"	if BR2_KERNEL_HEADERS_6_18
> -	default "7.2.6"		if BR2_KERNEL_HEADERS_7_2
> +	default "6.12.111"	if BR2_KERNEL_HEADERS_6_12
> +	default "6.18.53"	if BR2_KERNEL_HEADERS_6_18
> +	default "7.2.7"		if BR2_KERNEL_HEADERS_7_2
>   	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
>   	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
>   	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
