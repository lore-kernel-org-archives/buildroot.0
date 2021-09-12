Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A813EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 18:50:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 414D861026
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 18:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 414D861026
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFAAE4021B;
	Sun, 12 Sep 2021 18:50:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PYIL5dA48gC6; Sun, 12 Sep 2021 18:50:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10CE140155;
	Sun, 12 Sep 2021 18:50:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E58AF1BF40E
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 18:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5639606F7
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 18:50:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C1-aFw_eJ11T for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 18:50:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 133D5606F5
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 18:50:33 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id q3so10881571edt.5
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 11:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=eXMqn5Tgke9Mwf5be/HmG4dyrSRP5R5bILSBGyLtNoY=;
 b=W8fTEntTH6bkSWrpY9pq+nloO8HDWFr5A1TDrK1kLC862w8uSH7+t2b6SvTw1QYRiJ
 TdKJK+LIU6Tyjo6chxITtwCBzf1tSYEl4JKPjkUJUz6MzjHx6ZotbV6da1BExQP82i40
 hstCoD4CRUTlDvZfMP699IUoGArPXY/zrsAgxIrRDw1WKzxi6bTLxZ5Vv5IOMkOBcUEl
 fuIKhnPPexK4R74RpN10m2O+AzUuKqFtchIBQlkZYQbBs/wFph6e6gpoLSFyn6vMDx8J
 zbgO6s636lgbLgLDTUHvfxn/wNs4xxru/BCWmPyN4xSddViaGCGfiHdg0bu2T1fcsk4l
 UZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=eXMqn5Tgke9Mwf5be/HmG4dyrSRP5R5bILSBGyLtNoY=;
 b=WUpBoXnAzH1wmdsn75EaVm3b6kVBPqwKr23aNivMaiZAw5ShNflAzN/UFM7Nl2m9MO
 FgQiF3MpoWF0EwOU3hfDJayNd7Ddbpd14VqmrVa9XvNEw4aLm/0vmaqZOcoRoU+QqWlf
 CouDsTnNdyIhQCthyK0NRw5C8kb6uqnNEA18L1qdCbErcWerp+U64FsAtfWebOWELqp4
 +SbVLnwB2r7SJFNwPXuacgC4Nkgbmuu+RTGzEMYjpH7t/OycKWwrRldduZ2SBklmOAXd
 RKDbpEdoyBJcg3ZO70mMLjXfaUzTpVC6TJbvQzU6tIADrlDs0slWMCTFIRNe3ki8M/Gq
 hycg==
X-Gm-Message-State: AOAM533aRegM09bdDdEig6TA+QM+uI7vqo+yvL5rcey9qXvZA2IxByDV
 c99w5qgleVpyM+Er0BYf+5M=
X-Google-Smtp-Source: ABdhPJzXScgmGrr3Shkj6ioJzsL24togvbNgIAZw/j+TqUTG2Tl9RzPwquDsORkx8R5DqzhDTvDJDA==
X-Received: by 2002:aa7:c6c2:: with SMTP id b2mr9351503eds.353.1631472632177; 
 Sun, 12 Sep 2021 11:50:32 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 d25sm2713031edt.33.2021.09.12.11.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 11:50:31 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mPUYg-0001Qo-Uq; Sun, 12 Sep 2021 20:50:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210910065532.31730-1-bernd.kuhls@t-online.de>
 <20210910065532.31730-4-bernd.kuhls@t-online.de>
Date: Sun, 12 Sep 2021 20:50:30 +0200
In-Reply-To: <20210910065532.31730-4-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Fri, 10 Sep 2021 08:55:31 +0200")
Message-ID: <87h7ep4oi1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/5] package/x11r7/xapp_xwd: bump version to
 1.0.8
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

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes:
 > https://lists.x.org/archives/xorg-announce/2021-August/003102.html

 > Removed md5 and sha1 hashes, reformatted hashes, updated _SITE.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
