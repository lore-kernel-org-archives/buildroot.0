Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91A6C982FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 10:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C4EF80C8F;
	Tue, 22 Sep 2026 10:53:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A9QNPjxN0s5R; Tue, 22 Sep 2026 10:53:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5EDA080BEA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790074418;
	b=JyKhKXi9v4si832iQSMryG/B6qPfuNrjdMOb+pUJSyvylrPpF+/2Ubbelg03qt1z7/NB
	 ud7SC0llyLzDoflnUQax4GETaHwAxhEPGKDGase7CIzLrGcvFGyqqdBU2iFchdT4MyDQ5
	 Aw1dNvtfeJVSM8d70mF6r82E7nOXS4srUAb9nIOmL28x/+lf4wGnUmeu3YflpxFGjJHgO
	 orUvjBsDsyhAi0FulqqEizM+pJ3nw7h1ekOmzoVxGsjmLwztPgMvQV2588Z3jVfMAqpyq
	 3SiX8osLv7db5HW74ZK4JYxbt6ydXA6W5jRXEHjfZWj24g1UpaXfEbXqnBKO98Xan+w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790074418;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5kxIpnP9fN/5B6pf6XjRgkFVJTByeI71T3TkdXdDsLY=;
	b=VIyWtuN7sECU3QRqdKBlzBZz37GLeb9tpV5mh3YP6vPx63fpp/Qs3MzcUWW62rjUbUs/
	 so1Znt+QIGNrW4I9xjn4tlIPUba/EiysbZvfq1gXhEh2lzbJqtsz6QEvQcpFLTt9l73hX
	 VChX48n0and+9S1B7fAR2tHKvuEOQCFl+gZZtgC6GwUhsN4W43su9XmjWDFjehnAtVp+I
	 NwV/p/nEZ1ztngSv1BwjHUY6ITogDLlSX6lg3OnIOjf6jqd49Kw/0D81NHOBkPUYJeH1A
	 rrUMj3Hb2YzosDOpELIxPix+KFfdbfx1mIFs5HLm6XccNUyhjBsrK+LmD4Z6RXQzRyw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790074418;
	bh=5kxIpnP9fN/5B6pf6XjRgkFVJTByeI71T3TkdXdDsLY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GP1BsjcGbH1e1ZcquJtZdklFd9OI1bwLAEEAmtNlHCM0LeSLJ7Eh3VA+DWLjpwViM
	 MabShAXZ1ikyIa1As7Z2iBxq3qyrH++M3mvSpzgp5pmGn6FOKxp1G1WXawJHZteNRg
	 7+9zM+6l+H9FrwoEcTid7h2XwKtzgZPd5dIw5NicoOtvmRBTxMse4uU1E/+dDOFLnW
	 jxcnSHKrO51DYpfo9kqDZ7QtZxTOWB9fHRoSAVUagFv/xyXr0he5seUu8ty1/1IBN4
	 EQtqL9pxc3ZsHIb9naY76qGBdMxH6DCYGn89Y923E2kMuabULszd1rr6F6QB+F3VwZ
	 6ZoNzJkxasXrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EDA080BEA;
	Tue, 22 Sep 2026 10:53:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EE8813B
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24749400F9
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:53:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GXfOYfyb23BK for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 10:53:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4611940099
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790074415;
 b=InKY0iQtQzB8yI8js6C1YgnKXqAB0dw3ZsZoxHGCPH3FOE8XnaE1QEYlK6qTJ58Tff2t
 +djZmXQqDkLzjQyIG4a+w2M2UAThan5I25fXVZ7CUTOvN4OsIf+tF3vtpZvTrLaOUjcBx
 v6MG2NuZALZnbQZFVK/8Mu0N2HkTkf51+k4RAaoWlkiQfB/kXLgyyWe4FwTzG1wqWVP7o
 q0k2Pw7CNsTdczQbDA10htFPreVm2rpa13t6P5pkBW5aoDtDO+JNa98rAfPlr7iL7OJJH
 vSQaF/md0VwOA/yT9G3TVH1bGoekdZe83pSe5D2y69+OzlO1YfarW/mnyyMrs5Ubj9A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790074415;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=qzrrXLxB53KyKm5d21vUBLpz8k2D2YZ9sbWnfZKScc8=;
 b=sXMaijlEmLD0ZgzjDFnsRj01V01xVUHMUo3gDWu/aKuKBonpwLbKfe38OaatxGtlgbIE
 vXvzTyeeoJeXrTj82aPk06Atk3SQ2ZhtFQf2zaaLRRbiXLscI06idBWXE1idEs1ZxFm2Q
 E09YqNH+I7VTgFk8ZBop17RXUe34ThP0ZOCdbnNh8rDSLNQPKtIk1P+QUUW7fktWGPNBF
 boU7Jn8ePsbzOZGb0ToHs4tir1b25jfFfSAtTc8ww/KtVP/0ohXVkOP3zDjJRyTw5Ay4o
 Vi2qHSNy8CDeCCfddl9rwUoYYewyzof5LiewI57kXlvoUq3FNGbbrLhhl1Pk1rd4a+g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=cu8oKiNz; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:34::f;
 helo=mail-ej2-x0f.google.com; envelope-from=yegorslists@googlemail.com;
 receiver=<UNKNOWN> 
