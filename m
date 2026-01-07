Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05ED4D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF74140DC1;
	Wed,  7 Jan 2026 17:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I0VIxEH_MWsK; Wed,  7 Jan 2026 17:50:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E922A40DBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808217;
	bh=RAiGbhj71lcOVih37e8ERwNAJJ7TRFUHL2dmNvfpTXw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qCbHPyVM+ZTAxofiG0w5thN+y69oJDY5XYndj328gQMacI3w9cqbnUcKZ6xi+e4rP
	 8bDy3VF4SIEe3+wBUWxEoV6peUptgy4hng6IIiuSVN2jOPY+Ths04BhHX5qzzTYxR1
	 Cb+1iw4fs7BL6OmWDhw236lnsifUYsIhx5nrLDG1l/ITkGMkaV4FGz//A+UspZ3SYE
	 xhPeTaZb1aq/+OUkUBHR+RYNovyJStC8Tu527kFXjBmCuFqtyOPbHp+O2vNprQMgNM
	 c02C+cD8DNXqQdZdqpJRUTr2EpwP5PsPOcxNE1BILRW8/dT7tHK5A0CTdpX4HBEu17
	 Q4zxHZ/zPbm3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E922A40DBD;
	Wed,  7 Jan 2026 17:50:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C9499ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 323DA607FC
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZPxXF-uW6THz for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:50:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2B142607D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B142607D9
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B142607D9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 55202B97A192; Wed,  7 Jan 2026 18:50:12 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:50:09 +0100
Message-ID: <20260107175010.226037-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251221223441.185169-10-bernd@kuhls.net>
References: <20251221223441.185169-10-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808212; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=JFJKJvC0cyTxF0JOwrTC4BXo016k3WK3x3U2kGz+yOk=;
 b=k3XMh0hs63/60Qn2E5+yv5tIrDhgXFlDugph4UY9yNCFuHzleS+wx2ECh2vecMDlOqL+S7
 eipT91Go8AQNRc4VO8TuJjAz4oclB4y6hvy+NHgzGqZUwa3UL3ONifrQ1wOX5GGBeuvJX/
 DYGwW8uiiLsg0VasWnmmLMareLpkOu7eqUppOFoagdeFFoeewBZm6FGUp09fdiKUSnpulN
 rKOoisyqHB27YW6xPwLq4bRJQ8PgUk2v0uWpZXHlsGVT9qiKtwnAO2vdrDkWNwD2FRzL8m
 VDQ+8xgXmY5Pc1KGkNW2Wh4eS2WF60j0A3CJU249CS1mvTXmxXePE2Fw6bACYA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=k3XMh0hs
Subject: Re: [Buildroot] [PATCH v2 10/23] package/python-iowait: update
 tarball URL
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Updated package as computed by scanpypi.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/python-iowait/python-iowait.hash | 3 ++-
>  package/python-iowait/python-iowait.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/python-iowait/python-iowait.hash b/package/python-iowait/python-iowait.hash
> index fc10e180f3..35ad91cb69 100644
> --- a/package/python-iowait/python-iowait.hash
> +++ b/package/python-iowait/python-iowait.hash
> @@ -1,4 +1,5 @@
> -# md5 from https://pypi.python.org/pypi/iowait/json, sha256 locally computed
> +# md5, sha256 from https://pypi.org/pypi/iowait/json
>  md5  f49ca7766fe4a67e03a731e575614f87  iowait-0.2.tar.gz
>  sha256  ab1bc2eb84c22ccf61f17a0024f9fb6df781b39f1852764a66a7769d5adfb299  iowait-0.2.tar.gz
> +# Locally computed sha256 checksums
>  sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSER
> diff --git a/package/python-iowait/python-iowait.mk b/package/python-iowait/python-iowait.mk
> index 028001d7f3..d7738c7eb4 100644
> --- a/package/python-iowait/python-iowait.mk
> +++ b/package/python-iowait/python-iowait.mk
> @@ -6,7 +6,7 @@
>  
>  PYTHON_IOWAIT_VERSION = 0.2
>  PYTHON_IOWAIT_SOURCE = iowait-$(PYTHON_IOWAIT_VERSION).tar.gz
> -PYTHON_IOWAIT_SITE = https://pypi.python.org/packages/65/30/e953673fe9619938e9c74408401cf865f37716da89f61f6e5d9328c0f71e
> +PYTHON_IOWAIT_SITE = https://files.pythonhosted.org/packages/65/30/e953673fe9619938e9c74408401cf865f37716da89f61f6e5d9328c0f71e
>  PYTHON_IOWAIT_SETUP_TYPE = setuptools
>  PYTHON_IOWAIT_LICENSE = LGPL-3.0+
>  PYTHON_IOWAIT_LICENSE_FILES = COPYING.LESSER
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
