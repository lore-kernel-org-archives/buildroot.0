Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D845CD3440
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 21:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE562402CD;
	Tue,  3 Sep 2024 21:15:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sbZEMoVkiGr7; Tue,  3 Sep 2024 21:15:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AE04402EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AE04402EC;
	Tue,  3 Sep 2024 21:15:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B4A231BF48B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0A5060674
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:15:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DsAIsJKKzOQT for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 21:15:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5C936606F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C936606F7
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C936606F7
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 21:15:24 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42c828c8863so22583075e9.3
 for <buildroot@buildroot.org>; Tue, 03 Sep 2024 14:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725398122; x=1726002922;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7Lsr7FzKNejN4K06WkgNXViQgucHZzh3+tyooVpGcRU=;
 b=wOEKGWGs5MoS5oWo88Rd0Wwf0h0TyeWJfarr1DPAiROl2P4OOYATzhQvXo7xXl6Kb5
 VyAIB5+RNJjwnjYMIPCyomM00XGurT476/mCTplU3YmxgpAERvchgk7m2uYiGth8qO2e
 RJCFOm4kJZWdrooYzUeHB9PbNIAACo6b9GVigiyu2ppQRAXd2QajjKMPNEjcTAlt5PIA
 uCmNYoCL6T2b8MQPfx1a5RWp5ZTOYqMNYg5P6N5eDsoWqLxc195PZ15x9PTlfU3IfA7Y
 tSBNpR2liRctSFbhgO3NSbSlQnmLLW4zoqLzWBPCmQh1pVHG/V1aixliQB+z9abgtXAq
 VaCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzwdMLo3yCWOLXOqVRLuhHvlw0X1VyabJUC5viy1UD/qRtWDGfe+Tvp5hvNVjr/1ADRe5cIuH6cjM=@buildroot.org
X-Gm-Message-State: AOJu0YzaIaJ/j+sNdkjJDdoLuyuTymLzermz3y67ltlNpSkY3/Vl4Aai
 W3HMv8ylsN4SUisb6kgAJ31j+s5TrRUWJYunwUbY77xqrPPyftV46H6sBr3BKFsiSCbZbuA4UI6
 Z
X-Google-Smtp-Source: AGHT+IEtDmdM9N5lCt0KlNGiMzMthj5IPhoU50eT8aV1JeEmf9CHZn+Uf/YPoUuGEyaf9qMQ++g3tw==
X-Received: by 2002:a05:600c:3b93:b0:426:6138:34b3 with SMTP id
 5b1f17b1804b1-42bd7042701mr90185515e9.5.1725398122232; 
 Tue, 03 Sep 2024 14:15:22 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749efb14bfsm15044449f8f.104.2024.09.03.14.15.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 14:15:21 -0700 (PDT)
Message-ID: <db9490ab-912f-4279-b3b9-801ad7a476bd@mind.be>
Date: Tue, 3 Sep 2024 23:15:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com, buildroot@buildroot.org
References: <cover.1722501946.git.yann.morin@orange.com>
Content-Language: en-GB
In-Reply-To: <cover.1722501946.git.yann.morin@orange.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1725398122; x=1726002922; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7Lsr7FzKNejN4K06WkgNXViQgucHZzh3+tyooVpGcRU=;
 b=g9uOQPfuth5zU9qcYRAJc1cn+ksePJv2ZzjO/YRNPLy9Wi3EnjUgTz6F9ml7U13Y8+
 nkUhRWLtTWg7WJo6yCHVvDMPkQ+jR1ck4mOW7ZGtXfyakZVOhr9OXwbAn/3H+V9x39L4
 vWTRLocCmyJZK0XZJzL2hZfBqGWVExYMGJmonpEQlDcVn8qD2YhqF7xKEWKwjcM1Btj7
 iQ7efNXj7iWFPhtxpvwj8N0QDnCT2cqMHNzzJGq5/Z0djFqQOlGJmIqqvgY8m5oq4zP9
 37xs+yg0ZDEHonPF4pcAwbKn9cU9lixm5l0AdqQVtkhRX/ZnYiceOQuzGW0EwFOCYfyn
 NVKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=g9uOQPfu
