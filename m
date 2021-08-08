Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1BA3C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:17:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AC4060E97
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7AC4060E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C0FB4020E;
	Sun,  8 Aug 2021 19:17:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wGVn_6DBNtu8; Sun,  8 Aug 2021 19:17:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30C0A402CF;
	Sun,  8 Aug 2021 19:17:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D33231BF3C3
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2FE9606D0
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BNqRASdn9bM7 for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 19:17:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21A20606AF
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 19:17:12 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id q11so240800wrr.9
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 12:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=O81Ma7QJqRryDT1nvsrB7aNynQaMN+M7K7vKkb8tWAo=;
 b=M5twiWrqxHbajwhK8ARb4W+ynbdKNnlIiTgd6DcqJ8LQ3wGbwHxOGgfYrD3hK3ogDK
 B441TAAyYIHN4bz3ch18ZuEFwT4PgEMNthbZOTzVVglMqySgSDhnfAm3pu5A+QCskGPs
 84FwLeu9sbQqwxTcO99N5OOMcAtZ58yVNYmxvVIiDHpE62CYDSFh1jE9VyQMcV0ack/2
 YVMsyJe81hdJ629vqo4zWSiENbbScTQK3bpKWez5lBM5cINhQE0ZkZvbMcjkQpOHWFKJ
 P91xploapTm5L9FRNcknjtuoAAZEAQj0wPQDL/6A78tW3wFlFL8RTAhjByxE4oFMO9lD
 r9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=O81Ma7QJqRryDT1nvsrB7aNynQaMN+M7K7vKkb8tWAo=;
 b=i4wVr+VTjD1QRKXjf17gSOn93OaUy1qxarKbVoL5jMEFy116BPy90kBIaF7qmKQXfB
 l5JSA+fPWknoXhMfE+97pMZTzQzJO3wGSxqSBvXDJGrUV3R33zOdjv2im6SQ2w/oigvj
 dl57Koy2LIt9DKPPTo7Jh+vqCg5+Y0+P3Rxd/o+ekEY6ga0aiC4ry8AlSUxPlNR4fG/C
 rumriUN9A8V1oMkZpwpwfgk/gVFVsZ9AlIfPUSliLC+0RLlih6ja5Sog51NHJTBhGPiB
 j0gZtNYH7LB8IUMmqntPJI5DeP9n96xeC24RrgOqTbBzL6BY51G7V6cW4EsjT9Zrnrr/
 qsdA==
X-Gm-Message-State: AOAM533y5cZSJWrDGsMrDqyu4iMIMOhKpFbKM/l73u60ZZnQaX+j+FEo
 LGLE5fQyo02Tk3fCMfMrUec=
X-Google-Smtp-Source: ABdhPJwHAPsBH0+5FTxyBfmhfxKIu/3BnBFhW1ndJnhYIQKE3wCTCiho5AEfj40T2Klyg5U0r3RxYA==
X-Received: by 2002:adf:dcc1:: with SMTP id x1mr4065300wrm.401.1628450231128; 
 Sun, 08 Aug 2021 12:17:11 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id r12sm17929723wrn.31.2021.08.08.12.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 12:17:10 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCoII-0003Y9-2g; Sun, 08 Aug 2021 21:17:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210503212911.42562-1-fontaine.fabrice@gmail.com>
Date: Sun, 08 Aug 2021 21:17:10 +0200
In-Reply-To: <20210503212911.42562-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 3 May 2021 23:29:11 +0200")
Message-ID: <87pmunagqx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/ltp-testsuite: renumber patch
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit 84968aa4954b308ed67adde305e0fc5c801edc9e forgot to renumber
 > remaining patch

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
