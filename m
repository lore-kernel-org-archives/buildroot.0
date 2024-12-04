Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41055E7716F
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 21:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD95D60744;
	Wed,  4 Dec 2024 21:57:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TAEZSx8fRiXW; Wed,  4 Dec 2024 21:57:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A527860837
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A527860837;
	Wed,  4 Dec 2024 21:57:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 91B7F1DD9
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7713A406C1
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:57:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hclnDjQHX9H9 for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 21:57:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 025EB405CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 025EB405CA
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 025EB405CA
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:57:06 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-385e3621518so212094f8f.1
 for <buildroot@buildroot.org>; Wed, 04 Dec 2024 13:57:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733349424; x=1733954224;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MqZyp3Q6sFTNKCc45DYbQ4BmtqOvIIRqatSMrFkJZbM=;
 b=stMcpOtkNKadKaU89c3lcBL513u2+HFElmRx9gFel9bXMk4jDcj/DCZVB8XY3eIuv3
 PKjE+7oNpxJpC13oy6tFly2HmdJ3YwqRPv6e6YlMuHqbJ0WhHUMet+VhhEYhDkNk6Qyy
 b6T+PO77yin6hOZIV4PP0C36zfDESvn12nB0W8f7HuHbfwj7sJs0eBiiQnKsk1QkgUgP
 +05jd5bBr1qsiA4WXIiHIB56xH21eiDIibvOBol7giMNadtrONGdfTXMRZpEYzjWKQzP
 LRAcMZZZ3dxWv2brELzBHVuFg0rFIUKxNzGqJ4LaM0/FA83xmNWVs3YQrIsBefjYf8aw
 AHMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBtezzKkF6zgOut8uxrPibZvyH3oNEFtDnnQolX+hsC2g08r9AdFjSyN5ooScLBByiGF3YE23tA14=@buildroot.org
X-Gm-Message-State: AOJu0YwdOAz72y/NeK7+ovWBGkee+1QFuBjy18r8N6vHoNkxHgkoNQaM
 qNtV6uPvrq597i+AHSWhTE8Pnotq4QS4OlmalF31azqx9WO6ZpZ/RGytnxdj+Zs=
X-Gm-Gg: ASbGncuDME3KKU5hpgfMhhEsdmHVvAIlPY0dz1dcx/v69rns6c+2X/rRtUYo2A/VYqQ
 grHiZgyM3JuCXi0Vj2UwoZxw2IP3yaIhK+fGI+h8pII0NXVjB4wrvuoRh930AxqS7hGgCqzhwFt
 5AjGtToTeIkOmBU26/Lav8407lOXiQLxY5Cspp6XYDmWTi/W2pOpWxnDZW+UbP5htO1qCVNYeR6
 xTtMcLv6u2KRzK2uoxXOviIJagWr1DvmwGCANwmL7CA74ZpHAY5YCoDzlqi2SKLEKhu6itneu6I
 266SdulJ8rMBjDQF4EuwaXcqKGFoO34Pn9f2lbMCdUTqi9a8IAPH/WrsXw4fS9X9Is67MOeTnVf
 QKyKG
X-Google-Smtp-Source: AGHT+IHeeXXHWMxLatLkm7Tv0T9/x89dZBUac8/q6PJ+xSmCdfQykiFphH09+BbtZAt7lUibZGqOhw==
X-Received: by 2002:a05:6000:a15:b0:385:df19:cbf with SMTP id
 ffacd0b85a97d-385fd40ad8dmr6121909f8f.28.1733349424466; 
 Wed, 04 Dec 2024 13:57:04 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3861fd465dcsm105101f8f.51.2024.12.04.13.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 13:57:04 -0800 (PST)
