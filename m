Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A23C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:54:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4EC960230
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4EC960230
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A871140230;
	Mon, 25 Oct 2021 18:54:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zQ-2rQ7KGXJX; Mon, 25 Oct 2021 18:54:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56BFE4041F;
	Mon, 25 Oct 2021 18:54:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16FC61BF3F7
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0144B40247
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:54:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SO2Gxv60vszd for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 18:54:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB74240230
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 18:54:04 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id w15so3194794edc.9
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 11:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=CZjhRSCJ0ac3s5e74LkpdrRKCyy1tHt+OI+/9AvWaS0=;
 b=IwBdmvGaBSeCCUg3WBbUASw0SygO9AN38nPnQ3zYF3X0h9/N5ZroWiKnFHhxgle7nZ
 FrB40Nm3S4ZzqF2rrGghOMQnfRzO83U/hVVNXaV6WKA/u4jGpBrUMOHrnyfVxH5Y9/k/
 L9gvDUb6MCQJt/VoLj9T2bqItQqVF1fmqFXCSmGqaXo89QiJjbwN+TBAGkZlcUZ2B+uG
 dgiHF7GU7nrUdBPiozKY4vSYFGf86h2Eo+G6SN9ypQT9BaJInvXrkQllKtWlYgXrd6SW
 gT0OIjUKc/1dXDZYRyh2ydkgw/68Qsbg4p7cnKyEWtZ9kTOPh8jfFotx4jNvSKUNpFh1
 x/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=CZjhRSCJ0ac3s5e74LkpdrRKCyy1tHt+OI+/9AvWaS0=;
 b=60+g10Y+YwkyLSAN3O2+VS8Qs4DmDyiv3TtipuJ2qxcaT75yTrSNiG8gPm8tV1sJC1
 8LunqBNl+Od3Brou5XukIxpwPS7HtEvy2Liy7r2RxtA5UWsBZ+7Blc5FVY4O9Li0Bbi8
 NRFUjMiOTtGO3xY/I+FdZd5dG2DYg0uQegAq9vNiLwHQ103CLvwYJIavDUc7vCs6w1W6
 uLJEpzmzCaI7VPQkgLopMYZuUivdFc+F+GKDp2OiX4fhsgpdd0GHT0QsQ4YWLrgBAtxj
 7p+/BIU4JuGoc3qzLFA2lSvQuoFO2lhJoJMBTfeyLCKv1k/RHHqegCF7Lqwty8/iFjRR
 WkUQ==
X-Gm-Message-State: AOAM533KaQYDcSbU8MkNqSj/D/5AO3r4Wr0t1hP/yvuDeE812SXphgri
 CvAT0IcaZo9QzFzDWrkn0NcBPQ==
X-Google-Smtp-Source: ABdhPJxyqVvVfRB3A4tOun88XilKsBDMlEwRwbfVHm3O4gCFhaHeAYTmC07I8/dQzFUjOxr93KL3kw==
X-Received: by 2002:a05:6402:504:: with SMTP id
 m4mr28570808edv.202.1635188043073; 
 Mon, 25 Oct 2021 11:54:03 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id a26sm5253127edv.48.2021.10.25.11.54.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 11:54:02 -0700 (PDT)
