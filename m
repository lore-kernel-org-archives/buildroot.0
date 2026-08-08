Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0A6C5AC67
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 07:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89B4D80F9F;
	Sat,  8 Aug 2026 07:17:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oNw3Wyg4gxWc; Sat,  8 Aug 2026 07:17:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DDB580F90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786173455;
	bh=PP1in2Ishu433jjwsamQi7Dis8AW1BlAHyN13c9VV7U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j7De9o3ueRg8YRSsYwLDj5qlmPzmjbHKiNqtKz0/gK0iMGMjpaNX3iSiLFfRuJwv6
	 VoMgaoQLeec4ADLE8S1FbPN4U0ye8/RJYTCJjxQn93g3qERhgdtc0bChWtmZLWJxHc
	 tnZE/fB5DUcZiKmbbJoOUqEZPAXDVaIUHiBWzmvC6hGv5Za7mkUZOz1EqesX7ubNAQ
	 RD2Ozksu6xX4T8kPb0ySTA5APSEfsmJjRKgRDG3DhKh11rUyUtnBve84HGawdr3dY1
	 WRNEjxAOhmqStbyWR7wzHvCEwK+clZxSGkKd6m6Gz/iwyoK/8qUFFtzdJynaoGo3UT
	 A9Ii8gQnTOnOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DDB580F90;
	Sat,  8 Aug 2026 07:17:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CAF0510E
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 07:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCE9880F90
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 07:17:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MdqppqFjSEdq for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 07:17:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B5CFE80F8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5CFE80F8D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5CFE80F8D
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 07:17:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 82F3D19F59C;
 Sat,  8 Aug 2026 09:17:30 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Aug 2026 09:17:30 +0200
MIME-Version: 1.0
Date: Sat, 08 Aug 2026 09:17:30 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260807184547.2521801-1-bernd@kuhls.net>
References: <20260807184547.2521801-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <7324a4ab2e676f9f1e123e9089f3c2b9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786173451;
 bh=bDFbAGRlhXR5gUgiK62y/o7/1LCehXd36ReJqVk1KAc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rgtIXnkA97bvG5S5zd/PLrrOVfdpGrA2kDuXnOyamk7kDXwyfic7iPVrcgf2Fvzy/
 nR/sh0Nmr2KhoyQQi0a9faJ47rNAm9APjZRYFWxYZ/AoLUmlO66NC9i/Du+/B38mPQ
 Vtnd5ErmbESQu4aYu6Yf8XrRVEVVI8MQjQy2n5ad1zWAG/M+n2dAeHCUArlvXfociO
 BQml3Qgq0xIrvEXnyEQrTbgNKVkkydxRok4VA+tnJZSMnYmUWq8x4I7P5Sa+iC8ry6
 kmYDWx7MnUG9RUjF60obfyJMJrzXbjORCbe6f+JHTxWajxB9lJ1scfcNkfqiMF9/u2
 Weh6QrSQBuTlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=rgtIXnkA
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.6.x,
 6.1.x, 5.15.x, 5.10.x series
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

On 07/08/2026 20:45, Bernd Kuhls wrote:
> Update the latest kernel releases to:
>  - 6.6.149 -> 6.6.150
>  - 6.1.181 -> 6.1.182
>  - 5.15.214 -> 5.15.215
>  - 5.10.263 -> 5.10.264
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
