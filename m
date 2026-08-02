Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C195C55162
	for <buildroot@archiver.kernel.org>; Sun,  2 Aug 2026 20:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2635380C86;
	Sun,  2 Aug 2026 20:28:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P4xdSCTop9SV; Sun,  2 Aug 2026 20:28:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 366B380C6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785702522;
	bh=C5CTtF/mlubi0nNtVN5ilN8SY+RonElC0PMSYLWAw3w=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aOM9Uukmn6pexk214QtkI63POjPRbwClGHvABx9HKOVFNviMrl0yyiI/8NkPUvc14
	 qJBhMlGmA+mQKFDGoKYx57F+IZlxOaBFJBEHVyX0fWaiAX8MDne6cQKPstuOnOydNx
	 JlFko8tl7AePNhtUFcUM4anyT+yhxInKBfsT33kJJaMPTixzD0TK/6bptKCgVpTk56
	 n3+ff9OGWbRZ/X7TaxL1ba0+cmQF5j/r4PKJnsg7WKFQoii6vCmkRc8s+g1EXkzEJv
	 vbji5MgfjoMOerBdydlUcXNIKB/TqUqXnNNEMU4XmMzlDG+VGEuzNNN5rCgYh5j4b3
	 VP2Tbycptc7Fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 366B380C6F;
	Sun,  2 Aug 2026 20:28:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A5493A6
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 20:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C7D1405B5
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 20:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8XRCoefRgCrL for <buildroot@buildroot.org>;
 Sun,  2 Aug 2026 20:28:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5834D405B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5834D405B1
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5834D405B1
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 20:28:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 50F10780333;
 Sun,  2 Aug 2026 22:28:37 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Aug 2026 22:28:37 +0200
MIME-Version: 1.0
Date: Sun, 02 Aug 2026 22:28:37 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260725235857.2053672-1-ju.o@free.fr>
References: <20260725235857.2053672-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.17
Message-ID: <b6e8940bc5c8042dad5541ca26b016c1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785702518;
 bh=NCNVfJ8lgahU/V7x8mT5x82uQ00lsMoctr9Gpyut3Nk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mGpAEGel+xKinkLSYgwjHQacJyM8IAqTd8+Pj1zJZ08YTh3tm895IXrbCZusL68Ap
 /iv7aL+aIY60ezNcZAHI2Z+WH70T0QCbWViDGBIKct8kF7UrGjI3BAsZu9Q7IZ9DTB
 ZFSLLOsnZmOj5VcFett/UdYDhug6oAJKa2QmlKzYp8Xh294OoEPyCOxY3tl7TwoytZ
 Ci/mWrWT2CylGxtjTht7HXuLiCsR1kUAzBnYMXNMMZzzTX1VFOKuCQwad9OKcqe+rD
 c5cYR8ygYQNug9RfzGQeYYqfDmsnX6J3yOhEtxvL5ogbhJCJ59JyvcN+LapV3byAA2
 BHQX9D4MzUr1g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mGpAEGel
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: guile: new runtime test
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

On 26/07/2026 01:58, Julien Olivain via buildroot wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
