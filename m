Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3A810ED64F
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B22B5416C1;
	Fri, 27 Mar 2026 10:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ITzyRwjd9uDd; Fri, 27 Mar 2026 10:02:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDCC0416DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605748;
	bh=1o4eHsvojh5dRYnxXmiATU8mnxGYB405KklTuRqAMfo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jRDawOvR1C0YXopJjkVUsKHXJuhpnZ+DQJIxiFgVA/zIWyohUWlKA8/WLFu0li8rE
	 pblUBTQR+iqq6Aj//aTvdrDOjmRFvZDo4Es3wv03HmkLsB4BhPqiwJwTh8fxPoQWLR
	 CPnSbJcTLs4DG94siY/Npk4G1CM05hdv6ecjr/y2OmccGkJchlrquEzTpsrdpRSs8X
	 W1ZhseLOKY9/QUms/V1p2s1pssygrOrvnDTIuzgd3VsQrV6b7esMrUAEK0UjDO4rJ/
	 LBvYxHm2vL+AHegOQr5VRz3TfUReodvX1iEtomzmlLwhy2ZsBU3nsg0Af05tXYFueH
	 c0Eph6I2hRfhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDCC0416DB;
	Fri, 27 Mar 2026 10:02:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D6F741D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4C72416DB
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qCVv2oylhkSl for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:02:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AB9A1416C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB9A1416C1
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB9A1416C1
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:23 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-486fda2a389so15431935e9.1
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 03:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774605741; x=1775210541;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=plBDeSxbjl23hvhg2m6qS0aOEoCbfcBlHNb2IiAtakU=;
 b=niakl0y4iTLbJgbSNP2T4Kz8CGDyNuBqrsQgSw0ECMn4kydnGsycSVMd23Z4E/pVEJ
 C63Z4QfIEUyEpnvGMl4mjTUjmT7Hg7HlcoGF7uKxIL5AsO6aJKJtA9YljGh3CFrlqS/g
 2T9q1W966nbqKRC8CTx+TCgsYgmVC51J5Mc+vmgjJ30xp8RPTrE/yFR+3MZoxiq1hOft
 Gxm4afCekYUggbiEAGQKlyxdRJu+0HxvhcGyyD6U/aMMgWLK0QYSLUTkgPMtUlqmiMOB
 pah8Oragu0WtmqcOcHhL72nf4gPhV6YogUUOl1to1IutbQdZvdYRo/2ZZz9KmKAReGSz
 CxEg==
X-Gm-Message-State: AOJu0YwybWiMqwWkzzSre54xEPGW1s20dTmZYQZQ6ZYtcsxWEeKJChrh
 +Uakh9J/JO61IVfJTa0NLjbDl20pHIFk1yIPK7gRAASpRsfLK9pqaXHR/Hc7W5aS3RcbghP9N9o
 zWIi5qKw=
X-Gm-Gg: ATEYQzyrucoI76KxcU6fEZ71NF9zm43TIdmX+sToQmwUC3twpYO26DWFJgtwHAv6hD2
 RNeMhMs2Jjg9bu3eA7puCQbBbQJMuB6LPw/BQKpqh4FzfrFZq3wifeqDf5dbGRvRnw/8LrAGZYE
 bJYU6c6Rbx4w/SYg3E1OiNxKoyZKxIAGHzBU3sXXcFsWKdRwlfEBbbkVOWQ2mDOQ/6O7ITz0Khj
 lo5/OztmMTfm1z9bzF+YIpyB8u2uGgA2NCIGj3AiF900hfSkqK6pOrTcUeBSxBaiXO01E7LN7Iv
 uVHqT7uj0q7QObmJT5iwjVg3FuxYu5cbO6E343LmwIgzRijROiT19Lw1PlnPl6Z4MJxAggjvrdZ
 M3+KaqDDWpOOFGbMlRio9So/ja5BbEw/L8/BbiSr4tWwX7sIlyCP/H6v7w0aA3+sC3CWgwt1gu8
 xpr4gwWzW/6odqHylf
X-Received: by 2002:a05:600c:4505:b0:483:6d42:25c6 with SMTP id
 5b1f17b1804b1-48727f01296mr27579965e9.23.1774605741331; 
 Fri, 27 Mar 2026 03:02:21 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf5aesm15294119f8f.24.2026.03.27.03.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 03:02:20 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 11:02:20 +0100
