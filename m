Return-Path: <SRS0=7Mk9=NP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.4 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94382C4338F
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 08:29:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0464361262
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 08:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0464361262
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8905401E5;
	Tue, 24 Aug 2021 08:29:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HIQWqKo30dux; Tue, 24 Aug 2021 08:29:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1604C401F2;
	Tue, 24 Aug 2021 08:29:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 430961BF2B9
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 08:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FC7F80AF5
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 08:29:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C0ffCkZ-8mlc for <buildroot@lists.busybox.net>;
 Tue, 24 Aug 2021 08:29:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C2B9880F7B
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 08:29:13 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id me10so14288927ejb.11
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 01:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gck7bmxFf4orjblOIXHv24cgmIlC4dRme3z+6/Ammng=;
 b=N1iPTJSETvHR2C/XlK8PI9/lxU+Zk7ItPgxzdWJP6gDEBRX//TyQNCIGMTSWdF19/E
 gDmK7Z2jb1fQM9WTRR4apzLW/rVRCO5pGeAjLvEoUmZn2RaCkipQqLsaipMy6rZTw0G/
 1HMjTOYcXi695uBuZJxf4upJAIBP0XfjmA9faJuk9l2YSRYgY9hHbXP2teTC6yJkXiDT
 f0zT1v6ylu8dVjm4UpKyEZ5iEQ7VTclE96XPcC2UwTxvb/MS3M/OTz52ZNPZS+u7LHP3
 W2BU7YW7NdUoNJeuuaKZ+SnN+j6IZnhhXZ88vDsIVB4vPnSn5dwJXj4zcE3VF9/c/NYZ
 MC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Gck7bmxFf4orjblOIXHv24cgmIlC4dRme3z+6/Ammng=;
 b=rtMW2nKhSoklo2jvz1JFhqUm4xyIZwKsOwJlTzDvJNLGSpDGpkT9YhobWmKikwUrhx
 MEewmWPlCy1Ka6SPTjmr2FlGfSIo9vBYVnTOZ5UsrGG++wJsDOZEdSFYoX3Igjd6UvS1
 5J6RHEtG3c0DRwDryGRGYqtTtv3oJtKnHx5fn1z0cWkuD/lxUgZKIWHNHmT5VTR+ka/w
 Tbjvodqv5DXT1W+rzgBsvOBe9DvDaLsk7mwe9qd7tcmpUJj1BmXL3RxrZTTg4CqphvHy
 12NI9Sn9SUg+VUM1DFtOJo+FEdb1vAqfsJ9xb8V0qy2vYi7rsiUW0kNAo0dJ5QLyvVC1
 pdOQ==
X-Gm-Message-State: AOAM530DD3FVjS4IqhkiW4zDChWJYS30YDlfpsSYCRFpW0MggRpN/JFO
 qXQr7/pIel+p3p21up+pfaoDOA==
X-Google-Smtp-Source: ABdhPJx3u+6WTHZfCSPxUFw3S1Oe4HI/xzGDDMzycSjUG/KWIyaMih+7bFY2FdzHhUt+u3Z9MGlyAA==
X-Received: by 2002:a17:906:29d3:: with SMTP id
 y19mr6124600eje.361.1629793751815; 
 Tue, 24 Aug 2021 01:29:11 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r2sm11085242edv.78.2021.08.24.01.29.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 01:29:11 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20210823233113.936711-1-arnout@mind.be>
 <20210824071311.GW27036@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <55e64d54-09e6-9cb9-9b4b-764dcab77c23@mind.be>
Date: Tue, 24 Aug 2021 10:29:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824071311.GW27036@scaer>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] package/libcap: don't overwrite 'empty'
 when generating loader.txt
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 24/08/2021 09:13, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2021-08-24 01:31 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
>> Upstream commit [1] introduced an invocation of objcopy to generat
>> loader.txt. However, objcopy, if not provided with an output file, will
>> overwrite the input file. This is usually harmless because it will be
>> identical, but the timestamp is updated. This may cause 'empty' to be
>> newer than 'loader.txt', which causes 'loader.txt' and its dependencies
>> to be rebuilt during 'make install'
>>
>> We provide a different set of parameters during 'make install'. In
>> particular, we no longer pass in HOST_CONFIGURE_OPTS, so we no longer
>> set LDFLAGS. Thus, there is no -Wl,rpath option that is passed in, which
>> causes the resulting binaries to have an incorrect RPATH.
>>
>> Fix this by adding /dev/null as the output file in the objcopy
>> invocation.
>>
>> Patch was sent upstream, but there's no mailing list, just a single
>> person.
>>
>> Fixes: http://autobuild.buildroot.net/results/600/600aff5b839b48db80751cace5fa9670b7a3d698
>> (hopefully)
>>
>> [1] https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=efd293947f940180eedd8d0915b124f4aedccc08
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> Applied to master, then reverted, then applied to next, thanks.

 Ah, sorry, I forgot to add the /next part... Well, it was already late :-)

 Regards,
 Arnout

