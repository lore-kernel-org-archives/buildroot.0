Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3BCC19F32
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 13:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1E9260770;
	Fri,  7 Mar 2025 13:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aO63GZbMqOOG; Fri,  7 Mar 2025 13:40:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC52160784
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC52160784;
	Fri,  7 Mar 2025 13:40:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 22CC41C9
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 13:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E835F4060D
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 13:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Xv7Dbckc42D for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 13:40:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 87B1B4056E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87B1B4056E
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87B1B4056E
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 13:40:32 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5e5dce099f4so1983814a12.1
 for <buildroot@buildroot.org>; Fri, 07 Mar 2025 05:40:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741354830; x=1741959630;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d0laVk1m7Zwzm4V1vyhtdyCkReFqQnlUo7YzyUy6YxA=;
 b=fp2YEr13YLMeGFugqsX+7FF/mrgSk/oY3kvo+NyjS/7/uoL3aWq26F/+es0Jwg00G6
 h1YwIM4oWw12yQaJTqsmHBPKOq/GgVPlxcO/FTreu8sHFWVTn+wUvinQJBWxvFtfzqMh
 pA2lRaK+bbb37k6g0AmEsUPtNuFJQ1c/vP3BvvRehBaZvRiRGOG1I4rY+MrLei2tAQlc
 UMeS6oH2tNKZIittPJteEyNsuzNSQWXjAtj2JFAWal8vP3k17yFn0fKNEFHrOuazjXGA
 zf6LQltqnIpbYWvh/dnPcWmia5E1LLrTGH7bUn6zH2v/zZ30Dx2fhmPyAFgZ8vlvYmgm
 37pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBNSnWQyfLmNb1UjjklLeI3crxWwWZXa5vG4grb6rMsJmBUXYDQ6r1/TlCBjSKUTJCsVOYftoQ048=@buildroot.org
X-Gm-Message-State: AOJu0YxrpZiiqH9BJ0dJNFsgCeK6KE5+fwQnqsOhOvLHaxAohBqf7yhZ
 HNCMziAj3Rov/OVH41aLGcHpV67Rs/NQkT0UbjMu06PppND7FVJx
X-Gm-Gg: ASbGncuqplDLawlG6WKCguyTEQVHDAYB52x8WX3yfi88Tg/mi9YEJfVQ/rM/5fUh6sq
 q/ij9CLxoJAYxxlprTHqNcqkh5lxNjRTcTh5yRN+2x9HZauF1LvQxakN8gAdXZBOIVS4oxiTlmQ
 RF1U55H0p9GZYduyxAB/2VWLLoxQrp0sHHLovADnpV0Q3y649wufbhrufpsCXml7MTaruSInTsS
 6M+W4xmDBIFmA0byYrXacvJzltnM5yE1yL/I8uh/s6AhdYjRoTqlKi2CG+6c/ya8ZDHKwoartSP
 LZKE6kHdEFAO9C7wbg3kG8/1+8VLDczT4etIBfXP5jQs02iKHFpbsB4gOjJQmckFnFs=
X-Google-Smtp-Source: AGHT+IGei7NgzymL3UiyfvkcMW2utLnpfprVO+FelLeIEwgjTB3IPgddFOmig50mvymLylbSkEkQUA==
X-Received: by 2002:a05:6402:4021:b0:5e5:e78a:c4ff with SMTP id
 4fb4d7f45d1cf-5e5e78aca7dmr2977624a12.27.1741354830242; 
 Fri, 07 Mar 2025 05:40:30 -0800 (PST)
Received: from ?IPV6:2a02:8070:2483:7e00::f0b8? ([2a02:8070:2483:7e00::f0b8])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e5c733f4c3sm2656926a12.14.2025.03.07.05.40.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 05:40:29 -0800 (PST)
Message-ID: <549206ba-180d-4ee1-9a5b-a9d99ab2d3d1@gmail.com>
Date: Fri, 7 Mar 2025 14:40:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>, Julien Olivain <ju.o@free.fr>
References: <cover.1740841539.git.yann.morin.1998@free.fr>
 <dee1cb43f9e636b7ccdc7d4602ae0ab438952c3a.1740841539.git.yann.morin.1998@free.fr>
Content-Language: en-US
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <dee1cb43f9e636b7ccdc7d4602ae0ab438952c3a.1740841539.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741354830; x=1741959630; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d0laVk1m7Zwzm4V1vyhtdyCkReFqQnlUo7YzyUy6YxA=;
 b=dNBHdGM8nd4bkwD71Jvqgxscqd57XPQNP0om4+8YbYMd8L167GyV8CfPXp/2CSnSwL
 uwscm8Or/lpBvXR1QHdmiOWE+wVMuM+jOfv9B1d5jeUsPhaNnDwHiXRXPTB4eIoGyet2
 IU2Lsg6IV+nxJzv8yo8OqgAs1Nu179VLyyLU1zrVxrOuradFqH7haRGJD13MyaFPnpy/
 O/9XKNBJjbgEoj+IGOixhJ7AOGEe8gwQOLR86KEnjLzC/oexixc+FrWN3QzxBKcuznEX
 Pp24E7s898fCFLg59mhgTPhJ+zNzK17550iVyMsHm0VGwCWubnU8Ge+4xleMaDkD0noX
 k+Ng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dNBHdGM8
Subject: Re: [Buildroot] [PATCH 9/9 v3] package/podman: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann, All,

On 3/1/25 16:05, Yann E. MORIN wrote:
[snip]
> 
> The documentation [0] states that seccomp can be disabled (i.e. not
> enabled), but we were unable to start a container without seccomp
> support in podman. So we make that mandatory.

You can start a container without seccomp by passing the
--security-opt=seccomp=unconfined` option. But it is okay for me if it 
is mandatory.

> 
[snip]
> 
> Similar to Docker, podman can inject a minimalist init as PID1 in
> containers, and like Docker, this is optional; podman however can only
> use catatonit as such an init [2]. Given the size of catatonit (1.3%
> that of podman!), we do not bother to make it optional, and always
> enable it as well.

I think systemd can also be used as a init. According to the 
documentation [1].

[snip]
> +	select BR2_PACKAGE_IPTABLES  # runtime

I am sure that you do not need iptables if you are using nftables.

[snip]
> +		$(PODMAN_PKGDIR)/containers.conf \
> +		$(TARGET_DIR)/etc/containers/containers.conf
> +	$(Q)$(INSTALL) -D -m 0644 \
> +		$(PODMAN_PKGDIR)/policy.json \
> +		$(TARGET_DIR)/etc/containers/policy.json
> +	$(Q)$(INSTALL) -D -m 0644 \
> +		$(PODMAN_PKGDIR)/registries.conf \
> +		$(TARGET_DIR)/etc/containers/registries.conf

Just for curiosity, why not installing those files under 
/usr/share/containers?

[snip]

Thanks for your good work.

Regards,
Raphael Pavlidis

[1]: 
https://docs.podman.io/en/latest/markdown/podman-run.1.html#systemd-true-false-always

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
