Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECBBC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 19:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 275F1421F5;
	Fri, 29 Jul 2022 19:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 275F1421F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5TIIYonWsi5Z; Fri, 29 Jul 2022 19:00:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D959D421C4;
	Fri, 29 Jul 2022 19:00:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D959D421C4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CAF9D1BF575
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 19:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2864842B4
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 19:00:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2864842B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iNEHNH7OjG6T for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 19:00:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 572C1841AA
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 572C1841AA
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 19:00:52 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id z23so10083215eju.8
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 12:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=S3HrGZXrY4c36xcB4eyZUdEnhqCYDJjcMS6vwA4PZYM=;
 b=g4VfOf3V0C0JrcIuVzWzd6wIl+8V2PeLvz1eXLbZKZCivb5C4DX76106Lba8pUNuZ9
 sj+2UQZTbxqG02oMKeJlwXmNgJul6eYNSXaKk1qbqHIC10Cz5iZulahp/qpxPhv7/ZFG
 oDl9AnpoId3/czha4Y5mBJScqYnLcSqootkxwMnbpca986b9GtNKgZtVq33CV48Bt5GU
 WnwbUGq3tFl+++z98A4UIOTWbAHCNJiMwcWb3bLwvOmWzu55UUD3bRlasD/yb4DILoPh
 LpFjfFdVUVfDAorv/rcKV0T5mZDBU1Duow5wUPP7rn8z/Ifx5hpy9raJG3BamvgR+znB
 7YBQ==
X-Gm-Message-State: AJIora8IDB+7e6EKJvIsSNI29BtNeUeAuaYriaGd4T7VrLzbuZ6/pZiZ
 zzQ1y8CyLMTCSQVc/7sktLX389ISWs4C3A==
X-Google-Smtp-Source: AGRyM1uafKzy3Xq9iTDu/a/EH5d/ZXnfEihdxD0x8dOabFkvaKTmS2s/hAud9CY2Gy+i5O3yzkPmwg==
X-Received: by 2002:a17:907:2808:b0:72b:50cd:2c8a with SMTP id
 eb8-20020a170907280800b0072b50cd2c8amr3807338ejc.246.1659121250170; 
 Fri, 29 Jul 2022 12:00:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1709063d2200b0072fe6408526sm2014212ejf.9.2022.07.29.12.00.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 12:00:49 -0700 (PDT)
Message-ID: <130b7fd7-20bd-656b-ed20-b0710fc5594f@mind.be>
Date: Fri, 29 Jul 2022 21:00:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
References: <20220728211259.121416-1-angelo@amarulasolutions.com>
 <20220729104754.2beb327c@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220729104754.2beb327c@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=S3HrGZXrY4c36xcB4eyZUdEnhqCYDJjcMS6vwA4PZYM=;
 b=I0ymxsPe583FYtW1OnsnHcEuq+XwtqhXy/VE6v9/InNyVNyHFenaZI5m7hJQDOAvT1
 ztThAexXwcm5HhXH1nFRxtetnBEc78OZHtUoc7PP2VtDLvK/kFvar4Fkg9mAhNCqWvpM
 sg+a2Vw8o1oKzyKcya3dQDQE3tWDnzScwvWxIKJEVxYzQIsEuOYVhggAsBk4uZNtQuby
 U12/ge28y+6/y0OOlC7M0NxPM5mLr1CJ3keNfeYJdWPNHPTr2wXzFjX+q+CqVRL4JtEo
 UnxonHcugGEPci2nA2QYmmT9Tv4qx4BaMsaE+6Q8FZZw9QRI0XrxJN9zBe/hID3B21lj
 k1fg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=I0ymxsPe
Subject: Re: [Buildroot] [PATCH v2] package/libdill: new package
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/07/2022 10:47, Thomas Petazzoni via buildroot wrote:
> Hello Angelo,
> 
> On Thu, 28 Jul 2022 23:12:59 +0200
> Angelo Compagnucci <angelo@amarulasolutions.com> wrote:
> 
>> Libdill is a C library that makes writing structured concurrent programs
>> easy.
>>
>> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[snip]
>> diff --git a/package/libdill/libdill.mk b/package/libdill/libdill.mk
>> new file mode 100644
>> index 0000000000..822f07b939
>> --- /dev/null
>> +++ b/package/libdill/libdill.mk
>> @@ -0,0 +1,26 @@
>> +################################################################################
>> +#
>> +# libdill
>> +#
>> +################################################################################
>> +
>> +LIBDILL_VERSION = fa01648cf2a8d06e53c965b45eeacfb3ac57bd04
>> +LIBDILL_SITE = $(call github,sustrik,libdill,$(LIBDILL_VERSION))
>> +LIBDILL_LICENSE = MIT
>> +LIBDILL_LICENSE_FILES = COPYING
>> +LIBDILL_CPE_ID_VENDOR = libdill
>> +LIBDILL_CPE_ID_PRODUCT = libdill
> 
> Could you add a link in the commit log that shows you have verified these?

  See for example how Fabrice does it:

cpe:2.3:a:osgeo:gdal is a valid CPE identifier for this package:

 
https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aosgeo%3Agdal


  (We should add this to the manual as well.)


>> +LIBDILL_INSTALL_STAGING = YES
>> +# Fetched from Github, with no configure script
>> +LIBDILL_AUTORECONF = YES
>> +
>> +ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> 
> ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
> 
>> +LIBDILL_CONF_OPTS += --disable-threads

  What kind of concurrent programming can you do without threads?

  Regards,
  Arnout

>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
>> +LIBDILL_DEPENDENCIES = openssl
>> +LIBDILL_CONF_OPTS += --enable-tls
> 
> No "else" clause to explicitly disable?
> 
>> +endif
> 
> Thanks!
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
