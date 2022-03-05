Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC2FC433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Mar 2022 14:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37AAA813ED;
	Sat,  5 Mar 2022 14:54:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JcppX9O5VpKU; Sat,  5 Mar 2022 14:54:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F1948136F;
	Sat,  5 Mar 2022 14:54:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A26B1BF616
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 14:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19C9B8136F
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 14:54:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 13EkB94HeQqj for <buildroot@lists.busybox.net>;
 Sat,  5 Mar 2022 14:54:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0B1E80BD0
 for <buildroot@buildroot.org>; Sat,  5 Mar 2022 14:54:24 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id hw13so23062316ejc.9
 for <buildroot@buildroot.org>; Sat, 05 Mar 2022 06:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=S0N5SL+lRi8dnGXAo31eK0TyPfcaUGC6fBtGqPUPzDA=;
 b=O/Fg07AjgYCltW18e53YLAjfKaJypowzceQF3Bcia9s8vx1ERzpL8g4l+7xH7NSD4C
 MkVZ0ODl0rE14VoQvOZAVonid8JnWPCHqSDQhb0kfY1z2Y3Rq74QHMCsLr2i3UOeSfgm
 gDkd/qrJ4EGogpvpY8js3yE29cojaEaCX4f8QcjhEy+79hB579sGZ6aaQo3xJxD3gFzL
 9gABOeTjJEqJJl+7hLn7emf+iAzmuXJuykm4WsHewbQp/5f2CyyzBN+aISSlPHLvAPEo
 9FwBAeO1q10EkAD/PBQXPu3zXHiK4YexsFaJSM0uUmlb+cyHYHi9P8vTaDw/NVImSSyD
 8Bvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=S0N5SL+lRi8dnGXAo31eK0TyPfcaUGC6fBtGqPUPzDA=;
 b=iLQfDHO1YkpjMu818jT6zia8nwx5b1/hopWmQZdlboWMfi+lAFtv7u6bu3wBxJuDfN
 frv9WyzNdYIPUoR/SpxM8ytpBI297GebmayLM6zcWX3EvkUJPC14L2cxguZIpOXMphF5
 +QGbImih2E5oHI1jXLf5AJ3NWQ///sJ4eCcUkEpusdQaoTXoJE6zwsd4B9UZ0wgDNa6k
 LPwf61fh1N0VNJKK4aV4U4yttnvYIT1Yu8H8J6zIGZpd+BsCa9B4e6KfXfqdRZdhGsdU
 Jn9bbAy/qRjqja3dMaAwUwIOs1zKopWCAEJFtLi+y0/lsxOXWuh3Aduhe1SSfH6vjYqK
 Qttg==
X-Gm-Message-State: AOAM531BCv6mAe+3NJ7WAAJhxxdOydetvgTW7or+So00WlKLuMWkVBA/
 A6hIensbLWCA1IesA5dlJsDqJw==
X-Google-Smtp-Source: ABdhPJwHPlMn745HELGjwTjoryzRkcfazxKy2i0bRYTwsRFed6feXe2UjZUniGuSzSGECR8Y5BIJzQ==
X-Received: by 2002:a17:907:7f1d:b0:6da:74b1:fd65 with SMTP id
 qf29-20020a1709077f1d00b006da74b1fd65mr3141282ejc.72.1646492063240; 
 Sat, 05 Mar 2022 06:54:23 -0800 (PST)
Received: from ?IPV6:2a02:1811:b032:6b00:cb7e:b535:458f:f512?
 (ptr-cyunlkwzu35hsouvwnm.18120a2.ip6.access.telenet.be.
 [2a02:1811:b032:6b00:cb7e:b535:458f:f512])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a170906829500b006cef3dcd067sm2955656ejx.174.2022.03.05.06.54.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Mar 2022 06:54:22 -0800 (PST)
Message-ID: <16d9e405-ee35-a02c-c17f-5abfd21d4b87@mind.be>
Date: Sat, 5 Mar 2022 15:54:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220217134637.3728619-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220217134637.3728619-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5base: put back riscv32
 patch
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/02/2022 14:46, Fabrice Fontaine wrote:
> Commit 5770a645a3a49a3f0f02972131a4ff5283b4c11e wrongly removed riscv32
> patch resulting in the following build failure:
> 
> In file included from thread/qmutex_linux.cpp:45,
>                   from thread/qmutex.cpp:806:
> thread/qfutex_p.h: In function 'int QtLinuxFutex::_q_futex(int*, int, int, quintptr, int*, int)':
> thread/qfutex_p.h:116:30: error: '__NR_futex' was not declared in this scope; did you mean '_q_futex'?
>    116 |         int result = syscall(__NR_futex, addr, op | FUTEX_PRIVATE_FLAG, val, val2, addr2, val3);
>        |                              ^~~~~~~~~~
>        |                              _q_futex
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/ff90bc7680acf1487ed58e5e25cf1a5f13dfaedb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../qt5base/0007-Fix-build-on-riscv32.patch   | 46 +++++++++++++++++++
>   1 file changed, 46 insertions(+)
>   create mode 100644 package/qt5/qt5base/0007-Fix-build-on-riscv32.patch
> 
> diff --git a/package/qt5/qt5base/0007-Fix-build-on-riscv32.patch b/package/qt5/qt5base/0007-Fix-build-on-riscv32.patch
> new file mode 100644
> index 0000000000..5561acb9ae
> --- /dev/null
> +++ b/package/qt5/qt5base/0007-Fix-build-on-riscv32.patch
> @@ -0,0 +1,46 @@
> +From 035dc537bee26e3b63a211b2835d8560439e161f Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 27 Aug 2021 16:28:32 +0200
> +Subject: Fix build on riscv32
> +
> +riscv32 fails to build because __NR_futex is not defined on this
> +architecture:
> +
> +In file included from thread/qmutex_linux.cpp:45,
> +                 from thread/qmutex.cpp:804:
> +thread/qfutex_p.h: In function 'int QtLinuxFutex::_q_futex(int*, int, int, quintptr, int*, int)':
> +thread/qfutex_p.h:116:30: error: '__NR_futex' was not declared in this scope; did you mean '_q_futex'?
> +  116 |         int result = syscall(__NR_futex, addr, op | FUTEX_PRIVATE_FLAG, val, val2, addr2, val3);
> +      |                              ^~~~~~~~~~
> +      |                              _q_futex
> +
> +Pick-to: 6.1 6.2
> +Fixes: QTBUG-96067
> +Change-Id: Ib6a9bcc496f37e69ac39362cb0a021fccaf311f5
> +Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
> +[Retrieved from:
> +https://code.qt.io/cgit/qt/qtbase.git/commit/?id=035dc537bee26e3b63a211b2835d8560439e161f]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/corelib/thread/qfutex_p.h | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/src/corelib/thread/qfutex_p.h b/src/corelib/thread/qfutex_p.h
> +index 40482b6fc1..037207a5c0 100644
> +--- a/src/corelib/thread/qfutex_p.h
> ++++ b/src/corelib/thread/qfutex_p.h
> +@@ -103,6 +103,11 @@ QT_END_NAMESPACE
> + // if not defined in linux/futex.h
> + #  define FUTEX_PRIVATE_FLAG        128         // added in v2.6.22
> +
> ++// RISC-V does not supply __NR_futex
> ++#  ifndef __NR_futex
> ++#    define __NR_futex __NR_futex_time64
> ++#  endif
> ++
> + QT_BEGIN_NAMESPACE
> + namespace QtLinuxFutex {
> +     constexpr inline bool futexAvailable() { return true; }
> +--
> +cgit v1.2.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
