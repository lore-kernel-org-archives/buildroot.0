Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB1CC433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:33:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7CD960EBA
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7CD960EBA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B0B46063F;
	Sat,  4 Sep 2021 20:33:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wz5C3KVtVheM; Sat,  4 Sep 2021 20:33:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C79F06064A;
	Sat,  4 Sep 2021 20:33:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 078941BF20F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5F376064B
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:33:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id STVzFJ__7xUW for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:33:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 465F56063C
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:33:10 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id bt14so5138915ejb.3
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 13:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=uuLs3CeMx0vVee844I3ZTsvjgYWcUu2PMh0jQNfwV/0=;
 b=hXlf2fe+llDxZTZWRxkdyxUYQ15GYnWehqktor+1oFe31BlN8CCXiefRJ6bORFFdr7
 qKqbx90KcBgBHy19gVhBFjcJ60IyoY9HxPVAlc0ycUblf9kbpHa7w1iy+FqLhffQCF22
 ySBLX4ufaSU2iwO/9L3OswzB3oQwBJVxmAoXkQrT6orXkwekOzYTxiHZatgusE9PHEJR
 /BUQKp9yYyWLRufM0fHkemmkNlXNYIRCMKhmr8kCQ7r/ns9dpLNsHAwLqoa0Q16YS2S6
 HFeHab1r5LX8TjjCRcLmHmqVDYyEt5kqdUmWzvYFz8UUsaluWtIm2IKcFeqtpRLPjiA7
 xQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=uuLs3CeMx0vVee844I3ZTsvjgYWcUu2PMh0jQNfwV/0=;
 b=PhG9z85Dw0obXnpPOMSSmgmb3ijEQ9WLCRaGkpXmAMyp2t46R5O/YMpc1lNIoB0UiR
 uXkssoiqtTPTWCiU1n8x+/nWNK+8eQa74h/ROUM4lvHAQwrmbzNrn1bCPrjzECWIio1s
 vBM6JY3vF5jVMtYQWE4KlVab4CdgJK3BBjn+oBrTILOpu+OlqbvPfdSUo/PAdn4YHrCF
 grVjUPIAtMYDD9MKi3nWTrtGhNQky54q+fn5Xwp1jDbQ5Dq9goQom+ylRbI7omrlh47q
 AlYL2hx3E2PS+TRdSCMSuelys4SuXxyyvhluQNke2621HE8ytToe8FgpQEwYZUiCew/f
 HzOQ==
X-Gm-Message-State: AOAM532CxapWAoi7SEnE7GOda4/e5xtD9q+h8rBABgWY0SL8PLCsfkqs
 psnCdpamLBCampqs/tzfrWE=
X-Google-Smtp-Source: ABdhPJz149qI8B2MoR852K5Ovy9wFYJfrH95Q8M2a2k/6q0FGw6OGt51nYayR4wI6B9AhgYsX0fzCQ==
X-Received: by 2002:a17:906:314e:: with SMTP id
 e14mr5761914eje.165.1630787588543; 
 Sat, 04 Sep 2021 13:33:08 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 q6sm1474209ejm.106.2021.09.04.13.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 13:33:08 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMcLb-0004yP-Ef; Sat, 04 Sep 2021 22:33:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210814210042.354849-1-fontaine.fabrice@gmail.com>
 <20210814210042.354849-2-fontaine.fabrice@gmail.com>
Date: Sat, 04 Sep 2021 22:33:07 +0200
In-Reply-To: <20210814210042.354849-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 14 Aug 2021 23:00:42 +0200")
Message-ID: <87h7f0nksc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/sylpheed: fix CVE-2021-37746
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

 > textview_uri_security_check in textview.c in Claws Mail before 3.18.0,
 > and Sylpheed through 3.7.0, does not have sufficient link checks before
 > accepting a click.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
