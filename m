Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD03D185CC
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 11:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46FC360DB7;
	Thu,  8 Jan 2026 11:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vTQ9HY2wl55b; Thu,  8 Jan 2026 11:11:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73EB8605E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767870669;
	bh=43UqaznwK+AX+WdGWfhD4JtJ4E5WiZjlXKYYnd6NXNQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hbSqdA5aGvDiR7qqEUvwKOlOL1XQ6MdDAT+pWb2lvNtFV8its8dD5+qJkm8OsG8N9
	 MphViV3tf+qKW1BU6Yb4zGHc6RHlL9c6vImBkvE5Hhx4NTfaKLPTW3o+p+7yDPBHvS
	 QWcKonCx16XVQt0yIvW9Pg/hqIzU1fmph6/ksE5QWA14VkmZLtcuhKBmNjPOIXjXkg
	 aPC0CmTukbVJSRZL9YY9J1WgdJ5TXuzVV/yGduOw0vB6Abe1iK13PZwRQCWwwwZATB
	 FQ+u3eZPvFVA/K4vER5vq/3QBl6YbeNkM8en0ZewJlnBgFg0YLXnN92zD6H4K11yBz
	 /BSYEXCscbssg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73EB8605E4;
	Thu,  8 Jan 2026 11:11:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A46D2C0
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0795E60625
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:11:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZfwZZFzl0MT1 for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 11:11:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0B209605E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B209605E4
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B209605E4
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:11:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 944A21A26FF;
 Thu,  8 Jan 2026 11:11:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5D1EE606B6;
 Thu,  8 Jan 2026 11:11:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6E6E5103C8837; Thu,  8 Jan 2026 12:11:03 +0100 (CET)
Date: Thu, 8 Jan 2026 12:11:02 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260108121102.31ff5b49@windsurf>
In-Reply-To: <20260105215807.1898190-1-james.hilliard1@gmail.com>
References: <20260105215807.1898190-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767870663; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=36Dh160V3bVA5gt8+r2CN+txU35n8QZACicigX9Sgjo=;
 b=1QH98191kaV8ayzfYvQ6QKVFhDFUA3y1ODALeOSmbUiRmbQ2fKCHi9jAOApFYFUlYCFqSR
 xcmtKzQhcBfKe/FoRV64skaKj4C5IRAF9Aq8QaCJnBfbv42x3DZLy7LIP9nLG4M8qk+Zot
 AylPYPbqQe2C/cBOF28wFkMTi7g38f2MFY7nBtO9JlTZAkcrYduuBybzkJHG22u1L0+DxZ
 MRbicTDrpUf/WfLSuvd6bxpME6jl/yfoo5CpKjVTNi0LnyJEI9RRRbCQxibIv7VG2Njtys
 ufAmGatFEei3uu4OCB/jFWYrvCE3TMQrcTQ7zeeSTM05R5cC2kQ1kyOdXgoI2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=1QH98191
Subject: Re: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 1.11.2
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

On Mon,  5 Jan 2026 14:58:07 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-maturin/python-maturin.hash | 2 +-
>  package/python-maturin/python-maturin.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
