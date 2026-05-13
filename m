Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFA0CD37B6
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 10:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B878411E1;
	Wed, 13 May 2026 10:39:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Fktow4ac5q1; Wed, 13 May 2026 10:39:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5064F411E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778668762;
	bh=CjQlg/G3HcXknVM/QN44RKQzFswc3b5xn7qE7pE1Cxg=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=LnzRYnKzzWttdEutVJd72+RgNIUk0pJ1E3OW8yFBlIWRw45a4rkzaWHUYY5go6q/r
	 drJPI+SS+Aux07JPsTkIfbEpOcssX9CGWD+cZgq9R15t2eN7M/Zv86Ben43U4NBj4i
	 2RaLDfqnjLY0ID8uBjfcwGKBUMXl50H/bdaq53cEY6Dz9nj7ahDm01XngGK3XGNFX3
	 KhZqHhc1jF4H+Vpp8TSU3ecmzd1pxmcRCar/G3vQjFxFqMguawqEYGygsRGwVikBGa
	 nTv81IUeOfv8OJS8h1MeXk50UwvQ0cc6sf/pO0HT9X0iWQXMAaf6Af8yfyR+Yev2r6
	 slj1mryo8b1Hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5064F411E5;
	Wed, 13 May 2026 10:39:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7238E33D
 for <buildroot@buildroot.org>; Wed, 13 May 2026 10:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 549366116B
 for <buildroot@buildroot.org>; Wed, 13 May 2026 10:39:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OEoYXA1AnvrF for <buildroot@buildroot.org>;
 Wed, 13 May 2026 10:39:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 17B8A6114C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17B8A6114C
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17B8A6114C
 for <buildroot@buildroot.org>; Wed, 13 May 2026 10:39:18 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-43d77f6092eso4140948f8f.2
 for <buildroot@buildroot.org>; Wed, 13 May 2026 03:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778668756; x=1779273556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KO87wb5krrBKCPK6gK4p2N7nH4DFhk6Dou7KVH26RFw=;
 b=C4z8hHDz/93n78hP4CeEhL8iWegV5w99y2GAkZSkOT+rTnvEIstIgcELZnvtewyVLz
 dFTAnz/E2oDG478hs571EoDTfX19iv7beTyEZl9ChswWwOlVK6uwxGODHdUKgV2lfA3T
 bBIKvJs8Wckjtifp2s6iOXmGyrTjY7hUxpntQOqwk1r7kzq68dxRy7sCqQbGQGGz4uJ8
 q0RHLKYeIV3qAjLoOpMxhg1rrNbI78jFimjE0gXxmJhwxhajA3heD4Wduf3B3HMlnito
 q4sKrWTxRHGlJqPJOlXQ2G2xSSbDGfD1G58GblK3A/31gSJBGni4eX4pK13MAsyxz57o
 FzOA==
X-Gm-Message-State: AOJu0YxvAv5IWe02oxWqix8YIeN2coJMzsIqpB1Eva99sbJPAPi2zwe3
 AfttwdZtqZ/mwrjn8e35Ou5jO2E7hVJ87szGYfo+6GjL9Q0xPgasuW9toq5ld7f3nFnoSjKhIcw
 6DMSC
X-Gm-Gg: Acq92OGOAdpxsndkZpvf2Y9qz/+HB5NP2Cl1OoBcbaQ0b99IpupgeB1ypLr6+3T2f2I
 r2aXJTe553+GiqkpHvAq03HlWZwTDrRSnyySEH+c2BrOCrTQhhMZiGpYcL/pH/MHUVEIZknPCuT
 f6eaJ04lPlp8SnAUrAHgylGwrFrPEuuTiVJEGoxSygtjDSRFJ3lHMTCl7Zq8oc6omVKgzAJ/FEr
 cAkFwBeR4V+IL2aTulyI68hHRjCZ6iRuuw79rlEoC1Uq8EjexdO7QDmgeJves0+pnIgUr3Vm1Wq
 IL3QuWgNTBRNByxCwU52Po9LjVVZaBlKQBbdZAIj6HPAHLXIDlvuS+wjB8zJf8JXxNb62D0Q4gp
 vDF7pOo8HTzbY2+/BB/9zAEAL3uLlwWjwAgaZHJf8c+nPNwza1FF8fY6fp/jSUdYn+bKADzhh+W
 yn2jYcd2cX9moE1ED21QedJdp4qLUCX+1Es7nXqnfomJAPtV1+duqFPms=
