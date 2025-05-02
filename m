Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60217C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 245DF41861;
	Fri,  2 May 2025 10:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T_meuWKPyBlU; Fri,  2 May 2025 10:34:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5011A414E2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5011A414E2;
	Fri,  2 May 2025 10:34:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 70B1AEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62136414E2
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:34:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QoP0BIu0f63P for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:34:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6E56B401BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E56B401BA
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E56B401BA
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:34:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DC4B51C1112; Fri,  2 May 2025 12:34:47 +0200 (CEST)
Message-ID: <0c1484c4-bb3b-4c67-8602-b15f9cf409fa@rnout.be>
Date: Fri, 2 May 2025 12:34:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20250310200610.12201-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250310200610.12201-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746182088; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=7P69xV/9gV9TgM9Ed8bDPeEGw+NnzxwQ0OZZsYfX+r8=;
 b=Li/tAI/Vwpy7Qu3eupKQ0cr9t+A1HeOvM153VF6yetZKF2A8OjEBJ6N5VYsyrUVEWA7zcS
 35tpcuGFnmRXzd6c2jjXvH3t6p5iVpuh6yZ59alpaHk6OErdgXU8gyAWvVfILedFw03s2P
 eI6nul8z1HetBfdfZe7hZhrjayA9WKStl+73uv6m6JtkzxgOX0wPdArKD9jhCxGQVbsr2K
 Hpb1eBbftkLxd+VE2jbJ0ErwyO6x7ToXn5DWxtOnu3F4a3wCv9Fm7LhbPzTDKTM+oFS17s
 9FjJXfMEg2wTX6cOqBgwfw/MRfr5KKsxfqe5xvn9qYRavJYFWAtNEd1uShaQnw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Li/tAI/V
Subject: Re: [Buildroot] [PATCH next 1/1] package/libopenmpt: bump to
 version 0.7.13
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



On 10/03/2025 21:06, Julien Olivain wrote:
> For release note since 0.7.11, see:
> https://lib.openmpt.org/libopenmpt/2024/12/01/releases-0.7.12-0.6.21-0.5.35-0.4.47/
> https://lib.openmpt.org/libopenmpt/2025/01/06/releases-0.7.13-0.6.22-0.5.36-0.4.48/
> 
> License file hash changed after year update:
> https://github.com/OpenMPT/openmpt/commit/97f0c59cda82ff92d905fb1af8d55a89997a6a8b
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/libopenmpt/libopenmpt.hash | 4 ++--
>   package/libopenmpt/libopenmpt.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libopenmpt/libopenmpt.hash b/package/libopenmpt/libopenmpt.hash
> index 0289393024..f23956536d 100644
> --- a/package/libopenmpt/libopenmpt.hash
> +++ b/package/libopenmpt/libopenmpt.hash
> @@ -1,3 +1,3 @@
>   # computed locally
> -sha256  53a798b8c6e2e1f695e8ad05e93a0c1b53199e5aa9981837c41696b370520767  libopenmpt-0.7.11+release.autotools.tar.gz
> -sha256  e3d7e76c6b441ddd9fff0a397e7b5e055a11678bd7c3b246a0ce13e352eb15e8  LICENSE
> +sha256  dcd7cde4f9c498eb496c4556e1c1b81353e2a74747e8270a42565117ea42e1f1  libopenmpt-0.7.13+release.autotools.tar.gz
> +sha256  d173856a870d3f6d0603060c615f5e3b145d79a008576e8efd2e5eab8b843430  LICENSE
> diff --git a/package/libopenmpt/libopenmpt.mk b/package/libopenmpt/libopenmpt.mk
> index 74ffbdbbd4..561d395ebb 100644
> --- a/package/libopenmpt/libopenmpt.mk
> +++ b/package/libopenmpt/libopenmpt.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBOPENMPT_VERSION = 0.7.11
> +LIBOPENMPT_VERSION = 0.7.13
>   LIBOPENMPT_SITE = https://lib.openmpt.org/files/libopenmpt/src
>   LIBOPENMPT_SOURCE = libopenmpt-$(LIBOPENMPT_VERSION)+release.autotools.tar.gz
>   LIBOPENMPT_LICENSE = BSD-3-Clause

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
