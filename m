Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F89C432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 16:31:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 844C660E99
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 16:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 844C660E99
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D0C18352B;
	Fri, 27 Aug 2021 16:31:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m5M-hYF8OySX; Fri, 27 Aug 2021 16:30:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC2FE83560;
	Fri, 27 Aug 2021 16:30:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C458F1BF40D
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 16:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C15016070F
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 16:30:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CtXqmKyE1O9w for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 16:30:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52A4C606A7
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 16:30:50 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id z19so10664301edi.9
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 09:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rZXVHTEfiAGX/dos/lD8ghN3S5aX1lgvn89FIbY2UtM=;
 b=M6uiXNn5W3INuBwuKaiNSiES/VmBAdO32FkZOHqWooaVoA00ZbMIYaFZxC2BVbv8BB
 A69oqP2iGsBSNvJF37sthbS/S6ufQbNcH+A6lH9wObJcOmI9wMeGxYhaiD7XL+st2sTc
 OVjo/f3ULulXZuT+u+4kySx0ScRsv4JqM/NESrTN7sQLf038jwS+JR5bkfPXayEPQSOR
 Ta64Y7FOtAZLI7AuIfqlOKrh10MO0w+CMItU+3USDtp9eIC1h3xfV4mgavAkH77JXgNN
 CXvFhSbVAsnArHVBOhWurL5y37ixwVKODA0Quq2D11Z6FHhMLWRo5AnoPqSmkuOBUsw4
 XJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=rZXVHTEfiAGX/dos/lD8ghN3S5aX1lgvn89FIbY2UtM=;
 b=hzXapkDS2aq69HgxduUZULGOyelkDPQ3Jp6UZ1Luy9MJHoILdeT+Rla0uEsLhqNsMn
 DV34dZgMvegmRBrIbLdEqkCLe98kjpftvIGo9ZYcIA2iRDdQ4Rd+7qcF/0LsJmIgg15y
 ui57YOWJcvmNVDDi2QpRJd65dIC8E+MbRPwyEadkZNw1pGGKiSNAKxlTCOTeBO6AFTbh
 m370AJhP5p2TGlj6uAnCBDVJiTU1C5HP9UOmOakpGzbAi7Hnd3SzE8PiTYLLaQz06d3n
 gEy79yvriGCp+XC+meKZ+C5QmKDdEvMgKfcWfuaxbrZLOuV6QW2hU+p18OyMOgWIdzdb
 Bq4w==
X-Gm-Message-State: AOAM530Z8KS4epeRWutNDPBDbSyYirMfDzN5rgsM3xuEpu9VPzpJyrS7
 IENnySy75Fe6v7G3PS8TaRn3jDuBO0kIMg==
X-Google-Smtp-Source: ABdhPJyG0kykTYt0XEDqihnajLtdjsJ1CwRGnqH9ZpfUVJO3scKNF6d23OkxU4sCSdhymg2ZV1U+Ow==
X-Received: by 2002:a05:6402:28b3:: with SMTP id
 eg51mr10697134edb.31.1630081848482; 
 Fri, 27 Aug 2021 09:30:48 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id k15sm3080386ejb.92.2021.08.27.09.30.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Aug 2021 09:30:48 -0700 (PDT)
To: "Voss, Samuel M Collins" <sam.voss@collins.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20210826210241.56201-1-sam.voss@collins.com>
 <942093f8-fbc2-8278-7913-e1644ecde8f0@mind.be>
 <DM2P110MB01074BC60B97C1F94BA7DF6085C89@DM2P110MB0107.NAMP110.PROD.OUTLOOK.COM>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <33f060f1-78de-bf24-df90-5763650d3195@mind.be>
Date: Fri, 27 Aug 2021 18:30:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <DM2P110MB01074BC60B97C1F94BA7DF6085C89@DM2P110MB0107.NAMP110.PROD.OUTLOOK.COM>
Content-Language: en-GB
Subject: Re: [Buildroot] [External] Re: [PATCH 1/1] package/busybox: add
 systemd service for telnetd
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 27/08/2021 17:50, Voss, Samuel M Collins wrote:
> Arnout,
> 
>> -----Original Message-----
>> From: Arnout Vandecappelle <arnout@mind.be>
>> Sent: Thursday, August 26, 2021 5:01 PM
>> To: Voss, Samuel M Collins <sam.voss@collins.com>;
>> buildroot@buildroot.org
>> Subject: [External] Re: [Buildroot] [PATCH 1/1] package/busybox: add
>> systemd service for telnetd
>>
>>
>>
>> On 26/08/2021 23:02, Sam Voss via buildroot wrote:
>>> Signed-off-by: Sam Voss <sam.voss@collins.com>
>>> ---
>>>  package/busybox/busybox.mk      |  7 +++++++
>>>  package/busybox/telnetd.service | 11 +++++++++++
>>>  2 files changed, 18 insertions(+)
>>>  create mode 100644 package/busybox/telnetd.service
>>>
>>> diff --git a/package/busybox/busybox.mk
>> b/package/busybox/busybox.mk
>>> index cfc06b0d78..fb427faf1c 100644
>>> --- a/package/busybox/busybox.mk
>>> +++ b/package/busybox/busybox.mk
>>> @@ -378,6 +378,13 @@ define BUSYBOX_INSTALL_TARGET_CMDS
>>>  	$(BUSYBOX_INSTALL_MDEV_CONF)
>>>  endef
>>>
>>> +define BUSYBOX_INSTALL_INIT_SYSTEMD
>>> +	if grep -q CONFIG_FEATURE_TELNETD_STANDALONE=y
>> $(@D)/.config; then \
>>> +		$(INSTALL) -D -m 0644 package/busybox/telnetd.service \
>>> +
>> 	$(TARGET_DIR)/usr/lib/systemd/system/telnetd.service ; \
>>> +	fi
>>> +endef
>>> +
>>>  # Install the sysvinit scripts, for the moment, but not those that
>>> already  # have a corresponding one in openrc.
>>>  define BUSYBOX_INSTALL_INIT_OPENRC
>>> diff --git a/package/busybox/telnetd.service
>>> b/package/busybox/telnetd.service new file mode 100644 index
>>> 0000000000..3c1fa457b1
>>> --- /dev/null
>>> +++ b/package/busybox/telnetd.service
>>> @@ -0,0 +1,11 @@
>>> +[Unit]
>>> +Description=Telnetd Service
>>> +After=network.target
>>> +
>>> +[Service]
>>> +# busybox telnet doesn't support pidfile, so run in foreground
>>
>>  AFAIU Type=simple is anyway the preferred type for services without
>> specific systemd support, so I don't think this comment is very useful...
> 
> Fair enough, I didn't know that was the specific guidance, so I'm okay with dropping that comment when applying.

 From the systemd.service(5) man page:

It is generally recommended to use Type=simple for long-running services
whenever possible, as it is the simplest and fastest option.


 Regards,
 Arnout

> 
> Thanks for letting me know,
> 
> Sam
> 
>>
>>  Regardless:
>>
>> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>>
>>  Regards,
>>  Arnout
>>
>>> +Type=simple
>>> +ExecStart=/usr/sbin/telnetd -F
>>> +
>>> +[Install]
>>> +WantedBy=multi-user.target
>>>
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
