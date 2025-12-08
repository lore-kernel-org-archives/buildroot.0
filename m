Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB39AD3B7E2
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 22:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C192E83CE9;
	Mon,  8 Dec 2025 22:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GKw14qD_G8wp; Mon,  8 Dec 2025 22:54:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC5E483CEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765234445;
	bh=35FocJn0T3TUGfL6zvBP9G+QsXaAbyoy9T+s12EfPVs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BdRvboU80lU3b1OecKd0AoRiSN8sVU0nMBCMUAYjAsHvdLBAXICa5fO58ny6sQokv
	 hKJDOl5I29BRjle430tPIsHnbGQoiicbYHu3WsXKZ+hdzJDs5+16JPKdbE4MLAXegP
	 1fYBdTWELxsukDFoVnF38md3Nf6DJyNiCLZUyXZK65cJoIpmmgMuzCkJW2gO/tOeMb
	 f8nvVFJdHB0xIYX4mQiZwkXLs6q9igA8/RlC4ljbuzQA1id5hEqIT2o99mKM7ramlZ
	 JlmVEbTo34vXUJcwgq1EYNea9IMOewme+9glnQmmvjQQ8HOFasciF+qbj9LDps1yKg
	 dGakZ36N1ACDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC5E483CEB;
	Mon,  8 Dec 2025 22:54:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EC8B3151
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 22:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDFF183CEB
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 22:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a5zCp9nN51PS for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 22:54:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D511683CE9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D511683CE9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D511683CE9
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 22:54:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 923255FF95;
 Mon,  8 Dec 2025 23:53:58 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 08 Dec 2025 23:53:58 +0100
MIME-Version: 1.0
Date: Mon, 08 Dec 2025 23:53:58 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>
In-Reply-To: <20251208224251.250119-1-thomas.petazzoni@bootlin.com>
References: <20251208224251.250119-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <2eeb2d80f6d7637a1048fd74775a872a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765234440;
 bh=PXQ5Cw940oSyFSswKWvfGqObYlmwMUtH38c0ilR0Its=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PKPt6eqoDMmaVzNu8yDWhO7OdAId8d/wlMoboahg/ifguew2S7052ofzwF7FXWa14
 S8oVyPhdtPYdHp2uO8c4QSfUV4Z9fWCPnJznt8gK6t1nTf99fpYwec2/nNMLKXVYn7
 GWkX4DlK9J74f7hTRSb4qU5hcqDerLiARF0ukJGj/cs2BeEPBdNm4SPj9eUiuqXWqj
 Gm6A/1qgfSUqOLeZ2qy+/Mul2QtLxKBiMhNZOJvOvMqJtQo7OsLgTAFCKdRerS8yTg
 2m11rRWiiVFofog+IAtuUnOGHai2UVrrbUfyZSMlu6JOFNe1IC9SP0sei+CK95d8OB
 jg3c2iHe8E0lw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PKPt6eqo
Subject: Re: [Buildroot] [PATCH] package/libtirpc: bump to version 1.3.7
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

On 08/12/2025 23:42, Thomas Petazzoni via buildroot wrote:
> Changes 1.3.6..1.3.7:
> 
> f138e68e7ffefa3f4d71857ddb137fff877fd1d0 getnetconfig.c: free linep to 
> avoid memory leakage
> eea92ef0bf2f3f0e337cfd074ebc34d91945f19b Revert "getnetconfig.c: free 
> linep to avoid memory leakage"
> d473f1e1f6ba80bfaee4daa058da159305167323 Update declarations to allow 
> compile with gcc-15
> 240ee6c774729c9c24812aa8912f1fcf8996b162 update signal and key_call 
> declarations to allow compile with gcc-15
> 07e45147b877c63a1d3dd1f5ae6070543b1d93cf Convert old-style function 
> definitions into modern-style definitions
> 2cfe608550dbe44ac8fc6c26216f529565713fc4 Convert old-style function 
> definitions into modern-style definitions
> 581152976f093f31957c48567278535ef54f6b3c Convert old-style function 
> definitions into modern-style definitions
> 2832da026b0812a23e65773b313b048c68147b09 Convert old-style function 
> definitions into modern-style definitions
> d3ff4c39bbcf22e3ff736261b66a9f6c6a6bf4ca Convert old-style function 
> definitions into modern-style definitions
> 791063e55d9739fa8c7c1a0d4ac1c4f8023a2843 Convert old-style function 
> definitions into modern-style definitions
> 23b0aa66a34fc6de16d285fbeb60b0fd68fa40d5 Convert old-style function 
> definitions into modern-style definitions
> 2c9ed28d9c364c6e7c29d9b5b740893a8baea014 Convert old-style function 
> definitions into modern-style definitions
> 41cb38e2dfdc7053ebcbd777cf868f8fcbcfcf23 Convert old-style function 
> definitions into modern-style definitions
> b73283a6982f83974b48d1858735649d6acf6398 Convert old-style function 
> definitions into modern-style definitions
> c717a52ed169701b2907ac8eb8678ca41b1533ba Convert old-style function 
> definitions into modern-style definitions
> 4eeb59a8dbcc6b4d3db1b81a00615f6e7832a97c Convert old-style function 
> definitions into modern-style definitions
> 7cea8ad66aecc21e6caae330b5d31075af399193 Add conditional version script 
> support
> 5bd87617e4b3129e76e79847c95bdea4b1290d9f Release 1.3.7
> 
> Our two patches are upstream as of
> d473f1e1f6ba80bfaee4daa058da159305167323 and
> 240ee6c774729c9c24812aa8912f1fcf8996b162 respectively.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
