Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA83C27C53
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 20:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08D8B40105;
	Sun, 16 Jun 2024 20:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4I2X4fdDnwTZ; Sun, 16 Jun 2024 20:42:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C115F40153
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C115F40153;
	Sun, 16 Jun 2024 20:42:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 06C6B1BF2BB
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 20:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5F8D40650
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 20:42:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XzvzbDieBMcK for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 20:42:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 37D794056C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37D794056C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37D794056C
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 20:42:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7921A13F8A9;
 Sun, 16 Jun 2024 22:42:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Jun 2024 22:42:48 +0200
Date: Sun, 16 Jun 2024 22:42:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <Zm9OSDPCKocvJuvK@landeda>
References: <20240616124322.692320-1-peter@korsgaard.com>
 <20240616124322.692320-2-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240616124322.692320-2-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718570572;
 bh=9u2KcK3YxHKMa+F4mKTeCziftTB9SpFTHcHjSfbnN1M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n2qITLGYAP8HYIwlTSlX99zYMrBquilqUEs1PZ1sj2/pkxmJdnthaVXFbPMoWDUnE
 aOZY5W2GTJ91fzjbLqN8OpgfhEKtpK8sPl0hYS1hUQ3WiJpiIYL0BEwzpaKCy7zsGN
 qqB9gYasjurFICsifDg9TpGvUsjTkbODcArncTWfMTo2uzniA7Q6nOeDAtn2Jk2OHP
 Iyhpqg0PPJgUrmQP3Go1cg3Pw72YZq9Cpx4NwcKBv5oNaXLRZO9tPHqZgCFcmiktq6
 VDrbYWVhRyTBFdgmTpIZVFEXxza1OF/+6mQre3I+hWXdsNBgmP/JgHSn1l4fujSZH1
 eqWlE3mnHLrzQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=n2qITLGY
Subject: Re: [Buildroot] [PATCH 2/2] package/glibc: security bump to 2.39-74
 for post-2.39 security fixes
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-06-16 14:43 +0200, Peter Korsgaard spake thusly:
> Fixes the following security issues:
> 
>   GLIBC-SA-2024-0004:
>     ISO-2022-CN-EXT: fix out-of-bound writes when writing escape
>     sequence (CVE-2024-2961)
> 
>   GLIBC-SA-2024-0005:
>     nscd: Stack-based buffer overflow in netgroup cache (CVE-2024-33599)
> 
>   GLIBC-SA-2024-0006:
>     nscd: Null pointer crash after notfound response (CVE-2024-33600)
> 
>   GLIBC-SA-2024-0007:
>     nscd: netgroup cache may terminate daemon on memory allocation
>     failure (CVE-2024-33601)
> 
>   GLIBC-SA-2024-0008:
>     nscd: netgroup cache assumes NSS callback uses in-buffer strings
>     (CVE-2024-33602)
> 
> In addition, the following bugs are fixed:
[--SNIP--]
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
