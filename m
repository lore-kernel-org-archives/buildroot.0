Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A370BE9A056
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A5D461259;
	Thu, 19 Feb 2026 17:26:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZxNoAYNKGmXi; Thu, 19 Feb 2026 17:26:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16C2261184
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771522015;
	bh=bqgNyGGHCV1raOTMrmT0lcXsMSllFZ7N7UgbE+reric=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Xb6OEf1L+n2Bw9NGj8Y5hSn9888jE2uaYLSR7f2th1zLZTdFPQUNWjPQ2JBnE6dak
	 ZhJXe8cO0thvCqxoK8fhpfBmGxvK0/9w5iH1TEWl29o9mQgzBX5NQfWg3ZnuZn5hcg
	 Seat2s9bozpFBajHFReNAqzlHHrF9QqKRQpDDRkBstFp6x+LNLDPsFmyXi7u0VJmPy
	 oZjdAupioF3jJL3L2M8wZHUFHzd8JzNikOBOj7smUSISkUHhvofkd42GJDbJ9YEe7z
	 Bx9WUN0Yohwcq4LF0kpHs9kyXHUmnVcUkBCpdy7hmlf3eOu4+lKglmzV+JQPXf1W4V
	 A4MT5gmYmg20Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16C2261184;
	Thu, 19 Feb 2026 17:26:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F1C71CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 051D9403E5
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FXtOaaGMBA3F for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:26:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D07744045B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D07744045B
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D07744045B
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:43 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-4376c0bffc1so980034f8f.0
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 09:26:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771522002; x=1772126802;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=H2PV76HyfgcZI6nix92GJPlh4bM3Bi3EAN8nyRinX/0=;
 b=o5brLCwB52vwl5jWrC1ka6FizO86BqMySh+9ieI3Z1azqj2mr0UPPucGWgrHEfB7ej
 UByYO7g9rtik4tIwUf86etYTFJjSQuWQxgGWtxvgfSIaot3ltpSbkzhr6/BBfNbXlbOI
 6AaYQM6EqzTotwpjWssoAoTqBpy1D6MAqIrW2g7fvD277tj+UERyn5qxKmwC/XEoeOAf
 xJtBAahFYt96Ry3OZjY5VxXd5I8REVmf92L5H5/cKWEQFeKSQd2hcC0S7Zdl2jbCqt/7
 XRULW3M7LJ11ThIS0J1rIjiIUCab2NpR3UZfskalnenzjrMyZOpeDheNnbFuAC3jifNC
 yS1Q==
X-Gm-Message-State: AOJu0YzfOHFiHKZyWBHd/g9V4YqkDWGfLDFQNslVbI7sjJsIBchakaUz
 nq7+ch3GqZz65tlaPRBxZ6657HNlWxB3Arfg4bqcgx2YZjVwAfMoNxyvU1V+L7Uk+6uPY0Oku64
 y8fDZ
X-Gm-Gg: AZuq6aITaR19sKDjjj4a/4XdhdWQ03VJv05QY/2yiWeqDMgj7FQOLgCvb5oXNZeSb1S
 X/H9tDANa5cEApWPGZG15rZIPgV/T18GivKF+a/5DeDX7N5z4yxgFJXMrEevdCgSQK11TQfP7Iw
 Bz9JG5opGfZ/+9ct8Fefi9ARHZv99zx38YB9h9vZPu8dPHAuOEMgi384danmrKy8rHxeGhGCSM5
 wv4q2pt9eyEx62NBd8z6uca1bXcmyHwpjujVWfM4YNh2G3TMjQcXIGGgSa1iVWi9tMpfyYDeVyE
 yHqp2YcrALLRpHykhujXd0LYoiAbfDUkGcVf695LmBxz/g1c6fhd3vu6G5cJpW0JManUGuXRbRB
 LOXXXF7Z/BP4Hlxtcmxv4wTj0NFbtwoj5iGxtzcxYhP+B8jpVownC3YqIf5+VKuCkEAWmgosWex
 EMCEdBRVIZdH1Rx+6ACgtZ7Nah7A==
X-Received: by 2002:a05:6000:2313:b0:42f:bb08:d1ef with SMTP id
 ffacd0b85a97d-4395fd352cemr5645280f8f.17.1771522001724; 
 Thu, 19 Feb 2026 09:26:41 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac8209sm51227939f8f.30.2026.02.19.09.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:26:41 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 19 Feb 2026 18:26:40 +0100
