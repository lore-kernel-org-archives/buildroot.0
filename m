Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A071CD6E4F
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E3BE423A2;
	Fri, 29 May 2026 08:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wxtZea_StreA; Fri, 29 May 2026 08:31:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BE2E4239F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043461;
	bh=sLMZBj1RM+NfXXHLGvunGwSSQP4aL4Q1hWDyEA1l120=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NpflwNBevztOaXEANq5tEn7LFtG9uveI6vmoo/hUT8YelAlGpVWmc5bP2GBbWocnr
	 vv/3RhnOt6jgXVdoAohEUSolaM3u5uJHtXvihMEwuEXmPOKNmvWJmf0V/YR2/1EIFW
	 ToNw3fXjPYas947t1TIRSXE9GB4NDcmjxXfyXgNQ7bfLHwJLzthfdLQZVmmj6c8iwj
	 Utq4460d29zC6L2GWmfmM1YkGm/STF4oxEsgyy0JfoQ07K3D1NNcrhyet+OeX3d0HL
	 QlLmYpcy8pJll0bIfDQAbtQ33UncYTzGjZ3Aynq08JgCtQhx7t5DU+mrxSXvLJfND1
	 lmlqd44JlOYSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BE2E4239F;
	Fri, 29 May 2026 08:31:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 128F9288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82DC442367
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 66KZSjqImcGg for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 45D4542370
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45D4542370
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45D4542370
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:42 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-49068493267so37337795e9.1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043440; x=1780648240;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5sfenPUe31Vvg9sO+gt8VslB3h5+TRqdj8d3TBX5SRs=;
 b=FWFVZt0qfKOU3a0+TJnhRqUnok+Q+oTlDDd+b2SlrhTfE4Fx+xYJHQRBobwYGgSR9q
 a+Y+YSfo8FJv49LgSgpr6kRo4yu5mkykSAobbE4eTxeZ8Tn9IZgSpdOnVinMMPfr7u/w
 mNDVqGFUeBPP2IkYp4ksxlWXRXyDyTsWvUHy2SJbbx52BQP8KRpof11pX3gyL/W8Ma5i
 apLCbKdNJNJ1RWdcSsrZ3PYzIDLbQdoTLr/uI6VNcUby6c0Q9mTUCvK775BIkR5DBiwp
 sXUzZ2Bjk6Et0TAE/S5l011pTCRmlaGJA81FSJ3K2AkRRLXxfZDgytiEqJxf8pr4CsPT
 gfNw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+U1hb6ubqjFVZqhkl1wZTfZxTOT6lHlEW0e44CaBgL7uhVZTH0tIP8aM8fF+bUqtB/Hzck5rI5Xow=@buildroot.org
X-Gm-Message-State: AOJu0Yy3ztYUfDxn5MtCbbJJ8UvkMa8OoFc/IpYOsFILmC0jhVw0G3cg
 vcez9To9lqk/odtrwe7ty8IMTW50j74fqqLZ3pZFrZBRZIwNTG29kShgNZtmFqjcN/8=
X-Gm-Gg: Acq92OEYjcF2TrUAKty2VvyCOU6xls3wefeeao4jKp/OendSalORbgbdNkBtJzh8PaN
 ysVjJoGQY/SzjTxJq92yBO64JcuPf3+Ev9oOpXH4tN6i6tuedGvg/y4v2n5nmBjAa38c9QTBQxS
 es2BBcRlK93/xWf1OIJtgxcrIOc393d0fR0MuldJkiIkWcHk/y6FDUoD5n9TWfN70P5aA/JfIow
 4xdvL0a9ccPvZNvFve9d5A4HT+zzdhxbntmvloc3rR57CZyvsWrqzVQQF5vfta1htzP30HRQDtq
 ar4Tkfh6OG9f2nORhi0O1ApIBwLKBjLaOwl7dtGVjNi5oOVfC2qD6uTb87MIMg8RUK0Z7Gwj2M8
 peWXW9CknzdeNO0oApsdlU9HfHeeiIEU2UaT19mCK9O1e3XFJqdidVliBF/j9FTlVndn6cL3IsJ
 DUAm/dDZWxz6Us4xPGfLc4yri59RDieB+03YQFs52J4dU2KwnwZ0QmQlPcxg==
