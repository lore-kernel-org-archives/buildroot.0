Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C145BEEB57C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 15:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97A5C402D4;
	Thu,  1 Jan 2026 15:10:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ZMGNZg3yqla; Thu,  1 Jan 2026 15:10:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA1424021C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767280246;
	bh=mrse0pIf9tIB0hi5+ZtXvll8xmen6xqDH/3ddZUb2bY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Rbbga6w/T/2PH3L8AxvJxDir1Ldtktwnq56EGJ7B0tuFwNHdE631dONcze1UIxUEQ
	 1Ncw9XyPoxjWLOF2LaN85/rFYz4TwXrpW+VGJT22wtFiGRqc56vH3+1JwC63rscRJe
	 BLsdxCydCyT4ZeIPG32b0+g9USDAjuWmm0Ta3n1nxToUUxpPcdeYUavWD6q+Kibbft
	 847KIUC1FF1R6ysunkv3hz2efb2POdMSoQlC9mOyHBA/hlapokK/GL6zLh+BZP3NKW
	 RCnxuROXvTYxqmE/HdkdOzx8cEUcQ8smFuIEBrfVddDxfT/OOrIWBQwIemwg553bPs
	 JFYqMYrwLLAkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA1424021C;
	Thu,  1 Jan 2026 15:10:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9368C19D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 864644021C
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sMcDl67nqLCg for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 15:10:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 877BF40188
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 877BF40188
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 877BF40188
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:10:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C16531A2578;
 Thu,  1 Jan 2026 15:10:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 98808606B6;
 Thu,  1 Jan 2026 15:10:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B70D4113B029E; Thu,  1 Jan 2026 16:10:41 +0100 (CET)
Date: Thu, 1 Jan 2026 16:10:41 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Philippe Proulx <eeppeliteloop@gmail.com>,
 Devin Steffler <devin.buildroot@gmail.com>
Message-ID: <20260101161041.7113cbb9@windsurf>
In-Reply-To: <20251115164828.1519438-3-bernd@kuhls.net>
References: <20251115164828.1519438-1-bernd@kuhls.net>
 <20251115164828.1519438-3-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767280242; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=DK9O+szs/WiA65bFafaShlFMHWBD+d9azbqh8rgJVi4=;
 b=mj1Lhtjd9WzfxIQ6mm3MfCFEWRcCUxi+x1QT+K0P4sBmCCnRfhQkFOAkssK2wUeQWlksy7
 qziw5v+sglVR/BmO6zMklTRRtCEpa8t31mL3yJhQeGqb9kYE+VaeG5sc3UzmHwAKUwShdU
 hR7coivtFKqWRAHg+wzA+ytFbnpSIZe/4OsMtZPiWI4v90nmMcAyB+pNJdj6PpTL418Rxj
 QcZqj83NcTyWIARAAu4j7nzzOE0Uun6s1syggTgCTENLu/McJ5uMXAKf4oXFV5KIWTnQFJ
 YNbevEE06LoY9Zoc1hSQd8Botgvdp+OYtSzt4Ke1E9JrkaBBD8LeEZMi31+Zsw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=mj1Lhtjd
Subject: Re: [Buildroot] [PATCH 3/4] package/lttng-tools: bump to version
 2.14.0
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

On Sat, 15 Nov 2025 17:48:26 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> From: Devin Steffler <devin.buildroot@gmail.com>
> 
> This is the second of three patches relating to lttng-modules 2.13.10 not compiling with buildroot.
> 
> Since I am submitting a patch to bump lttng-modules to 2.13.17 and lttng-tools is a tightly related package,
> I am also submitting this patch to bump lttng-tools to 2.13.14 (the latest version at this time).
> 
> The changelog for lttng-tools 2.14.0 can be found here:
> https://git.lttng.org/?p=lttng-tools.git;a=blob;f=ChangeLog;h=fc88591423cc856360172165418e8ef7159ab24e;hb=refs/heads/stable-2.14
> 
> Signed-off-by: Devin Steffler <devin.buildroot@gmail.com>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> [Bernd: bumped to 2.14.0, added patch 0002 to fix musl build, updated
>  link to changelog]
> ---
>  ...Remove-the-scope-resolution-operator.patch | 48 +++++++++++++++++++
>  package/lttng-tools/lttng-tools.hash          |  4 +-
>  package/lttng-tools/lttng-tools.mk            |  2 +-
>  3 files changed, 51 insertions(+), 3 deletions(-)
>  create mode 100644 package/lttng-tools/0002-Fix-eventfd.cpp-Remove-the-scope-resolution-operator.patch

Applied with a reworded commit log, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
