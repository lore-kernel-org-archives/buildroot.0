Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0049CCF9E3
	for <buildroot@archiver.kernel.org>; Tue,  4 Nov 2025 18:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C21A88130D;
	Tue,  4 Nov 2025 18:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NEEFHndA-gL7; Tue,  4 Nov 2025 18:29:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F052B812B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F052B812B4;
	Tue,  4 Nov 2025 18:29:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B398462
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 18:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F102A81290
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 18:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kha3fZpWOx4v for <buildroot@buildroot.org>;
 Tue,  4 Nov 2025 18:29:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F2942811C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2942811C8
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2942811C8
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 18:29:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C3DCE6012F;
 Tue,  4 Nov 2025 19:29:22 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 04 Nov 2025 19:29:22 +0100
MIME-Version: 1.0
Date: Tue, 04 Nov 2025 19:29:22 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20251104182543.4087242-1-ju.o@free.fr>
References: <20251104182543.4087242-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <7ffe1cccc25b1b0845092f673cb62866@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762280965;
 bh=vxN84cWmHLJw8LvDyTDacWcaBq+EH9QadHJww7g2NLc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dIIg346hePI/bPvWjghiVVQaywohMvicdmbgWxsX2KCDjiUMa8f4z6z++2ABeq4c1
 U34RmOGjGQMqcK+megZApeUx5tuPTZ9jqwui8RFVCmlYWTvdKeJtioftf2AEP7K0EK
 bfGNDfDX7deZg/LiNBwd0MRzoJV3U66C0Zy42rmJsDC/zVGsZ1rMNtETRcyxoYkXKr
 QEiX8pf64a1i09HudWT2GYPvbeYHL2S/BMY8daBCQC8+acb5XnzC4yKxJN931HFl/L
 cYJT7bxrQjWQmKJRgruRYPvkyAfYFJhqU4xP3gOCzXdSA3J3X1cgi37KqYQXPDbusi
 +HEe70m9PxoRQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dIIg346h
Subject: Re: [Buildroot] [PATCH 1/1] package/bcc: add upstream patch to fix
 build with llvm >= 21
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

On 04/11/2025 19:25, Julien Olivain via buildroot wrote:
> Since Buildroot commit [1] "package/llvm-project: bump to version
> 21.1.4", bcc is failing at compilation time.
> 
> This commit adds an upstream patch to fix this issue.
> 
> [1] 
> https://gitlab.com/buildroot.org/buildroot/-/commit/d6a7c0226333138721ae722b89e31a82cfb22ae0
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
