Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701CECAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 20:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AE23605A2;
	Wed,  8 Oct 2025 20:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z4quZu8UdDkn; Wed,  8 Oct 2025 20:30:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F2FC60FC6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F2FC60FC6;
	Wed,  8 Oct 2025 20:30:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 70F10226
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 20:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56D0180D64
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 20:30:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ik3NvZYI6lfj for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 20:30:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 323A880D32
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 323A880D32
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 323A880D32
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 20:30:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 99809B00579;
 Wed,  8 Oct 2025 22:30:09 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 08 Oct 2025 22:30:09 +0200
MIME-Version: 1.0
Date: Wed, 08 Oct 2025 22:30:09 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251008151624.20338-1-bernd@kuhls.net>
References: <20251008151624.20338-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <9ddb2e2276e9f85991af7f7bedf340ae@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759955410;
 bh=RUbmrTmm/yC91scc9nYCwH9GG9qOHBVjZ5EcljV2dOQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=P8PIy+mnEKMnbSu+97XU4JvbwKLmBySLX5UgzoXoguIvPj4Zzv89TOIV65BYVIH/j
 5x+MnvQ1owscN9yvknbXyYS7Fq/BxY+ZntrzmdDpxu7HU37MYRZ5HMW2flw6nKAEoD
 /+go/W+CKgOWeftmam3g/yd7fa4aIT6VfRS+n92Hp4adEJ8VxgPiUc4SM6OjFaPSWj
 fjBuDG1AL9MiWiIDxfEIudx192Jk1ZKTDFeStEVAhp8nY+JCB1ysLjS7Oc85qTSLvO
 QPl+j6OXs3TK5ZSQjqpR/sAT1JwkksiElnNIufxUkjrOk4ZceF4j20xVjca1rcvmM+
 D8MTAJIQhnehg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=P8PIy+mn
Subject: Re: [Buildroot] [PATCH 1/1] package/libsoundtouch: bump version to
 2.4.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

On 08/10/2025 17:16, Bernd Kuhls wrote:
> Switched build system to CMake to avoid autoreconf.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libsoundtouch/libsoundtouch.hash | 2 +-
>  package/libsoundtouch/libsoundtouch.mk   | 5 ++---
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libsoundtouch/libsoundtouch.hash 
> b/package/libsoundtouch/libsoundtouch.hash
> index 125bcd47a5..853f3b90bb 100644
> --- a/package/libsoundtouch/libsoundtouch.hash
> +++ b/package/libsoundtouch/libsoundtouch.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  
> 43b23dfac2f64a3aff55d64be096ffc7b73842c3f5665caff44975633a975a99  
> soundtouch-2.3.3.tar.gz
> +sha256  
> 3dda3c9ab1e287f15028c010a66ab7145fa855dfa62763538f341e70b4d10abd  
> soundtouch-2.4.0.tar.gz
>  sha256  
> 84c6d82dc7de80f5b73f231edfd3ddc5b53513908117452bfa37ea36bb4b7e0a  
> COPYING.TXT
> diff --git a/package/libsoundtouch/libsoundtouch.mk 
> b/package/libsoundtouch/libsoundtouch.mk
> index 099539250c..0d8d8eeba3 100644
> --- a/package/libsoundtouch/libsoundtouch.mk
> +++ b/package/libsoundtouch/libsoundtouch.mk
> @@ -4,12 +4,11 @@
>  #
>  
> ################################################################################
> 
> -LIBSOUNDTOUCH_VERSION = 2.3.3
> +LIBSOUNDTOUCH_VERSION = 2.4.0

This new version is introducing a build failure. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2088982766

For reference, the current version 2.3.3 is building correctly:
https://gitlab.com/jolivain/buildroot/-/pipelines/2088998597

Could you have a look please?

>  LIBSOUNDTOUCH_SOURCE = soundtouch-$(LIBSOUNDTOUCH_VERSION).tar.gz
>  LIBSOUNDTOUCH_SITE = https://www.surina.net/soundtouch
>  LIBSOUNDTOUCH_LICENSE = LGPL-2.1+
>  LIBSOUNDTOUCH_LICENSE_FILES = COPYING.TXT
> -LIBSOUNDTOUCH_AUTORECONF = YES
>  LIBSOUNDTOUCH_INSTALL_STAGING = YES
> 
> -$(eval $(autotools-package))
> +$(eval $(cmake-package))

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
