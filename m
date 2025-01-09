Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEECBE77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 09:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8186E80B57;
	Thu,  9 Jan 2025 09:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O1qNCnHpJOJO; Thu,  9 Jan 2025 09:55:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92CA482CCA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92CA482CCA;
	Thu,  9 Jan 2025 09:55:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 20FC8942
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C6DB4062E
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:55:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOdUAPUXKwUX for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 09:55:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8F8AE40684
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F8AE40684
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F8AE40684
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:55:17 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -870120513; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 09 Jan 2025 09:55:14 +0000 (UTC)
Message-ID: <f5ddf82d-1fee-4477-9fcf-87e8c2b28e94@korsgaard.com>
Date: Thu, 9 Jan 2025 10:55:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>
References: <20250108213411.2091627-1-thomas.petazzoni@bootlin.com>
 <20250108213411.2091627-2-thomas.petazzoni@bootlin.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20250108213411.2091627-2-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=EtjztWfewtKI8lsjx6CTQrDG7bzxmJSSu6swvxqENqvMYTi91ajXoeA3uvxzRe0HGj1T0WgKaopxlFJBCCSdBvWk1n9+GSJ0ddUDjj0OnJodJWGK41nirDz8N6H/EgbETVggGzDmebM2agAIpponcsseVsw1hL8DTgCtgMlBCEoB0N/Xmq0ZGOGzngarH7YMjBPtY6vdlxxa27sSAXM6WaIJM+My6bq7orXM4iBYRtJKHTnhzxQLRxBScP9zCAF9HOeVDCG1/47xvlT9XlZ9YXbRYGxATPPUh1hVuff9qzpwgQbzWajSl9xE2cFwlz+0jkuCeWcndzrl4tFbRXlsGg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=LdVupIwm66vC+u5okVdQH7KOY1znNPYYuzqnSJ3r2Ao=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=EtjztWfe
Subject: Re: [Buildroot] [PATCH 2/3] package/libxcrypt: make available only
 with glibc
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 1/8/25 22:34, Thomas Petazzoni via buildroot wrote:
> libxcrypt has been added as a replacement for the libcrypt
> implementation that was part of glibc, but dropped from glibc starting
> from version 2.39.
> 
> However, libxcrypt was made available for all C libraries, and this is
> unfortunately causing some problems as it can clash with the libcrypt
> implementation provided by the C library.
> 
> In particular, linux-pam has been consistently failing with uclibc, in
> BR2_PER_PACKAGE_DIRECTORIES=y builds, with the following build
> failure:
> 
> opasswd.c: In function 'compare_password':
> opasswd.c:133:27: error: invalid application of 'sizeof' to incomplete type 'struct crypt_data'
> 
> What happens is relatively tricky, but let's try to break it down:
> 
> - uclibc-ng install a stub libcrypt.a (no shared variant, as for
>    shared libraries, everything is in libc.so), and crypt.h
> 
> - libxcrypt installs libcrypt.so.* and crypt.h
> 
> So there is no "clash" on the library itself, but there is a clash on
> the header file.
> 
> Since we're using BR2_PER_PACKAGE_DIRECTORIES=y, when building
> linux-pam, we are creating the per-package STAGING_DIR by copying the
> STAGING_DIR of linux-pam dependencies, i.e both the libxcrypt
> STAGING_DIR and the uclibc-ng STAGING_DIR. But the latter ends up
> being copied last, which means that at the end of the day, we have in
> the per-package STAGING_DIR of linux-pam:
> 
> - The libcrypt.so from libxcrypt
> - The crypt.h header from uclibc-ng
> - The libcrypt.a from uclibc-ng
> 
> When the ./configure script of linux-pam tests whether the library has
> crypt_r(), it concludes that yes it's available: and indeed
> libcrypt.so from libxcrypt has it.
> 
> So it tries to use 'struct crypt_data' and 'crypt_r()', but those are
> not supported in uClibc-ng, and so cannot be found in the <crypt.h>
> header. So even if the ./configure script and the linux-pam code has
> some logic to fallback to crypt() if crypt_r() isn't available, this
> fallback doesn't trigger because the installed libcrypt.so does have
> crypt_r().
> 
> Basically what happens is that uclibc-ng + libxcrypt is a combo that
> violates a golden rule of our BR2_PER_PACKAGE_DIRECTORIES=y
> implementation: packages shouldn't overwrite files from each other.
> 
> To avoid this situation, we make libxcrypt only installable on
> glibc. This isn't a problem because as of today, BR2_PACKAGE_LIBXCRYPT
> is always selected "if BR2_TOOLCHAIN_USES_GLIBC".
> 
> It should be noted though that the case of an older glibc (which still
> had its own internal libcrypt) + libxcrypt continues to exist. It's
> less likely to cause trouble though, as the libcrypt implementations
> are much more similar.
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/560f66b0311d02dc884732221d6870ae3c38067c/
> 
> Note: we do not add a Config.in comment for this glibc dependency,
> because libxcrypt really is a "replacement" library to fill in the
> void left by libcrypt's removal from glibc. There isn't realy a point
> showing "libxcrypt needs a toolchain w/ glibc", because with musl or
> uclibc-ng, the libcrypt functionality is directly part of the C
> library.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
