Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8286D41D7E
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A37BE4120D;
	Thu, 11 Dec 2025 19:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dk2IIjmuCIT4; Thu, 11 Dec 2025 19:32:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0C7041213
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481557;
	bh=fDwoqrTiBbijhhgFlJda35GBmU5L3+Xw/d/ZV/GwNGM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lu6ScrcVW+EOh6MLqhinbtg2OqaIYdbyeHpQpwQ6Z68fFnRsJqcqBOI2e0s9C6H15
	 92DQ73Q1vTP5/L62Qyhoa9XLvKK4OWGFikifDyY4WHaYPNISvrdIf3aXYMBJJ0Enih
	 XwjdIVQanfdGc9kapsuohZvgsQfSr0ou0861Im9EeoryxleAlNWoKeliEh/eE04Oo2
	 ps06ead5btWGXN49/41fy0DUja4A1n0N2CBIXtFdhL5vtOGGb7yIfYlJ9Ooo5cmRmi
	 s4v9dTuQB87I3Sls/vK5NmAZgxsuv8DvZFNERAzrI4oqwNvVF9bM0lmZVxU8PT2uhm
	 q+Qy2H7ZEsg7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0C7041213;
	Thu, 11 Dec 2025 19:32:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 78EA5E7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B99F4120A
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 451VkLUI3NNl for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:32:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1A7F141078
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A7F141078
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A7F141078
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:32:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1AA51B979EEF; Thu, 11 Dec 2025 20:32:33 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:32:31 +0100
Message-ID: <20251211193231.1100898-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251207213735.3332670-1-bernd@kuhls.net>
References: <20251207213735.3332670-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765481553; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=/xgcShcHSkI3PrVp+5Duc3KYq0vvzgUNV3jtQbakpiw=;
 b=Vaayk0wrFepo2+9zfl4NuxJsQ0kIJPtJECkjuXDU8r01jURisF4/2ryjQ2RZD7nMyyb21g
 cY5BLvgYW2rkQpjMbfCi6rTuzrExbD9uG0C6zSjNSL8xqsV10ZxrzRzX/HBFu/idjLVhJs
 Tw6hGtb2tXq2OvAuSSd/08FDHV4SltjvdRGu3cirUlXj186GlcU4IgwTY/qN4zonZkMZ60
 rnolMyuVtCpFQHOaeJLnIH1/XZh4YJrx9gOCL2KNo7+H5rw+Uqk3uWg9YTli0lqFXIdrXl
 U521EI09cYyWN2ksvPhZL+atPSR3MN0lqSTSAlWw8RKUiAeuRF+97qh7VUKI8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Vaayk0wr
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: security bump version
 to 3.13.11
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
> Release notes: https://www.python.org/downloads/release/python-31311/
> 
> Fixes CVE-2025-12084.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.08.x. Thanks

> ---
>  package/python3/python3.hash | 6 +++---
>  package/python3/python3.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python3/python3.hash b/package/python3/python3.hash
> index 778dca3b69..fddfcc1a4d 100644
> --- a/package/python3/python3.hash
> +++ b/package/python3/python3.hash
> @@ -1,5 +1,5 @@
> -# From https://www.python.org/downloads/release/python-31310/
> -md5  5ada33c7f08d5d2df881657bdb8e848d  Python-3.13.10.tar.xz
> +# From https://www.python.org/downloads/release/python-31311/
> +md5  4c3517dd8b1fd76377dcb3e5e8f71ad6  Python-3.13.11.tar.xz
>  # Locally computed
> -sha256  bc673c04375a1a3f0808c27ba8f0411ab811ad390a8740318ccb9c60fad8fd77  Python-3.13.10.tar.xz
> +sha256  16ede7bb7cdbfa895d11b0642fa0e523f291e6487194d53cf6d3b338c3a17ea2  Python-3.13.11.tar.xz
>  sha256  78b12c3a81360b357002334f0e70ea0e92eebf7a9b358805c03c48484945f3bb  LICENSE
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 6200b8af4e..0189a505b4 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  PYTHON3_VERSION_MAJOR = 3.13
> -PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).10
> +PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).11
>  PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
>  PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
>  PYTHON3_LICENSE = Python-2.0, others
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
