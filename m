Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71CAC98324
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 10:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F570608A3;
	Fri, 25 Sep 2026 10:25:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qdKHk56EhMZJ; Fri, 25 Sep 2026 10:25:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 28C4060BA7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790331956;
	b=CkQI4q8rvZ7ZSkg0U0GPxeVYpNfX/lEh3sYE9HtsvB/8VqchPx29I790DaMfQMTSy7VK
	 Ctz6g6ARoYigdMbvVkeIzJqc4YnTMNKzGkR0aAmu+03ILs0pjfrnm5z+WWw8rABu3B5rS
	 HZqdicExnMH/ZzhVxJXgniYqQo925J2PFbYMdwhWeikLPIjEgdItHit7iCL1cBB8bIAi2
	 xSPpP1DOtiFeVWqNlCVsHZsZhnit0oo3LX3phlZhSbADVRzFivbJyzeVng5n1mHHeWYCo
	 rlWnTv0tLjDUnmWkFH4+YQZpnZyecXwMoBl3CbL1fhqWqaRCsgoMaiep0r9GzSlmWxQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790331956;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Dg2Gg+1R4ajmZGqQwgLgesXyE/mQXodiaHTZMznozfU=;
	b=VLFmZg3oJyqolpX7kNR7EtSlvUkUX9r1Bct+WSZk45Mg8ByKEtjaTPJHoJbfUkNhi6i0
	 ScNyNXgDySnMAsWYRcFeIjV5tgW9hxexMAioXMfjAFA+QhNDhC+dsQjZsTl4F1oF+64vm
	 QpmWT1NNdYLBR1uK+6y49+fCjPzB8WfCditTmQkJnLWyWY3JodQhkUHaisyp0BO1LOiHs
	 2iGn5MaWT4WbK4/ZjEF4u4sd9hc8X6TCv2gxws4A9RgBkzBA7PMUJQiZHKYI8DAkj4pux
	 qYQFFdEVo6aoHvgtaldg91gnshiUwyaqmJA5/+6FMKdZRCxZajPP7904EA17HQ8KbbA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790331956;
	bh=Dg2Gg+1R4ajmZGqQwgLgesXyE/mQXodiaHTZMznozfU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=U15He4j+/RpaqI/HqP8eY0y9zxlUyUWponBXMh4gIZoMzfJR81VgYdgY6c+0HbyiG
	 48N71aaTYovFJ0pFa8Us2p0x2zmhkGqZXHw34pdW+nBC6YetnR9sknXW+g3kXwp44D
	 4g3ckQ3+wbdvLUYGyRDoWKEKqCG/B7X9k6V5xIBZc2dXyNWr2QFSs0QrWtiW8z0H/f
	 Tmu/B7/be9KsPE9SKe0NSNWWMsAGg5lBtDRdnPsY6CdKzcHIQmdhVXcaIJXQg+7SSd
	 3VstBr5RcWxcvsbOjngjOiZiDE6QIyCObHgSGnMzFyWAYz1K3TbF22YR+tjP+ne9fa
	 9enueZgfR2h5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28C4060BA7;
	Fri, 25 Sep 2026 10:25:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D194FD1
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 10:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B734760BA7
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 10:25:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YWri0UIC8gj9 for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 10:25:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 58688608A3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790331954;
 b=T8Ot/9yNXSvR8PgYw/KmYmSR/C0Lo1/FOaqpqQRYN/hBSUNbQQQ1pzIgmJn/zvTFr7sT
 m82gMd4fgmgPKwl5OwxuJRsp0dkiWAp4Dafua0mtdabZaioq4xnuVTRIpSuEpOJyNU4KL
 erHIqWERPW+Gij+a8A+yMhuff5XpBOp5sSVdZXUFBO9DsgKlBKf3q5tvrnyGcT/3eFpnl
 lDBfT9uYOzNCvd9OKHqoAidCKtkiYiuiuq43AuV57MnT+DaD1r398XOKzXaoM7s2ATS6s
 ZNpAMP5iPWGGrf/OvO7nNwsFdz9WXVmThQxAs5269/dqKRqaS1IbTvOczbiiYBxrO9A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790331954;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=m8bmrQQO+7fb0NTFyuKER3XAop0iBgs7mAH++nchXs4=;
 b=cT8Cut883MizzefYhdMPWiv++KdlC0NU0L/OqPGylMze1v1nIpvnXjyT/bZuHiNMISHM
 4FKCmj5bjcORDiPxsMGejFMZYRNQIMfXTMgIT8v4Dwm4Ocq4t+3Cvyfs55Q146AZWy3Z1
 +n6/apVnO5wkJ38rIPnLwMQM4uKgebVTKy/ra0FvCriRAaOBC9sFIQXkfBBmHVk9qFL6v
 4JqD0fSATz60dsUnjPmV7o1h3C8TIRHlW0UT2z+n0OihztKEkgqqsiCPassuSI1SaYAdX
 ZtaQ1GQZ/Gb+17xN6cgDbGw5lbZWfMj+7eCMyOz0/o+uUh0vvdsB+ADd8s9NWbBPfJA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=TEyiw7dh; 
 arc=none smtp.remote-ip=212.227.15.18
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58688608A3
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 10:25:52 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mlw7V-1wRx852R19-00jptp; Fri, 25
 Sep 2026 12:25:46 +0200
