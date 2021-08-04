Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 651BAC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 10:53:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1E32610FC
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 10:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D1E32610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A14860646;
	Wed,  4 Aug 2021 10:53:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cATozi6iRi7Z; Wed,  4 Aug 2021 10:53:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01E2460650;
	Wed,  4 Aug 2021 10:53:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9CC741BF418
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 10:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BF4A83B67
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 10:53:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2siqxf1Unetj for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 10:53:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21C2083BEF
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 10:53:27 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id yk17so3025015ejb.11
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 03:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OuBUUfgRFsiBgsQHY2EGGcP9lGoLu7oUFNB51BaMYR0=;
 b=aK0CpmX12G+p5oa+WpLRIsQGrEW5z3OCFA/++/wiu3UI4eFHY9fUcYslghi35xWIC0
 3sbFTCBrNMzfbALbwYHaSeniv7GE5Aw2ZuoWUw4LBJy6q4E0hX3MHxuZiqoiawVxd/ca
 88ughL7NsI7OlCV440079umZyvluwbFub/l3e5mGhRs69n5KStXRe/mt9wcOnRByGojd
 xG4YFZB6xg6svooanQAkcL9HS/a9550OvRQouNwgGQ5w8sK1vhC5cFmERX9wUvCb/wLu
 8unVCkizgEVq8WBi4CR1mZ8lVwoyLnAzL3QhE83lmqT/dxzPKhQFDvcSiI/sDSZI+RXi
 ARDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=OuBUUfgRFsiBgsQHY2EGGcP9lGoLu7oUFNB51BaMYR0=;
 b=aoNFDpDFknf78wrMMZdiSmSGfEf8zIId2R7nJoQxFKBsQ7bjCQTquLnZ3bm5TNYxK5
 okPhaKwiWXgYjRJS+S2gMwJHKcr4ql55WovNTzNLKNVU2Ez6qATro7yWWI5FwJS1sls6
 o+bYAIiLo81+LW64CkLcwYp/8QDtWkDbdCpGHbGjfXXyW8dRsjXrISmtcHWCSmKfGu7P
 WlH3m0iBf7gar3fN4n6pllC6w2bGPhWo+7gb9CYIDjGID8abZdmO2JkqhmtD3dyGzKps
 F4OyjKTU4TkkP7BZziYRKbODb4OMzLsllqIeNZiELiCY0x9vwuzMICcsZA7tqdBWhULV
 xFyw==
X-Gm-Message-State: AOAM530bu1QfqTURD059C7kJj1MI4G8y38HBNWRX3GH//tKcR71XcXks
 G7MtKHrcpJUukFUmT1Ao3zE8Ow==
X-Google-Smtp-Source: ABdhPJy7HCGnPjuysec5LIgmnZO+bRmwaHAKf+vXMzCumnBRi7xtFPIMYyLSbtQxqJu41J0BPCqwaA==
X-Received: by 2002:a17:906:4d50:: with SMTP id
 b16mr25694258ejv.501.1628074406106; 
 Wed, 04 Aug 2021 03:53:26 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id g23sm568026ejm.26.2021.08.04.03.53.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 03:53:25 -0700 (PDT)
To: Gleb Mazovetskiy <glex.spb@gmail.com>, cedric.chepied@gmail.com,
 buildroot@buildroot.org, romain.tisserand@gmail.com,
 Peter Korsgaard <peter@korsgaard.com>
References: <CADjhFRAiQKescNLz8wbeQx=+WfAA19hcLt=dbvm2XoYq6HnFMg@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <063f8d9b-4124-6f76-1208-0300b63df38b@mind.be>
Date: Wed, 4 Aug 2021 12:53:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CADjhFRAiQKescNLz8wbeQx=+WfAA19hcLt=dbvm2XoYq6HnFMg@mail.gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] An issue with alsa-plugins + alsa-utils
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



On 04/08/2021 12:12, Gleb Mazovetskiy wrote:
> Hi,
> 
> This is an issue originally reported to me by Romain Tisserand on Discord:
> 
> 1. alsa-plugins copies some files $(TARGET_DIR)/usr/share/alsa/alsa.conf.d
> 2. alsa-utils removes these files during installation ( |rm -rf
> $(TARGET_DIR)/usr/share/alsa/;|)
> 
> Cedric, can you please have a look?
> 
> I think a good option may be to not remove the |$(TARGET_DIR)/usr/share/alsa/|
> directory in alsa-utils.mk <http://alsa-utils.mk>

 Peter did the "rm -rf" 11 years ago as part of the fix for
https://bugs.buildroot.org/show_bug.cgi?id=1573
but I think the intention was just to make sure that you could unconfigure some
options, rebuild als-utils and it would leave only the configured utils. That's
a scenario that doesn't work anyway, so it's OK to remove the rm.

 Regards,
 Arnout
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
