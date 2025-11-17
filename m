Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37BCCE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A989D60F36;
	Mon, 17 Nov 2025 20:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SX2DVx4JS8Cq; Mon, 17 Nov 2025 20:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C26D060F94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C26D060F94;
	Mon, 17 Nov 2025 20:07:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A2ED3158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94B60610FF
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jZJeUNS--MBL for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:07:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 91E1760F36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91E1760F36
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91E1760F36
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9A784B9798F9; Mon, 17 Nov 2025 21:07:05 +0100 (CET)
Message-ID: <c82a1ea8-c332-4532-b7f8-46411a728837@rnout.be>
Date: Mon, 17 Nov 2025 21:07:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>
References: <20251102113740.1398246-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251102113740.1398246-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1763410025; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=vUTjmzscHGK1m1asNXSiTz9rejHqGuBMv6dyVGZDBpM=;
 b=o+o0QUVTt2ELYXPqbaIthVBMfiZNOilUntMvAfZsib7343RGM+ZWhQZCypTHHOvA1b+Gl8
 zpgsjglJXg2kC/X6kWt+0lu9FK5EzOKVT9LF+ehs9i0/Abcu6TqgJFSMVNZH44z65M/nql
 VI8sHf4nWn+oNuRPyZCLnlxiLR/bfTnzWV3lJX9UKwdoa7H4yXQnu4PMk4bEU3pI96hi1a
 atYO98wnM7DZIWTh40vRXkdtuP0UhIPubxY/RSNtILasrjonZCn0SV4vfsBmHeigiipeoC
 TLcYIw/2ReU3iAOs888xNRGCD9Dz1IoY3txn9YVR9+2mvbZ1MNUkNqpNsUdg/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=o+o0QUVT
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask-cors: remove
 license file
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/11/2025 12:37, Bernd Kuhls wrote:
> Upstream tarball does not contain a license file anymore since version
> 5.0.1 [1] which causes errors after buildroot commit
> 04cd135b26406dcc31cb66af1480d53fffe81e59 which bumped the package
> version from 5.0.0 to 6.0.1.
> 
> Fixes:
> https://autobuild.buildroot.net/results/1eb/1eb9d68616793c9241bcb55bc2ea1929608c68bd/
> 
> [1] https://github.com/corydolphin/flask-cors/issues/382
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   package/python-flask-cors/python-flask-cors.hash | 2 --
>   package/python-flask-cors/python-flask-cors.mk   | 1 -
>   2 files changed, 3 deletions(-)
> 
> diff --git a/package/python-flask-cors/python-flask-cors.hash b/package/python-flask-cors/python-flask-cors.hash
> index 7070b5462e..974d4a7a9e 100644
> --- a/package/python-flask-cors/python-flask-cors.hash
> +++ b/package/python-flask-cors/python-flask-cors.hash
> @@ -1,5 +1,3 @@
>   # md5, sha256 from https://pypi.org/pypi/flask-cors/json
>   md5  2879503d54f25a4cacb62f7060b96e14  flask_cors-6.0.1.tar.gz
>   sha256  d81bcb31f07b0985be7f48406247e9243aced229b7747219160a0559edd678db  flask_cors-6.0.1.tar.gz
> -# Locally computed sha256 checksums
> -sha256  6e1a1bdc54834c1e0740cbce5d5f6f2cae1c846fd2a7f482b11649594fafbd5d  LICENSE
> diff --git a/package/python-flask-cors/python-flask-cors.mk b/package/python-flask-cors/python-flask-cors.mk
> index 26198e6fb4..c7bc338867 100644
> --- a/package/python-flask-cors/python-flask-cors.mk
> +++ b/package/python-flask-cors/python-flask-cors.mk
> @@ -9,7 +9,6 @@ PYTHON_FLASK_CORS_SOURCE = flask_cors-$(PYTHON_FLASK_CORS_VERSION).tar.gz
>   PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/76/37/bcfa6c7d5eec777c4c7cf45ce6b27631cebe5230caf88d85eadd63edd37a
>   PYTHON_FLASK_CORS_SETUP_TYPE = setuptools
>   PYTHON_FLASK_CORS_LICENSE = MIT
> -PYTHON_FLASK_CORS_LICENSE_FILES = LICENSE
>   PYTHON_FLASK_CORS_CPE_ID_VENDOR = flask-cors_project
>   PYTHON_FLASK_CORS_CPE_ID_PRODUCT = flask-cors
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