X-Received: by 2002:a05:6000:2305:b0:44b:cb31:b767 with SMTP id
 ffacd0b85a97d-45c5a392ca2mr4374593f8f.36.1778668755588; 
 Wed, 13 May 2026 03:39:15 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-454919c13c9sm38573215f8f.27.2026.05.13.03.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 03:39:15 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 13 May 2026 12:39:09 +0200
Message-ID: <20260513103913.419755-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513103913.419755-1-thomas.perale@mind.be>
References: <20260513103913.419755-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778668756; x=1779273556; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KO87wb5krrBKCPK6gK4p2N7nH4DFhk6Dou7KVH26RFw=;
 b=L1M3/0OguPUNhukX5vkT7EZnKl5B1vHTYDDykaVZYhI4ngrqvVQA5TWMG8L0BxP05F
 s/k89kkNsqnS/yBCeEjj1SBGKiLQk8kvgU79KUphZ5bx8rg9wesLqr8TGZTfJ/x2xUU0
 YswbzZi2wJ3cpRT54P1KgGaIlRLaKWbIWW5nWYdMd56gitH/WkQ2AUFAq7+evR237dpE
 3mLl7xre6fWtZmUZLfe/KIP83GfSfzed/1hOzS9cvahhrrkHJx4ic/P/Lbm95cRAZikZ
 mDdZjn+j3WEdWNvZzPbBWCagHDrWu5LRwO4WQvp6fq/MEg24d+niv4DmudqnGKG3Vjjk
 J2Pw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=L1M3/0Og
Subject: [Buildroot] [PATCH 2025.02.x] package/python-pyopenssl: patch
 CVE-2026-274{48, 59}
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- CVE-2026-27448:
    pyOpenSSL is a Python wrapper around the OpenSSL library. Starting in
    version 0.14.0 and prior to version 26.0.0, if a user provided
    callback to `set_tlsext_servername_callback` raised an unhandled
    exception, this would result in a connection being accepted. If a user
    was relying on this callback for any security-sensitive behavior, this
    could allow bypassing it. Starting in version 26.0.0, unhandled
    exceptions now result in rejecting the connection.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-27448
 - https://github.com/pyca/pyopenssl/commit/d41a814759a9fb49584ca8ab3f7295de49a85aa0

- CVE-2026-27459:
    pyOpenSSL is a Python wrapper around the OpenSSL library. Starting in
    version 22.0.0 and prior to version 26.0.0, if a user provided
    callback to `set_cookie_generate_callback` returned a cookie value
    greater than 256 bytes, pyOpenSSL would overflow an OpenSSL provided
    buffer. Starting in version 26.0.0, cookie values that are too long
    are now rejected.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-27459
 - https://github.com/pyca/pyopenssl/commit/57f09bb4bb051d3bc2a1abd36e9525313d5cd408

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-CVE-2026-27448.patch                 | 50 +++++++++++++++++++
 .../0002-CVE-2026-27459.patch                 | 46 +++++++++++++++++
 package/python-pyopenssl/python-pyopenssl.mk  |  6 +++
 3 files changed, 102 insertions(+)
 create mode 100644 package/python-pyopenssl/0001-CVE-2026-27448.patch
 create mode 100644 package/python-pyopenssl/0002-CVE-2026-27459.patch

