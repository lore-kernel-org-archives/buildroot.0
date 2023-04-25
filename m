Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D239C77B73
	for <buildroot@archiver.kernel.org>; Tue, 25 Apr 2023 20:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B22F160655;
	Tue, 25 Apr 2023 20:03:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B22F160655
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9MgkBdypgmL1; Tue, 25 Apr 2023 20:03:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CC5360681;
	Tue, 25 Apr 2023 20:03:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CC5360681
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 51A1C1BF83B
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 20:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35BB640491
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 20:03:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35BB640491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v3jtXpM-Kuq9 for <buildroot@lists.busybox.net>;
 Tue, 25 Apr 2023 20:03:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 932BB403CA
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 932BB403CA
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 20:03:35 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-94f7a7a3351so1173907266b.2
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 13:03:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682453013; x=1685045013;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Km/YBD5SIYEXzl39fnyuPDeXTB59Jhz/AmS6BO1QAAA=;
 b=Tyw0wZuV7TYUZ1lM4EBa1bpvsnE8ynTT3DTu6oBsR7+SsHvYKejb83+F0wl7R1j+c6
 6K/zbc4D/Cpx2ZBtuKGbNQGFPZsNTgdNKheZ2dNpWqWs6/ZmSoIuZVeehRWX1/XEQ9IO
 f/VthflTlF4z+Jky1JF53tDcqatO5Azj1AnhrJ/NgLfPMLvwb0H4JMyK15o7lIA5iOtw
 W4UiHYJ+lvBPnckCK3V2tgG6sf56j1G82NkgsoRlDZkZe6h9YdbwWiiYKYLlemBZtyk3
 3Krvt/Iw2vpTioQzIlSoBgoNOjS925H/a/48uRgsWJGOWj7tYh3c6Zt4/uMnGRLQTiVm
 uCKg==
X-Gm-Message-State: AAQBX9fkfaKNpBZaNdKe00DvRuOB9HnHtIpMxooPyDHW307P31SOE1x2
 Eqt+cbvxXFxZ5aADEXvL+ifpvg==
X-Google-Smtp-Source: AKy350YbItqUFlAbPVDRM5hXN+qCe9hHErsfGUBa0+KOWCitoG5o2WzNgMWtaqWWBK4UlvwR6ZAxyQ==
X-Received: by 2002:a17:907:a09:b0:958:4c72:8fdb with SMTP id
 bb9-20020a1709070a0900b009584c728fdbmr13367256ejc.64.1682453013358; 
 Tue, 25 Apr 2023 13:03:33 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 g25-20020a170906349900b0095336e8e012sm7271510ejb.176.2023.04.25.13.03.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 13:03:32 -0700 (PDT)
Message-ID: <84c4f200-8b8d-5b88-6a17-1cccbeecc3c8@mind.be>
Date: Tue, 25 Apr 2023 22:03:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: JiangXin <mc.xin@foxmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <tencent_E605AD09EB02769EC2D19F376A1239F80406@qq.com>
 <20230423164025.GL2696@scaer>
 <tencent_475A705644EC2785AB3F5ED47572AF096207@qq.com>
 <20230424154828.GP2696@scaer>
 <tencent_B90EBB4061EF4F1B15813C6A229F3698F505@qq.com>
In-Reply-To: <tencent_B90EBB4061EF4F1B15813C6A229F3698F505@qq.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1682453013; x=1685045013;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Km/YBD5SIYEXzl39fnyuPDeXTB59Jhz/AmS6BO1QAAA=;
 b=ahYN3dH3+dov4xCCdGNhK4qByOoFRFW/2JzTb8ZwhGak2zo0Qs2NOBpqNjHNzKNf6r
 F38LTHYSHBB2GzlZzcZDJlUBylvrivhx1N5B9I55kz7UIcCQVUWZmssXxnd1kuJBXQK6
 WrDcg10lU3cw7CgD1oCzluH8mUywJFwUjCkBOX2omfAhJHB8sT0KkP6EKhI+lJvMVYXy
 Zy9gYTJtFilVi5IWY/I4dXOetTc4JCYCzH/QmJwyLSC9n3AvOOzanf95ZHJ6ZBSkVUWd
 SsXHvsQj1AEHzheEU8YPftZO74lKXQsLRfYVW9t4PxSB/21CcX3z+sXrLl5MYCn9B8V7
 0svw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ahYN3dH3
Subject: Re: [Buildroot] 
 =?utf-8?b?5Zue5aSN77yaIOWbnuWkje+8miBbUEFUQ0ggMS8x?=
 =?utf-8?q?=5D_toolchain/helpers=2Emk=3A_add_the_processing_when_LIBPATH_i?=
 =?utf-8?q?s_a_directory?=
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi JiangXin,

  Please don't top-post, but reply inline like I do below. Note that this 
requires configuring your mailer to quote replies properly.


On 25/04/2023 04:25, JiangXin wrote:
[snip]
> Is it possible for buildroot to support distro toolchains? I'm interested in 
> using my
> spare time to do that. It can save a little time for low performance processors.

  You can use one of the Bootlin toolchains. It's the default if you select to 
use an external toolchain. I can't imagine that you have a configuration for 
which a distro toolchain would exist, but no Bootlin toolchain.

  Regards,
  Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
