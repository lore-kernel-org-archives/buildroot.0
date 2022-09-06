Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB9AC38145
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 19:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A20386115A;
	Tue,  6 Sep 2022 19:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A20386115A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TlUVMRCK6nnP; Tue,  6 Sep 2022 19:46:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20FF5610D9;
	Tue,  6 Sep 2022 19:46:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20FF5610D9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 301B91BF57C
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 19:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 186D24048D
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 19:46:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 186D24048D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U6QrTUA9RD4Z for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 19:46:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F319940169
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F319940169
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 19:46:18 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id 29so11472191edv.2
 for <buildroot@buildroot.org>; Tue, 06 Sep 2022 12:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=U1VCR/U6ONF47HK5YIJjNJBttM/F1ZVEdEx/nb/3Anw=;
 b=RDxhl9x+dCWeJcAQfit/HaO03ThqJULmZgH2rN6YuS6ba/Af96OsQdhsJzzu2oMBT6
 Tuyv8nXiceXyuVIkiJ3+JBy5z+VeiBT/xTTvqGfqKHl5N8M1Lf+3YiKSpD3REe01Y++Q
 76rJuoQa0ELGMoLWpZ0JabmQS1jmQQux44pw3hkClKJCeTf1bw9UVbtQ6YqBKHswMEwC
 t5j2BVYkhaLgjJefKz7kqscQrnhxsLOIf1VxLOQD7qoA3vdeRBn5XwjHL80fidFfU31/
 dSN1HijwSFyDJljZBgk75ME7WEnilw95njvNy77wOUSLwiMzuQZCxEjIOObXBRlUrZC5
 nCCA==
X-Gm-Message-State: ACgBeo33H6jltJjludGJ1aIcJ3wVTJ/vFSnamBHrwGTrmhommV9AN+iA
 yBXKTXMi9Ny2WVI+xHq2LthicA==
X-Google-Smtp-Source: AA6agR6CQ3hYhYcwjnELOyWfur4ys8hEKwbweIMfaCVAMwYTShQuTsTm3+IoBX/iZGOX7ddNuXqftg==
X-Received: by 2002:aa7:da9a:0:b0:44e:9774:c2ab with SMTP id
 q26-20020aa7da9a000000b0044e9774c2abmr203107eds.10.1662493577214; 
 Tue, 06 Sep 2022 12:46:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a170906384800b0074a82932e3bsm7051284ejc.77.2022.09.06.12.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 12:46:16 -0700 (PDT)
Message-ID: <23566bac-ad05-3bd6-1b0b-ad4f3b3f5c20@mind.be>
Date: Tue, 6 Sep 2022 21:46:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Sergey Matyukevich <geomatsi@gmail.com>
References: <20220904205702.1488199-1-geomatsi@gmail.com>
 <20220905201727.GJ1490660@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220905201727.GJ1490660@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=U1VCR/U6ONF47HK5YIJjNJBttM/F1ZVEdEx/nb/3Anw=;
 b=b4yypwVUXiDv8gjpSo0AFpTlldMLOd00BdWOgk7EJgVrJgQgvV6zB79iSILCysQzpy
 uas9VSgVk7wVcfi5JGg55Ao6PkubvoJnZYZG2cff/ybFv5RIOR//cTKj2+1cVz7A0TY6
 SkxlFX1JCPIao52JE3u5m8YyoPsOGZsfH+4o1lGdsWhf53zr1/INye+TZAU2vBiFrgty
 h3mqqHqXc7kqS2W6lvBQwgrzg4iA0yZ4/CYc54nAK+d/NMPzdDNfSS8wOymST25KCYWs
 DhfNgqVFHpG6dIS2pqaAswCcmSY0dTAR7JimFptSp5omLTjK6hg9uhY/Xf9RtRoBcAK3
 RPMA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=b4yypwVU
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-tools: perf: add
 host-python3 dependency
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/09/2022 22:17, Yann E. MORIN wrote:
> Sergey, All,
> 
> On 2022-09-04 23:57 +0300, Sergey Matyukevich spake thusly:
>> Linux kernel commit 00facc760903 ("perf jevents: Switch build to use
>> jevents.py")
> 
> 00facc760903 is only parts of 6.0-rc kernels so far, so unless one uses
> bleeding edge technology, there is no issue. So, paying the price of a
> host-pytohn3 build just for release-candidate kernels is a bit too much
> in my opinion.
> 
> So, I added a config knob to drive this, like we have for host-openssl
> and a few other host programs for building the kernel.

  If only python is needed, no modules, then $(BR2_PYTHON3_HOST_DEPENDENCY) 
should be used instead. That checks for python 3.4 but I think that that is fine 
for the kernel as well. If not, we should probably bump the minimum system 
python3 version.

  Regards,
  Arnout

> 
> Applied to master with the above change, thanks.
> 
> Regards,
> Yann E. MORIN.
> 
>> switched to auto-generation of arch-specific PMU events
>> using python script. Now custom PMU events for different platforms of
>> the selected target architecture are not embedded into perf binary if
>> an appropriate host python interpreter is not present. In practice it
>> means that perf is successfully built, but 'perf list pmu' will show
>> no custom events on a target platform even if those events are supported
>> and properly defined in tools/perf/pmu-events/arch/<target arch>
>> directory in the kernel source tree.
>>
>> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
>> ---
>>   package/linux-tools/linux-tool-perf.mk.in | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
>> index 057c6f80e7..44c1bbdf83 100644
>> --- a/package/linux-tools/linux-tool-perf.mk.in
>> +++ b/package/linux-tools/linux-tool-perf.mk.in
>> @@ -6,7 +6,7 @@
>>   
>>   LINUX_TOOLS += perf
>>   
>> -PERF_DEPENDENCIES = host-flex host-bison
>> +PERF_DEPENDENCIES = host-flex host-bison host-python3
>>   
>>   ifeq ($(NORMALIZED_ARCH),x86_64)
>>   PERF_ARCH=x86
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
