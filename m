Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3134C982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 20:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D77B4048A;
	Wed, 16 Sep 2026 20:08:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yZtP62mS1cfG; Wed, 16 Sep 2026 20:08:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A3102404DC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789589293;
	b=Kj53o4wpyKwejZT03JJfb8fravFsEQYLwc+a09qCU67JqBorHWAO/fKWnat7TGocq2wE
	 jaFK3rLgUYqdKq+j3YeGkATbR4qSPnfoNIla/NJkzr9SZTJ7OW9gyynFPTZ7h6rBb+c36
	 M4/eN0SYfQVkvcrrWN4GMn3gTEqJvYOxV47psDQyK/jjllkV/9z3R2Yn/kHnrRSpEBvkY
	 mRL0AD4wPUZKVHsiXWDpP9h+0hyWqpec3hdz/T+04n9xOKIZ1xw/qUW5/nh2EsxgIbo8J
	 U5x/UrvxrMBh/MglEmohlyEBoxpt16sgqwAMiNcbbDzC6BRNBcO9wHXbZamw0kxlK2g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789589293;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+QoIy4Lj6yiSkXhIgrOarj+BCiwa60W7dikCv1oZ+HU=;
	b=lw5R/fFmH3tlFzewaoR017Gzq0QCqyMuUO7NOuwRFQuyRxJ57jwlctFIXyY1i11WGHYE
	 tGBj8IMVdhrJFgX0t9OLrPi7WGYBAPLZw9KT6Np47EV7Q3DRtbXw+sDvAAqYWyfRtoqP+
	 V8tbNzcMHBXRtbA5k8LYAWTbKFLtOa8VmqmCxcK94fcwdV42OZOEgnqS8/mUy/p9crmUx
	 OrFCxKPYtHDnpHk0s86+1SEPKqlqk3+hGZlptDDhsm3b7Ejt1tNrvgJ1aSVSdU5fbaHBk
	 WRxYWeIhdf9PeG2DqJ+MnV+FqA4ohdycLycuCArb2pAL6K74lQoccQ+h6MKn7HzMPfQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789589293;
	bh=+QoIy4Lj6yiSkXhIgrOarj+BCiwa60W7dikCv1oZ+HU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mQFxxW1D6fcM3n9WOZXpBEihwh46mR1z8i7z25jWq6YATUgo+VUskjct30JogXWWu
	 nNZS8luSazMz8W58MFxE2tuWU82UUFQVuaAvYFu2X6NkUNPD/VLaF+vsevYOrY4QE1
	 hnKu/0B+1gq0BJ1PgKKia3d5cifTL4B1p3F3Eds/DvLMmc5xrK7W0HztSXZr+B6Wii
	 gb8hF112NHwaZYZRnYe1opkheQI2JriRycQt6LUj2g0oet5G3yBlZTE/lNgcBU+32S
	 d0qcyxFQy3DKkIigYIzXk4XZ+xwVdEwtDfTbnl7eZ2x+Y/nj8YaAnzMXg5oY2HOGzy
	 o3nMnqIdKCL1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3102404DC;
	Wed, 16 Sep 2026 20:08:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 507DC2EB
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35E9080AD0
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dK1ghHCoFSQr for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 20:08:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6C65D807BE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789589291;
 b=aOTRw4WWjG+f6XmnYMSuwJhh3KvXbRI9TDb29QD1IjNuTx2T9tn+wEiGr5LBB1kTjUA0
 0B+Rot1+/xd68TuexcysVl+vtxW4lAK25/6SBcWKefT6iWJBYtl6mqBAAnR8y7iufAv1P
 gFDrDfo/k8D1j+0qr0eTDeQEyzhgxppheQ5mWpH92Wh1a1d5bECiWh7R1AQ76g9qcip9Z
 vbmLAKBe6zBKeXXTmc2GvTYFHYg/3Bge+XzfEVtmAXUZnhPUUfzQznsfv2f3cIdcfEFBq
 QXPwf+icgMY9n3f1iJmiJneAgQ+Ixk9IP6A9s1IT4co32xMzv8Myoema03dYRL4RFwg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789589291;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=RHWqPp8B8vbpjCC+f+CxTOEyJT3R85Z8J/DMSi3AXnE=;
 b=c75SHI1C5y5D4NPfCHbSXiDsftgLD8g9uHShyL1tLh/iuhP5+UVusYrW2QxXye8kQEIa
 gYzugqlrebprD7q7Rj7XTu+DGZGLKEXI1ydoB+gCwrn3wXPc/kfpHok/WTY8ix82xlUq0
 9ON9/KrIPi44rvujJALnjAN3F5vrLBlrpGBQkT3M22iQd8Eh0x8fBanl0OgVeHLcbkqoF
 8LJ9wuZep5DjW9Sr83u/abKMDA7gFp9u7s6PJXfl+oVz6KkcDyQm7qKyT46XYIctpDCH+
 XcK+z8uWaRydF7jAOi7HMIo8DEA+gtiruEIR4qW7poHXzs/m/GF+K1o2NYNk1i/ePCQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C65D807BE
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:08:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC71196A91; Wed, 16 Sep 2026 20:07:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 21:48:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60dc97fceef21b8cc1271ef7eca61e7bbee28513
X-Git-Newrev: 2e1e3b5e09dfed6909e9de870ffb277862ca5110
X-Patchwork-Hint: ignore
Message-Id: <20260916200704.CC71196A91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libest: fix build with gcc >= 14.x
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2e1e3b5e09dfed6909e9de870ffb277862ca5110
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Renumbered remaining patches.

