Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD1AC636B6
	for <buildroot@archiver.kernel.org>; Sun, 22 Feb 2026 20:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B07396124E;
	Sun, 22 Feb 2026 20:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KmRlmEDzZXJX; Sun, 22 Feb 2026 20:52:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B46061230
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771793536;
	bh=UFz5QPYiXBn4VB/AFNTCnnepBQZrXgKxujvCTz2fYEU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A4v61grgaPVFOSddvgJTQv8rJUbQBYA0sc8qRMA488SqzBS4bjclIYW4EQKTZVNoh
	 z3l2cv3xzOB2pDDZLQbZyjdw/JQfuQjmDBlbV6bBuc8ZCFn2rplRW9KIqhKHRdORud
	 dfrXq0bXqWVv1HribUOATZirDCXnhhYPtT0anSRTscFtvzxN2BOWN1KT7aBxfQBgVI
	 WaUG5SBvAKjoa2m+VN2lMhwD3V5QojepBMShQMAiis9Sl8x9DWuHQBrwQFZzl43+4M
	 YkoRFLWVxzOMuEQarW/nhminXHYU/SHvLNODOh6HBB7p4z1nkooFXOckjKIR6Z3G2Z
	 dIkp79ILOmwKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B46061230;
	Sun, 22 Feb 2026 20:52:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E8EEC249
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 20:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E622B40055
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 20:52:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JoA6erU0asAD for <buildroot@buildroot.org>;
 Sun, 22 Feb 2026 20:52:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AF16E40064
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF16E40064
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF16E40064
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 20:52:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 656C92003B4;
 Sun, 22 Feb 2026 21:52:10 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Feb 2026 21:52:10 +0100
MIME-Version: 1.0
Date: Sun, 22 Feb 2026 21:52:10 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260222203423.272780-1-thomas.perale@mind.be>
References: <20260222203423.272780-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.13
Message-ID: <f327f4ff643c8f5bc62b0c1121b4a19e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771793531;
 bh=SAlaBgzdQyHq1KVIVFjL7JoC0iToBMdnlWR1ENx1Aso=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GH48vNDlmcPO480YeVXtoYU5h3YwcNEW6sIlI8Mnagofk9XR/nK4pw0J1xjU3lfkR
 Zct5Iya+uKES1RaqtP8lbjZVqbCA0S/UgJthpYAG84Bzy7dvL5vTLNm5G6bNn9I2qq
 iE9pSwiv7EQseoOfyYAAWl/koiq4xGew8ScYtsObFyZZj9Ski+wC2FAAmgLmj3uBkz
 uLugGwFEaK9NBlFuUkq9qo5E6jFe08IY4sDLuim0Jn+rPKmN7ByCD/eoaLi9kKFFfP
 N3mVwylFKfO9TbHCWKYJ2c3LI7DeZ/ZrT1Kv0C5LO3XrfZSiNvqjFqR51uJnrlOYtr
 sulidJeB9Sabw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GH48vNDl
Subject: Re: [Buildroot] [PATCH 1/1] package/netsnmp: add patch for
 CVE-2025-68615
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

On 22/02/2026 21:34, Thomas Perale via buildroot wrote:
> Fixes the following security vulnerability:
> 
> - CVE-2025-68615:
>     net-snmp is a SNMP application library, tools and daemon. Prior to
>     versions 5.9.5 and 5.10.pre2, a specially crafted packet to an net-
>     snmp snmptrapd daemon can cause a buffer overflow and the daemon to
>     crash. This issue has been patched in versions 5.9.5 and 5.10.pre2.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2025-68615
>   - 
> https://github.com/net-snmp/net-snmp/commit/b4e6f826d9ddcc2d72eac432746807e1234266db
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
