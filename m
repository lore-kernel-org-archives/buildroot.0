Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E960CEFD0C
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 22:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37CAC60C2A;
	Tue,  6 Jan 2026 22:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OplMcxByETKb; Tue,  6 Jan 2026 22:22:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A19C360BE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767738136;
	bh=AT3OlBlU1hMPRtKjgZt7YPq+z4dsMt3UMo4HNLgEwrw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RO8KWRS1i7Sg3a+U2Nigl8xM08qNosU14uHqQmP9Sb+E/BhPmzgdqToYIwzPxPcT1
	 2BHAAYTG2OEtFPEnMzmJEQt9bAimKcAtYmfKEZ1m4jIbxhEhIXyHkvDg8lVcTj5929
	 22JusWoBH4t38coMjyipqlOgQbZip6HvFj5qz7qt2fD9gg13oSq98TZhdcLSr12CTh
	 qhRQsi//5KTi4DXLLxlZ9KtFkEUcbEfeo+oq5tDXwR2xsSw6rjOOrUjZPM+YkVb9ir
	 VDF61rFGbiJPTtncOJhVJY/Vq6wKv2dXXPoKL6ExSm2JAtMjXHYm0UUTZouR+g4jvo
	 f41UTJuUck+dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A19C360BE6;
	Tue,  6 Jan 2026 22:22:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 408EA249
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26A8581DD8
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eqDPjq30e2lC for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 22:22:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3AE6881D7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AE6881D7C
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3AE6881D7C
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:22:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 06997C1C388;
 Tue,  6 Jan 2026 22:21:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 10CB460739;
 Tue,  6 Jan 2026 22:22:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 05D0D103C8085; Tue,  6 Jan 2026 23:22:10 +0100 (CET)
Date: Tue, 6 Jan 2026 23:22:10 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, Jarkko Sakkinen
 <jarkko@kernel.org>, Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20260106232210.2cfbb0a0@windsurf>
In-Reply-To: <20260103132552.3979708-3-bernd@kuhls.net>
References: <20260103132552.3979708-1-bernd@kuhls.net>
 <20260103132552.3979708-3-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767738131; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xhpAArQrrGpla2TrqAgg3ytd/clKtoMCmt2YcvrdNWc=;
 b=yBLdxRf5ta5EPaLjtZSkd+XC4hCGZK6/kiNO56N7Iz18ElGnh4PpBIBB8I1pP+kdy3B6sm
 nXzS8x11anbdHBohsZiUWabFWGvpTNr5qwJ2JN9RlltaRlaY2svhfpmLZ7x+sy8jahf4Pt
 S08Pq1PmaxiCtIL8nyUXvZWc1dgDzldblQz93DCU2qIY9itJF06kX59HX334TrVqM07N+D
 DH5E8M8KeR5AScQu7Vs04S7NAZAISi07O9Y2cfPdEoafA7NS8tdANCAxF8V74V65GeQxhX
 Cv+bsAHWyPcLNGC4A6BeQA0YD+NXAuoCM83DuaJFEcdG5nzeZr7RUlkoYKC2fw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=yBLdxRf5
Subject: Re: [Buildroot] [PATCH v4 2/5] package/nfs-utils: fix build failure
 due to missing BR2_PACKAGE_LIBTIRPC_RPCDB
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  3 Jan 2026 14:25:49 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Package nfs-utils requires libtirpc rpcdb option enabled. Package
> libtirpc with commit [1] disabled rpcdb functions by default so let's
> select it by default to enable rpcdb functions required.
> 
> [1]:
> https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193
> 
> Fixes:
> https://autobuild.buildroot.org/results/29adf2d04cf4c46e492af95edaa96983985d6b57/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> [Bernd: enable BR2_PACKAGE_LIBTIRPC_RPCDB only for non-glibc toolchains]

This change was not correct. Building nfs-utils with musl, using a
libtirpc that doesn't have rpcdb enabled, failed miserably.

>  	select BR2_PACKAGE_LIBTIRPC # IPv6 requires libtirpc
> +	select BR2_PACKAGE_LIBTIRPC_RPCDB if !BR2_TOOLCHAIN_USES_GLIBC

So I changed to:

	select BR2_PACKAGE_LIBTIRPC_RPCDB

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
