Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84C8CD6E4A
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 13:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C75DD42149;
	Fri, 29 May 2026 13:19:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UZhsoNGLZHFy; Fri, 29 May 2026 13:19:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 707A742142
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780060775;
	bh=O3P5YJiLBVh5LzMm7U31LkEybOuMDkAH9zLuQITyYdM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mclL0Qv1VabARBjW47f6Y1ZyJv+K2jY2wSRo9Hje6HQeIC1qXlWYP/qNNp3qUEUZF
	 DM2SEnhVayFb4RBP4kdcmdG2duR6+31dmyTqF2SRAPnSVec40WYFIokX507h9ew4zT
	 c2yq49GJeqpuaxSSrx3fDvWxSfEBtfF35X3vKpw2/ZEME3DGmVIZ1VQz4Ita/Yvu2/
	 OQ+Bdfw5ZG+nhI1cqp1UOZfMSArwm69YZwRhn7lHG++xRvS2w+T5KHAhb2QU925S+r
	 J+UY0fmxZeWiM6XXeezFlsP0oGxQVfnWN1FqZOFlMNE9w41gzd9E1exY0KBjJAvcSo
	 MZyf+JtaYUEJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 707A742142;
	Fri, 29 May 2026 13:19:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A2F9288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECF7042142
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:19:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xaJ7FB46vtFH for <buildroot@buildroot.org>;
 Fri, 29 May 2026 13:19:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 004C34213A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 004C34213A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 004C34213A
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:19:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id BB3A4B00583;
 Fri, 29 May 2026 15:19:28 +0200 (CEST)
Received: from 2a01:e0a:1015:b940:caf0:d340:4af7:8ed3
 via 2a01:e0a:1015:b940:caf0:d340:4af7:8ed3 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 29 May 2026 15:19:28 +0200
MIME-Version: 1.0
Date: Fri, 29 May 2026 15:19:28 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20260529055738.7676-1-bernd@kuhls.net>
References: <20260529055738.7676-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <fc7daca642187bc84625f5d5211b0ff9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780060771;
 bh=1oMNFL6Ec9JVs0KW5akIFRk/5DDnUN0pU0qRUV92lYY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gDmoTwobnsoByB718is217MFV5GBzlmlvohIRVpPDXHzZwxpuJ8H8JaK0t3+ph5SD
 88jUjqy5SgYJpCpssAYYpzI2yY5fAu/fw/DO5YuFUyLBp5ag9r4cF55BTIosgBtfPn
 Ed+9bo3WFUSMVOdH9bJ+sjpdDhJvzCXMz2CsO6voV8PuCGVl6u94adyJbzH/LZjLzT
 VFMDoEzjdAtXx7IN1/u+quXcTi4azETo/po45NlrQoWrZcPgrhBe22b/TDvDdWKNS7
 JzbI5wY6IUxOLm9OQzhX4CmNZr3A+S9R+nFbzqOl7EAZ7uw37jxRSytfxEkrRkhVHh
 Ki0gnuye7xfqQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gDmoTwob
Subject: Re: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: security bump to version 1.96.0
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

On 29/05/2026 07:57, Bernd Kuhls wrote:
> https://blog.rust-lang.org/2026/05/28/Rust-1.96.0/
> 
> Fixes the following CVEs:
> CVE-2026-5222: https://blog.rust-lang.org/2026/05/25/cve-2026-5222/
> CVE-2026-5223: https://blog.rust-lang.org/2026/05/25/cve-2026-5223/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Since this bump is fixing 2 CVEs I applied on master, thanks.

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
