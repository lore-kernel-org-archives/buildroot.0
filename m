Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB435C4167B
	for <buildroot@archiver.kernel.org>; Fri, 30 Dec 2022 09:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 315E36079E;
	Fri, 30 Dec 2022 09:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 315E36079E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5zkjXcV7DPqj; Fri, 30 Dec 2022 09:24:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7C0C60640;
	Fri, 30 Dec 2022 09:24:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7C0C60640
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD7851BF271
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 09:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 959FB80B6D
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 09:24:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 959FB80B6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AtKVijvIXlfK for <buildroot@lists.busybox.net>;
 Fri, 30 Dec 2022 09:24:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44CCF80B4B
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44CCF80B4B
 for <buildroot@busybox.net>; Fri, 30 Dec 2022 09:24:39 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id l29so22723190edj.7
 for <buildroot@busybox.net>; Fri, 30 Dec 2022 01:24:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+UbCZZT5OS0wphw2AKcBDg5iezwInYvJqQvcJDtUSe0=;
 b=YI0Wrb6Xdeag4n/HzEB/KKqAtSxueeeoeEJFtsvdAo0ij/TA037LGM59kxAKFDZMTd
 Y922AA1l6Fb+85s2MRlryz69mWp9UsXQFfge5kMpyhVa2dU73DIgsziFD1HRG2UZRovb
 p3zxlNPTiENkNRxDkTkxDPMz6A7sljTqtiOv4ANqBUrkcFxSNzxrKEkjNCDptxVJ4QPV
 Qo9bulec68l39kQ2milZEWXGGLJxN5peC3xh5nxsuUDo8v4dO8l12tlJTjODwf22exfy
 BnJKTgM0v3pG1I7QlJnSpwkV87ZetSsalGbeTCghK19XaddfjSjoXH7qMiMKUSLSieC+
 24fg==
X-Gm-Message-State: AFqh2kpFU9HSygDo7gM5WUzQBgKXi7b6lx6i3PdwZUQw6XFkq2iQ1RMF
 0QjMlU8N5TZamb5iD1YjeIlGQJ9sVVT8S9wHahw=
X-Google-Smtp-Source: AMrXdXuGzNKkia9c73HlDOEcAApX+tJvvZ9uR++J+qkdPByViEwcwL+RIsag0hx8/JvaFdQwjuSFyA==
X-Received: by 2002:a50:eac6:0:b0:461:d042:80db with SMTP id
 u6-20020a50eac6000000b00461d04280dbmr26583793edp.0.1672392276861; 
 Fri, 30 Dec 2022 01:24:36 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com.
 [209.85.218.45]) by smtp.gmail.com with ESMTPSA id
 kw5-20020a170907770500b0081d2d9a0b45sm9463480ejc.186.2022.12.30.01.24.36
 for <buildroot@busybox.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Dec 2022 01:24:36 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id fc4so50159429ejc.12
 for <buildroot@busybox.net>; Fri, 30 Dec 2022 01:24:36 -0800 (PST)
X-Received: by 2002:a17:906:4b57:b0:7c0:eb33:e7c2 with SMTP id
 j23-20020a1709064b5700b007c0eb33e7c2mr4147799ejv.666.1672392275752; Fri, 30
 Dec 2022 01:24:35 -0800 (PST)
MIME-Version: 1.0
References: <20221230034540.1073086-1-christian__36217.5899137341$1672372007$gmane$org@paral.in>
 <pan$e2610$5473bbcb$9428bcc9$2fd44237@ID-313208.user.individual.net>
 <CA+h8R2q-AEJCHbdKoD_VBaCp+be3HAg4LsujSkKgLBmQq=uAsQ@mail.gmail.com>
 <pan$883a1$d4ba5a76$917a1ded$7238d253@ID-313208.user.individual.net>
In-Reply-To: <pan$883a1$d4ba5a76$917a1ded$7238d253@ID-313208.user.individual.net>
Date: Fri, 30 Dec 2022 01:24:24 -0800
X-Gmail-Original-Message-ID: <CA+h8R2rUPUh1dKy1wmdWe-fHFOBLDHYoztn+F-x8UUeRQuSucA@mail.gmail.com>
Message-ID: <CA+h8R2rUPUh1dKy1wmdWe-fHFOBLDHYoztn+F-x8UUeRQuSucA@mail.gmail.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+UbCZZT5OS0wphw2AKcBDg5iezwInYvJqQvcJDtUSe0=;
 b=LjgDcvEWPXkVhs+mXnovakULMVTxzjj/c0VhLNrSzO1KjbVBUjrKKnN76+c3NsLAba
 9nEwXsstiUWKe/5iyKR7Bha1pSEGiSHLRfKVCFu5z/zPcE4a+EIZM0zX+8HcDh9gyiuO
 0T01LMAp0EoWX9PSS+lWihndWeEt/sM1e0eobJkHrkkZ6BbM5T5nMXoXbVdYkD2dY/9T
 VVvOwQTOLKjJBAh539/mtGJcvAy6vDzJRECIgSnqXfp1uyd11Z+GxNlnS3igBCL7CF4z
 7y30VVM/WeCil7KkwfXQdQ2WR9GEvanwQvFHZxwj4JaCei8dPDUqmKT4ANKtB+fOV+T0
 7zbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=LjgDcvEW
Subject: Re: [Buildroot] [PATCH v2 1/1] package/rng-tools: cherry-pick fix
 for jitterentropy build failure
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

On Thu, Dec 29, 2022 at 11:23 PM Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
>
> Am Thu, 29 Dec 2022 22:59:39 -0800 schrieb Christian Stewart via
> buildroot:
>
> > It is not. The build fails without my patch.
>
> Hi Christian,
>
> could you please provide the defconfig which produces the build error?
>
> When fixing the autobuilder error I added the minimum number of patches
> needed for the fix. Maybe your defconfig is different. At least there
> were no new autobuild errors since my fix was committed: http://
> autobuild.buildroot.net/?reason=rng-tools-6.15

While I could reliably reproduce it before, now I can't. So, your
commit probably is enough.

Best,
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
