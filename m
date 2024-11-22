Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F67E65D0A
	for <buildroot@archiver.kernel.org>; Fri, 22 Nov 2024 00:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 925A042AA8;
	Fri, 22 Nov 2024 00:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4niyt4t72Rc8; Fri, 22 Nov 2024 00:25:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 493B942AA6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 493B942AA6;
	Fri, 22 Nov 2024 00:25:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EE753E11
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 00:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E962143016
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 00:25:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UoIApmTwiyAa for <buildroot@buildroot.org>;
 Fri, 22 Nov 2024 00:25:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 855C142FB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 855C142FB9
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 855C142FB9
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 00:25:35 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:491e:31cb:7baf:f404])
 (Authenticated sender: vjardin@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 91EB619F5AF;
 Fri, 22 Nov 2024 01:25:32 +0100 (CET)
Date: Fri, 22 Nov 2024 01:25:32 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <3rw5dd3fqy2obmnqnb3jg3jauddbzwkyh3y6vfuhqo7rfxye5t@4j7qvg5m6tkq>
References: <20241121225344.203867-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241121225344.203867-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732235133;
 bh=Y4tx5HdmKel0O2IysyDDuCCHTXMeYlsAKykXYgWxUbg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JqSO9UOSFyx3RVCzm6PhHlJN5Zwy9D4a1gjxZHmt+QsXLwCE/TTymdVA0Q0HYRKuv
 mJyq0ZelZvHX/3bgcfmJOoaRJyjjQpW43/ulezsWN5O8dRt2Ymu+l1gaN9jICQ1BLx
 BaZD4zaAYC838kbJHzVYY36gg/imXZHSIHipL7Aw/jFa1mt4Bs0uHQ5HU0a+PSJOxI
 Jw6VNIG/kSAJWAXGgcZgW1yhkF0p3oxtGIp6c0TX2eYAHU2GpGFS2QIb8XZrub57l7
 q1e5vCoErdFGDzTA6XiVwXOvbM23E80I//tZ6tVcx+e485IVWdp87KGNvoKyHoO3cr
 umG1v02tEu3ww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=JqSO9UOS
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux-libs: allowing
 building even on non-Y2038 compliant systems
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

On Thu, Nov 21, 2024 at 11:53:44PM UTC, Julien Olivain wrote:
> Since the bump of util-linux to version 2.40.2 in Buildroot commit
> f14929c657a7b1794dcd39ac469d2ad826465d98 ("package/util-linux: update
> to 2.40.2"), the build will fail on systems that are not Y2038,
> such as uClibc configurations.
> 
> In order to preserve the previous behavior, pass --disable-year2038.
> See the gnulib documentation for details [1]. Contrary to what the
> option name might suggest, it doesn't really disable Y2038 support,
> but only the check that the system is Y2038 compliant. So even with
> --disable-year2038, if the system is Y2038 compliant (uses a 64-bit
> arch, uses the musl C library, or uses the glibc C library with
> BR2_TIME_BITS_64=y), util-linux tools will be Y2038 compliant.
> 
> "--disable-year2038" was already added to util-linux in commit
> 11ae90b00 "package/util-linux: allowing building even on non-Y2038
> compliant systems".
> 
> Fixes:
> https://autobuild.buildroot.org/results/630fc287deb1cf5a684f274058b918a5d7aef989
> 
> [1] https://www.gnu.org/software/gnulib/manual/html_node/Avoiding-the-year-2038-problem.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/util-linux/util-linux-libs/util-linux-libs.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
> index 0337e7e13a..1a66f3847a 100644
> --- a/package/util-linux/util-linux-libs/util-linux-libs.mk
> +++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
> @@ -28,7 +28,8 @@ UTIL_LINUX_LIBS_DEPENDENCIES = \
>  	$(TARGET_NLS_DEPENDENCIES)
>  UTIL_LINUX_LIBS_CONF_OPTS += \
>  	--disable-rpath \
> -	--disable-makeinstall-chown
> +	--disable-makeinstall-chown \
> +	--disable-year2038

Could you add a comment extracted from your commit log that the
  option name might suggest, it doesn't really disable Y2038 support,
  but only the check that the system is Y2038 compliant.
?

So we won't, by mistake drop it. It is really counter intuitive.

Beside this cosmetic comment, it LGTMs.

Reviewed-by: Vincent Jardin <vjardin@free.fr>

thanks,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
