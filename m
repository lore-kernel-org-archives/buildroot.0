Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3C9C982C0
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 21:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BA1A41C17;
	Fri, 16 Jan 2026 21:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X7e6ADAdvf5D; Fri, 16 Jan 2026 21:35:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D997E41C03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768599355;
	bh=3Ef7alEz+v9MWF85GrOnjdQ4fLCciH1lpKMj2ByLn3o=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EU7bBrSKeUcIPbpUPq0pP1ngPQzKnnYGvpHabASyrzmsHM5PMZHA/NX/J3T9jO/4p
	 TObeb1sGEhly91M1DF6/X2eF8v2mUzIHWebQ19rgUHEwCsCz668qsOToKZE+MevxMn
	 M98vp8k9YoUIljXBo1pNOIqR9nHqtuhJB8sJERNR0z5yHj+menC7WyaCSPGYbZT+ub
	 UdNY/PhDZDEQXPEBIpBpKI8OGl0qA9hKZoxEdt9PtN4a82NzuAjPv5ItJgvtdSwvLV
	 st/H4yHFhEUFYhh2aOrwRflBDa5mAFu+u4nz9eX804RfRgz/5NjhMPN4S1OZUoo4rI
	 8/PjXCfzL+k8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D997E41C03;
	Fri, 16 Jan 2026 21:35:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 27B18160
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 188C061676
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4b5OjhgPLGOH for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 21:35:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F2B8F61673
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2B8F61673
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2B8F61673
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:35:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 513F91A28A7;
 Fri, 16 Jan 2026 21:35:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 269D7606F9;
 Fri, 16 Jan 2026 21:35:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0CA1710B68E6B; Fri, 16 Jan 2026 22:35:49 +0100 (CET)
Date: Fri, 16 Jan 2026 22:35:49 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aWquaFbHJI9o1iqw@windsurf>
References: <20251220170623.155785-1-bernd@kuhls.net>
 <20251220170623.155785-2-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251220170623.155785-2-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1768599350; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=G+9GqXckma3mmL67lvnckPkK3gyRTTw8kLgpCJLxIcU=;
 b=CUosT/keOLnAuy10Ca1Sm3Z1zSnib8BNrtaMaW7I5MjncD6pilQdu3LdJykqgTuCe2m3Sl
 DGPP1IS9dWlQETwiYqzVdk1JMwTM4ZcniDGHpVDenKniS4Mkzu75jDugMExPKZmCkbe5Zi
 iGglkSHJAG3Mm39TC2/r7JcjcNGevg97KkALGx35lzzSYOGCR6AQvTribiHBkGAeR75YNZ
 yIswElcbUO3ADLudj+C2+owzQdCFu5SAwixOOOO5xlNTuJOjvLhPw0Me7MgKcjcsbZvg2P
 7Z7h/s5OPHr1RC+YYQNb+3DjIau3JUFUDRNrYj1ONQ7nvrgAt9EYSI3P8p0adw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=CUosT/ke
Subject: Re: [Buildroot] [PATCH 2/4] package/util-linux: fix nommu build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Dec 20, 2025 at 06:06:21PM +0100, Bernd Kuhls wrote:
> libuuid/src/gen_uuid.c: In function 'uuid_generate_time_generic':
> libuuid/src/gen_uuid.c:629:17: error: implicit declaration of function 'pthread_atfork';
>  did you mean 'pthread_join'? [-Wimplicit-function-declaration]
>   629 |                 pthread_atfork(NULL, NULL, reset_uuidd_cache);

Since when is this happening?

> +# pthread support uses pthread_atfork, which is not available on nommu
> +ifneq ($(BR2_USE_MMU),y)
> +UTIL_LINUX_CONF_ENV += ac_cv_lib_pthread_pthread_atfork=no
> +endif

This is also the wrong fix, it should be fixed in an upstream
compatible way. The failure doesn't make sense to me. Indeed, the
configure.ac contains:

AC_CHECK_LIB([pthread], [pthread_atfork], [
        PTHREAD_LIBS="-lpthread"
        AC_DEFINE([HAVE_LIBPTHREAD], [1], [Define if libpthred exist])
])

So HAVE_LIBPTHREAD should only be defined if pthread_atfork() is found
in libpthread.

And the only pthread_atfork() call is within an #ifdef HAVE_LIBPTHREAD
condition:

#ifdef HAVE_LIBPTHREAD
	static volatile sig_atomic_t atfork_registered;
	time_t	now;

	if (!atfork_registered) {
		pthread_atfork(NULL, NULL, reset_uuidd_cache);
		atfork_registered = 1;
	}

So, some investigation is needed to understand why this configure.ac +
conditional compilation logic doesn't work as it should.

But isn't this something Julien already had a look at a long time ago?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
