Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298A3C6FA82
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 18:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49384813AB;
	Wed, 21 Sep 2022 18:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49384813AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nDHoPz28YlTS; Wed, 21 Sep 2022 18:32:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B3AE8139B;
	Wed, 21 Sep 2022 18:32:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B3AE8139B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B94A21BF3FC
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9413E60FEB
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:32:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9413E60FEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MmFYKSCJt1jE for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 18:32:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E5C460ECA
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E5C460ECA
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 18:32:52 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id dv25so15486650ejb.12
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 11:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=GCu3McCJuq0zl5vkPoAuTJqhsFupjfjRF/a0tTFh5Q4=;
 b=Fgz/6f1OuFZSgENdNIGzdKw32N6+Aoh5cY8KaXZElrZP1XfyUoNcWDmVf1xE4FhIPi
 g49YQriKt0QOElx/phY7whbhezbEwJr0f9OzHyHEKEPl+CTstHibpnflDDyzwIrwNmcL
 4Bsk2vQspHBk1xuKPwcRGljaurO+ykxzD7QtdGMGIFx4+/XGGg/hLjcGQq/oAS7neEIs
 wTpE53vCZWJN/lHg73AO4llbMTTe3O1PPjy8cfg5UZX/Q/H7Uo6SDkqX/Lm6pTPe0rId
 rrjYLNH2fjQ4Z8XlTVex8FicyPoLs7NHGnBwmOpOzwq0R673Y57k87KNgOtsccYXXvKt
 0AlQ==
X-Gm-Message-State: ACrzQf1+5xgloMhub7ppIAm/JN/DKokiJHgF0T0iVai26rEFFKNhEKp5
 tbsD7tHElcdDOrbiQD8FevDFiA==
X-Google-Smtp-Source: AMsMyM6xb7MGV9tQkpUiMtgaX914GVhJ+LaEFqCeG5WXmrCkEYdrmpkghT1ImUK5oPwtu/TiO902Pw==
X-Received: by 2002:a17:906:8455:b0:773:c45b:d970 with SMTP id
 e21-20020a170906845500b00773c45bd970mr22033781ejy.46.1663785170565; 
 Wed, 21 Sep 2022 11:32:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a1709063b0b00b0073cf6ec3276sm1532539ejf.207.2022.09.21.11.32.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 11:32:50 -0700 (PDT)
Message-ID: <2a3ca783-079b-bca6-7fc9-6647b0307eae@mind.be>
Date: Wed, 21 Sep 2022 20:32:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220920194645.670432-1-yann.morin.1998@free.fr>
 <20220921201320.0a7f80c0@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220921201320.0a7f80c0@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=GCu3McCJuq0zl5vkPoAuTJqhsFupjfjRF/a0tTFh5Q4=;
 b=hA2N5zWEvv9ZXimyXDgQjS89ntsvM6/mkZN2kBm/8QlsrMjwZDoPvYslqE4NxzylO+
 n7sMx+qpC9YQJfCa985ii4y7yexI7xhnQTnl1Ot3jkicgT/+O4rBHiSOMExp0YUKD/Lb
 6579PEQT4Sw8PDyNPXUNsYSi0PV2kHRBQ+RZ1kWdfEsGgh+LmNJpypUazIUEtjuCSjLq
 W1dpRbkx2VU78KcgBrTfgK/3heccnbZesnJAtKuOQ6NusDFpDwadhalgTj3yAa/xHOki
 C79iE0xpLG2OGovtCKybXWXGh+OmYQcLJa5pkc7VaHp+OFjPM2/tp2gFGp6atw6CDFLV
 OZOw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hA2N5zWE
Subject: Re: [Buildroot] [PATCH v3] Makefile: fix use of many br2-external
 trees
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
Cc: David Lawson <david.lawson1@tx.rr.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/09/2022 20:13, Thomas Petazzoni wrote:
> On Tue, 20 Sep 2022 21:46:45 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
>> The top level Makefile in buildroot has a recursive rule which causes
>> the appearance of a hang as the number of directories in BR2_EXTERNAL
>> increases. When the number of directories in BR2_EXTERNAL is small, the
>> recursion occurs, but make detects the recursion and determines the
>> target does not have to be remade. This allows make to progress.
>>
>> This is the failing rule:
>>
>>      define percent_defconfig
>>      # Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig
>>      %_defconfig: $(BUILD_DIR)/buildroot-config/conf $(1)/configs/%_defconfig outputmakefile
>>          @$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(1)/configs/$$@ \
>>                  $$< --defconfig=$(1)/configs/$$@ $$(CONFIG_CONFIG_IN)
>>      endef
>>      $(eval $(foreach d,$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)),$(call percent_defconfig,$(d))$(sep)))
>>
>> The rule for %defconfig is created for each directory in BR2_EXTERNAL.
>> When the rule is matched, the stem is 'defconfig_name'. The second
>> prerequisite is expanded to $(1)/configs/defconfig_name_defconfig. The
>> rule, and all of the other rules defined by this macro, are invoked
>> again, but the stem is now $(1)/configs/defconfig_name_defconfig. The
>> second prerequisite is now expanded to
>> $(1)/configs/($1)/configs/defconfig_name_defconfig. This expansion
>> continues until make detects the infinite recursion.
>>
>> With up to 5 br2-external trees, the time is very small, so that it is
>> not noticeable. But starting with 6 br2-external trees, the time is
>> insanely big (so much so that we did not even let it finish after it ran
>> for hours); see timings toward the end of the commit log.
> 
> Wow, insane stuff!
> 
>> One of the rationale behind this code, is that we want the defconfig
>> files from br2-external trees further down the list, to override
>> defconfig files from those earlier in the list, even overriding the
>> defconfig files from Buildroot itself.
> 
> This is the part I would like to challenge. Why do we want to allow
> BR2_EXTERNAL to override defconfigs from the main tree? We do not allow
> this for packages, why should we allow it for defconfigs?

  And indeed, this is exactly the reverse of what we would have now. We have two 
pattern rules that match with the same stem. In this case, according to 'info 
make': "'make' will choose the first one found in the makefile." Since we put 
$(TOPDIR) before the externals in the foreach loop, the internal one will be the 
one that gets used.


  However, maybe this is a simpler way to solve the issue:

%_defconfig/real: $(BUILD_DIR)/buildroot-config/conf ...
	...

%_defconfig: %_defconfig/real

Since directories are only removed from the filename when there's no / in the 
pattern, it will only match the wrong thing one level deep. I.e. we still have:

foo_defconfig -> foo_defconfig/real
foo_defconfig/real -> /path/to/buildroot/configs/foo_defconfig
/path/to/buildroot/configs/foo_defconfig ->
	/path/to/buildroot/path/to/buildroot/configs/foo_defconfig/real

but there it terminates, because that last one doesn't match %_defconfig nor 
%_defconfig/real (because of the / in the latter).

  Of course, I haven't tried this, I may be talking rubbish :-)


  Regards,
  Arnout


> To me, allowing the override of defconfigs is actually a bad idea: when
> you run "make foo_defconfig", it's no longer really clear which
> "foo_defconfig" is really going to be used. Yes, it's well defined, but
> it isn't "obvious".
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
