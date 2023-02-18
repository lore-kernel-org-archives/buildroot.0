Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A1CC61DA4
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 13:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E610B8212A;
	Sat, 18 Feb 2023 13:45:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E610B8212A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XRz1Yp5wdwSF; Sat, 18 Feb 2023 13:45:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A7D782114;
	Sat, 18 Feb 2023 13:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A7D782114
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F05861BF59F
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 13:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9BC5417B8
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 13:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9BC5417B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t6LwRhhwQVK0 for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 13:45:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCD5040913
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCD5040913
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 13:45:40 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id a20so974154pls.2
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 05:45:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l73CWiRNkQhniWB78lkIRwkcHTzSMq8GsBnGU63Y0i8=;
 b=Jtr5q0bN1EA6tCoSSxuLqM12bzrTpxWJEISmoNZ9z1WnEYRZDxPeQnxabWJx57JYz7
 Hd1v0Y9boKMmFCQ3RHllRaVZppllINOWySoeN8YmELnklgyV6cuP7PV2PYjMYOdaUuFh
 cQlk/OJO3iOxw7+1kJuaqRVD3Ttxv+zYYQVavi4ieNqeqk0xypSzbixMSkOdLt014hqs
 7wP7rHzJLbS9sY+2+fX4hsIiAUfAbQ2iUZqDYKAmx/890r0VuPgn4/Y+M3KpRLbwhu6Z
 08pG9TvYSR5kysK+/jfVa2kW4/s+KgqeOMg1DlF8cEA1SuPF/P97KMU2k2z7CF2wgl+w
 ZQxg==
X-Gm-Message-State: AO0yUKWpYlXn8oaJousxg3v9Xed7t1KtpmJSeczR5d/vPsLB79mlyLmS
 QZmo/gz9ihK9EfqjzRnGxNJhUPzmVU4=
X-Google-Smtp-Source: AK7set+XZUl67lAWAJmNlLTFhYNyMEQGchSoGmoZw2BAPv2X6QrzAehWb4w2tTd9ypyN/BRF/nIoUw==
X-Received: by 2002:a17:903:890:b0:19b:370:c77e with SMTP id
 kt16-20020a170903089000b0019b0370c77emr251824plb.7.1676727940090; 
 Sat, 18 Feb 2023 05:45:40 -0800 (PST)
Received: from [192.168.43.80] (subs03-180-214-233-93.three.co.id.
 [180.214.233.93]) by smtp.gmail.com with ESMTPSA id
 z7-20020a1709027e8700b0019aafc42328sm4715439pla.153.2023.02.18.05.45.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Feb 2023 05:45:39 -0800 (PST)
Message-ID: <b5fef166-72c3-25ac-2427-e4255b68f2db@gmail.com>
Date: Sat, 18 Feb 2023 20:45:37 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230218101426.630874-1-bagasdotme@gmail.com>
 <20230218113939.526f0a76@windsurf> <96015d0268df72d3cdd58e7db09c1333@free.fr>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <96015d0268df72d3cdd58e7db09c1333@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l73CWiRNkQhniWB78lkIRwkcHTzSMq8GsBnGU63Y0i8=;
 b=J2lzBAHU+De79nf2ApfocMWt3MY6cK6ae5Gkst6s2gQWPDEKZfwTkeGr0Ug6YMzoFs
 0ktA5OK1b4pB6d1nb9Y3RICi2KcdSJ7uMyjWRKmmW/NQX3/DI9RWK6ABcuRD1nVEfzgD
 YQezqtjRP1H8CSdphKr/BuQyUnjZN9WRcZGWmB55MgQR0iY/N1t9hLbBi0bUMBZun4bV
 Fc7jCrqJlDr4/FghuCg/oDpMbgrKbHlumx1EDnW2Hv49eCntxoMstQHKbEoueZrYdeeJ
 nDuhzTmlfWiDsxEjzKA/7njC+6pZYj5E+MiwIkweSPwGX/HS1+AXqJEwkXhc9c7AVG7M
 fXeA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=J2lzBAHU
Subject: [Buildroot] Debugging gnupg2 unsafe search path error (was Re:
 [PATCH] Revert "package/gnupg2: bump to version 2.4.0")
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
Cc: Buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2/18/23 18:13, Julien Olivain wrote:
> In my first proposal of gnupg2 version 2.4.0 bump [1], I initially proposed
> to add Buildroot staging bin dir in PATH, to make sure we won't have such
> host/br-staging confusion:
> 
> GNUPG2_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(BR_PATH)
> 
> Bagas, could you try on your side if this solve the issue?
> 
> [1] https://patchwork.ozlabs.org/project/buildroot/patch/20230103193649.7488-5-ju.o@free.fr/
> 

Hi Julien,

I applied your suggestion on top of master as:

---- >8 ----
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 5935ce6939..55917912a8 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -15,6 +15,9 @@ GNUPG2_SELINUX_MODULES = gpg
 GNUPG2_DEPENDENCIES = zlib libgpg-error libgcrypt libassuan libksba libnpth \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) host-pkgconf
 
+# Let's see if staging GNUPG2_CONF_ENV here works.
+GNUPG2_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(BR_PATH)
+
 GNUPG2_CONF_OPTS = \
 	--disable-rpath \
 	--with-libgpg-error-prefix=$(STAGING_DIR)/usr \


Unfortunately, the build error still occurs with your suggestion.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
