Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC847E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 18:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F0F8404A9;
	Sun, 29 Dec 2024 18:16:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vYRzOaaiozl9; Sun, 29 Dec 2024 18:16:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DF36404AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DF36404AA;
	Sun, 29 Dec 2024 18:16:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 677EEC8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 18:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4919080B93
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 18:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gcVN-4lJ4AL1 for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 18:16:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4AB8D80B5F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AB8D80B5F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4AB8D80B5F
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 18:16:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 20FFE2003C6;
 Sun, 29 Dec 2024 19:16:00 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:45292])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 29 Dec 2024 19:16:00 +0100
MIME-Version: 1.0
Date: Sun, 29 Dec 2024 19:16:00 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20241229155057.1910781-1-bernd@kuhls.net>
References: <20241229155057.1910781-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <5f44dbb6861a345afa389313eb845ba4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735496161;
 bh=vZNDkHvgORjzwRKyOHI4D/M+jU4RxwrbEchZFNiitRg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mLZLCYVJndhmqF65PgmXJTbVTu+p3pJKiMg8KLyy/MtNhIp4OAC9eFwRXzjWaeZRZ
 i/UzdlOWD77gBrbjathNV0GTceEVSmAjTNdTWWcUZoiQoKaYVwAsuVeHeGLZJBKYK6
 y+aWaxchNctRGXR8Lw796kK29uZwzsHEDmW0VV3bczwF86CQVI29IKxe8iZa3SIJda
 oqGjS+lEIWZs3rb58+hDqzio2j4m6Jt08ZNXvPI3E3ioXFSeK/Occ+4+otHkckutqq
 YnMX0bXm9qBi/2xMRbW428O5xjH5RxfUdVGc5BqlCzFhexlOJeGw1dK7rv2uQvrzFG
 dttTYjH+sYc0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mLZLCYVJ
Subject: Re: [Buildroot] [PATCH 1/2] package/kodi-pvr-argustv: bump version
 to 21.1.0-Omega
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

On 29/12/2024 16:50, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
