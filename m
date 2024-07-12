Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69699C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 22:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BA4784064;
	Fri, 12 Jul 2024 22:02:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xx7FjhPN2qv4; Fri, 12 Jul 2024 22:02:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2619A844FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2619A844FF;
	Fri, 12 Jul 2024 22:02:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1AA081BF3C4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7221845B7
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:02:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HmQDmafme3Ki for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 22:02:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EDAEB844FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDAEB844FF
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDAEB844FF
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 22:02:16 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42793fc0a6dso16432625e9.0
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720821735; x=1721426535;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MtrnVa11Il94VjVpE/xxBA2iOWmvcLeA2iFRWccUmtI=;
 b=N0yNm5xv+RLixE9nGMcxV0/j8MrGmo/OVoETJfssN2B3nt+1ztOO0DdaKIKIC1jJ51
 Yh/regvBNAlgeev7xWDk0QkrofRmz6Mt7c1sZiF1Dd8laHOiyigE52kVkGJlacvuTphF
 HSvhQ6DIn76LYoqAMeWuvhAoxU1Q/J/SKEX07I7WpzkP1YpM586r1PMyAxerSeDVLM+a
 tZF5Ez0VnQstwXBke7/nCXFgiye308ztXulhZFIjxma36ElbNI2GnqYb+/Zildlw7sxL
 loWIC8+jjhXjiItgVenegNJEIzi/0/NztIPTOjksQIAmyD3xAbLH+Tu4UUySBiovApCM
 zOpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOgJ4D5R+nzqrKaTdM1aHw4sGEySP1j5qZaelUTRugcq6dC8xOlDideD8ZNSLD72/RqM2rW3xhIi/3myDG5dC+AhvaAGaAtg==
X-Gm-Message-State: AOJu0Yxr3OVroNq4ixdsT4g4KMZhKKCZVNLauVdczV3xZ5GsNny00HNh
 oQBXVbROKcA1D1uvPQX0xNlQn4ANw1DSFJLAPPpqHbt/QdlggMju/pERI4yoLPE=
X-Google-Smtp-Source: AGHT+IGspKZ5+2WitcYNVgQvUXX135KDDj9uxoCwrHU9R4oAIs8nZPiZqYk9TLh3isvFJQN4vNwnxw==
X-Received: by 2002:a5d:47a9:0:b0:366:e7e2:13c8 with SMTP id
 ffacd0b85a97d-367cea46a0bmr11061396f8f.11.1720821735096; 
 Fri, 12 Jul 2024 15:02:15 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfab136sm11075724f8f.98.2024.07.12.15.02.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 15:02:14 -0700 (PDT)
Message-ID: <1d19a7c0-a03c-4717-b6ef-a02c9df20cb3@mind.be>
Date: Sat, 13 Jul 2024 00:02:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Reza Arbab <arbab@linux.ibm.com>, buildroot@buildroot.org,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
References: <20240207175135.1532037-1-arbab@linux.ibm.com>
 <20240207175135.1532037-5-arbab@linux.ibm.com>
In-Reply-To: <20240207175135.1532037-5-arbab@linux.ibm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720821735; x=1721426535; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MtrnVa11Il94VjVpE/xxBA2iOWmvcLeA2iFRWccUmtI=;
 b=elXD/xMaXCfjJNYTnQH+FRbfh/wUab4bEyRb48Erl0eqtQoz8rZLwr9EgN2u2/rUbs
 taXO0WcB/IGDPxwiSC6Z8sVEz+vKvb+wPHTCvGfG6HHDwhtBwpyehNttxNJP7pdwOD4Q
 N0SCfMB/tFFo/azAXzEwPKIMrT4NJ2wQqOCIE8vaKXkmIcks1hFJYxqsR4860Hkqf3OG
 YWl5WRzmdqkKrZ+zry+uC32GidR21Zi2WKrAnxL9PXva+AG/0ZQO17RhcWeEB4MOqVT2
 F23kdAw+2oM+zytAHIU0T6n1vdPJFxWApaeR1tT0fEF9nf2r3heijCoJ/NGb6k86oy48
 iRbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=elXD/xMa
Subject: Re: [Buildroot] [PATCH v5 4/5] package/petitboot: run script when
 exiting to shell
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Joel Stanley <joel@jms.id.au>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/02/2024 18:51, Reza Arbab wrote:
> When the user selects the shell escape option from the petitboot menu,
> reset the terminal so output is raw rather than being confined to the
> ncurses window set up for the petitboot menu, and print some helpful
> text before running the shell.
> 
> To do this, override the default HOST_PROG_SH (/bin/sh) with a small
> script. Doing so also enables someone to customize this behavior by
> overlaying a different script.
> 
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/petitboot/pb-shell     | 10 ++++++++++
>   package/petitboot/petitboot.mk |  3 +++
>   2 files changed, 13 insertions(+)
>   create mode 100644 package/petitboot/pb-shell
> 
> diff --git a/package/petitboot/pb-shell b/package/petitboot/pb-shell
> new file mode 100644
> index 000000000000..99887c3f3b87
> --- /dev/null
> +++ b/package/petitboot/pb-shell
> @@ -0,0 +1,10 @@
> +#!/bin/sh
> +
> +reset
> +
> +cat <<EOM
> +Exiting petitboot. Type 'exit' to return.
> +You may run 'pb-sos' to gather diagnostic data.
> +EOM
> +
> +exec /bin/sh
> diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
> index 291083269ae9..e2f762842534 100644
> --- a/package/petitboot/petitboot.mk
> +++ b/package/petitboot/petitboot.mk
> @@ -29,6 +29,7 @@ PETITBOOT_CONF_OPTS = \
>   	--without-twin-x11 \
>   	$(if $(BR2_PACKAGE_BUSYBOX),--enable-busybox,--disable-busybox) \
>   	HOST_PROG_KEXEC=/usr/sbin/kexec \
> +	HOST_PROG_SH=/usr/libexec/petitboot/pb-shell \
>   	HOST_PROG_SHUTDOWN=/usr/sbin/kexec-restart
>   
>   # HPA and Busybox tftp are supported. HPA tftp is part of Buildroot's tftpd
> @@ -81,6 +82,8 @@ define PETITBOOT_POST_INSTALL
>   		$(TARGET_DIR)/usr/sbin/kexec-restart
>   	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/pb-console \
>   		$(TARGET_DIR)/etc/init.d/pb-console
> +	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/pb-shell \
> +		$(TARGET_DIR)/usr/libexec/petitboot/pb-shell
>   
>   	mkdir -p $(TARGET_DIR)/etc/udev/rules.d
>   	for port in $(PETITBOOT_GETTY_PORT); do \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
