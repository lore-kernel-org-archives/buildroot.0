Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC913FA3722
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 22:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 512C640690;
	Thu,  1 Jan 2026 22:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FWFXYR4skkz9; Thu,  1 Jan 2026 22:44:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34BC3405ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767307457;
	bh=P/1RLBqmrpRlvFUjVYz/6SjLMc1Ln+EvEK3id+wNkNY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FaPEq+iNgw+DnEt13lQQsjedMVNioPE8NsUW/C9ct5XcCpz0nKL1LWtWHqo2WObj0
	 LkT8bqS58hEC2xfIDX0L3c52rUuoHR4dwV0ZnxZmmRh4lGEVYexDFfTLFvusgnHZdG
	 Ovn3iHouCuoTQXyCWfCMpq3M2T3fJLzjryL4j1CV7fFEYST8PdwRQdle+88w5wSpes
	 bQ1atDUy41j3ZROn/xlo9qC7CsXpajkcfJLEk4zXVAhWatcCIv7cvmAEBojtOYiV3S
	 Ozgp5Q/siiBvqZjHTmJnEET7LAhojKExM4KEYcrmr3urJWWLQAH+ePi1rIc40d3yJN
	 KBgTjhu0W4W7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34BC3405ED;
	Thu,  1 Jan 2026 22:44:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B436D206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5F754036A
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:44:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IigENS2KUHbu for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 22:44:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B8FE540193
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8FE540193
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B8FE540193
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:44:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 656B74E41EE5
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:44:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 20C3460749;
 Thu,  1 Jan 2026 22:44:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DE9D4113B0716; Thu,  1 Jan 2026 23:44:11 +0100 (CET)
Date: Thu, 1 Jan 2026 23:44:10 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20260101234410.710dd36c@windsurf>
In-Reply-To: <20260101113616.1893585-1-bernd@kuhls.net>
References: <20260101113616.1893585-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767307452; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=evEExHQyHb+kxwqOTEEMMu9mBzlLa5ELja7rjjke4ak=;
 b=0Vc6FINX8GspGw3JvD678rVFJKMnh8UwDxowEmorga4f3ApJMsed5fzWORNROvnoA3d+bK
 06wx4+P3nVYLj7wznPoqJqJzcD1EcBTzJbgfn3r3zZPyIcvkWU0omWG5GcVVsi+OGUoytS
 FUljLDFo3itvu87PJDhx7zmzxL5lZAxmOyruEN52WVsoVROZeH05CcJ8TWBAzpaWb/wnXs
 1SXZYaoRHycjY2/v0tllVo89rO/NntT5o6EurkN3XhzPYZ3gwB7Alj9O3noZvbNYP8Vnst
 vhFiygMLG11hEnxu3OkHQtF8qWIzqTlvcbrZZP94bqwKdgZxs5utWgo9zdTp5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=0Vc6FINX
Subject: Re: [Buildroot] [PATCH 1/2] package/cegui: Fix cmake 4 build
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

On Thu,  1 Jan 2026 12:36:15 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Renamed current patches to prepare for their removal with the upcoming
> version bump that will not touch the CMake fix which is not committed
> upstream yet.
> 
> Fixes:
> https://autobuild.buildroot.net/results/a23/a23e3a81e3526d12206ea0f036f6e8db8dc5eaab/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/cegui/0001-Fix-cmake-4-build.patch    | 28 +++++++++++++++++++
>  ...0002-XMLParser.cpp-include-string.h.patch} |  0
>  ...of-xmlGetLastError-for-libxml2-2-12.patch} |  0
>  3 files changed, 28 insertions(+)
>  create mode 100644 package/cegui/0001-Fix-cmake-4-build.patch
>  rename package/cegui/{0001-XMLParser.cpp-include-string.h.patch => 0002-XMLParser.cpp-include-string.h.patch} (100%)
>  rename package/cegui/{0002-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch => 0003-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch} (100%)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
