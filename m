Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73811C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 18:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2896E40B42;
	Tue, 12 Apr 2022 18:32:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JpeKriSA4pev; Tue, 12 Apr 2022 18:32:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D24D40B3B;
	Tue, 12 Apr 2022 18:32:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 199681BF95D
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0326060595
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:32:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ktykvASEP-6 for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 18:32:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D43B0610C3
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 18:32:42 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id bh17so39025161ejb.8
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 11:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=gZACcnGF6kHPQw2pnk/TTS443yeZULivmV7BERC21l4=;
 b=gO26/DYHKTaRWojBjM0rLAeDJAbbvJcu4wzPLocNfeQrBme3ejMFVDCWiU51XQxpJM
 snZOVfgnJUJzDuPZ6H8FSlBeWalel2WPCY2fB0oHxIljG3j1Is5kgRHs7S13+wEss30v
 pHuChsd7HAXgcu9zFZQGIOSg8y0foZDPH+xTI1qD+JKKKN/8nCigMr4JFwQ5MIKP1F4Y
 cYadVqKvjjopRYvoe0ZZA4srO2dxD/SNEgTt6tDNu4Ks2Izszeut1PZfGmWx/Lf0M8uA
 JP1QPqg7XgwLyd/Pwc59aDCo3PujVwwDdNaDmSfDh0v7Gif6Me+jD2oS+KDVXuamDgqc
 3LGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=gZACcnGF6kHPQw2pnk/TTS443yeZULivmV7BERC21l4=;
 b=Wwbfhi25hhCqotSxGeb7cA3Q8vI94OK4Qsq3jQI5QAljfinZZPd0D18vy8S3OJ+6nc
 uXmfJJqUWFR13grpDSJj7LVVFITwo50Mkk7p38kSjmAzsE+ktEVkg7JRieP/tEvtHgcJ
 BRenXtnVzb7I18wcpBo6jS18NCNWjn5tdXI0ttthYG25aCTxtSJbh/SpRg6RG7chtypd
 PnsD+ygpYHEBlICU3Xffz1xSmzmFMN+JJx3dNKpByGw/YOCSy6IcEkPNFlVBf7joIcBh
 ayrEDHyzIZb0oHIAgyjZKlZiN4/aeKFxihF9ZS9gzfhoA4e/ucD/UUOwiLKr3P10k+c4
 frbw==
X-Gm-Message-State: AOAM532+9SSrkq40dSYNNh8zpLsGYo0vSXlhrwgUzu+Ae8bHuP6cvRY9
 M1d/txZeLfVjGj9DXNCSDf+ugA==
X-Google-Smtp-Source: ABdhPJwRxOuXN+ERJb24jGZOs0+dthkta6fiFt8qVD4YTPObsfIUNXqQDcSqeJ4EEw6Pwgectvm8OA==
X-Received: by 2002:a17:906:5d14:b0:6e8:90d6:efe4 with SMTP id
 g20-20020a1709065d1400b006e890d6efe4mr10771010ejt.559.1649788361058; 
 Tue, 12 Apr 2022 11:32:41 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 d26-20020a1709064c5a00b006e89debe3f4sm2066080ejw.9.2022.04.12.11.32.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 11:32:40 -0700 (PDT)
Message-ID: <e08f9b1f-f1cd-b096-98a2-b81c33bc1c6e@mind.be>
Date: Tue, 12 Apr 2022 20:32:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220405205521.2117028-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220405205521.2117028-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/lsof: drop first and second
 patches
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



