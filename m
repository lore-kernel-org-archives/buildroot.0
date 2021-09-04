Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A7CC433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 21:36:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCC6960EE3
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 21:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DCC6960EE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A26A80F62;
	Sat,  4 Sep 2021 21:36:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BOjXtcWo2MlK; Sat,  4 Sep 2021 21:36:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA9F180F5B;
	Sat,  4 Sep 2021 21:36:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4CFDD1BF3ED
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 21:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 490E380F5B
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 21:36:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KJP8D3XHF0cb for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 21:36:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D18580F59
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 21:36:46 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id lc21so5291222ejc.7
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 14:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=SvlG6Ejm40RrfmqPNP7ltx2eNV5exifGGzXadFxQSMQ=;
 b=SY3m658X2nUZ1V5pk5IOLzLuD0e81fMILEnZpl2cqB+UpPcutno67PL647AZnCkKNs
 CvwivB4NbNsTzSW0PNfwQmbLNSufcIBCubUgyGWQT9eT0RG7zPFUsM/a/3nqp+VFVjeE
 RIFlvPyRj4gvA6yc9ocBlX+Z7Bn3fU24ICbKEm4fz08WcqDxQKyjSHa8EY+QgXx2urH6
 PipapXK1aWTF952IvwCCXn6xGwo/uYyEdMq9CBcMBazQ9dfoHXaGHxrzKfkW7lPqL+Fo
 X2absNN/+VUsflrUj5NRlPa+qMZn9cfJ1/H0K+CMfI/ya3On3vGuC+9dRF9RluMQAEnR
 QjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=SvlG6Ejm40RrfmqPNP7ltx2eNV5exifGGzXadFxQSMQ=;
 b=iEzWBkRZNLn0A0xm2sGYlFR5w2vR6iFeYgvyHxLwyrF1ni5mJYVOMWiiCyuSpIolWZ
 aWrhVSFE6FvINuiFlR6b8aFu9AOpmPCUwD1+RpnbWKcUQb6wVHKTQhtJ/6uuNiAy7qsI
 SFllNcuhvtoUds9BiXAD39ek9NCPeg9N5fzuDf5SBccYPv4L3aWLt82DsiA1LAqJpjv+
 EWWuq4AF0rHFrCQUeYsygB4hJYDClZZ7FQbLcFHYoTfO7/KTNzIK15+RxzbMgvuyAq2j
 +nf3MkHTsM0hhRMN7A0MbrQ94H+R45X2g1ffNL54SJM8hOM7LNIauk4RiZ572zr0pqTI
 IT7A==
X-Gm-Message-State: AOAM532vPoScs8nA9QYUaRDuW0pg9FmRlPHRLDjdADI2BInh7ZyNPk64
 os7PQ/DXKMPg5eM97RqEky8Jb4ZDOHc=
X-Google-Smtp-Source: ABdhPJxZYZuYglzO3VKk0qPi3PLrUaUOvxzxThZ+i9YGItCmdZ6rCc9R3mVv72/9idln4r2bGrcrww==
X-Received: by 2002:a17:906:56cc:: with SMTP id
 an12mr5938678ejc.456.1630791404389; 
 Sat, 04 Sep 2021 14:36:44 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 y20sm1509659eje.113.2021.09.04.14.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:36:43 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMdL8-0005YU-84; Sat, 04 Sep 2021 23:36:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210813211648.3483726-1-fontaine.fabrice@gmail.com>
Date: Sat, 04 Sep 2021 23:36:42 +0200
In-Reply-To: <20210813211648.3483726-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 13 Aug 2021 23:16:48 +0200")
Message-ID: <871r64m39x.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/fontconfig: fix per-package
 build with NLS
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

 > Add TARGET_NLS_DEPENDENCIES and host-gettext dependency to avoid the
 > following build failure with host-cairo raised because fontconfig
 > installs its ITS files in the wrong directory (i.e. outside of
 > gettext-tiny symlink):

 > mkdir -p /tmp/instance-0/output-1/per-package/host-cairo/host
 > rsync -a
 > --link-dest=/tmp/instance-0/output-1/per-package/host-fontconfig/host/
 > /tmp/instance-0/output-1/per-package/host-fontconfig/host/
 > /tmp/instance-0/output-1/per-package/host-cairo/host
 > rsync -a
 > --link-dest=/tmp/instance-0/output-1/per-package/host-freetype/host/
 > /tmp/instance-0/output-1/per-package/host-freetype/host/
 > /tmp/instance-0/output-1/per-package/host-cairo/host
 > rsync -a
 > --link-dest=/tmp/instance-0/output-1/per-package/host-libglib2/host/
 > /tmp/instance-0/output-1/per-package/host-libglib2/host/
 > /tmp/instance-0/output-1/per-package/host-cairo/host
 > cannot delete non-empty directory: share/gettext
 > could not make way for new symlink: share/gettext

 > Fixes:
 >  - http://autobuild.buildroot.org/results/00e29958cecfffa4e994ab549637117dd8f55c30

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
