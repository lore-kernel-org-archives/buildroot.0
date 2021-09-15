Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD84BC433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 21:13:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB4C660FBF
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 21:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB4C660FBF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.buildroot.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5BFC60B47;
	Wed, 15 Sep 2021 21:13:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k8BTfmxD5m7x; Wed, 15 Sep 2021 21:13:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C3886077F;
	Wed, 15 Sep 2021 21:13:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F8D61BF2FB
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 21:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BAC56077F
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 21:13:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oMZQHZMgiX9o for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 21:13:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E5206076C
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 21:13:36 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 c42-20020a05683034aa00b0051f4b99c40cso5545210otu.0
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 14:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fASnRqgSNZFXt2tHayeb0oqU/4T/Fn3h58/Xku7rgXY=;
 b=dtAaKDYSOue7jznUrV1n3XwaxDRGE0fbBOVeKDTM/jU4FY6/YLwbflHtVvMD2jzO6m
 k4ezQ//OmLnE6sNf+rn2oN/wAUkbhM1MbF5yTzL/ojXGgSJL4kBOusQ3ayP/mWpY1w7K
 ACjSwge/RhWaEd5Li5Gff8NbirMW0KGTElytPV5n6bLqWIm4OlENDTYH/BR4jjpYsRh/
 Rx/VaUqUbEJshC2PzMKoO+ovpZ37CXWPcx0H+BDyNLCiJEzYTNtTV1Z+AUwuqg40vo7y
 v/9S70QrSJnh4hM54ich30VcgAW0QDJ3JetXF+tQ5ZnjRKxIN4JfE3UW6NtXcCGJgn7/
 DA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fASnRqgSNZFXt2tHayeb0oqU/4T/Fn3h58/Xku7rgXY=;
 b=7XYuL9j4frsO5psOFeKf0lfEW8NlZZp/P3m54iopxmBOwdlOj9bJ/r+qwsZpgPXFiu
 77ndslNLIf529pVa0jaOjErfZtvx4rUQAGvJiYwnr195pCPF9OUvlZLD6W/jv/LpJIuh
 YVrrnG8SYAqY9MFF/OLBpZuiNr0KkTvQWbzDsS2s2ywwy32mCV2FE4MgBDXkT2bWdmEx
 bkMlaFavNwih0Jut3MrOcteVYIP3c6mUVtDkmRwin8keQXTW6ss7pz3+hNRuW5Tvx5kw
 YDnFz6nu6Zpfo7zlByaE4ah0sNoj7JSiuisW+IGwkLIGLkzcQMhjJkWxnrDQRCfSoZzE
 rhyw==
X-Gm-Message-State: AOAM53350Q1vqPJ0tcV4wR30KCMcW5J6lvUMEyqCbhCqDI0Uxc/NNv7B
 EZaiqmb3x3FJPzpKzKSWN5AfatAMihx5Sg==
X-Google-Smtp-Source: ABdhPJyjVCVEvtsquaRrWVO+12iY+FeXJmAeeCLJbBxQNoskl9l09rwgfkewGZaDtwbsIKyVhQD+2A==
X-Received: by 2002:a9d:410:: with SMTP id 16mr1865362otc.83.1631740414909;
 Wed, 15 Sep 2021 14:13:34 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com.
 [209.85.210.52])
 by smtp.gmail.com with ESMTPSA id v2sm283865ooh.28.2021.09.15.14.13.34
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 14:13:34 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id
 m7-20020a9d4c87000000b0051875f56b95so5484128otf.6
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 14:13:34 -0700 (PDT)
X-Received: by 2002:a9d:70cc:: with SMTP id w12mr1819579otj.306.1631740414325; 
 Wed, 15 Sep 2021 14:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210915210126.1414751-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20210915210126.1414751-1-fontaine.fabrice@gmail.com>
Date: Wed, 15 Sep 2021 14:13:23 -0700
X-Gmail-Original-Message-ID: <CA+h8R2og81tVhZMiUcp9Et0A1Ciu-zJ0B5aqXM42GAb5F=xHSg@mail.gmail.com>
Message-ID: <CA+h8R2og81tVhZMiUcp9Et0A1Ciu-zJ0B5aqXM42GAb5F=xHSg@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/containerd: security bump to
 version 1.4.9
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
From: Christian Stewart via buildroot <buildroot@lists.buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Reviewed-by: Christian Stewart <christian@paral.in>

Thanks,
Christian

On Wed, Sep 15, 2021 at 2:01 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> - Fix CVE-2021-32760:
>   https://github.com/containerd/containerd/security/advisories/GHSA-c72p-9xmj-rx3w
> - Update indentation in hash file (two spaces)
>
> https://github.com/containerd/containerd/releases/tag/v1.4.9
> https://github.com/containerd/containerd/releases/tag/v1.4.8
> https://github.com/containerd/containerd/releases/tag/v1.4.7
> https://github.com/containerd/containerd/releases/tag/v1.4.6
> https://github.com/containerd/containerd/releases/tag/v1.4.5
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
