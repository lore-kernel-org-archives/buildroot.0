Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661BFC433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 04:29:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 218AA61278
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 04:29:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 218AA61278
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA2D7608B3;
	Mon, 18 Oct 2021 04:29:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id INUxhw1Knvvl; Mon, 18 Oct 2021 04:29:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B1DE608B0;
	Mon, 18 Oct 2021 04:29:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ECFA11BF2C5
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 04:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA1E440385
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 04:28:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z3QLg4O163NM for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 04:28:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 019BD401FC
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 04:28:57 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id i15so2635431uap.0
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 21:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EceacZzav5+syOKwzFCLrHUC4wrjH7js1pBXcJTUycY=;
 b=G9+Tp+erW33Av9Qo3lqUP8h2zAZgnDK7m6NyMT16KVn3PAP3irGIHJ+ibAGYX56av/
 hTORBMV/X51b8LARo33qLU8oIIu1j7/z9U4EiK2hmLwgmNpoQYACBGCvRzjZZMlUp0aC
 nGY591fBe/q5Q64jkPhxpUQJuzut3Z6O0N8sBm0m52HCV5sYmNwE+xxSaN+bAzbpG5j0
 roKQWdHkKk+aZ+TGVcYWC83M+zjzgc9uSJRAgtKkvoQVfJ31mUlVN1yWrjdXKd6h6X9i
 M1Bcl+gPREecXHHnAsLxNrLJRRMsysZu9XtzbtXQg/xk7oLPY6UUxYMa8W5gtixaYfEF
 ijsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EceacZzav5+syOKwzFCLrHUC4wrjH7js1pBXcJTUycY=;
 b=0zSBskkMN70O9aTZoiw96gzq5hKlYlFgBTwS9N4QtUXNvqe3YdQp4AaRLWUz9GqIk5
 BYwN94SnfrY0GDIVodUOMrIf4ilmQQab0PghEqCIO50go1dfk3UvguzbDLAJEdio7mxN
 g2zCFaUGW1u33E/gCym4PngsR02UX176XuNwJMgWNtwpv+G8BHyJDlPdsCI/ETyyG9A2
 aatCr2Mqf5Tm0VBH7Mj7/dI+L7Dm4hts9gdyVwKs9oGKHRH9l2UTuRyV26iGO6KRypz/
 H2qyktUxTe+9tqptYNg5L5JC/Qw7XqwSz4mQIk4MTFBDM1skfF+p0ky61yKihTc847rc
 a8mQ==
X-Gm-Message-State: AOAM533DLvfDNTr7c34pbPZOUA/VE1ZGA/FHwWf2RZdmLudf3hUapkLo
 lkf3/R1HPMhUoX9mHs1AFzMwb5Cosxnw3g==
X-Google-Smtp-Source: ABdhPJzLH/3VXPwnQOlRgJJ8yxSlc9B+MzZKuFbJ45YkajmIbZFB8o+7iH8TE7JeN4er6D9HxdGW3A==
X-Received: by 2002:a05:6102:38ce:: with SMTP id
 k14mr7233071vst.6.1634531336358; 
 Sun, 17 Oct 2021 21:28:56 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com.
 [209.85.222.52])
 by smtp.gmail.com with ESMTPSA id q200sm8238219vka.18.2021.10.17.21.28.55
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Oct 2021 21:28:55 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id u5so4510980uao.13
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 21:28:55 -0700 (PDT)
X-Received: by 2002:a9f:23d0:: with SMTP id 74mr23004015uao.131.1634531335059; 
 Sun, 17 Oct 2021 21:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211015125944.10587-1-peter@korsgaard.com>
In-Reply-To: <20211015125944.10587-1-peter@korsgaard.com>
Date: Sun, 17 Oct 2021 21:28:43 -0700
X-Gmail-Original-Message-ID: <CA+h8R2oSqdJLkx1Uxmipv7aG98OXLDLQ7XzbSHxdecLHksarYg@mail.gmail.com>
Message-ID: <CA+h8R2oSqdJLkx1Uxmipv7aG98OXLDLQ7XzbSHxdecLHksarYg@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/docker-cli: security bump to
 version 20.10.9
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
Cc: Christian Stewart <christian@paral.in>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Reviewed-by: Christian Stewart <christian@paral.in>

On Fri, Oct 15, 2021 at 5:59 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> Fixes the following security issue:
>
> - CVE-2021-41092: Ensure default auth config has address field set, to
>   prevent credentials being sent to the default registry.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Thanks,
Christian

> +++ b/package/docker-cli/docker-cli.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  cde34bbefd70fa27b44dfa904c40db84b89abf237e5267dcd08603b459a89253  docker-cli-20.10.8.tar.gz
> +sha256  d91010813824070dd2380013c8f343e61e6dda170f7853f024bda39b432b64ba  docker-cli-20.10.9.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
