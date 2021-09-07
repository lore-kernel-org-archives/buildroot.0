Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C448EC433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 13:54:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24A4F61104
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 13:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24A4F61104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02691605DB;
	Tue,  7 Sep 2021 13:54:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0xbvurWwMeDx; Tue,  7 Sep 2021 13:54:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52E4060767;
	Tue,  7 Sep 2021 13:54:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6EA711BF2CC
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 13:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E527605C4
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 13:54:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vRsCoP6ar_V7 for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 13:54:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E8D0605BD
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 13:54:12 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id q3so14059300edt.5
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 06:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=dpZATinoYeNIMCaYAlhel6ebCmC2DveFR+5CRaenK3o=;
 b=hEptoEHFbqiOwIbGaXTnhdBHmjaVS1OIUrw5uWImwRE/nYjcB7Dmty7O5ovUbFPwpi
 KfRYQCtf/V8Dczv+eLa/YX9NTqPu65QW5jWpvApd3P1kpizZAGKKTv1gKVxcn3ulI5L3
 YHsLFE659gBQ3kPYo9OPz9ExCgY1Nsm4iQCwWt9Dgo323KuMCL8jJLi7XtDUzpG/E7B4
 2i6FcmZB+DqP4GRVVtKTA7ueWp6fSlBahzs5WCFS7EC93SL3SkDM9E078wfi1ZYO6Wqu
 OGUtfH9c8DMEVt76PQVSl2v6xhq7Apm9yiD+1Avvb7L9vmmzjBABf6nPQZKewxtCJHS1
 pB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=dpZATinoYeNIMCaYAlhel6ebCmC2DveFR+5CRaenK3o=;
 b=giolgMAjK9Dp0gswhYxeFGiNEmfAJenKVk99rDH491axLSL3CKt6aHowpoIruPSMVs
 ckV4IuBdyE7ofosNLjSfa4mF/uEdatJxFxZlyJ8hQMu1ZkWvutQm4GGHSa1qi1jLfbdv
 CcbA+iWrD17DCuSl0PnONaHzksmFboGrZ/sDPUhRRB7wCiML9zyeLqCnzLYa3H1mbYS+
 8Fy3toNh7AJw8qRvrZmBwce0WXXdI7YzIxSeFu5Jr6ttNg4y7ah/x9+T7NxIifFoJ9m3
 MDw+X8haQkuMRxSOARJ9xxLmxP3USudiVearHh8X12UwbChVWqP0yxc6zpuAjN49k3V/
 g6Ew==
X-Gm-Message-State: AOAM530zgFjrojfhoLZvEipOdPkusThp1pAZYjp5WgQYTbylXpK4ayE1
 BF4zRHCagv/JotyE+hUq0UI=
X-Google-Smtp-Source: ABdhPJwBXYm5BFX2BOMxFWjfJQ+GdjD7NaF+yrmbsH/PtKwF33GnFFLLcXtJPpoKsjOo2uVThB9TAw==
X-Received: by 2002:aa7:d818:: with SMTP id v24mr18804635edq.197.1631022850629; 
 Tue, 07 Sep 2021 06:54:10 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 v12sm6602914ede.16.2021.09.07.06.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 06:54:10 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNbY9-0003cn-GB; Tue, 07 Sep 2021 15:54:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210828150604.946236-1-fontaine.fabrice@gmail.com>
 <20210828150604.946236-2-fontaine.fabrice@gmail.com>
Date: Tue, 07 Sep 2021 15:54:09 +0200
In-Reply-To: <20210828150604.946236-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 28 Aug 2021 17:06:03 +0200")
Message-ID: <87czpkebjy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] package/c-ares: fix build with latest
 nodejs
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

 > Fix the following build failure with nodejs raised since bump to version
 > 12.22.5 in commit 7038b029d8c8774eca6d7888d6642d7e84ff5165:

 > ../src/cares_wrap.cc:42:11: fatal error: ares_nameser.h: No such file or directory
 >    42 | # include <ares_nameser.h>
 >       |           ^~~~~~~~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/a0f867d5e765fc1aa052de5e53ed350b3b20743f

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
