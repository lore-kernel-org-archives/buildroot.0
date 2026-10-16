Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181F3CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6C8940A16;
	Fri, 16 Oct 2026 15:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x09g_r5EK47W; Fri, 16 Oct 2026 15:01:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CE5E440A31
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162901;
	b=cegVU+dEQjU96pud8CP2/Kw5Tbgayn3yYjWv/bXWEuzmPZz9kBJ8mOWMAtqNIf5cGm+y
	 Ok6fLvXX3RghJqj0duD5+NwM6VvJROnuhtRm2JvCIJAbvz9ayBGSlhtQX68x1j7YYBSBm
	 bmjx3+sZmPFwBGliXdHCGLnkwTI1kMJGES2KMtmfXK70RRWxc0ohqynF11/dXyyevpSpC
	 wJY8Jko+T0SvP0FpI9Cm6KOgV4D9/eim04QxVfarQ4VEEDUKT4Xz13fQ3C3P0jjFp6cBV
	 E7KMnDnjmjvY3OtLYLC8XRsdbZFDqMRlDR6vHDR55gvqexvbgtGYdidD6zXJb0d9aSQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162901;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=pP9QlX1ya28cnFYpdO+MCFzrrLFyCc+zfyRH5gxLGhw=;
	b=eqPXpxrz0fmhcIWF/GVh+bSdBnJSdv20ZpWjxVgi+XvVVbu2ssznVrpiLIHdp8fJdARg
	 6QuXNSFwKrOKvLckBSGU0UIkzc5weZBUKdIoflPUtFAo623wbFhFAhF2FMSCvcR995UVy
	 qK7zYViP3l/dsfMezoGxX3f9oKgL+Bp6PanOdSiigueI7FDuYw5M+PgG6D1NFj8T8BLdE
	 J5l2nJuTHOMV/M2dbIPT5qFOZGItkm4dC4sr5RBXywTIhlCT0eTpOz7oduOTyyI9ZcxTt
	 ZTQpMknkEYGoAKHsnaP+BJOhscBxNaFa2s31fXvQv4Nc+Mm/7zWqf9zBuhYi4pvtTpQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162901;
	bh=pP9QlX1ya28cnFYpdO+MCFzrrLFyCc+zfyRH5gxLGhw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IYR8bUrHzZSoPyJypZOc02nJffMnirLxmZxXglS8Sp5zlb8rV6mTn4b6PPvghftGQ
	 s+3UaheivKf4DhivASXJMATq3HCXpTT5f4YB6jrKyKY9un3Ag8lEZA1Neq1HWYMGsC
	 nSkHWqXIwp4WWVdJqLWPE1wIrztZmnX/kuPl1RDxzhJvbV/ereeaUcgAUzm/R65sDw
	 B3P51oEhrE9RytkAuxNGGAwUvFKIjajLRZTb3oPNBU4O8pUepW4450zzRVKvmpBjR4
	 gfCdbRkZM1BzLwf8dZGA8zhAJchBhNQonNWnzmbcKsk6pz7Hv/4y4EVOdHDj75tYtm
	 Bzy/bj8SqZDJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE5E440A31;
	Fri, 16 Oct 2026 15:01:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D6E28255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4CCA81542
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HjOBRZ7fFE0y for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:01:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BD34F81518
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162900;
 b=BuOI5DPyjmdPs3TKF8C2riFf0br1bGClMTozuJnoaH1+/kBpQNlqgKzmXIl/vIsdv/im
 L0o+L5meuJ//hI6//pA6AtB1SnNPC9lkhIbtBIXGkfw8kXSm1VRx5lPP8KwyJSwqjlc87
 2fLD4lndDwaC5HApgl4oLfD+3hBCZwj6IDvEKlJ4/niXmRNj2K6u6eie8ZQiYSiwPeyRv
 jYvMYQe1MSdK4zeNuyOBuLSbM3rxMbS7pWHlKmj6tVWJgfZqZhw28yFv8uGI7yKWGVqmu
 VaZdhpBxCWaVrAqKUyJu3gxx1weuPykNSin6v0XBoBG/GCluVS0M2Bm0fEN7asJedyA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162900;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=EXJe+YHAjFgkDGDPS/kbiJyQ4+b2vNqmqxCpcXsxylQ=;
 b=ErEfUZDZNY1ELLptjL/d6tslNJcrSIrum45y7a/PnUVNee10dZfO2sCBqzeOOYmiCMEg
 Rdh+y8Zj1yGBeHUUn29hsF6Uf9B8QCQeN9jyGITgoaJ79zrWHbyp29W45P+m0R3S+UIGl
 guoNCUi7TOIocaNPLEfeqoAFqp8m3bgJfl5GcBQdI285Z+gwtYnbkvJPKq7AFFNcJOqrX
 Jrfit6c0iZG0pVSLw1Y3h4rfQ1IR+Qg6KQQ6kNVzgPWz8hDnf/CiPICou0ODeg32qxIVX
 AsO6RvGXKvoq5UtuOcwrQuYvA4071WDDETWm19cknOT3fF1hK06bn1xsNCjSSs00tlQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=AFRVkwVy; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD34F81518
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:39 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-487049569b6so4576655f8f.1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162897; x=1792767697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=EXJe+YHAjFgkDGDPS/kbiJyQ4+b2vNqmqxCpcXsxylQ=;
 b=BCHKE9q1QANRNfxg8obIft218hBbi7tBE3ubhKpl5kpgYp8KFVfkjsfXjPz3ynpfcW
 lL5USLrS0BXW21Y2GBdykvNqifuvZZ/iJfksIJnwiiRPmY/a7WuMAQo4ReZ9TatlThZ1
 Q+Jz3gaM8jwDWJ2mQk2Oi4zN/gtw+GtxRN+ONj0q1EzxRBpPe6MELuftzR7BgvrIXIq6
 gG67wjqz8HEKlyQdagh6//F6oQR6Z3RQh04/nE8WUQjvasipc01jO7yc/TBKKBL+BjDt
 eq1MZhjDNo4UIhVrF1kD7kL4WfgW1YtMHtuM9J+d5F2leT2ofMxfkewpKgHjng1y3r2q
 QAtQ==