Fixes:
https://autobuild.buildroot.net/results/149/149aad6f98163faab14232a9d3013c197579cbb4/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-jni-client.c-include-est-est_ossl_util.h.patch | 27 ++++++++++++++++++++++
 ...-remove-duplicate-invocation-of-AM_INIT_.patch} |  0
 ...locl.h-add-missing-extern-on-e_ctx_ssl_e.patch} |  0
 3 files changed, 27 insertions(+)

diff --git a/package/libest/0003-java-jni-client.c-include-est-est_ossl_util.h.patch b/package/libest/0003-java-jni-client.c-include-est-est_ossl_util.h.patch
new file mode 100644
index 0000000000..d027d8012f
--- /dev/null
+++ b/package/libest/0003-java-jni-client.c-include-est-est_ossl_util.h.patch
@@ -0,0 +1,27 @@
+From b49542dea03c4b895a860c393453ab8497dabfce Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 8 Sep 2026 12:52:02 +0200
+Subject: [PATCH] java/jni/client.c: include est/est_ossl_util.h
+
+Upstream: https://github.com/cisco/libest/pull/132#issuecomment-4749526125
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ java/jni/client.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/java/jni/client.c b/java/jni/client.c
+index c5bc28e..2c4663e 100644
+--- a/java/jni/client.c
++++ b/java/jni/client.c
+@@ -12,6 +12,7 @@
+ #include <stdint.h>
+ #include "jest.h"
+ #include <est/est.h>
++#include "est/est_ossl_util.h"
+ #include <openssl/x509v3.h>
+ #include <openssl/bio.h>
+ #include "safe_mem_lib.h"
+-- 
+2.47.3
+
diff --git a/package/libest/0005-configure.ac-remove-duplicate-invocation-of-AM_INIT_.patch b/package/libest/0004-configure.ac-remove-duplicate-invocation-of-AM_INIT_.patch
similarity index 100%
rename from package/libest/0005-configure.ac-remove-duplicate-invocation-of-AM_INIT_.patch
rename to package/libest/0004-configure.ac-remove-duplicate-invocation-of-AM_INIT_.patch
diff --git a/package/libest/0006-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch b/package/libest/0005-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch
similarity index 100%
rename from package/libest/0006-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch
rename to package/libest/0005-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
