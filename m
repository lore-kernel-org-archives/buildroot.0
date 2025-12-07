Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD432D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 22:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CAA5820F3;
	Sun,  7 Dec 2025 22:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pny2dYTvpWCQ; Sun,  7 Dec 2025 22:43:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B4F882043
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765147406;
	bh=UZSeXjyI0m36O7WmqSQ76XePS6Sw6Nj7nxNu7OpVs+c=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZaEIehT3Qh6kvF5gpI2wO036HQN8F5eLT9Q/Khu2wRjFhLXnH42SGP1Z7eXkmGzjk
	 UMSmGtd1JNpI0NFkCeGmeY7WxTVV5C6PZov63iuCJI+3tg9JXCV1I6kfwMeB8i8HI2
	 DQ/JDJiYiwOa6RZoZK0njZOkNeNEef0UK3VGH6hhYDlJxVgEOQwS9/XijYBY2PQfjA
	 GzYf7apmjlcYjH2KeRM0RWyBjdPmVvOgRLi29jst4dg5KPw7a7l7Et2+TuvK5qnI5H
	 gQOhcq1YXDnucWBM6YIkwib7M5XHlzjzgu5kDdRtBxhx0trR4UfgssK/q3LUs9kZuQ
	 jKVjjXqMc/b9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B4F882043;
	Sun,  7 Dec 2025 22:43:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C3673151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 22:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B50984023A
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 22:43:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QGv0WdZmIUqT for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 22:43:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AE09040054
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE09040054
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE09040054
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 22:43:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 8C6AEB00563;
 Sun,  7 Dec 2025 23:43:20 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 07 Dec 2025 23:43:20 +0100
MIME-Version: 1.0
Date: Sun, 07 Dec 2025 23:43:20 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251207185655.351235-1-bernd@kuhls.net>
References: <20251207185655.351235-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <b065a41d0939a349528c1e70da9808fe@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765147401;
 bh=LFfWYA7cWHBXeNMlED7XcOYipOHmzztNTEySaSyTElY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HAOuBSdCTgifWlymPLvSrddZPEsA6degmJQJ16ZWAsL1q17eWRmuvJ9hey1O7+tUW
 e0HrULxYpBxFdK/QdHEWlLa1yiVL4Of10ACHMy6Ui1uTBISSjxFrydjCGiHT2+GA9a
 3B2VRO9sw2M+1ueGsbTW/aKt34CZEELB9/VyoN0mqjBwe9bj2V9xgIwALXwj6zC9c5
 FPTiTFNYujtQLLMCPFYhDlG2h2PZdlugAdxukbKmlL8oujsGvIYeeS0kYRpnF+YaeK
 q0DfEpais9qBIH8N00sCdX9JaTQ14Rhztxy+0UP7KZBtqMMEuf1baO9DYGOv/umFNs
 zmDMZLKgIoAeg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HAOuBSdC
Subject: Re: [Buildroot] [PATCH/next 1/1] package/openvpn: bump version to
 2.6.17
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

On 07/12/2025 19:56, Bernd Kuhls wrote:
> Release notes:
> https://sourceforge.net/p/openvpn/mailman/message/59266231/
> 
> CVE-2025-13751 which is fixed by this bump does only affect Windows.
> 
> Changelog:
> https://github.com/OpenVPN/openvpn/blob/release/2.6/ChangeLog
> https://github.com/OpenVPN/openvpn/blob/release/2.6/Changes.rst
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
