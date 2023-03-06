Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6943C678D4
	for <buildroot@archiver.kernel.org>; Mon,  6 Mar 2023 11:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38C8881437;
	Mon,  6 Mar 2023 11:03:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38C8881437
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QpS647m6phCG; Mon,  6 Mar 2023 11:03:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64B63813F9;
	Mon,  6 Mar 2023 11:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64B63813F9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 516AD1BF3ED
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 11:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B56840575
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 11:03:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B56840575
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vbpt_GJkJ9EV for <buildroot@lists.busybox.net>;
 Mon,  6 Mar 2023 11:03:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19604400C4
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19604400C4
 for <buildroot@buildroot.org>; Mon,  6 Mar 2023 11:03:00 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id cy23so36643728edb.12
 for <buildroot@buildroot.org>; Mon, 06 Mar 2023 03:03:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678100579;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l1Ii48fl6ws08tOqO2HB9YLvVeco79FSRHtOCmafkAM=;
 b=AWikNhROvFAyd+jg1HhKW9iM3s6D1gRPoxx7tZDBgmDpaeDQ55pMMTEsIQxiyIfkmD
 P2Y6+XGXE6le2YiPOE46rnhYB2Id/Vd4qJ+Jn95QSm11Atz7YeC77EVcNDG/9HWMohjh
 WmelR9ALqPCoZfm5gFQzjRnR3oY/W31NHuCPrM2VCwjTJpAoeFW28BTVVcrg7Ze61QJ3
 DA/MeCqQyY9+1DcS2QCPl1XtcoGYfS1Ji3h94RqpswUrqfMRmkp8TGiTHBAkC1VJKk0h
 A/ATNDtVcukHCSISlWMloIci+G+JDJ0SKTCmv87JaoeP3XSnJqKnwpahQmUMgY6FsBKl
 faxg==
X-Gm-Message-State: AO0yUKWL48+BUW46egrsTyiNv0RZMdtXaKBL0ClBJYfT4OljggF1jB+m
 M3a4QqH12A2OAEOPWPa072VdP7XCBsFqiS9orzQ=
X-Google-Smtp-Source: AK7set9dVibdNDput5ZoOo2SrMmODBzcSZoT/EjythwbsiHPYjkCHOH57ka3VM9Sc36pnJu+71ytlQ==
X-Received: by 2002:aa7:dd06:0:b0:4aa:a4f1:3edb with SMTP id
 i6-20020aa7dd06000000b004aaa4f13edbmr9123421edv.29.1678100578543; 
 Mon, 06 Mar 2023 03:02:58 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 a25-20020a509b59000000b004c0eac41829sm4899445edj.63.2023.03.06.03.02.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 03:02:57 -0800 (PST)
Message-ID: <33536034-5b9e-e1f9-86eb-b64bb4691940@mind.be>
Date: Mon, 6 Mar 2023 12:02:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
References: <Y/4etrPX5MZiUpdq@donbot>
 <20230228155528.2430203-1-thomas.devoogdt@barco.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230228155528.2430203-1-thomas.devoogdt@barco.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678100579;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l1Ii48fl6ws08tOqO2HB9YLvVeco79FSRHtOCmafkAM=;
 b=Nm+wmmwXqtUk499tWSdxmNQUdVjQDxpL9x7gStCaLUn+cWsM5BabB3Ho23HIx3bX2Y
 DdKi/g0ZvStIo1vtdJ1tMbTvjPNMs7YzV6mNN1j6jfmbsghTnsziSoJTxI+cZruARNuK
 fhVerNHTd1tB+WXWS2WdIuqwSo1E/ZG6iZOGTndOQnzEbzzu3IPW3dJyOhE2aL7SLpxu
 nOrTQaMYwueqfHK/nyn9FpnIad2aba6pgnxBgwDm2R8FX19WerAkFdCMOrpdMuhCb8hD
 XBSTf1KyemQp1SfpWBmsvh1VeNLdaZ4IlFX5grEx+dk8frcfzyysXkxeMKbJR5317N3m
 NU7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Nm+wmmwX
Subject: Re: [Buildroot] [PATCH v3 1/3] pkg-cmake: add option to select the
 Ninja generator
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
Cc: Samuel Martin <s.martin49@gmail.com>, John Keeping <john@metanate.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Thomas,

On 28/02/2023 16:55, Thomas Devoogdt wrote:
[snip]
>   ifndef $(2)_BUILD_CMDS
>   ifeq ($(4),target)
>   define $(2)_BUILD_CMDS
> -	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --build $$($$(PKG)_BUILDDIR) $$($$(PKG)_GENERATOR_PARALLEL) $$($$(PKG)_BUILD_OPTS)

  To avoid breaking existing (external) packages, I would add something like:

$(2)_BUILD_OPTS ?= -- $(2)_MAKE_OPTS

(inside the CMAKE_NINJA condition, only for make)

  That way, existing packages would work unchanged (and it would remove the need 
to change gdal and racehound in this patch).

  Similarly for the environment.


  Eventually we'll completely remove those variables, but then there should 
still be a warning about their use, like we have for BUILDROOT_DL_DIR in 
Makefile.legacy.


  Regards,
  Arnout


[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
