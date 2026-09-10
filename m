Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0454BC79FBF
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 20:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6C9640B36;
	Thu, 10 Sep 2026 20:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oo78WU10Cq0r; Thu, 10 Sep 2026 20:01:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5535940B48
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789070505;
	b=XVfTxqFNuOKPVKKDYdZY8uVZQJd2Tut68ybHud7rKOn1+1OJrdrifRwE2BO2g5pVaNr9
	 Gn3XzvsjV5dPD7pSnqwdmShrDH3+BfYmgvFzB5/KxjKpgtccO9RmwdVY4TwzU0VyGIv+r
	 FZsUaPKB/hRUg3yJL2wxNPjXEgVslyEleuke6NYffCSrVnOb5YRx5MblHn5fMoIp3qDXC
	 g06oqr6OKeVg6lQwNnTN3CMAAtT9c+RzNQ4a4A/mVTvePojqbYK/AvaLzMusmksdCOOLE
	 3j/p/wKV3TIQFQDTCtGgBm9tu4z2R/+iXSOhhJCiPCFWqz1Ud7PLA6iRlWGuGjoffkA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789070505;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Ch/KwB48JcaYlI5ba2gjISQaIqyZjzba0M7HBDYAaD0=;
	b=XhS6MQLKv/UaDcUFW/jqrOXQWlKMtlWoq3O267mPLgqNDkFMJDynl/kADgG5AsL/GbTj
	 N3FTTmA+wW1hv0WNnmi5jkEw0ZJaTKjo6/zg2GI+g1SfJqaH6OrbMiNNolB6kXy8Wp6Ap
	 JLLrv8dtPzjl+YBaI7+5brETXBQsptv9zm4vbJK1oQPdobDqpP5J89FBmY8nOSmObun8L
	 UVnzlWxR3q2hWStoUZw2aT9a+ARzt3aOJA92ULFY0gkwmS+vZucwCKjRuBIiyyFMdF49I
	 2p64Fdnyti/0kZiw8JH1iQM/QvozrxpsDhMnfoWj21QT3++EYkZ3lDp4ocg6K8OFBVw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789070505;
	bh=Ch/KwB48JcaYlI5ba2gjISQaIqyZjzba0M7HBDYAaD0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Xgk1O+Yd0JBj27QHBoqV8Rle6ZJmlJlwTP+qmK6ywaSjLD/cXoJYLubF2rZlLTvhp
	 axU1MUVWz8GTlxe0ag1Iqy2kXXCp5srfFlJFE897orQYLYBLY+6XbLXEQlHBf+8ivY
	 M+pyYsIVdkO8y5QGQPP5UEScfHkqjwPxbxRxMqTnfFkdxmjnZ42vNojLvv8YnIhSR8
	 D1Mhicz8o1p3+UIJsp+4pg1liB/Kb8e2KSnzNmowQoWpugLwaUNwA7seGQxXyrre6w
	 mqazWG/JItYBk7M+v6ZTg6LqiVqFQkm+jAwzYKTaQxmvBJ1hUn3frwhBqT3G0tYkcE
	 bAcao/CIrDbkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5535940B48;
	Thu, 10 Sep 2026 20:01:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 832FD14D
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 20:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7497960BB7
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 20:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TbUa5a_6tBec for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 20:01:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C682C60B7B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789070503;
 b=V6lnsrhStQv2Xo8RZyBl3qZjNOkZ3IEw9yKoESYjpV9VjlCdIJ1x2brGVF6TwiLP5wCp
 QvoIMDuSdKmrRVbIhxwrdqtl/YC9OWCgePw6pTb9b4RC5Mz6eoP3SdBx/kwPnyndZLD7S
 B9TGZcXyZtEiDomi6r8Uc9cKtKFZaEu6KuAdLh9zfoKfw0WsnLQsaRsjTa+npKoVQhXvk
 tUP8YgVCGk3snLtnHkJeORDC2Mt65dORU8/Pr2kKY6+crGi4GwlE9xpM6ojN/BYc1aZc8
 MDueMdB9ZD1KE4mBnNCaSsZrPSQUs31GMaJVlE8ec9nC/S2H6BNBr/uJRFHUphwl6Uw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789070503;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=gO8zcyM3gxYRNUh1srpjRd/imLS+IamV+iIX+0LMeb8=;
 b=IN5kL8RQ/gOyCO+NUdPVJbkgfOv/V4VMaEJOB1TlY+Pg2RYynEFUUcHpkMDLsqTIplQ+
 N0U6LmamLX/LPpOc4JS5pbLAnv4J4ZmLMdDhurfhr+JYmg3duMSnbv4dv7PInbJeGXWvr
 mRSzMZFzq72PTI0f0nMWgMV5y3eDUmj/gePSr0Y0jCfjatW3zVNvJwsWaNVBnoJYRzYRU
 LeOb8GJ0chPlCJWmqouwQeKveE7QLlofGH2nUBLJdbxDm7+gSy7wtNEu7NeCDcWDQ21Wn
 S8kdm1m5vJsr9k1C4MLu/H61r2ucBejIcY3G2yYI0KPd5c1ev5IEYnXB0llv7MH+mfw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=lfu4RF+8; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C682C60B7B
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 20:01:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 417EFB0055A;
 Thu, 10 Sep 2026 22:01:38 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 10 Sep 2026 22:01:38 +0200
MIME-Version: 1.0
Date: Thu, 10 Sep 2026 22:01:38 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260910095223.1597453-1-aperez@igalia.com>
References: <20260910095223.1597453-1-aperez@igalia.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <98a3e0f65ab3ed8e1b2723d620cce2d1@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/bubblewrap: security bump to
 version 0.12.0
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

On 10/09/2026 11:52, Adrian Perez de Castro wrote:
> Fixes a sandbox escape through symlink traversal tracked in
> CVE-2026-87766, which affects all previous versions.
> 
> Using the bwrap binary with the setuid bit set is no longer supported
> and user namespaces are now always required, so a kernel config fixup
> is applied.
> 
> A new build option allows indicating the minimum kernel version that
> will be used, which removes code used for backwards compatibility with
> kernels older than 5.6.0 when a newer version is specified. Passing
> $(LINUX_VERSION_PROBED) seems reasonable here.
> 
> This version also changed the license from LGPL-2.0+ to LGPL-2.1+,
> hence the updated hash.
> 
> Release notes:
> 
>   https://github.com/containers/bubblewrap/releases/tag/v0.12.0
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks. For info, I fixed the linux config fixup (no
pun intended). The "_LINUX" was missing and the fixup was not applied. 
See:
https://gitlab.com/buildroot.org/buildroot/-/commit/4cb6193d2eca39b1bd79ff4867c842f507f692b8

Best regards.

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
