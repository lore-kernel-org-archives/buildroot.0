Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965B7EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6897E42085;
	Fri, 13 Feb 2026 19:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eXOyg5VNwHQS; Fri, 13 Feb 2026 19:38:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC5EE42099
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011515;
	bh=SJQVzN1rHbnyUl+4nk3Rum/Thx3NbvIThGzuxI14Lu0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qnJ25TDCXiqAh8FECrJFiSZNBJ5LfuMJSG/lVn0tVDKOuIN8nWe+wMKihhDdzoR7Q
	 XQpCFkg2tHZnFlKWzxlAaPP25x+r3LJ2DfOPjdHOCZHJPuJZBc9hcEBlvB82ffT0jh
	 rfFIyQ1wcSgnaAoEyLF3xUiCBA6nPhv4yUsAWB7J/EX4+qm363YGd+RFjjlC42IDH0
	 K69G+Szos18hR92VlbeLcKxYKsotdGup7lR5nL9Vh+tyqBjnVRWWJBOzmWx6NI9o4N
	 NmJmrbSbyYeVPk4OxAqJ3jtgH6FdHqYiaQAwqEdwRqaye9wMjpnKgcDg7ihYaCw1o0
	 qy/tNDFvVnNZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC5EE42099;
	Fri, 13 Feb 2026 19:38:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02C2B69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F34E615E7
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SaDLUVP-CCqy for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B9D37615E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9D37615E8
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9D37615E8
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:38 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4837584120eso6435775e9.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011457; x=1771616257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lmtD5rZYQN7q1toIu71y9KIizIqvi+oOgEG3qs+1hG4=;
 b=PZQlFyb7sFnwzNWaLmKT39NKTmalF2hw0D9enAsMZ7+T1FucClcqKPjP8Nc9mDvmX8
 2MOPRyuir48ogJm6Ng+q+6QCe9iABtmVqytY8uYh4iMawJB8kuPEukT997bCinHxJsKH
 oEPxGyVewDotMLYwuko1l6dbjjsZ6asdLXHTWEMHEZlXMrvDxHqvdIFStUBsAFkJF1Fk
 EiXQufP6XrxL39F8fD7Ljc9lFkt8G8jffsOYOPuJxhz1fgscAXSfkGyiU4Mj3xDGFf2Y
 /UZsOODPeb94yB4LaJdkNCPpzgHbCvQWkrcxnU4rUCL8/s/0/RmCVIgkWlYPNPjJj/Cb
 3UoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUurrxBmu8mmzlhPEsR3pPjWMXICCpHhAhfD+7fWUZX+5Y0uutVI+emZxgILzZHPU/TML6Z8nkBTV0=@buildroot.org
X-Gm-Message-State: AOJu0YwKyYrp/Z/w75HerTfrbSM71g4Tho8lUloJGIGBvyWq8HPQTSSw
 hMlXC+O9iCBoatSEgtnrLyNP8tZVSsxDkqS0/s4+UY3LBNG7Pg3u9XQacgRanBSZZ94=
X-Gm-Gg: AZuq6aLgCoI+MHKIT2c9hnf4Yk9d45G9yM9DHFrJhBuPa1ZgEdaKkCXDY5mH7B4vjyj
 feP5z/4QxXs8hdbcNJL18vJmxls7J06HfeLQddbNQTvlyz3lHSOW7/Po62sC0H+F3ix8ttLE92O
 071UZg6b//n6K0Z6y0sUQ7tcp62uReLxbAOoX0jgTGJfJ9q5Kn66uNA6EScPDQwZClU30ofujLW
 VncX4lwfLYCU53S+gY8zzjWa8sotscKklgeSkQkiPKlwNn8aQ/A3treks0KIT8Nxqmff/CQpWe+
 0gbsAq56/TnJ28fE7PGp9+lYtEwDLqxK2q4LiZIHqsAJY3mxgFowUnP+tgzZUz7VxVzIIFLOg7I
 y/CBZMuMfTSmIB42l3z5ACS/ZpIFio0rrZo22m98OarCZL3Q72cRLt9NJpFPG1Xk4zqaw0F2k2H
 tjefoH4xZpYMjRuEg=
