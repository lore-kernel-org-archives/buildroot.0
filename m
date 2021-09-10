Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C671C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 11:33:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19455611BD
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 11:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 19455611BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB822818EC;
	Fri, 10 Sep 2021 11:33:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JJhchNeomurW; Fri, 10 Sep 2021 11:33:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A268818BE;
	Fri, 10 Sep 2021 11:33:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2BF6B1BF23C
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 11:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A057406A0
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 11:33:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ia5c7wzKMjpa for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 11:33:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5398D40673
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 11:33:00 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id n27so3586604eja.5
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 04:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=bfwRONEvZmdbrVoLO4tqTDCfkfgvdnQSZ3TkOLfidGc=;
 b=OA4BzMsfq0kbFzm+Ez5phPQPqhCPKI8g63KSsL0jgG44giAXgr7uVe0byY4W/hpiEC
 gxd3otZ8JRzkPXcUTfTlAy2kwcsFr1yQKkP2bqapzf0zGlMZMnhIRHp2QGXZYdyvNSGv
 fZLFtCzgqi0uKTTSuMuArMFM7gXPS2yJnhDR5eIjul+ffrY+u5jWzb0AlpZkhM/XA//p
 DIxaj5BfqhjaNUA/Ym9YspgWh6EQ9lMT06zCmislF/2S7nVc+y49CVAiYBJFYXqJrybT
 w39gutigqRZH+us9jZcP3XtKuGs4T+YM8ZPYQ5Wk4jmIfKkHw1K6ps1deZo6r1YJgLDd
 hc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=bfwRONEvZmdbrVoLO4tqTDCfkfgvdnQSZ3TkOLfidGc=;
 b=Ydh4Rn/FKjHG8M7T1sEXd0r8wSUey3nNT2DhYfYy3Cr5TQt+/ROiHgFttja4OusJrm
 qgwv9KOKQGl4aO71FUgZOMfzPr9FTgGZOZJ8VtQfj1auOIrlyd3xQWEZ5QoKgICqM8QU
 jcA2xtVqMsQQuKD8fpKNalfgKZIEPpagvP0PfFz2xOuvN11ORN/ykx2COV4o9dyjAuFa
 RIBrjFgGdvTaeDWt0MyEKKxNCWv07Ck2lq+2Nai4x8UxTBzgpES1wWERSYTobc8hxOt6
 834Og42ae6S4IG5XydNgeW8c52Q1F8V03wDusq+Al4c/p9mQTRW6T3NPHWtK1+3EjCxt
 Zm3Q==
X-Gm-Message-State: AOAM532KsWiaJHgX76sL3vMrWeRy9v32exwzi8X7Wg6a1yfo9vEQllo4
 JTCIjsP2hMADXUsqdVtuZ8vHcESa2YE=
X-Google-Smtp-Source: ABdhPJzoAd5ezCqSSmGlrFHei3LMi2SZ+ku3aSZ7LAr3wfCxta/SL+7qajAMRbWWDOXK0OJPQUhyqQ==
X-Received: by 2002:a17:906:30d0:: with SMTP id
 b16mr8934441ejb.495.1631273578523; 
 Fri, 10 Sep 2021 04:32:58 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 f2sm18198eje.109.2021.09.10.04.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 04:32:57 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mOem9-0000N7-24; Fri, 10 Sep 2021 13:32:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20210903211526.59492-1-giulio.benetti@benettiengineering.com>
Date: Fri, 10 Sep 2021 13:32:57 +0200
In-Reply-To: <20210903211526.59492-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Fri, 3 Sep 2021 23:15:26 +0200")
Message-ID: <874kasacnq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/udisks: bump to version 2.9.3
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
Cc: Marek Belisko <marek.belisko@open-nandra.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Bump to version 2.9.3:
 > This is a small bugfix release focusing on exfat and dosfstools upstream
 > changes, along with a couple of test fixes.

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