X-Gm-Message-State: AFq9FYIzD5I/Q/MrBLBqt6zl31q47EXIj2UfSeVqjELRcNldQOrkn4a8
 SYwf8aXA0NET1ONCjVPS/8XPHJ05r2A5oRTW85R8HlePlcyqOis0IVdnjgGofRlDjW4aJeUzp87
 fQok7q6o=
X-Gm-Gg: AYBFou3lmE1ab2T6sV6lSJcvXnhvBghUSwSkb/aJwvd1N/VkL5xRdvj8D/rxc96VWs7
 4cIjw4WtfbQ2BkWaqc92M9DCTAItaZjyETwTGZSYjHhLrZB3yGgzJ6WfthpNTcSXms7pPscLjdZ
 wMnS1ZGldBSUIDCj7zJFQIc6Q1ctILVFmBOmrq4H2q5gz4KYa6Cjv7AHZxJcBnv17vDxvjhV+vg
 SmUk3a7HNiUltBodAuCdMzS8Vzw/hRn2KgKgEXvKWeFtcqkpYvP1tApm5+Dw8m9NVs2N8WIrbAt
 3o/abwQKf7So0WRrEvzx87d+4ahsVWJg4Idwr3AnJpEsdbZV9HonFzCZl42wLNEHkHO+ft67yu9
 LAzYG97XWKRlFwKrPUADsy6Q3OO5e47U03dBmXzhgxSLega9L+MfeR3Xjypghh6AJGzk/P16+32
 ucedovRKvnx5LiSsZCAjkEQxqZOjNELrLmpHtnsu8a4wUb/mX286HBfvG4tKGQd0N0L1TYlrUEp
 FaKglHfB3RzF5N48pQR6tCpP9Fm+A5Mcj/u5sCR/w==
X-Received: by 2002:a5d:420f:0:b0:48c:4553:790b with SMTP id
 ffacd0b85a97d-48dbacf46e9mr33518242f8f.48.1792162896745; 
 Fri, 16 Oct 2026 08:01:36 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4ec8dfsm5900371f8f.26.2026.10.16.08.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:01:36 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:01:33 +0200
Message-ID: <20261016150135.60119-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426102215.3100043-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux: fix non-MMU build
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Buildroot commit 31af509b4f4fe52f67bd9109b8732a55b8f9cd2d bumped the
> package from 2.40.2 to 2.41.1. This bump includes upstream commit
> https://github.com/util-linux/util-linux/commit/a3f1255f1891ddbaf3bb6a32af28569c0e6f3b91
> which was added to version 2.41 and includes the usage of
> pthread_atfork() causing build errors on non-MMU platforms:
> 
> libuuid/src/gen_uuid.c: In function 'uuid_generate_time_generic':
> libuuid/src/gen_uuid.c:629:17: error: implicit declaration of function
>  'pthread_atfork'; did you mean 'pthread_join'?
>  [-Wimplicit-function-declaration]
>   629 |                 pthread_atfork(NULL, NULL, reset_uuidd_cache);
> 
> The oldest build error of this kind can be found on the 2025.11.x
> branch with version 2.41.1:
> https://autobuild.buildroot.net/results/87c/87c74435be14956fd45f730269eac102e70d56da/
> 
> A backport of this patch to the LTS branches should be considered.
> 
> Fixes:
> https://autobuild.buildroot.org/results/a21e81e64eccc866b575a4f3b1376c50f2ffd837/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.08.x. Thanks

> ---
>  package/util-linux/util-linux.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index 1271bc7dc0..99a6be976e 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -130,6 +130,11 @@ UTIL_LINUX_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -Dstatic_assert=_Static_assert"
>  UTIL_LINUX_CONF_ENV += LIBS="$(UTIL_LINUX_LINK_LIBS)"
>  UTIL_LINUX_MAKE_OPTS += LIBS="$(UTIL_LINUX_LINK_LIBS)"
>  
> +# pthread support uses pthread_atfork, which is not available on nommu
> +ifneq ($(BR2_USE_MMU),y)
> +UTIL_LINUX_CONF_ENV += ac_cv_lib_pthread_pthread_atfork=no
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
>  UTIL_LINUX_DEPENDENCIES += libselinux
>  UTIL_LINUX_CONF_OPTS += --with-selinux
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
