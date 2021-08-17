Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD41C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 07:41:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4D1460F5C
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 07:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A4D1460F5C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7467F4033D;
	Tue, 17 Aug 2021 07:41:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C10xA1HOWCBf; Tue, 17 Aug 2021 07:41:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EC014035B;
	Tue, 17 Aug 2021 07:41:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF4D61BF396
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 07:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABD4080EDF
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 07:41:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EJEyBnPHm3F9 for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 07:41:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDC7080DEF
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 07:41:08 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id b15so36740937ejg.10
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 00:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=wjiuEg1fx7afMmnywlvqoEgZrkwH8Y6wmI9Vad7R5cc=;
 b=Of4hDAyeUfWN/2M13izzTDMsCx3jH6bCRuBzOhm1BwTrs+GulHQiKp1bpvH1T1ai7l
 IzWG4Ghj2Ad+dPtlt7CFNehBy4bSuCTLDUMzT/Q0jePjgF2wAgXTfpezH15Oa9MWAONJ
 ADVMxxIscqiP2fZzmF+6sq2UdfV7hc2hib08WkLadnHePYzBXVJDY7odEsKAH4oQRsC0
 9t8lTFhSFmm2QfqEyQGdxxA4X7liv1XmRlxMibyRuFS8Rm+NPpe671Bo0TNZ0DHvvY5S
 jaZOvIsp98P1c43fpbhKSS9/h73NUyuwZDvHc+GhCp2W/1gTV4AeU2Tr9qJ3iGzlSFWy
 jtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=wjiuEg1fx7afMmnywlvqoEgZrkwH8Y6wmI9Vad7R5cc=;
 b=Z3IbRsJlUL/4Dirmn2aaikU6spmraKSQATdlilXdwa3VSIJalMpkAr4x7MFrjVMWbn
 RukyUQcLtj/jY1Udu7LAEYYbpVd5ZyStQhCgJk0FmAT9jj0oMn8MJdpCcumYGagoHno6
 j7HHKRfwtEvfCRgkhb9oX7GHUm3qlPzObo5JgpBR2I6sRdLw8a9SOjimCKXjRr1Hs+aN
 eTnZq5qHeDYUrUGELZrdR6fRm3hJTPuFZf60+U/kRDuRpjiSybNHR/5GKaup9rlM13mH
 gfgV9LkguQD9HtdYtfsxvl5CNZzI2KF6sx6qkFey92LyAaOoxpjNSnGEMPwJyEJX8Q4A
 v+3g==
X-Gm-Message-State: AOAM531cqGcSop2uPqixys0jKzZPd2aXcxGeKtr10CAAYM63UdE05HeL
 EUKNeYTrChYO5ZHDK6ro+gu5fOFjVOQ=
X-Google-Smtp-Source: ABdhPJyiqUTPKASnlzHMp+/b95ZWNui4ONR2KZUwHdpboa+5gTUFMM9N/yUz9W42YLVFrNIiyzDbaQ==
X-Received: by 2002:a17:906:580c:: with SMTP id
 m12mr2525927ejq.32.1629186067124; 
 Tue, 17 Aug 2021 00:41:07 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 s18sm400491ejh.12.2021.08.17.00.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 00:41:06 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mFtib-0003Yo-UQ; Tue, 17 Aug 2021 09:41:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210816215147.2025454-1-fontaine.fabrice@gmail.com>
Date: Tue, 17 Aug 2021 09:41:05 +0200
In-Reply-To: <20210816215147.2025454-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 16 Aug 2021 23:51:46 +0200")
Message-ID: <87im045xim.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/harfbuzz: fix build without
 threads
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

 > Fix the following build failures without threads by defining HB_NO_MT as
 > specified in https://github.com/harfbuzz/harfbuzz/blob/main/CONFIG.md:

 > In file included from ../src/hb.hh:458,
 >                  from ../src/hb-blob.cc:28:
 > ../src/hb-mutex.hh:88:2: error: #error "Could not find any system to define mutex macros."
 >    88 | #error "Could not find any system to define mutex macros."
 >       |  ^~~~~

 > This build failure is raised since bump to version 2.8.1 in commit
 > e9ba1c80e8ebf5f5ad9d889d2dd37f27af87e811 and
 > https://github.com/harfbuzz/harfbuzz/commit/711c241f6c7e18c5403602375a733af74df76f83
 > which removed busyloop mutex implementation.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/0c03aca5e3ade735b54b0b9233896b868aec1520

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