Message-ID: <20260219172640.341322-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260215141716.34571-1-thomas.perale@mind.be>
References: <20260215141716.34571-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771522002; x=1772126802; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H2PV76HyfgcZI6nix92GJPlh4bM3Bi3EAN8nyRinX/0=;
 b=MLoUTS83dEmJdzJX2aVg4OdiMh45SojuCh/OHhGqxxSIEXfk+7dQb+MkvtTWso54hH
 2m3fFbuI2IJmLpJe8cavvohxjjYIgToYt0bOWy6x//4nOjfrIpXuCYre/K8oj7WWkEVk
 jPLg2P9wfRyfDLVSZwFHhkJmPqjvjwZIJNpbYSv/m7+Cr44wky2ZFHL7yeIpnQWf5IgH
 QUMb8wBCjx0uF2ua9O3MPZFtObfx7AUCewKh9Yl8Ixy4zEnRBagnVUfg0u2JjhfNhW3l
 80JFHKDPLGfm/xiS6QCna5vAWd7MGJFg1Epm0bPHXj/NYy7RysBAQgAvzc4QsmyJ/0Iv
 XzmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MLoUTS83
Subject: Re: [Buildroot] [PATCH 1/1] package/busybox: patch CVE-2025-60876
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
> This commit fixes the following vulenerability:
> 
> - CVE-2025-60876:
>     BusyBox wget thru 1.3.7 accepted raw CR (0x0D)/LF (0x0A) and other C0
>     control bytes in the HTTP request-target (path/query), allowing the
>     request line to be split and attacker-controlled headers to be
>     injected. To preserve the HTTP/1.1 request-line shape METHOD SP
>     request-target SP HTTP/1.1, a raw space (0x20) in the request-target
>     must also be rejected (clients should use %20).
> 
> For more information, see:
>     - https://www.cve.org/CVERecord?id=CVE-2025-60876
>     - https://lists.busybox.net/pipermail/busybox/2025-November/091840.html
>     - https://sources.debian.org/data/main/b/busybox/1%3A1.37.0-10/debian/patches/wget-disallow-control-chars-in-URLs-CVE-2025-60876.patch
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  ...trol-characters-or-spaces-in-the-URL.patch | 42 +++++++++++++++++++
>  package/busybox/busybox.mk                    |  3 ++
>  2 files changed, 45 insertions(+)
>  create mode 100644 package/busybox/0014-wget-dont-allow-control-characters-or-spaces-in-the-URL.patch
> 
> diff --git a/package/busybox/0014-wget-dont-allow-control-characters-or-spaces-in-the-URL.patch b/package/busybox/0014-wget-dont-allow-control-characters-or-spaces-in-the-URL.patch
> new file mode 100644
> index 0000000000..d0a31ed821
> --- /dev/null
> +++ b/package/busybox/0014-wget-dont-allow-control-characters-or-spaces-in-the-URL.patch
> @@ -0,0 +1,42 @@
> +From: Radoslav Kolev <radoslav.kolev@suse.com>
> +Date: Fri, 21 Nov 2025 11:21:18 +0200
> +Subject: wget: don't allow control characters or spaces in the URL
> +Forwarded: yes, https://lists.busybox.net/pipermail/busybox/2025-November/091840.html
> +Bug-Debian: https://bugs.debian.org/1120795
> +
> +Fixes CVE-2025-60876 malicious URL can be used to inject
> +HTTP headers in the request.
> +
> +Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
> +Reviewed-by: Emmanuel Deloget <logout@free.fr>
> +Upstream: https://sources.debian.org/data/main/b/busybox/1%3A1.37.0-10/debian/patches/wget-disallow-control-chars-in-URLs-CVE-2025-60876.patch
> +Upstream: https://lists.busybox.net/pipermail/busybox/2025-November/091840.html
> +CVE: CVE-2025-60876
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + networking/wget.c | 9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/networking/wget.c b/networking/wget.c
> +index ec3767793..fa555427b 100644
> +--- a/networking/wget.c
> ++++ b/networking/wget.c
> +@@ -536,6 +536,15 @@ static void parse_url(const char *src_url, struct host_info *h)
> + {
> + 	char *url, *p, *sp;
> + 
> ++	/* Fix for CVE-2025-60876 - don't allow control characters or spaces in the URL */
> ++	/* otherwise a malicious URL can be used to inject HTTP headers in the request */
> ++	const unsigned char *u = (void *) src_url;
> ++	while (*u) {
> ++		if (*u <= ' ')
> ++			bb_simple_error_msg_and_die("Unencoded control character found in the URL!");
> ++		u++;
> ++	}
> ++
> + 	free(h->allocated);
> + 	h->allocated = url = xstrdup(src_url);
> + 
> +-- 
> +2.47.3
> +
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 7ae9c1d41e..a33548c355 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -19,6 +19,9 @@ BUSYBOX_IGNORE_CVES += CVE-2022-28391
>  # 0013-testsuite-tar-tests-fix-test-after-cve-2025-46394.patch
>  BUSYBOX_IGNORE_CVES += CVE-2025-46394
>  
> +# 0014-wget-dont-allow-control-characters-or-spaces-in-the-URL.patch
> +BUSYBOX_IGNORE_CVES += CVE-2025-60876
> +
>  BUSYBOX_CFLAGS = \
>  	$(TARGET_CFLAGS)
>  
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
