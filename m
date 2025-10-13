Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C887ECCD185
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 18:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 727C641394;
	Mon, 13 Oct 2025 18:42:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1mXOROSMB0wI; Mon, 13 Oct 2025 18:42:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8875E41395
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8875E41395;
	Mon, 13 Oct 2025 18:42:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ADD22BC
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EE4182F87
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:42:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DiDqfcNlWLqL for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 18:42:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AC04182F32
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC04182F32
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC04182F32
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:42:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8AC5C2003D3;
 Mon, 13 Oct 2025 20:42:48 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 13 Oct 2025 20:42:48 +0200
MIME-Version: 1.0
Date: Mon, 13 Oct 2025 20:42:48 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Daniel Price <daniel.price@gmail.com>
In-Reply-To: <20251013154349.107884-1-titouan.christophe@mind.be>
References: <20251013154349.107884-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <4d05087c0b8eba12d673328d851a6d79@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760380970;
 bh=IFQERtC5F++FIN3z1meuQfrxAF9L8EZCzG7icx09MAc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pdGzi5Bl/TRSGZtIPwnNc8k3n9BeYqHL4KI5clqA/qLAvKrXKelMJnq9SkW4S+jya
 s2htROb0beZFZjupR2w0fyApqY8tyI8XojSbGBZ2ScMPCDKsrhAcqL46km79h2TCt4
 HBC36JNtVqk+sJiLX0B33W/MLeh1/zYf8y0W0myzaRwoSge6Ffoj48mVe1NBtpnDwp
 LWNNNXsFDX+Q6uBrmsa0tQiAqQcQm+Cq1FUNCI8+1WviWdXEQaGM5mh/PmxXUmhwSk
 TvM95REE8yhpYNB8FYZQjpsUUGB7L6XUMo93JVYWn0n7qdu9mePzozlBUh1MbUDnQw
 JRzd6BmYiXliw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pdGzi5Bl
Subject: Re: [Buildroot] [PATCH] package/redis: security bump to v8.2.2
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

On 13/10/2025 17:43, Titouan Christophe via buildroot wrote:
> See the release notes:
> https://github.com/redis/redis/blob/8.2.2/00-RELEASENOTES
> 
> This fixes the following vulnerabilities (in the Lua scripting engine):
> - CVE-2025-46817:
>     Redis is an open source, in-memory database that persists on disk.
>     Versions 8.2.1 and below allow an authenticated user to use a
>     specially crafted Lua script to cause an integer overflow and
>     potentially lead to remote code execution The problem exists in all
>     versions of Redis with Lua scripting. This issue is fixed in 
> version
>     8.2.2.
>     https://www.cve.org/CVERecord?id=CVE-2025-46817
> 
> - CVE-2025-46818:
>     Redis is an open source, in-memory database that persists on disk.
>     Versions 8.2.1 and below allow an authenticated user to use a
>     specially crafted Lua script to manipulate different LUA objects 
> and
>     potentially run their own code in the context of another user. The
>     problem exists in all versions of Redis with LUA scripting. This 
> issue
>     is fixed in version 8.2.2. A workaround to mitigate the problem
>     without patching the redis-server executable is to prevent users 
> from
>     executing LUA scripts. This can be done using ACL to block a script 
> by
>     restricting both the EVAL and FUNCTION command families.
>     https://www.cve.org/CVERecord?id=CVE-2025-46818
> 
> - CVE-2025-46819:
>     Redis is an open source, in-memory database that persists on disk.
>     Versions 8.2.1 and below allow an authenticated user to use a
>     specially crafted LUA script to read out-of-bound data or crash the
>     server and subsequent denial of service. The problem exists in all
>     versions of Redis with Lua scripting. This issue is fixed in 
> version
>     8.2.2. To workaround this issue without patching the redis-server
>     executable is to prevent users from executing Lua scripts. This can 
> be
>     done using ACL to block a script by restricting both the EVAL and
>     FUNCTION command families.
>     https://www.cve.org/CVERecord?id=CVE-2025-46819
> 
> - CVE-2025-49844:
>     Redis is an open source, in-memory database that persists on disk.
>     Versions 8.2.1 and below allow an authenticated user to use a
>     specially crafted Lua script to manipulate the garbage collector,
>     trigger a use-after-free and potentially lead to remote code
>     execution. The problem exists in all versions of Redis with Lua
>     scripting. This issue is fixed in version 8.2.2. To workaround this
>     issue without patching the redis-server executable is to prevent 
> users
>     from executing Lua scripts. This can be done using ACL to restrict
>     EVAL and EVALSHA commands.
>     https://www.cve.org/CVERecord?id=CVE-2025-49844
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
