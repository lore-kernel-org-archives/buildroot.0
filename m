Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28105C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 19:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC2F041884;
	Thu, 14 Apr 2022 19:43:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lBwuR-2KeUAt; Thu, 14 Apr 2022 19:43:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FD3E4187B;
	Thu, 14 Apr 2022 19:43:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 15D151BF290
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 041C160F8D
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:43:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X-KB1vKyrlsz for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 19:43:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21F68607F7
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 19:42:59 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id r12so690053iod.6
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 12:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1HEGYJ0vL6MHfR30vhiz/pQClw4+1pPhHbtJeiWJck8=;
 b=CdtIc0bIR5vOwoTvwXwyYh972EliuL2tEwpMHaeM7uOiTT4/wUZ6/pDyiMvEb5L/78
 dXY58+D1WfbPLjvHPT0nNfDXYM7jKpgxtAdkqFfB1dtSMO1SVpsQ/FQjEF26J30o5T3D
 GF26iODl1UK8sQUGn3BCbZQSdG5dNUVfXR7hwcmH/ssdx/IBRTRgt5MyRzIeizCOsJyV
 D4M8Qgq264uGRYaF49LbbxESZlz5uAEKAWcVyIfYyvEjD8HLH7uc/gvMMdtW3qvKmexy
 +y/ZEKTNp4lmSHzpyEDGXmq02rV8PqIrX/YeF9k6nIVQczf9RVIpzL9wqqGOqACefNHS
 y2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1HEGYJ0vL6MHfR30vhiz/pQClw4+1pPhHbtJeiWJck8=;
 b=mLCBNX5vEIHeld3GCHLAJfEjiYIPVPx20eJ0JpPt4lwIqNeXBfUX0AbAHMjlwnUo9O
 BDdAj/qajUS+QXa5E5XD8r0ehp2eEzMXEbDuKVCp0jWq6rKHhpeGLjQMbLQzr1Y5pLmZ
 /FbSWL87a9tfphvRmGZ8Vg2y8nA/BLH9QvMb2qD/IfntkobKDUQPDr+xa8TRi7v171Kg
 QgMTfGcBSXxrtWwtIIWNnl1/R58DSAO0GaTgvD3127r+1jj7pMHHTcv24yWdmbMd9vxC
 hSYtVHvolFsmVgbiQqQSPyVUly7lE8yx4THQZMuqrIJ5VSkx4TtQ9Hv0ewYwzUJY9/4S
 DFwA==
X-Gm-Message-State: AOAM531jwFhsYgDVBqq597ifZ8UQUckhOo6qyJjMf9ErqBlfyNsZ/Lqo
 kWSVH0tE5H23qnHB4lbm8t4iazZszCYHvQ==
X-Google-Smtp-Source: ABdhPJzSrwL7pdzoEErcx+YDMPAXfb4hl4PXu2phcp0sD+Dj0rMe/KguhPd89dX9GxqMVJdvmrxbBw==
X-Received: by 2002:a05:6638:14d1:b0:326:307e:9a37 with SMTP id
 l17-20020a05663814d100b00326307e9a37mr1780895jak.175.1649965378833; 
 Thu, 14 Apr 2022 12:42:58 -0700 (PDT)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com.
 [209.85.166.177]) by smtp.gmail.com with ESMTPSA id
 v11-20020a92d24b000000b002caacf87598sm1504707ilg.1.2022.04.14.12.42.58
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 12:42:58 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id r7so3741162iln.9
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 12:42:58 -0700 (PDT)
X-Received: by 2002:a05:6e02:12c6:b0:2ca:c0e9:df8c with SMTP id
 i6-20020a056e0212c600b002cac0e9df8cmr1691978ilm.232.1649965378044; Thu, 14
 Apr 2022 12:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220413141711.2529851-1-peter@korsgaard.com>
In-Reply-To: <20220413141711.2529851-1-peter@korsgaard.com>
Date: Thu, 14 Apr 2022 12:42:47 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pUPGeTL+gedUxm+mO9sO4NAfnVwBi0w92gFVGX8XTjYA@mail.gmail.com>
Message-ID: <CA+h8R2pUPGeTL+gedUxm+mO9sO4NAfnVwBi0w92gFVGX8XTjYA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH] package/go: security bump to version 1.17.9
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
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

I also sent a Go 1.18.1 patch, which now works w/ everything in the
tree (as far as I'm aware).

On Wed, Apr 13, 2022 at 7:17 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> go1.17.9 (released 2022-04-12) includes security fixes to the
> crypto/elliptic and encoding/pem packages, as well as bug fixes to the
> linker and runtime.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/go/go.hash | 2 +-
>  package/go/go.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/go/go.hash b/package/go/go.hash
> index 85e6adfb8c..507887eaaa 100644
> --- a/package/go/go.hash
> +++ b/package/go/go.hash
> @@ -1,3 +1,3 @@
>  # From https://golang.org/dl/
> -sha256  2effcd898140da79a061f3784ca4f8d8b13d811fb2abe9dad2404442dabbdf7a  go1.17.8.src.tar.gz
> +sha256  763ad4bafb80a9204458c5fa2b8e7327fa971aee454252c0e362c11236156813  go1.17.9.src.tar.gz

Reviewed-by: Christian Stewart <christian@paral.in>

Thanks,
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
