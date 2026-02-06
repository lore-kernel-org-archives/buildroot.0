Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6084FEB28E4
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2650C611F1;
	Fri,  6 Feb 2026 08:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rniKFPKGfscX; Fri,  6 Feb 2026 08:11:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D40CF611D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365517;
	bh=tcN9/wQOSUrzpbNt0hSPYkkcYKcqFAhuvJIxn1XOWf4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rpu+I0UWtMdoBZUVsZ1TgHMVAaeMHaM8rkc0GMdkV+HJyODdoYLz6YMloZmYwT+tu
	 oIQFohUR/QybccNLPiW8igqBNrqWBapakzp8XcSzh1Ybq0A14OVqWiEM3Yg5bTplRy
	 u9fFZvdvNWEHZe2XiMSIqtw1CPaT2kcbDUyDiARf/i3a4sPq6Nbt4ch4Jiga6DVkQR
	 9YKJrYjoqW9MBY8UP9mnLiofRqVo0Y4f1bw6DmHKcQr7xOzVRbB1agCpxDMtYx7sdP
	 mRXuBMGaCAnlXmIB0E2UoFzwXUsnCZKWYwOZN39kFPOVdwyMZ6vy1JteGLR3aowWJY
	 5OnwhIABJOSsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D40CF611D3;
	Fri,  6 Feb 2026 08:11:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CE8A6219
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9E7F611D3
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0LdLbjPiBD5s for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:11:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1ACCD61161
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ACCD61161
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1ACCD61161
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:52 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4806bf39419so16974665e9.1
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:11:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365511; x=1770970311;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hmTZdnvY/HqnBTEsEuUkvTWO384OLUsenWLEsXe+lrQ=;
 b=c8lAmPNgPKijhAOTkON0Dnf3rEuojF+haf8sn6gDBvv/S08HKtcTbQiPo0BKq2VciP
 d1iuAIypWMPa3Ipb7txIkrANkPXdsj3sVSmdO8wWi3Vt7W/Re2vOCf3l9Sgwg8FY5S5Z
 Wz2lir9CcduHOSrOVzJVUFtWWOWETTjSNTNrNyiqfuoxdOJ9Exb1AUt/O+RdFRpJvFKs
 8HXgm3LoRpOFfqfPg4lH5b1KNKh2KVE6AuBDOMkWEzYmL17gNkhOhdOXfqCtLuEHVSlh
 IYhIw47xGKz+SY/ZKW7QmyFWdA+lk3QQMVsanRl5Nkdzmagh1MshEF1YMYg4SAoN+6dq
 X6Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXj/pZJYklCeB0sgNl6SvVyEsd9lYXPHlFzw8GnQ0/IAzlNT/L04VGso74gVZI7ZtEdfvLMpYoSd4s=@buildroot.org
X-Gm-Message-State: AOJu0YwCuOb6aLm1mXaZasn8NhjRmfHyorSNxX6AnieUiGyaIzXr/eO1
 rj9DsCSE9psD+HJgSlaEjwZGtZ3hLAPhP1x0am26L33z6ew6MYcl5YXlrVddi9aqFKvtr++cJ2Y
 V6xVQ
X-Gm-Gg: AZuq6aI3q0ALHJDK2ocNafQyCpIXG2yC26OfvIvactXZIun2dd2IBhhWrC38oWI0tuX
 G3ipuTmiIyeLtOCrWglLy9DMXWxiz94yXuALkG0YDU7pPJoaMxO7G+Qsoodn7Fqt8TNuUZ5sic+
 xCRzfupz/3qZqxPh/9XyURllUCcME5yghJOEj34hWhIQmvGCq5bznYMPY0wWGjYsarnYOurkRe0
 nzLx7s1nn1/+NHTdwXtwX67bDApdWx3gKc6ES9Et6tw0Z263D3SvNVVP9IhYElaLhtHVRBWb1zG
 TOsQsnf3Qn23zGpOqdAK2HrGo1Zzxi4sStp7JwZmUaT/wORthmejyT0OEhsXM2eWoDdnbq/CPx5
 VhWexrCTYr5b9K1fTOvk8LZ3WIKYMsCOZYwNPLzT5ZntC5ubg28P3HJykLMz7cNPcqyRrrJKtwb
 2qP8U=
X-Received: by 2002:a05:600c:3794:b0:47e:e051:79ee with SMTP id
 5b1f17b1804b1-483178e12d0mr48113605e9.3.1770365510841; 
 Fri, 06 Feb 2026 00:11:50 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43629730992sm3678962f8f.21.2026.02.06.00.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:11:50 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:11:50 +0100
Message-ID: <20260206081150.32140-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260118170731.3366652-1-bernd@kuhls.net>
References: <20260118170731.3366652-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365511; x=1770970311; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hmTZdnvY/HqnBTEsEuUkvTWO384OLUsenWLEsXe+lrQ=;
 b=aIGaONflVi6T0LhcxN9+/zHSH9lYEQkIRKQu9JSX7V/K3Vg+DMR1HuGFrln3YP+lHp
 vU4+ckerYF0he8HKGHUxQljxgfvpvF0ySDkv59XoBPGRbSNnWtCwmJkB3+QpxLonKjqc
 Tq1ApDX3sT5TgrYfAYAsRgGSFVkvRLxuaOov3yml5dZpRgPHnMkRH3VHvyDgEPmPkyb+
 wm7OqMq+k6OitD9WJnd557lIwN4JvCDujFbyebHbLq10zGlg4CuZrLztV2Met8YRILfR
 MejMB3U7+X7/+ZhXbT7doHEiTzAJFXzTaWu5yYOPKMTX9OIOJJhXRydWA+1EmpKDjJf1
 rNRg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aIGaONfl
