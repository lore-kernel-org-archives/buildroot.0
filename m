Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150DBC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 20:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96FC040423;
	Mon, 25 Jul 2022 20:07:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96FC040423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VMzDcTEJIgss; Mon, 25 Jul 2022 20:07:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78B9A402F6;
	Mon, 25 Jul 2022 20:07:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78B9A402F6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12C411BF36C
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 20:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED74460B9D
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 20:07:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED74460B9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XwPDzzQCU9C7 for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 20:07:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEBA56076C
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BEBA56076C
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 20:07:04 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id m17so17210304wrw.7
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 13:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jL/D2JHebCCxeM3PDORwmZyPw6gH+0CPjkrsP8tGd5s=;
 b=gnsI7zDQI6mq/qfI9zqJSqyEpsn0SBsXJfvBdEHBms8lZmwbihw7u9FgS4BoI85cSM
 IT1b4m5px6Pra12+BEFqDxxCZ5Wg5hgsYEWDDyuqSO04k72CK8MpIxmm2jMdeH8uXbPg
 ZSbP7Qf/KCcflfDc/NltJRIFaJPcM6YeWmg4JIxzI6PXMp3NSafz/v6nGM2B22I2JKks
 fkhrkYF/4GS6/KT6O9y5WNPxecRk79KD51aQ0B6bkx5SOsU9d6Gr2/nJcV4NEUVtIP/v
 P57nQgrxWk+UNDYrle9uurbpso2qLmxj1PBJge+/+8zfAJowX25e991lU9fh8DgSym7B
 1m8g==
X-Gm-Message-State: AJIora/wFA8hx7c7yqhrEgfU7npLwHdPUU6T8i+xHKUxVVxSz01sH4oV
 s0nAwRMrh/JvMIefNymJ9lI98JNkbw/Q1g==
X-Google-Smtp-Source: AGRyM1tNF4AEFPCotXTvoDMFWkT+noD4C1954uJ/hA4WAqeDZcJDvI+JeiBF7Dfl7fktGUFXmKNcnA==
X-Received: by 2002:adf:de0f:0:b0:21e:713a:cae0 with SMTP id
 b15-20020adfde0f000000b0021e713acae0mr7769043wrm.89.1658779622675; 
 Mon, 25 Jul 2022 13:07:02 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 m33-20020a05600c3b2100b003a04d19dab3sm52288wms.3.2022.07.25.13.07.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 13:07:02 -0700 (PDT)
Message-ID: <20438daa-47e0-bbc8-28d9-65602a48c37c@mind.be>
Date: Mon, 25 Jul 2022 22:06:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Cyril Bur <cyrilbur@gmail.com>, buildroot@buildroot.org
References: <20211125124844.75d8dd2c@camb691.localdomain>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211125124844.75d8dd2c@camb691.localdomain>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jL/D2JHebCCxeM3PDORwmZyPw6gH+0CPjkrsP8tGd5s=;
 b=CpQsBx0KR/HgS/W5IvlSe9+sURPM+bX5WKfzJEaczGHvFunvoQGoG6U3l84mH8Zr5H
 oxRACW6FbkHKpy91PVIPqolYhLhvyNiQI4ILwrxgKjPfwrHpuIoaynroO5MMwsmPJMDX
 9XyFRQN5O6N14DA7DRWJyEQelIlDQ3oBCJme7+639/ejA/bFU8ZoK97qa7QYit7v5wcF
 Ru6yohwWvqBgHxXZxe2KMVOXGSF8RcDOI3GZG1eo6KQr43bBa7z0WkGAC6oNN06Qg72S
 Of4H8VHNvMa4RuyxoU6zdZ4l+Ybkqh0CQBJp0ee4xR50lzIMgVcgn9+c4pPSQOn7zo14
 qKQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CpQsBx0K
