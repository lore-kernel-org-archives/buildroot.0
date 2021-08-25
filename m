Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D20CBC432BE
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 19:34:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A3DD610F9
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 19:34:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A3DD610F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E58F0605C5;
	Wed, 25 Aug 2021 19:34:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id apTfmxdJMiLg; Wed, 25 Aug 2021 19:34:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 793F36061B;
	Wed, 25 Aug 2021 19:34:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40C1A1BF588
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 19:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 305846061B
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 19:34:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OUcuf4-VMYGZ for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 19:34:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2633E605C5
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 19:34:15 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id dm15so739077edb.10
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 12:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:from:to:references:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i70cIUrQtGQd09vMPBfOB1vRpsKe7sibzpx/qL0Y8Bo=;
 b=fGHwb1SZcgCH2qFEK00rhzfWEvQakj4sSuLdpqstdxy/S/uomJuiQ3w/1a0qZ2IuzP
 EEED35y1D2RQQDlzwGFM8FZ6CJfv0SPIVAeRyU+YIMLva+/iuJboZBMmt1CllKCeHn/R
 tKzcJcbqK4DB3zc2OcAnPm+rZzCmzGk6BkApYd2S062URfxOGNKmQQ9XtEv/HDgkxw76
 4oIeQjb23s9b8d/O+TliVWQDnLihN++OvzS44GCa6BvxCZ29KAzOZcqO+0gtQvWTg9QX
 6qOV0lqvh4wJ+IrkKhds2hCJcgjrpp2NbMqWgktfh2y8fojCdkonhKMA/Y7Op9h76zyU
 aczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=i70cIUrQtGQd09vMPBfOB1vRpsKe7sibzpx/qL0Y8Bo=;
 b=ugC9+WtpmhRSAn6Qxbejiq9ohW/sYhoAdTHbxY4Vwpo9ONBrwu788qgUdQOwV6mc46
 mD2Om6/EEVqSkIMyj3rMaAM6HS0uJ4zdogGeuMqrl3Ll6Cay4wruPn9ZB6Z3k2EZpLG1
 zM0kDcwi2crVfWbu8ggG8mIcPJrMy/S11qpajOZ0ZIlbIXbdnYXaFMICk89Ba8JZ+UK2
 Eazr6FxcWfYGPWloBreWPVkfe6fXRBujPOwNvu4QkEzyEDvDK/ST2BzeWj3e9IWI8yLv
 U+VOoI+wcD7OUYsjAN2VKrNh7I/FfXN5qnbvUpoc/ip+JupDkflcLqkUyL5In++K2Ifd
 tBGA==
X-Gm-Message-State: AOAM533/f1uu7UTKwnqmY63Kl4I7tUDPqU00Qu6rGD09IP90QfTyysGw
 CNqkVWLha3jar+7qw26DwlqW4mrV8DeX8A==
X-Google-Smtp-Source: ABdhPJyV2etO5MobmN2uGV9kr0Z4PRfO4LQksY8MDkMvlRQaAr3FlAKsS6R/+P0paxFzkmUxIfRyUg==
X-Received: by 2002:aa7:d319:: with SMTP id p25mr163302edq.197.1629920053333; 
 Wed, 25 Aug 2021 12:34:13 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id bf15sm475457edb.83.2021.08.25.12.34.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 12:34:13 -0700 (PDT)
From: Arnout Vandecappelle <arnout@mind.be>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210822085740.1770451-1-fontaine.fabrice@gmail.com>
 <d726dd48-a452-e75b-b7f8-6fe4ec6eab26@mind.be>