X-Received: by 2002:a05:600c:468a:b0:490:5cb3:e94a with SMTP id
 5b1f17b1804b1-4909c8558c2mr31350095e9.2.1780043440174; 
 Fri, 29 May 2026 01:30:40 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d68b853sm24754615e9.3.2026.05.29.01.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:39 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:39 +0200
Message-ID: <20260529083039.60328-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260524170129.3211403-1-bernd@kuhls.net>
References: <20260524170129.3211403-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043440; x=1780648240; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5sfenPUe31Vvg9sO+gt8VslB3h5+TRqdj8d3TBX5SRs=;
 b=PTAkTkqnxLwvl0/r9Wcf+/om1Gv9fZOkVPA9ycsmucPTIZpIu/vlRcaJ01Ov5gHvad
 D8KLsTg0AYaFpd5DJYmB4YGlg7I5DKoxGd+zPPcpdM35zXodRX4enLoNfVxotZu9LkOl
 8qoY7CCAm3GeAqLO/dNbhOyHKUYTwhb2jUNURdTBUevYJ2S8yXRtlbubnS1uFd7HhVze
 337HEd9NSnuzuCFuQQ36K7VYG3Y4JVC17N7Ey7ZDF2EbajAsLommSio00qfeXFpme1rW
 1wBtqbjcd70sspWcIJIZ+DctMYDpd1zX+ix0FU672krHlfzHGPNHnsQEuiNEpwNDuWMn
 84WA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PTAkTkqn
