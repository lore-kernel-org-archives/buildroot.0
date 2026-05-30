Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324C5CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A99D6F55E;
	Sat, 30 May 2026 13:05:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MdIK_OdIBXtI; Sat, 30 May 2026 13:05:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3571E6F560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780146314;
	bh=doIfoTPHxE6GgdQtZJnA858KOr7MU80yWUf2qoJpMGg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y9yJjlmivRGUmUMVIpklixqvAEuWmLqpp2lmVOLa7fPbJYMmFandQ1ascoSH64Bap
	 LuTAoyu2AN+T/QzfGzHuxMBvQx2SShQm52dddJfWdCorgx3G5/SuEk/GDUSah92Ex1
	 TYH+BvZi2pYzK0Vj6SwJ6R7JiwdBsi4Iw+mypX33efjtW8FEE9rYeXTaKZIfjh09lC
	 XilYOu6cJ3tJ89yv0A5MZFeAhb9lOzwIL+gbB3juf4JZUCCOmwj25Rs397elVB2d29
	 BSB52f9aiL/EWHdQfUDKx3s05/Gr4K4LPVvVDqiSpkHLLIymxJ112N3JUAvK/fUNpQ
	 K1IXBt0ecF4LQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3571E6F560;
	Sat, 30 May 2026 13:05:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EEADF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24AFB407A3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lIpN3L68o9qo for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:05:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F28004025D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F28004025D
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F28004025D
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:05:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id DFB25C6246C
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:05:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A4D526073B;
 Sat, 30 May 2026 13:05:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0047A10888054; 
 Sat, 30 May 2026 15:05:06 +0200 (CEST)
Date: Sat, 30 May 2026 15:05:05 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <ahrgcxSdolK9CTnk@windsurf>
References: <20260509204659.212149-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260509204659.212149-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780146307; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=lgFgCs/r3OOksFfC8eR7sX2gLtqG5Tb68/VLTJa11dQ=;
 b=su9f2ET5j3HTo9OlzBXeNIYW+6pDt2wHNCN6GDh3A3IJ2x2+DLkNWoT6nUnkw3Yw3zii64
 7VSTeLPEYJzV/kbZVZKQuDVUpMdim92hJNiiQHezzcyQLzaZiXHSVOZ1bI39LBwBvHf5U7
 KODv22uwc22xJcfT2N+c3tyaaAHXWbDwrAKyf9v4STS6Kcjhy6LvEwLMvcbxK41YHNtPKK
 i2Fx4gbxP8jJFtKyF0e3YO+DSsfBIkgnPHfzhZdroSKFONj4PtVcCl1h/xjgRiYMVjiaLu
 DPnysbYAl5QnytnXTjl1XzzID7tKtekhlXc/J9FnJEunTICbXI6RRYGwqYz3AQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=su9f2ET5
Subject: Re: [Buildroot] [PATCH 1/1] package/swipl: bump version to 10.0.2
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

On Sat, May 09, 2026 at 10:46:58PM +0200, Julien Olivain via buildroot wrote:
> For change log since version 9.2.9, see:
> https://www.swi-prolog.org/ChangeLog?branch=stable&from=9.2.9&to=10.0.2
> 
> This new version can no longer build in the source tree. Therefore,
> this commit adds SWIPL_SUPPORTS_IN_SOURCE_BUILD = NO. Also, the target
> swipl needs the host-swipl binary. It is searched by the cmake script.
> This commit changes SWIPL_NATIVE_FRIEND variable to point to the
> out-of-source build directory.
> 
> swipl has now a stricter ABI check of its prolog library bytecode
> compiled files, compared to its builtin expected ABI:
> https://github.com/SWI-Prolog/swipl/blob/V10.0.2/src/pl-init.c#L263
> 
> When cross-compiling, swipl is built on one side, and library files
> are built with the host-swipl. The ABI string of the host-swipl and
> target swipl must match. If not matching, swipl fail to start at
> runtime with the error:
> 
>     FATAL: could not find SWI-Prolog home
>       Tried source: compiled in
>         Found /usr/lib/swipl: ABI mismatch
> 
> This ABI string includes a signature of builtin modules. See:
> https://github.com/SWI-Prolog/swipl/blob/V10.0.2/src/pl-init.c#L1653
> https://github.com/SWI-Prolog/swipl/blob/V10.0.2/src/pl-ext.c#L330
> 
> The swipl ncurses support is made with one those builtin module.
> ncurses development files are likely present on host and likely not
> enabled or needed on target, hence producing a different ABI
> signature. For that reason, this commit disables ncurses on both the
> host and target.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
