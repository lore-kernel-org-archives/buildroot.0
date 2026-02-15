Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D01EF586E
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 14:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5685E82308;
	Sun, 15 Feb 2026 14:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5hO5IMKkRw5K; Sun, 15 Feb 2026 14:17:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0219981D5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771165043;
	bh=HIlZwYqCia2mEJGiD36n7YKOEhrctZH2KBtmRXOZOLA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=C/y2ZjJleDbRt1itkzbXe3F14YUUam23cQy7TgSByLz/20kFRJj5HZcOeJVg03Y7t
	 kk3GiW/bYYE6dIFq0GL1iK3o1UYKzanGVJq220qW4B2ypU9WQFiOYHNgrJkQDa7y6l
	 HSVPCIUSstOELSbzdQSGbEvcQIMDzBsyN6uNSSuRVgw0Xczs2WsNHdkF3YhoJiqBIo
	 xSDBQuWE/yOdMs+coYFQOoZAiE0HOGnKk73BQfiJNsyjGxAAwPbqryaeicZtYbHWBp
	 YeOAQvlTt/EaHvqaWlSdywtLkuNdb+tetaDzE/hbO8iIrO2bBK832HUQCV5AAO6rzg
	 NB5ot2wND8pIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0219981D5C;
	Sun, 15 Feb 2026 14:17:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA1AB35B
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 14:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8A32608F8
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 14:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qe4pCshZJraO for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 14:17:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9CDED608F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CDED608F7
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9CDED608F7
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 14:17:19 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso41065535e9.0
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 06:17:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771165038; x=1771769838;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tG0FjTNenpL7Rykyl3tZM8PLp4W2Qnhe8ovaD9u2YPw=;
 b=VzxswGebrQTwD6o+Dglq+4ZMCG3mmF8zicagn16mEgOBIu6FmlEbx2NoAxc21iKFaw
 cahqOZBEb3Bn+JaN9gv3f/VvgeM2eaxzcENj8zaViucGU/rNdNmC03nFLhH7Z+ohLxqd
 jaMtrg9Jf3jpmi/7KWJh79LvOv8fHcfos6RcKooLzo/vJnDEXTynUQljJPgF4UvyQGLx
 6TlisXMzIHDVNlHQkiqOYK0z9O4eb/vYNdv/HcwsG2GlzUnoE1SREZFpkCigxNFPpic9
 9wLwUA35z2owACj8js1owrOHkadDcKvTbgIYC5UBjAVWpRsP4J9kprSiG203fi2seqjz
 jIGA==
X-Gm-Message-State: AOJu0YyQ1qcIJhIU99LhF/Mj/PdnX1cN07gbfyl0X9Rnf5DQSMxwof3J
 r2HgzzrMLnGS2/04b06CiYLn7l3K/5mFZKBYvDMpirOcxufjV7m/XqiN9Aaz6mG2cItDKSrhInC
 Fts5J
X-Gm-Gg: AZuq6aKkhSiW7ApOVtpDBesxjkFLIPu8QpexkyE82JsfaevzFNlA7j6Pocju1nkntoj
 GDlJGrPg4QI6XiaPHZEZysAk6rcsxmcKgPBQNOUhwgJr5RZ3Vwi8HOArKFxHlsLtl49QX68ceVe
 Dfp2Sm3Z/Uxty8PMYP4ACB2CMZdSa4Kh2HGygIEoW/eaLqvMaTvxdU9HOwZC5C9Fk3DOJq8T7zU
 GBvWRTukg8uozWgB+M+89Oa7iEd6WEKMvORtjsx3qAjOA0+piCjQ2dPd3x2zraipoAuMrvsJfu/
 jvVDFLtxv+/7djjVpBgCUHVJ1Ar3AXk1NNPa+qrc7s6c+wf/Y2ykm2EtKNTbVPUxO/J1lQtdhpA
 Qt0Xf0+TAFaFZyCgC3MXvuEpXZvlfggTOyWsVZGIAlBuGkBw0X2Gub4TTN63zklCBC4UW4iS7zS
 6AR8++DxmNUu0en9k=
