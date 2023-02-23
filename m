Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A19FC636D6
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 19:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9BBA408B3;
	Thu, 23 Feb 2023 19:18:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9BBA408B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YxI3ld85SG-z; Thu, 23 Feb 2023 19:18:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAAC940901;
	Thu, 23 Feb 2023 19:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAAC940901
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 09BD31BF343
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 19:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E415240901
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 19:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E415240901
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CK7-yMMlkZux for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 19:18:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D851408B3
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D851408B3
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 19:18:37 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id i34so20748076eda.7
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 11:18:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a+ppcq5D0btsIuQM5a00nMSqgBQRlU+VSNfLUKaS2jo=;
 b=v98yUsfTsrKc+PnzcNLYRcnIVENsgc0nwPDvsXvbCyj0mff0hiRsZWDRn42U3O6WjL
 xPEQdtByfyUtN5Ye/n3QywZZhsZDdubGJt5szNDA210nIhESkkqiyj+G+1EtFI6UVkzM
 7m0SxQEgK+pR7fVcL8inN0olyC60z0Svugl0kBqlIE/7HnyPEBqB/cvMGWil6LGk8/p5
 ej/6yTICTNPE9kRaX5vJQjX3Xi4G6TSJD+BR5cqepN0mSRBQtOVt3mtIV3DHFPlwyUs4
 gQSf58NqXd5AWrmBzCEDVdSim0ljW4toCLtXf84Vh7A+5Y2BEiYJHY8vuDziKIGhX0Wk
 lESg==
X-Gm-Message-State: AO0yUKX6kkquCCAaFLYc01Wb0NKEJ797F/7BH66el6k18VAW+JzEECK2
 6C55Fe80hxn817pq8jn0nYJ0a66/TxLQ3DKd
X-Google-Smtp-Source: AK7set9nYINgLvpboqWxW7g/B8ucPSzc/jzqAvBl4ruRXIbPTbrXJKus0IZZyFYiGfCStJXOLzalHA==
X-Received: by 2002:a17:906:4784:b0:8f1:da18:c6ca with SMTP id
 cw4-20020a170906478400b008f1da18c6camr1703565ejc.3.1677179915774; 
 Thu, 23 Feb 2023 11:18:35 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 gh31-20020a1709073c1f00b008b1797b77b2sm9279957ejc.221.2023.02.23.11.18.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 11:18:35 -0800 (PST)
Message-ID: <ce8f557f-0279-1ca5-ba63-303e0d012a11@mind.be>
Date: Thu, 23 Feb 2023 20:18:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Colin Foster <colin.foster@in-advantage.com>, buildroot@buildroot.org
References: <20230208185516.858096-1-colin.foster@in-advantage.com>
 <Y/U5RKqr1BPinl03@colin-ia-desktop>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <Y/U5RKqr1BPinl03@colin-ia-desktop>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a+ppcq5D0btsIuQM5a00nMSqgBQRlU+VSNfLUKaS2jo=;
 b=QId6zgjRAYq8npAjWZf8o09uqbv62TeIUv1xBvSZa7yDgn6d5pn33oDum5DodfVp+k
 QdmVKhNbfWdr555thRT253XeT6vwcPMZu2zXAQBUDkl9IrSNtJeRXX49RNh1/C38HYXS
 cM9Le0J0JPTXuH0St8yjTRDO33GLIsI+pMwFINmnQ7TYYC3zcVbjnaJFdbwRiUdd6cCg
 /H68moaGgn1nisEwoGWJ9eCl69+TrghuVTBiPcBaMpsKJ25McQ+abj1WD4DLu3TDQRbp
 w+csqRSM4bxgQzZFQDJjIH2zACJKYsWhDMcEHXj3FCVfPcB98BVmHhUlWjAJpPe1NhU2
 sUtw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QId6zgjR
Subject: Re: [Buildroot] [PATCH] package/rauc-hawkbit-updater: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/02/2023 22:36, Colin Foster wrote:
> On Wed, Feb 08, 2023 at 10:55:16AM -0800, Colin Foster wrote:
>> Add useful tool for bridging RAUC with the Hawkbit API.
>>
>> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> 
> I'm just sending this follow up to see if it fell through the cracks.
> I can re-send otherwise.

  No, it's still in patchwork [1] along with 286 other patches, so we'll get 