X-Received: by 2002:a05:600c:698c:b0:483:5a29:9678 with SMTP id
 5b1f17b1804b1-48379b8bfbamr5722575e9.2.1771011456634; 
 Fri, 13 Feb 2026 11:37:36 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d834ebesm281022405e9.13.2026.02.13.11.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:36 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:35 +0100
Message-ID: <20260213193735.40079-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260104110506.353384-1-bernd@kuhls.net>
References: <20260104110506.353384-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011457; x=1771616257; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lmtD5rZYQN7q1toIu71y9KIizIqvi+oOgEG3qs+1hG4=;
 b=QIxyXkpmjmI+1RWsQWTLzrkJ7NpDT0TSzApzGxYmej70pwwJTucMv19JR4uf5ZoQbJ
 BMRX/4NaZm7jUzEm5BP7hHSvg7afW9XV8d7LEwxesZymCoRA4q7SyweccrcEic4UswXq
 678zgWY3wl3jjRttXSnMoQpjxk5BNCQ3dGxwdcoeCEU3YEH7yKCZNMdMudJRYZ807ugh
 4T3WOPToK9DwYqtsSVBPrhl8QVxQWRYg3vxVV4rhy5H7YqmIiWrnYy4jxi3aAlOw6l3u
 xryxTlGTl0w8cwKlAu0iyvW9wy1G+5P0VesBNoNTSUF4bcWnsJMPiIRrk3jHuob1GIQJ
 4XCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QIxyXkpm
