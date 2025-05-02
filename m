Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625E7C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3568581F1A;
	Fri,  2 May 2025 11:10:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0GDep2DriTyl; Fri,  2 May 2025 11:10:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6799383DFC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6799383DFC;
	Fri,  2 May 2025 11:10:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2205CEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07A4181F1A
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:10:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qfDqqXCWQ44o for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:10:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 547AD83DFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 547AD83DFC
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 547AD83DFC
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:10:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7756E1C0FC1; Fri,  2 May 2025 13:10:26 +0200 (CEST)
Message-ID: <7a982724-ca1e-4f2c-87d2-fdb1ffd09703@rnout.be>
Date: Fri, 2 May 2025 13:10:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
References: <20250425004243.218301-1-james.hilliard1@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250425004243.218301-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746184226; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=8sddH8cOzXzS5JXUTGtTjKVTN7DscIX92xhk6LSudiA=;
 b=G5hx04cyQ6MrdjdzwrKfCJ5vPRKrUmdklX5I6NV8LAiWlJGnvzrWnlhWkRZuTQDeh3GsJB
 j4Yr5H0kcdg7Ps7/Qj7NlLkeeVTlLBVNnG5ylVdaiJTGgtZScW21uvIgbxMJVh5xcU6Zbv
 aQjh2DWNO/+6/muz14xTs3F0iGALPA4WBVAGKJmxw01FhpFqilRtEv+tStsFjIhvwmNtg9
 SH8VHztlT3FgvkZUaSoGE8/nZ8/5+vKnmx+k1NN7JaW3VA9Ns+t0xKezW/dn1XYr4yYK4+
 CcwFOIQSnvrEcZqW1/RF+zXyTkF96o/GPhEcVVp6VUjFcqUc2tbmSL2yFyoxeQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=G5hx04cy
Subject: Re: [Buildroot] [PATCH 1/1] package/libubootenv: bump to version
 0.3.6
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



On 25/04/2025 02:42, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/libubootenv/libubootenv.hash | 2 +-
>   package/libubootenv/libubootenv.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libubootenv/libubootenv.hash b/package/libubootenv/libubootenv.hash
> index 887ad6843d..986b651e42 100644
> --- a/package/libubootenv/libubootenv.hash
> +++ b/package/libubootenv/libubootenv.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  dc27ddcb377e259d898256e90449bc3128437660cacc33dc75f6630d3e52c44e  libubootenv-0.3.5.tar.gz
> +sha256  7946006781ad518aac1f06e2ad7e0281e4ece3d59e9616cccb01fd0c169a3e0b  libubootenv-0.3.6.tar.gz
>   sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1-or-later.txt
>   sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSES/MIT.txt
> diff --git a/package/libubootenv/libubootenv.mk b/package/libubootenv/libubootenv.mk
> index e5f5e9b15a..5c2c36e90b 100644
> --- a/package/libubootenv/libubootenv.mk
> +++ b/package/libubootenv/libubootenv.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBUBOOTENV_VERSION = 0.3.5
> +LIBUBOOTENV_VERSION = 0.3.6
>   LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,v$(LIBUBOOTENV_VERSION))
>   LIBUBOOTENV_LICENSE = LGPL-2.1+, MIT, CC0-1.0
>   LIBUBOOTENV_LICENSE_FILES = LICENSES/CC0-1.0.txt \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
