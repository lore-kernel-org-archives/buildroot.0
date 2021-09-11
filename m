Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B38BAC433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 13:29:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80868611CC
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 13:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 80868611CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53C7E607D3;
	Sat, 11 Sep 2021 13:29:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3xnihQw3fsyl; Sat, 11 Sep 2021 13:29:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1B8D607D0;
	Sat, 11 Sep 2021 13:29:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9DC751BF2B0
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 13:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F37A607D0
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 13:29:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VljCPFyIVd4N for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 13:29:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E576D607CF
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 13:29:33 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id a25so10227331ejv.6
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 06:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=41tsvTqZp6/xh2zx/gjSdyNcVYfvd1yfaPuyw/4xLLk=;
 b=IFtvfWAiy/2mYsmsXHlsZBL19lzAruA2HlPiUd3iwqDTYmDfdsTcRkQU79lxtV+o5/
 YMGaAUkgy9oj1E3FhfMN5bk88FiZocNZrZsZv1gJDpVUsBpxzudJdFglPD9R1T5ORg/P
 iwaN1hhoygpkivFjBVzxgtbEUTkwdlEFEDlwq876nq1Mga1uRAyZfWKLUWEwQYdj6wv8
 kdnkJz89WfK+WkioKgYQOOsOJM+bsEAibbisOAu7yGgC0VH9KczigFNo39CKJOiiss2M
 AtORhD0+F2DeTzKCRdUv8tWJk5G1oGXSqCMNiwR1971vHrqG3J6rvGqPLPcDI3KkqaV4
 eEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=41tsvTqZp6/xh2zx/gjSdyNcVYfvd1yfaPuyw/4xLLk=;
 b=UltdipR2VIDbRl7hzSTWSsq4uvccwTQRBj/zsyXWniYXVGb0aHsc68T3Cyw775wxDk
 wsMhYI2yQMzIJQ1nCBu2aOfXawvDqZi9utbu3cTtZneoWx6K0ZM06d5WN96RiRuv26dW
 fBu8/JeIECKLWfVUq1IlCFGBKHOIRrtG3cx8fOBNLo2mUlxDXhvOBLfdE0qiIwmUor4T
 Rzj4LfnK5QJZHFJw2BEyCmhz82l+erZTaT6FbX88jPxoUoWmV7nDL+hWBSqCtPWROW3l
 GCB92fNC95X1c5wCparO+E0V08nKIJM0Qx0aqzr/x6rHLJ4NHy2SWAvDnAvD8Vfie092
 BwcA==
X-Gm-Message-State: AOAM530qzsf9k1xo1rrpa0f7LuTQHYj64gzWrUhlNFnGJeHHbAvh3hRY
 eu+lX39ua/SPT7/Hct+GV2A=
X-Google-Smtp-Source: ABdhPJw1azS+YmyWv8Il+ZTTv/GItMJMsPt4SgYh7w2USVA3i+mt69NMFWi9Cr78W/DYhzVXBnp07w==
X-Received: by 2002:a17:906:2a8e:: with SMTP id
 l14mr2800928eje.321.1631366972238; 
 Sat, 11 Sep 2021 06:29:32 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 e28sm926840edc.93.2021.09.11.06.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 06:29:31 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mP34U-00076T-Gy; Sat, 11 Sep 2021 15:29:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Matthew Weber via buildroot <buildroot@busybox.net>
References: <20210827205430.39745-1-matthew.weber@collins.com>
 <20210827205430.39745-3-matthew.weber@collins.com>
Date: Sat, 11 Sep 2021 15:29:30 +0200
In-Reply-To: <20210827205430.39745-3-matthew.weber@collins.com> (Matthew Weber
 via buildroot's message of "Fri, 27 Aug 2021 15:54:29 -0500")
Message-ID: <87o88z5jgl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 2/3] fs: new OCI filesystem type
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Matthew Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Matthew" == Matthew Weber via buildroot <buildroot@busybox.net> writes:

 > From: Sergio Prado <sergio.prado@e-labworks.com>
 > Add support to generate OCI (Open Container Initiative) images.

 > An OCI image consists of a manifest, an image index (optional), a set of
 > filesystem layers, and a configuration. The complete specification is
 > available in the link below:

Out of interest, what is the functional difference between this and just
doing docker import output/build/rootfs.tar <my-tag>?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
