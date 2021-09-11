Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C8A6C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 19:47:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDF3760FE6
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 19:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EDF3760FE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DC56406F5;
	Sat, 11 Sep 2021 19:47:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qON0NQEmFAJ5; Sat, 11 Sep 2021 19:47:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3CE340449;
	Sat, 11 Sep 2021 19:47:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE9F81BF285
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 19:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA8CF60624
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 19:47:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JbO5qJkaPIUy for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 19:47:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B52E3605E3
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 19:47:31 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id ho42so11536402ejc.9
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 12:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NdsAngFmTzkbBYyPqqh69/7zszxhMutjTlTKvlu+17U=;
 b=TNwelPOrQwnWz/nTbcsKF07npY8ANWjc2CrOhVsJnQWuqN42V1Yc5v9CgpD0nYgJ5e
 Kv5lAk5JHKmJCTcvilmLwn5bHAGAzW/G80gVlplXqnoIQAro5kPZPzHO7WIbwoJ6BozO
 hi867DChKoCUhWKsrCe4I37Fn56FQGcF/k2GWX8100QanS1cQBb2kL7LCRntTew+JRqj
 kdVfyei0CZNfjBIiahMbmYRtl7zDko6wa4njaYmSF30d7zwZ5+6+Va+EWTcLtzFL9QZU
 SisNAEXrCMOAy0FKhfu+fLdJhCU6pY1LiZCABgxbdOcRfri+mlmgsOvo3j3m6s6G9GgL
 okNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=NdsAngFmTzkbBYyPqqh69/7zszxhMutjTlTKvlu+17U=;
 b=1ElUKXXYEY+k2cnKBW2mD9QYeTLyD6Apnt1SWuXWQAfHMNFz4wTbhsrjG3j8T8z87O
 vS+K2PM0JfX9AV38/WVz6En07qwJp/4pd1C2p6BVEogeMsvnmRQooxGuBUQCyCygaSR1
 gRRrw5KOis5g2lsuJLqsJvspZCPGtvZ4yqeETabXNkP9MIJlrP1SgePH3UIXyCBeEdl1
 80TG0y3wbHzDHtvo7AogCEr418BNTPXKBmsCQ0VhKxX657oeESfg6sZOMNeXBLfOXxN5
 2E600oMagjRkdnAw2Fu0SU+e5lnicv6Q2Nwg9AUFfml3qZUoXgCtgTwdLuKmMOGVP012
 BSBQ==
X-Gm-Message-State: AOAM533A2eFPrRPaJvol+7HM/BPiYrutasQIXrWyBio3Sgv1LN+jM/EB
 QjYHhZ+/HhJKL7JdYzSYUiGXlQ==
X-Google-Smtp-Source: ABdhPJwx5S8V0wseBg+6ie4zfkjS6ubcw0t1KhCX67phAzTofpp0MS74dfHOdaXEFSWVaOqg0HIKlA==
X-Received: by 2002:a17:907:1108:: with SMTP id
 qu8mr4259491ejb.58.1631389649870; 
 Sat, 11 Sep 2021 12:47:29 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g9sm1136996ejo.60.2021.09.11.12.47.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 12:47:29 -0700 (PDT)
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20210903162027.1935040-1-aduskett@gmail.com>
 <20210903162027.1935040-8-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <da33c8dc-9d43-71ec-cdb2-107a3dd5f750@mind.be>
Date: Sat, 11 Sep 2021 21:47:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210903162027.1935040-8-aduskett@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH/master 7/7] package/gobject-introspection:
 Add QEMU_USERMODE_ARGS support
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>, Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 03/09/2021 18:20, Adam Duskett wrote:
> Now that the qemu package has the BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS string,
> the gobject-introspection g-ir-scanner-qemuwrapper script can pass that string
> to qemu.
> 
> Add the QEMU_USERMODE_ARGS to g-ir-scanner-qemuwrapper.in and unconditionally
> sed @QEMU_USERMODE_ARGS@ with BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS.
> 
> Fixes:
> http://autobuild.buildroot.org/results/2e9dbc0d36600c09fa9e59ab1b1903c9f40661e8
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/gobject-introspection/g-ir-scanner-qemuwrapper.in | 2 ++
>  package/gobject-introspection/gobject-introspection.mk    | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/package/gobject-introspection/g-ir-scanner-qemuwrapper.in b/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
> index 5ece75d0a4..e434502e2b 100644
> --- a/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
> +++ b/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
> @@ -5,8 +5,10 @@
>  # Use a modules directory which does not exist so we don't load random things
>  # which may then get deleted (or their dependencies) and potentially segfault
>  GOI_LIBRARY_PATH="${GIR_EXTRA_LIBS_PATH:+${GIR_EXTRA_LIBS_PATH}:}.libs:$(dirname "$0")/../lib:$(dirname "$0")/../../lib"
> +QEMU_USERMODE_ARGS="@QEMU_USERMODE_ARGS@"
>  GIO_MODULE_DIR="$(dirname "$0")/../lib/gio/modules-dummy" \
>  @QEMU_USER@ -r @TOOLCHAIN_HEADERS_VERSION@ \
> +    ${QEMU_USERMODE_ARGS:+${QEMU_USERMODE_ARGS}} \

 I'm surprised this doesn't trigger SC2086... But actually, there's no need for
the additional variable, right? If you put @QEMU_USERMODE_ARGS@ here directly,
it should do the right thing:

- if empty, it just expands to

qemu-user-x86_64 -r 5.10.1 \
     \
    -L ...

- if set to "-cpu Nehalem,check=false" it expands to

qemu-user-x86_64 -r 5.10.1 \
    -cpu Nehalem,check=false \
    -L ...


 So I changed that and I'm doing a test build before pushing to be sure it works
as expected.

 Regards,
 Arnout

>      -L "$(dirname "$0")/../../" \
>      -E LD_LIBRARY_PATH="${GOI_LIBRARY_PATH}" \
>      "$@"
> diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
> index 81938b14df..23d6a8231e 100644
> --- a/package/gobject-introspection/gobject-introspection.mk
> +++ b/package/gobject-introspection/gobject-introspection.mk
> @@ -84,6 +84,8 @@ define GOBJECT_INTROSPECTION_INSTALL_PRE_WRAPPERS
>  		$(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper
>  	$(SED) "s%@QEMU_USER@%$(QEMU_USER)%g" \
>  		$(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper
> +	$(SED) "s%@QEMU_USERMODE_ARGS@%$(call qstrip,$(BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS))%g" \
> +		$(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper
>  	$(SED) "s%@TOOLCHAIN_HEADERS_VERSION@%$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)%g" \
>  		$(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper
>  
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
