Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DC2CF6487
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 22:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31FF061212;
	Wed, 19 Nov 2025 22:39:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cVhcMdrg8ITU; Wed, 19 Nov 2025 22:39:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20D2E611FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20D2E611FA;
	Wed, 19 Nov 2025 22:39:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E88C37D
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 22:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 201E1410A5
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 22:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0H-meHtYRSpv for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 22:39:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EDB8A410A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDB8A410A3
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDB8A410A3
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 22:39:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 32DA86012D;
 Wed, 19 Nov 2025 23:39:20 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 19 Nov 2025 23:39:20 +0100
MIME-Version: 1.0
Date: Wed, 19 Nov 2025 23:39:20 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251119201930.459536-1-bernd@kuhls.net>
References: <20251119201930.459536-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <cbe864c027db8a84588620bcfa953b7b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763591961;
 bh=EjWwIAstRir3Ttbde1pIlmQbOS33AN9SMP7uxqznl60=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e2oigS8HfL9wRk6CJc6I/qqeCdfxx0BjSrW7S0G7u7CJArqxCfWjYjicx7qd0bXAT
 N+ug2xiKyepVyYMA6Glhm0AgD3EFFlbaJEDpqhBqzX7g479QPe5zE/w3nu6Y3olXQr
 8D2lLt9DvTJe5nE0XrsnaMXVfkCEzRii6FWEkdbq18MeFF+Z5lfIZOqLMY5m9/Z4vz
 EYt9HBbTaU+vJ5i1aNbKtLJ25z4zMv4twTihDlhCxkVPjX+vVmGaWAdTt2HRSVDIMe
 jNLqB0wHsXH8cWmS4YipmyO5PtrfAVffePwdUEQL651LH9UhZiwhgTuDZdAzM2I/Rj
 sOwJ/CN/TNqNA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=e2oigS8H
Subject: Re: [Buildroot] [PATCH 1/1] package/spirv-llvm-translator: bump
 version to 21.1.2
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

On 19/11/2025 21:19, Bernd Kuhls wrote:
> Release notes:
> https://github.com/KhronosGroup/SPIRV-LLVM-Translator/releases/tag/v21.1.2
> 
> Changelog:
> https://github.com/KhronosGroup/SPIRV-LLVM-Translator/compare/v21.1.1...v21.1.2
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