On 05/04/2022 22:55, Fabrice Fontaine wrote:
> Set LSOF_AR and LSOF_CC to be able to drop first patch which is not
> upstreamable: https://github.com/lsof-org/lsof/issues/197
> 
> $(TARGET_CONFIGURE_OPTS) must also be removed to avoid overriding AR
> and so we can drop LSOF_CFLAGS_OVERRIDE=1 and third patch
> 
> DEBUG="$(TARGET_CFLAGS)" can also be dropped from LSOF_BUILD_CMDS as it
> is already set in LSOF_CONFIGURE_CMDS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/lsof/0001-makefile.patch                   | 14 --------------
>   ...cs.patch => 0001-remove-susvlegacy-funcs.patch} |  0
>   package/lsof/0003-override-cflags.patch            | 13 -------------
>   package/lsof/lsof.mk                               |  5 +++--
>   4 files changed, 3 insertions(+), 29 deletions(-)
>   delete mode 100644 package/lsof/0001-makefile.patch
>   rename package/lsof/{0002-remove-susvlegacy-funcs.patch => 0001-remove-susvlegacy-funcs.patch} (100%)
>   delete mode 100644 package/lsof/0003-override-cflags.patch
> 
> diff --git a/package/lsof/0001-makefile.patch b/package/lsof/0001-makefile.patch
> deleted file mode 100644
> index 65b1b2e2a7..0000000000
> --- a/package/lsof/0001-makefile.patch
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -diff -ru lsof_4.81.orig/lsof_4.81_src/lib/Makefile.skel lsof_4.81/lsof_4.81_src/lib/Makefile.skel
> ---- a/lib/Makefile.skel	2001-02-13 03:12:22.000000000 +0100
> -+++ b/lib/Makefile.skel	2006-11-29 13:51:44.000000000 +0100
> -@@ -21,8 +21,8 @@
> - all:	${LIB}
> -
> - ${LIB}:	${OBJ}
> --	${AR}
> --	${RANLIB}
> -+	${AR} cr ${LIB} ${OBJ}
> -+	${RANLIB} ${LIB}
> -
> - clean:	FRC
> - 	rm -f ${LIB} ${OBJ} errs Makefile.bak a.out core
> diff --git a/package/lsof/0002-remove-susvlegacy-funcs.patch b/package/lsof/0001-remove-susvlegacy-funcs.patch
> similarity index 100%
> rename from package/lsof/0002-remove-susvlegacy-funcs.patch
> rename to package/lsof/0001-remove-susvlegacy-funcs.patch
> diff --git a/package/lsof/0003-override-cflags.patch b/package/lsof/0003-override-cflags.patch
> deleted file mode 100644
> index 135e599ac9..0000000000
> --- a/package/lsof/0003-override-cflags.patch
> +++ /dev/null
> @@ -1,13 +0,0 @@
> ---- lsof_4.84/Configure	2008-10-21 18:21:45.000000000 +0200
> -+++ lsof_4.84/Configure	2010-11-03 14:00:00.000000000 +0100
> -@@ -5206,6 +5206,10 @@
> -   cp $LSOF_MKFC ${LSOF_LIB}/$LSOF_LIBMKF
> - fi	# }
> - cat ./dialects/$LSOF_DIALECT_DIR/$LSOF_REST >> $LSOF_MKFC
> -+if test "X$LSOF_CFLAGS_OVERRIDE" != "X"	# {
> -+then
> -+  sed -i -e 's/^CFLAGS=/override CFLAGS=/' $LSOF_MKFC
> -+fi	# }
> - if test "X$LSOF_LIB_NO" = "X"	# {
> - then
> -
> diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
> index ff09d64345..e4e339349a 100644
> --- a/package/lsof/lsof.mk
> +++ b/package/lsof/lsof.mk
> @@ -33,7 +33,8 @@ endif
>   define LSOF_CONFIGURE_CMDS
>   	(cd $(@D) ; \
>   		echo n | $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS)" \
> -		LSOF_INCLUDE="$(STAGING_DIR)/usr/include" LSOF_CFLAGS_OVERRIDE=1 \
> +		LSOF_AR="$(TARGET_AR) cr" LSOF_CC=$(TARGET_CC) \
> +		LSOF_INCLUDE="$(STAGING_DIR)/usr/include" \
>   		LINUX_CLIB=-DGLIBCV=2 LSOF_CFGL="$(TARGET_LDFLAGS)" \
>   		./Configure linux)
>   	$(LSOF_CONFIGURE_WCHAR_FIXUPS)
> @@ -41,7 +42,7 @@ define LSOF_CONFIGURE_CMDS
>   endef
>   
>   define LSOF_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS)" -C $(@D)
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
>   endef
>   
>   define LSOF_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
