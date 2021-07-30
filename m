Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C931C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 13:22:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BBC060C41
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 13:22:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BBC060C41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4162740384;
	Fri, 30 Jul 2021 13:22:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Znh-9qbs6EJi; Fri, 30 Jul 2021 13:22:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 388D040231;
	Fri, 30 Jul 2021 13:22:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 02CBF1BF390
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 13:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F27FF40231
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 13:22:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8DzQ6dnsQLLd for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 13:22:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CADD940159
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 13:22:29 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id x14so13130019edr.12
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 06:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=NaF9PCANvrze3aoYLzhxVgUFNWm/1F7sZtVGqlokhFY=;
 b=cC/37cF2nPibMbpirMEkpmIlJLq6871vHWdVzQ0fR9l/0aH6bb2M9KiboNiJfAPEvt
 DdtHa8JTYplNT+Ii0uQ5puOC6f/ar8NeXl7IyRlmhMMx0ozIwWTYPxhVeo2QNflhKXGV
 AietOD4yHlg99MmnP83UtdhjgRKkudzOBLoFFqgIUPqghO62NNwRFQSR8eRCZVtZLkBS
 Vjb1DC0DfsfWarzbaKUZLb56mmfwyj2+zGDYoQ1zx1hhUQv5soTMI7HLFjfGoJyLw/je
 tKL+TgjPFoAZMnZC3x6f6lMZi33OGSeuA2m99bntROamKZpAXqrshzi30UCZsECSDUjU
 YDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=NaF9PCANvrze3aoYLzhxVgUFNWm/1F7sZtVGqlokhFY=;
 b=pqgr23fHCg+m/3wSSxIoM5bozH0l+X3DVzdlSYsmAvIpyKCJl8CdkbVY/aCIpWduzJ
 6WgQpLwHR39rquwMEZuU9GCD3MUrW2J4Ja04vZ9KaU8WYHnBh6oOjgApmjaZpFsaa0/l
 JaLHGVZxnHg8MuJJMxIVo0O62CcqhwAPJK+GThAUd9RKO224+cwjeeRmjPFP0O42Pq5E
 25T6MMq2Hl5gzRTzb5mg6DhdNiitbFhtkVBSy2FkfpvqsvKzkyyVaTY4o/LAm/1txWVN
 ncFr1IkXtv09oKhz6aPLT5Y1V51rCVoVIYM6N0gRYyQq8zHYu2NaYHO5eZLLlP6dI6mQ
 A+Uw==
X-Gm-Message-State: AOAM532jNe2i6567jZNi//uQH4i7lufiTuGnb8vFPJga8mqlCSB2CGpG
 hHL3+V4IZ0SmbeeDA/Do6B5DAKSTCa0=
X-Google-Smtp-Source: ABdhPJwgsMvOzzXnJk/h9zP2OUy1HBjfHFQR6HBl7IeBKAn4X7cFrOgt5ETpcwzPvtEriBEECp6+XA==
X-Received: by 2002:aa7:c50d:: with SMTP id o13mr2870031edq.153.1627651347944; 
 Fri, 30 Jul 2021 06:22:27 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 j24sm682231edp.44.2021.07.30.06.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 06:22:27 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1m9ST3-0001P4-Ku; Fri, 30 Jul 2021 15:22:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210714085346.2464634-1-fontaine.fabrice@gmail.com>
 <20210714085346.2464634-2-fontaine.fabrice@gmail.com>
Date: Fri, 30 Jul 2021 15:22:25 +0200
In-Reply-To: <20210714085346.2464634-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 14 Jul 2021 10:53:45 +0200")
Message-ID: <87bl6k0wdq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] package/libmodsecurity: drop
 AC_CHECK_FILE workaround
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
Cc: Frank Vanbever <frank.vanbever@essensium.com>,
 Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Drop AC_CHECK_FILE workaround as it is not needed since version 3.0.4:
 > https://github.com/SpiderLabs/ModSecurity/commit/8af8cad90779a64af87d29b3a44f3ea2e0a270c2

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
