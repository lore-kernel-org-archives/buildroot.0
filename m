Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EDCCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4A6F40FC7;
	Sat,  3 Oct 2026 08:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5mchh4FKKijq; Sat,  3 Oct 2026 08:45:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B4E2840FE2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017125;
	b=ZmXyN75UZwL7Yi14eFOobSvN6HSr7i1IvHRlKbuMFkoLVrJoT8gi9Mtukrw1AflktZ/E
	 wVJC1jVRGSb5aKhtWkAv3Xlj/qXkwmCH2Q16CBcF6fA5UlC4mPjMgXSRGRdv7Ojt0zfyh
	 iNq8qTqkzooxBQ667zvU/5S0kygIdMNg/GJTU9NFnks9m3wDOkgpOfBFfHRGJbjj7B6+e
	 CQoD60ipWkWdY0bO/HfpK+2DyCZ/GCi/yccntR7qsd789hXIT71y0qbH3Sp498x6184nx
	 5KS/CbrAatNFywQldfTTaqSHlLzDZAOj9uqodUOwzvCHNKpUqwQLhyyKTrHJJDp6AXA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017125;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ekmwh12CsGA820f2yke5lhiRCzIUzP9YJ8PeNVU5WG4=;
	b=WoQVCv30RkRx+hl4QIvmrQ4x+ae6z9QxIIyuHK1oJYJP6htZKY9NozdIAsnYTYx2VTAU
	 1qR05iSo+5iV6HdRSjxzbr5C0bxn+tYtCcrFvnwgZpWD4na84q790uRn7wQUEDjFAoXde
	 AEdq4/MnOz6iItA/qBBhjeP/jt8YPEK31dzBlYvAzuwKFfcV7oi4mQAbSFtzc8dHB4iya
	 IYoHGI2ZfKWIfEPL06qHYrryOGXLBDGckQvRs8ULVYScoZZjEnsROYP7OSN+/nzy+qNM1
	 Q2DDOHlJjg8lRaz8I0WkFbAYurfaXrETCoTxnAYvjp8AeZpU+L5vZStMaAczkIBP6Dw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017125;
	bh=Ekmwh12CsGA820f2yke5lhiRCzIUzP9YJ8PeNVU5WG4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=pTw4I/zL2p5iW08tCoav0RE8+k56SJ+cYyR+evCv6Ktj6T2g2rJ+LTSmHrGcN0m/Z
	 05IlPaLUUlPp6m4ZSl6S986faC89zW1GY/h0UbB1u+ZOpKx9xqYFPjS0hLZYA/USUZ
	 tWtuRn0ss6eYp2kVaHCgewZElNZ0jkl1LHZ3NUI/JD6FiqYp7HHkKtcdvql/3XWcTa
	 Bbvn6kMxJU8owtYsxNOSMuSx/wRUNB0yEcF2RjhdmtJvWAdAez3CBrNUiX1lJPHvWf
	 x2IET2WBRObNDsHHv/04yEhRqbUQK6ZYcNhoQUdUEJBbXBKEFlUPYQsdOvXY/PszMN
	 1trb0/AClRiNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4E2840FE2;
	Sat,  3 Oct 2026 08:45:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D64A532F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C71F480F2C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKMK7t1qdmPF for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E459981222
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017124;
 b=Iuq+wch9+KNUz6k+89BNdrH5WpMhQfKmKxPUUh3ngpaTuivpauYcoQr9VQIpkWtxUukf
 3IjlU/STOP8e96PukafSHe5kc4W/kixPj0TNFJeqHmY1g4BqY5JPlY92YmrpekFqa2PoF
 LTy50sI5juR65N8TbmjWsgpcIiVKAQNZbt0VvS9CQsMk9EY9+nZsLSoZvXgO3VcsKj15p
 zeDVY4V79s5XG/qe0IKYMF4ULxIIjEW6IsQdRlyNLNjkfZ9jllMQ9y7BpWtlcFN3DDnC/
 FN1hvqbxJ0ZETmLaskN/Ei1vXqtcmMu32R5iuWHeFbb4YgSGbmy7+iKrwJq/nm2L8/A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017124;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=An/UbgkWYbaKD3GCEVfOSdOG5LAc/DYP8ZkZMGw3Kts=;
 b=A/5vMXE9C3K3QeSrPmdLBst7Boy5LUhtDbFaBopht34lm2/2SgBmD+5cQHNQoaQLHeov
 l1+OWZvq3lpbFVCauYivWGcbHnTHMvl89ql3Kopaa+JWPMYxx8CdutKVJBt2Edq0lGo8X
 z2MQBX2aXneD7TEy31sun7wqyC42zKESy6GH6YDS6YBa5P9AtINeMSBItvVjmloNOPvwP
 zPcGsL/3yzOzmumAeQcR8xpxENGGKqEq58Bgb8dCb9ZWiNJqPcOpf7kI0b+lSjF0DD3iZ
 MGzFiLlaupsVEgJAVG4CrqsK8mI/nPcZPhVy8YOP1/8VhVZP3EqLqJeQVXkRV9HP1Qg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=YoTbZi2+; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=YoTbZi2+
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E459981222
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:20 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-8167e0d1f90so513256a34.0
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017120; x=1791621920; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=An/UbgkWYbaKD3GCEVfOSdOG5LAc/DYP8ZkZMGw3Kts=;
 b=YoTbZi2++h1JKaWcb81+WDH0lVC5QNKTCUoRLn8+Qouge7TZAd3grnVrajkFrPnnQa
 pVXLZbrlLcRPKQr3evnffbdj/92UtL+1AZgUyv0VgBwgYFOaAaXKnSBP/ObVRtmwC/kk
 8MN4N/U7zV7rZ9xiKhdndZ0+iM6029eivvEfFJApTQJuzU9Ru48cyPbewYSr3HFVjTvK
 mixOOq1rMyE90ejNAmo2Wz9X+fKNwU+LhwlDdL1Vagm0fKfSY/u3lPl1Q+zQ+HNpIGFo
 iU8OsWXdjv7dL79KioYBcCqNb1Ls9h8LmruSpFnq7psSzcgdFiXexVipZJ6xPRJSdoe5
 BxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017120; x=1791621920;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=An/UbgkWYbaKD3GCEVfOSdOG5LAc/DYP8ZkZMGw3Kts=;
 b=atvHFDfFsNk2TDaE0ZlIqtjv79HUINfAKl9Y7rmkCCc7hxvNq5Y0HrS+Ufh1U51myI
 9w2I0yHcGi6YNs27lNeqAikPiD4c8PYzk2j5Q7iwObwzOdk0MdkjBcq++q2T2VcdxUo0
 DPZu1t1uE+G1xqFUExvr0mQRdbIiZmRuYGho6dYHTJES5yMzyqcxUzcs7tXqjrwTDlK3
 GnucAN7LAD+Bgv6JF7pSfwCZO4OY+qiEqr3+5ymwQgfQASvMWu0W1RcQqQs3zdOVGLgi
 n/IKtiFAvAlr4GKCU5cMIvTTzIByVXc1oXvIGTbBVINRTwtQS0TDLhotB+fGww5Orf0x
 8jiA==
