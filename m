Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B7CCC433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 06:57:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2148860F21
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 06:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2148860F21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D924D404BD;
	Tue,  7 Sep 2021 06:57:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dWQqjLhGKErd; Tue,  7 Sep 2021 06:57:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 169944028E;
	Tue,  7 Sep 2021 06:57:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E25FF1BF2A5
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 06:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB7B860BBD
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 06:57:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e9-8wTf6RHaQ for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 06:57:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4988D60BA0
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 06:57:35 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id h9so17710743ejs.4
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 23:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=S0ip7rn8WhitexVnnWNqMMRTzC4Xy1FBOXEwrvuKbl4=;
 b=FpA9Nu3B7aPsqQ4eRJe3D1dyvGDWOTdKhLgeSzfaf2FQ2R7hU/M2MZDYFvvH7PBuPy
 kOi+At7DvRVRflEu1sow/S9v8q2P76ciqWAjqTnWCeukKlkHdMKwrHQayMHKtq8E6iWn
 yGXpaStrbUkXZFuWRP7y1cQ/Zje9jrqx/Wb/SsLJP01EXyX67pi/2LvS7KiXvzmGsEEE
 V2i5loeOpTjlhrCBpOThhP+dywO6T44NCHZB2iBsdWyyIosrbu1EmqtJeaxWWTGIiG4N
 G5rY2oOjSq1J6+xL4jn03Pet/8zjKQcN3VQVuc0hG51QQscOjL3stGSYTlm8+3fiet81
 p7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=S0ip7rn8WhitexVnnWNqMMRTzC4Xy1FBOXEwrvuKbl4=;
 b=OcNYEAxeLLFnM1HwH0acbuI8X3RChdQXugV6ArJXWeHPA2FQhXYlDlRoV+A7QLXBUZ
 rBIPwTvaKmVazYPOWympmwYPsa61VCwmK4JpfymGJejI/nClISANcDke4VNlSAje/yUg
 34mvDVblCU3K0FLQ/nS4IS7gzV0odtsCpA3hA6y0UQDkbKIDel6L1EoTFHffqdDvizCR
 QBBp5h9c6NV9uQeRisvpCADimJcKH1Nj/7myTigyZCoKq+jXPZ3zIFbOmva5T01fMBsq
 LV7auEfBWRCyYVXCXuZi5ymbUXFh7rCHC7faBLaCpMoh4kLOLD3UbCC1iPVrBpnRU3bg
 Ew3g==
X-Gm-Message-State: AOAM530lyk3+a/OSG21BGOqsppDlVCRODDl9KgYp0CytxSdy1btiHmZo
 4rkDoik2wnJqO7b5YOy038sbG7KWW+w=
X-Google-Smtp-Source: ABdhPJxShEjLbu5nKEVSXaz5c4bLFMH4JmHrYvQmOLHOSBWW46w6V48ZAwcFbs34137g0AgJUXfbSQ==
X-Received: by 2002:a17:906:c7d8:: with SMTP id
 dc24mr16460534ejb.365.1630997853420; 
 Mon, 06 Sep 2021 23:57:33 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 o19sm5846826edr.18.2021.09.06.23.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 23:57:32 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNV2y-00028s-BU; Tue, 07 Sep 2021 08:57:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210824215813.1122744-1-thomas.petazzoni@bootlin.com>
Date: Tue, 07 Sep 2021 08:57:32 +0200
In-Reply-To: <20210824215813.1122744-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 24 Aug 2021 23:58:12 +0200")
Message-ID: <871r60hnz7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: drop Maxime Hadjinlian
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Maxime has not been contributing to Buildroot for several years, so it
 > doesn't make sense to keep him in the DEVELOPERS file and make us
 > think that those packages are being maintained and to Cc: him on
 > patches affecting those packages.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
