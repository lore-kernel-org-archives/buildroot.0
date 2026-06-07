Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B594CD8C8E
	for <buildroot@archiver.kernel.org>; Sun,  7 Jun 2026 13:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1C2860C0E;
	Sun,  7 Jun 2026 13:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b575b0iaSJ0a; Sun,  7 Jun 2026 13:02:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEC4661B53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780837353;
	bh=HIfXx4mww9vue9FpNDKr2GFf3JrVNmf8qI+76WVuRQU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QKwLP38RA6oMRPu9Vh1DyHpvy9Xd6CLBWo8UCYk4l1mZkN37STWf8cmtsrywdvO1n
	 YFc8pyCAjaQ1BhjcxrwjwbK6kDSBWSP//9VVuSK/ES2XXIvh/xIw2ftwZxkuc9puj2
	 4hPNKuoQONyrrhQawJQb8TEEbEBIn5PpsflNsnPWk9T1pDNqVnGtEUfQsEJY5ifNGd
	 1P1UMsvWC87m8jhjSbIkwXIo8UqXN3f1c8orPa8/9kDsKuq63KjUA5v/WfVDwGAsOB
	 ipVxibjsAgtm6HHs2gsuVKKb28vQKNL0GTliGSo0l9bfzPlG79Jn252aNAoN8ES8PQ
	 41XyHDp6t4MnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEC4661B53;
	Sun,  7 Jun 2026 13:02:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C416345
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 13:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DC7884B91
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 13:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UjBBhSknos-C for <buildroot@buildroot.org>;
 Sun,  7 Jun 2026 13:02:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=jeanmichel.hautbois@yoseli.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4978A84B8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4978A84B8A
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4978A84B8A
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 13:02:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 358863ECD7;
 Sun,  7 Jun 2026 13:02:28 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Sun,  7 Jun 2026 15:02:16 +0200
Message-Id: <20260607130219.1350128-6-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTF6ZuMkpEt+Alv83M7SSgieYFOUd0bcSr+5BSYrpGi2zjRvGX7AG3gWEt4kA9GLoIQohjRMdIZrK5kIRe2Fq9BFWs2+vt/Hsl3qhiwoGlmrH1WhyKdBTu/tCo2Xk5HFlbhoKCJlY5TqQd10v6lk5/7a+aAyxh0+AWG8yhXSQXxA7kwg5f1fsBdy54QEUzX5Wwow43SbqFbDlXehp91TjqJe6uvaPq+reh0eE+GP4YYBAMByZVVxKNtQne8A3H3XfRwt/Om5SGG2rvEdPMg6aG7pxPnNMS/JJvGm2HxfVtJMk34w9z4/rjGplfP5z+KhZQm4rG4TZ/IoFWF4mVtgOnHdlifk0MEfe3FPMpyE+1ZQXQY7fYZd3y7MvMIJ4uQLTN2Bw7w+ow471PHjYtl9X8FNf+bKCo0W7MqMFbr4yz9i8OgH+4BOxjoWSyEfN3rt9Zlvu3mqc2289vP+Gh+2AvLjceULCr1WCKInlbn7AHuT38k6s4kGas+kpVSjCY8J06yfGQDGcDE5QdcMt2wpiktOvKzxaF4nmli+zcAhyXkKzG5bT7oGeYo/wU8OuDMg6ILdVQ7Cz8KayOiFDmf4g5DqcJn6MHVLmr2vSCwvqGcXfMP092Fr9YDr3afK2Vv/JxkHdflBdenDgxk5XOaocUop5hnCkARk460uUEU2o5JwkA
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1780837348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0MHfyXoSAB2k6p06Cmio27SAFjZRH0S6ZYtCNFPE5ik=;
 b=D9bYP7ED8TkBkV43JZl13mymk1Pdi9frOC1QcFWRA7Eh0YEZfgIXDaIpBAbfVmRjqPvqJX
 I00eF6Ct1qJ/7eHJNmd6PYz0BC+xuQU4cjjIp0D8jlKcRTC9kY4IWeGBDvxZZeItXNlK69
 rm13iT8GPYPywceAqzKRCH4qfbJQeF8Uhz9I1AR/yW4lilvnvS3pi0YHfQ8Ic33QHVFyI0
 1Xk3R7AP1x/GEt4bKo4uK+nlOsiZEWCnm7kKj+yimJNazBtpnvzt82o7YZya1satRz27uS
 F0O/i5jw/dry4fuashIZdy7kP+oe5EQmJsTR5X/hOi+bwkqowJQrH/1t+yxCSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=D9bYP7ED
Subject: [Buildroot] [PATCH v2 5/8] package/gmp: disable C++ bindings on
 m68k ColdFire
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ColdFire has no hardware atomic instructions, so the compiler lowers
atomic operations (such as the libstdc++ reference-count helpers) to
out-of-line __sync_* calls. Those helpers are provided by libgcc, but
only with hidden ELF visibility. libstdc++ is built referencing them
and ends up with undefined, default-visibility __sync_*_4 dynamic
symbols. Building gmp's C++ bindings (libgmpxx.so) against libstdc++
then fails to link, because the only definition is hidden in libgcc
and cannot satisfy the cross-DSO reference.

Disable the C++ bindings on m68k ColdFire. The C library (libgmp.so)
is unaffected. The same underlying limitation is handled for gdb in a
separate patch.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
Changes since v1:
 - Reword the commit message and add an explanatory comment;
   approach unchanged since v1.

 package/gmp/gmp.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 07aa4aefdf..9f85073556 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -31,7 +31,12 @@ ifeq ($(BR2_riscv):$(BR2_RISCV_ISA_RVM),y:)
 GMP_CONF_OPTS += --disable-assembly
 endif
 
-ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+# On m68k ColdFire (no hardware atomics), libstdc++ references the
+# libgcc __sync_* helpers, which are hidden, so building the C++
+# bindings (libgmpxx) fails to link. Disable them; see also gdb.
+ifeq ($(BR2_m68k_cf),y)
+GMP_CONF_OPTS += --disable-cxx
+else ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 GMP_CONF_OPTS += --enable-cxx
 else
 GMP_CONF_OPTS += --disable-cxx
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
