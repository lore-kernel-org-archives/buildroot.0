Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81DE2C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 20:56:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0422E61002
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 20:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0422E61002
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF5B240293;
	Thu, 26 Aug 2021 20:56:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AMVBM3JlgYZ8; Thu, 26 Aug 2021 20:56:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32131402EA;
	Thu, 26 Aug 2021 20:56:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2181C1BF580
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 20:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10E9082B34
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 20:56:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WLluQ0ySF_HH for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 20:56:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0BDA582B1E
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 20:56:03 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id a25so9098586ejv.6
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 13:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kC9tj3BATU7rCsJkTeg4xuG/wjgxdqCqBkXQeu1B6xI=;
 b=axkvx1tfkScZIpCoFNLBW714Z0tMS4qKqtAHW7E9Ne7fZo2Tgj0LjQ8cCZXjSk4qNo
 x0Ly+hVJ/3SZJwSCxgAz1pM/ErLOJZWZGdcmmNzUQTh0VFvcCjna1OlfxiTuaEBH4Y3x
 ThHuwROB4cJnzbu4zd+QSQ8Ok1iPblT8RzZ4geKphQUDQkeRZDbVFBnfBGaY1zRdbNMb
 g9A0ij3IQdj9miYzp7YRX/KILlLEKCTIUVwPZE5Jl4dJlIqma76AwSSO2FxSsFOIc8ho
 OO+JJfzS3AanO//wWeMef6J7VpU/mgz6YrqjzQKnVVDUXfKbCTJuA7QfIqfasaS1/Fpp
 fKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=kC9tj3BATU7rCsJkTeg4xuG/wjgxdqCqBkXQeu1B6xI=;
 b=EGx8urDwNrjQs5jzTqXo8KVPlZhM4canDk94T5DX6n6t2JTCL1SKt0VBqXiQq/dNWJ
 tXDbF5NsRAS34BKxw28aIuciALKQpyuDmAMyR3zQPryfRV4EPYpBnCTcD1waN75qwLDV
 MB676+Kk1IIchXmd4CVH1ChcqqvXTrz7jZS7Nxw3CLX+db8bKiHb4d/BZb0mNu/z2oWz
 nqR5D5ogTXTsXgg7IXjPIk/JYbyPufRESKVwXafw7wXRMPHpU/QgwByGmijDOaOhfMCv
 IPnHdonoHuWxSDbWBFpRJrh5uBkCcgwW1v+VhoRvydSlWohKXGFAnE5tMBmIVuaL9tPE
 zwmw==
X-Gm-Message-State: AOAM533YKcODYB0BG5paxjLqCaF2wTCMMtgYTcvBYgeuwWux0CWnFfB9
 VB1RoW/oEugT8QDTEcCU0f6WMwWOCv5z9Q==
X-Google-Smtp-Source: ABdhPJzcq/aN2XuXIRiP+fk0btPmSJ5SMN6xml1n8+7H55AMWc+iZHL/0QbGwv6goLX7buOUNxjatg==
X-Received: by 2002:a17:906:7217:: with SMTP id
 m23mr6316252ejk.466.1630011362094; 
 Thu, 26 Aug 2021 13:56:02 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id i6sm1905678ejd.57.2021.08.26.13.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 13:56:01 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210825220038.7757-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <e1c48929-d37c-a439-65e1-b3fd3cfa805e@mind.be>
Date: Thu, 26 Aug 2021 22:56:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825220038.7757-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/ushare: fix build without msgfmt
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



