Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED8BC61DA4
	for <buildroot@archiver.kernel.org>; Sat,  4 Feb 2023 20:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4852F8204E;
	Sat,  4 Feb 2023 20:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4852F8204E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jr2Yi0Bzp8sm; Sat,  4 Feb 2023 20:52:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BFA282046;
	Sat,  4 Feb 2023 20:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BFA282046
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 705B81BF408
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 20:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49CCF60FD5
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 20:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49CCF60FD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RjjctreGtITG for <buildroot@lists.busybox.net>;
 Sat,  4 Feb 2023 20:52:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1048760FD0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1048760FD0
 for <buildroot@buildroot.org>; Sat,  4 Feb 2023 20:52:25 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id lu11so24322510ejb.3
 for <buildroot@buildroot.org>; Sat, 04 Feb 2023 12:52:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:message-id:in-reply-to:date:references
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=01Tujzor7b9Hs89p4v/pGEV+Vh93ZZv5ybZlf24CI1Q=;
 b=h0g3YTie3ALXQPq1pQkHJGhXWzIdwrNlzdHKfSSLAxjbHts0Bs5bVgrHffmQg1ylnJ
 g/Op7PT+Nj9RLNADDpCUO7/T4arMkJ51I/M+Br4hc3uQax4xH9NzydX9mL18sFYSzUoy
 Lu9Ks65xbYRYjod/7XOtJqUg2ausOlQzKWY/HEiBmOpgyGIYrg0wQV7dbsSdfsJtq/1P
 t9g3TEyA4jfBV7W08Ljo52hyhQr7a3vdQZVKHIpCnmRGSnb6A9W9y6F0icxjUW1AkBgb
 Ci4GNoijx/Rax3lPpma/sMCRBaF6OXNUMCwwzr4K+MioRx7ACLfnEoAHBNVgqhsvfvAk
 xgqQ==
X-Gm-Message-State: AO0yUKWnC/yEhdwHu6cZJd5B2yYGOPctfyvYnB+OP4U6d0awEYhjsvEB
 mpIrVBOL5t5XdmXGLzuuvrYcpt2vWzA=
X-Google-Smtp-Source: AK7set/bWCQ3vQCse8StBt26oVzJQiG++x0xxOT3KmrVK8wkXhA+MLwpbxlU6ifMGlTdq0sJcUpSpQ==
X-Received: by 2002:a17:906:7e42:b0:86f:763c:2695 with SMTP id
 z2-20020a1709067e4200b0086f763c2695mr14269101ejr.17.1675543943617; 
 Sat, 04 Feb 2023 12:52:23 -0800 (PST)
Received: from osv.localdomain ([89.175.180.246])
 by smtp.gmail.com with ESMTPSA id
 ml14-20020a170906cc0e00b0084d3bf4498csm3273065ejb.140.2023.02.04.12.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 12:52:22 -0800 (PST)
From: Sergey Organov <sorganov@gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230204134709.4160596-1-sorganov@gmail.com>
 <20230204143948.GB24755@scaer>
Date: Sat, 04 Feb 2023 23:52:21 +0300
In-Reply-To: <20230204143948.GB24755@scaer> (Yann E. MORIN's message of "Sat, 
 4 Feb 2023 15:39:48 +0100")
Message-ID: <875ych17cq.fsf@osv.gnss.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:user-agent:message-id:in-reply-to:date:references
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=01Tujzor7b9Hs89p4v/pGEV+Vh93ZZv5ybZlf24CI1Q=;
 b=MaDb9DY96GJB76Gqw7JFeQs8PMMXqyakD4+EXN3aVekmIayGt4SR32ESswtRfLHyk+
 Wa5KGbCVNkmUVP/ez+5juhOUwwt+JGnH1M2fXvxUiXadOI5zBLMtpmAMbb633Ncp1sq0
 7e407a2EYSH2WuJmranPdCTPwDqKn453pHqqaFoIFNF4NxC4DxboGzkWhU8b11e1qZU1
 mfDEEog3j5cd9+1N4IznCiljNDMVPanXlCWI7CrGnrkAV+L5aVhATn6XRgGf7Y07ER4a
 cweNKfoUxO5ITNDw6qTVw0HQ3T58fUsFrI63ANjw6UKJP0t+F0b45fCATpeBuINxkV7E
 HT5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MaDb9DY9
Subject: Re: [Buildroot] [PATCH] package/openvpn: get rid of -e in
 S60openvpn shebang
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

"Yann E. MORIN" <yann.morin.1998@free.fr> writes:

> Sergey, All,
>
> On 2023-02-04 16:47 +0300, Sergey Organov spake thusly:
>> The -e switch makes the script terminate on error from
>> start-stop-daemon, rendering unreachable the code that checks the exit
>> status.
>> 
>> There is no need in the -e switch in the first place either, as the
>> script takes care of errors handling.
>> 
>> Signed-off-by: Sergey Organov <sorganov@gmail.com>
>
> Applied to master, thanks.

Thank you in turn!

>
> However, this script has a lot of coding style issues:
>
>     $ ./utils/check-package 
>     package/openvpn/S60openvpn:14: should be indented with tabs (http://nightly.buildroot.org/#adding-packages-start-script)
>     package/openvpn/S60openvpn:15: should be indented with tabs (http://nightly.buildroot.org/#adding-packages-start-script)
>     package/openvpn/S60openvpn:16: should be indented with tabs (http://nightly.buildroot.org/#adding-packages-start-script)
>     package/openvpn/S60openvpn:17: should be indented with tabs (http://nightly.buildroot.org/#adding-packages-start-script)
>     package/openvpn/S60openvpn:18: should be indented with tabs (http://nightly.buildroot.org/#adding-packages-start-script)
>     package/openvpn/S60openvpn:21: should be indented with tabs (http://nightly.buildroot.org/#adding-packages-start-script)
>     [...]
>     package/openvpn/S60openvpn:0: DAEMON variable not defined (http://nightly.buildroot.org/#adding-packages-start-script)
>
> Could you look into bringing this old script up to today's standards,
> please?

Sorry, probably not me, as I'm currently using rather old buildroot
version, and it'd be problematic for me to check such changes against
the mainline.

Best regards,
-- Sergey Organov
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
