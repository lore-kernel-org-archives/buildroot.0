Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2BDC36018
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 20:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D53916122A;
	Wed,  2 Apr 2025 20:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CpaNjs7loa-Z; Wed,  2 Apr 2025 20:32:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E436060A9C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E436060A9C;
	Wed,  2 Apr 2025 20:32:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D40A4117
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 20:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B96FD8208B
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 20:32:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mISdotzsiqW4 for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 20:32:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 67E158201F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67E158201F
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67E158201F
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 20:32:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 5FEAF44186;
 Wed,  2 Apr 2025 20:32:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed,  2 Apr 2025 22:32:17 +0200
Message-ID: <20250402203218.1969523-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeeiieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheffueejudefiefhteegtdeihffgteeivefgieeiffefieegfeekheeklefhnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgpdhphihthhhonhdrohhrghenucfkphepvdgrtddumegtsgduleemkeelgegsmeehhedttdemvddutggvmegsvgehieemrggsfedvmegtrggrvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekleegsgemheehtddtmedvudgtvgemsggvheeimegrsgefvdemtggrrggvpdhhvghlohepfihinhgushhurhhfrdhhohhmvgdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhis
 egsohhothhlihhnrdgtohhmpdhrtghpthhtohepjhgrmhgvshdrhhhilhhlihgrrhguudesghhmrghilhdrtghomhdprhgtphhtthhopeihvghgohhrshhlihhsthhssehgohhoghhlvghmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1743625940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=VnlQHjvrmXAo5a9WJqOPenCoIRIRWUt4hMpOt6AN+ds=;
 b=ZgCR8hbibvErA7+94jBei6MGfTMsSc3heEcxLMyqeP4ZAhDPMX2ZqVXtNgW+Q8YdAhzA6k
 KJT96bDuxVSJ2kXCuwkwAchlwZ2/DDn06LoVlozKAFVPKRPbEw7H7Uar9EhkHPKDyp2tFS
 yM7dndBRkpfUOV4lcK2HNFbfsglmClteyKlPRN15EAeXrqjBjOVqO/yQu95BiYay5ezWDM
 a6pCQA3+iAI16sWwqOwEdAY3iPff/A4vpTWYzT7xt8iAdP5tfhX2jIKzwrT9i5+r0yC/33
 hG1cI4JOoGi3ebvU7eA/MOhy0DemGNCS9Dlz+hbi4U4+2xJxtqPS3K0dKOY0yw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZgCR8hbi
Subject: [Buildroot] [PATCH] package/python3: backport upstream patch to fix
 pyatomic.h headers
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the bump of Python to 3.13.2, cracklib fails to build when
Python support is enabled, due to an issue in the Python headers. This
issue has been fixed upstream in the 3.13.x branch, and this commit
simply backports the upstream fix.

Fixes:

  https://autobuild.buildroot.org/results/26f6fe75f75c65bb9d58bbdbec733ebfe9b8565c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ix-pyatomic.h-include-paths-GH-12932.patch | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 package/python3/0010-3.13-gh-129296-Fix-pyatomic.h-include-paths-GH-12932.patch

diff --git a/package/python3/0010-3.13-gh-129296-Fix-pyatomic.h-include-paths-GH-12932.patch b/package/python3/0010-3.13-gh-129296-Fix-pyatomic.h-include-paths-GH-12932.patch
new file mode 100644
index 0000000000..00451af9bf
--- /dev/null
+++ b/package/python3/0010-3.13-gh-129296-Fix-pyatomic.h-include-paths-GH-12932.patch
@@ -0,0 +1,63 @@
+From 0ee012224447b6ec7f6f20d316b24449fdcc0d4b Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Fri, 28 Feb 2025 09:22:15 +0100
+Subject: [PATCH] [3.13] gh-129296: Fix `pyatomic.h` include paths (GH-129320)
+ (#130667)
+
+gh-129296: Fix `pyatomic.h` include paths (GH-129320)
+
+Use relative includes in Include/cpython/pyatomic.h for
+pyatomic_gcc.h, pyatomic_std.h and pyatomic_msc.h.
+
+Do a similar change in Include/cpython/pythread.h for
+pthread_stubs.h include.
+(cherry picked from commit 3a974e39d54902699f360bc4db2fd351a6baf3ef)
+
+Co-authored-by: Zanie Blue <contact@zanie.dev>
+Upstream: 125ca028664ce72556e3983b57f521a118c4e677
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ Include/cpython/pyatomic.h | 6 +++---
+ Include/cpython/pythread.h | 2 +-
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Include/cpython/pyatomic.h b/Include/cpython/pyatomic.h
+index 4ecef4f56ed..28029859d3d 100644
+--- a/Include/cpython/pyatomic.h
++++ b/Include/cpython/pyatomic.h
+@@ -529,15 +529,15 @@ static inline void _Py_atomic_fence_release(void);
+ 
+ #if _Py_USE_GCC_BUILTIN_ATOMICS
+ #  define Py_ATOMIC_GCC_H
+-#  include "cpython/pyatomic_gcc.h"
++#  include "pyatomic_gcc.h"
+ #  undef Py_ATOMIC_GCC_H
+ #elif __STDC_VERSION__ >= 201112L && !defined(__STDC_NO_ATOMICS__)
+ #  define Py_ATOMIC_STD_H
+-#  include "cpython/pyatomic_std.h"
++#  include "pyatomic_std.h"
+ #  undef Py_ATOMIC_STD_H
+ #elif defined(_MSC_VER)
+ #  define Py_ATOMIC_MSC_H
+-#  include "cpython/pyatomic_msc.h"
++#  include "pyatomic_msc.h"
+ #  undef Py_ATOMIC_MSC_H
+ #else
+ #  error "no available pyatomic implementation for this platform/compiler"
+diff --git a/Include/cpython/pythread.h b/Include/cpython/pythread.h
+index 03f710a9f7e..e658b35bd90 100644
+--- a/Include/cpython/pythread.h
++++ b/Include/cpython/pythread.h
+@@ -22,7 +22,7 @@ PyAPI_DATA(const long long) PY_TIMEOUT_MAX;
+     */
+ #   define NATIVE_TSS_KEY_T     unsigned long
+ #elif defined(HAVE_PTHREAD_STUBS)
+-#   include "cpython/pthread_stubs.h"
++#   include "pthread_stubs.h"
+ #   define NATIVE_TSS_KEY_T     pthread_key_t
+ #else
+ #   error "Require native threads. See https://bugs.python.org/issue31370"
+-- 
+2.48.1
+
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
