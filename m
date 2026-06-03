Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7C6CD6E57
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 20:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 472878484E;
	Wed,  3 Jun 2026 20:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vvMJl8abN5D7; Wed,  3 Jun 2026 20:21:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B12F84840
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780518073;
	bh=ROoJM/T+G5CWmrjJa5Qe1alYsXLTkfdGl9FDq11Mbs0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qLs2D+5EKeXrhiLpTEzpRNsgE6qBUGmxrE62vOJRapxgK4Q0TKzTNz6qvsuSQgBKE
	 wtjlkyvtMslWL65dZaDUZkTUIOwyyhFXdt8YVtJAH2H/xHw22Ql85owU4uuGiXVgNc
	 NzU4weDlfi2k8eyyMFjcOwIchKgRGAZ9w35MVQNV7EjKKdRm+D5kJl/Jy/JSWGVc/g
	 baiZSSVf5eBtzCRrfrnRUE57y0/1fpKM5GRff0cKxetVQeqdTcF3e6DSMzyFvX5Q43
	 8Agpgqxsny3/uSUuB7VFQZEukBHnbw05hE7ETTD4pWZ+Jvk7sQk+A89sN0g3QwQ6+b
	 Qa9eBVi91q2fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B12F84840;
	Wed,  3 Jun 2026 20:21:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 604752F5
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5164540907
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cmrgJ0wnhEuE for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 20:21:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 764BA406CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 764BA406CB
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 764BA406CB
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:21:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id F3B4978034D;
 Wed,  3 Jun 2026 22:21:07 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 03 Jun 2026 22:21:07 +0200
MIME-Version: 1.0
Date: Wed, 03 Jun 2026 22:21:07 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260602195538.2518105-1-romain.naour@smile.fr>
References: <20260602195538.2518105-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.16
Message-ID: <51671cde56716f7b450a6354a086cb60@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780518069;
 bh=cyGgECp8ohkO7H4M37i9KGT4qQVET1gktmRHcRtzJfU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ULbTymujwzIHuF5jCatrAsL+Q0GIr1jwT+zwo4uoxy6d+aeY+Y1npT1HBiAYpIxoy
 3Ux4eFvDAaBGDHUiC75i24rIACBZlURS3cPeOw/QbesM81yX8bVJADvvyGJlPMghza
 RUdsC3kOWmL6qWmeq7+lK2r5ZI6iUD4n33gkVD5rM+pzsKSK81FzpeCFFn0XAX/utr
 DpJqD0bp2xWco4h9RPhuLAF/lq3BS9iMs4PFcSLznG86JVUocVjLviueDaAbNcTJbw
 buMgKEZQq7Pk2g45PNLhNAT18bvoBjAEXr/7EH9hzF1LjXgzfDn8Hr7oGzDZIIXdUx
 NVrCmDDvxOvbQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ULbTymuj
Subject: Re: [Buildroot] [PATCH] support/testing: TestAtop: use the default
 toolchain (BASIC_TOOLCHAIN_CONFIG)
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

On 02/06/2026 21:55, Romain Naour via buildroot wrote:
> The TestAtop use the really old toolchain br-arm-full-2019.05.1 because
> BASIC_TOOLCHAIN_CONFIG from Buildroot 2019.08 provide an uClibc-ng
> toolchain with 3.10 kernel headers (br-arm-full-2017.05-1078-g95b1dae)
> [1].
> 
> Since then, we switched to glibc toolchains by default in Buildroot [2]
> (2022.11) and BASIC_TOOLCHAIN_CONFIG was updated several time and now
> use a Bootlin toolchain stable (2025.08-1). This toolchain use gcc 14,
> 5.3 kernel headers, glibc 2.41.
> 
> We need to update the toolchain in TestAtop since Busybox 1.38.0 added
> yescrypt algorithms that requires explicit_bzero() introduced in Glibc
> 2.25 [4], uClibc-ng 1.0.47 [5] and musl 1.1.20 [6].
> 
> There is no real reason to keep this really old toolchain, so bump
> the toolchain to Bootlin toolchain stable (2025.08-1).
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/14622325905
> 
> [1] 9609a7c2c22160523bda5cb5b4417c9278ac27d9
> [2] 4057e36ca9665edd5248512e4edba2c243b8f4be
> [3] 
> https://github.com/vda-linux/busybox_mirror/commit/80e676664e1d7a0b07f14bff44f93d1fef709cf4
> [4] 
> https://sourceware.org/git/?p=glibc.git;a=commit;h=ea1bd74defcf9d5291d14972e63105168ca9eb4f
> [5] 
> https://github.com/wbx-github/uclibc-ng/commit/9e7b342fde5505c0a1d4968e9d70537ac406f640
> [6] 
> https://git.musl-libc.org/cgit/musl/commit/?id=05ac345f895098657cf44d419b5d572161ebaf43
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
