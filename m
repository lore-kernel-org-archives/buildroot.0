Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A06C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 19:25:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 688B461050
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 19:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 688B461050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34B0F606F7;
	Sun, 12 Sep 2021 19:25:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wtZ2noHpFe3N; Sun, 12 Sep 2021 19:24:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6278606A9;
	Sun, 12 Sep 2021 19:24:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 309BE1BF409
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 19:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CC7E606A9
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 19:24:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PNBlv8-rHscy for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 19:24:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9100E60635
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 19:24:56 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id jg16so16184207ejc.1
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 12:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=NL/4vDIh3jtUBWhm9NArJ9Lb0yn6H5m6B9LZsSO2tAk=;
 b=CA+pxYpL//8aB6401r7Czx76UPifbpSYCwTeyouz3Lv5zkwsF4PqVV/HvRQ730fBX6
 DpeoLm9qO/oPBQiTG5XRHyW90a7P8+rpe2+dWRNdcTkI61nDygeWV5spW/EHT/T9zlBF
 yU29dzuA9GE+T8MeixaN1DICTR0Z11/ytqIjAiiMP0RVimqGBj1SMkm9LKFneRukTAhM
 mKKHW7QVlI6yZjvVLLfywbzTlReUOXmlP72HYWhJ/46XvdxrSCBMRwV0GSiNsddR4Y89
 m1lhY9sivDjnDBSt1ffFEZpEZL9fm5SS+y5Npm/5foc82YKv/74zCWXjLf1wpAOk+JMS
 GMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=NL/4vDIh3jtUBWhm9NArJ9Lb0yn6H5m6B9LZsSO2tAk=;
 b=RxT4CVS9UsJSMnDlL2w5cktSN8CYE/Z7Yo1XLT0XOG83F+UY0ANpvNAeGHSzOKlWUl
 r5gjjvujh8mNYmWinqsWsW2Ku6Kfw3QUkVwMcVDBI3Ne149005w98kkZW5dIF//iZaoi
 rue57JVfCWwOkNRz3MnPY4SqQ4sBM39mKeqWgEiOC+/Wpx9kfNI4JTSUViOXWi2/vg+W
 WmDzYnhxyCiGOnl2pEAjdgfAJgFlrzWHDktHNe65/hYwhJlfrjQJHFQTQwGyNg73LnPC
 VNojg3fTT5CtKXpYNgbUH8+8fTsD9aOe8lUCbrpAnPJi9yl8dRuNhQQzh+gS4X0MXq01
 tfMA==
X-Gm-Message-State: AOAM531juXONmBsDiY4Uo/t69KEMD29K4Jz3iIE8BAM7m/V3fX+2CYoA
 hQJ9rW9kn5bwyGBO9bj03arVE6HrsZI=
X-Google-Smtp-Source: ABdhPJz4WqYmQePAGDO1wQh7e1Pa7vWSYK/q3zhjIVaUCt5XEAuo8aCzVBDV5tDelLyEAGZeySE46g==
X-Received: by 2002:a17:906:eb56:: with SMTP id
 mc22mr5755858ejb.542.1631474694871; 
 Sun, 12 Sep 2021 12:24:54 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 jx21sm2405545ejc.27.2021.09.12.12.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 12:24:54 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mPV5x-0004yD-C8; Sun, 12 Sep 2021 21:24:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20210909091453.2005878-1-giulio.benetti@benettiengineering.com>
Date: Sun, 12 Sep 2021 21:24:53 +0200
In-Reply-To: <20210909091453.2005878-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Thu, 9 Sep 2021 11:14:53 +0200")
Message-ID: <87tuip38ca.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/sox: install to staging
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
Cc: Adrian Amaglio <nainformatique@gresille.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > From: Adrian Amaglio <nainformatique@gresille.org>
 > Install header files and libraries into the staging area.

 > Signed-off-by: Adrian Amaglio <nainformatique@gresille.org>
 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > [Giulio: reword commit log]

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
