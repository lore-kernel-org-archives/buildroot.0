Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4E8C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 07:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62A3A4027A;
	Sat, 15 Jun 2024 07:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id efPKxP-L-On3; Sat, 15 Jun 2024 07:20:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2C86404B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2C86404B3;
	Sat, 15 Jun 2024 07:20:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CFBF91BF30C
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 07:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C64178121F
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 07:20:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 74oSpIV329n2 for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 07:20:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1206F8121A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1206F8121A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1206F8121A
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 07:20:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7BACC13F89A;
 Sat, 15 Jun 2024 09:20:17 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jun 2024 09:20:17 +0200
Date: Sat, 15 Jun 2024 09:20:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <Zm1AsVNsCAxNt6XO@landeda>
References: <20240415162229.1357491-1-thomas.perale@mind.be>
 <20240415162229.1357491-6-thomas.perale@mind.be>
 <ZltDc6AXn_CC83Gy@landeda>
 <CA+h8R2r9ogzjdAjVon5UsU9TPp5wy+cYC+BUSGnRWF3bgnkMcg@mail.gmail.com>
 <ZmvYvp0LpjOofOR5@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZmvYvp0LpjOofOR5@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718436021;
 bh=Lb/qrzsvi1R9RgysH8SZEsdwLMYuOkFQrx5S2dbECpU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iCKv0ZXeV8uM8efe9HW3VofhWCAa9iA9G7MXBiP1pKDSGoxfEoJW6Zmw7MiurWb/H
 wzjiZ6GONGItcHc6hfYGum0OoNT+U0z/Tc0thZWB8+pvsdPTeCs+p2Jlwl0pM1Zc8N
 NbAopQxdyWerIbrCRz2adD2nHJ9ag64EGEroP38JHdjGl7pXtigBNtTenOEC5PFEiz
 pD/xg9x7Sccu+oPZl+1fwkO2tz3OVmzrgINFnQnHTIYpn24bHsp0wD49VyYPuvtjz1
 9I6z6oP4Qz74XolhheDRYOPZaY9mTx2KnzkHW/gNvfTGwgjbTERvieRE5J6vTtEF+b
 ah7mbAjvl/ptQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iCKv0ZXe
Subject: Re: [Buildroot] [PATCH v2 5/6] package/go/go-bin: new host-go
 provider
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
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>,
 Thomas Perale <thomas.perale@essensium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2024-06-14 07:44 +0200, Yann E. MORIN spake thusly:
> On 2024-06-13 21:07 -0700, Christian Stewart via buildroot spake thusly:
> [--SNIP--]
> > Do you have the modified version of this patch posted somewhere so I can test?
> Not anymore. I will dig in my rfeflog if I can get it, but that will
> have to wait until ~16:00UTC.

Here are the two patches;

    https://paste.debian.net/plain/1320319  package/go/go-bin: new host-go provider

    https://paste.debian.net/plain/1320320  support/testing: add tests for Go providers

Thanks!

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
