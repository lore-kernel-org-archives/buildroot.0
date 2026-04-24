Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA17FED3F0
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8D7284E95;
	Fri, 24 Apr 2026 16:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LA_N8SZhu_dK; Fri, 24 Apr 2026 16:27:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C56984E69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048042;
	bh=AqdBeGsn1hW+NXN/67bQINDwAVnPw8oZBnStGWTEytY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=U4s51R4WwKvMrz2YL3IPI9OaZ94FfKsC7vnjKHLhojDxh3otD54+2LlwRBFgt02jx
	 tQU+9qB1O+QOT0KrJgZPlCov/7AUKvt6gk2wXNuET0rabfe4DG/xpKo3erYMz+L/35
	 /AKB88XfFbUhCvsWRJMvsnEK+IZ03iOpd+SYPz6TvmWpQxCJWGVrJqk2R/FyI3kBh1
	 i2Wva86ZYHuI1uD1fWz+gPh1Uwg0STWuBC40X5iqJOywI8V8JajZOBKWMbi65bWXW0
	 8gXApLewJwT41OcSoTxCebrQpIEX3q/QpD8P5iM7aG/UqRJ1IGs/5eQBr8jC9My2B2
	 Rt86eYVwuYtlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C56984E69;
	Fri, 24 Apr 2026 16:27:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D1B02206
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B777584DA6
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w2BdJeHUwV2G for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:27:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9E50484DA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E50484DA0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E50484DA0
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:18 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso51780855e9.1
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777048036; x=1777652836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JnS9DKjK/qsw75yFB1U+l/Juvi8AusxScmGTv2THzn8=;
 b=MCnC8fJyp4Ayei0d2dR0Ik1l52Ag+iSqkKFsEEJhgVV2BAbOTvtQjjhG343I7UH3j3
 Pq0s060Yt3PTDBeAPVLpdD6GEIH5Sa2GbW0vjXQhMrV4nCQrJZpvebI+xV248O+MQoHq
 y5nuCXO2OzYl1KhLkr/HJOGhndnJQTKPnkpCrZGBsK3tbt4tljsvku4dv1JTRxR2/EAO
 ZUpalxOmz3Dtb7DPS80IkI2A6U5+wGV5amfwjltRbZaCCrurRXwCzQy5G3Ol1xDbkNfd
 Vqcie2Ntp8dALC1j5HeZEO12i51tqFQEcfVVi43sv/5Plm7sZQjGqFV8+FvLNEItWd1U
 Uddw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+E0KOXG1BTZbd4M/XjIxxqolLYkZ6rQTYAyUKT1euNiU/xqAa+6ucJqF/mQVlvYRGaBP6LjIFs/zs=@buildroot.org
X-Gm-Message-State: AOJu0Yz8vZXxzpQZFjm6DUJ9S2Q2vxBWvtg60Ene2SQHg9/nX5voqSHr
 dIIyuovyH0Jk6O4jWG9/qTfkTR0fjjLuFqaItQhzBEwdzVLm6E3n195O27/BH0rFuAc=
X-Gm-Gg: AeBDievBUofdtn1OE87QA5AWi0hA6R/askhYHoTqjD20JfUoas6Q97p9CH306g+JdF9
 8+6OjA4H2Hmc/CJZvJJyLYYp+S8eAv0ibAXEOffrdt8V12lrfsmvfDiLc+GZiqW5yr60Zfo5W88
 w07zYKZtJebA5/TSgtyc/Oamrzy1pJLZIy5tCWbEYRbWInobDKqs9bmtKkDMbNEbIbvRhTsU2aM
 3ypk56A58PHUZUJ1j//AsGODZn5rx0/xQZSI6f9IqkxFG+qN4evob6qU6DmymzDqeo9mPVfQHRh
 xduANDEZtxwvIO4OPEriNfDNtGo86uxhpzIy08kzafgOU2gbAs8/y8lk/6Rm6BhWSYWiiVqbyK0
 o1prV7lurOC8+LOv4CcCjGANMhR6iLO3WcA9tkcLV8Fwe1Qlhqa2DZmMjwoojAmCRyM+YHlk4m/
 3jctXnQACbYbkHV8Ds02LQz1iLZA==
X-Received: by 2002:a05:600c:c177:b0:486:fb0b:ad79 with SMTP id
 5b1f17b1804b1-488fb78129emr423392035e9.20.1777048036491; 
 Fri, 24 Apr 2026 09:27:16 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1393f5sm557272265e9.9.2026.04.24.09.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:27:16 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:27:15 +0200
