Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552B410FC443
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 21:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CBC060FCE;
	Wed,  8 Apr 2026 21:08:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U1PEp2AsZXo4; Wed,  8 Apr 2026 21:08:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 220C160F89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775682498;
	bh=cOvu4gc/7NylUARp0JoI+Z9vSzTqHutzJKvPJ1uzSIU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ixSVKiv84DcJTesPcjP9LwYNZTyt5Up8B2FJTPbZbpan6WfHJ8NRYI5gRR8VvvIRA
	 29DHIOcwxlKBZvr2a8KXGYdx5RzYkqMF8HkQvsknE2EXm+fixvj4Aii8N7R0JZjEmo
	 Iexnu3AC1cRHB8B6R81oaSwe3pNE337QF9NPZisGJJhaZo4++UI1TZI6ypIWvZHfnL
	 QRHwOmSRDGv9RcSUuSW8fydV/nSDFlNqkbp9S0yMOslm2kc5YHV4p4ukimTuX8C3b5
	 xSRcUZgGj8x+8Syy3cP92R7X1LGM/BXYJCCUET1Jxb62e64S6jHfyXMLi5PtIJLq5K
	 rF46AIB/QXyIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 220C160F89;
	Wed,  8 Apr 2026 21:08:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A2E22C7
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 21:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3080D41068
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 21:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 08lr8VYkOWYN for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 21:08:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A85794101C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A85794101C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A85794101C
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 21:08:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 6847513F89A;
 Wed,  8 Apr 2026 23:08:10 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 08 Apr 2026 23:08:10 +0200
MIME-Version: 1.0
Date: Wed, 08 Apr 2026 23:08:10 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260408111214.4171863-2-buildroot@heine.tech>
References: <20260408111214.4171863-2-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.14
Message-ID: <38f6052ff8f2e02523c99e92eb69fd8e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775682492;
 bh=NQkR+svPWI+x4+Y66masCkmZSo8BZnD9HXx0Bag5m04=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MoDBysxE5XjOOZWTRAM2wsZeTuHAg08vXx/KxIsfZomxcJpNwKp7brN6Cp4/O5YaN
 IdETq307DZ0mTFtgSEmJc++CJDHYy2FEb7OVRda6Bv20oIC7mgN8kEScN2QvY4V+mm
 kSgfiMwyiPPC/W9Ims+yNIPHcXZ8p+BWzB/ORK/lQBR5mFxn2La72vibVMY0zFzPQN
 qPmJlO63mK9HlHvLjFTDPJ5/9z1JQ1aE22bZDoHV1gDWZjZQ2H2nS+gduPZiVqqt3U
 aWQWGJN4B5mZ32N2IVKzubQopTEwlt4yCkz8rbzMZdVKEbVAf5oWdhzf4/t20kKYhR
 R7JG8qEYZDX6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MoDBysxE
Subject: Re: [Buildroot] [PATCH] package/libglib2: bump to version 2.86.5
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

On 08/04/2026 13:12, Michael Nosthoff via buildroot wrote:
> Fix several security vulnerabilities of varying severity.
> 
> Release Notes:
> https://gitlab.gnome.org/GNOME/glib/-/releases/2.86.3
> https://gitlab.gnome.org/GNOME/glib/-/releases/2.86.4
> https://gitlab.gnome.org/GNOME/glib/-/releases/2.86.5
> 
> Fixes:
> - CVE-2025-13601
> - CVE-2026-1484
> - CVE-2026-1485
> - CVE-2026-1489
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks. For info, I added "security" in the commit
title and fixed the URL in the hash file comment. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/b9ea86b26a84b193a782007d559c899761364b21

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