> 
> /me goes grab a third coffee before resuming patch reviews...
> 
> Regards,
> Yann E. MORIN.
> 
>> ---
>> Note: I tried updating to v1.2.53 first, but that failed due to [2]
>>
>> [2] https://bugzilla.kernel.org/show_bug.cgi?id=214023#c16
>> ---
>>  ...don-t-overwrite-empty-when-generatin.patch | 50 +++++++++++++++++++
>>  1 file changed, 50 insertions(+)
>>  create mode 100644 package/libcap/0001-libcap-Makefile-don-t-overwrite-empty-when-generatin.patch
>>
>> diff --git a/package/libcap/0001-libcap-Makefile-don-t-overwrite-empty-when-generatin.patch b/package/libcap/0001-libcap-Makefile-don-t-overwrite-empty-when-generatin.patch
>> new file mode 100644
>> index 0000000000..a47a2c788e
>> --- /dev/null
>> +++ b/package/libcap/0001-libcap-Makefile-don-t-overwrite-empty-when-generatin.patch
>> @@ -0,0 +1,50 @@
>> +From dc507a812d931c24f1ac98c811fdd29bffa21da9 Mon Sep 17 00:00:00 2001
>> +From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
>> +Date: Tue, 24 Aug 2021 00:36:40 +0200
>> +Subject: [PATCH] libcap/Makefile: don't overwrite 'empty' when generating
>> + loader.txt
>> +
>> +objcopy takes an input file and an output file as arguments. If the
>> +output file is left out, the input file will be overwritten.
>> +
>> +Since the objcopy command used to generate loader.txt only does a
>> +dump-section and no filtering, in practice there is no change to empty.
>> +However, as a side-effect, its timestamp is updated. The timestamp of
>> +empty and of loader.txt will be more or less the same; however,
>> +loader.txt is closed just before the output file is closed, so it's
>> +possible that the timestamp of loader.txt is just a little bit earlier.
>> +If this happens, it causes loader.txt to be rebuilt later, which in turn
>> +causes a number of other object files to be rebuilt.
>> +
>> +Usually that's harmless, but it sometimes causes the rebuild to happen
>> +during 'make install'. This is particularly annoying if 'make install'
>> +is done as root, since loader.txt becomes owned by root in that case.
>> +
>> +Fix this by specifying a harmless output file: /dev/null.
>> +
>> +While we're at it, take in an upstream change that removes the redundant
>> +redirect.
>> +
>> +Fixes: ee3b25c0a877fa74d1aec88f325ac45b09963c82
>> +
>> +Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> +---
>> + libcap/Makefile | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/libcap/Makefile b/libcap/Makefile
>> +index 47cf8f4..18e4f4f 100644
>> +--- a/libcap/Makefile
>> ++++ b/libcap/Makefile
>> +@@ -105,7 +105,7 @@ empty: empty.c
>> + 	$(CC) -o $@ $<
>> + 
>> + loader.txt: empty
>> +-	$(OBJCOPY) --dump-section .interp=/dev/stdout $< > $@
>> ++	$(OBJCOPY) --dump-section .interp=$@ $< /dev/null
>> + 
>> + cap_magic.o: execable.h execable.c loader.txt
>> + 	$(CC) $(CFLAGS) $(IPATH) -DLIBRARY_VERSION=\"$(LIBTITLE)-$(VERSION).$(MINOR)\" -DSHARED_LOADER=\"$(shell cat loader.txt)\" -c execable.c -o $@
>> +-- 
>> +2.31.1
>> +
>> -- 
>> 2.31.1
>>
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