X-Gm-Message-State: AFuF++lf3jZ/NKGvyRjlwu/54ajI77F5/NOMdMMYN8/teN88EI2R7h6R
 m60l63gktI1MlRKSSVyQkR+kWfyVg8w+zDJDlbxqCnqIgeCuZYPbsdly9OfdHA==
X-Gm-Gg: AYBFou12t2Qmz48x08JTv+fFryP+OhN2KK6lBeDRC3JAUGSu8adlE9MIlejn9IxSRqK
 jqS+08TpcFpv0CKE19G3erirfXDgkCcmgjkoU+QkYifJXlpu5zV45lPYH1M8l23GR59uuPGZS4N
 zKss9JMK7mMOI9cZKEdCILpeDWlr2dSch+km4LQ+e0bZl5KdvJw8R4iiecyLcUvSPFQy6TE6PUY
 9epUGNSH2g/uDedR745kvLrXM04FfO6VahPMxDc0u5Wj6q845mR2TMGFxtvViZ4mvzWStlPjKem
 uIl+K+wdgplIQs9bqcLaRvK9ZCOGNiw2S3UoeVZEW848TbmUtD43iB4c6gC4tzKT92NNgLI31aM
 8OK3Vp4WOWDiFhhMe6wIyKoKzTT1UcKyfQsAGQR7LmVJm0gBfIr4k5q3M7PG7krAyUhgoJHy22p
 x/z0PgILpJF9IRR9IDacdE77/LA4v60lWZlFbE7WsOljV+ct9vImn7lM0+37a3A0dzkvoO/K29w
 bNtq9kHBWY4GJ43Pxv8s/bXQ3PeMacFt9INzSc7wsgHhGINR4EvqH91YF+CWMuzCoGOPLdrXnBm
 6pIo73hdqumHyBu5GQo4ALf+PISNkxRjI/T187PtjKuOgm/CHd9syN3DmD3+d82Q0lIEbRwzWKR
 3E7hCAYmhPzR4jQ/6JHxOORfyq70RCyzqcf2iCRoTjw==