Subject: Re: [Buildroot] [PATCH v2 1/1] package/brltty: fix musl build
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
> https://autobuild.buildroot.net/results/76d/76d18437241d1281566b76ed1cec2ba99c3532da/
> 
> The build error was not introduced by the recent bump to 6.8. The oldest
> build error with the previous brltty version 6.6 used in buildroot dates
> back to 2023:
> https://autobuild.buildroot.net/results/78a/78a7fe6edfb84c2b15fff32aa475c975ecd5bdbc/
> 
> and with brltty 6.4 to 2022:
> https://autobuild.buildroot.net/results/a5b/a5b338ce9865fc7afaecd9b671e6a8f290548374/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
> v2: updated patch link after upstream committed the PR
> 
>  .../0004-check-for-functions-inb-outb.patch   | 98 +++++++++++++++++++
>  package/brltty/brltty.mk                      |  1 +
>  2 files changed, 99 insertions(+)
>  create mode 100644 package/brltty/0004-check-for-functions-inb-outb.patch
> 
> diff --git a/package/brltty/0004-check-for-functions-inb-outb.patch b/package/brltty/0004-check-for-functions-inb-outb.patch
> new file mode 100644
> index 0000000000..64f2a2d7a7
> --- /dev/null
> +++ b/package/brltty/0004-check-for-functions-inb-outb.patch
> @@ -0,0 +1,98 @@
> +From 876bdd3153c791a51422a43403143ff10acb6e82 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Sat, 3 Jan 2026 15:35:48 +0100
> +Subject: [PATCH] check for functions inb & outb
> +
> +Musl C library provides sys/io.h but inb and outb are missing on some
> +archs. This patch adds a configure check ported from sane-backends:
> +https://github.com/solanoalves/sane-backend/blob/059b97962ecb1b1ab068f524988d16c5b55bbd29/configure.ac#L314
> +to fix build errors detected by buildroot autobuilders:
> +https://autobuild.buildroot.net/results/76d/76d18437241d1281566b76ed1cec2ba99c3532da//build-end.log
> +
> +./ports_glibc.c: In function 'readPort1':
> +./ports_glibc.c:54:10: error: implicit declaration of function 'inb' [-Wimplicit-function-declaration]
> +   54 |   return inb(port);
> +      |          ^~~
> +./ports_glibc.c: In function 'writePort1':
> +./ports_glibc.c:63:3: error: implicit declaration of function 'outb' [-Wimplicit-function-declaration]
> +   63 |   outb(value, port);
> +      |   ^~~~
> +
> +Upstream: https://github.com/brltty/brltty/commit/85cadac951cda709ce53d49923114595c16a8f16
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + Programs/ports_glibc.c |  4 ++--
> + config.h.in            |  3 +++
> + configure.ac           | 19 +++++++++++++++++++
> + 3 files changed, 24 insertions(+), 2 deletions(-)
> +
> +diff --git a/Programs/ports_glibc.c b/Programs/ports_glibc.c
> +index 4233f9ea0..4a57f626d 100644
> +--- a/Programs/ports_glibc.c
> ++++ b/Programs/ports_glibc.c
> +@@ -50,7 +50,7 @@ disablePorts (unsigned short int base, unsigned short int count) {
> + 
> + unsigned char
> + readPort1 (unsigned short int port) {
> +-#ifdef HAVE_SYS_IO_H
> ++#ifdef BRLTTY_HAVE_SYS_IO_H_WITH_INB_OUTB
> +   return inb(port);
> + #else /* HAVE_SYS_IO_H */
> +   return 0;
> +@@ -59,7 +59,7 @@ readPort1 (unsigned short int port) {
> + 
> + void
> + writePort1 (unsigned short int port, unsigned char value) {
> +-#ifdef HAVE_SYS_IO_H
> ++#ifdef BRLTTY_HAVE_SYS_IO_H_WITH_INB_OUTB
> +   outb(value, port);
> + #endif /* HAVE_SYS_IO_H */
> + }
> +diff --git a/config.h.in b/config.h.in
> +index 537d3af92..edea70cea 100644
> +--- a/config.h.in
> ++++ b/config.h.in
> +@@ -331,6 +331,9 @@ extern "C" {
> + /* Define this if the header file sys/io.h exists. */
> + #undef HAVE_SYS_IO_H
> + 
> ++/* Define to 1 if you have the <sys/io.h> providing inb,outb. */
> ++#undef BRLTTY_HAVE_SYS_IO_H_WITH_INB_OUTB
> ++
> + /* Define this if the header file sys/modem.h exists. */
> + #undef HAVE_SYS_MODEM_H
> + 
> +diff --git a/configure.ac b/configure.ac
> +index b78d482f6..0a2a70dd0 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -961,6 +961,25 @@ AC_CHECK_FUNCS([shmget shm_open])
> + AC_CHECK_FUNCS([getpeereid getpeerucred getzoneid])
> + AC_CHECK_FUNCS([mempcpy wmempcpy])
> + 
> ++dnl sys/io.h might provide ioperm but not inb,outb (like for
> ++dnl non i386/x32/x86_64 with musl libc)
> ++if test "${ac_cv_header_sys_io_h}" = "yes"; then
> ++  AC_MSG_CHECKING([for inb,outb (provided by sys/io.h)])
> ++  AC_LINK_IFELSE(
> ++    [AC_LANG_PROGRAM([[#include <sys/io.h>]],
> ++      [[inb(0);outb(0,0);]])],
> ++    [AC_MSG_RESULT([yes])
> ++      brltty_cv_have_sys_io_h_with_inb_outb="yes"],
> ++    [AC_MSG_RESULT([no])
> ++      brltty_cv_have_sys_io_h_with_inb_outb="no"
> ++      AC_MSG_WARN([sys/io.h does not provide inb,outb (non i386/x32/x86_64 arch?)])])
> ++  if test "$brltty_cv_have_sys_io_h_with_inb_outb" = "yes"; then
> ++    AC_DEFINE(BRLTTY_HAVE_SYS_IO_H_WITH_INB_OUTB, 1, [Define to 1 if you have the <sys/io.h> providing inb,outb.])
> ++  fi
> ++else
> ++  brltty_cv_have_sys_io_h_with_inb_outb="no"
> ++fi
> ++
> + case "${host_os}"
> + in
> +    cygwin*|mingw*)
> +-- 
> +2.47.3
> +
> diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
> index 5e24288cbb..4952210121 100644
> --- a/package/brltty/brltty.mk
> +++ b/package/brltty/brltty.mk
> @@ -40,6 +40,7 @@ BRLTTY_CONF_OPTS = \
>  # Autoreconf is needed because we're patching configure.ac in
>  # 0001-Fix-linking-error-on-mips64el and
>  # 0002-configure.ac-link-fv-driver-with-ltinfo-only-if-avai.
> +# 0004-check-for-functions-inb-outb.patch
>  # However, a plain autoreconf doesn't work, because this package
>  # is only autoconf-based.
>  define BRLTTY_AUTOCONF
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
