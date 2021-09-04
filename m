Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB1BC433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:43:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7143760C3E
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7143760C3E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3656560789;
	Sat,  4 Sep 2021 20:43:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oA5h3d-9VcLB; Sat,  4 Sep 2021 20:43:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 885256077F;
	Sat,  4 Sep 2021 20:43:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 42D411BF20F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AB1A4015B
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:43:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1BK-Wik6nzfi for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:43:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58DE540105
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:43:15 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id mf2so5104836ejb.9
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 13:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=/Abo2iBOr0L05W7UlJ5WB3WzANit2HmgpMhT30+rwLg=;
 b=n6l0cPSszOIvJgaJfz2wl1PWF/h+oFnFDozK3ZuVJiMFA71B35IYnQJpcRn1fv2ex6
 uhGu0O8R9Bl2erwC5NB6E9OleiAdtlCGh+AvWaD+balglQh4dvzcFtSC0dcqwv3p4CuB
 jP564VpUsO6L0vQYjlaefbAUHL/rL8hwWJnFyYvACWUH0Go49LBcHOAi+k7T5M0883B7
 j1GD+rbzryotPLMLfcvj5cOZCrRh3scJevysI4i3rVctl9MUvNf2Mq1NiB4IJR7oNvyE
 +EpACSSwQaGZxgiWsGfLZ+HUh5U3fTsBb2hU0up9EoAbCB5cM5oz+q2bsIJ/MUa3knNG
 FVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=/Abo2iBOr0L05W7UlJ5WB3WzANit2HmgpMhT30+rwLg=;
 b=tJ/ALzB56FLVQvJNu5HLx9F/d45j9SkYJODKi8y0TvPrm27aGZRnTfoLNL6CmAEq+O
 T3TlNSWkd/IofjYjgqKBGVprNSfxLVtH77y8qf/QinFB8SiAveFHY9cpOVluc8vw+7fD
 1jWO8SgEoNmpwVmZwctxIHkklKVX4XF9HaSLsCgwv71r5+bjQJqVuhLB8mErqvmzUTJR
 MBMmvwWXLjfbIUHBRF/ABwccOUwqoHksRQjMfavJRqLdYvZiEUE8wwfJ6hdXC3Jk58Vy
 DiAQl7rimFuSm7dWdgma8Tk/ac1GwgK4H2a6DMR2YrF4ZQ+0K2EtXNRpSj/vzgN9FOim
 2uTA==
X-Gm-Message-State: AOAM530J/HmgRlcc0SH/BFOjedKzhARJhrF0pzwtXh0/WlElIyKoVwn5
 vUjtSApGGgb26MGvM9r+oVoXeexE3M0=
X-Google-Smtp-Source: ABdhPJzFnst29LJvEu/4YlwLU2r8biuboTdT1K7SHDO1MUjhzS1o+aWz6Lx9zs5SPwy4if8j76x2ng==
X-Received: by 2002:a17:906:9708:: with SMTP id
 k8mr5699722ejx.399.1630788193627; 
 Sat, 04 Sep 2021 13:43:13 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 z12sm1889144edi.44.2021.09.04.13.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 13:43:13 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMcVM-00089d-CI; Sat, 04 Sep 2021 22:43:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210814204354.352402-1-fontaine.fabrice@gmail.com>
Date: Sat, 04 Sep 2021 22:43:12 +0200
In-Reply-To: <20210814204354.352402-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 14 Aug 2021 22:43:54 +0200")
Message-ID: <87zgssm5r3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gd: fix CVE-2021-38115
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > read_header_tga in gd_tga.c in the GD Graphics Library (aka LibGD)
 > through 2.3.2 allows remote attackers to cause a denial of service
 > (out-of-bounds read) via a crafted TGA file.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
