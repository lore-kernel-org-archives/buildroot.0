Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3B4C433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 21:53:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FE416109F
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 21:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8FE416109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26F0960766;
	Thu,  4 Nov 2021 21:53:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gqXmd9kEiQmW; Thu,  4 Nov 2021 21:53:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7078A605E2;
	Thu,  4 Nov 2021 21:53:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C964D1BF8A8
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 21:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B40F84014B
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 21:53:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RSXXp9gShDFy for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 21:53:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3866A40114
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 21:53:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 9A42A1C0004;
 Thu,  4 Nov 2021 21:53:40 +0000 (UTC)
Date: Thu, 4 Nov 2021 22:53:39 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Yair Ben-Avraham <yairba@protonmail.com>
Message-ID: <20211104225339.67a47317@windsurf>
In-Reply-To: <RnUd7kxUKLWeLZSMoM1dFtpAD4Qfe3R-67gu27eAGtE6yrgC1oHzq1GwiOoE9Gmk6uZZ-c6k6LUVxdMqKhUro4_bM4zZKPhsbN5e9BV8SV4=@protonmail.com>
References: <RnUd7kxUKLWeLZSMoM1dFtpAD4Qfe3R-67gu27eAGtE6yrgC1oHzq1GwiOoE9Gmk6uZZ-c6k6LUVxdMqKhUro4_bM4zZKPhsbN5e9BV8SV4=@protonmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] package/tpm2-tss: bump version to 3.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yair,

I'm getting back to this patch that you contributed about a month ago,
because since this version bump we are getting zillions of failures in
the build of tpm2-tss:

  http://autobuild.buildroot.net/?reason=tpm2-tss%

They are caused by the lack of setfacl on the host. Fabrice Fontaine
cooked a patch to add host-acl to the dependencies of tpm2-tss, but as
I replied to his patch, this isn't a suitable solution as setfacl will
clearly not working in a Buildroot context where the build runs as
non-root. It seems like the entire installation logic of tpm2-tss got
broken for cross-compilation scenarios. See the discussion with Fabrice
at:

  https://patchwork.ozlabs.org/project/buildroot/patch/20211013065446.1857356-1-fontaine.fabrice@gmail.com/

Could you have a look into this ?

Thanks a lot,

Thomas

On Tue, 05 Oct 2021 05:20:16 +0000
Yair Ben-Avraham via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
> ---
>  package/tpm2-tss/tpm2-tss.hash | 2 +-
>  package/tpm2-tss/tpm2-tss.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tpm2-tss/tpm2-tss.hash b/package/tpm2-tss/tpm2-tss.hash
> index 6856fd4fde..b6eb3c1f97 100644
> --- a/package/tpm2-tss/tpm2-tss.hash
> +++ b/package/tpm2-tss/tpm2-tss.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  78392be7309baf47f51b122f566ac915fd4d1760ea78571cba2e1484f9b5be17  tpm2-tss-3.0.3.tar.gz
> +sha256  8900a6603f74310b749b65f23c3461cde6e2a23a5f61058b21004c25f9cf19e8  tpm2-tss-3.1.0.tar.gz
>  sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
> diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
> index 9ffbef2f07..8e701933c4 100644
> --- a/package/tpm2-tss/tpm2-tss.mk
> +++ b/package/tpm2-tss/tpm2-tss.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
> 
> -TPM2_TSS_VERSION = 3.0.3
> +TPM2_TSS_VERSION = 3.1.0
>  TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
>  TPM2_TSS_LICENSE = BSD-2-Clause
>  TPM2_TSS_LICENSE_FILES = LICENSE
> --
> 2.30.2
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