Message-ID: <20260327100220.45873-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316151301.268215-2-thomas.perale@mind.be>
References: <20260316151301.268215-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774605741; x=1775210541; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=plBDeSxbjl23hvhg2m6qS0aOEoCbfcBlHNb2IiAtakU=;
 b=QMxKFeMirzxdXDOlHYQzR9Cy6Jso362SKzgy8E2od1wQlCRExCu9Ey26IxI1sKZN1D
 2gKq2YkCNrMK9UTTy3K5kSyfnfDMg2BWnhV+zTJkRSrAX6gP+WHGHc8EUSd3o/XaNRrp
 qBzYgsL1lBFjvpMvRm8uKvMGLM+ycxKUhyzhltClBdRmEAcJMzYZxkvQSlrDGLD3VunA
 GTvbmweqeEpF6fBv82JwUbtYN8KPdpOr9wFd3fkqLjN8LBpOmeewIHbI0/CpeFWE/luH
 iwx3OcH38XUrscf5PfCJ3elNUSvp71/3j20AFYH3JVmriu605Wovn6jOlADZghjXg8Z8
 /zew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QMxKFeMi
Subject: Re: [Buildroot] [2025.02.x,
 PATCH 2/2] package/python-wheel: patch CVE-2026-24049
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
> Fixes the following vulnerability:
> 
> - CVE-2026-24049:
>     wheel is a command line tool for manipulating Python wheel files, as
>     defined in PEP 427. In versions 0.40.0 through 0.46.1, the unpack
>     function is vulnerable to file permission modification through
>     mishandling of file permissions after extraction. The logic blindly
>     trusts the filename from the archive header for the chmod operation,
>     even though the extraction process itself might have sanitized the
>     path. Attackers can craft a malicious wheel file that, when unpacked,
>     changes the permissions of critical system files (e.g., /etc/passwd,
>     SSH keys, config files), allowing for Privilege Escalation or
>     arbitrary code execution by modifying now-writable scripts. This issue
>     has been fixed in version 0.46.2.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2026-24049
>   - https://github.com/advisories/GHSA-8rrh-rw8j-w5fx
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  ...d-security-issue-around-wheel-unpack.patch | 35 +++++++++++++++++++
>  package/python-wheel/python-wheel.mk          |  3 ++
>  2 files changed, 38 insertions(+)
>  create mode 100644 package/python-wheel/0001-fixed-security-issue-around-wheel-unpack.patch
> 
> diff --git a/package/python-wheel/0001-fixed-security-issue-around-wheel-unpack.patch b/package/python-wheel/0001-fixed-security-issue-around-wheel-unpack.patch
> new file mode 100644
> index 0000000000..8640dfa291
> --- /dev/null
> +++ b/package/python-wheel/0001-fixed-security-issue-around-wheel-unpack.patch
> @@ -0,0 +1,35 @@
> +From 7a7d2de96b22a9adf9208afcc9547e1001569fef Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Alex=20Gr=C3=B6nholm?= <alex.gronholm@nextday.fi>
> +Date: Thu, 22 Jan 2026 01:41:14 +0200
> +Subject: [PATCH] Fixed security issue around wheel unpack (#675)
> +
> +A maliciously crafted wheel could cause the permissions of a file outside the unpack tree to be altered.
> +
> +CVE: CVE-2026-24049
> +Upstream: https://github.com/pypa/wheel/commit/7a7d2de96b22a9adf9208afcc9547e1001569fef.patch
> +[thomas: change filename, remove tests]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/wheel/cli/unpack.py |  4 ++--
> + 3 files changed, 27 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/wheel/cli/unpack.py b/src/wheel/cli/unpack.py
> +index d48840e6e..83dc7423f 100644
> +--- a/src/wheel/cli/unpack.py
> ++++ b/src/wheel/cli/unpack.py
> +@@ -19,12 +19,12 @@ def unpack(path: str, dest: str = ".") -> None:
> +         destination = Path(dest) / namever
> +         print(f"Unpacking to: {destination}...", end="", flush=True)
> +         for zinfo in wf.filelist:
> +-            wf.extract(zinfo, destination)
> ++            target_path = Path(wf.extract(zinfo, destination))
> + 
> +             # Set permissions to the same values as they were set in the archive
> +             # We have to do this manually due to
> +             # https://github.com/python/cpython/issues/59999
> +             permissions = zinfo.external_attr >> 16 & 0o777
> +-            destination.joinpath(zinfo.filename).chmod(permissions)
> ++            target_path.chmod(permissions)
> + 
> +     print("OK")
> +
> diff --git a/package/python-wheel/python-wheel.mk b/package/python-wheel/python-wheel.mk
> index 417db7c167..ae02d21feb 100644
> --- a/package/python-wheel/python-wheel.mk
> +++ b/package/python-wheel/python-wheel.mk
> @@ -13,4 +13,7 @@ PYTHON_WHEEL_LICENSE_FILES = LICENSE.txt
>  PYTHON_WHEEL_CPE_ID_VENDOR = wheel_project
>  PYTHON_WHEEL_CPE_ID_PRODUCT = wheel
>  
> +# 0001-fixed-security-issue-around-wheel-unpack.patch
> +PYTHON_WHEEL_IGNORE_CVES += CVE-2026-24049
> +
>  $(eval $(host-python-package))
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
