Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E9CC00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 20:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2F9140116;
	Tue, 26 Jul 2022 20:12:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2F9140116
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y8JtRfQs-6dW; Tue, 26 Jul 2022 20:12:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B177400D8;
	Tue, 26 Jul 2022 20:12:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B177400D8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 137401BF3EF
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1E1F40101
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:12:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1E1F40101
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VOVleTHYVZBZ for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 20:12:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DE21400D8
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8DE21400D8
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 20:12:28 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 b21-20020a05600c4e1500b003a32bc8612fso12981wmq.3
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 13:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=IzO2T648h6o1OnqEW7ERhVM3IzPsO0kP9yuefgMGrWg=;
 b=YPEoP+hwfCzg+HsF6jB2I1bC0Lf405SA7BD+2sJVDfIUCVYUbKAHtZ6OKEbFpoHiR3
 JNXenZ9yFcyesfRf8dCPlOuQO1Np9Pt+k+D/VvPmPqnlYe20K8oT9IQJnB+5V916iULu
 O4ouTE5tdcVlKUrL58JwySPCVaqQpx9b65iNndBOQcftv7Aq7fQw9aFpMb9A8GEeq4zm
 tJ9w78hnTMs/ARK5y0ckSO28GAPVXPO9GsPCNoCf92vsmYhv/xb8BzYLKXCrgT8NW5m/
 HIKmiUTldse2+p1+vS0N7QEGir8Jg/5XDXUsuRJYAGtSE3631sh00CGlwHOabYfzg7JV
 iEdw==
X-Gm-Message-State: AJIora8tR8obfzITmRWHyI8UISE0EVsg0bvXmPUj+QnHxlkvbIiQP+ua
 rwu3gzvmvFHlWEdtGTmC5If9mg==
X-Google-Smtp-Source: AGRyM1v6b4Jg/SCJu4VaexJrJEpdBt/YF5gaXYri0LQzDXPC3Y4vF8dBcxYSDEEshxXsylWOaIeYyA==
X-Received: by 2002:a05:600c:1da8:b0:3a3:1969:b0d with SMTP id
 p40-20020a05600c1da800b003a319690b0dmr561378wms.172.1658866346752; 
 Tue, 26 Jul 2022 13:12:26 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a05600c1c9600b003a2e5f536b3sm23897111wms.24.2022.07.26.13.12.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 13:12:26 -0700 (PDT)
Message-ID: <2f0b64a5-9109-3341-abed-9367f6f6bae3@mind.be>
Date: Tue, 26 Jul 2022 22:12:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Peter Seiderer
 <ps.report@gmx.net>, Buildroot List <buildroot@buildroot.org>
References: <20220725152522.1579992-1-thomas.petazzoni@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220725152522.1579992-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=IzO2T648h6o1OnqEW7ERhVM3IzPsO0kP9yuefgMGrWg=;
 b=CISi7wOmjf/RcLYgWGwKOqdlQn+hTZP87d+7A5ZCW220H24FbSGRHMzYrrdUK/O7ox
 oSxmk8H4rzbTZHA99xPQznabbWIpEmbhIPcmwk6twDHcY+zCEpWqhvdl8CRb74lfCG5J
 L68MeNQarF7hv4QNz4qrt7tg2mKNU4tWUYXRR6DRmw/+dmFmgN6MElJ8aJjvF4QSwtW7
 3FGNw0a6KXkf25TJZ9BBC72pUyG+Y2m8JfQACy1KJAy72qcqeXgtuh3w5iP1bRTwzia/
 wxzJtS55yd4keEfixxwYPPvLIoWLTocTcCkpD7RAXvXlhrDUqgtEnP/O4HSWqMv3JF9v
 YWWw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CISi7wOm
Subject: Re: [Buildroot] [PATCH 0/5] Very initial Qt6 packaging
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



On 25/07/2022 17:25, Thomas Petazzoni wrote:
> Hello,
> 
> Here is a small patch series that introduce an initial, extremely
> minimal package for Qt6. Don't be excited too soon: it is so minimal
> that even GUI support is not included!
> 
> The goal of this series is just to get the process of Qt6 packaging
> started, and be able to progressively on top of this initial base
> rather than having one huge patch series to review.
> 
> I have taken some initial work from Peter Seiderer as a starting point
> for this series (for the double-conversion and libb2 packages), but
> for Qt6 I took a different approach than Peter in his initial series
> at [1]: I made the qt6base package strictly minimal for now.
> 
> The individual patches have more details, especially the patch adding
> qt6base itself.
> 
> Let me know if you have any question.
> 
> Thanks!
> 
> Thomas
> 
> [1] https://patchwork.ozlabs.org/project/buildroot/list/?series=229448
> 
> Peter Seiderer (2):
>    package/double-conversion: new package
>    package/libb2: new package
> 
> Thomas Petazzoni (3):
>    package/pcre2: add pcre2-16 to the host variant
>    package/qt6/qt6base: new package
>    support/misc/toolchainfile.cmake.in: add definitions needed by Qt6

  Series applied to master. Thanks for this work!

  Regards,
  Arnout

> 
>   DEVELOPERS                                    |  5 ++
>   package/Config.in                             |  3 +
>   package/double-conversion/Config.in           | 11 +++
>   .../double-conversion/double-conversion.hash  |  3 +
>   .../double-conversion/double-conversion.mk    | 14 ++++
>   package/libb2/Config.in                       |  6 ++
>   package/libb2/libb2.hash                      |  3 +
>   package/libb2/libb2.mk                        | 18 +++++
>   package/pcre2/pcre2.mk                        |  3 +
>   package/qt6/Config.in                         | 43 ++++++++++
>   package/qt6/qt6.mk                            | 12 +++
>   ...al-qsimd_p.h-fix-build-on-ARM-v7-due.patch | 49 ++++++++++++
>   package/qt6/qt6base/Config.in                 | 16 ++++
>   package/qt6/qt6base/qt6base.mk                | 79 +++++++++++++++++++
>   support/misc/toolchainfile.cmake.in           |  9 +++
>   15 files changed, 274 insertions(+)
>   create mode 100644 package/double-conversion/Config.in
>   create mode 100644 package/double-conversion/double-conversion.hash
>   create mode 100644 package/double-conversion/double-conversion.mk
>   create mode 100644 package/libb2/Config.in
>   create mode 100644 package/libb2/libb2.hash
>   create mode 100644 package/libb2/libb2.mk
>   create mode 100644 package/qt6/Config.in
>   create mode 100644 package/qt6/qt6.mk
>   create mode 100644 package/qt6/qt6base/0001-src-corelib-global-qsimd_p.h-fix-build-on-ARM-v7-due.patch
>   create mode 100644 package/qt6/qt6base/Config.in
>   create mode 100644 package/qt6/qt6base/qt6base.mk
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
