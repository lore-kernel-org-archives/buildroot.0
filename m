Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74592C4320A
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 19:50:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3D26613A6
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 19:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3D26613A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D0E580EB9;
	Mon, 23 Aug 2021 19:50:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cWpKzpRFyPKk; Mon, 23 Aug 2021 19:50:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2329180EC1;
	Mon, 23 Aug 2021 19:50:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 927D61BF375
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 19:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EF4880EC1
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 19:50:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mq5S8pivhX43 for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 19:50:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1228C80EB9
 for <buildroot@busybox.net>; Mon, 23 Aug 2021 19:50:26 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id g21so27939633edw.4
 for <buildroot@busybox.net>; Mon, 23 Aug 2021 12:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0yRnUu/SoCQ1pKtxVK3onOBlLVSdYNCeW2Lihwpihtg=;
 b=PXqBaIddZcZVgP/qOaUih5d4un/IP2TvBk50ubMgRMtpJpqhPrUbj7z63hV0LOwRXW
 qrxiqZBzvFG2ZazI6Jl7xH4Y4QoGH7nKrNMCn9caejGgEvyuiiSO+czqPzYEid8bslIW
 WzNxwREdAWtWj2zZbWlWqxfoBmnnatJFwOwwPWcecMw5rZb/j3tPM61NDeimuEq8SsY0
 r/l1XxQakX1/5uSXFHVJ5LYEL7JlsRQecrIsKaYZ4FnOgVeMmwkAhmgIc2qOutQ+/sXF
 O36hHpsotf8Ph5HDa/+1AcWZ4HBXkYBTWyzI4NJpU/KivmS83uIS3JTHgL3uNmkk2byH
 lHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0yRnUu/SoCQ1pKtxVK3onOBlLVSdYNCeW2Lihwpihtg=;
 b=N9bF3VmKgeHFr6mvcovaGKBQDP7e96ADGKa09M1PFLh82LJFY7BilHd6HfRZ3R7qTV
 xAFiGi+gXAxpIzaTFUSs4yHb0QVM+FXccdsVCOnsUBxJg+1hq3DCUs7BceCYWl3Jlejx
 5nQV8cagXi04QzsxDllukivDyQzAsOkMP/OOznbcrZswtPRBhEWR/15KVheJkC0IAXit
 DYGlK27mMfpaMOew9J3w0+4ZczdeaPJrH75OVltspcOnvhG9jK36OXuutzQDAYzcYWDu
 W+j4E/41ExyYTiXLsHCcqLbpmJB4oCHNk40cc85Yh5XY31HSgJG0g7hzSp87B8LZghe3
 FWtg==
X-Gm-Message-State: AOAM53386aEhAWhA8bvd0fef4bpli15mFi+aD++oxY5Y2fFvlXQhuQWb
 R73oJ9HtMOHX45TdJCYCSAezL1wTPP2kPw==
X-Google-Smtp-Source: ABdhPJxfQ2FfMiN4zrkifommExBIxPtOsxnzyHjGgPw9AlOJAFTsUYS6oEiNLraa1aVpnnYrxWRPeA==
X-Received: by 2002:a05:6402:328:: with SMTP id
 q8mr39802767edw.84.1629748225167; 
 Mon, 23 Aug 2021 12:50:25 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id o26sm2914393eje.24.2021.08.23.12.50.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 12:50:24 -0700 (PDT)
To: Michael John <MJohn@midmark.com>,
 "buildroot@busybox.net" <buildroot@busybox.net>
References: <SJ0PR08MB65289DD5E9B820FAC5765B90AEF89@SJ0PR08MB6528.namprd08.prod.outlook.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <c9560456-1c8f-2472-0867-6f981fa43682@mind.be>
Date: Mon, 23 Aug 2021 21:50:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <SJ0PR08MB65289DD5E9B820FAC5765B90AEF89@SJ0PR08MB6528.namprd08.prod.outlook.com>
Content-Language: en-GB
Subject: Re: [Buildroot] Patching U-Boot
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 11/08/2021 15:42, Michael John wrote:
> Hello,
> =

> =A0
> =

> I=92m trying to add some project specific patches for u-boot. I=92ve crea=
ted the
> <global-patch-dir>/uboot directory with my patch inside that. I=92ve expo=
rted
> BR2_GLOBAL_PATCH_DIR and set it to this path of <global-patch-dir>. When =
I run

 That should work. However, when you say "export", you do mean that you set
BR2_GLOBAL_PATCH_DIR in the Buildroot config, right? It's not taken from the
environment, only from the config.

 Regards,
 Arnout

> make on buildroot it downloads u-boot and then configures and starts buil=
ding,
> skipping any patching. What am I missing in order to get my patches appli=
ed to
> u-boot?
> =

> =A0
> =

> Thanks,
> =

> Michael
> =

> =A0
> =

> CONFIDENTIALITY NOTICE: This message, including any attachments, contains
> confidential information intended for a specific individual and purpose. =
If you
> are not the intended recipient, you should delete this message and any
> disclosure, copying, or distribution of this message, or the taking of any
> action based on it, by you is strictly prohibited.
> =

> =

> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> =

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
