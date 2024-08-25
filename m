Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B5F0C5320E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 09:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E72314013C;
	Sun, 25 Aug 2024 09:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1LxiYlRhHppx; Sun, 25 Aug 2024 09:55:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A42B140284
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A42B140284;
	Sun, 25 Aug 2024 09:55:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA6C81BF28D
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 09:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E627040284
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 09:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9WO-1iJXSVKl for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 09:55:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 55C104013C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55C104013C
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55C104013C
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 09:55:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EEB7C1BF204;
 Sun, 25 Aug 2024 09:55:03 +0000 (UTC)
Date: Sun, 25 Aug 2024 11:55:03 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240825115503.49974f0f@windsurf>
In-Reply-To: <20240825083041.1020638-1-bernd@kuhls.net>
References: <20240825083041.1020638-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724579704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IWBFyiCZVkebAokeeT5trMrG3NbOy6BOD4jKdEkiS10=;
 b=b87cxcMWL399Hze5lD6EmKO7hAarGNVeMXp6ynMeBLq4WckAmiiOuVkbLYeOkPJKgpl+Ie
 LDsKGdM/csQ7cgcJJXIBuQbvlDLMa81+1TEEIe2nlGyRLPQhz2k9igGA3U1XraIhHVefgC
 vaSTOixxbrnOE8Nb4e5amRelHYZ4WGJCHaw3xQ6T1dZovuQSW6NUQOhRDGjvGrE/3Pkou7
 pLYNbZMPCnRqwFJ52WY4k2NkGhOpcexNibKVpfdEXN+0ZoU1u4E0sFGzzcxHfpcmnjvrWQ
 dwMC5TKzGf3uBfWLpWftPY5K4dCMd+EGtp+Fwkqav1bZ3KXbrbOQuVFv3C15YQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b87cxcMW
Subject: Re: [Buildroot] [PATCH 1/1] package/php: Fix build on arm
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Sun, 25 Aug 2024 10:30:41 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> diff --git a/package/php/php.mk b/package/php/php.mk
> index 0487c03b61..6266ef4e7f 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -64,6 +64,10 @@ PHP_CONF_ENV += ac_cv_c_bigendian_php=yes
>  else
>  PHP_CONF_ENV += ac_cv_c_bigendian_php=no
>  endif
> +# fix configure check for aarch64 CRC32 API
> +ifeq ($(BR2_arm)$(BR2_armeb),y)
> +PHP_CONF_ENV += ac_cv_func___crc32d=no
> +endif

Thanks, but this sort of thing really needs to be fixed in the upstream
configure.ac. Indeed if you have to override cache variables like this,
it means that the configure.ac check is defective.

Could you try instead:

diff --git a/configure.ac b/configure.ac
index 491963daae2..2693ba09f4a 100644
--- a/configure.ac
+++ b/configure.ac
@@ -696,7 +696,19 @@ AC_FUNC_ALLOCA
 PHP_TIME_R_TYPE
 
 AC_CACHE_CHECK([for aarch64 CRC32 API], [php_cv_func___crc32d],
-[AC_LINK_IFELSE([AC_LANG_PROGRAM([#include <arm_acle.h>], [__crc32d(0, 0);])],
+[AC_LINK_IFELSE([AC_LANG_PROGRAM([
+#include <arm_acle.h>
+# if defined(__GNUC__)
+#  if!defined(__clang__)
+#   pragma GCC push_options
+#   pragma GCC target ("+nothing+crc")
+#  elif defined(__APPLE__)
+#   pragma clang attribute push(__attribute__((target("crc"))), apply_to=function)
+#  else
+#   pragma clang attribute push(__attribute__((target("+nothing+crc"))), apply_to=function)
+#  endif
+# endif
+], [__crc32d(0, 0);])],
 [php_cv_func___crc32d=yes],
 [php_cv_func___crc32d=no])])
 AS_VAR_IF([php_cv_func___crc32d], [yes],

Could you try this, and check it works as expected on ARM 32-bit, and
AArch64 ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