Message-ID: <244390a2-4ddb-b086-ed5b-f76e02b92c6a@mind.be>
Date: Mon, 25 Oct 2021 20:54:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211013204956.1929342-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211013204956.1929342-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/brltty: bump to version 6.4
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
Cc: Mario Lang <mlang@blind.guru>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/10/2021 22:49, Fabrice Fontaine wrote:
> - Drop second patch (already in version)
> - Update hash of README (changes not related to license)
> 
> https://brltty.app/doc/ChangeLog.txt
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...gmprivs_linux.c-fix-build-with-gcc-5.patch | 55 -------------------
>   package/brltty/brltty.hash                    |  4 +-
>   package/brltty/brltty.mk                      |  2 +-
>   3 files changed, 3 insertions(+), 58 deletions(-)
>   delete mode 100644 package/brltty/0002-Programs-pgmprivs_linux.c-fix-build-with-gcc-5.patch
> 
> diff --git a/package/brltty/0002-Programs-pgmprivs_linux.c-fix-build-with-gcc-5.patch b/package/brltty/0002-Programs-pgmprivs_linux.c-fix-build-with-gcc-5.patch
> deleted file mode 100644
> index 92b5aea21e..0000000000
> --- a/package/brltty/0002-Programs-pgmprivs_linux.c-fix-build-with-gcc-5.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -From 92b3fca2d55757680398b55869214fc2d19e9b71 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sun, 21 Feb 2021 20:47:06 +0100
> -Subject: [PATCH] Programs/pgmprivs_linux.c: fix build with gcc < 5
> -
> -Build with gcc < 5 is broken since version 6.2 and
> -https://github.com/brltty/brltty/commit/8ce262f2c15f10a40d9cbae0b3c88b466970a055:
> -
> -./pgmprivs_linux.c: In function 'getPrivilegeParameterNames':
> -./pgmprivs_linux.c:2220:3: error: array initialized from non-constant array expression
> -   static const char *const names[] = NULL_TERMINATED_STRING_ARRAY(
> -   ^
> -
> -Build was partially fixed since
> -https://github.com/brltty/brltty/commit/8ae78dd560d00c5074158f90be5ac8dac80183db
> -but it forgot to update pgmprivs_linux.c
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/58afeb50a0ecdb8b527d7c9946bcae290b79b055
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[yann.morin.1998@free.fr: use an actual backport after upstream merge]
> -Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ----
> - Programs/pgmprivs_linux.c | 12 +++++++-----
> - 1 file changed, 7 insertions(+), 5 deletions(-)
> -
> -diff --git a/Programs/pgmprivs_linux.c b/Programs/pgmprivs_linux.c
> -index 56e464a82..7dfabaf9b 100644
> ---- a/Programs/pgmprivs_linux.c
> -+++ b/Programs/pgmprivs_linux.c
> -@@ -2215,13 +2215,15 @@ typedef enum {
> -   PARM_USER,
> - } Parameters;
> -
> -+
> -+static const char *const *const pgmprivs_names =
> -+  NULL_TERMINATED_STRING_ARRAY(
> -+    "path", "scfmode", "shell", "user"
> -+  );
> -+
> - const char *const *
> - getPrivilegeParameterNames (void) {
> --  static const char *const names[] = NULL_TERMINATED_STRING_ARRAY(
> --    "path", "scfmode", "shell", "user"
> --  );
> --
> --  return names;
> -+  return pgmprivs_names;
> - }
> -
> - const char *
> ---
> -2.25.1
> -
> diff --git a/package/brltty/brltty.hash b/package/brltty/brltty.hash
> index 504b0d802a..cec074d8ce 100644
> --- a/package/brltty/brltty.hash
> +++ b/package/brltty/brltty.hash
> @@ -1,4 +1,4 @@
>   # Locally computed
> -sha256  b256df8f86b4d6a597cfe982cc5a7c831915de37cfece683ddb02b2329256a8a  brltty-6.3.tar.xz
> +sha256  bc7573b0d0ab865c36607945b64c209312405571788f3b409397726f6143eaa6  brltty-6.4.tar.xz
>   sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  LICENSE-LGPL
> -sha256  da78e60359a86eeefb6d6e02bc47d386ece10ae45309d998981157c3746724ab  README
> +sha256  429be921e6bf783303a1f94cbb7f29dc4f0839e47efe38150b808f886028f4df  README
> diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
> index 602750c9b8..9e21018c0a 100644
> --- a/package/brltty/brltty.mk
> +++ b/package/brltty/brltty.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -BRLTTY_VERSION = 6.3
> +BRLTTY_VERSION = 6.4
>   BRLTTY_SOURCE = brltty-$(BRLTTY_VERSION).tar.xz
>   BRLTTY_SITE = http://brltty.com/archive
>   BRLTTY_INSTALL_STAGING_OPTS = INSTALL_ROOT=$(STAGING_DIR) install
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
