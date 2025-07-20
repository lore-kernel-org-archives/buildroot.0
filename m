Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268A1C83F22
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 09:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2C7E41035;
	Sun, 20 Jul 2025 09:57:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DQk8oVeZuwWo; Sun, 20 Jul 2025 09:57:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BC7A4163E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BC7A4163E;
	Sun, 20 Jul 2025 09:57:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BA951F7
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 09:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DAFF404BD
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 09:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E57ksZcVkOQP for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 09:57:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A337940181
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A337940181
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A337940181
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 09:57:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 90C3413F8A9;
 Sun, 20 Jul 2025 11:57:48 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Jul 2025 11:57:48 +0200
MIME-Version: 1.0
Date: Sun, 20 Jul 2025 11:57:48 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250706064416.276504-1-bernd@kuhls.net>
References: <20250706064416.276504-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <30ff88d285a856d9bcadf07ae51d3989@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753005469;
 bh=WgGxIpB5nuta2xbGhH6m7yo7QwyCaT7T1qR+scCkXIk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eg+nalG53Wvwbpfje1u4f2+CYBxUT4aIS1RTGsS/c0hp+RUGKHIszHY2HfPUW0zTV
 SrXvdard23sVjFQilW8bXxMLJ9qKimjzw4130Uo/NW9SFVRMi/aVFH+i0isEMr96jk
 JGDGJAl/WMxaUtETgHp6kcrgDGVV4DBAZ4nQ3nnfHPjW33cionGKbtwGLu0hwZYlSV
 B6SQ/iWHloUwnvytVChcDZNDtQ9wCqLvQpBCvqhzU/p5ec86qz2zJSN9emaPcBthEt
 Dcm7zpipb9Qsk9sjow6ZYDHgKOYGK6vtg04+zCRIGZziyO9DNDSTjPTcN2AYzOQeGn
 TxanDXHd3kdKA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eg+nalG5
Subject: Re: [Buildroot] [PATCH 1/3] package/ntp: fix OpenSSL detection
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

On 06/07/2025 08:44, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.org/results/261e630f20dd20b7f606a7bcbd8fa7b50ce82fbe/
> 
> The build error occurs when libatomic is needed for linking.
> In ntp_openssl.m4 the result of OpenSSL's pkgconf was omitted.
> 
> Enable configure option --enable-verbose-ssl to help future debugging:
> configure: ntp_ssl_libs_l:   (-lssl -lcrypto -latomic)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