Received: from mail-ej2-x0f.google.com (mail-ej2-x0f.google.com
 [IPv6:2a00:1450:4864:34::f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4611940099
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:53:34 +0000 (UTC)
Received: by mail-ej2-x0f.google.com with SMTP id
 a640c23a62f3a-c254f9f7db0so482655266b.3
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 03:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790074413; x=1790679213;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qzrrXLxB53KyKm5d21vUBLpz8k2D2YZ9sbWnfZKScc8=;
 b=vSnYhLofHek1gPydO0+NO/RYdTVkzReYP1sHLrRATDUw8uaK5ipWVZgFgn/WXdqi3j
 KJbToj4X9eeu13rz6QXOTr3Z7B/pwC81mr6bYRsYuFynpJVWVt17X/7SHY3ZeZq3vX01
 P6MaaeHaQuAMH1tQscfD4RBu4qOuYDaYnRHTdjWmuGKjFLYHJhZRptDlsgiftnsnyl5K
 r02Wv6//ImOf6FFGHhu1LLABQqNp9Da6ZxppuS3IwTSlRdiOFHXJyyBBzJwl2e8a4nW3
 2MzzIuMr+cWzw1T4QqF6iE+Q1KAWd/mdDHeVLuLqvSsIAas36tro/gmltAimaTHrcyvn
 RTBw==
X-Gm-Message-State: AFuF++lknUYw3OISRs5e9HhUHyYJBFF7bIbRL7jEsgF4jJ2MgcnHqznS
 8bgwMwwug/+WUldVpSpKike6UAjY/I3J/+nafJMWvT6Yq7MjLuhNx0JTSNpJSQ==
X-Gm-Gg: AYBFou0Wc9U7ygaZu55oI8i15YcN6NY40QEIiB0pAPpYSoVdTuOHB6FNFCDxGxbGDKV
 4u4XgsJPyWiIhsutpkkZHNoxrNna+5qQf7+qdeOWkHqT77G0gvFd0ZNf9VGtVeLJEVLoc4/CO2t
 zE2gV0Px+geWe4WoXhdvfhZ9Ct8fklGXbjHJRzrN+u/ElEENnwRYYIpZ//4CklTGVcPlXhY0GPD
 4MVVzL9Q+AHoFKxUenIHi2dYqhJjElosYRxtIxb9E/jZAWAz/pHAE4ImcsyHAoZ1I67DXktQElG
 i71d/yMqjO3pQMVITGW9jGH7a0IO/m4J5Gj9abJ+RyoVcilblsJDa7YyDgppKFKdHSP/igxVFOX
 etWIxnY6DGQK9Bgk+EQeRNBWmebT+hsHUe9uig0s3JfsQ28l6d3YQN4P7XhcXCgX53iKGOULhyC
 WWFOiDNFAzC3w8iABpQZmBBq9blNn7BSzITmvQnpLFa9W0nUurx8nCC/zdTDZHeTBIB1tdNbyMq
 ZKhhWqtRkgOdKO9Uxq13YGA/NwwGlsh/wvaBgReGayxCSjPVj+ocdIbOg==
X-Received: by 2002:a17:907:7243:b0:c29:4634:5c99 with SMTP id
 a640c23a62f3a-c2a1569a521mr1131215166b.4.1790074412538; 
 Tue, 22 Sep 2026 03:53:32 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2a9c43078bsm65238566b.4.2026.09.22.03.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2026 03:53:31 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Sep 2026 12:53:23 +0200
Message-Id: <20260922105323.2939955-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/valgrind: fix build with a libgcc built
 without optimization
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

The 64 bit division helpers of libgcc (__divdi3 and friends) are
compiled with -fexceptions -fnon-call-exceptions. Buildroot passes
TARGET_CFLAGS to gcc through CFLAGS_FOR_TARGET, so with BR2_OPTIMIZE_0
libgcc itself is built with -O0, and the resulting objects keep
references to _Unwind_Resume() and __gcc_personality_v0(), which are
normally provided by libgcc_eh.a. Valgrind links its tools with
-nodefaultlibs, so that library is not available and the link fails:

  ld: libgcc.a(_divdi3.o): in function `__divdi3':
  libgcc2.c:1226: undefined reference to `_Unwind_Resume'
  ld: libgcc.a(_divdi3.o):(.data.rel.local.DW.ref.__gcc_personality_v0[DW.ref.__gcc_personality_v0]+0x0):
      undefined reference to `__gcc_personality_v0'
  collect2: error: ld returned 1 exit status
  make[4]: *** [Makefile:1180: memcheck-x86-linux] Error 1

Add a patch providing dummy definitions of both symbols in
libgcc-sup-<platform>.a, which is linked after -lgcc, so toolchains
providing the real symbols are unaffected. They can never be reached,
as Valgrind's core is plain C and never raises an exception.

Fixes:
  http://autobuild.buildroot.net/results/4a58c34308095e4d8ae91e0a779c94123ee497f6/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Assisted-by: Claude:claude-opus-5
---
 ...-provide-dummy-unwinder-entry-points.patch | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 package/valgrind/0003-coregrind-provide-dummy-unwinder-entry-points.patch

diff --git a/package/valgrind/0003-coregrind-provide-dummy-unwinder-entry-points.patch b/package/valgrind/0003-coregrind-provide-dummy-unwinder-entry-points.patch
new file mode 100644
index 0000000000..72390ca822
--- /dev/null
+++ b/package/valgrind/0003-coregrind-provide-dummy-unwinder-entry-points.patch
@@ -0,0 +1,80 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Sun, 21 Sep 2026 12:00:00 +0200
+Subject: [PATCH] coregrind: provide dummy unwinder entry points
+
+The 64 bit division helpers of libgcc (__divdi3 and friends) are
+compiled with -fexceptions -fnon-call-exceptions. When libgcc itself is
+built without optimisation, the resulting objects keep references to
+_Unwind_Resume() and __gcc_personality_v0(), which are normally provided
+by libgcc_eh.a. As tools are linked with -nodefaultlibs, that library is
+not available and linking a tool fails with:
+
+  ld: libgcc.a(_divdi3.o): in function `__divdi3':
+  libgcc2.c:1226: undefined reference to `_Unwind_Resume'
+  ld: libgcc.a(_divdi3.o):(.data.rel.local.DW.ref.__gcc_personality_v0[DW.ref.__gcc_personality_v0]+0x0):
+      undefined reference to `__gcc_personality_v0'
+  ld: libgcc.a(_moddi3.o): in function `__moddi3':
+  libgcc2.c:1249: undefined reference to `_Unwind_Resume'
+  ld: libgcc.a(_umoddi3.o): in function `__udivmoddi4':
+  libgcc2.c:1204: undefined reference to `_Unwind_Resume'
+  collect2: error: ld returned 1 exit status
+
+So provide dummy definitions. They can never be reached, since the core
+is plain C and never raises an exception. They live in
+libgcc-sup-<platform>.a, which is linked after -lgcc, so toolchains that
+do provide the real symbols keep using those.
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+Upstream: https://bugs.kde.org/show_bug.cgi?id=526075
+---
+ coregrind/m_libgcc_sup.c | 33 +++++++++++++++++++++++++++++++++
+ 1 file changed, 33 insertions(+)
+
+diff --git a/coregrind/m_libgcc_sup.c b/coregrind/m_libgcc_sup.c
+index 111111111..222222222 100644
+--- a/coregrind/m_libgcc_sup.c
++++ b/coregrind/m_libgcc_sup.c
+@@ -60,6 +60,39 @@ unsigned long int __getauxval (unsigned long int type)
+ }
+ #endif
+ 
++/*====================================================================*/
++/*=== Dummy unwinder entry points needed by libgcc                 ===*/
++/*====================================================================*/
++
++/* The 64 bit division helpers of libgcc (__divdi3 and friends) are
++   compiled with -fexceptions -fnon-call-exceptions.  When libgcc itself
++   is built without optimisation, the resulting objects keep references
++   to _Unwind_Resume() and __gcc_personality_v0(), which are normally
++   provided by libgcc_eh.a.  As tools are linked with -nodefaultlibs,
++   that library is not available and linking a tool fails with e.g.:
++
++     libgcc.a(_divdi3.o): in function `__divdi3':
++     libgcc2.c:1226: undefined reference to `_Unwind_Resume'
++
++   So provide dummy definitions.  They can never be reached, since the
++   core is plain C and never raises an exception.  They live in
++   libgcc-sup-<platform>.a, which is linked after -lgcc, so toolchains
++   that do provide the real symbols keep using those.  */
++
++#if defined(VGO_linux)
++void _Unwind_Resume ( void* exc );
++void _Unwind_Resume ( void* exc )
++{
++   __builtin_trap();
++}
++
++void __gcc_personality_v0 ( void );
++void __gcc_personality_v0 ( void )
++{
++   __builtin_trap();
++}
++#endif
++
+ #if defined(VGO_solaris)
+ /* At least on Solaris 11.3 ar does not like
+    empty .ar files */
+-- 
+2.51.0
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
