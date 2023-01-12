Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC21C54EBC
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 03:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99E0181C0A;
	Thu, 12 Jan 2023 03:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99E0181C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L6936Ew-C0U9; Thu, 12 Jan 2023 03:54:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D05B7813FE;
	Thu, 12 Jan 2023 03:54:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D05B7813FE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 38B2F1BF35C
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 03:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 147C16074C
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 03:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 147C16074C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vMx0rA40H4VN for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 03:54:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECA3560709
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECA3560709
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 03:54:12 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id v30so25149567edb.9
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 19:54:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jrfHWpNJm6rRcA2qHw74q6uce1eAASpdruPeU2mvF70=;
 b=EQ1sNia7GgtSSm/O/OyCsF73F5FZ9agkHNrQLf9LGLfuhoLhSAiRDBRFr0ERPXv9Jz
 TCqgD5iRN/ESRW9ZsOc0wAVG2Eth36YGKoFr1Xz0k2m51EcmHCmavv8ylgEz0Z5bf6GD
 +GlHxOBR/wAz8NkZVjchwvaOGGRP3orI2iANAQup3Ta1UeSwvE5JdMAvPQh/pNAwbyiz
 mzIuTM+fTXvLS34a6M+5trIY1kHwWoBaVdLwg59ioNkgGFuEnWihkrnYC0bDj3fLwikg
 M4D1YzmuzLAx3nEGzOuIy1WRfsAgUrJ7VqTATYG36qQTDRk6OC94HwxjZ1RSSy7DBydF
 gTWA==
X-Gm-Message-State: AFqh2koGP84xxKFx8zIrlxTYGVa4wU0ypGNAwjYIguRZbMfOkRXkZwct
 4oD4Eji+/l7AYW7MtUlC9QzmWugD6NxCkvyT
X-Google-Smtp-Source: AMrXdXsT4b9ZXgMEuLdJIeib6U+A4SsAtVOkY8mwWNewM/AaI6xq/ZArpIqo7KyTA+MLlmEBxZrLFw==
X-Received: by 2002:a50:a401:0:b0:46d:53d7:d21e with SMTP id
 u1-20020a50a401000000b0046d53d7d21emr67982585edb.27.1673495650510; 
 Wed, 11 Jan 2023 19:54:10 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com.
 [209.85.218.54]) by smtp.gmail.com with ESMTPSA id
 bg14-20020a170906a04e00b007c094d31f35sm6977476ejb.76.2023.01.11.19.54.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 19:54:09 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id az20so22685293ejc.1
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 19:54:09 -0800 (PST)
X-Received: by 2002:a17:906:869a:b0:7c0:f716:e395 with SMTP id
 g26-20020a170906869a00b007c0f716e395mr5222072ejx.160.1673495649345; Wed, 11
 Jan 2023 19:54:09 -0800 (PST)
MIME-Version: 1.0
References: <20230108191514.10360-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20230108191514.10360-1-fontaine.fabrice@gmail.com>
Date: Wed, 11 Jan 2023 19:53:58 -0800
X-Gmail-Original-Message-ID: <CA+h8R2pY1FbfLn2ZYbvRJ5B6fy7weWdh-JQNavHct0w+iz5WOA@mail.gmail.com>
Message-ID: <CA+h8R2pY1FbfLn2ZYbvRJ5B6fy7weWdh-JQNavHct0w+iz5WOA@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jrfHWpNJm6rRcA2qHw74q6uce1eAASpdruPeU2mvF70=;
 b=fdo1eQa8Ia7kfqTDUkIamJEYETWqQtYU52oYQmT+ZajCY4Ar0iS8dtHertqyjvju7L
 r8ZgUMUnqh8/6UEiXzx2A0D5Rj8t7knMMluKOifsXQzFTHTjKVWzI0XhVjN26aQ9O3Bf
 HNUTxFOc9lOEOQIejyiDcrUi/wJTndFhp7/cWbqdv2ZCgvy6N9qJsvw60evkSynAT4li
 Ilfn2Cx8B1IufUAVIRxsr3A1/XT50nbwUcEc5EnGy2Lyn3PPSOlmpXk+QXRMB86RjQyx
 VBF3k5TFgUlMoRjbT82Hqxj0FmMlbE9gRf66eG5yf5Bgog2b7Le3qW+NEovYDqJqSL3e
 8iMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=fdo1eQa8
Subject: Re: [Buildroot] [PATCH 1/1] package/crun: needs gcc >= 4.9
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

On Sun, Jan 8, 2023 at 11:15 AM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> crun unconditionally uses atomic_bool when libgcrypt is found since
> version 1.7.1 and
> https://github.com/containers/crun/commit/40f66c0a74b8d918ecc7ae9228dca32a4fd71084
> resulting in the following build failure with gcc 4.8 since commit
> 6987b92da510a8c8b9534a22506850c163d0f035:
>
> src/libcrun/seccomp.c: In function 'calculate_seccomp_checksum':
> src/libcrun/seccomp.c:374:3: error: unknown type name 'atomic_bool'
>    static atomic_bool initialized = false;
>    ^
>
> Fixes:
>  - http://autobuild.buildroot.org/results/924806ffd6d83cd6d8226577c3877b0b8ca2722d

Reviewed-by: Christian Stewart <christian@paral.in>

Thanks!
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
