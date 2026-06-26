Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE72C43211
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 271D3408AB;
	Fri, 26 Jun 2026 14:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l1WI2Csiq89O; Fri, 26 Jun 2026 14:55:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38BC740904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485738;
	bh=a507YTXRc+0Prwt0ybLciUKh4okpTtHHBBfICFeZvds=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qhZaiFaYR7IGBoKQFYF9MmNFtr+qq0pC1L4cb5oafJcYbzgBA95aRqyGF7pSvMbTm
	 fyj/bvyqNBsra8NPwkSSyaO6IlSABFNdYTrq6/LIV4QTf8hlw5XFWkryz/l5LF3zmK
	 Z6TeRPdFLWm3v4HEBX9jqS+pA3cwSuPoSn7Z849htt2MIW4g7OhRKA4gdA7hqKpaL/
	 54pQ+mxIfDX2gemrCUXsvpAhsWxWJBOrCC3kzQ1Yt9X8oCiDuqDCSPk4FV2VUqVsax
	 GLr6WXwv03e4HLv84tIw9S4m4uHwDZta+w6bZkNBNGmFQnUzQ5+HvMd/+70G6GlgU5
	 rfOJI1l+ToFqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38BC740904;
	Fri, 26 Jun 2026 14:55:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA00F3A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9083561088
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ImhRjehVUbPr for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:55:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5A22660FA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A22660FA9
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A22660FA9
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:31 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-49270caa53bso155735e9.0
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485729; x=1783090529;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bBDHyZ9knCCkQlH5zQwxmHccw8t2CWpCk2EAfsjAvk8=;
 b=MredL7Xtq9Kj7nRWBg4RTGsI5bLBHx9xqBpQLfBr/hmfXpNw247VaL1xrO0p5Jp3Dd
 Hok7YNVuk5HZUtUbB9YBnBZoYxvpe4SicGh3sKP136FYAjHEXJQZ6aSXNGu0EmZDguQC
 j9PY0r5wedf4G66lKiPzs4t1n1r8RFOxJWAReRgiBa0giTfXM4LmbIktmz6djSWjMJB7
 eTbOTzD0KkR2e9BEUmB+Cn89FK47KOc5ahO8IoVV+CarNGux+nOJubAHCkZL2EjNgWkM
 aYhgjhxBawOzhf5kYob6VaCS8E+N9xpeabgLLnQbXEsWk0ScCKqc9RHcWfB4hdzkT87r
 IqLw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+cBRbtvhWfqkasDb1u5vYAtvjwMQQ2RMvssN7x5H5kIqQ/phJrEuH3K7EMCgi5n9xCffK/OUZLCCg=@buildroot.org
X-Gm-Message-State: AOJu0YzshGHssa812QAWTAkAD4bhw/vV75iHHe7OPvR6DUeEO1rjwlw4
 pnBwHJLEY/xXoqTBN97Gbl7uZ7j5axij6wKIuhwGPtq9EgbFp4xEwHLRvQel1WGdVbE=
X-Gm-Gg: AfdE7cmO9c3gFOD/0lZae8JEM/u/TlQAc/dgzyka5LFf3entZIkJlSs+0KnlLSzDbRG
 Ys45Qx46AfNpQEt3QmaBomS3lrziKhgNWwgn6j3CzmIEA2NS2+uD+TktqDZpbyYuEA0tmvT/yHp
 oJ9u68mmjEg6ByHABqgLQiCxHxK4/rx1AiRf+ua84Z8TdvhPhC0jJAlA1WUNFcNmc3Hyxn6C1WO
 xzB7gyv418jWQkcWZ6AjaUn6manOlfM6KkJIdHGntLj/fDWfQm/HJZFKCJhvprcrD2KCGOSNlxx
 bm2ut1821gtjjuiYHMguBqApGo4ZyHj9iQfuqHwU4VmdWlS0rt6jQXNFk0NUgMKXyNOKIXeftj6
 cOdhfr1ydKkJfcoilUFAfL+NkAk52YmvyzpyL44Biy5Bdn41LSpT+WMbcNEiZ51gX3driK0PurY
 vyJdNV
X-Received: by 2002:a05:600d:6451:20b0:492:4c60:bfb8 with SMTP id
 5b1f17b1804b1-49266893f0fmr86765435e9.28.1782485729143; 
 Fri, 26 Jun 2026 07:55:29 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268fcee16sm91374155e9.2.2026.06.26.07.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:55:28 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:55:28 +0200
Message-ID: <20260626145528.343059-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260619185700.3353234-1-bernd@kuhls.net>
References: <20260619185700.3353234-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485729; x=1783090529; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bBDHyZ9knCCkQlH5zQwxmHccw8t2CWpCk2EAfsjAvk8=;
 b=aS6y7JJ1NjLHzzvt4+sB1QoF1gwIKwvOes8/zsjoQoL8wJVWQ/fNotIK/kWgja4z2J
 uC/oVyqnrKGj6yimLm0yMXbZLGwvId+2PM6mZoUf0Ktm6br5asPJpBwSuIVrUC9eQv+3
 G9V3lnVDZTQgBhrzT0lrUUEQs4QhQLoErGR9P01tTwpKvRGsWuptlPlwWgHNiYW4grHp
 WNgD1RNqXeZXX+mQ5+Hmni5ONw3wXWvrE1bOTcWWqvLEkXGpLQK1rMvt+co5NOldoDvC
 +rAQ6CZWg0AVJVKiaeiLVf90XzwhXd36szTFPHIolH7+PInIRWnvdRgLUp+riwOUcWAO
 ezyA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aS6y7JJ1
Subject: Re: [Buildroot] [PATCH 1/1] package/tmux: security bump to version
 3.6b
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> https://raw.githubusercontent.com/tmux/tmux/3.6b/CHANGES
> https://github.com/tmux/tmux/issues/5109
> 
> Fixes CVE-2026-11623: https://seclists.org/oss-sec/2026/q2/934
> 
> Switched to tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/c15a0ae45c2f5c1817dbc4695794841cc3a00ed6
> 
>  package/tmux/tmux.hash | 3 ++-
>  package/tmux/tmux.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tmux/tmux.hash b/package/tmux/tmux.hash
> index 867fbd6c55..34419940f3 100644
> --- a/package/tmux/tmux.hash
> +++ b/package/tmux/tmux.hash
> @@ -1,3 +1,4 @@
> +# From https://github.com/tmux/tmux/releases/tag/3.6b
> +sha256  390759d25fdba016887ec982b808927e637070fd7d03a8021f8ef3102b9ae3c7  tmux-3.6b.tar.gz
>  # Locally computed:
> -sha256  b6d8d9c76585db8ef5fa00d4931902fa4b8cbe8166f528f44fc403961a3f3759  tmux-3.6a.tar.gz
>  sha256  c031bd37f464c534277814f6aa38686fa023d094261d57fd2545ad592bb53ccd  COPYING
> diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
> index 1f98cad706..b435c62a8c 100644
> --- a/package/tmux/tmux.mk
> +++ b/package/tmux/tmux.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TMUX_VERSION = 3.6a
> +TMUX_VERSION = 3.6b
>  TMUX_SITE = https://github.com/tmux/tmux/releases/download/$(TMUX_VERSION)
>  TMUX_LICENSE = ISC
>  TMUX_LICENSE_FILES = COPYING
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
