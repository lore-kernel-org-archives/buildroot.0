Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDDDC77B61
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 14:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A4A460ACC;
	Sun,  9 Apr 2023 14:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A4A460ACC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x3H4oju2eJMz; Sun,  9 Apr 2023 14:18:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3912560B29;
	Sun,  9 Apr 2023 14:18:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3912560B29
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 763051C38DE
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 14:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B57D414A1
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 14:18:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B57D414A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SIADmrOk-gl2 for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 14:18:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6C9441498
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6C9441498
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 14:18:49 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id sg7so18498829ejc.9
 for <buildroot@buildroot.org>; Sun, 09 Apr 2023 07:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681049928;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+jwQ6r9eGIviwSN6DVCI9YOy4ltANmswA7PbR1UIYQg=;
 b=Kb3jlZDNsiXrG43Iq7FaIAxv13bFTlUXt06lQ/Ytw0yZcP4wK7Oxfc8RXtoCpnTh7M
 lH5PAdSUfoTUKL1F/yPZnxIbb2rdh1LFFl8gAq9ptc6NzZ5tSqbm4IVIqM4C60Wow8B5
 SQwwcyaDDv0UHXgISiyW/kT+qunnxwgG5hXlsfXM2q+T+tuFF5qurcDIvb3eBIb/4YqO
 4OM+xvOwKdMb/3Kb/X0yI8fj9Z0I84PaKPmh3caPj+lZSiw7oSJywkWoRN+T7SjgfSGD
 swvnFTQL7NZ6zs5U/0K7fWQcUqHmAsQD3Fd6DXj58QUvIsxGHnPfz1dT9v6ZljsOebqx
 052Q==
X-Gm-Message-State: AAQBX9fngyC0VZ+js4oV2xsJ3I4cuZWsNFZS3M+ZvTYPaHnNnIookx0Z
 mIi/La04Bxy1uCDts2d4um5Kpw==
X-Google-Smtp-Source: AKy350a85WJR1vLxvRwWUWJKExVb9G5xMP0rqt6u3JjsF/l9/tRplHwD2viM0ZQe5QWNVD1IkjavMg==
X-Received: by 2002:a17:906:8471:b0:939:90ee:e086 with SMTP id
 hx17-20020a170906847100b0093990eee086mr4826593ejc.28.1681049927847; 
 Sun, 09 Apr 2023 07:18:47 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 gs23-20020a170906f19700b008e53874f8d8sm4128358ejb.180.2023.04.09.07.18.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 07:18:47 -0700 (PDT)
Message-ID: <f97de9b1-9ad5-c1d5-2474-291a59ee6ae8@mind.be>
Date: Sun, 9 Apr 2023 16:18:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: Stefan Ott <stefan@ott.net>, buildroot@buildroot.org
References: <20230405173410.158297-1-stefan@ott.net>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230405173410.158297-1-stefan@ott.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681049928;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+jwQ6r9eGIviwSN6DVCI9YOy4ltANmswA7PbR1UIYQg=;
 b=GNN/5vPFtMap4nOVXuIQD4u0ac8AK927vFDykyv92wYkpLduoiu8I5id9Vrei8HFs2
 Lbg1vqF964/U7+309sDC6B6MSVEG4SrJ8C376nCNRSj8kGjBEw2No5XaYeqsz30l4NKO
 eMygD8FfXFBTIjFEMgkZp9AtpSEZ2P/ePP8NI1jApDY8udeljxt0Wv4u+XAMl5OfB/F7
 50Dx5NFBXw2S/KhLJvMQX0i9q3vh3T3KXofUgmyOuEUlF3gmGYlg5qEwTkaOydCAP4TS
 0qIzv5uOLcFtK1gxqqoMIYcUnqchbuyYEappTAOVJSaFB+cntSx1Sk0AnhBoP5yIM5qv
 HAGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GNN/5vPF
Subject: Re: [Buildroot] [PATCH 1/1] package/eudev: fix compile-time issue
 on very old kernels
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/04/2023 19:34, Stefan Ott via buildroot wrote:
> Kernel versions prior to 3.4 did not have V4L2_CAP_DEVICE_CAPS and

  It's kernel *headers*, not kernel. This got me confused for a moment, I 
thought there was a problem when trying to build on a system with a very old 
running kernel...

> compiling against such a kernel will fail.
> 
> This patch introduces a version check and makes eudev fall back to
> v2cap.capabilities on these kernels.
> 
> Signed-off-by: Stefan Ott <stefan@ott.net>
> ---
>   ...mpile-time-issue-on-very-old-kernels.patch | 29 +++++++++++++++++++
>   1 file changed, 29 insertions(+)
>   create mode 100644 package/eudev/0002-Fix-compile-time-issue-on-very-old-kernels.patch
> 
> diff --git a/package/eudev/0002-Fix-compile-time-issue-on-very-old-kernels.patch b/package/eudev/0002-Fix-compile-time-issue-on-very-old-kernels.patch
> new file mode 100644
> index 0000000000..63546079d6
> --- /dev/null
> +++ b/package/eudev/0002-Fix-compile-time-issue-on-very-old-kernels.patch
> @@ -0,0 +1,29 @@
> +Fix compile-time issue on very old kernels

  Please use git-formatted patches, especially sine the upstream repository is 
git [1].

> +
> +Kernel versions prior to 3.4 did not have V4L2_CAP_DEVICE_CAPS and
> +compiling eudev against such a kernel will fail.
> +
> +This patch introduces a version check and makes eudev fall back to
> +v2cap.capabilities on these kernels.
> +

Add a Signed-off-by line for yourself.  This is a short way for you to
assert that you are entitled to contribute the patch under the relevant license 
(in this case, eudev's LGPL2.1+).  See [2] for more details.

  Also, there should be an upstream reference, i.e. something like:

Upstream: https://github.com/eudev-project/eudev/pulls/...

(of course, you should first create a pull request :-)

  Since the Signed-off-by is absolutely essential, I've marked your patch as 
Changes Requested.

  Regards,
  Arnout

[1] https://github.com/eudev-project/eudev
[2] http://elinux.org/Developer_Certificate_Of_Origin

> +diff -Naur a/src/v4l_id/v4l_id.c b/src/v4l_id/v4l_id.c
> +@@ -28,7 +28,6 @@
> + #include <sys/types.h>
> + #include <sys/time.h>
> + #include <sys/ioctl.h>
> +-#include <linux/version.h>
> + #include <linux/videodev2.h>
> +
> + #include "util.h"
> +@@ -72,11 +71,9 @@
> +                 printf("ID_V4L_VERSION=2\n");
> +                 printf("ID_V4L_PRODUCT=%s\n", v2cap.card);
> +                 printf("ID_V4L_CAPABILITIES=:");
> +-#if LINUX_VERSION_CODE >= KERNEL_VERSION(3,4,0)
> +                 if (v2cap.capabilities & V4L2_CAP_DEVICE_CAPS)
> +                         capabilities = v2cap.device_caps;
> +                 else
> +-#endif
> +                         capabilities = v2cap.capabilities;
> +                 if ((capabilities & V4L2_CAP_VIDEO_CAPTURE) > 0 ||
> +                     (capabilities & V4L2_CAP_VIDEO_CAPTURE_MPLANE) > 0)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