X-Received: by 2002:a05:600c:4e8e:b0:477:991c:a17c with SMTP id
 5b1f17b1804b1-48378d62cbdmr104233445e9.6.1771165037526; 
 Sun, 15 Feb 2026 06:17:17 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d835f6bsm368732915e9.14.2026.02.15.06.17.17
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 06:17:17 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun, 15 Feb 2026 15:17:16 +0100
Message-ID: <20260215141716.34571-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771165037; x=1771769837; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=tG0FjTNenpL7Rykyl3tZM8PLp4W2Qnhe8ovaD9u2YPw=;
 b=HWW6kv2rAGgvE8Vj+dONY8EkXEJvqLJIK03UE0EotCjH9beE5rgBc6ZVBTG3hFkIUB
 X5FReZv7X2migzUA4BW2/rGTqw4/TjeUrResrGp6qeX9qrdZq9lENk69d1eQrmyBpBDW
 RVYRV4u7rPbYNXUnZZ8SAwlFjT0d0Ap7ZSrYYSJaFp8dAVKfwxqWertyEPBLsE2GylJl
 0fWfJeBrASkyqtCx/mR/wGG0kyVGYmtiwP6r0j0HEh8m3VFs32bqDcu3s/0JjFk3lk+/
 KG7gchttCjRa3eB20ve72ThI2zdbGQTjHsM4KNCTQTI2PB3s7gikPaKvl7Kt7fcNPLtB
 DFAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=HWW6kv2r
Subject: [Buildroot] [PATCH 1/1] package/busybox: patch CVE-2025-60876
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

This commit fixes the following vulenerability:

- CVE-2025-60876:
    BusyBox wget thru 1.3.7 accepted raw CR (0x0D)/LF (0x0A) and other C0
    control bytes in the HTTP request-target (path/query), allowing the
    request line to be split and attacker-controlled headers to be
    injected. To preserve the HTTP/1.1 request-line shape METHOD SP
    request-target SP HTTP/1.1, a raw space (0x20) in the request-target
    must also be rejected (clients should use %20).

For more information, see:
    - https://www.cve.org/CVERecord?id=CVE-2025-60876
    - https://lists.busybox.net/pipermail/busybox/2025-November/091840.html
    - https://sources.debian.org/data/main/b/busybox/1%3A1.37.0-10/debian/patches/wget-disallow-control-chars-in-URLs-CVE-2025-60876.patch

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...trol-characters-or-spaces-in-the-URL.patch | 42 +++++++++++++++++++
 package/busybox/busybox.mk                    |  3 ++
 2 files changed, 45 insertions(+)
 create mode 100644 package/busybox/0014-wget-dont-allow-control-characters-or-spaces-in-the-URL.patch

diff --git a/package/busybox/0014-wget-dont-allow-control-characters-or-spaces-in-the-URL.patch b/package/busybox/0014-wget-dont-allow-control-characters-or-spaces-in-the-URL.patch
new file mode 100644
index 0000000000..d0a31ed821
--- /dev/null
+++ b/package/busybox/0014-wget-dont-allow-control-characters-or-spaces-in-the-URL.patch
@@ -0,0 +1,42 @@
+From: Radoslav Kolev <radoslav.kolev@suse.com>
+Date: Fri, 21 Nov 2025 11:21:18 +0200
+Subject: wget: don't allow control characters or spaces in the URL
+Forwarded: yes, https://lists.busybox.net/pipermail/busybox/2025-November/091840.html
+Bug-Debian: https://bugs.debian.org/1120795
+
+Fixes CVE-2025-60876 malicious URL can be used to inject
+HTTP headers in the request.
+
+Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
+Reviewed-by: Emmanuel Deloget <logout@free.fr>
+Upstream: https://sources.debian.org/data/main/b/busybox/1%3A1.37.0-10/debian/patches/wget-disallow-control-chars-in-URLs-CVE-2025-60876.patch
+Upstream: https://lists.busybox.net/pipermail/busybox/2025-November/091840.html
+CVE: CVE-2025-60876
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ networking/wget.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/networking/wget.c b/networking/wget.c
+index ec3767793..fa555427b 100644
+--- a/networking/wget.c
++++ b/networking/wget.c
+@@ -536,6 +536,15 @@ static void parse_url(const char *src_url, struct host_info *h)
+ {
+ 	char *url, *p, *sp;
+ 
++	/* Fix for CVE-2025-60876 - don't allow control characters or spaces in the URL */
++	/* otherwise a malicious URL can be used to inject HTTP headers in the request */
++	const unsigned char *u = (void *) src_url;
++	while (*u) {
++		if (*u <= ' ')
++			bb_simple_error_msg_and_die("Unencoded control character found in the URL!");
++		u++;
++	}
++
+ 	free(h->allocated);
+ 	h->allocated = url = xstrdup(src_url);
+ 
+-- 
+2.47.3
+
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 7ae9c1d41e..a33548c355 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -19,6 +19,9 @@ BUSYBOX_IGNORE_CVES += CVE-2022-28391
 # 0013-testsuite-tar-tests-fix-test-after-cve-2025-46394.patch
 BUSYBOX_IGNORE_CVES += CVE-2025-46394
 
+# 0014-wget-dont-allow-control-characters-or-spaces-in-the-URL.patch
+BUSYBOX_IGNORE_CVES += CVE-2025-60876
+
 BUSYBOX_CFLAGS = \
 	$(TARGET_CFLAGS)
 
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
