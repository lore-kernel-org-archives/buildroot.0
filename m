Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB90C76188
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 20:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1C8A6135E;
	Wed,  5 Apr 2023 20:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1C8A6135E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AsWjI6Yy1Eqm; Wed,  5 Apr 2023 20:27:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12EF2613B8;
	Wed,  5 Apr 2023 20:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12EF2613B8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 615C61BF2E5
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47604401E1
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:27:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47604401E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uidn2izVSaJa for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 20:27:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89CD440132
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89CD440132
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 20:27:25 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id b20so144128564edd.1
 for <buildroot@buildroot.org>; Wed, 05 Apr 2023 13:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680726443;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tuF9sZTllp8a5uvS7oXlA3g13uXsvm2LqMU9qYcvtM0=;
 b=lTmbRR+goeJeUpvlQJS1pr6vG/nOXk6+y4vAsxxfDpcafIP+cvCuMr4q4IRfGpoyGJ
 tyPO/icvgsTNWZ4vEmhs5aS8TDhVtN1Qnt8xFpbrLpq//G64xdoPDgMsQXqnlrwrgq5j
 0T6PuPig9w3MU5FtQFCr5C0+0xQklrDZbTpTAL0JL7yG+muPYaOKzdCu6FoINOVhq0eD
 xwJk+Cqt205A+/Gh4K4IA5z/qtlQBhDAJAz3iAlkli45GGq9kiiYyN72VUiszMo1fDvd
 tdS/SSzb4KQYTSdDevnOkLTwxNVv1hlDlNmkQIYYaOscI+PxCvG2y2oHvcP8O4jpSk+k
 Ad3g==
X-Gm-Message-State: AAQBX9eBYH30RBEVLOvuklDkoLR71hexfsID/0VNfh2PzBSshjqrvCVW
 GQ1UnBzl9NgXNlUyihO2NTOqzGRSdRXflPsXxRE=
X-Google-Smtp-Source: AKy350ZW0xKPBvl4sBCW7nkXSIsHwfyyeMdSZY6TRTc+D1i4vqfguWU6pl2ojNPIxYAibyn75vPAmj7oRlM6+Wv4KQs=
X-Received: by 2002:a17:907:2446:b0:928:6456:729c with SMTP id
 yw6-20020a170907244600b009286456729cmr2037275ejb.10.1680726443581; Wed, 05
 Apr 2023 13:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230405201403.1410075-1-pevik@seznam.cz>
In-Reply-To: <20230405201403.1410075-1-pevik@seznam.cz>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 5 Apr 2023 22:27:12 +0200
Message-ID: <CAB1t1CzwdeEjzUxNZ8KMsARJOQF642fQjDNiAPgbiq2ev5x-GA@mail.gmail.com>
To: Petr Vorel <pevik@seznam.cz>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680726443;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tuF9sZTllp8a5uvS7oXlA3g13uXsvm2LqMU9qYcvtM0=;
 b=CAVfs+gC8u/vYWSCUNtW+p58W3sVJHhg9Toj78caIj4CRT41lc/C4HBAwAJBnfNQXq
 a4YaKvhWJrLHXKjVBSQgzEDoPeIdUK6SVCDYe2UPma03utNShjGinDhQMXOUNATQTkwx
 jPgCBlDMCsUqkdiYErwaHKsC7h5nP/HRaVOLu6MPzLBMrY/MFLIjGUGGCetoAKUSBNwx
 HnX6BlUGNbOFAMs96kRK3AddA9DXLNHd/5qwlCjDFcyid3ohwNfWByUp6lNk4//qg6cm
 oGE8e2kO/FgZri1PniJ9AzdyyhaOE6AVwBJ5A2P8HtSY7AAmtnVx0VnGsL1fR842gOR/
 1ERA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CAVfs+gC
Subject: Re: [Buildroot] [PATCH 1/2] package/ltp-testsuite: bump version to
 20230127
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

I'm sorry, this patchset was supposed to be v2.

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
