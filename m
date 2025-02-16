Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C177FC021A6
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 11:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81B1F81F5D;
	Sun, 16 Feb 2025 11:13:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZdrOeGVxYNri; Sun, 16 Feb 2025 11:13:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9DF481FC3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9DF481FC3;
	Sun, 16 Feb 2025 11:13:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 508D172
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 11:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FE6940C56
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 11:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K63f-l3zrvSw for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 11:13:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 512F540813
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 512F540813
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 512F540813
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 11:13:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 6747DB00535;
 Sun, 16 Feb 2025 12:13:04 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Feb 2025 12:13:04 +0100
MIME-Version: 1.0
Date: Sun, 16 Feb 2025 12:13:04 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: buildroot@buildroot.org, Vincent Fazio <vfazio@gmail.com>
In-Reply-To: <20250214174509.2080655-1-vfazio@xes-inc.com>
References: <20250214174509.2080655-1-vfazio@xes-inc.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <11c64bf2bbc91837490b9dfb1a71bf7c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739704386;
 bh=P1uhbeWp74zE9DlU8rVZHTU44/YxI6+CCwqgkP15HSY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dOA2tqtPsPrvF6O7qfrdtAdQMGB9cHwTJsZrw+lvcOu4FnR/I1wiqvHI3xyVrtuR+
 veTxgz+kikpi5xyZyvEfkrD1jyAlKwFXgwk9WM1mynrWesSwWjtQNyh4E0VrzmSZPz
 Bf5GMZc2G+3T/lkHbGUb73ZF5sG1faiT99y/OmntgKRz8OPWS2BOy7l1UM4bYacE2+
 RWqk3OpxvWFc8yNDu+ASCzlbnQioj+B9XoAffXDJeZXPA8FwvWAfw/1OfeKzalxky8
 wXcLGrCagrfmaY9QQjO9xUbbE+DZtGV0sdTqE8ZM6zsdlKsz0qE6Iv2EVKzadxzP/L
 ymIF74c6f2w9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dOA2tqtP
Subject: Re: [Buildroot] [PATCH] support/testing: test_python_txaio: include
 twisted sample
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

On 14/02/2025 18:45, Vincent Fazio wrote:
> Prior to b7d251293a20, txaio would test both asyncio and twisted.
> 
> Add back the twisted sample and include the twisted package in the
> config so both modes of the package are tested.
> 
> Fixes: b7d251293a20 ("package/python-txaio: drop python 2 support")
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