Subject: Re: [Buildroot] [RFC PATCH v2] Handle _LICENSE_FILES with full path
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/11/2021 13:48, Cyril Bur wrote:
> legal-info currently assumes that a packages _LICENSE_FILES will be a
> path or a filename relative to the source of the package.
> 
> There is nothing preventing _LICENSE_FILES from containing a full path.
> When this happens, the legal-info process adds the build directory on
> the front of the _LICENSE_FILES value resulting in a failed cp of the
> file.
> 
> This patch adds a check to see if the _LICENSE_FILES path with the build
> directory prepended exists (as is the case for all packages currently)
> and uses that. Otherwise it will assume that the _LICENSE_FILES file is
> a full path.
> 
> An 'offending' package .mk file could look something like this:
> LIBFOO_VERSION = 1.0
> LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
> LIBFOO_SITE = http://www.foosoftware.org/download
> LIBFOO_LICENSE = GPL-3.0+
> LIBFOO_LICENSE_FILES = $(LIBFOO_PKGDIR)/COPYING

  Note that this happens to work for an external, because then PKGDIR expands to 
an absolute path, but for internal packages it's a relative path. So your patch 
is not going to work there.

  The proper way of doing this is

define LIBFOO_COPY_LICENSE_FILE
	cp $(LIBFOO_PKGDIR)/COPYING $(LIBFOO_SRCDIR)/COPYING
endef
LIBFOO_POST_EXTRACT_HOOKS += LIBFOO_COPY_LICENSE_FILE

  Yes, it's a bit involved to write all that, but this kind of situation should 
be pretty exceptional.

  If it would start to happen in a lot of cases (i.e. if we start providing 
license files for packages that don't have any of their own), then we could add 
infra for it, e.g. LIBFOO_EXTERNAL_LICENSE_FILES (which looks for the license 
files in PKGDIR).

  However, I'm not so sure if it's such a good idea for buildroot itself to 
carry license files for projects that don't have any. If the project doesn't 
have any license file, not even a header file or something that has to be 
extracted explicitly (cfr. e.g. gcnano-binaries), then I don't think we should 
fake one either. It would give that file a veneer of authority which is 
inappropriate IMHO. Better make it clear to the user that that particular 
package is not to be trusted, license-wise.


  Therefore, I've marked this patch as Rejected in patchwork.

  Regards,
  Arnout


> 
> [...]
> 
> $(eval $(generic-package))
> 
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
> Adding a licence file to buildroot is probably odd and a strange thing
> to do, we're doing this internally (and I do hope I can push the package
> soon) with https://github.com/BrianGladman/modes
> 
> V1->V2 Reworked commit message and added example as requested by Thomas
>         Petazzoni
>   package/pkg-generic.mk | 2 +-
>   package/pkg-utils.mk   | 4 ++++
>   2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index ded5176428..e6d9f457e4 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -1139,7 +1139,7 @@ ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
>   ifeq ($$(call qstrip,$$($(2)_LICENSE_FILES)),)
>   	$(Q)$$(call legal-warning-pkg,$$($(2)_BASENAME_RAW),cannot save license ($(2)_LICENSE_FILES not defined))
>   else
> -	$(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$($(2)_BASENAME_RAW),$$($(2)_HASH_FILE),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
> +	$(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$($(2)_BASENAME_RAW),$$($(2)_HASH_FILE),$$(F),$$(call prefix-if-needed,$$($(2)_DIR),$$(F)),$$(call UPPERCASE,$(4)))$$(sep))
>   endif # license files
>   
>   ifeq ($$($(2)_SITE_METHOD),local)
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index ae3c7f9da9..0c287a0f50 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -207,6 +207,10 @@ endif
>   #
>   LEGAL_INFO_SEPARATOR = "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
>   
> +define prefix-if-needed # builddir, filename
> +	$(if $(wildcard $(1)/$(2)),$(1)/$(2),$(2))
> +endef
> +
>   define legal-warning # text
>   	echo "WARNING: $(1)" >>$(LEGAL_WARNINGS)
>   endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
