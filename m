Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADB5C83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51F59407A0;
	Thu, 17 Jul 2025 20:24:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JlFZTZ4E6Lk3; Thu, 17 Jul 2025 20:23:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 703E240CB9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 703E240CB9;
	Thu, 17 Jul 2025 20:23:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D066C226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FD1080B4D
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y0ADrDnWNl1x for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:23:56 +0000 (UTC)
X-Greylist: delayed 511 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 17 Jul 2025 20:23:55 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB15F822B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB15F822B9
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB15F822B9
 for <buildroot@busybox.net>; Thu, 17 Jul 2025 20:23:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 58C50B977AA5; Thu, 17 Jul 2025 22:15:21 +0200 (CEST)
Message-ID: <6cad79bb-069a-4738-8ae8-e094f9393836@rnout.be>
Date: Thu, 17 Jul 2025 22:15:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Fischer <mf@go-sys.de>, buildroot@busybox.net
References: <20250707130514.27071-1-mf@go-sys.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250707130514.27071-1-mf@go-sys.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752783321; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=YDQBuEzdsuu4+0xA6yD6QJPSjQkDytAj1Q4YYvevF9Y=;
 b=nflwKwBI+d/+20APUH99PxNK2y/dtg1JGP7Opu6HoHjpC/0+ekzi+jJ+fXmRG8K1A7EOzF
 ZloscVc7hx6Yw/YxlIDHh78O1PRf9UclFw1nTWifPuvNpfJosz9Go9gs8DUP+SBDKupoa0
 +jbDY9AL4/3uODjhQBVa/ojPLT5pz6Ge/s9jHEvOeRpBcF2+6sRSG1vZ0aQQblCeKPSZoM
 bpTCZnSRUMhHx0SsthhvNa2rcuBYus62qvHlee3OjrApKmTkj3aWcJoStxVUoxTi0/Azti
 cL+TvhPsI6+CHd2bB6FLchhx0IbnEPTshfMVDo1wIQofrqyngnE3inVo8c3RNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=nflwKwBI
Subject: Re: [Buildroot] [PATCH] package/gnuplot: bump version to 6.0.3
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



On 07/07/2025 15:05, Michael Fischer wrote:
> For release note, see:
> http://www.gnuplot.info/ReleaseNotes_6_0_3.html
> 
> SHA256 hash now from:
> https://sourceforge.net/projects/gnuplot/files/gnuplot/6.0.3/gnuplot-6.0.3.tar.gz.sha256
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>

  Applied to 2025.02.x and 2025.05.x, thanks.

  Regards,
  Arnout

> ---
>   package/gnuplot/gnuplot.hash | 8 ++++----
>   package/gnuplot/gnuplot.mk   | 2 +-
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
> index 980fe6858d..bac1cb9d2d 100644
> --- a/package/gnuplot/gnuplot.hash
> +++ b/package/gnuplot/gnuplot.hash
> @@ -1,6 +1,6 @@
> -# From https://sourceforge.net/projects/gnuplot/files/gnuplot/6.0.2/
> -md5  ea0931758fc180e3b1950931b9869921  gnuplot-6.0.2.tar.gz
> -sha1  be803916e4ea32720b4a646f2ffc98d6ad3a0dc2  gnuplot-6.0.2.tar.gz
> +# From https://sourceforge.net/projects/gnuplot/files/gnuplot/6.0.3/
> +md5  c897ca69062010e2cf5f7483e39e5acc  gnuplot-6.0.3.tar.gz
> +sha1  b31779d6760f432f57136600fc0c2bf65f4d4013  gnuplot-6.0.3.tar.gz
> +sha256  ec52e3af8c4083d4538152b3f13db47f6d29929a3f6ecec5365c834e77f251ab  gnuplot-6.0.3.tar.gz
>   # Locally computed
> -sha256  f68a3b0bbb7bbbb437649674106d94522c00bf2f285cce0c19c3180b1ee7e738  gnuplot-6.0.2.tar.gz
>   sha256  895928ec0735cca1c8cec42656c7e314a065d0242813bb8693c0c1bf61fd4e4d  Copyright
> diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
> index b363e761ef..2a1072a55c 100644
> --- a/package/gnuplot/gnuplot.mk
> +++ b/package/gnuplot/gnuplot.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GNUPLOT_VERSION = 6.0.2
> +GNUPLOT_VERSION = 6.0.3
>   GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
>   GNUPLOT_LICENSE = gnuplot license (open source)
>   GNUPLOT_LICENSE_FILES = Copyright

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
