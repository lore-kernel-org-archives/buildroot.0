Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B84E6C433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:02:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15D8661B42
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15D8661B42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A96EB60A86;
	Wed, 17 Nov 2021 21:02:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UhENDADV956i; Wed, 17 Nov 2021 21:02:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0732260A83;
	Wed, 17 Nov 2021 21:02:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 44A111BF842
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F28540917
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:02:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CyZfNytA_7iy for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 21:02:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 089C3405F1
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 21:02:36 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id z5so16988544edd.3
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 13:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:cc:organization:in-reply-to
 :content-transfer-encoding;
 bh=7+HvgN9Hm8tozshbWaDfl7kgvScZGUa4lmAUurMEID4=;
 b=KynxE6gsLml+KhmxAhpXYFLi3pJiGgCW8sa/X65dSiH1oHtRZ9W6RMB48Wu98EOLQD
 37cxsUKpApd/M9aBC875bgYYQE0CdQN4A9WAA01tp8yWT3s0TzgcqeMUGcX7ggUew8Ib
 +Wr0bpF40HUvdlbjGWtieAUX/Igmytsu9t6cq9Ic8vJCOWRJWamFjNaP3wJTlVy8S4ik
 Eyqee1UyUqdU9zj3nMDK1HFDEnaxP/vjNhKhkFfrmLGDC61xx9h+q/9ny5rJFzclE9Y0
 LUxvdHHnTTCgAG6wiqRz/O+TwTvfZ5Ol1d2vRHNejEp0Vti8dw+iGZA2N6K2+f4hDm7U
 sgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:cc:organization:in-reply-to
 :content-transfer-encoding;
 bh=7+HvgN9Hm8tozshbWaDfl7kgvScZGUa4lmAUurMEID4=;
 b=tizVTIkPycS34yQ1xOyBAhM3YdrAXWP/SS9Zdu9v/eJTpbAiYBAJD0qdTThHmSXSkk
 5o40lLqxG9nbOhEGUIpRry4UmzmyabhDXKa6VgE0dD0m7ui6bsLdW3o/KKUNbvaa2hxd
 B+P9Lfg9uX1yYMv4kWlIeCI5A34n2WaYgou0YxeWoP48jxJQZo1aHoMl9UX+vbkqX5w5
 /O+Aq8oI4HChosptI6VRy8/baIP4CisMhnASg0KOwhaNzBSzgbA0BFRiukzEwt7kWSZr
 TLTVYuYpYt6dHrzmk1WtECUY2CEUuHodaHVBjbiib4RFsQgGhY9k7e5eACvK0zbswXLk
 yKsA==
X-Gm-Message-State: AOAM531fuzheDiYigdOmCesQiiClP4awY1pOznlq5ePsL6052vmX3EYo
 WIZz/Tr0ip52BeqR9NsUhl/ZRg==
X-Google-Smtp-Source: ABdhPJxfYpHIk7RFX3s9WVMCEZQ5sHUaLW0Aw1Dp8dmF8Qf1/dMMUnBelYzTyfjDQ3Po/W9Oc6aQGg==
X-Received: by 2002:a17:907:7785:: with SMTP id
 ky5mr25028624ejc.247.1637182954971; 
 Wed, 17 Nov 2021 13:02:34 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id gz10sm434579ejc.38.2021.11.17.13.02.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 13:02:34 -0800 (PST)
Message-ID: <2321c28a-a39c-790d-35fa-b52cf7cfeabc@mind.be>
Date: Wed, 17 Nov 2021 22:02:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
References: <20211025224403.979315-1-aperez@igalia.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211025224403.979315-1-aperez@igalia.com>
Subject: Re: [Buildroot] [PATCH 0/4] Update WPE WebKit (and deps) to 2.34.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/10/2021 00:43, Adrian Perez de Castro wrote:
> Hi all,
> 
> This patch set updates WPE WebKit and its dependencies to the latest releases
> of their current stable series. As often happens, I needed to make a patch to
> fix the build with multimedia support disabled, and that has been sent to
> upstream WebKit as well.
> 
> An additional patch to enable the new color management is in the series as
> well; but for the moment the support to build with libsoup3 is left out.
> I would rather submit that as part of different "add libsoup3 and enable
> where supported" patch set some other day ;-)
> 
> Cheers,
> -Adrian

  Series applied to next, thanks. Hopefully this motivates someone to fix the 
crash reported by James :-)

  Two small comments on two of the patches, which I'll make in-line.

  Regards,
  Arnout

> 
> 
> Adrian Perez de Castro (4):
>    package/libwpe: bump to version 1.12.0
>    package/wpebackend-fdo: bump to version 1.12.0
>    package/wpewebkit: bump to version 2.34.1
>    package/wpewebkit: use lcms2 for if available
> 
>   package/libwpe/libwpe.hash                    |  8 +-
>   package/libwpe/libwpe.mk                      |  2 +-
>   package/wpebackend-fdo/wpebackend-fdo.hash    |  8 +-
>   package/wpebackend-fdo/wpebackend-fdo.mk      |  2 +-
>   ...e-build-issues-with-ENABLE_VIDEO-OFF.patch | 78 +++++++++++++++++++
>   package/wpewebkit/wpewebkit.hash              |  8 +-
>   package/wpewebkit/wpewebkit.mk                | 11 ++-
>   7 files changed, 102 insertions(+), 15 deletions(-)
>   create mode 100644 package/wpewebkit/0001-WPE-GTK-Multiple-build-issues-with-ENABLE_VIDEO-OFF.patch
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