diff --git a/package/python-pyopenssl/0001-CVE-2026-27448.patch b/package/python-pyopenssl/0001-CVE-2026-27448.patch
new file mode 100644
index 0000000000..e2940fc168
--- /dev/null
+++ b/package/python-pyopenssl/0001-CVE-2026-27448.patch
@@ -0,0 +1,50 @@
+From d41a814759a9fb49584ca8ab3f7295de49a85aa0 Mon Sep 17 00:00:00 2001
+From: Alex Gaynor <alex.gaynor@gmail.com>
+Date: Mon, 16 Feb 2026 21:04:37 -0500
+Subject: [PATCH] Handle exceptions in set_tlsext_servername_callback callbacks
+ (#1478)
+
+When the servername callback raises an exception, call sys.excepthook
+with the exception info and return SSL_TLSEXT_ERR_ALERT_FATAL to abort
+the handshake. Previously, exceptions would propagate uncaught through
+the CFFI callback boundary.
+
+https://claude.ai/code/session_01P7y1XmWkdtC5UcmZwGDvGi
+
+Co-authored-by: Claude <noreply@anthropic.com>
+
+Upstream: https://github.com/pyca/pyopenssl/commit/d41a814759a9fb49584ca8ab3f7295de49a85aa0
+CVE: CVE-2026-27448
+[thomas: backported, stripped tests and changelog]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/OpenSSL/SSL.py |  7 ++++++-
+ 1 files changed, 7 insertions(+)
+ 
+diff --git a/src/OpenSSL/SSL.py b/src/OpenSSL/SSL.py
+index 4db5240..a6263c4 100644
+--- a/src/OpenSSL/SSL.py
++++ b/src/OpenSSL/SSL.py
+@@ -2,6 +2,7 @@
+ 
+ import os
+ import socket
++import sys
+ import typing
+ import warnings
+ from collections.abc import Sequence
+@@ -1686,7 +1687,11 @@ class Context:
+ 
+         @wraps(callback)
+         def wrapper(ssl, alert, arg):  # type: ignore[no-untyped-def]
+-            callback(Connection._reverse_mapping[ssl])
++            try:
++                callback(Connection._reverse_mapping[ssl])
++            except Exception:
++                sys.excepthook(*sys.exc_info())
++                return _lib.SSL_TLSEXT_ERR_ALERT_FATAL
+             return 0
+ 
+         self._tlsext_servername_callback = _ffi.callback(
+-- 
+2.43.0
diff --git a/package/python-pyopenssl/0002-CVE-2026-27459.patch b/package/python-pyopenssl/0002-CVE-2026-27459.patch
new file mode 100644
index 0000000000..586c443093
--- /dev/null
+++ b/package/python-pyopenssl/0002-CVE-2026-27459.patch
@@ -0,0 +1,46 @@
+From 57f09bb4bb051d3bc2a1abd36e9525313d5cd408 Mon Sep 17 00:00:00 2001
+From: Alex Gaynor <alex.gaynor@gmail.com>
+Date: Wed, 18 Feb 2026 07:46:15 -0500
+Subject: [PATCH] Fix buffer overflow in DTLS cookie generation callback
+ (#1479)
+
+The cookie generate callback copied user-returned bytes into a
+fixed-size native buffer without enforcing a maximum length. A
+callback returning more than DTLS1_COOKIE_LENGTH bytes would overflow
+the OpenSSL-provided buffer, corrupting adjacent memory.
+
+Co-authored-by: Claude Opus 4.6 <noreply@anthropic.com>
+
+Upstream: https://github.com/pyca/pyopenssl/commit/57f09bb4bb051d3bc2a1abd36e9525313d5cd408
+CVE: CVE-2026-27459
+[thomas: backported, stripped tests and changelog]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/OpenSSL/SSL.py |  7 +++++++
+ 1 files changed, 7 insertions(+)
+ 
+diff --git a/src/OpenSSL/SSL.py b/src/OpenSSL/SSL.py
+index a6263c4..2e4da78 100644
+--- a/src/OpenSSL/SSL.py
++++ b/src/OpenSSL/SSL.py
+@@ -716,11 +716,18 @@ class _CookieGenerateCallbackHelper(_CallbackExceptionHelper):
+     def __init__(self, callback: _CookieGenerateCallback) -> None:
+         _CallbackExceptionHelper.__init__(self)
+ 
++        max_cookie_len = getattr(_lib, "DTLS1_COOKIE_LENGTH", 255)
++
+         @wraps(callback)
+         def wrapper(ssl, out, outlen):  # type: ignore[no-untyped-def]
+             try:
+                 conn = Connection._reverse_mapping[ssl]
+                 cookie = callback(conn)
++                if len(cookie) > max_cookie_len:
++                    raise ValueError(
++                        f"Cookie too long (got {len(cookie)} bytes, "
++                        f"max {max_cookie_len})"
++                    )
+                 out[0 : len(cookie)] = cookie
+                 outlen[0] = len(cookie)
+                 return 1
+-- 
+2.43.0
diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
index 33884f8d6c..2e1e93cb7e 100644
--- a/package/python-pyopenssl/python-pyopenssl.mk
+++ b/package/python-pyopenssl/python-pyopenssl.mk
@@ -13,4 +13,10 @@ PYTHON_PYOPENSSL_CPE_ID_VENDOR = pyopenssl
 PYTHON_PYOPENSSL_CPE_ID_PRODUCT = pyopenssl
 PYTHON_PYOPENSSL_SETUP_TYPE = setuptools
 
+# 0001-CVE-2026-27448.patch
+PYTHON_PYOPENSSL_IGNORE_CVES += CVE-2026-27448
+
+# 0002-CVE-2026-27459.patch
+PYTHON_PYOPENSSL_IGNORE_CVES += CVE-2026-27459
+
 $(eval $(python-package))
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