around to it at some point.

  Regards,
  Arnout

[1] 
https://patchwork.ozlabs.org/project/buildroot/patch/20230208185516.858096-1-colin.foster@in-advantage.com/


> 
> I think Eric's email bounced, so hopefully that isn't the issue.
> 
>> ---
>>   package/Config.in                                 |  1 +
>>   package/rauc-hawkbit-updater/Config.in            | 14 ++++++++++++++
>>   .../rauc-hawkbit-updater.hash                     |  3 +++
>>   .../rauc-hawkbit-updater/rauc-hawkbit-updater.mk  | 15 +++++++++++++++
>>   4 files changed, 33 insertions(+)
>>   create mode 100644 package/rauc-hawkbit-updater/Config.in
>>   create mode 100644 package/rauc-hawkbit-updater/rauc-hawkbit-updater.hash
>>   create mode 100644 package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 511e691ed3..84e5efa856 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -2677,6 +2677,7 @@ menu "System tools"
>>   	source "package/quota/Config.in"
>>   	source "package/quotatool/Config.in"
>>   	source "package/rauc/Config.in"
>> +	source "package/rauc-hawkbit-updater/Config.in"
>>   	source "package/rsyslog/Config.in"
>>   	source "package/runc/Config.in"
>>   	source "package/s390-tools/Config.in"
>> diff --git a/package/rauc-hawkbit-updater/Config.in b/package/rauc-hawkbit-updater/Config.in
>> new file mode 100644
>> index 0000000000..bd7b8d7cf5
>> --- /dev/null
>> +++ b/package/rauc-hawkbit-updater/Config.in
>> @@ -0,0 +1,14 @@
>> +config BR2_PACKAGE_RAUC_HAWKBIT_UPDATER
>> +    bool "rauc-hawkbit-updater"
>> +    depends on BR2_PACKAGE_RAUC
>> +    depends on BR2_PACKAGE_JSON_GLIB
>> +    help
>> +      rauc-hawkbit-updater is a link between Pengutronix
>> +      RAUC and the Eclipse Hawkbit API. Hawkbit can
>> +      communicate to remote update servers, and use the
>> +      d-bus interface to trigger updates from RAUC.
>> +
>> +      http://rauc.io/
>> +
>> +comment "rauc-hawkbit-updater needs rauc and json-glib"
>> +	depends on !BR2_PACKAGE_RAUC || !BR2_PACKAGE_JSON_GLIB
>> diff --git a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.hash b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.hash
>> new file mode 100644
>> index 0000000000..c65ead3784
>> --- /dev/null
>> +++ b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.hash
>> @@ -0,0 +1,3 @@
>> +# Locally calculated
>> +sha256  42318e96a464e6c716edb45c48bd3ec3b874462973db902fbe099a395e4acb4b  rauc-hawkbit-updater-1.3.tar.xz
>> +sha256  041234c81fd6fe6c531ea1a886b9e740b9ee06759d1a910a14edbd06f4aa62c7  LICENSE
>> diff --git a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
>> new file mode 100644
>> index 0000000000..5a74181361
>> --- /dev/null
>> +++ b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
>> @@ -0,0 +1,15 @@
>> +###############################################################################
>> +#
>> +# rauc-hawkbit-updater
>> +#
>> +###############################################################################
>> +
>> +RAUC_HAWKBIT_UPDATER_VERSION = 1.3
>> +RAUC_HAWKBIT_UPDATER_SITE = https://github.com/rauc/rauc-hawkbit-updater/releases/download/v$(RAUC_HAWKBIT_UPDATER_VERSION)
>> +RAUC_HAWKBIT_UPDATER_SOURCE = rauc-hawkbit-updater-$(RAUC_HAWKBIT_UPDATER_VERSION).tar.xz
>> +RAUC_HAWKBIT_UPDATER_LICENSE = LGPL-2.1
>> +RAUC_HAWKBIT_UPDATER_LICENSE_FILES = LICENSE
>> +RAUC_HAWKBIT_UPDATER_CPE_ID_VENDOR = pengutronix
>> +RAUC_HAWKBIT_UPDATER_DEPENDENCIES = json-glib
>> +
>> +$(eval $(meson-package))
>> -- 
>> 2.25.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
