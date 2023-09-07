Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D668CA100E
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 10:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BFA260C24;
	Thu,  7 Sep 2023 10:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BFA260C24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rvks-7-ZOmTS; Thu,  7 Sep 2023 10:51:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0072260E7C;
	Thu,  7 Sep 2023 10:51:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0072260E7C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C1DC1BF41A
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 10:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC43541BB9
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 10:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC43541BB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kKFdxHMGCioU for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 10:51:20 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8595A41BBD
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 10:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8595A41BBD
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-500913779f5so1353489e87.2
 for <buildroot@buildroot.org>; Thu, 07 Sep 2023 03:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694083878; x=1694688678;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/P4HNv7Y9ub7WZ+8L9osP9LPAgAhbicuX1TIN2Pc2uA=;
 b=YEg4KKq85/fXmxhL8JZbOvlxSfsQb8m+nBE8s3/RSoML55upkIDz9r65k+x+pPfZI2
 wF05bFRO925mK+bXnBjJENWgZ8a1KWK4GcI/NGtlbLOrfIuNVt5bXBg0wAwISgojqdJ2
 yoIHhhnkSKjXCwAYFyWS+tt68UcrBAf2+BjNL/sdjSdJmv0hhru6zcNKiFtM20YjtpRm
 T+/aZ14mNe639ZByUrHRsQUFC6giSgwG8JAb3D8auumHtLEfhM13lAz0KNXgXM/IpuSl
 MCzAfpWp7FUhitsWtlMgfbTXDekvyFXOviu7zzwXnhkJuonbFCxsCXp8xq9XbJllfCfM
 5BgA==
X-Gm-Message-State: AOJu0YzrQvWvoorURCIeTXaoEijLwYmQmEOMg3hFDEDdUYK9wwN5ZGzq
 GNFTl4rRI8ke7mEG5dnqp95ZoFjpBRTbZpnxHh7Yig==
X-Google-Smtp-Source: AGHT+IFrejkZwPjGC4Va501Wcfm1+TDG9j+tLeeQgSiWv0cZRQiadRZKiTsxfqrdUO6K9uS/z+pU5Q==
X-Received: by 2002:ac2:4d92:0:b0:500:b14a:cc63 with SMTP id
 g18-20020ac24d92000000b00500b14acc63mr4034190lfe.12.1694083878184; 
 Thu, 07 Sep 2023 03:51:18 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172]) by smtp.gmail.com with ESMTPSA id
 v9-20020ac25609000000b004fe07f06337sm3103810lfd.53.2023.09.07.03.51.16
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 03:51:16 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2bd6611873aso13771651fa.1
 for <buildroot@buildroot.org>; Thu, 07 Sep 2023 03:51:16 -0700 (PDT)
X-Received: by 2002:a2e:7310:0:b0:2bc:fdec:a3f6 with SMTP id
 o16-20020a2e7310000000b002bcfdeca3f6mr4124617ljc.48.1694083876384; Thu, 07
 Sep 2023 03:51:16 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 7 Sep 2023 03:51:04 -0700
X-Gmail-Original-Message-ID: <CA+h8R2oiG-nR_8rGE607Sq2RewGBbSfnJvfp46y5Dw=0q1OryQ@mail.gmail.com>
Message-ID: <CA+h8R2oiG-nR_8rGE607Sq2RewGBbSfnJvfp46y5Dw=0q1OryQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Waldemar Brodkorb <wbx@openadk.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1694083878; x=1694688678; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/P4HNv7Y9ub7WZ+8L9osP9LPAgAhbicuX1TIN2Pc2uA=;
 b=qUWsVh9jEtTIdCEwU+GSJ+tpTTON5Q8+ySy0M1gLTts6lkqnJlzlwwqIGbTg6okqDi
 xgTg7AmHY2pxzdjk2BNjZqpgw3gkFkepHanw2VJaYQdbQrabhcbKTrI1YpHohmQr28YF
 L3+e31zN5p/oC0jEHYDuq1IXTKFg8B4Rnr8rpy6+0OmgjolvupvcvZu5Xa5+iFHrsOVa
 EkJeslN0cApe0W75HYbi3x20eMiiaU8yFS5GrIFmhRUdmaK2ILwg0n2pqxViLKZAR6pV
 yO9SXVD9v7LT+QPRscAIROkWv6WNHfLSAkGKNL2zeq73qbenhB8xjvCyptj1WGnL7msD
 o/hA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=qUWsVh9j
Subject: [Buildroot] package/conmon: broken by recent change removing dlfcn.h
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Waldemar, Thomas,

A recent commit added a patch removing dlfcn.h:

https://lore.kernel.org/buildroot/ZNdpt%2FgB95HIWDAq@waldemar-brodkorb.de/

This header is needed for RTLD_NOW and causes "RTLD_NOW is not
defined" type build errors when building for a Raspberry Pi 4.

Please revert that commit / remove that patch or otherwise fix the
undefined symbol.

Thank you,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