X-Received: by 2002:a05:6830:7202:b0:822:a29c:a0e2 with SMTP id
 46e09a7af769-822a29ca30fmr5095224a34.11.1791017119871; 
 Sat, 03 Oct 2026 01:45:19 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:43:58 -0600
Message-ID: <20261003084453.545653-13-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-ipython: bump to version
 9.17.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update license hash due to whitespace cleanup:
https://github.com/ipython/ipython/commit/97d75a9a25acabdd463e279fcc0d32fd8711e311

Add the python-psutil runtime dependency.

Drop the no longer required python-decorator runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ipython/Config.in           | 2 +-
 package/python-ipython/python-ipython.hash | 6 +++---
 package/python-ipython/python-ipython.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-ipython/Config.in b/package/python-ipython/Config.in
index 32c1f9a64e..02623e844e 100644
--- a/package/python-ipython/Config.in
+++ b/package/python-ipython/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_PYTHON_IPYTHON
 	bool "python-ipython"
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
-	select BR2_PACKAGE_PYTHON_DECORATOR # runtime
 	select BR2_PACKAGE_PYTHON_IPYTHON_PYGMENTS_LEXERS # runtime
 	select BR2_PACKAGE_PYTHON_JEDI # runtime
 	select BR2_PACKAGE_PYTHON_MATPLOTLIB_INLINE # runtime
 	select BR2_PACKAGE_PYTHON_PEXPECT # runtime
 	select BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT # runtime
+	select BR2_PACKAGE_PYTHON_PSUTIL # runtime
 	select BR2_PACKAGE_PYTHON_PYGMENTS  # runtime
 	select BR2_PACKAGE_PYTHON_STACK_DATA # runtime
 	select BR2_PACKAGE_PYTHON_TRAITLETS  # runtime
diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index 022975d976..69db31319f 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5  777fdd0c2ec7b2fd1062071056cda377  ipython-9.8.0.tar.gz
-sha256  8e4ce129a627eb9dd221c41b1d2cdaed4ef7c9da8c17c63f6f578fe231141f83  ipython-9.8.0.tar.gz
+md5  4f33ddba6d57ba2a760d2f3436ff3006  ipython-9.17.1.tar.gz
+sha256  8919be8c27f20a6f4423145028063f6637b42a03ce57665bb12015ee1f073529  ipython-9.17.1.tar.gz
 # Locally computed sha256 checksums
-sha256  341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17  COPYING.rst
+sha256  8387aac32433e5b121c355aa9e6ce2b9a399da7edd59ab94b19d4f5326b1ced0  COPYING.rst
 sha256  e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index 8af5b3c312..1c8682cf36 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 9.8.0
+PYTHON_IPYTHON_VERSION = 9.17.1
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/12/51/a703c030f4928646d390b4971af4938a1b10c9dfce694f0d99a0bb073cb2
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/b9/32/99451b1283ec5d92ad77073f12e1c667dc10775384d8f15c2914207149dd
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
