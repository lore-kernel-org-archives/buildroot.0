Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 883ABC4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 20:42:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 315EA61181
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 20:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 315EA61181
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D25CB838AC;
	Fri,  6 Aug 2021 20:42:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FE_yDkNWK4Un; Fri,  6 Aug 2021 20:42:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C763836C5;
	Fri,  6 Aug 2021 20:42:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9BF801BF3AF
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 20:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83AA34010C
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 20:42:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dx3W262To6gt for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 20:42:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E97140148
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 20:42:46 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id h9so17094224ejs.4
 for <buildroot@buildroot.org>; Fri, 06 Aug 2021 13:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=RV5sLHoqYKrMgaPqFYB5mXQx6AAslddNrCjnFVwxuHg=;
 b=Fnv8FDN+XAmWxkyCN2NzZ1TgTyqX+joyALD5FxwWrlIMgH/EP4xJA92UtXU10qc0WJ
 zsaTIdeXiax7lhg0TRK/WNrIYFAg0Q0jUtJ2Xj+ae0Cok2+Si/jiJrlkMeDz8ikbeBE6
 92OTG8KaGcATHqIZcAtk3uLlsN9dIdYHQvMfN8hrx03mqJKh8DbiauRDH+W708/c43EG
 8Q7ikp5bZC53pgmu+0tjf136KvA/rGebfZn4HzQc8RFfMlT7oSU10Sxt6UEh15YzT8Vf
 Zp8PKnBMDP0lRlo9FP0k85J8JXWBKZMtHhc/JDGerM440eiG+daQr4Vd7k0RCVnaXDrR
 QJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=RV5sLHoqYKrMgaPqFYB5mXQx6AAslddNrCjnFVwxuHg=;
 b=m6u1IFCU3SiB2xOe1XwvzCSSsS8niSS3FEDatSdFbzFkI+LhGms4kGumG0KQZ4HRP2
 fsB7ZPMQq9Dpbue7lkz48A/pJlhsLP3IcR5/x+O5hkPHfLtEQy55yGGox8gMd4a+kidc
 Kb8q1GLvMWsIR84JPV68mmwN4dpzsJlKYB755HI4A1jdhi/FQX2tDm4K8s5whaasNaso
 n/aGSWJOcsbWXq/88VEIdb7Y6Oorm7rV6OPNEl/Dae5tzbf3tkSBVuN/knyKTLRMj5iD
 1WlJaUDbGMWzM0RENy0+97GkybNqz5N5Aj/J/vD+dffroAUwCyMdQ9EDVyAFoDG/frCs
 lT2w==
X-Gm-Message-State: AOAM532HEs1gnM4y4SQdrHHC1oMUnWxn6qm++9jdULViuJ67+U7NNcO0
 +xr9BQ/CN+ooC1+Aieiu6hdtuamYI92/Zw==
X-Google-Smtp-Source: ABdhPJyZalVit589gsFVAin0dT2JBoeNx+kOQW6bXr3W2uTOnaE8UhfvauhrTGUs4eaOvITY3PHygg==
X-Received: by 2002:a17:906:1f54:: with SMTP id
 d20mr11662944ejk.48.1628282564274; 
 Fri, 06 Aug 2021 13:42:44 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id o22sm4326822edr.19.2021.08.06.13.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 13:42:43 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mC6fz-0008Ij-1Q; Fri, 06 Aug 2021 22:42:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210730125611.4052704-1-fontaine.fabrice@gmail.com>
Date: Fri, 06 Aug 2021 22:42:42 +0200
In-Reply-To: <20210730125611.4052704-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 30 Jul 2021 14:56:11 +0200")
Message-ID: <87mtpugv99.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/fail2ban: fix CVE-2021-32749
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > fail2ban is a daemon to ban hosts that cause multiple authentication
 > errors. In versions 0.9.7 and prior, 0.10.0 through 0.10.6, and 0.11.0
 > through 0.11.2, there is a vulnerability that leads to possible remote
 > code execution in the mailing action mail-whois. Command `mail` from
 > mailutils package used in mail actions like `mail-whois` can execute
 > command if unescaped sequences (`\n~`) are available in "foreign" input
 > (for instance in whois output). To exploit the vulnerability, an
 > attacker would need to insert malicious characters into the response
 > sent by the whois server, either via a MITM attack or by taking over a
 > whois server. The issue is patched in versions 0.10.7 and 0.11.3. As a
 > workaround, one may avoid the usage of action `mail-whois` or patch the
 > vulnerability manually.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
