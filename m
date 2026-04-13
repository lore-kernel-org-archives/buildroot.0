Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740B9F531C7
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 19:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33E9A60F0C;
	Mon, 13 Apr 2026 19:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pTOtRPQADDNb; Mon, 13 Apr 2026 19:21:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4443460EF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776108087;
	bh=7kqUVwIKLPyOiex3TELnat2thP4nR4hGUq+nLGNb7Ik=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hCyJpZeRDq2rsDekVOKUw/dGWu6z67LFLUyN0FPJA9G0mwBVc12Nn4q0ndwyHGWDb
	 o57YnU5ePKPkTn8orhG1TWvykAnizKzjnAURx/c+mFs+bOFelwglZCviXWSrKJkJkv
	 SJVk2yLVLxqt3byd0sUh988fZ0OwNS7rqTs7VVccXe107TRiGNGdtkfv3tt3QosApo
	 tNnlkr3v+y/PlIJ2UlMF9TnYxNFkwHLRNChtcbJWW9xaZKRiBp7aSGIhFvWCLniQmr
	 96dNDwfw2f/NLVSlfoKwgVIJfhpR4S3jokFNE06YmlPIpF5UpZzgkJX5ddOkmcTRn3
	 0HnnAkv3mB8GQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4443460EF3;
	Mon, 13 Apr 2026 19:21:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 51904237
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 19:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3796A40352
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 19:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Xp-ZHHWYWye for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 19:21:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1F6B040130
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F6B040130
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F6B040130
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 19:21:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 1739513F8B8;
 Mon, 13 Apr 2026 21:21:00 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 13 Apr 2026 21:21:00 +0200
MIME-Version: 1.0
Date: Mon, 13 Apr 2026 21:21:00 +0200
To: Nicolas Serafini <nicolas.serafini@flyability.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, Simon Richter <simon@sinic.eu>, David
 Pierret <david.pierret@smile.fr>, Danilo Bargen <mail@dbrgn.ch>, Bernd Kuhls
 <bernd@kuhls.net>, Graeme Smecher <gsmecher@threespeedlogic.com>, Torben
 Voltmer <mail@t-voltmer.net>, James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>, Alexander Shirokov
 <shirokovalexs@gmail.com>, Sam Voss <sam.voss@gmail.com>, Saeed Kazemi
 <kazemi.ms@gmail.com>, Alex Michel <alex.michel@wiedemann-group.com>, Leo
 Yu-Chi Liang <ycliang@andestech.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Shubham Chakraborty
 <chakrabortyshubham66@gmail.com>
In-Reply-To: <20260410224221.1185631-2-nicolas.serafini@flyability.com>
References: <20260410224221.1185631-1-nicolas.serafini@flyability.com>
 <20260410224221.1185631-2-nicolas.serafini@flyability.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <dee8673040eb652e19b428d788433227@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776108081;
 bh=wZJMvpaTgjPCBVNc/I+RMlBTqATtCDFkURfrt6npTcU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Gs/20iMasA5zYGrFLJFCOR84JEwcHC69F0BYWrf7kirL2pYSImw577CbCdbJZkX5I
 TChNLFeP/9CSGpbyDMgl78MAIKI2gmsbMjDaZ+Hj7CVXXBQIpBP2yJN5gCyJCi8oow
 5QNrSyvqZk6aA4FkCD3FtlYfcZ8wKSjHHfY0rdgl/cbuspZkpay9mmuY3lR/GO3yYQ
 e7qdH1ouMF0JqqakHa6OTQYK5c+NjRZC+vDaHe97D0KwRMIH8D9uk09vO1LNPulsjd
 24TStkcXHMjQ4AfYw0U95XwH1kZADmpyC8kA6DBQFa6aTGyE0yZmkPASNYwwTV8T9Q
 Unpf8fzvMTisA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Gs/20iMa
Subject: Re: [Buildroot] [PATCH 1/4] package/rust: bump version to 1.94.1
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

Hi Nicolas, All,

On 11/04/2026 00:42, Nicolas Serafini via buildroot wrote:
> https://blog.rust-lang.org/2026/03/26/1.94.1-release/
> https://blog.rust-lang.org/2026/03/05/Rust-1.94.0/
> https://blog.rust-lang.org/2026/02/12/Rust-1.93.1/
> https://blog.rust-lang.org/2026/01/22/Rust-1.93.0/
> https://blog.rust-lang.org/2025/12/11/Rust-1.92.0/
> https://blog.rust-lang.org/2025/11/10/Rust-1.91.1/
> https://blog.rust-lang.org/2025/10/30/Rust-1.91.0/
> https://blog.rust-lang.org/2025/09/18/Rust-1.90.0/
> https://blog.rust-lang.org/2025/08/07/Rust-1.89.0/
> Signed-off-by: Nicolas Serafini <nicolas.serafini@flyability.com>

Applied to master, thanks a lot!

I squashed your three patches into one, in order to be able to use
git bisect afterwards. For full explanation, see:
https://nightly.buildroot.org/manual.html#_the_formatting_of_a_patch

I also marked the bump as a "security" bump, because 1.94.1
release note mentions fixes for 2 CVEs.

See:
https://gitlab.com/buildroot.org/buildroot/-/commit/f1f96c1ad006c9a65ac39b500ccd1c8581dd2fc5

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
