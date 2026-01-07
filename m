Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8366D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFC7240E3C;
	Wed,  7 Jan 2026 17:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 72l5rX40n_9I; Wed,  7 Jan 2026 17:50:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9ED540E3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808242;
	bh=lKpA/2ss6p3TVcIf/SwpwjVDOO0pj/TyjLS/o25DjwU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Tpn4hNh80Xo/CRpAYCm6NJtX5SgVz5S8qKfnPW6ZmECmQjceVtZBXyYYVOMg/E1hK
	 1/RXFYJaL9Pd3pDWD9/exCaQzQqfKg7q/7f4B+5CGYHGw1oZpFVnbgsxh591GbY5zT
	 E4ctDl0ZDES4Cud/FQvpLaMxA4RvpjfD4ifBdGnBirW/ZbOHhgN0mop/cLx5+U1R0p
	 5/D8/EZ/+cLXiDLojFI5D0VMPqPctbJ64bRwtMQjgqIJaYdujA+WxAfzoF0rWmr9iY
	 JbBGbuUXQ/P7jePDc+4BbLd6JNwCKUxV/I2TKyumrOn/8XjA4OPqAoGQIM/bZVgjeQ
	 amWOkmmhw7qnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9ED540E3E;
	Wed,  7 Jan 2026 17:50:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C75F125B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADFAB607FC
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iFr8JhN-vbfI for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:50:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A682A607D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A682A607D9
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A682A607D9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DBA89B97A192; Wed,  7 Jan 2026 18:50:37 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:50:36 +0100
Message-ID: <20260107175036.226717-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251221223441.185169-23-bernd@kuhls.net>
References: <20251221223441.185169-23-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808238; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=DGpDzAWa+aIAK3Q58OxYuC4CcJIG1P3CE3Y6M5WfOT8=;
 b=UvFjqNcV8/cLPmX/7Teyy7ot8+CXJWdvbTl2YpPlacfPwkIQZE/E1c+a3BRnfW6htjMKVI
 dQyApyZUHS+qkF/3TmHz8HlrF4hruJ92TcjaKIL8pRtCQ+lWjMS/ztkFUWthHT+ZjZBbDm
 YP8Bdnk/0GblF2XESwYnutQXqqFD17ZkRHQIQfRA6tME17hGR/B9ukOTAG33bWwyv+x8Ds
 m0F/H8WXE+xqSlfSLoL8z7aZQZHWJmhFojbNBr3M+4C7GJGq9chBq0DowI566McQrNPEon
 z6CcNTsC1yLOr9IesUF76X78fSoSnHulWjtR7HJY5xtUPN/lRshXqqvHvrKZQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=UvFjqNcV
Subject: Re: [Buildroot] [PATCH v2 23/23] package/python-pysnmp-mibs: update
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
>  package/python-pysnmp-mibs/python-pysnmp-mibs.hash | 4 ++--
>  package/python-pysnmp-mibs/python-pysnmp-mibs.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-pysnmp-mibs/python-pysnmp-mibs.hash b/package/python-pysnmp-mibs/python-pysnmp-mibs.hash
> index 52a507f4b3..4744963185 100644
> --- a/package/python-pysnmp-mibs/python-pysnmp-mibs.hash
> +++ b/package/python-pysnmp-mibs/python-pysnmp-mibs.hash
> @@ -1,5 +1,5 @@
> -# md5 from https://pypi.python.org/pypi/pysnmp-mibs/json
> +# md5, sha256 from https://pypi.org/pypi/pysnmp-mibs/json
>  md5  01845c4595d87d3c3485c0449616cbda  pysnmp-mibs-0.1.6.tar.gz
> -# Locally computed
>  sha256  00fa321ca598e8a14c0ad98702bf10fb5e9d57b7d06bb99dc818fea07683720c  pysnmp-mibs-0.1.6.tar.gz
> +# Locally computed sha256 checksums
>  sha256  361eda483f7fac1f8cca4e16c340fa07a1cad2bf1200577a01075745233b406c  LICENSE.txt
> diff --git a/package/python-pysnmp-mibs/python-pysnmp-mibs.mk b/package/python-pysnmp-mibs/python-pysnmp-mibs.mk
> index 9772b78c91..eb9119a352 100644
> --- a/package/python-pysnmp-mibs/python-pysnmp-mibs.mk
> +++ b/package/python-pysnmp-mibs/python-pysnmp-mibs.mk
> @@ -6,7 +6,7 @@
>  
>  PYTHON_PYSNMP_MIBS_VERSION = 0.1.6
>  PYTHON_PYSNMP_MIBS_SOURCE = pysnmp-mibs-$(PYTHON_PYSNMP_MIBS_VERSION).tar.gz
> -PYTHON_PYSNMP_MIBS_SITE = https://pypi.python.org/packages/bf/7c/99ab192af934ed5d41ceef92a1b949b41652f29b46241b902ffec55642f4
> +PYTHON_PYSNMP_MIBS_SITE = https://files.pythonhosted.org/packages/bf/7c/99ab192af934ed5d41ceef92a1b949b41652f29b46241b902ffec55642f4
>  PYTHON_PYSNMP_MIBS_SETUP_TYPE = setuptools
>  PYTHON_PYSNMP_MIBS_LICENSE = BSD-3-Clause
>  PYTHON_PYSNMP_MIBS_LICENSE_FILES = LICENSE.txt
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
