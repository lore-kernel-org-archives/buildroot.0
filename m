Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1EEBC433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 06:35:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40D09610C7
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 06:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 40D09610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15FE4405C9;
	Tue,  7 Sep 2021 06:35:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hK8wp97a2cNi; Tue,  7 Sep 2021 06:35:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43AE6405C0;
	Tue,  7 Sep 2021 06:35:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FA501BF2A5
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 06:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86E43405C0
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 06:35:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iUDI6OIIoBK7 for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 06:35:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 714E740599
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 06:35:27 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id v5so12394188edc.2
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 23:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=CURUqoJ/xEp+dr3UuJukPDoekI5B6FYJpgJzFpfZpZw=;
 b=NmeSEX2fVLVnfJjJCKaMV+e0NTSW6HoVWvS5yQl9yqpUjELee76WtwpzR1YwyDqr0q
 dkudaZ3rQ76VDWisMMRG0Vo0F+qgsHODx8YZ3Gok1OS3NaUwS9eFZbUIAvQoy9X7chCq
 p37hBeOykuIAylHre1UtsawP5Cakf6sjfjcQt3Z/nxjcXo4+VygqaoITdQhfSuBMdIyF
 kD8O9XErHstS/JXbjXBXPFyRpqjcL+C/2JzNzx1ecLpm91VK3/OclwlmwctXkE8wjmr2
 dXxMd/Q17C0CMYX3+gh8gZPs49vm8uYjFbW8KwUAnjqA8XEAldsm4RP03vDf/Fkkq5sy
 XYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=CURUqoJ/xEp+dr3UuJukPDoekI5B6FYJpgJzFpfZpZw=;
 b=smazGjfXDhdJwpgNahaCGpSwXKrhNMci/3M7JOLU6fyt1ekbROTgVABxXPWtCdFk2R
 gFJTl+q1olJUaiPNNhrY3Wxp3oAKZ2zCZVOs4Dv/BlCABof3I0ds1MsgRBRC9eeCG+YP
 DWv+cCBxuoLQhhPpu4tH9yZp6fTJU2NVtDveItpxt4DxC5pERaqGLKzCp4Nar2ofJNT1
 dmHwJlmziUesb+tu7rhtI/AtXuF0FNDMcXH+9eheadG/J6jMBGgU1dbEeGXMd/NqLhul
 K8YGGGfNLs18hIFqzqXxYCdUf43rqAdst/Cjlx23aFIymIKYKAeKsLlKSm6iYnQR7YUC
 Y9Gw==
X-Gm-Message-State: AOAM533dWvVjGSF4KmyTI4+RDzVb1ntDTJgnJM1+V6D+YDU5tvVLNtY3
 xa79v2rqaSrRzRbv0M/vJu0=
X-Google-Smtp-Source: ABdhPJwiXqOoOaMfMahVfe4bpf60VYNjbe7CUJztx4Q7tNavKb/1SbUPNAwnjc60kvFJPMXuZqFXxg==
X-Received: by 2002:a05:6402:b9c:: with SMTP id
 cf28mr16985612edb.356.1630996525608; 
 Mon, 06 Sep 2021 23:35:25 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 z15sm5822729edr.80.2021.09.06.23.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 23:35:25 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNUhY-0001Nd-G2; Tue, 07 Sep 2021 08:35:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210829192853.2061392-1-fontaine.fabrice@gmail.com>
Date: Tue, 07 Sep 2021 08:35:24 +0200
In-Reply-To: <20210829192853.2061392-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 29 Aug 2021 21:28:53 +0200")
Message-ID: <87h7ewhp03.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-pam: find libxcrypt
 through pkg-config
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

 > Find libxcryt through pkg-config to avoid the following build failure:
 > /home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-musl/10.2.0/../../../../riscv64-buildroot-linux-musl/bin/ld:
 > .libs/passverify.o: in function `.L30':
 > passverify.c:(.text+0x368): undefined reference to `crypt_checksalt'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/20b14e222b35c2d1269960075832b784ba81aa1a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
