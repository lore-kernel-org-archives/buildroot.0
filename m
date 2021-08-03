Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEFA5C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:40:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E2C260F56
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E2C260F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45C6E83A70;
	Tue,  3 Aug 2021 20:40:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s30vo3jZPKIi; Tue,  3 Aug 2021 20:40:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B447B838FE;
	Tue,  3 Aug 2021 20:40:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB4361BF83C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA52F605AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:40:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t-A-plQ1QX5W for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 20:40:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9EDF600BA
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 20:40:22 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id d8so26620923wrm.4
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 13:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=PKhoFMZt7ttvnpldS2fXlSONfJ0uvt3kT89ciWEoQ4U=;
 b=rVXFbEnWvD6IQ8DZDuyi6xNW3F9yn7pJLgqwfZTHc0y/Z85NZ4LJ+7BjX9vSv0evYr
 1FOst2t7b7spkZ2UX0iPijVZhTCdWOxqWQUM/nNuYBQbMv2UM70ymYSz9eTGTY3nvQSj
 3TGYfj+0ehwNDOg9MsMMhCGgZJBkY+3Y7YHgdpsyEl+zTJ565kgf6/tEBgJxrul43wTu
 cc2ux6xTANP5HKAaDNwIaRbciL+R0tOIjsBdLi301IUA2nHVJeOigjFKro6gvPpyJcEE
 NRxs/BhCdyOif6TUGkkujLsAXgPndsHwi8MdT29k2Uu5BN2JMBCfGcjQhnen3Q8hjQSA
 OP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=PKhoFMZt7ttvnpldS2fXlSONfJ0uvt3kT89ciWEoQ4U=;
 b=fTS9cGjDGKxOL/tfXDLzWNMrCKRMQXMJdNOEwHzqDrnJ3tbA65lLjeRhGNYKPPvqaW
 vqrFYU6DiG8X4zN5ZDvahW7RZGSi81u9n4YCRbAdS2fO6eAK2JU7+BFf5c6W6+BAyPzg
 yU1JJDu+/XBejBuAe5x4mcEWsjGrMHofFucDfI5rDe4GCSeNtLcK7/Nqk3W+oEAB6wZD
 riWwmiHEHj2qljgEes0qxEDYLvbspGTnc/ioz+R4Fyi64DmIks6cVGnmZL4v7tGFr0hy
 XIKylmdmN7mcAujYgc7lRN+PKaiGUc0jlckmMsK1XTqJ+5bEQTwtE2rljVxC0HHUaD/i
 eciQ==
X-Gm-Message-State: AOAM530IPtgGwuxAGK3mTh/nYt56nXGLmWXBw2O0G3dXLX0Zoh5pEEgn
 YlspXyqW9Dm2M8Ll5jpLugs=
X-Google-Smtp-Source: ABdhPJz3x8qSFEDgJzwA0LUiuCJ2q5l+NJs5CXfyyFJl5BCRax4bGrRN8CGnSkRbgBYltQ4nWHodzQ==
X-Received: by 2002:a5d:4d0d:: with SMTP id z13mr24344534wrt.34.1628023221141; 
 Tue, 03 Aug 2021 13:40:21 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id a2sm15625755wrn.95.2021.08.03.13.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 13:40:20 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mB1D1-0006f5-4C; Tue, 03 Aug 2021 22:40:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210717140513.996425-1-fontaine.fabrice@gmail.com>
Date: Tue, 03 Aug 2021 22:40:19 +0200
In-Reply-To: <20210717140513.996425-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 17 Jul 2021 16:05:13 +0200")
Message-ID: <87eebauurw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/feh: add FEH_CPE_ID_VENDOR
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

 > cpe:2.3:a:feh_project:feh is a valid CPE identifier for this package:
 >   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afeh_project%3Afeh

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
