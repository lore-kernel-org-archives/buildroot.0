Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8294C77B75
	for <buildroot@archiver.kernel.org>; Wed,  3 May 2023 02:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EB6341BB1;
	Wed,  3 May 2023 02:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EB6341BB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I5lVCdv9bxJc; Wed,  3 May 2023 02:01:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12BA641BAD;
	Wed,  3 May 2023 02:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12BA641BAD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B6C361BF414
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 02:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FD3360B26
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 02:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FD3360B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WtxV7ASKXKyM for <buildroot@lists.busybox.net>;
 Wed,  3 May 2023 02:01:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86A4960AC4
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 86A4960AC4
 for <buildroot@buildroot.org>; Wed,  3 May 2023 02:01:48 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-94ed7e49541so756981366b.1
 for <buildroot@buildroot.org>; Tue, 02 May 2023 19:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683079306; x=1685671306;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MOIVZATs8JklUF5Ltw0GzNI0wIta/HhgqDvwNBPcoPc=;
 b=M0CfLZjglUaX71aP23T0YJAUOvL02tuNAqhMeFGugrGaFqyA/0GHzk29Z5nO2KmJB/
 SNxCJ+PDcw81uNiriDR0Vt4obxioDIjR73BI4v+JwgjzGZuswicMBF97IWVMeN1XWj3F
 LcCEajYWIiU9+mFsyHvNrVQbRiw29f+P41RgxEqCKkKWml5AdX3Ld9UU2Z+RGCrTidya
 5ukh4uQ30yQGiJU91XERto/6YbZwvfimz4YZNsA4pATSFBc9Bte70nw/ky9gCN2XpAXN
 TPfN2zSPy91U8G7P2R2hVk8XFnsgcKkvrSj4zqqN8T8cGkFWRDNbSnCY3aN6JJkXRWdx
 /YeA==
X-Gm-Message-State: AC+VfDzMiWoONrhnzZ8d6TmfMwOaz3abylbH4WdPNN8Fl9AR8qx2+UeP
 uX42O1nKMlDi27vu0iLleuYDf+oQhPysRdWdTtm87Q==
X-Google-Smtp-Source: ACHHUZ4lb/iWpmf0jDT3RmhFmAKbfkcNGhhU+sf9HlCFXvigtfJc7+GJ4EyUYr/KJiNBregfON6MpQ==
X-Received: by 2002:a17:907:6e06:b0:953:8322:a99f with SMTP id
 sd6-20020a1709076e0600b009538322a99fmr1731496ejc.0.1683079306212; 
 Tue, 02 May 2023 19:01:46 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com.
 [209.85.218.49]) by smtp.gmail.com with ESMTPSA id
 rv13-20020a1709068d0d00b0095952f1b1b7sm12918236ejc.201.2023.05.02.19.01.44
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 19:01:45 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-94f4b911570so764901066b.0
 for <buildroot@buildroot.org>; Tue, 02 May 2023 19:01:44 -0700 (PDT)
X-Received: by 2002:a17:907:60d3:b0:956:f4f8:23b6 with SMTP id
 hv19-20020a17090760d300b00956f4f823b6mr2080209ejc.43.1683079304341; Tue, 02
 May 2023 19:01:44 -0700 (PDT)
MIME-Version: 1.0
From: Christian Stewart <christian@aperture.us>
Date: Tue, 2 May 2023 19:01:33 -0700
X-Gmail-Original-Message-ID: <CA+h8R2qSe6OepJMJr+KOUOAOqCRD9EX690Y+Yq4kx-M6x4uQBw@mail.gmail.com>
Message-ID: <CA+h8R2qSe6OepJMJr+KOUOAOqCRD9EX690Y+Yq4kx-M6x4uQBw@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1683079306; x=1685671306;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=MOIVZATs8JklUF5Ltw0GzNI0wIta/HhgqDvwNBPcoPc=;
 b=QZ4olke7TVXPfbwMUMVm4ki1+tBhr/b6GCWKZIpRnfXUbN1wlV9QQwos9WDZTq10iG
 Mlh45UtUxUhlvxtv7E+JKLSAk5eJWDpDulCta9gNKxepZod79d8g5BT9pu911tQYGQeS
 zNjPkl56mJ6YMS+lQEIpeJcaPoHP8WjytY0XKApTvrIQOMp/lOivz1joFe5qo4HNQPUU
 Qoi2rMqIQo60JABW7EX51e4+pCf+IXVNTBJABTFgulNnFvF85klLV/PwwLN6/ZZZb+he
 fsIzNbCBybwDsH1ag+IMQMvx/gH5lIMJDIsd3iGGJaeZBpG/X8jsz6AfD6eurKxeq8Pw
 Y3iw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=QZ4olke7
Subject: [Buildroot] coreutils-9.3: build failure
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

The update to coreutils 9.3 seems to have broken the build:

configure: error: cannot run test program while cross compiling
See 'config.log' for more details
make[1]: *** [package/pkg-generic.mk:283:
/build/coreutils-9.3/.stamp_configured] Error 1


Minimal reproduction:

BR2_x86_64=y
BR2_KERNEL_HEADERS_6_3=y
BR2_BINUTILS_VERSION_2_39_X=y
BR2_GCC_VERSION_12_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_OPTIMIZE_2=y
B2_INIT_SYSTEMD=y
BR2_SYSTEM_BIN_SH_BASH=y
BR2_GENERATE_LOCALE="C en_US"
BR2_PACKAGE_COREUTILS=y

Thanks for any help debugging this.

best regards,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
