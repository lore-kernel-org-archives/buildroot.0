Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C470AC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 19:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C65C40A11;
	Tue,  5 Apr 2022 19:56:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WAAeb-yddY7Y; Tue,  5 Apr 2022 19:55:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60296405E8;
	Tue,  5 Apr 2022 19:55:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C0AE71BF21A
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 19:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD66C414C5
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 19:55:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Aly3zgqXVnYG for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 19:55:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 963454148D
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 19:55:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b44e:a19f:2a4d:fe1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id A445919F5AB;
 Tue,  5 Apr 2022 21:55:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1649188550;
 bh=T8miCDFroBb5A03tCd0uxSree6jQQEPqANqkhW0jF6k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RTtXDYYAQrDLFBgLbbJWwv00UIorUCevxpIGTGGeo8Y1iGAP8avNymAsP4b8m0jax
 /WLADwaljbICsANnRrW14MWZpWTIeN75chbdLK51mLNe2reFlaEu41Oml69w/K1Ov0
 iK3KpESFANBjfd+UvX6RYBT0hbWefRuVqU1QZrkWTCeGeeeul+JkvOPiEARQWIenBk
 /CYiR4pLGS47N1IqQddse9xd4goxZiyaVfMV+VQAF2uHfRSIcOQzYqDFxEiVMWfhpj
 djfONG4EK/XdEf1Z6cEosPtkTppiRMAl1nMbGsg+P6Hq8+4zwKw8uTtnD0/V8+vQzx
 yQR8zzMKacOxA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 05 Apr 2022 21:55:45 +0200
Date: Tue, 5 Apr 2022 21:55:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220405195545.GH2354230@scaer>
References: <20220404091256.683581-1-joel@jms.id.au>
 <2ddab288-a57a-18ed-c392-d6695dd68e89@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2ddab288-a57a-18ed-c392-d6695dd68e89@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/zlib-ng: Backport patch to fix
 linking on powerpc
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
Cc: fontaine.fabrice@gmail.com, Joel Stanley <joel@jms.id.au>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-04-04 22:17 +0200, Arnout Vandecappelle spake thusly:
> On 04/04/2022 11:12, Joel Stanley wrote:
> >Commit 192dfc68c0e4 ("package/zlib-ng: fix build on powerpc") turned the
>  Peter just backported this one to 2022.02.x...
> >Power8 optimisations off to fix a build issue. Instead apply a patch
> >from the develop branch upstream to fix the issue.
> >
> >This patch is not yet in a released version of zlib-ng.
> >
> >Signed-off-by: Joel Stanley <joel@jms.id.au>
>  Applied to master, thanks.

Err... Why would we enable the POWER8 optimisations when the target is
not a POWER8 ?

Backporting the patch seems correct, but the enabling/disabling the
optinisations should have stayed, I believe...

Regards,
Yann E. MORIN.

> >---
> >  ...rd-for-vec_sumsu-to-prevent-undefine.patch | 27 +++++++++++++++++++
> >  package/zlib-ng/zlib-ng.mk                    |  6 -----
> >  2 files changed, 27 insertions(+), 6 deletions(-)
> >  create mode 100644 package/zlib-ng/0001-Use-static-keyword-for-vec_sumsu-to-prevent-undefine.patch
> >
> >diff --git a/package/zlib-ng/0001-Use-static-keyword-for-vec_sumsu-to-prevent-undefine.patch b/package/zlib-ng/0001-Use-static-keyword-for-vec_sumsu-to-prevent-undefine.patch
> >new file mode 100644
> >index 000000000000..cc103215de3c
> >--- /dev/null
> >+++ b/package/zlib-ng/0001-Use-static-keyword-for-vec_sumsu-to-prevent-undefine.patch
> >@@ -0,0 +1,27 @@
> >+From 677f56825f7080403e18e57ffe8177f3df290f20 Mon Sep 17 00:00:00 2001
> >+From: Nathan Moinvaziri <nathan@nathanm.com>
> >+Date: Sun, 23 Jan 2022 12:59:01 -0800
> >+Subject: [PATCH] Use static keyword for vec_sumsu to prevent undefined
> >+ reference error when g++ linking.
> >+
> >+Signed-off-by: Joel Stanley <joel@jms.id.au>
> >+---
> >+ arch/power/adler32_power8.c | 2 +-
> >+ 1 file changed, 1 insertion(+), 1 deletion(-)
> >+
> >+diff --git a/arch/power/adler32_power8.c b/arch/power/adler32_power8.c
> >+index 029aa3a84c57..fc4086322efc 100644
> >+--- a/arch/power/adler32_power8.c
> >++++ b/arch/power/adler32_power8.c
> >+@@ -44,7 +44,7 @@
> >+ #include "adler32_p.h"
> >+
> >+ /* Vector across sum unsigned int (saturate).  */
> >+-inline vector unsigned int vec_sumsu(vector unsigned int __a, vector unsigned int __b) {
> >++static inline vector unsigned int vec_sumsu(vector unsigned int __a, vector unsigned int __b) {
> >+     __b = vec_sld(__a, __a, 8);
> >+     __b = vec_add(__b, __a);
> >+     __a = vec_sld(__b, __b, 4);
> >+--
> >+2.35.1
> >+
> >diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
> >index 938acd4181a6..fb497b8c11d0 100644
> >--- a/package/zlib-ng/zlib-ng.mk
> >+++ b/package/zlib-ng/zlib-ng.mk
> >@@ -23,10 +23,4 @@ ifeq ($(BR2_arm),y)
> >  ZLIB_NG_CONF_OPTS += -DWITH_ACLE=1 -DWITH_NEON=1
> >  endif
> >-ifeq ($(BR2_powerpc_power8),y)
> >-ZLIB_NG_CONF_OPTS += -DWITH_POWER8=ON
> >-else
> >-ZLIB_NG_CONF_OPTS += -DWITH_POWER8=OFF
> >-endif
> >-
> >  $(eval $(cmake-package))
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
