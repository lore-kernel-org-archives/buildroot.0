Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DEDCD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E36AC41D9F;
	Fri, 15 May 2026 17:46:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OkOF5gHHyMqi; Fri, 15 May 2026 17:46:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9A9941DA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867214;
	bh=JBv/7KKwn5keHzqPtt/OxhO7fdgF2EttyVQgbFtX/ls=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=C6Z2ldTBTRnVlQiWHZNI1jphPbQjaKM0Qq3kFM9+IX5wHrqYnfQnMd6l6wwyBQtYp
	 8qdYkGm1AlRHijXtfXLUMlgtHVpd2cQPkFHie2M5z+psOGVxNmWpi9Ll/eMQ2W6b8X
	 6VdkP774QA5HjxlSa80rAqXf9aZjqZxgRtbsmPPA+mtqbcjHBb4pNGrHOS52nOS5Za
	 pmqqmysKJFM4fcAiKKF4QEXUxGUcrNxhoUFAAp2AKlDAeYmFDShBpnPQUz+5uD5d+m
	 Ral4tfVD2UVmMWKrAq5W6zIHC+DdZ88TcVRMONrR8KmZ3Zm6srBCeBGRpL2MadDKS8
	 wnySkkivpfIQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9A9941DA3;
	Fri, 15 May 2026 17:46:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AC5CB23F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E6EC41D27
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fqpC5MZ5fwwq for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8558841D4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8558841D4D
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8558841D4D
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:43 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4890d945eb4so6939595e9.0
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867201; x=1779472001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nIt++7HoPRKw1RDOku4OwhE5ondP0jOdfxGMeIyZGHc=;
 b=mcya76Xef9TmGLBiDaDfiLw2CkVPbJbwBW05eEgtsYbkwBLN5fDci60QbZKZLxtTpE
 Uz+sBim1ErxhdGxJbNRSVoUjuOk0Ssn0yeuOPWwV2KLE/TqKbVaiLzeWrD89A772Oi8K
 x4giw/N83oH/0pzaCjD4cSh0MT2d/JoJcsCvoMM/pDkhJDjz0Px8K42/35p5Vpern9Ul
 H4jQapDdm3rtWKVcV/3rEcgU0dnrNMsYAeac7tmZL+Aap6E6wkO41jKj7wNBz/Fq23J2
 Z0CmWQfK/86EV2ELxjtop+qekxfQaTPaLh5fJuaR7jyFpD5boC6m2JvzKkY3PtDVEAjQ
 cMwQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ90dgJanqgIMbfX1qR/zGQBz4DoRej1CSZ79yLF8/9Jo8QB10dihLAk8aP8QPcEPKUyg7moHJ93JFA=@buildroot.org
X-Gm-Message-State: AOJu0YyRnQkOG4lhtfGLM10F+54Bn53vA8XUK7EVx1pd+vZ2QF+hFsby
 J36+RY37xOYp25YaXHRrkf3URXs+L8bkMn6xyV87YTXY+Q1wbdxZujtIxB4+OtbZ7dqyTKNVkx+
 2m/tW
X-Gm-Gg: Acq92OFlpy0y3VO7YoUyKmUY0YVz6/qjHRLrZULYByOV3jbV3epMaUFu6zcrnls2PfW
 1N1Mr9/lrWw3YB1Zs9uXy8Gc4RFFK8FWSAP4BlLQo9eUbiGPy3SAdAf0HnMAjT8I0jSWbWxJ9sN
 FNm4TehqXSC/oJC3H9vSVlNQCXTRJOccj0VX/GeHQWGycdhs+GZ5ay5uwkIlpRhip9OIoj7qwd4
 NjhtcreKRXGxQLanK37cQYwZiVdc8BHb6aAU27zvGDtMrXlVv7eN8EGOPvz+gYcChwUAnA4IiOL
 7h9hL7KeIKWQ5e1g1Opvl9PAambiT8bv6L84Ke5FAlecVpprYTTlWWYrFAEJ8+pwYxw/0n3btbm
 w3nujd8t4WYV6+EQK+NqMFmtJmRvQWJG1zP68op0IxZQDLxKwmU6D1t7CIqzd3EMdq+rUKYBaHz
 FGqgGLRh1TyxB2zDDbL4WvQXe7hbWSTcMp3hVtAv2oMhMW