Message-ID: <20260424162715.161639-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260409084305.3960494-2-bernd@kuhls.net>
References: <20260409084305.3960494-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777048036; x=1777652836; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JnS9DKjK/qsw75yFB1U+l/Juvi8AusxScmGTv2THzn8=;
 b=bZ4/HlIMMn0JMRGprnme6KfGIoWSBZPtUMW5dLR9WvS5VsaQ9B8cPdE2pT8ADySEF+
 srZUorpzePzYcQ85f/NPIK5vFYx1wr2xUEpXyzPAcqwvYhIlDeL8Lg/IbPgAus2mk8h2
 aB6P0SXdGtSKA92lU2N9pqGeiMVumQlL2Oj60ovAERxujvgEzTDwch/XJVpRt08dYbSH
 ILQ/JtoekVU2BB6hNK8k9kls5LEm1p9xF51Qft1Zja9mwLVuaVsAz3VDP1W7Y0Oy7z6m
 Ma7SrDOrnsmo9L7ThZc9yQkaj6EeGFGaqI5peegn5xh9vTmLA4vE7jBxZZaF/2RGtqzL
 k0hg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bZ4/HlIM
Subject: Re: [Buildroot] [PATCH 02/20] package/c-icap: fix musl build
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
> Fixes:
> https://autobuild.buildroot.net/results/33b/33bb3ea8ac36da7f40a82c580d3614f0b34a7ab2/
> 
> The oldest build error dates back to June 2024 so this patch should be
> backported to LTS branches.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  ...ting-in-various-printf-to-avoid-warn.patch | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/c-icap/0006-Fix-integer-printing-in-various-printf-to-avoid-warn.patch
> 
> diff --git a/package/c-icap/0006-Fix-integer-printing-in-various-printf-to-avoid-warn.patch b/package/c-icap/0006-Fix-integer-printing-in-various-printf-to-avoid-warn.patch
> new file mode 100644
> index 0000000000..7183efa46f
> --- /dev/null
> +++ b/package/c-icap/0006-Fix-integer-printing-in-various-printf-to-avoid-warn.patch
> @@ -0,0 +1,47 @@
> +From 8ef8966237865ec699ab16d208ff56edaac4ff7b Mon Sep 17 00:00:00 2001
> +From: Christos Tsantilas <christos@chtsanti.net>
> +Date: Fri, 1 Nov 2019 08:00:52 -0700
> +Subject: [PATCH] Fix integer printing in various printf to avoid warnings
> + about integer sizes
> +
> +Upstream: https://github.com/c-icap/c-icap-server/commit/8ef8966237865ec699ab16d208ff56edaac4ff7b
> +
> +[Bernd: partially backported to 0.5.10]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + mpmt_server.c | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/mpmt_server.c b/mpmt_server.c
> +index a30d55d4..9b178a66 100644
> +--- a/mpmt_server.c
> ++++ b/mpmt_server.c
> +@@ -74,7 +74,7 @@ typedef struct server_decl {
> + 
> + ci_thread_mutex_t threads_list_mtx;
> + server_decl_t **threads_list = NULL;
> +-ci_thread_t listener_thread_id = -1;
> ++ci_thread_t listener_thread_id;
> + int listener_running = 0;
> + 
> + ci_thread_cond_t free_server_cond;
> +@@ -242,8 +242,8 @@ static void cancel_all_threads()
> +         for (i=0; i<CI_CONF.THREADS_PER_CHILD; i++) {
> +             if (threads_list[i] != NULL) { /* if the i thread is still alive*/
> +                 if (!threads_list[i]->running) { /*if the i thread is not running any more*/
> +-                    ci_debug_printf(5, "Cancel server %d, thread_id %lu (%d)\n",
> +-                                    threads_list[i]->srv_id, threads_list[i]->srv_pthread,
> ++                    ci_debug_printf(5, "Cancel server %" PRIu64 ", thread_id %" PRIu64 " (%d)\n",
> ++                                    (uint64_t)threads_list[i]->srv_id, (uint64_t)threads_list[i]->srv_pthread,
> +                                     i);
> +                     ci_thread_join(threads_list[i]->srv_pthread);
> +                     release_thread_i(i);
> +@@ -252,7 +252,7 @@ static void cancel_all_threads()
> +                     /*The thread is still running, and we have a timeout for waiting
> +                       the thread to exit. */
> +                     if (wait_for_workers <= 2) {
> +-                        ci_debug_printf(5, "Thread %ld still running near the timeout. Try to kill it\n", threads_list[i]->srv_pthread);
> ++		        ci_debug_printf(5, "Thread %" PRIu64 " still running near the timeout. Try to kill it\n", (uint64_t)threads_list[i]->srv_pthread);
> +                         pthread_kill( threads_list[i]->srv_pthread, SIGTERM);
> +                     }
> +                 }
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