Subject: Re: [Buildroot] [PATCH 0/7] package/go: handle CGO linking for the
 host
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
Cc: Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/08/2024 10:45, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Hello All!
> 
> This series adds the necessary pieces to expose whether the go compiler
> has CGO linking support for the host.
> 
> The overall issue with the go compiler, is that we have a single one
> that can build for the target *and* for the host. Any limitation due to
> the target thus leak to the host. This is notably the case for CGO
> linking.
> 
> This series fixes that by adding a Kconfig symbol that represents
> whether CGO linking for the host is available. Then, it goes on to fix a
> few existing packages to add the new dependency.
> 
> Host variants of target packages that need CGO linking were found with:
> 
>      $ git grep -l BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS \
>      |while read f; do
>          [ -e "${f}.host" ] && echo "${f}"
>      done
> 
> Which returns a rather short list:
> 
>      package/delve/Config.in
>      package/moby-buildkit/Config.in
>      package/runc/Config.in
> 
> And thus they are all three fixed.
> 
> There are only two host-only packages:
> 
>      $ git grep -l host-golang-package package/*/'**'.mk \
>      |while read f; do
>          grep -q -E '\(golang' "${f}" || echo "${f}"
>      done
>      package/mender-artifact/mender-artifact.mk
>      package/skopeo/skopeo.mk
> 
> Skopeo is fixed in this series, as this is what prompted this work; so
> it leaves mender-artifact to check. I have no idea how to check whether
> a package needs CGO linking, though, so this is left as an exercise for
> any interested party... This is however rather theoretical, as the only
> hosts that do not support CGO linking (based on the target conditions)
> would be mips64 or mips64el hosts, and it is very doubtful Buildroot
> ever ran, runs, or will ever run on such hosts [0]; static-only or
> thread-less hosts are also not widely deployed either...
> 
> [0] git grep -E 'HOSTARCH.*mips64' returns nothing before this series,
>      so we have no special condition for running on mips64, which is a
>      bit surprising...
> 
> 
> Regards,
> Yann E. MORIN.
> 
> 
> The following changes since commit e321e81cf921346ec2d4cd1a9439016c7b2d3fb5
> 
>    configs/beaglebone: bump Linux to 6.6.32-ti-rt-arm32-r7 and U-Boot to 2024.07 (2024-07-30 23:44:30 +0200)
> 
> 
> are available as patches in this mail series,
> 
> for you to apply patches up to 5cb88f8337a63230f90e02423005ba169e307549
> 
>    package/skopeo: bump version (2024-08-01 10:36:24 +0200)
> 
> 
> ----------------------------------------------------------------
> Yann E. MORIN (7):
>        package/skopeo: add missing dependency on host go arch support
>        package/go: expose host CGO linking support
>        package/delve: needs CGO linking for host
>        package/moby-buildkit: needs CGO linking for host
>        package/runc: needs CGO linking for host
>        package/skopeo: needs CGO linking for host
>        package/skopeo: bump versio

  Applied the rest of the series to next. To avoid a merge conflict later, I 
also cherry-picked the first one from maser to next.

  Regards,
  Arnout

> 
>   docs/manual/adding-packages-golang.adoc |  3 ++-
>   package/delve/Config.in.host            |  1 +
>   package/go/Config.in.host               | 12 ++++++++++++
>   package/go/go.mk                        |  7 ++++---
>   package/moby-buildkit/Config.in.host    |  1 +
>   package/runc/Config.in.host             |  1 +
>   package/skopeo/Config.in.host           |  2 ++
>   package/skopeo/skopeo.hash              |  2 +-
>   package/skopeo/skopeo.mk                |  2 +-
>   9 files changed, 25 insertions(+), 6 deletions(-)
> 
> --
>                                          ____________
> .-----------------.--------------------:       _    :------------------.
> |  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
> |                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
> | +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
> | yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
> '--------------------------------------:______/_____:------------------'
> 
> ____________________________________________________________________________________________________________
> Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.
> 
> This message and its attachments may contain confidential or privileged information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
> Thank you.
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
