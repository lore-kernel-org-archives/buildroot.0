Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58874C25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 12:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2199284636;
	Thu,  6 Jun 2024 12:20:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xgb8MWBrlvuP; Thu,  6 Jun 2024 12:20:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CE0C84621
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CE0C84621;
	Thu,  6 Jun 2024 12:20:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 752BB1BF955
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 12:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51EE984615
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 12:20:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uIKDPrbkl_oz for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 12:20:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A36C38465A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A36C38465A
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A36C38465A
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 12:20:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A338861D28;
 Thu,  6 Jun 2024 12:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02265C32782;
 Thu,  6 Jun 2024 12:19:37 +0000 (UTC)
Mime-Version: 1.0
Date: Thu, 06 Jun 2024 15:19:36 +0300
Message-Id: <D1SXGHPFEKX5.20SV8K8J161WZ@kernel.org>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailer: aerc 0.17.0
References: <20240606104813.1514-1-jarkko@kernel.org>
 <20240606104813.1514-4-jarkko@kernel.org> <ZmGaEE7E0c2FzWpN@landeda>
In-Reply-To: <ZmGaEE7E0c2FzWpN@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1717676379;
 bh=S6rf55G0WEWzp+AZ+mVEHC55N+5S2+yaMU/vVH7fwvI=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=thANTXU/y1sPYZdYwvm8NE/xtNVMKo+B7QgHbiTYUw1/6gy8Gw2YmMnMA1acvpuZh
 ZIsLaVT5pUMHfoEPZY2JQs8TVXqxNF/G8V9u/dDksIu2hDlAcfYMkIrGVlrptgHw8E
 w+Jr3m/x6JkZ2vGbv/nUr8IHz62FwxyGaJSrZKJRdyrraEfIsy1YONwfT0wGLvBmS5
 84Nkp/WWOB7724BN6R13XSOJqUYYNqeMIy3vODk02iyUG9IBcAtT61APf4mwtrzXP1
 Ih8Oq5rylg6PoTUpbdsIZOMI21OO6nZY1tKoGa0S5JqjKA7699eRSyqD/tYTsJSfhh
 C8qnq4MnJaSlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=thANTXU/
Subject: Re: [Buildroot] [PATCH v2 3/3] package/systemd: add the missing
 superblock identifiers
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>, buildroot@buildroot.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu Jun 6, 2024 at 2:14 PM EEST, Yann E. MORIN wrote:
> You forgot to add an "Upstream:" tag:
>
>     https://buildroot.org/downloads/manual/manual.html#_additional_patch_documentation

Yep, already found it, all good: "19.4. Additional patch documentation"

>
> Applicalble to both bundled patches.
>
> Regards,
> Yann E. MORIN.

BR, Jarkko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
