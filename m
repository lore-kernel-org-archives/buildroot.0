Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5766BC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 12:33:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16C4860E8D
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 12:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16C4860E8D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFBF340431;
	Wed,  4 Aug 2021 12:33:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MKt0W14hVvoi; Wed,  4 Aug 2021 12:33:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA6F94010B;
	Wed,  4 Aug 2021 12:33:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E3F21BF2A9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 12:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E08C4010B
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 12:33:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XZwZWigpk2AJ for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 12:33:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51B53400CE
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 12:33:14 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 a192-20020a1c7fc90000b0290253b32e8796so3617944wmd.0
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 05:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=6aKydrQZdh+UxKvq8sd60Cq0hbatbz4din7ReLHxVTM=;
 b=ctQOJR/B6rC8pwQUEFCTfWrFmPM4W4XoVf3QEw+gcUEaiQjKzkp92y1hSWd1/ASylX
 VzUNUtwIc/1QUNAoab1ZyHDckC7BpTTQ4UaiQZ39vsKwbcRtFmiax6Q2NNM6GovPF2eL
 BzSLq1Q0qop+u/ea9KWLDvOFsLlEpIXgQjr/fnffBA5OX2UPAhk+7NDqN218a3b7zwoT
 bEpRMYBfuGqJQNjwukcvG0yVMWweHeXXigeIEVlsCyI2Pbr9A320Oof8reAaSBekBu2C
 q/8IE7l1ZNdB1Nr/y7BDptlHj7tyV5IYa3bp8ik3PAg/6kem4QlQDI4CN7qj7ktf15PR
 yzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=6aKydrQZdh+UxKvq8sd60Cq0hbatbz4din7ReLHxVTM=;
 b=rU1sU9Ie8xxt1B9tCyDQl5ozxtpzJR4sGq1aewizJddPxITFOwaxJx1VFGVLmGDOiS
 s7pjJbrLB7ctUpST8gWSqrlm3k2NXE8/fv3WssyKriPwph+hbkDlfl3lS5ey95qyVsQN
 yrjWAXk0TcTwlbV1KG0shFMZl0IQabaZFXea1t6h6q+9y9pDbUdRgq7a+Dv38rHCFfEg
 ChHqxSiYti7GsW5tqAmUL7cJx1Wkufx5WADhs2le7dIpg9InwnVK3hibqqbPfeOJ86Sd
 OZOsQW9gisfCWfSoiidFZQQaA5gG03frVoZyYgnaA8Ocv/bqDkfq/7aG5Q88ZxSC0Stb
 KhAg==
X-Gm-Message-State: AOAM532+wc8RJIEwzfOr64dTn0Zd7bzy5mTM3sxhocdny7nJDwlr2zUX
 8AIvHd4s9mQtK9V4RUAMdL/fLvPz2Bw=
X-Google-Smtp-Source: ABdhPJxiScyaK6/90KjMxIKaT58dngsDbXvf1ebnymQiq4bz2/CDvhvZCihWt+X/SM1eb4pmsmlkbA==
X-Received: by 2002:a05:600c:3595:: with SMTP id
 p21mr9300219wmq.43.1628080392604; 
 Wed, 04 Aug 2021 05:33:12 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id v5sm2491687wrd.74.2021.08.04.05.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 05:33:12 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBG59-00021n-8o; Wed, 04 Aug 2021 14:33:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20210621062436.9477-1-ps.report@gmx.net>
Date: Wed, 04 Aug 2021 14:33:10 +0200
In-Reply-To: <20210621062436.9477-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Mon, 21 Jun 2021 08:24:36 +0200")
Message-ID: <87wnp1s83d.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/wireless-regdb: bump version to
 2021.04.21
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
Cc: Dimitrios Siganos <dimitris@siganos.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
