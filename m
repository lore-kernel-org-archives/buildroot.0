Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 572D7C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 11:29:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E33C3610C7
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 11:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E33C3610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9954D40615;
	Fri, 10 Sep 2021 11:29:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bkj54dRAk4rg; Fri, 10 Sep 2021 11:29:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2FC7405F4;
	Fri, 10 Sep 2021 11:29:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E626F1BF23C
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 11:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E278580EA1
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 11:29:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9-wdjSclAeJS for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 11:29:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 050E480E72
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 11:29:11 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id dc3so3530985ejb.10
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 04:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=Vm6wzSXBvxKjav0j3Anqs/68ZMs+cqvw1s0qBgmfXXo=;
 b=gFidGFkfxWvXLXoND6xucEKAB+KxghEGhEC+eZFcEGcvxcNGxfWt7GAKLrlgsdobWp
 ite10o0E7saZMz8qd7vNGdE+zOi5fSZYhE8sBojdWCVskDH8/w6Zkf0PDryahxnBcTD+
 E3iqKZ2L4r2rY8GNruG1AWx7OPwcc9TueHey5AS07/sI6JD3Zx6wCNKqccde8DI7mpW0
 USBKaDEG5nYjbqUjkKl5LbxYBBMZ0q4SlJyl1fp0Ia52+KheKkziRmOPxhq0dZcWCPEu
 077zgDJ9A0zOT87vZP/+Xn1UCaqTdK8ygWpc+C4WI5O/Uzd9FS+Mi/oUHm0It6jirqkL
 UpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=Vm6wzSXBvxKjav0j3Anqs/68ZMs+cqvw1s0qBgmfXXo=;
 b=aFrKSshM8F9FZgqvAGyJ6xayGkifQh7ErLYYiA/9nvxxQKaxVfkSO2/YlH+uk1oRuN
 CCB1f50gXYpXE8Kbu9wJZSALuY2q+BYdtMgtcOylK7zu++9r/5ks7tzw8R+AUBumNJ+q
 QZfYq2vfW9nvj7X4FWF6jRWr0guQvCuMd62piwb5o2v4VjMXSZQxTDqCWTf73glk/6fj
 bnkPAFB/BrW1Ttpck1PyazPEUPcjDRejeNgJ4H6lm9Gal6cHVFZVtEx2G6FqURH1r0zM
 2NNR82GcqcY9MOyT8kQ1IQycerzi1qUvW8aASvIObXUOs/5GInXUphcey54ABzO6mnTx
 vWMQ==
X-Gm-Message-State: AOAM532vas7JimM3604Y4PunDOm2Qk8pjS8ySSGtGT1QSXVpL1xWhkhF
 2pcvkQQ+JSYVu0o205p1XkI=
X-Google-Smtp-Source: ABdhPJwSzcB0/CK+x91ThawpKI/Uzsq0N1Ow+C3S08M96j99Z2P0lK/glXLo+t1Aoqs8Cj4JZslRog==
X-Received: by 2002:a17:906:c416:: with SMTP id
 u22mr8768527ejz.543.1631273350270; 
 Fri, 10 Sep 2021 04:29:10 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 bj10sm2296562ejb.17.2021.09.10.04.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 04:29:09 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mOeiT-0000EQ-3n; Fri, 10 Sep 2021 13:29:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Titouan Christophe <titouanchristophe@gmail.com>
References: <20210905094118.641168-1-titouanchristophe@gmail.com>
Date: Fri, 10 Sep 2021 13:29:09 +0200
In-Reply-To: <20210905094118.641168-1-titouanchristophe@gmail.com> (Titouan
 Christophe's message of "Sun, 5 Sep 2021 11:41:18 +0200")
Message-ID: <878s04acu2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mosquitto: security bump to
 v2.0.12
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

>>>>> "Titouan" == Titouan Christophe <titouanchristophe@gmail.com> writes:

 > Mosquitto 2.0.12 is a security and bugfix release, notably:
 > * Fix possible DoS in the broker with MQTTv5
 > * Fix CVE-2020-13849
 > * Fix CVE-2021-34434

 > Read the full announcement on
 > https://mosquitto.org/blog/2021/08/version-2-0-12-released/

 > Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