Subject: Re: [Buildroot] [PATCH 1/2] package/mcelog: fix musl build with gcc
 >= 14.x
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
> https://autobuild.buildroot.net/results/902/9020e4fda8cbc4f9886d5e8725f6df8d99716241/
> 
> The build error does not occur with gcc-13.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  ...orrect-prameter-type-for-connect-API.patch | 43 +++++++++++++++++++
>  .../0002-client.c-fix-build-w-musl-libc.patch | 42 ++++++++++++++++++
>  2 files changed, 85 insertions(+)
>  create mode 100644 package/mcelog/0001-server-Correct-prameter-type-for-connect-API.patch
>  create mode 100644 package/mcelog/0002-client.c-fix-build-w-musl-libc.patch
> 
> diff --git a/package/mcelog/0001-server-Correct-prameter-type-for-connect-API.patch b/package/mcelog/0001-server-Correct-prameter-type-for-connect-API.patch
> new file mode 100644
> index 0000000000..cc9d0e84c6
> --- /dev/null
> +++ b/package/mcelog/0001-server-Correct-prameter-type-for-connect-API.patch
> @@ -0,0 +1,43 @@
> +From c17897deb52daab300c585a6a6c2456d062d80cf Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 11 May 2024 22:50:19 -0700
> +Subject: [PATCH] server: Correct prameter type for connect() API
> +
> +connect() function expects the second argument to be point to sockaddr
> +as per man sockaddr
> +
> +int connect (int, const struct sockaddr *, socklen_t);
> +
> +Fixes build failures with -Wincompatible-pointer-types when using GCC-14
> +and musl
> +
> +Fixes
> +| server.c: In function 'server_ping':
> +| server.c:308:33: error: passing argument 2 of 'connect' from incompatible pointer type [-Wincompatible-pointer-types]
> +|   308 |                 if (connect(fd, un, sizeof(struct sockaddr_un)) < 0)
> +|       |                                 ^~
> +|       |                                 |
> +|       |                                 struct sockaddr_un *
> +
> +Signed-off-by: Andi Kleen <ak@linux.intel.com>
> +
> +Upstream: https://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git/commit/?id=c17897deb52daab300c585a6a6c2456d062d80cf
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + server.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/server.c b/server.c
> +index 54c7d57..51b7d3a 100644
> +--- a/server.c
> ++++ b/server.c
> +@@ -305,7 +305,7 @@ static int server_ping(struct sockaddr_un *un)
> + 	if (sigsetjmp(ping_timeout_ctx, 1) == 0) {
> + 		ret = -1;
> + 		alarm(initial_ping_timeout);
> +-		if (connect(fd, un, sizeof(struct sockaddr_un)) < 0)
> ++		if (connect(fd, (const struct sockaddr *)un, sizeof(struct sockaddr_un)) < 0)
> + 			goto cleanup;
> + 		if (write(fd, PAIR("ping\n")) < 0)
> + 			goto cleanup;
> diff --git a/package/mcelog/0002-client.c-fix-build-w-musl-libc.patch b/package/mcelog/0002-client.c-fix-build-w-musl-libc.patch
> new file mode 100644
> index 0000000000..f7334c8c6f
> --- /dev/null
> +++ b/package/mcelog/0002-client.c-fix-build-w-musl-libc.patch
> @@ -0,0 +1,42 @@
> +From a90e39f896a2f1b76ad3c304b69c451ec92a687a Mon Sep 17 00:00:00 2001
> +From: Brahmajit Das <brahmajit.xyz@gmail.com>
> +Date: Mon, 12 Jun 2023 10:55:28 +0000
> +Subject: [PATCH] client.c: fix build w/ musl libc
> +
> +Without the patch, I'm getting the following error:
> +
> +client.c:47:2: error: call to undeclared library function 'strncpy' with type
> +      'char *(char *, const char *, unsigned long)'; ISO C99 and later do not support implicit function declarations
> +      [-Wimplicit-function-declaration]
> +        strncpy(sun.sun_path, path, sizeof(sun.sun_path)-1);
> +        ^
> +client.c:47:2: note: include the header <string.h> or explicitly provide a declaration for 'strncpy'
> +client.c:60:19: error: call to undeclared library function 'memcmp' with type 'int
> +      (const void *, const void *, unsigned long)'; ISO C99 and later do not support implicit function declarations
> +      [-Wimplicit-function-declaration]
> +                        if (n >= 5 && !memcmp(buf + n - 5, "done\n", 5)) {
> +                                       ^
> +client.c:60:19: note: include the header <string.h> or explicitly provide a declaration for 'memcmp'
> +2 errors generated.
> +
> +Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
> +
> +Upstream: https://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git/commit/?id=a90e39f896a2f1b76ad3c304b69c451ec92a687a
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + client.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/client.c b/client.c
> +index 883b1de..7119ed9 100644
> +--- a/client.c
> ++++ b/client.c
> +@@ -19,6 +19,7 @@
> + #include <sys/socket.h>
> + #include <sys/un.h>
> + #include <unistd.h>
> ++#include <string.h>
> + #include "mcelog.h"
> + #include "client.h"
> + #include "paths.h"
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
