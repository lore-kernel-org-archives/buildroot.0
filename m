Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E572C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 05:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D17EF832C9;
	Tue, 17 May 2022 05:50:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XPgSWX2cQibL; Tue, 17 May 2022 05:50:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB55A81489;
	Tue, 17 May 2022 05:50:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E8CB51BF33C
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 05:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D57BC60760
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 05:50:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=jms.id.au
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i7CpjizQFNMU for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 05:50:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E4EBB60A9E
 for <buildroot@buildroot.org>; Tue, 17 May 2022 05:50:38 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d21so7234264wra.10
 for <buildroot@buildroot.org>; Mon, 16 May 2022 22:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rfF7JBm9CY4vM8m1zznsTlQxCccKH6i07oHW5dri2Bw=;
 b=C7IqVm5gvvAfDE2ISVOw1wn0bH6Bywqx2krGVYHZophNtzn7hvSqKrjjVRuF7ElFff
 6xwr6z+cvDOFiDgImUSt/cTFdFXStnU25vXKLorvOKt5kT727v0wFiO8ZjCjhJ+/QQHk
 YLssnTajRyBc5YZrkTtzo2/71Ww7MbhfQk1p4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rfF7JBm9CY4vM8m1zznsTlQxCccKH6i07oHW5dri2Bw=;
 b=VbdN++0qUp1LfrpL0YK2BvnPokRHCA8bjd+VyvZts0PyTb7OvRiUjI24dnaFVajXaW
 SYDEJ8V1eKRGMNm5jhA72zU7GO1F1iBJjemsgNj7AXGB9a00t9TowknhwXfT/i+ol1jA
 nv/JELfSBbYTgu68v5qQWC51iBDt02lobHLVnlE2YaPj0BevK4nQfKKyLzGy/TKn4Urj
 YrKhzX9ocNM90V8wSyfSpFY/UmaoPjgLf+TO6pRk2cAAIGKt0nibOw4Uqr0eKN3SYIzd
 SAyTxl3zNJarPPmbNAkXFpMXfIO+fgbls/jiTYgmXISAX7QHI6K/XEySa/71rF6LfURd
 J2qw==
X-Gm-Message-State: AOAM532V3fcqsAiyGoMovNbxb+oeDd7K1hXRajvf7S+67HFfvCn4xIcB
 nu3wdWRC76KFU2os6V57b0XxaDeoeI9155sP6wM=
X-Google-Smtp-Source: ABdhPJw6/DbokTnO1+/oCVp4j/Qcwninko7b7yHnZgHQZ4XaS41RdIsII9a5AEob8ZixEqQVBXlAkvxC/HdiNQA6UZo=
X-Received: by 2002:a5d:6d05:0:b0:20c:64fd:f98a with SMTP id
 e5-20020a5d6d05000000b0020c64fdf98amr16809036wrq.474.1652766636837; Mon, 16
 May 2022 22:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220511114003.162006-1-joel@jms.id.au>
 <87lev79lxe.fsf@dell.be.48ers.dk>
In-Reply-To: <87lev79lxe.fsf@dell.be.48ers.dk>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 17 May 2022 05:50:24 +0000
Message-ID: <CACPK8XeuZw-Ov4JUNSne6J2gNVrYCJRYU4B0akWsjg71jqHfCw@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/go: Bump to v1.18.2
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
Cc: Anisse Astier <anisse@astier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 12 May 2022 at 08:48, Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Joel" == Joel Stanley <joel@jms.id.au> writes:
>
>  > Minor version bump to the latest release.
>  > Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> According to to the upstream changelog this fixes security issues:
>
> go1.18.2 (released 2022-05-10) includes security fixes to the syscall
> package, as well as bug fixes to the compiler, runtime, the go command,
> and the crypto/x509, go/types, net/http/httptest, reflect, and
> sync/atomic packages
>
> https://go.dev/doc/devel/release#go1.18
>
> So I have reworded the commit message to make this clear and committed,
> thanks.

Thanks for doing that.

I noticed you didn't merge the second patch in this series. Is that
one okay to go in too?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