On 26/08/2021 00:00, Fabrice Fontaine wrote:
> Fix the following build failure without /usr/bin/msgfmt raised since the
> addition of ushare in commit 74097fd659154499612f21fabeda4e3e7c8fdbfc:
> 
> make[3]: Entering directory `/home/buildroot/autobuild/run/instance-3/output-1/build/ushare-2.1/po'
> /usr/bin/msgfmt -c --statistics -o fr.gmo fr.po
> make[3]: /usr/bin/msgfmt: Command not found
> 
> To fix this build failure, set GMSGFMT to $(HOST_DIR)/bin/msgfmt and
> don't build po files if NLS is disabled
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9f6b5b8f38386135bacd2d8f6e97c1fea77bbe69
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
> Changes v1 -> v2 (after review of Arnout Vandecappelle):
>  - Add --enable-nls and move GMSGFMT to this new block
> 
>  ...-t-build-po-files-if-NLS-is-disabled.patch | 47 +++++++++++++++++++
>  package/ushare/ushare.mk                      |  9 +++-
>  2 files changed, 54 insertions(+), 2 deletions(-)
>  create mode 100644 package/ushare/0001-Don-t-build-po-files-if-NLS-is-disabled.patch
> 
> diff --git a/package/ushare/0001-Don-t-build-po-files-if-NLS-is-disabled.patch b/package/ushare/0001-Don-t-build-po-files-if-NLS-is-disabled.patch
> new file mode 100644
> index 0000000000..f0fa89998f
> --- /dev/null
> +++ b/package/ushare/0001-Don-t-build-po-files-if-NLS-is-disabled.patch
> @@ -0,0 +1,47 @@
> +From 977171781f5d49e61b46c0241fb67cbb7d666498 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 22 Aug 2021 10:44:48 +0200
> +Subject: [PATCH] Don't build po files if NLS is disabled
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/ddugovic/uShare/pull/12]
> +---
> + Makefile  | 7 +++++--
> + configure | 1 +
> + 2 files changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index ebd8f91..6686cfd 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -14,10 +14,13 @@ EXTRADIST = AUTHORS \
> + 	    THANKS \
> + 	    TODO \
> + 
> +-SUBDIRS = po \
> +-	  scripts \
> ++SUBDIRS = scripts \
> + 	  src \
> + 
> ++ifeq ($(NLS),yes)
> ++SUBDIRS += po
> ++endif
> ++
> + all:
> + 	for subdir in $(SUBDIRS); do \
> + 	  $(MAKE) -C $$subdir $@; \
> +diff --git a/configure b/configure
> +index 4a3efe0..162a776 100755
> +--- a/configure
> ++++ b/configure
> +@@ -723,6 +723,7 @@ append_config "LDFLAGS=$LDFLAGS"
> + append_config "INSTALL=$INSTALL"
> + 
> + append_config "DEBUG=$debug"
> ++append_config "NLS=$nls"
> + 
> + 
> + echolog "Creating $CONFIG_H ..."
> +-- 
> +2.32.0
> +
> diff --git a/package/ushare/ushare.mk b/package/ushare/ushare.mk
> index a4c9711600..df9da223ec 100644
> --- a/package/ushare/ushare.mk
> +++ b/package/ushare/ushare.mk
> @@ -18,7 +18,12 @@ USHARE_CONF_OPTS = \
>  	--sysconfdir=/etc \
>  	--disable-strip
>  
> -ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
> +USHARE_MAKE_OPTS = LDFLAGS="$(TARGET_LDFLAGS) $(USHARE_LDFLAGS)"
> +
> +ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
> +USHARE_CONF_OPTS += --enable-nls
> +USHARE_MAKE_OPTS += GMSGFMT="$(HOST_DIR)/bin/msgfmt"
> +else
>  USHARE_CONF_OPTS += --disable-nls
>  endif
>  
> @@ -31,7 +36,7 @@ define USHARE_CONFIGURE_CMDS
>  endef
>  
>  define USHARE_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) LDFLAGS="$(TARGET_LDFLAGS) $(USHARE_LDFLAGS)" -C $(@D)
> +	$(TARGET_MAKE_ENV) $(MAKE) $(USHARE_MAKE_OPTS) -C $(@D)
>  endef
>  
>  define USHARE_INSTALL_TARGET_CMDS
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
