Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC70C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 07:29:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB9D760C3E
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 07:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB9D760C3E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8265E401CF;
	Tue, 17 Aug 2021 07:29:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NlP0MLFCThef; Tue, 17 Aug 2021 07:29:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19A7440295;
	Tue, 17 Aug 2021 07:29:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 039C51BF33E
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 07:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E57C6402B0
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 07:28:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R6MvHERuCMV5 for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 07:28:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90A73401CE
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 07:28:54 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id b7so30301775edu.3
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 00:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=DJiiq5i69cVCVUCYL0BscC1v+KUVcFNJ6+Txj4S5xOc=;
 b=h+ySbFy05tWFXjtGcwlCl7c0UStHUIXzLAWGrS9xmiDIhDk65zf6AmdZh9S9XWmxuP
 K65Ivp5OUUrqztJq84pxj4XcqK2aijJ9/4Qm4Ma9/2iC/QSAKcuaTBZuH5L20HY6qqLs
 LVn+5v6HojsBS+OBkHbLzP6eB8EGsNQK8B50iw3A5h2whc9lXYazw11YU5YVMxKWu75Y
 vJCLZ4zjvimPg81LhD+N39dTZDZVBfS99gb1GRuIvaL+2vp70+AVu/cxgcy7QSfF227a
 6FS84is77iDTnRuguIALxNGG/2o3aspAJWeVIpIbtTR7WChCKJ+YMbkhSKu6OO07akgI
 k2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=DJiiq5i69cVCVUCYL0BscC1v+KUVcFNJ6+Txj4S5xOc=;
 b=NTl31O+TLvaq9ilO7kSP1bRxB2nMf8isNDGvrl3V9ULdYaDdU9D0yAvy9FCxeLSr2T
 8HWx6CXMbC3++Ey4BOBrCVmlCfSQ86J8Z0Wq0Bvgb2omPqCg5tNkgsDMHQgm+Wgxh3bi
 8n9Rv5HXtWeBrY/tohTHsMhDduP1fR5PmWN8nPcUEQjN7PAImRKsPBKeZOUyTeINwsUn
 ag1qW1g/ogn6b9fzovZRuDqo9+t7EU7tbZkzBfZnJTgAhGSX6Z3MQGO+qSTdGhIkJAL+
 HPsv/fZ7wqD4m0V4/u/27s5otwNGN1gFK3upjM8FHLwLaI1ZrIv257n5hcgfWICzHLKa
 ve3A==
X-Gm-Message-State: AOAM530qf1KIQcuSXsYMxIiDUKsirvJOYQt5jOUApgQCj2GFF+QWXfig
 3XkQEVqDxtNQI7oOa1fhhtnhRB82L0s=
X-Google-Smtp-Source: ABdhPJwO7PuRsLMSjWzdPEUFAnccb/aZueGBckuJ3VKYWXc46VlhELi65CpZ6BG2V1p8nA1wpP+CFw==
X-Received: by 2002:a05:6402:1add:: with SMTP id
 ba29mr2597310edb.145.1629185332804; 
 Tue, 17 Aug 2021 00:28:52 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 x13sm378206ejv.64.2021.08.17.00.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 00:28:51 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mFtWl-000364-9T; Tue, 17 Aug 2021 09:28:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
References: <20210816075253.3354606-1-aperez@igalia.com>
Date: Tue, 17 Aug 2021 09:28:51 +0200
In-Reply-To: <20210816075253.3354606-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Mon, 16 Aug 2021 10:52:53 +0300")
Message-ID: <87mtpg5y30.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libepoxy: bump to version 1.5.9
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

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Update to libepoxy 1.5.9, which adds a fallback to use libOpenGL.so that
 > fixes a couple of regressions:

 >   https://github.com/anholt/libepoxy/releases/tag/1.5.9

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
