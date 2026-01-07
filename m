Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CBED0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0A9C40240;
	Wed,  7 Jan 2026 17:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m9aoNXZ0R1Gg; Wed,  7 Jan 2026 17:49:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3D6040D8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808199;
	bh=BawHnDR9/DXqCCw5hu4i2y/w4XztDPVWLLLz+I89fO4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sR6VI7kn+mNVPVLASWk7p1LRNzAux8/DmVXzS6qz3xkj0xMkDOrOFee3N73D4QF5E
	 tpLt6yRXeeRZgoD/rdyyvCgV2XH4FWn3ewCUdFXwEuaj3ciumIv01PHQQVOSnU776q
	 k11butoyO67BUnYuIF5je4ZqpY/cB25MeYcxFy7fi6WD6OTtD1+PxC2ZT81yZ8juQo
	 vHhWDSTN8hXu0SwP7OsS2YZ4Ll2ugPm1HKmClVEmJK0FQKiQJZuPMZ8w8f56WQAmzH
	 J6A7GAfh26nhcum2ClsfJ4zIeV7IZhhMeSYSlZG3Q+N+A6hE+b3oZwvEd505fHPT9u
	 KkDIJYmLpxMgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3D6040D8B;
	Wed,  7 Jan 2026 17:49:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CD4025B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72C6540160
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQRs272fUO_M for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:49:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6EAFB40128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EAFB40128
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6EAFB40128
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9DF89B97A192; Wed,  7 Jan 2026 18:49:54 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:49:52 +0100
Message-ID: <20260107174952.225662-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251221223441.185169-2-bernd@kuhls.net>
References: <20251221223441.185169-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808194; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=0l9YzP3uCXKkSYuXbwSI8gxSLtGjW7FOvR7jY97CO0c=;
 b=SXL5HWNN0NbItjEIYz8N617JNJXx+YoCzO2TNCu/qQjRw+LMS78s/MENQ/PUepVQvketKl
 7ZqrKJJsPjA+hcUhU/pYWuj4a8KcRO79hVtFMhugoHZHeP6IDJtaBHp5lTr9WHKu1a3g4k
 tVJTpkvCFXBs8/JJVRF9XxQyIGVdWv5ass1ugqXgTA+belJVU2rRVpU9pnQqLVUMw5VUKs
 pLi9r/hBtS7R999QPr8CIzhSCco+tqQDOtQ9P43ugsDgQ/kUAJY6fuNKarmX8uvlSCEA94
 zttLew+/QMotgr5Nt8yoc04tyTp0i4sVUzzhlbIyyQVoVM2f+8U9o/pKaCHlow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=SXL5HWNN
Subject: Re: [Buildroot] [PATCH v2 02/23] package/python-colorzero: switch
 SITE to pypi.org
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
>  package/python-colorzero/python-colorzero.hash | 7 ++++---
>  package/python-colorzero/python-colorzero.mk   | 3 ++-
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-colorzero/python-colorzero.hash b/package/python-colorzero/python-colorzero.hash
> index fc2455c836..4a1b900453 100644
> --- a/package/python-colorzero/python-colorzero.hash
> +++ b/package/python-colorzero/python-colorzero.hash
> @@ -1,4 +1,5 @@
> -# Locally computed
> -sha256  86c9933b004aec8ce1c476d1d1129e00325c7724df3c09aa353d5f8e883ed08d  python-colorzero-2.0.tar.gz
> -# Locally computed
> +# md5, sha256 from https://pypi.org/pypi/colorzero/json
> +md5  e7f71e181b94754bcc5ca7c92c52c0d7  colorzero-2.0.tar.gz
> +sha256  e7d5a5c26cd0dc37b164ebefc609f388de24f8593b659191e12d85f8f9d5eb58  colorzero-2.0.tar.gz
> +# Locally computed sha256 checksums
>  sha256  ee1c76f465410c34802ddf81d70e1ea7a4542cf58459425038498d8f4e36bb45  LICENSE.txt
> diff --git a/package/python-colorzero/python-colorzero.mk b/package/python-colorzero/python-colorzero.mk
> index f38c98a093..0ed6a90c61 100644
> --- a/package/python-colorzero/python-colorzero.mk
> +++ b/package/python-colorzero/python-colorzero.mk
> @@ -5,7 +5,8 @@
>  ################################################################################
>  
>  PYTHON_COLORZERO_VERSION = 2.0
> -PYTHON_COLORZERO_SITE = $(call github,waveform80,colorzero,release-$(PYTHON_COLORZERO_VERSION))
> +PYTHON_COLORZERO_SOURCE = colorzero-$(PYTHON_COLORZERO_VERSION).tar.gz
> +PYTHON_COLORZERO_SITE = https://files.pythonhosted.org/packages/b3/ca/688824a06e8c4d04c7d2fd2af2d8da27bed51af20ee5f094154e1d680334
>  PYTHON_COLORZERO_LICENSE = BSD-3-Clause
>  PYTHON_COLORZERO_LICENSE_FILES = LICENSE.txt
>  PYTHON_COLORZERO_SETUP_TYPE = setuptools
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
