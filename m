Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A64C531F9
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 11:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E734D60687;
	Sat, 25 Jul 2026 11:10:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pmPNq2g2pKxC; Sat, 25 Jul 2026 11:10:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B121960683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784977807;
	bh=igoBQQIS6o5FABXEcc4BJJXV+MGJa0YVRL+HiGsEmGw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IvoeS5iJZm8USILVMAuuPfPZBkf2Lr46iEe+WFZyUQzm5OKwouZr/tO4OvIWqG4mc
	 kjRZG7fYHG5I+2HzXHgr9CUNzzASiXGUevieE5p8FNZKs58zRUT81arvKZGrmb+3+/
	 hY7fW0jna3oPHDpf4pkhRi2V5CV0OnDUYZEta39buxNYYkBba7cRlZLrkOlgHlQRXn
	 9Lijn1diGS9YgXKhSRa3p/GokzhW78NINIwFjonZlTElILFxi0O4wSMwND5u7C0wd1
	 tXr3WYtNkUWtkgWKioKwGqQAbNINa6skXk1uqn4hf6w2eo52N45pHEuEYv4gaC8a5i
	 hCn3pCoskpYjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B121960683;
	Sat, 25 Jul 2026 11:10:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C11B977
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8257060683
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zeHBKhDV8Ncp for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 11:10:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B2E8960674
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2E8960674
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2E8960674
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:10:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id A36F22003D0;
 Sat, 25 Jul 2026 13:10:02 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jul 2026 13:10:02 +0200
MIME-Version: 1.0
Date: Sat, 25 Jul 2026 13:10:02 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260724174410.324552-1-bernd@kuhls.net>
References: <20260724174410.324552-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <597f58a12029e9ff3818f5c52fffd61d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784977803;
 bh=JRMbFHFV6PEGzAmNI7lI7QJMu17upqjeHRA3D1NEitc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KLhlvKWCbkdmcFl40Qd3QH9kJbtR8rvvMqUKpeJ8Sqf8Mer8bH6ZaVxlJIcKIqkbq
 93f4tacHzsyClRYea8H+U2yTqsA5mLkjVlsLJvQ72tp5aevpBXLcZS4KOdFWyjfv3K
 HX08GU01Ycn0Y5dYa7ZFTmpH8fjrIRZCmVF5Cst/ucGdy1iCwseypPUqRwnM9UuLbU
 YbjvkVLsh3WCDpMyB48c2kdVooOQVUqiRGsbKetes8aZSj4DaFhv8vmwVxbhBbZ1yW
 cS4iud1wWNn/NUDJ0U4CghdBbBGf2VRLG+JiJx6JFkcK7nVW9QBmhCNpqPU2fsnfoJ
 xLVIR/ORcyC0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KLhlvKWC
Subject: Re: [Buildroot] [PATCH 1/1] package/zix: bump version to 0.8.2
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

On 24/07/2026 19:44, Bernd Kuhls wrote:
> https://gitlab.com/drobilla/zix/-/blob/v0.8.2/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