Message-ID: <500188ac-9a0d-4b70-9bd4-425b5a31ff01@mind.be>
Date: Wed, 4 Dec 2024 22:57:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20241102225644.692402-1-romain.naour@smile.fr>
Content-Language: en-GB
In-Reply-To: <20241102225644.692402-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1733349424; x=1733954224; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MqZyp3Q6sFTNKCc45DYbQ4BmtqOvIIRqatSMrFkJZbM=;
 b=ZcIQLRDeDu3fg7QL52Jo4OB1Hzm7RIG25NwdF+Kw5rhm3EMiocEevxo3ky0vwVl8IO
 I6inPMj98p3FPMykdnMKybn5ZOp99aUK7t6zOMBdKpH4DsxVd52zCuN52qY6fESI+CSV
 TDgPSyOsnPhVU8s5wEZMMqlS496nE/VTw8dXFgdOBMOj7cU++VOKY3tgV0i/BUn4FiAa
 unr/G8OQBTo8jlBEqRbV0pt7Imd5kPsjjq8lszwfLQ9/0LJUvBncfd6bLX7TTKp7SS5Q
 27KSUL6Xo50nq5kCw9L8oMTmfzbd/CBGic6S0jbv9Ywo4XC68klTjun5QfiCsZHKtREs
 RIcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZcIQLRDe
Subject: Re: [Buildroot] [PATCH] package/polkit: disable PIDFD when systemd
 is not available
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/11/2024 23:56, Romain Naour via buildroot wrote:
> Since the Polkit version bump 125, TestPolkitInitd fail due to an
> upstream issue related to the new PIDFD support introduced in
> Polkit 124 [1].
> 
> The PIDFD issue only affect OS without systemd.
> 
> Only enable PIDFD support when systemd is available until
> upstream fix the issue.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992596
> 
> [1] https://github.com/polkit-org/polkit/issues/451
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...-PIDFD-when-systemd-is-not-available.patch | 53 +++++++++++++++++++
>   1 file changed, 53 insertions(+)
>   create mode 100644 package/polkit/0001-meson-disable-PIDFD-when-systemd-is-not-available.patch
> 
> diff --git a/package/polkit/0001-meson-disable-PIDFD-when-systemd-is-not-available.patch b/package/polkit/0001-meson-disable-PIDFD-when-systemd-is-not-available.patch
> new file mode 100644
> index 0000000000..621b1feef7
> --- /dev/null
> +++ b/package/polkit/0001-meson-disable-PIDFD-when-systemd-is-not-available.patch
> @@ -0,0 +1,53 @@
> +From 51a1c5b5ab616fe0243b40baddb4864199bbe624 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@smile.fr>
> +Date: Sat, 2 Nov 2024 23:33:16 +0100
> +Subject: [PATCH] meson: disable PIDFD when systemd is not available
> +
> +Since the Polkit version bump 125, TestPolkitInitd fail due to an
> +upstream issue related to the new PIDFD support introduced in
> +Polkit 124 [1].
> +
> +The PIDFD issue only affect OS without systemd.
> +
> +Only enable PIDFD support when systemd is available until
> +upstream fix the issue.
> +
> +Fixes:
> +https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992596
> +
> +[1] https://github.com/polkit-org/polkit/issues/451
> +
> +Upstream: Not applicable
> +
> +Signed-off-by: Romain Naour <romain.naour@smile.fr>
> +---
> + meson.build | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 302c189..5c247f4 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -202,8 +202,6 @@ if enable_logind
> + endif
> + config_data.set('HAVE_LIBSYSTEMD', enable_logind)
> +
> +-config_data.set('HAVE_PIDFD_OPEN', cc.get_define('SYS_pidfd_open', prefix: '#include <sys/syscall.h>') != '')
> +-
> + # systemd unit / sysuser / tmpfiles.d file installation directories
> + systemdsystemunitdir = get_option('systemdsystemunitdir')
> + systemd_dep = dependency('systemd', required : false)
> +@@ -222,6 +220,10 @@ else
> +   tmpfiles_dir = '/usr/lib/tmpfiles.d'
> + endif
> +
> ++# PIDFD is broken with sysvinit based OS since 124 release
> ++# https://github.com/polkit-org/polkit/issues/451
> ++config_data.set('HAVE_PIDFD_OPEN', systemd_dep.found() and cc.get_define('SYS_pidfd_open', prefix: '#include <sys/syscall.h>') != '')
> ++
> + # User for running polkitd
> + polkitd_user = get_option('polkitd_user')
> + config_data.set_quoted('POLKITD_USER', polkitd_user)
> +--
> +2.45.0
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
