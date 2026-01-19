Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939C9CCF2D5
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FB4281DA0;
	Mon, 19 Jan 2026 10:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aFsNHbTwCpFL; Mon, 19 Jan 2026 10:09:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 804BF81B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768817349;
	bh=hWqRoloyzIUHzDrNcpAJlF0yLxBU1e5OzGpsLAD5flA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iZkKWkzDVBoe4ZWKjAmeQoLGdbE+csFOUVSsiH7ETH4lumz7n1BcIlF+UG8c2TDsu
	 lQbkuaS6q1D5/Yirb/giPDs54bAzcuUsm3hWR1x6i/a3sasB978cAF7FzlNdsU623i
	 ZQqr2TubKEXXEOyD6HwW5qkdJel65JOi8bqX2le72uoz9xFsxgPyaHZPEV5CXud2nb
	 LD7nLSrpS69t8WqDPgXlbQtFaNYIaP/+vyC9LuC/NZ8xd35iL8LH0xyP2GqfqhyBDO
	 5NySKYAc01FpmWSe2M1H0L3pUlLf2sbhLB3s1j46h+w6mR+p0Xz0Ms16XTjarz2Kpt
	 0rVPLGWbbb6xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 804BF81B70;
	Mon, 19 Jan 2026 10:09:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 675E0160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5670D405F3
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id klfr_-pDEm67 for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:09:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2D3ED40141
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D3ED40141
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D3ED40141
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4EBA4B97A961; Mon, 19 Jan 2026 11:09:03 +0100 (CET)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Mon, 19 Jan 2026 11:09:02 +0100
Message-ID: <20260119100902.12403-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251124172805.3136682-1-buildroot@bubu1.eu>
References: <20251124172805.3136682-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768817343; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=6gK6M96eGqdvhFQJEt1HArS3ParJg4q4oi8nEMnTa+s=;
 b=ocrF0vLAkHG4oKsph2SksxRWTOvL9oJfGSlsKCf9BEFZ2MGtPhK+XYK1DJhf2gWQ1Y2RI+
 YnF0TjeocWRCd6Lucq6mMN/oIRZ45DLkkCwFhtV94W6VTHysFcZunnZnrSO9P65jbxbON5
 VLNt3U5vkDT50+blUBSGQ09tBEOVOENCSC/4j7cP8H2fr6WoYdYKxfLX0b4W+Sp2+DjIbi
 0ktqsOqSTcInyFBW1zxU02bmiRaB8TqNNJ9M9o1VRz7bD4r+GkgYNKP4W5QIZ/qAb3KzLT
 Tkxw92na40xFyUSzJfZH5hGxxv4CKF4ULi6S+/ZGtoVMKzviO4t/uXsd14r6Wg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ocrF0vLA
Subject: Re: [Buildroot] [PATCH] package/python-certifi: bump to 2025.11.12
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
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/python-certifi/python-certifi.hash | 4 ++--
>  package/python-certifi/python-certifi.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
> index ef0e0d4ca5..cc80fa1bbe 100644
> --- a/package/python-certifi/python-certifi.hash
> +++ b/package/python-certifi/python-certifi.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/certifi/json
> -md5  7fe97b2e79933430062935f3759a09b0  certifi-2025.10.5.tar.gz
> -sha256  47c09d31ccf2acf0be3f701ea53595ee7e0b8fa08801c6624be771df09ae7b43  certifi-2025.10.5.tar.gz
> +md5  430a5fa9f18895a9b69a018d2beae67b  certifi-2025.11.12.tar.gz
> +sha256  d8ab5478f2ecd78af242878415affce761ca6bc54a22a27e026d7c25357c3316  certifi-2025.11.12.tar.gz
>  # Locally computed sha256 checksums
>  sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
> diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
> index ad85d44bbc..1f889d425d 100644
> --- a/package/python-certifi/python-certifi.mk
> +++ b/package/python-certifi/python-certifi.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_CERTIFI_VERSION = 2025.10.5
> +PYTHON_CERTIFI_VERSION = 2025.11.12
>  PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
> -PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/4c/5b/b6ce21586237c77ce67d01dc5507039d444b630dd76611bbca2d8e5dcd91
> +PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/a2/8c/58f469717fa48465e4a50c014a0400602d3c437d7c0c468e17ada824da3a
>  PYTHON_CERTIFI_SETUP_TYPE = setuptools
>  PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
>  PYTHON_CERTIFI_LICENSE_FILES = LICENSE
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
