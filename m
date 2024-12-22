Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED15E77188
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 14:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E0EB80BAB;
	Sun, 22 Dec 2024 14:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5-6RtkaSj-vd; Sun, 22 Dec 2024 14:12:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02EDA80BB5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02EDA80BB5;
	Sun, 22 Dec 2024 14:12:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4000A5E
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B2BB4027F
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IGpXh9gq-CXg for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 14:12:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CDCCC4138E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDCCC4138E
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CDCCC4138E
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:12:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id CF5762003C6;
 Sun, 22 Dec 2024 15:12:37 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43048])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Dec 2024 15:12:37 +0100
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 15:12:37 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241219022351.282995-1-james.hilliard1@gmail.com>
References: <20241219022351.282995-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <7c3277ca5ca53ade7016bf4ca38d6687@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734876759;
 bh=q+o1yxvYWKm4ZaGhkESL17GLRtUqzCS8KPWXROaiNUg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=h81DzBTIRoO5PKRXWQgfHq7Xcq1Hn/3ikGePWd8M7ggEyfASfg3kYYYCCO3tW5tk8
 ElF3qCHmSnaPTrq5jbfLhI2L8A56jQjMYl3mj1HahfG9KM4QCYJuPgQuo8NSE9QeHf
 TNmNGUi5ptRPpPE7YuQSniBiyTb8pGAJ6e54DH5eUpvzm11LSTmitkqmBJcMeihv7a
 cCeZdWVZ/W2ihud8GPsNs3kffMDEecG8vBHBFC/VaxDj3gXyDV5uWVztG479myDuiz
 MJM4s+gC7yUYSPsLWhGROs1hwEBHaxaYEhNrHiJtE/0khWv0sdO4TTApbydfQHE2GF
 n0/ceCBoybu+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=h81DzBTI
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pydantic-settings: bump
 to version 2.7.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 19/12/2024 03:23, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  .../python-pydantic-settings/python-pydantic-settings.hash    | 4 ++--
>  package/python-pydantic-settings/python-pydantic-settings.mk  | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git 
> a/package/python-pydantic-settings/python-pydantic-settings.hash 
> b/package/python-pydantic-settings/python-pydantic-settings.hash
> index c1acb00dc2..365158a1ec 100644
> --- a/package/python-pydantic-settings/python-pydantic-settings.hash
> +++ b/package/python-pydantic-settings/python-pydantic-settings.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/pydantic-settings/json
> -md5  eb50e2f88dfb5229d7319be57dcc4ed0  pydantic_settings-2.6.1.tar.gz
> -sha256  
> e0f92546d8a9923cb8941689abf85d6601a8c19a23e97a34b2964a2e3f813ca0  
> pydantic_settings-2.6.1.tar.gz
> +md5  d00fcf00e6a5095033031398d96702a3  pydantic_settings-2.7.0.tar.gz
> +sha256  
> ac4bfd4a36831a48dbf8b2d9325425b549a0a6f18cea118436d728eb4f1c4d66  
> pydantic_settings-2.7.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> eb355a753e020346d33d83bf9769135b89fc610568ac531a01c295bcee7fd998  
> LICENSE
> diff --git 
> a/package/python-pydantic-settings/python-pydantic-settings.mk 
> b/package/python-pydantic-settings/python-pydantic-settings.mk
> index 90e982b3ff..fa14f97cef 100644
> --- a/package/python-pydantic-settings/python-pydantic-settings.mk
> +++ b/package/python-pydantic-settings/python-pydantic-settings.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_PYDANTIC_SETTINGS_VERSION = 2.6.1
> +PYTHON_PYDANTIC_SETTINGS_VERSION = 2.7.0
>  PYTHON_PYDANTIC_SETTINGS_SOURCE = 
> pydantic_settings-$(PYTHON_PYDANTIC_SETTINGS_VERSION).tar.gz
> -PYTHON_PYDANTIC_SETTINGS_SITE = 
> https://files.pythonhosted.org/packages/b5/d4/9dfbe238f45ad8b168f5c96ee49a3df0598ce18a0795a983b419949ce65b
> +PYTHON_PYDANTIC_SETTINGS_SITE = 
> https://files.pythonhosted.org/packages/86/41/19b62b99e7530cfa1d6ccd16199afd9289a12929bef1a03aa4382b22e683
>  PYTHON_PYDANTIC_SETTINGS_SETUP_TYPE = hatch
>  PYTHON_PYDANTIC_SETTINGS_LICENSE = MIT
>  PYTHON_PYDANTIC_SETTINGS_LICENSE_FILES = LICENSE
> --
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
