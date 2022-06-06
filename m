Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCEBC43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 12:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 154B7416DB;
	Mon,  6 Jun 2022 12:47:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IHlpDMo8nKze; Mon,  6 Jun 2022 12:47:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B67E0416F4;
	Mon,  6 Jun 2022 12:47:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F32851BF339
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1B6540122
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:47:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ub2lBbEvTDDH for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 12:47:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 914B1400FD
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 12:47:20 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id 25so18404085edw.8
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 05:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=CY44B/9MgCMYXN9ANr/fw4yyTCxpdSxYeudwJr7iDjo=;
 b=ObdiPof5KK6j7g9oJl3ed/MHF46bBhv5NDPeE8v4Yolt2p13LwqbbadtjheN/davkg
 CEjE2H4b0zyC/flg18oReAFmpYFBGCYgYiLatjred2M1sZZIB7+Beoj3b2/omy0v/TRF
 7IqUhfblJWUCtWqxeq617x4hTDE3o81mZkZjc5CdM5Wbaxe/Y1FFWMJcGEgroujzzzrx
 eckt+jeeCtYNlASpzFtpNeDUXvodirL+Zhi+3/UXUdsII5S6d2qD2eHHzjWMEAwtZA1H
 oDP6fWzbYQ3W1zYdxKZmZaj+R9+tNR7hI2pVbhnvzVnPVsU8oipMPWzOnOKHTD3TtOuy
 xZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=CY44B/9MgCMYXN9ANr/fw4yyTCxpdSxYeudwJr7iDjo=;
 b=R2sQ4vY+qrVANONv9Io6pgXnj7KcK1j4NpR0SCenbZ97YGKXyl1G/FJSyx+olJ9KWr
 YdzjsHTUtxJfdekpjgSCYGmeWm1SbngqoAFi5l6oD5bZM1qVSyb4g9+/3+KGh9s+EGTi
 bq/VQ5KWNF9Uaqr1fzzq3I4/NrtfLrZwIypk6Qfk1guQcHOOwvS/2QffUGMKkufVWwqU
 iLkiydj3L+grTr53WnZZkNUv1I3eQb3BSTEu8T5SyLPksoqEtTw8GZjs16hF4tgXcBro
 FF/uiI/BAF4gv8lftAwF0NYTCfqP2yNrGaeZJzLD3tQ8q0plPmiHzR4zHwECuNecU026
 MUTQ==
X-Gm-Message-State: AOAM532hRyFvcB7iFXZEGWBpGfZkXZkqPHtmlTWdsZacOcM2zPSlCyDW
 O5x6jQoDc78OiGGNWCuWuho+Cw==
X-Google-Smtp-Source: ABdhPJx4WyFf135EOLW4pjFVPbAN9raySXrkv7iZbxXH8z3VmdJX9LoRs/D0dty+gaHd4fq7b9LdXA==
X-Received: by 2002:a05:6402:2682:b0:42e:1c85:7ddc with SMTP id
 w2-20020a056402268200b0042e1c857ddcmr22910055edd.143.1654519638613; 
 Mon, 06 Jun 2022 05:47:18 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a1709061dc900b006fea59ef3a5sm6308013ejh.32.2022.06.06.05.47.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 05:47:18 -0700 (PDT)
Message-ID: <d1270c5f-5efc-d071-2df0-b1c7e44dbc4f@mind.be>
Date: Mon, 6 Jun 2022 14:47:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220518211200.431651-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220518211200.431651-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/openvpn: fix pam build with
 musl and libressl
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/05/2022 23:12, Fabrice Fontaine wrote:
> Fix the following musl build failure raised with pam and libressl:
> 
> auth-pam.c: In function 'pam_server':
> auth-pam.c:894:23: error: 'PATH_MAX' undeclared (first use in this function); did you mean 'AF_MAX'?
>    894 |     char ac_file_name[PATH_MAX];
>        |                       ^~~~~~~~
>        |                       AF_MAX
> auth-pam.c:894:23: note: each undeclared identifier is reported only once for each function it appears in
> auth-pam.c:894:10: warning: unused variable 'ac_file_name' [-Wunused-variable]
>    894 |     char ac_file_name[PATH_MAX];
>        |          ^~~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/c8834fa5ddcac6fd22fc9406e10221e64cdb8856
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...h-pam-c-add-missing-include-limits-h.patch | 41 +++++++++++++++++++
>   1 file changed, 41 insertions(+)
>   create mode 100644 package/openvpn/0001-auth-pam-c-add-missing-include-limits-h.patch
> 
> diff --git a/package/openvpn/0001-auth-pam-c-add-missing-include-limits-h.patch b/package/openvpn/0001-auth-pam-c-add-missing-include-limits-h.patch
> new file mode 100644
> index 0000000000..34a6dbd034
> --- /dev/null
> +++ b/package/openvpn/0001-auth-pam-c-add-missing-include-limits-h.patch
> @@ -0,0 +1,41 @@
> +From 0fed64a91d894b46105bf7e8b16edea4d90ab70c Mon Sep 17 00:00:00 2001
> +From: Antonio Quartulli <a@unstable.cc>
> +Date: Thu, 21 Apr 2022 15:19:09 +0200
> +Subject: [PATCH] auth-pam.c: add missing include limits.h
> +
> +On most systems limits.h is pulled in by some other header and thus no
> +error is ever triggered, but it's possible to find the right environment
> +which lackis this and prevents compiling auth-pam.c (possibly when using
> +LibreSSL).
> +
> +Include the header explicitly as it includes the definition of PATH_MAX.
> +
> +(note that this bug is fixed in Gentoo since 2020 by including a custom
> +patch, but apparently the issue was never reported upstream)
> +
> +Reported-by: Michelangelo Scopelliti <kernelpanic@gmx.com>
> +Signed-off-by: Antonio Quartulli <a@unstable.cc>
> +Acked-by: Gert Doering <gert@greenie.muc.de>
> +Message-Id: <20220421131909.32053-1-a@unstable.cc>
> +URL: https://www.mail-archive.com/openvpn-devel@lists.sourceforge.net/msg24136.html
> +Signed-off-by: Gert Doering <gert@greenie.muc.de>
> +
> +[Retrieved from:
> +https://github.com/OpenVPN/openvpn/commit/0fed64a91d894b46105bf7e8b16edea4d90ab70c]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/plugins/auth-pam/auth-pam.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/plugins/auth-pam/auth-pam.c b/src/plugins/auth-pam/auth-pam.c
> +index f893b51fe3..7033944568 100644
> +--- a/src/plugins/auth-pam/auth-pam.c
> ++++ b/src/plugins/auth-pam/auth-pam.c
> +@@ -47,6 +47,7 @@
> + #include <fcntl.h>
> + #include <signal.h>
> + #include <syslog.h>
> ++#include <limits.h>
> + #include "utils.h"
> +
> + #include <openvpn-plugin.h>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