Organization: Essensium/Mind
Message-ID: <316f3720-776c-f6ef-03a0-c7146988ca77@mind.be>
Date: Wed, 25 Aug 2021 21:34:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d726dd48-a452-e75b-b7f8-6fe4ec6eab26@mind.be>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/ushare: fix build without msgfmt
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 25/08/2021 21:33, Arnout Vandecappelle wrote:
> 
> 
> On 22/08/2021 10:57, Fabrice Fontaine wrote:
>> Fix the following build failure without /usr/bin/msgfmt raised since the
>> addition of ushare in commit 74097fd659154499612f21fabeda4e3e7c8fdbfc:
>>
>> make[3]: Entering directory `/home/buildroot/autobuild/run/instance-3/output-1/build/ushare-2.1/po'
>> /usr/bin/msgfmt -c --statistics -o fr.gmo fr.po
>> make[3]: /usr/bin/msgfmt: Command not found
>>
>> To fix this build failure, set GMSGFMT to $(HOST_DIR)/bin/msgfmt and
>> don't build po files if NLS is disabled
>>
>> Fixes:
>>  - http://autobuild.buildroot.org/results/9f6b5b8f38386135bacd2d8f6e97c1fea77bbe69
>>
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> ---
>>  ...-t-build-po-files-if-NLS-is-disabled.patch | 47 +++++++++++++++++++
>>  package/ushare/ushare.mk                      |  5 +-
>>  2 files changed, 51 insertions(+), 1 deletion(-)
>>  create mode 100644 package/ushare/0001-Don-t-build-po-files-if-NLS-is-disabled.patch
>>
>> diff --git a/package/ushare/0001-Don-t-build-po-files-if-NLS-is-disabled.patch b/package/ushare/0001-Don-t-build-po-files-if-NLS-is-disabled.patch
>> new file mode 100644
>> index 0000000000..f0fa89998f
>> --- /dev/null
>> +++ b/package/ushare/0001-Don-t-build-po-files-if-NLS-is-disabled.patch
>> @@ -0,0 +1,47 @@
>> +From 977171781f5d49e61b46c0241fb67cbb7d666498 Mon Sep 17 00:00:00 2001
>> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> +Date: Sun, 22 Aug 2021 10:44:48 +0200
>> +Subject: [PATCH] Don't build po files if NLS is disabled
>> +
>> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> +[Upstream status: https://github.com/ddugovic/uShare/pull/12]
>> +---
>> + Makefile  | 7 +++++--
>> + configure | 1 +
>> + 2 files changed, 6 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/Makefile b/Makefile
>> +index ebd8f91..6686cfd 100644
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -14,10 +14,13 @@ EXTRADIST = AUTHORS \
>> + 	    THANKS \
>> + 	    TODO \
>> + 
>> +-SUBDIRS = po \
>> +-	  scripts \
>> ++SUBDIRS = scripts \
>> + 	  src \
>> + 
>> ++ifeq ($(NLS),yes)
>> ++SUBDIRS += po
>> ++endif
>> ++
>> + all:
>> + 	for subdir in $(SUBDIRS); do \
>> + 	  $(MAKE) -C $$subdir $@; \
>> +diff --git a/configure b/configure
>> +index 4a3efe0..162a776 100755
>> +--- a/configure
>> ++++ b/configure
>> +@@ -723,6 +723,7 @@ append_config "LDFLAGS=$LDFLAGS"
>> + append_config "INSTALL=$INSTALL"
>> + 
>> + append_config "DEBUG=$debug"
>> ++append_config "NLS=$nls"
>> + 
>> + 
>> + echolog "Creating $CONFIG_H ..."
>> +-- 
>> +2.32.0
>> +
>> diff --git a/package/ushare/ushare.mk b/package/ushare/ushare.mk
>> index a4c9711600..7c7359c385 100644
>> --- a/package/ushare/ushare.mk
>> +++ b/package/ushare/ushare.mk
>> @@ -18,8 +18,11 @@ USHARE_CONF_OPTS = \
>>  	--sysconfdir=/etc \
>>  	--disable-strip
>>  
>> +USHARE_MAKE_OPTS = LDFLAGS="$(TARGET_LDFLAGS) $(USHARE_LDFLAGS)"
>> +
>>  ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
>>  USHARE_CONF_OPTS += --disable-nls
>> +USHARE_MAKE_OPTS += GMSGFMT="$(HOST_DIR)/bin/msgfmt"
> 
>  This looks fishy... If NLS is disabled, there's no dependency that makes sure
> that gettext is built before ushare (or at all). Conversely, if gettext is
> enabled, shouldn't we specify GMSGFMT?

 Oh and also, we prefer explicit --enable-nls.

 Regards,
 Arnout

> 
>  Regards,
>  Arnout
> 
>>  endif
>>  
>>  define USHARE_CONFIGURE_CMDS
>> @@ -31,7 +34,7 @@ define USHARE_CONFIGURE_CMDS
>>  endef
>>  
>>  define USHARE_BUILD_CMDS
>> -	$(TARGET_MAKE_ENV) $(MAKE) LDFLAGS="$(TARGET_LDFLAGS) $(USHARE_LDFLAGS)" -C $(@D)
>> +	$(TARGET_MAKE_ENV) $(MAKE) $(USHARE_MAKE_OPTS) -C $(@D)
>>  endef
>>  
>>  define USHARE_INSTALL_TARGET_CMDS
>>
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