X-Received: by 2002:a05:600c:a09:b0:485:3cef:d6ea with SMTP id
 5b1f17b1804b1-48fe539198fmr68148505e9.13.1778867201373; 
 Fri, 15 May 2026 10:46:41 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe53ab773sm78446615e9.3.2026.05.15.10.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:46:41 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:46:40 +0200
Message-ID: <20260515174640.530418-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504162929.41045-1-peter@korsgaard.com>
References: <20260504162929.41045-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867201; x=1779472001; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nIt++7HoPRKw1RDOku4OwhE5ondP0jOdfxGMeIyZGHc=;
 b=LgNC5ZlhMnuLrZ8u1lP/2GeSuC1/7iu/VvTGBqsaOD8f5HOOvw8I/5MAganUTY2wWe
 FYwCh0wYwRb9OwN92MbXzgYY2BDReeE7gfRCj6cvGxj4QDc0zBC4lBM6QVr19LbVcer+
 PQbOUb5ckVZa56L0SUgKkUkCROZrb0yNOuR8L2BN9UdJkTXGRVmpiinpHyX1TBPuvKfd
 zuGXzv29n8sOCZIwj1I5rCW2CRZGpProZh2SQuF7zwFHTj+Yl2I0vbkIUZnCoQ0Z+XT0
 bRxD4BBtxzAUeiBIXnezDy9GmPShZMfFklUPXuVU9vzjW5GGyxovBMuaVdSP28aZnmSs
 EoxA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LgNC5Zlh
Subject: Re: [Buildroot] [PATCH] package/mutt: bump version to 2.2.16
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
> Bugfix release fixing crash / NULL pointer access issues and gsasl
> authentication compatibility with Microsoft servers.
> 
> Mutt 2.2.14 was released on February 20, 2025.  This is a bug-fix release,
> fixing a couple possible crashes, in GPGME and with IMAP when logging out,
> and correcting a small issue with unnecessary encoding of "." in attachment
> names (2231 encoding).
> 
> Mutt 2.2.15 was released on October 2, 2025.  This is a bug-fix release,
> fixing an IMAP search/limit bug, a compilation issue, and containing a
> workaround for gsasl SMTP authentication issues with some MS servers.  A few
> parts of the documentation were also improved.
> 
> Mutt 2.2.16 was released on November 22, 2025.  This is a bug-fix release,
> fixing a resource leak when compiled with OpenSSL/LibreSSL, which could
> eventually result in new connections failing.
> 
> http://www.mutt.org/news.html
> 
> The 2.2.16 release is not available on bitbucket, so change to the official
> ftp.mutt.org location instead.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/mutt/mutt.hash | 2 +-
>  package/mutt/mutt.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
> index 72c7924e9b..4fd71fd6ab 100644
> --- a/package/mutt/mutt.hash
> +++ b/package/mutt/mutt.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  eb23faddc1cc97d867693f3a4a9f30949ad93765ad5b6fdae2797a4001c58efb  mutt-2.2.13.tar.gz
> +sha256  1d3109a743ad8b25eef97109b2bdb465db7837d0a8d211cd388be1b6faac3f32  mutt-2.2.16.tar.gz
>  sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
> diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
> index 9a6be6d4a0..503f2d283e 100644
> --- a/package/mutt/mutt.mk
> +++ b/package/mutt/mutt.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -MUTT_VERSION = 2.2.13
> -MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
> +MUTT_VERSION = 2.2.16
> +MUTT_SITE = http://ftp.mutt.org/pub/mutt
>  MUTT_LICENSE = GPL-2.0+
>  MUTT_LICENSE_FILES = GPL
>  MUTT_CPE_ID_VENDOR = mutt
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
