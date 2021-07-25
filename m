Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 601C2C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 20:15:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE89F60E90
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 20:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE89F60E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2AF340190;
	Sun, 25 Jul 2021 20:15:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ImvVbtndGLim; Sun, 25 Jul 2021 20:15:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD93340160;
	Sun, 25 Jul 2021 20:15:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 27B1C1BF25F
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 20:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2368583033
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 20:14:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QQsnwBLU7HGM for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 20:14:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD49282FEA
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 20:14:57 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id l6so5850494edc.5
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 13:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:mime-version
 :content-disposition;
 bh=BlQHQpKVGEl385T3cjW8czcCUcaVb2zRM8tDCehoeP8=;
 b=rT5I1KFURAQr57m9e3k2Aqu2L1GtrFxp3T1W53+auMtRsMJo1L8XaELd4tOPQ6p6Ws
 44GZ62AY/8Ufd6SpQnm+H4We3JUGlwMjjmthwlV8wq1ghradj/3tZQQyVDxTeSn4upwC
 bpXSbqaXzkahbEdUj6yNaMctIqcx8WksZQqaaqSY4onXShl6tdoWdWx/L0NLhcd4cvwr
 oywQybW32wGw1Q9fiMnPUNYvZYopnvOQEtwUfidXQmm1zvOMJCdjqezrKcfRJQLdGOtV
 8+TBQEE7f0q5/kYc+HEUtloyQ3h8K+KOwOkyxf1GAPpslEUrsYZGFoBJVexR/isVanY1
 MX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :mime-version:content-disposition;
 bh=BlQHQpKVGEl385T3cjW8czcCUcaVb2zRM8tDCehoeP8=;
 b=MtasZ+xMroHbx7wsL3UmVMUmk71RgGXvC5p5erQMVtVrCZn/jrxQ9V2VBS+g2JWroS
 UktpMutH6hEfhuWY1e0mw3NIxfEeGr/kugNizn1qS3lLkgfBu0SACrLoJUfYUIErEx1b
 8E3dXoqwaZ1S1oLUTkDhNcPGBww7A5xtQmpo5Ztx/n1mG68XhIRfQl8WWRXDXN35Rsmn
 728kJRtSX/W9vX2v19634JansQj3qcJLvpTekKH03VnOKwwTCDZ9G0CX5dZ72GezjMXJ
 Ggu152015A6iSOEeR5xgdkjjIlMH79NHw9Fh+hixXBJQbaESniJb1fCMa9jKNcq0wPdi
 hDxw==
X-Gm-Message-State: AOAM533vRJ2LFVApHxKD4i9TSlgWTYTn6Gzw1GrXpn4+Oc53lH3kffb+
 S4HXPfAHJCiI3BPnCETUhJGmNbyyOqjSRA==
X-Google-Smtp-Source: ABdhPJx5Vm/VG7fLJMldw+TGIeKFTkHxY618JPpg2eyRlkl2uyiWoj0mJw/9uYyDe4Yu6kUHVYjiHA==
X-Received: by 2002:aa7:c042:: with SMTP id k2mr16702103edo.104.1627244096061; 
 Sun, 25 Jul 2021 13:14:56 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id gw15sm13654025ejb.42.2021.07.25.13.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 13:14:55 -0700 (PDT)
Date: Sun, 25 Jul 2021 22:14:53 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <YP3GPccSpJbFMAgv@pevik>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [RFC] rpcbind: Remove
 0001-Remove-yellow-pages-support.patch
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Thomas,

I'm thinking about removing
package/rpcbind/0001-Remove-yellow-pages-support.patch patch.

It was originally added in 2012 in 8bc245da21 ("rpcbind: new package").
At the time constants YPBINDPROC_SETDOM, YPPROG, YPPASSWDPROG were missing in
rpcbind (added in 2015 in rpcbind commit 9e0c7ac ("configure.ac: Check for rpcsvc/mount.h").

I'll verify it, but I'll strongly suspect the only problem was in these missing
constants and very old libtirpc. Thus it should be working now.
Probably the best approach would be to disable legacy yellow pages in upstream,
I can ask for some configure switch. But if you're don't require it, I'd just
drop the patch which is not needed any more.

Patch was also somehow related to package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
(originally added as package/libtirpc/libtirpc-0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch),
which was removed in 883a33ece5 ("libtirpc: remove NIS patch") as not needed.

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
