Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E55AC432BE
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 06:29:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8477160F56
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 06:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8477160F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B4724031D;
	Tue, 31 Aug 2021 06:29:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vTEFID29Wca8; Tue, 31 Aug 2021 06:29:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EC7C40489;
	Tue, 31 Aug 2021 06:29:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA98C1BF377
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 06:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E723A60A57
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 06:29:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vC3PSENXQFto for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 06:29:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE198608D1
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 06:29:22 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id r7so9150156edd.6
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 23:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=uTJMIPaty2XAD+/92nA90yzxfd6xz6F6k4NbEIeE9BE=;
 b=Vi1010gC7qMWwZdBr/rO8w2lU5cvHDwD3sVAdKt/bD1xvW76Lt/j8RT6JY9lDvJmQK
 zmXVP+daomXzk68CE1vGwxGqku9k9pFa98TNskQPB/01murtxZieqv6zPnVPtOrxWu7B
 6fidNnfkhUVS4jHYf30EtRdWkI6wvV36mPid3f0SwSdKcAMNYq4c+Z9vBNpwHzUA6TKa
 sDuapQ1+2I7QE02Lv3kpLLgE7I4A/f5hE6lj8+b1BwZV1mCoPcM4LQflSsUiI3kMRDDT
 KJGh8/eifa5X+Yiwowfxm/Q6OojTUoOb7tJVzJs2xbdYWXbTx7bxOsLGhYp38l5xXnLE
 /dNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=uTJMIPaty2XAD+/92nA90yzxfd6xz6F6k4NbEIeE9BE=;
 b=olh6l+Zhj9Mkzq7X1HIjFewFc7/y2i1jCSkfn3dj3FX4OHLHSVQnpjUmt84CLgrxxj
 iPSLEBRXtD1iJkb86O55k0PFyEjI1VV2MmaBC59ZzdVJkYMmO1NFb/Zl+5UCsIjsQ62E
 sjhwqtEwHpfnHqXJsvZ62KAlqBkCvzuqbJo1xmkKyFkXTcssfID1xWirTOaoVHZXfT0D
 dzlC0qPAlKDthydtOMwK4l+6uvnhv10+qJktF/G1yumWWEyAsnZxM0xcODkA5RYFd1YL
 gNE7ZN/QLn1glnzvngVGkn1VcOZrPnlNH+5bpXhMF15QiIy7jpjHTRsGMQfvUVH0D5Hc
 HD3A==
X-Gm-Message-State: AOAM532JJeAaSG2mumvXaneN6n6cuGnSCvGwiP6HCERt4E6PULX4Lbj4
 WZo4nDQAcon9uYgfM0CQet8=
X-Google-Smtp-Source: ABdhPJzlsywnxPftkpeqimGqjWzksNns81u+GkcV8QcgZ9C6OQUtHZ2GV+6cCSjswDGlLMuM1voV/g==
X-Received: by 2002:a05:6402:1455:: with SMTP id
 d21mr27773513edx.161.1630391361156; 
 Mon, 30 Aug 2021 23:29:21 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 ck4sm4276143edb.67.2021.08.30.23.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 23:29:20 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mKxGp-0006mJ-VN; Tue, 31 Aug 2021 08:29:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210828081330.559994-1-bernd.kuhls@t-online.de>
Date: Tue, 31 Aug 2021 08:29:19 +0200
In-Reply-To: <20210828081330.559994-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 28 Aug 2021 10:13:30 +0200")
Message-ID: <874kb6w2io.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/php: security bump version to
 8.0.10
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Quoting https://www.php.net/
 > "This is a security fix release."

 > Changelog: https://www.php.net/ChangeLog-8.php#8.0.10

 > CVE-ID were not mentioned in any of the fixed bugs.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