Subject: Re: [Buildroot] [PATCH 1/1] package/kexec: fix powerpc build
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
> Added two upstream commits to fix build errors on powerpc.
> 
> The build error also occurs with kexec 2.0.30 on the 2025.02.x branch
> so a backport to LTS branches should be considered:
> https://autobuild.buildroot.net/results/2ec/2ec0d85c658f8264fcc4eef2deb6c67671e3e7ae/
> 
> Fixes:
> https://autobuild.buildroot.net/results/53b/53bafc454533aeafc21116a99d87391b3049e12a/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  ...ix-function-signature-of-comparefunc.patch | 42 +++++++++++++++
>  ...rations-in-read-memory_region_limits.patch | 54 +++++++++++++++++++
>  2 files changed, 96 insertions(+)
>  create mode 100644 package/kexec/0001-kexec-tools-powerpc-Fix-function-signature-of-comparefunc.patch
>  create mode 100644 package/kexec/0002-kexec-tools-powerpc-Fix-pointer-declarations-in-read-memory_region_limits.patch
> 
> diff --git a/package/kexec/0001-kexec-tools-powerpc-Fix-function-signature-of-comparefunc.patch b/package/kexec/0001-kexec-tools-powerpc-Fix-function-signature-of-comparefunc.patch
> new file mode 100644
> index 0000000000..809e91e939
> --- /dev/null
> +++ b/package/kexec/0001-kexec-tools-powerpc-Fix-function-signature-of-comparefunc.patch
> @@ -0,0 +1,42 @@
> +From b89799f7f20d4b2476e99e95e6795450f2f1c111 Mon Sep 17 00:00:00 2001
> +From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> +Date: Wed, 22 Oct 2025 13:44:12 +0200
> +Subject: kexec-tools: powerpc: Fix function signature of comparefunc()
> +
> +Fixes the following build error on 32-bit PowerPC:
> +
> +kexec/arch/ppc/fs2dt.c: In function 'putnode':
> +kexec/arch/ppc/fs2dt.c:338:51: error: passing argument 4 of 'scandir' from incompatible pointer type [-Wincompatible-pointer-types]
> +  338 |         numlist = scandir(pathname, &namelist, 0, comparefunc);
> +      |                                                   ^~~~~~~~~~~
> +      |                                                   |
> +      |                                                   int (*)(const void *, const void *)
> +
> +Signed-off-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> +Reviewed-by: Khalid Aziz <khalid@gonehiking.org>
> +Signed-off-by: Simon Horman <horms@kernel.org>
> +
> +Upstream: https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=b89799f7f20d4b2476e99e95e6795450f2f1c111
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + kexec/arch/ppc/fs2dt.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/kexec/arch/ppc/fs2dt.c b/kexec/arch/ppc/fs2dt.c
> +index fed499b..d03b995 100644
> +--- a/kexec/arch/ppc/fs2dt.c
> ++++ b/kexec/arch/ppc/fs2dt.c
> +@@ -292,7 +292,8 @@ static void putprops(char *fn, struct dirent **nlist, int numlist)
> +  * Compare function used to sort the device-tree directories
> +  * This function will be passed to scandir.
> +  */
> +-static int comparefunc(const void *dentry1, const void *dentry2)
> ++static int comparefunc(const struct dirent **dentry1,
> ++		       const struct dirent **dentry2)
> + {
> + 	char *str1 = (*(struct dirent **)dentry1)->d_name;
> + 	char *str2 = (*(struct dirent **)dentry2)->d_name;
> +-- 
> +cgit 1.3-korg
> +
> diff --git a/package/kexec/0002-kexec-tools-powerpc-Fix-pointer-declarations-in-read-memory_region_limits.patch b/package/kexec/0002-kexec-tools-powerpc-Fix-pointer-declarations-in-read-memory_region_limits.patch
> new file mode 100644
> index 0000000000..ed6c7bb392
> --- /dev/null
> +++ b/package/kexec/0002-kexec-tools-powerpc-Fix-pointer-declarations-in-read-memory_region_limits.patch
> @@ -0,0 +1,54 @@
> +From 8ac3a7e08957fcb3fa59c9fc4e9c283b9a072ce6 Mon Sep 17 00:00:00 2001
> +From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> +Date: Wed, 22 Oct 2025 13:44:13 +0200
> +Subject: kexec-tools: powerpc: Fix pointer declarations in
> + read_memory_region_limits()
> +
> +Fixes the following two build errors on 32-bit PowerPC:
> +
> +kexec/arch/ppc/kexec-ppc.c: In function 'read_memory_region_limits':
> +kexec/arch/ppc/kexec-ppc.c:106:11: error: assignment to 'long long unsigned int *' from incompatible pointer type 'long unsigned int *' [-Wincompatible-pointer-types]
> +  106 |         p = (unsigned long*)buf;
> +      |           ^
> +
> +kexec/arch/ppc/kexec-ppc.c: In function 'read_memory_region_limits':
> +kexec/arch/ppc/kexec-ppc.c:112:19: error: assignment to 'long unsigned int *' from incompatible pointer type 'long long unsigned int *' [-Wincompatible-pointer-types]
> +  112 |                 p = (unsigned long long *)p + 1;
> +      |                   ^
> +
> +Signed-off-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> +Reviewed-by: Khalid Aziz <khalid@gonehiking.org>
> +Signed-off-by: Simon Horman <horms@kernel.org>
> +
> +Upstream: https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/patch/?id=8ac3a7e08957fcb3fa59c9fc4e9c283b9a072ce6
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + kexec/arch/ppc/kexec-ppc.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/kexec/arch/ppc/kexec-ppc.c b/kexec/arch/ppc/kexec-ppc.c
> +index d3dad0f..e173433 100644
> +--- a/kexec/arch/ppc/kexec-ppc.c
> ++++ b/kexec/arch/ppc/kexec-ppc.c
> +@@ -91,7 +91,7 @@ int read_memory_region_limits(int fd, unsigned long long *start,
> + 				unsigned long long *end)
> + {
> + 	char buf[MAXBYTES];
> +-	unsigned long *p;
> ++	unsigned long long *p;
> + 	unsigned long nbytes = dt_address_cells + dt_size_cells;
> + 
> + 	if (lseek(fd, 0, SEEK_SET) == -1) {
> +@@ -103,7 +103,7 @@ int read_memory_region_limits(int fd, unsigned long long *start,
> + 		return -1;
> + 	}
> + 
> +-	p = (unsigned long*)buf;
> ++	p = (unsigned long long*)buf;
> + 	if (dt_address_cells == sizeof(unsigned long)) {
> + 		*start = p[0];
> + 		p++;
> +-- 
> +cgit 1.3-korg
> +
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