Message-ID: <0e44b6cf-138e-460d-ba43-25a44e2b1203@gmx.de>
Date: Fri, 25 Sep 2026 12:25:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Ernberg <j@j-ernberg.se>, buildroot@buildroot.org
Cc: John Ernberg <john.ernberg@actia.se>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20260614155328.304282-1-j@j-ernberg.se>
 <20260614155328.304282-7-j@j-ernberg.se>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260614155328.304282-7-j@j-ernberg.se>
X-Provags-ID: V03:K1:ZfLsABHyTb2k2Hx9o9CLla6qQTyQdENON+qZmXHAzhIkGnc/ivK
 YFbBkq5BnJnuiX9c93YwlKrLpmkDAaoU61wlS2JVRZZerwR0xMLnzu0OwOIKGOJ1c09ugpu
 sxtBcMd89c1AifG7D4ih2YiYrSMLA705sD5fnSc1UF4wF6QM9JkBFU+apL5c62SOzbR1vUz
 cpHh78sru0TI36lGMgu8g==
UI-OutboundReport: notjunk:1;M01:P0:ob+cdkIWpIk=;59K1voumLk6vTeFS5jNo3Ifd21f
 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
 22slTuIic7xz84yUQ==
Subject: Re: [Buildroot] [PATCH v2 6/8] package/util-linux-libs: Do not
 install to target
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

Am 14.06.26 um 17:53 schrieb John Ernberg:
> util-linux-libs was introduced as an intermediate package to help break
> circular dependencies with util-linux, and therefor only exists to provide
> more basic versions of the libraries util-linux provide, to break these
> dependency chains.
> 
> There is no need to install these to target as they will never be used
> there.
> 
> Under all circumstances the libraries are built and installed by the main
> util-linux package.
> 
> This only solves the confict for target, the conflict will remain for
> staging as that conflict is much harder to solve.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: John Ernberg <j@j-ernberg.se>

Tested-by: Fiona Klute <fiona.klute@gmx.de>

I've tested that this patch does not break my non-PPD builds. In my view 
this is a correctness fix.

Best regards,
Fiona

> ---
> 
> v2:
>   - Add a note that this only solves the conflict on target. (Arnout)
>     (see RFC discussion for longer explanation)
> ---
>   package/util-linux/util-linux-libs/util-linux-libs.mk | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
> index 6716a656d2..d434a8f461 100644
> --- a/package/util-linux/util-linux-libs/util-linux-libs.mk
> +++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
> @@ -24,6 +24,11 @@ UTIL_LINUX_LIBS_LICENSE_FILES = README.licensing \
>   # 0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
>   UTIL_LINUX_LIBS_AUTORECONF = YES
>   
> +# This package is only used to build other packages that have a depdendency
> +# on util-linux libraries which in turn may be dependencies for the full
> +# util-linux build. The libraries that are actually used on target are built
> +# by the util-linux package.
> +UTIL_LINUX_LIBS_INSTALL_TARGET = NO
>   UTIL_LINUX_LIBS_INSTALL_STAGING = YES
>   UTIL_LINUX_LIBS_DEPENDENCIES = \
>   	host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
