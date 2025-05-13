Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA42C3ABC9
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 20:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7C4E40925;
	Tue, 13 May 2025 20:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zztn5L4g3KVV; Tue, 13 May 2025 20:34:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17DF940C51
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17DF940C51;
	Tue, 13 May 2025 20:34:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BF6E312A
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B040B80F52
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZzU5qHvlNaDC for <buildroot@buildroot.org>;
 Tue, 13 May 2025 20:34:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A545E80DBB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A545E80DBB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A545E80DBB
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:34:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E9E1513F8AE;
 Tue, 13 May 2025 22:34:37 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 13 May 2025 22:34:37 +0200
MIME-Version: 1.0
Date: Tue, 13 May 2025 22:34:37 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250512214829.462894-1-bernd@kuhls.net>
References: <20250512214829.462894-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <39babfb31a7ee3aafd4582793fbdef78@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747168479;
 bh=pIDBWLEvMlN+c7Ghu3V9SJhQl7ueS92Wj69cRPR95iA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Wx0xqZbPoOq6/o+2AYe9PItw+qWTtok+Jh/npTipdrIhvjxYNf7icLp2poxe+1P06
 ZleogoCyY4XnaMPw1Mkn9XgAFtkJtgkeRrTXFOFXrGdo5C/L9WI/KgLWm+ZaQvWB90
 jdW/XJZ0Gx1jq/DM+yIq7WSdAh+80RK5+qxGbFZhapweiR9rW2TW4X64rar2xCLSt7
 5i1fgqtF2ysEGISE5PqQt4WmFJTcwfMonDJ5+VWrNQ8gwpiQXh6bthD+Uw8u8L5fRc
 QSP8zWJwDL7xt2xlGv1H0+1KQB4Mx7q1ZewYv/2bBw/r3gFjbJyJzZ9YbTc5NINy8o
 dIppL/caTTYow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Wx0xqZbP
Subject: Re: [Buildroot] [PATCH] package/dbus-glib: bump version to 0.114
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/05/2025 23:48, Bernd Kuhls wrote:
> Updated license files and hashes due to upstream commits
> https://cgit.freedesktop.org/dbus/dbus-glib/commit/LICENSES?id=ad08ba0c6ba2d69783d41254e0cf03b2ae1647db
> https://cgit.freedesktop.org/dbus/dbus-glib/commit/COPYING?id=ad08ba0c6ba2d69783d41254e0cf03b2ae1647db
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
