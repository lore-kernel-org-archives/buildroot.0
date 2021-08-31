Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10EB8C432BE
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 06:30:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85CFA60FC3
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 06:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85CFA60FC3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DC40400E4;
	Tue, 31 Aug 2021 06:30:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2gzmsuvUk-qP; Tue, 31 Aug 2021 06:30:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D3284012D;
	Tue, 31 Aug 2021 06:30:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B3E11BF990
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 06:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5861060A57
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 06:30:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9V7SW2E4ux6P for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 06:30:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DBF3608D1
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 06:30:26 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id ia27so36229547ejc.10
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 23:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=Oa7lA8pZ1Ut2iebrzhF5p1VjFk3+VczobbGyYwI0d+w=;
 b=Fhh67+Uu0CV4cqkf3M2CyH84+TmXkn0ciw+zzXN4EqB6w8NcA/NY4zv214bUDryxGT
 Xh0uEm5U6kOd8Xwn7FojWmkmmBK2dCuXtnbv3ZtedzjwYiNLlzIheYjJ10QLLPmIpD/V
 /P+IB2JdT9qEVtQb9VuzugcicqBWSo/zeIi7q2zSxI7N0JuHtMdQYd09vM09W5ITHMmp
 xMU0iIfHF3Lt1q9pRJoWyAt9+HAIGlpJdt4xyzLfWwh/3J19kxR+CJLsszYwz/H3XPdM
 TO2Or/OVxZFXWF7Cr+AhEC/9V4QECtgClnS4YwTeEzPNwSZp0rW7GoA6Jc3CfF7cyClK
 bNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=Oa7lA8pZ1Ut2iebrzhF5p1VjFk3+VczobbGyYwI0d+w=;
 b=XzbVoOQTJCQhExlBFVqitOkQ5P1agQpjmza7VxccDV8G1Ui0OwxJAEDHs0tUEhKO96
 Q2stOxKWGJvH8p99+MPzlzGtt4O8TfYlSaeUpdMmXXqml7MQc5HSx03Ca+a3Z6KYxYD/
 HwAtX3i8MQRByM0iz+D99bV5PN4KuuObAM/4YWnEoAY/jy5pNrAl1EzkT1I7F741ldjF
 iTTHigRVqGssW452xmeH3Q7PCoijUwVz1YuTJsFLiNNMl+p6f8LyvWwBVMN3hlup4ruq
 mngmD2J2QtM+J403wNbO/HmNyHHxgoYoNaEbCWrNFYXSZMwtsVm7fFxopaa8YtzMq39U
 uxqg==
X-Gm-Message-State: AOAM530CQYFneq1Q4zrXCI/z0BFORDHlOkXVxMA0MZWAQGIn1SrOoDNB
 WDET3phP6NMGdyPF4Ow66TRk/zonQgc=
X-Google-Smtp-Source: ABdhPJxXE3BXNDc9e7iIG+hE6VdxeLfgNfeBkeZ9eV7E9stYyki0hRVNG7F5iNg7X7tOPCgx0tUqzQ==
X-Received: by 2002:a17:907:61b0:: with SMTP id
 mt48mr29081928ejc.64.1630391423503; 
 Mon, 30 Aug 2021 23:30:23 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 t24sm7671306ejf.48.2021.08.30.23.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 23:30:23 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mKxHq-0006qo-9n; Tue, 31 Aug 2021 08:30:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210828082531.585788-1-bernd.kuhls@t-online.de>
Date: Tue, 31 Aug 2021 08:30:22 +0200
In-Reply-To: <20210828082531.585788-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 28 Aug 2021 10:25:31 +0200")
Message-ID: <87zgsyunwh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to
 6.4.21
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

 > Release notes:
 > https://sourceforge.net/p/fetchmail/mailman/message/37333073/

 > "It contains the security fix for CVE-2021-36386 of 6.4.20, and fixes
 > a regression/a bug that causes log message truncation/run-together
 > prominently visible with --logfile that was introduced into 6.4.20."

 > Updated note for CVE-2021-36386:
 > https://sourceforge.net/p/fetchmail/mailman/message/37333078/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
