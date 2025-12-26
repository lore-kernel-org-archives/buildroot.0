Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD027E8FDB4
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 19:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9D8760A92;
	Fri, 26 Dec 2025 19:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cuSh2rcyS5WW; Fri, 26 Dec 2025 19:51:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78C0560A60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766778692;
	bh=ctyRN5dKyKmiXSmkjdQfknNcIADYYPW8Mdjj1nvAhKw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JKOrHOHtugV1d+il1IX2WSvz0bXHHzOC8v0R+4SzX6AGF2qapPC9afUdWYe/dXB1q
	 3qmZFmTDEUmu+Bh6d/u7zA5YKYBgdntLuY3PxmqqstS+lblpcn8Li9rBGAWQu0Z7Wu
	 /odxcoA9tWXo+L7JUDJYinqBqbb8p/ELSC2nRpVkmbE+t/FKohUbn3UidR3EPpcXiU
	 eKTiKldFEyrCebItvlbJWIdx9mj/paZP0F4/aXFoiHouCeW53nj9y1e9E+ZnAtEwSe
	 tkxVR4CJryJTPuDIOSu8OBTgC2igsefgxQ7X7+K+NBT3e7gTxijBVDW/UjIF50jids
	 InFs7+5PbzGvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78C0560A60;
	Fri, 26 Dec 2025 19:51:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B7FAB9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 19:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C53960A60
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 19:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xdir1wBIrgoy for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 19:51:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 58806606F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58806606F6
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58806606F6
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 19:51:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A16EDB00539;
 Fri, 26 Dec 2025 20:51:23 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 26 Dec 2025 20:51:23 +0100
MIME-Version: 1.0
Date: Fri, 26 Dec 2025 20:51:23 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Qais Yousef <qais.yousef@arm.com>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20251223210159.405013-1-thomas.petazzoni@bootlin.com>
References: <20251223210159.405013-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <36270861ba7caee9f606531df5bcc008@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766778686;
 bh=u0GSsX0sStWPj1ZCykC309Nr+Wx+AXtGCNiPckSXJFw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IIo4UV3VjEX+Q7YGoWZIQmHBn7vlVSuWEvS+gitgWUw+rMZVxbHgbpjTuLT4OkWzz
 5IkZpZA5vhDirBMVjkK0TYp2eHhqJTo5zqaljxyZXbsQIYEklmVXe7NERKT7SDexhO
 XpU3oFUZS+9LQZPaxHxLPnQIaIufJLk/CHr3GR573+gAvHd+yPY/1LV3kz6LZNZPSI
 PgTbP8BS4HrRfF08IByVUEvE67JaSSIpag9IqBpML4ir6rLvLMQCEyN92olGz231j2
 ku+XZIEkTmwza8wKLQEJXb6jSrJl+E6gfsTipUTqZSqaKkPQnFlN7UmmJeYh0l2GDE
 5GOKsjLTxVphQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IIo4UV3V
Subject: Re: [Buildroot] [PATCH] package/bpftrace: add host-vim as a
 dependency, for xxd
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

On 23/12/2025 22:01, Thomas Petazzoni via buildroot wrote:
> Since the bump of bpftrace to version 0.24.2 in Buildroot commit
> 97e2f63bdf4cc992787c570b17b099c41c5535d2, the build of bpftrace fails
> with:
> 
> CMake Error at cmake/Embed.cmake:3 (find_program):
>   Could not find XXD using the following names: xxd
> Call Stack (most recent call first):
>   src/stdlib/CMakeLists.txt:1 (include)
> 
> This is due to upstream commit
> df21d917d9cced77ebde1202c1b3508a169f46a0, which was merged in 0.24.0.
> 
> There are no autobuilder failures for this issue at this point, but
> the following defconfig exhibits the issue (of course on a host where
> xxd is not installed system-wide):
> 
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
> BR2_PACKAGE_BPFTRACE=y
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
