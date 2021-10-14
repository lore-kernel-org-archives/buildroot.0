Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08360C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:04:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB70761053
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB70761053
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78AC84012A;
	Thu, 14 Oct 2021 21:04:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JuOGpx4Hbg9M; Thu, 14 Oct 2021 21:04:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 911864014E;
	Thu, 14 Oct 2021 21:04:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 038E01BF33A
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E55694014E
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:04:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id brv4b3NwYWfr for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:04:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E48234012A
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:04:22 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id r18so29436468edv.12
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 14:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=WLgdSMT16ADWV/KeG7xNtumseFW/rxyrW26snYR3Cqg=;
 b=Gwt1GVzpVjqvNbTa/frwzpHajI6flBC1U/QTXbbFXr+ni0aeWsQVkiveGI358HftQX
 /UFmc+LdKoyLrofH8FzwVSowAHiHeOeHwgqZTPmcoIzIZkiZO/8ryBdjERJDKdKCqqpr
 ZBQsugy+ptUJFE6C+6xfjk6MYO+KJb9rzqsF+GZTD6Xhe5jecBox4crhdJAxwKv1+9VM
 yQTiiKk656mUcRrNO8H+2iznRaZrmXYXAJo829DzmrBk9RnZpkM4WBSxW5T4Ccvu4D/0
 bODYx8dRogWjN+oNtLVQZi1fXQA/xvMEsZGUe7mdkfgbHb1JlBftF78onMyi8yz3Fomb
 WoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WLgdSMT16ADWV/KeG7xNtumseFW/rxyrW26snYR3Cqg=;
 b=nGrvMLjy+I9tMED1N0/nctYTBwnx6lK2dx72M1iGvKRtQmz2Ax9WJsQaKOtY+H/xo5
 2prIxW3XAHbeiFj6mqjDS8CCDSz9ZwW1T6M1Ih9N90ZHrV0x/5dskSqfnOQpwx6a/pnt
 nyJByw6EuqRZ3j4hVYhvv7ymjMe1pHjnltFMcfg4xHafVHmUAdmFtgdoqY05i5sl73ai
 Sz6WAi0K7BSiG0wQUBU6T9YPHDz6uE8SzuAh2RCvr/oVYYxyB6MFDaGYBKNGFmf7R7wG
 +ZhHxutO7zYv4EeBE9KoLu0uD/gZblcPLKPTKoBB8nlsKSvTa15QPHpdzVHGCrYwaMi2
 LimQ==
X-Gm-Message-State: AOAM533EaMxLzB20JCTx4NzK8Ao2Ilx7ilv2DBNCd2F5vQg8gKakJOEG
 +F6n+owcAqcR03vTnki3sis4eGH19lOuCexr
X-Google-Smtp-Source: ABdhPJywlXEtb8sXK7IQf7u1tZ/mrf2JBTs2CpGFEqKKQMZytZh7K/lj/Evvenz2vWotjqoFYOLuuw==
X-Received: by 2002:a05:6402:49a:: with SMTP id
 k26mr12304326edv.279.1634245461100; 
 Thu, 14 Oct 2021 14:04:21 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id k15sm2669259eje.37.2021.10.14.14.04.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 14:04:20 -0700 (PDT)
Message-ID: <ae63fa88-9c3a-1d97-6470-2710a779e547@mind.be>
Date: Thu, 14 Oct 2021 23:04:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211009173017.674627-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211009173017.674627-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/oracle-mysql: fix build with
 autoconf >= 2.70
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/10/2021 19:30, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump of autoconf to version
> 2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da:
> 
> autoheader: warning: missing template: CRAY_STACKSEG_END
> autoheader: warning: Use AC_DEFINE([CRAY_STACKSEG_END], [], [Description])
> autoreconf: error: /home/buildroot/autobuild/instance-2/output-1/host/bin/autoheader failed with exit status: 1
> package/pkg-generic.mk:273: recipe for target '/home/buildroot/autobuild/instance-2/output-1/build/oracle-mysql-5.1.73/.stamp_configured' failed
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/e5329bcf166d46b2eb17f2bc727c0307bef5ed02
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   ...-alloca.m4-Remove-obsolete-Cray-supp.patch | 50 +++++++++++++++++++
>   1 file changed, 50 insertions(+)
>   create mode 100644 package/oracle-mysql/0011-config-ac-macros-alloca.m4-Remove-obsolete-Cray-supp.patch
> 
> diff --git a/package/oracle-mysql/0011-config-ac-macros-alloca.m4-Remove-obsolete-Cray-supp.patch b/package/oracle-mysql/0011-config-ac-macros-alloca.m4-Remove-obsolete-Cray-supp.patch
> new file mode 100644
> index 0000000000..f3dbde253c
> --- /dev/null
> +++ b/package/oracle-mysql/0011-config-ac-macros-alloca.m4-Remove-obsolete-Cray-supp.patch
> @@ -0,0 +1,50 @@
> +From 0d8ab9b020870c62c216fca77e7f8bd3eeb710c3 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 9 Oct 2021 19:23:46 +0200
> +Subject: [PATCH] config/ac-macros/alloca.m4: Remove obsolete Cray support
> +
> +Remove obsolete Cray support to avoid the following build failure since
> +autoconf >= 2.70 and
> +http://git.savannah.gnu.org/gitweb/?p=autoconf.git;a=commit;h=15edf7fd8094fd14a89d9891dd72a9624762597a:
> +
> +autoheader: warning: missing template: CRAY_STACKSEG_END
> +autoheader: warning: Use AC_DEFINE([CRAY_STACKSEG_END], [], [Description])
> +autoreconf: error: /home/buildroot/autobuild/instance-2/output-1/host/bin/autoheader failed with exit status: 1
> +package/pkg-generic.mk:273: recipe for target '/home/buildroot/autobuild/instance-2/output-1/build/oracle-mysql-5.1.73/.stamp_configured' failed
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/e5329bcf166d46b2eb17f2bc727c0307bef5ed02
> +

  I added:

Upstream: switched to CMake a very long time ago, so not sent upstream


  Applied to master, thanks.

  Regards,
  Arnout


> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + config/ac-macros/alloca.m4 | 14 --------------
> + 1 file changed, 14 deletions(-)
> +
> +diff --git a/config/ac-macros/alloca.m4 b/config/ac-macros/alloca.m4
> +index 8c730dd671f..eecb8249573 100644
> +--- a/config/ac-macros/alloca.m4
> ++++ b/config/ac-macros/alloca.m4
> +@@ -46,20 +46,6 @@ then
> +    ALLOCA=alloca.o
> +    AC_DEFINE(C_ALLOCA, 1)
> +
> +- AC_CACHE_CHECK(whether alloca needs Cray hooks, ac_cv_os_cray,
> +- [AC_EGREP_CPP(webecray,
> +- [#if defined(CRAY) && ! defined(CRAY2)
> +- webecray
> +- #else
> +- wenotbecray
> +- #endif
> +- ], ac_cv_os_cray=yes, ac_cv_os_cray=no)])
> +- if test "$ac_cv_os_cray" = "yes"; then
> +- for ac_func in _getb67 GETB67 getb67; do
> +-   AC_CHECK_FUNC($ac_func, [AC_DEFINE_UNQUOTED(CRAY_STACKSEG_END, $ac_func)
> +-   break])
> +- done
> +- fi
> +  fi
> +  AC_SUBST(ALLOCA)dnl
> + else
> +--
> +2.33.0
> +
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
