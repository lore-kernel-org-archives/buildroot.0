Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0626CD4852
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 19:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 024B26168B;
	Fri, 22 Sep 2023 19:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 024B26168B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SSG8Mm0gyW1h; Fri, 22 Sep 2023 19:12:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5637A6162B;
	Fri, 22 Sep 2023 19:12:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5637A6162B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9FC4A1BF21A
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 19:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DC2742229
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 19:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DC2742229
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZiVq09Wm3OJi for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 19:12:20 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88F43416E7
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 19:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88F43416E7
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9a645e54806so321964766b.0
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 12:12:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695409938; x=1696014738;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AHsvfTBOsfEky9R3YM8KS2eJ4jkeKkFiBDjtQkRk1bU=;
 b=xH8BOizOklaEAsj6HbScKuTEhaJ1HbJp46p1JOnkP6uQlGTbIgcp3KEajyapOuDnmK
 rAoFFifvtPHlh+3LpdWLWOfI77/jJiy5eYNkKpwEvWcj9rqIiHV6IkJW9IHP/v0M1JyM
 3bPMGSECOLn2YMfCHAi7pf0k9p/RoC34+fsFn3I1Di/zLWwduA1aSWbuUrM79yS6czdz
 xZcZMYX2/Ogxk+Q/3e14SZauikIJlStQpVQTX26EnmFs0GBAx52QeO1J+vb/kQqwtV7N
 DUKB/9P8mdtXLbglZEgdWYtqQjD/s5zXHlgy/lFcVI1JalcIX/sB7SztgL78B9GUrrAM
 Gqeg==
X-Gm-Message-State: AOJu0Yw96dTUuHJgcsn7WOP9I7CO1UScXa6pcE6yFRO3liQUPR30gEfd
 EEmTG+XtVg6KYF6Xc1XXS6EjSaWkEk15vXmI/ek=
X-Google-Smtp-Source: AGHT+IGx7LPpgQHF38G0ZUVj7jxWLsxboGcN7e8QO8oPXoQY8GkN3zCiPHPXH5WX9khO+WMTvrBsWw==
X-Received: by 2002:a17:907:7882:b0:9ae:52fb:2202 with SMTP id
 ku2-20020a170907788200b009ae52fb2202mr262553ejc.40.1695409938436; 
 Fri, 22 Sep 2023 12:12:18 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 h1-20020a1709063c0100b0099bc038eb2bsm3071003ejg.58.2023.09.22.12.12.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Sep 2023 12:12:17 -0700 (PDT)
Message-ID: <8c4f296a-e605-c168-9962-e9e04ddd547d@mind.be>
Date: Fri, 22 Sep 2023 21:12:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Lang <dalang@gmx.at>
References: <20230906194420.279926-2-dalang@gmx.at>
 <20230906194420.279926-4-dalang@gmx.at> <20230907152535.5b47810c@windsurf>
In-Reply-To: <20230907152535.5b47810c@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1695409938; x=1696014738; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AHsvfTBOsfEky9R3YM8KS2eJ4jkeKkFiBDjtQkRk1bU=;
 b=SOXibgTLMBe6Gcy7X/mrmwBk/+roZ8SrJ1ZVRmQ6LTsRMKzDYseUPUNn4z7qgGahIF
 actw6LJJZoSkRV0HD45r82syEAaMFwsAlqPoXjbkgToKVqiDu0BaMHqj4d4cYPIfhgx2
 Kvomm9Zo8aExZXgFuhVhef0L260k5a80wRNuNWBrw+VhT+lLjOhEgqLkNJz/Zlhda2PN
 HnZ9fjinJYvvsq3ZYVjI7StLTbFQ9cIe2lc3tWvvNkI+HMbd9lcNn4DSwJE6zpjR8V2y
 QqTPCXNYEQu8w3jVrujzmgayoOwi2bw00VRpI7No5Ac350T24haw88v667k+o0QAyacK
 N65A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SOXibgTL
Subject: Re: [Buildroot] [PATCH 2/2] package/libcoap: ignore CVE-2023-35862
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
Cc: buildroot@buildroot.org, Joris Lijssens <joris.lijssens@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/09/2023 15:25, Thomas Petazzoni via buildroot wrote:
> On Wed,  6 Sep 2023 21:44:19 +0200
> Daniel Lang <dalang@gmx.at> wrote:
> 
>> According to a collaborator [0] the affected code isn't in 4.3.1
>>
>> [0]: https://github.com/obgm/libcoap/issues/1117
>>
>> Signed-off-by: Daniel Lang <dalang@gmx.at>
>> ---
>>   package/libcoap/libcoap.mk | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
>> index 3773ad293c..94bfc59702 100644
>> --- a/package/libcoap/libcoap.mk
>> +++ b/package/libcoap/libcoap.mk
>> @@ -16,6 +16,8 @@ LIBCOAP_CONF_OPTS = \
>>   LIBCOAP_AUTORECONF = YES
>>   # 0001-Backport-fix-for-CVE-2023-30362.patch
>>   LIBCOAP_IGNORE_CVES += CVE-2023-30362
>> +# Doesn't affect 4.3.1, see https://github.com/obgm/libcoap/issues/1117
>> +LIBCOAP_IGNORE_CVES += CVE-2023-35862
> 
> Then instead the NVD maintainers need to be reported this issue, so
> that the NVD database gets fixed. At least for now that's how we've
> tried to resolve such issues.

  The issue was never in any released version. So if the CPE entry is fixed in 
NVD, it will be changed from
   cpe:2.3:a:libcoap:libcoap:4.3.1:*:*:*:*:*:*:*
to
   cpe:2.3:a:libcoap:libcoap:-:*:*:*:*:*:*:*

  As I just wrote: we _have_ to treat the - conservatively and assume it's 
matching. So even if NVD is corrected, we'll need the exclusion.

  Of course, it would be much nicer _not_ to correct the NVD, because then we 
can simply remove the exclusion after bumping to 4.3.3 :-)

  In any case: applied to master, thanks.

  Regards,
  Arnout

> 
> However, admittedly, the last bug reports I did to NVD people were
> ignored, while in the past, they used to be taken into account quite
> efficiently.
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
