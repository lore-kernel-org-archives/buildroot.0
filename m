Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097D0C54E67
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 19:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0A9460F84;
	Fri, 15 Mar 2024 19:41:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aDnt73Jbkr3b; Fri, 15 Mar 2024 19:41:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11FD360677
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11FD360677;
	Fri, 15 Mar 2024 19:41:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30E811BF307
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E15241692
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:41:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tHuiBqcF9GqR for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 19:40:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DA5064168F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA5064168F
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA5064168F
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 19:40:57 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33e76d653b5so2220526f8f.3
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 12:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710531656; x=1711136456;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MzKKWjSwXEriVn+bPZtOtODb3p7mRqDpX0G8sMpg+OI=;
 b=wND6gOBspGzSJlKRAtXbShqWWI0FWJIACPaga6/R1Gi82MA8pkphPh8FV/kY51QsoM
 mNoemYv5g7nxctp9rt8TSpky27Gxdw57dGS/d3CyhKVY7CyqfAMndfkEmsfUp6cSVl7b
 AU0jWlpxL5DrTKNAJ/68umJfajx/pG/pMosCs6dg+GgVK6v6jOJ8PFBQBUPvddPWT56s
 pRMsPhMIS33Cze+UvdBSlwM6K6E6o9EeBKOr6LxKqwyFSA3BQ22N1nm7wMpc7QYLPnLj
 QBWfbmLZVGfG10jVRAdFirfNKJM7TUh9acBjERBUyMlGKyy3U9UKGv/rsuqirSOewrbW
 BUHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQJ6mOHpHvv6CO6LWEdb4NcrjMUXtg08J+Uex5M16UJeRdfFtlLkBU1WT2K/wjW1sAR872UIfXvoPNgu+AJmjOGkgpsA4pJQ==
X-Gm-Message-State: AOJu0YxskBaiQD38cD1mHiNPJ84GdShMV1sxDQIHS0HDI94OCkfKPZP7
 Un0WXg2IasFpfSaYB3D/09duTrva1J2zIX2V+/LAp6mDBoyKXTp4OJzxllsv19PxU6aMCyuyJ9U
 f
X-Google-Smtp-Source: AGHT+IFJT3cSEJN8b5eAhJ126cYDDLg8HyHwkmL/4VwAGI9c3Hmm+fKCSkIzzG9+Px0U68H6VKyEDg==
X-Received: by 2002:a5d:5005:0:b0:33d:679d:a033 with SMTP id
 e5-20020a5d5005000000b0033d679da033mr3899536wrt.36.1710531655878; 
 Fri, 15 Mar 2024 12:40:55 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a5d69c6000000b0033e9f6997c7sm3815063wrw.66.2024.03.15.12.40.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 12:40:55 -0700 (PDT)
Message-ID: <1e47509a-7416-4d4c-b813-335d1f7310a6@mind.be>
Date: Fri, 15 Mar 2024 20:40:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240309164946.166802-1-fontaine.fabrice@gmail.com>
 <87wmq4myyc.fsf@48ers.dk>
In-Reply-To: <87wmq4myyc.fsf@48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710531656; x=1711136456; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MzKKWjSwXEriVn+bPZtOtODb3p7mRqDpX0G8sMpg+OI=;
 b=evnzzSBx+/YXVwd0H9kXLlQyQO5freARn29Bkas9SvDdfhPXsDTHT4ypSZLvFVSEpp
 H+zJ4PPUYN2goOy6W/CrrUveQ+0r4mDVA1/3R6v1rA34GSYT5PkYtk3LSoJrai8vPvvG
 lRzRIQhVMrYq9vuZn5HlON1szudDnywOp3UZidLilRp1lwuW8fvaTsVULkGc8Vo+19gn
 dWGAIzsGQ69pJVwrLYdLlORuDkTTti6xqhLFL5HbjQ0gR+/B+ymUXoHic+NPVKnL6Gpg
 LwVK18wG2zZ4r7zFuw2mDuR1pUYWCELL80rHKeogNH22LeyixZ10J3Wzr/dS84ALhrXE
 +tZw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=evnzzSBx
Subject: Re: [Buildroot] [PATCH 1/1] toolchain: drop codesourcery
 arm/aarch64 toolchains
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Pedro Aguilar <paguilar@paguilar.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/03/2024 19:48, Peter Korsgaard wrote:
>>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
> 
>   > codesourcery arm/aarch64 toolchains are old (2014) and use glibc
>   > 2.18/2.20 which are not compatible with 64-bit time_t raising the
>   > following build failure with libcgroup since commit
>   > 1c2dbcdcf0bb589d325c379246acaa39bb07b7be:
> 
>   > In file included from ./libcgroup-internal.h:25:0,
>   >                  from parse.y:21:
>   > /home/buildroot/autobuild/run/instance-3/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/fts.h:41:3: error: #error "<fts.h> cannot be used with -D_FILE_OFFSET_BITS==64"
>   >  # error "<fts.h> cannot be used with -D_FILE_OFFSET_BITS==64"
>   >    ^
> 
>   > Fixes: 1c2dbcdcf0bb589d325c379246acaa39bb07b7be
>   >  - http://autobuild.buildroot.org/results/e28f955f2b360f6e7bb231a5a3800cfbd17a23d7
> 
>   > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>   > ---
>   >  package/guile/guile.mk                        |  5 -
>   >  package/mesa3d/mesa3d.mk                      |  6 --
>   >  package/tpm2-totp/Config.in                   |  2 -
>   >  .../autobuild/sourcery-arm-armv4t.config      |  4 -
>   >  .../autobuild/sourcery-arm-thumb2.config      |  7 --
>   >  .../autobuild/sourcery-arm.config             |  3 -
>   >  .../autobuild/toolchain-configs.csv           |  5 -
>   >  .../testing/tests/toolchain/test_external.py  | 97 -------------------
>   >  toolchain/Config.in                           |  1 -
> 
> I get a conflict here, so this was presumably not generated against
> master?
> 
> Committed after fixing that up and adding Config.in.legacy entries,

  You used spaces instead of tabs in there... Something wrong with your editor 
config? Anyway, fixed in 2b59ee9f19.

  Regards,
  Arnout

> thanks.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
