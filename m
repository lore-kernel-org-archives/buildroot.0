Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A17AC5DF81
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 12:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C9B04062F;
	Mon, 24 Aug 2026 12:02:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_3OIrStc_FY; Mon, 24 Aug 2026 12:02:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787572957;
	bh=tXb1E6augL8oMJieD7mmvX+LzKwS8WcoWVqOLzrDY78=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jcs0gJt2ac4kaDFIaATJNXexkxtuFvNiAqvDxIv3l9FjqxHWZnFSWyHb49Hi1Bof3
	 Y6eyRA76lpSEumJdgzlOMiZ2CPQYWrc/OuVtQ+0Pde/BWnjZ9kIAuApBrCnamQXdAw
	 Sg/BrBZNi3mAdNrFdqHxz4VBkibAC6a+su3ZUJ0MTtWvGt8xFwbzdhATR9rtmdrbDk
	 FanonO6bK6h07WhnFVcakipd+LtyKTu8ObeY/CuXU0Pa2S+e8cmCa74w0t/e8fe5QN
	 gNioKYL1Z5IicmN8blWnOztHTupcOZTHz8EH7LT4798cK4iEEQl3N5AYbnGK85C2ot
	 jq9UhHJrziccw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30EAE40607;
	Mon, 24 Aug 2026 12:02:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8215F2FD
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 12:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73EEB60606
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 12:02:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Gm2Yt7N72M7 for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 12:02:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C152E605F3
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 12:02:31 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAwXr-1x5K5E0MS9-001NUc; Mon, 24
 Aug 2026 14:02:29 +0200
Message-ID: <48fedb0f-9b71-4724-a72c-b2be39698b64@gmx.de>
Date: Mon, 24 Aug 2026 14:02:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
Cc: buildroot@buildroot.org
References: <20260824093528.3357438-1-rhidian.dewit@openpixelsystems.org>
 <20260824093528.3357438-2-rhidian.dewit@openpixelsystems.org>
 <46ea2d74-b802-42a3-9fa2-56c1f2b76286@gmx.de>
 <CAKWiKxEjHakTb6C8C9GpOq9DSxB5JwmP8fRwgkgbZXNm1gvfoA@mail.gmail.com>
 <608a2b06-49d2-4483-866e-59d2103273cc@gmx.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <608a2b06-49d2-4483-866e-59d2103273cc@gmx.de>
X-Provags-ID: V03:K1:F9PUNBoYWAPTN5hNglIJV6oHedWlx9Ei3oebpz4X1mkZsVQm8Vy
 m5z7xuNyTPlGDAEn3bihDyKqCagBppEWSEGepdRFN69nn8Gfe0qqQ3qr+vqwpS7i9Y2jCdX
 iVp0BajWLgwZF4uQYCWQKphWMo0fM0BZ0nfFntW/WAoWKz2mZoo26qAfF446NbyMR/zCj/r
 OyjF71IU8irk/61Zb/x2g==
UI-OutboundReport: notjunk:1;M01:P0:LgWG/pJ64Ks=;mXwbl7sarHW8ZeOlxF8qPoi5ubY
 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
 =
Subject: Re: [Buildroot] [PATCH 2/2] Check if bootcurrent is valid before
 using it
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 24.08.26 um 13:49 schrieb Fiona Klute via buildroot:
[...]
> In that case you need to add the patch files to the package directory in 
> Buildroot (they will be applied to the sources during build), and send a 
> commit adding the patch files to the Buildroot ML. The process is 
> described in detail in chapter 19 "Patching a package" of the manual 
> [1]. Short version:
> 
> * Make your commits in the RAUC repo
> * Create patch file(s) using "git format-patch -N"
> * Put them into the package dir (here: package/rauc/)
> * Add an "Upstream:" trailer to each patch (together with your s-o-b), 
> with the PR URL(s)
> * Test your patched package (I assume you have some Buildroot build 
> using RAUC), you should see patches being applied in build output before 
> configure
> * Commit
> * Run "./utils/docker-run make check-package" to check for any style 
> issues (check-package only looks at paths that exist in the Git repo, so 
> if you add new files you need to commit first)
> * Once everything's good, send a patch for that commit to the RAUC ML [2].
Sorry, here I got confused, I meant "Buildroot ML". Reference link is 
correct though. ;-)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
