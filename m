Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D09C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 21:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE0AD40925;
	Sun, 14 Aug 2022 21:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE0AD40925
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OolfwPnoZ9vP; Sun, 14 Aug 2022 21:27:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97E1440919;
	Sun, 14 Aug 2022 21:27:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97E1440919
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 42CCF1BF282
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 21:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26F5840919
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 21:27:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26F5840919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id juWEpcUDih_w for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 21:27:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3005340917
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3005340917
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 21:27:34 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id f22so7484134edc.7
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 14:27:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=kb5n7ic4bZGWDDZxoJ4x7u376/3QMg32j1p4/LqTX9w=;
 b=nEGq7voOGzXMOCgoEAIpKlDt/cUE/vI3Ta06Ybv8mYQDvaKJnkHWc7oH43g+/zmGx9
 NNh2jpMjUUjayd9gc+28UDKw+DQCNAs9sPY1GIeaZtFGqCqMjEUGz2vSGojwb32KCZZL
 d3I34xEDm/hel/tb1RDgX2sBgN+qd3tuKinmoCkTh4AdIcz30tZRgydKHqlG3z9W+X4V
 a6XoVYXxbpXXAS1lKHgGNJ+kN0HezyaNyQZbPIDBcsUZ9HDiQzmNrwYi7HYAAHyLpd4H
 ueO9j4kxJ2yulmN+X8nFXh6nMgLTDiJ99lsu9qSm6cxj0gsh5sNWQFs+EV6HdGE03+fD
 kVnw==
X-Gm-Message-State: ACgBeo0ZLhzQ8PF59t9twrzZQoKcQlNzFlezlqFjgcPm0zVRatLv0mph
 ZXf9HOTMDE+c8iGQ3ULa9+cEWQ==
X-Google-Smtp-Source: AA6agR7WYv053L4o8uGE/FW85voFFB1HyjAp/6059PdJU+tOyjq/ZUcyk44RibFhePaF6gZA5cIrAg==
X-Received: by 2002:a05:6402:3485:b0:43d:7fe0:74d1 with SMTP id
 v5-20020a056402348500b0043d7fe074d1mr11929937edc.413.1660512452349; 
 Sun, 14 Aug 2022 14:27:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 e24-20020a170906315800b007385e929344sm2127eje.55.2022.08.14.14.27.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Aug 2022 14:27:32 -0700 (PDT)
Message-ID: <17a5ae06-dc0c-944b-8b86-591b3e9ca500@mind.be>
Date: Sun, 14 Aug 2022 23:27:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Stefan Agner <stefan@agner.ch>
References: <2ba3394abf87c940fe036b2e18e1afc2a2d37ad0.1660320356.git.stefan@agner.ch>
 <20220813115137.GA2741326@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220813115137.GA2741326@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc;
 bh=kb5n7ic4bZGWDDZxoJ4x7u376/3QMg32j1p4/LqTX9w=;
 b=WTRfD6VZUZ21/n2Fbb21EanreDVnYul6UVIsWuVvjB3+dWWtvRjnerQlR6kVsAQyj8
 AfPj//76XDNLFveUEeBV+k9qNzjwrNGt+uvTd6kdPuzTq3m74LdCJ4s0ObEUVWbT+hLa
 iiyrclNvhDYE9fD5Qf+7W4M92thp/C8gogQj9c5rJRiU5pYASZB2AkZJfohO2rM+GM68
 +qwxu2MHMfLoniM0Z0iZnov/xDQG+WIEGhtev38h3NKcy0BGl2hkcDQ/wOX0/yKN4RE0
 QNMtthLft+fiIKXgJyj9bwna7JHpBVHh2jiqqzOHOH7LFw1+0jz79HJLtPik3b3sdrob
 AmTg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WTRfD6VZ
Subject: Re: [Buildroot] [PATCH] package/docker-engine: use kernel modules
 for extra network drivers
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



On 13/08/2022 13:51, Yann E. MORIN wrote:
> Stefan, All,
> 
> On 2022-08-12 18:07 +0200, Stefan Agner spake thusly:
>> Docker network driver "overlay", "macvlan" and "ipvlan" are not used
>> by default. Make them a module.
>>
>> The main aim here is to get rid of the dummy0 network interface which
>> is generated by the dummy driver by default. For consistency, make
>> all kernel drivers required for Docker network drivers a module. Also
>> add the currently missing CONFIG_BRIDGE_VLAN_FILTERING (mandatory
>> for the Docker network driver "overlay").
>>
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>> ---
>>   package/docker-engine/docker-engine.mk | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
>> index 293af1858c..730f2e3b86 100644
>> --- a/package/docker-engine/docker-engine.mk
>> +++ b/package/docker-engine/docker-engine.mk
>> @@ -124,10 +124,11 @@ define DOCKER_ENGINE_LINUX_CONFIG_FIXUPS
>>   	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_MASQUERADE)
>>   	$(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE)
>>   	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CORE)
>> -	$(call KCONFIG_ENABLE_OPT,CONFIG_DUMMY)
>> -	$(call KCONFIG_ENABLE_OPT,CONFIG_MACVLAN)
>> -	$(call KCONFIG_ENABLE_OPT,CONFIG_IPVLAN)
>> -	$(call KCONFIG_ENABLE_OPT,CONFIG_VXLAN)
>> +	$(call KCONFIG_SET_OPT,CONFIG_DUMMY,m)
>> +	$(call KCONFIG_SET_OPT,CONFIG_MACVLAN,m)
>> +	$(call KCONFIG_SET_OPT,CONFIG_IPVLAN,m)
>> +	$(call KCONFIG_SET_OPT,CONFIG_VXLAN,m)
>> +	$(call KCONFIG_SET_OPT,CONFIG_BRIDGE_VLAN_FILTERING,m)
> 
> That entirely overrides the options from the configuration file provided
> by the user, if they have and require any of those options set as =y.
> 
> I think that what we need, is to have a helper KCONFIG_ENABLE_OPT_MOD,
> which only sets an option to 'm' if it is not already 'y' (i.e. the
> opposite of KCONFIG_ENABLE_OPT).

  Actually, if they're optional, I wouldn't configure them at all. Someone who 
doesn't need this feature may very well want to build a kernel that doesn't have 
them at all, even as modules. Or you may even build a kernel that doesn't have 
module support.

  We don't have a good way to make those options "suggested", other than 
mentioning them in the help text. But I do think that that's enough.

  Regards,
  Arnout

> 
> Regards,
> Yann E. MORIN.
> 
>>   	$(call KCONFIG_ENABLE_OPT,CONFIG_VETH)
>>   	$(call KCONFIG_ENABLE_OPT,CONFIG_OVERLAY_FS)
>>   	$(call KCONFIG_ENABLE_OPT,CONFIG_KEYS)
>> -- 
>> 2.37.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
