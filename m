Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1421FCD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 18:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACEBA81DF3;
	Mon,  1 Apr 2024 18:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ha4gl9ED8sjq; Mon,  1 Apr 2024 18:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6F4881DFF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6F4881DFF;
	Mon,  1 Apr 2024 18:01:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E44C61BF3A6
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 18:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0DC2404A3
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 18:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id thQZu3uvJIYH for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 18:01:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com;
 envelope-from=pholden@nklabs.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7465640103
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7465640103
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7465640103
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 18:01:05 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-29dfad24f36so3096125a91.0
 for <buildroot@buildroot.org>; Mon, 01 Apr 2024 11:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711994464; x=1712599264;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=78fFENKqRvhP82pBEPlxq/oyriZdB0HiQC8VqbZlKbA=;
 b=k/F6ddFt97xzbdF901eVi+2UwffXyEBMPLUHHi6W+qNZ9Ki+w4QJ6rtp6fim1Pev8Y
 MZaBp+l6e8fJL0qALIg3cSdDGuIIqSuUwe6kJ1qSZlqqarCwAqb/vO+f8qmHNL4WUdpq
 qhFoPCX/rQYYhpYbKyOueDry/twxspfDaF/ykMihQ7VTzvBBYjmmC3wKwW7LEqxjKv8F
 tdZR88SmNT0q6faht/XK/N1j2IBoAaoguSexGlKJGR9LuhzkSi1rr0xxHbZYDzdInPcX
 1ZsVewMxhsJekX24ckQsnRNDMmEc4Maj9kDyvi+rgWEQyaXGSBskra6M3m3qZoOaw2oH
 oj4Q==
X-Gm-Message-State: AOJu0YyCKIf2H4bqIb1NVOVdB/wq9zhtmofdvW1etvvz11Wd6mgKe2CK
 RpVnDIT1WAfTAZxwnRtShRN9h1g5DUaCgcYDZtvypUx/XYWOjgxBEeXsS3JqnC8cUKebmgD1SP7
 XlshJXBcVEIwB1UnlPdplGgThN0r04iP5NKUP4AaV3X2XXzkk2Qg=
X-Google-Smtp-Source: AGHT+IEcXz0hUaar3otdZ+OeS1lNcWDAipkkp4Ht6BvK6gCk1iUCpxZUiGu+dl3hAjrXNb4AUlnghejV3JmTs/qXsUM=
X-Received: by 2002:a17:90b:1102:b0:29b:972a:4990 with SMTP id
 gi2-20020a17090b110200b0029b972a4990mr7831167pjb.29.1711994464352; Mon, 01
 Apr 2024 11:01:04 -0700 (PDT)
MIME-Version: 1.0
From: Patricia Holden <pholden@nklabs.com>
Date: Mon, 1 Apr 2024 14:00:53 -0400
Message-ID: <CAJ6EmCfd_TZwz3=RKequ=1t1-2Q5FbHENkcrPTu0ebwMEWq_HA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nklabs.com; s=google; t=1711994464; x=1712599264; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=78fFENKqRvhP82pBEPlxq/oyriZdB0HiQC8VqbZlKbA=;
 b=NAitGPxchLLPRjhPNwXxL+k0I4Dnz1VC0FeKMC3mZMo4/IvdqfluycJPE8lWZt2kZX
 CV06aX1Hk4GAMUxod/1Upllkk8zeyPNOx5hbCs0uAtenEPlMSipEYfEBDmGDhXQsn21u
 d1mWsgu+uBtN5wZL21PwGeEHgVlk4T6mdGP4XUWMJiaTv8TZBDu5HrbhaS5xSSsVIgbK
 TaVo2PZoKkf80KIuafAEBKeCxrUDZ5Zmi72Dto0NxFSIiCDEeCdTtEEmUtpQq6Ka9NDu
 WlgiTczPudmo9HZLuYwhpaqbAuHvxFZuDOMkCqlEs8O9NAKVMlIqxqjkEWNZ8lQX1oRQ
 42qw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=nklabs.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=nklabs.com header.i=@nklabs.com header.a=rsa-sha256
 header.s=google header.b=NAitGPxc
Subject: [Buildroot] Is there an official browser patch for Buildroot?
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
Content-Type: multipart/mixed; boundary="===============4629660787760879254=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4629660787760879254==
Content-Type: multipart/alternative; boundary="000000000000e7e03d06150cc580"

--000000000000e7e03d06150cc580
Content-Type: text/plain; charset="UTF-8"

I found a few topics online about a patch for chromium, but they are dated
2018 or older.  Is there an official patch to add the chromium-browser as a
package for Buildroot?  Or how about "minibrowser", which I have also seen
topics in an online search?

Thanks!
Pat Holden, NK Labs

--000000000000e7e03d06150cc580
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I found a few topics online about a patch for chromium, bu=
t they are dated 2018 or older.=C2=A0 Is there an official patch to add the=
 chromium-browser as a package for Buildroot?=C2=A0 Or how about &quot;mini=
browser&quot;, which I have also seen topics in an online search?<div><br><=
/div><div>Thanks!</div><div>Pat Holden, NK Labs</div></div>

--000000000000e7e03d06150cc580--

--===============4629660787760879254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4629660787760879254==--
