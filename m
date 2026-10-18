Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA659CCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 11:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6091480DFC;
	Sun, 18 Oct 2026 11:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AGf32BMcRSuE; Sun, 18 Oct 2026 11:19:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 79A4D8084D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792322348;
	b=UUtOUcDmoR8bsN6pQ3pbP9FBkRDqK71lgjYAkKekRgyHgzUPTeLvhxmEzM2f8EMdCS0J
	 8kAsgkajTVR3xnLuvZ8m6CBkPxhrLntqLIh3tYEmampP1kfqmx53KFb9SxhbypxtahyNn
	 2MhezvNtvuaLISOic0tsSS7dlFPLshIglQA3nzbtr2ead91ybQ2O8A8ZzAhtDjh7jJcwg
	 5M5gmgXiqPXlwmBXFwvYEW/cpHHx9ZjghcHubymUVFswv3GNErKQWpclng58r81WSElXj
	 1lpk/uwfwmPZDl9npqxpMJjU63kevR638/aAr8UUp2YWKLi9XSBeieHFm1l75pcMvAg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792322348;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=JlCWLvSQFrlFlggdRhi7AeMhvvKSJ42u2QRsESEfhjw=;
	b=QiUE4SRk44sECTHTiZvWV6sCAcP3B+EcS9rlJMu4k/Qlm/FqeHlfQjoyCZnXHTzVSV4C
	 ZnprGJ4Al3nGebu6m7R38MbsI2zFVkH0FAYQr2To5nRUGqyHVKjHOYvoHgDJDAD1BDjh0
	 kwaJMXwHdsln3MNdJlwiX0t3e3tEQCNmTb5DgCXXNVgVdgF5vcs+fAm2K09kMsx/dV+h+
	 hvhpGgWIgwkztbOnYEVmqoMNUAbDqAcUn4qTVOmI4jUr9vgZq2SnIgeyrN08/WrBPQZMr
	 0PTdXH6VJ7sBk6Bvpnj97G5ZRgJOd6MIPbpLjXTIZSqa6eljTvsRvAOZApcnSbyaipQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792322348;
	bh=JlCWLvSQFrlFlggdRhi7AeMhvvKSJ42u2QRsESEfhjw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IMdbv5t6ov6mkh38JUry0uZWERYVIjj013GcE/546AjudD3XDv5TSGLSVkPBWv4Nl
	 LgyfQ24qByPQ+pc1OUS4WVImL/F2McSJXgqib3ZNalzuAL46DVkBDdID8V+Kr7kzNx
	 JDKtFynkYi61zt4TsKUEcZKZ43s19oA3FZGVrZ/r2s0C7IL+0C3eNL34KyFyQKa7YV
	 us2vN6BgOE2K2mn2KTx+RkpzF0RhG7HOSw82hT4lmnemqCQtQ8NG3C6bhLoPkhQDG+
	 Lxm9GVW2ScQrceMqqRHIV1q3fBwPvSlXgKGvLwI5H5wjJnncoi/NVvjgODfy2L89GA
	 Ojbj/5sexbYqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79A4D8084D;
	Sun, 18 Oct 2026 11:19:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 566AB1AB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 11:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47CCD40707
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 11:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sb-rfWzXSo63 for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 11:19:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2524440637
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792322346;
 b=kBZIBvdOKGXoU3BVLhrOorSQ9q3hBYmMitYLsV7+RiCuwkQ3OXNcNLIA4+ZWfgwG9rOo
 xcczWHt45Tm7tSyXNlRgrFhBy1LEOL2Q5a80EQEGUK0yhMCAQiFc8ku9+75FSMImGtsHs
 tsRKb3JnU9jyTXLW+LQBEXLjvz8FddLYYPIMrhVdbHMwqXye5Cf/cG9yv+WPtlUFlcZ5h
 V6ag5uPmopobyRrMn40IOv9zCPwQGD98HWA/+fwPPcsfQcp25U9gOf1fAVhaZePEAiTeF
 R6rBcy7AWXXaA0X/kSPjx43KaVSwk0y3Y39uIaaHGWzr2RYY+ImYu/tlMMFju6Pe0zA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792322346;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=53rPmqs7W4wrLnuoBOeYYAiqbdQphG11/0vuemRdUtw=;
 b=ZoWhaemlhV9+6Di20LvtT/cCSz9AvrEAGftQBWD95vjF8t1DIhJPsVJOTOlDcqj62S8G
 K0aHBlozVp8mlWt58SXfdNpEnNMiT+yS2qK/OPCPZ0O3XClTt8MWtrAKLmRAKKKwQqL2E
 vOE/vQGtn5Ssdyg6GY8ASOyF9HqCYuyQVeO7DEHnrOUOLLEHG7xIgInSwUmkPdMC6ea7W
 Jd3YRh9PqSCCvowaJZYw7CXUsUnCePgkucnhIuWx0snfHNIo160nn4pY/6ulAigIn/vKK
 qkyuEaKShVA/rsWgfU0ncm+dqgrQ4YcyDyeIt536uWLpOBP7mmYUKra8iUK5TyOO4MA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=P33OviDE; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2524440637
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 11:19:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 708185FFA3;
 Sun, 18 Oct 2026 13:19:00 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 13:19:00 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 13:19:00 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Michael Trimarchi
 <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20261016065154.2826814-1-dario.binacchi@amarulasolutions.com>
References: <20261016065154.2826814-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <7ddd02bb5674cf66babdffe83979fad0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx8mn_bsh_smm_s2[_pro]: bump
 Linux to 6.12.112 and U-Boot to 2026.10
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

On 16/10/2026 08:51, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 6.12.112 and U-Boot to
> version 2026.10.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

Could you consider switching the defconfig to use a Bootlin
external glibc stable toolchain, please? See for example:
https://gitlab.com/buildroot.org/buildroot/-/commit/47f4e3810c981e8cee19d8a411b38c771ebd2381

See also:
https://lore.kernel.org/buildroot/9805a17b85de41bdd69c836d40e4b467@free.fr/

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
