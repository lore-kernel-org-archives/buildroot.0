Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEA3C88E53
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 14:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AE6D80E7C;
	Sat, 12 Sep 2026 14:21:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FyPp4MALrPz1; Sat, 12 Sep 2026 14:21:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E932880E0E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789222865;
	b=Q0gFbvbjpwBy3TOOvoah7/H03br6I8cPtL6MYUa5HD4ex/1H6EnDji0nIWdn5ekPqSkh
	 d+vBmYxt+USQmbRRH6cpQl/5yx5G425oeKK9XiZyECpbS/hNl4CVMvUt2svmrFWKAQ5rt
	 GzdgTWkDNnjj3mssJPUgO3tsgIKvc8F1O4HGVbRgX3U2RzRykW80ZhZCaA9YSl6xbgTAW
	 gqn2d9+2WqiC9iQcm2UUe5ghGcHatrHbC/HpDfk/mCZ09QaAKTQn4rDhVnAlG69ePM34N
	 YCnPQ5mGAUtUolx/bpy6mnJZKRKUwu/N+7cqiDItcCXmBCsZ9avpGnf6JjAdE6G5s4g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789222865;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=wxy+IqRh/duygEuEW8FfQKClT6HHpPxam66mSgQrqNE=;
	b=NxvzIYiCeJXsLGtk9WpuNmCoep7v5jHeaqYkaPc+x6bj/99N0f5HMMbwK8z5t6HfETUl
	 MjGj9brITRdA/2Gl2ggnTViKix+XKAk2u1AhS05kD3pI2eA+xNHiHiFN5F5DtYmoTtRUj
	 KaYPjae6KOuSp2u62aRW95dAe5sy2BD6Ab1uv0wVWEB35H+11NK+6wf+YERlVqnyv7NHn
	 Zo1QdLYw7si/Jr/ZQTlCxz+Dwn5Xdc2GxWIaH1Z+WSpOKLdfXcS++PMYEyn25UE9YdFri
	 IuUOHOkJg8zlyy3h6RKTIQVAxA6IwA7kZyJe6h9E10FOXxa/D+rDf5royMgABDfy/xw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789222865;
	bh=wxy+IqRh/duygEuEW8FfQKClT6HHpPxam66mSgQrqNE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=imCGGiJqkXwZtCpJhaPJMQFkOmbXsTTnQn5impi4rZ5WzZVRLnWtr9myTzy42Gf5e
	 TsKG0r851DsvOYsgLjoDAw5/rrdY1hCumAc1k0YNwOiTaIt0rgt9TGrlJ+V2TJSg6U
	 nUgPBqmQC9SGFiIFAuZKTSfd++zdkhhw5T5hY8F4Hj91vAVkagMjG8oU0E+26K4lmF
	 4Fkqf0am400mMyRuAoZToIaNpzxdKmQCWMkkJXSk4CCbTLYSl+EZSj11DoHU6QUqRN
	 ePFUgNfqeR24KEvtKIzjXm03eCARTQWP7MAcFMHxBHKwX/xe6bXAsJYL/+gYNO71mR
	 4PbNKBYGpyebw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E932880E0E;
	Sat, 12 Sep 2026 14:21:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 70A98701
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61B34406E7
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:21:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DLMIEqwHWODH for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 14:21:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F12D340726
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789222862;
 b=MtJdHlG4QWFCflx/SZ7cBMCuSxpCtJketmam4npi1Ngcv+EMzKtRELqgVOCV9h++W70j
 oJE5XsKGdsxe1WtQdr5er8vQ+2CcO3uNjSE5As5F3cDccYrkojUzVvod/gmkQ71TPOvQQ
 oYWY/ik/gtq0YtV7ULG0znbXMacDDFwqRTWw+fSJ9PSRKgbuGOkr6vsjwEzDbrFGk1imw
 B99Kvp+9iQHueqeNDMekDnu5JhjWaZSNGu4eZM7ZwNgqPZpgUxAtozWp6qdPJi3YY3XLR
 XzPz6B1vz4TF+5803iOJevVLLMd8wDQp0P26eOj1yWGbFG4cpy0R+wnLO0cBe9x+1qg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789222862;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=XGzLZESwtnYUppLFXhRFPtQpXbajVbvCBt7R3G675Qs=;
 b=EaLh+Hr3SqJ3SYv6CrjJvhA+R+9k/V8oztGgisiubGuDh8U0OCn4oNV8F9+t+HV6yh79
 zUrGp2oU8ZY3A2+u7/Zg92uTNZNePw2nE5a+goPlDBmbsxXmk2jzzJgYaC+wt9ZfLh5ZR
 /vjsZya/2ZB06ETQVNUOo3SYDgKVDBG9WJ6Als6DSKUifa11HJGD9mTV9ptjI5vWuzzU7
 2ecxpn9kKaqEgYfLoYF0FHeveB+QaZorQJJWOBUM0/8icoRqZkaLH/k2fDrnMSggM4eLS
 5zAZl4nf6GS20Q4+yku7fwj40BHmxJ9T6Kkbs6w5NQP9PL/wFpLOXlGEqNYWlBlnUMw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mr5dATdE; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F12D340726
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:21:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 90A4619F58A;
 Sat, 12 Sep 2026 16:20:58 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Sep 2026 16:20:58 +0200
MIME-Version: 1.0
Date: Sat, 12 Sep 2026 16:20:58 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260910230816.1937334-1-aperez@igalia.com>
References: <20260910230816.1937334-1-aperez@igalia.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <c0979dcec43b777bbb83007e4e0796cc@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/xdg-dbus-proxy: security bump to
 verssion 0.1.8
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

On 11/09/2026 01:08, Adrian Perez de Castro wrote:
> Fixes and issue that caused broadcast messages to skip some checks.
> Release notes:
> 
>   https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.8
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
