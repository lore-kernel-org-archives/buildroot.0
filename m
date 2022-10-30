Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87383C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 21:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EA434010F;
	Sun, 30 Oct 2022 21:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EA434010F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9sJEKUE86kSz; Sun, 30 Oct 2022 21:55:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E44A4014D;
	Sun, 30 Oct 2022 21:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E44A4014D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 979BE1BF315
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71CBA8125F
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71CBA8125F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CHjVyyXh26sm for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 21:55:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B19080F97
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B19080F97
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 21:55:12 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id q142so2481809iod.5
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 14:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=if9dlKI5xY/Y+khEVsfPE1I25c5vwIUeMl8j0U+OH/Y=;
 b=WRuiPurH40kgGFVMDG1/6Hyxu0K5NOv22VMrPUqwkPP+ZoxoEleYRuSsowu7X7uJNv
 0b6JIcpeeFDnwXRGPWMb/W3jmy1CxzU3t/8+aTNfoE8EEJ5juNnNwiwK8h+yOxyb0we9
 umALEMZ3QTrbG3MzvRsVOFHn5pjJAbTOjsva+Uuzar7cBTd/J8KfdqO9vvEn/XXszi7a
 LkTO012JhHoEp0qEKrgQEhQpoke5abAta0SP1cG0mhXW+X1laUUSM84TC+km5Ufl3AT0
 Q1q0769930WGgVY4taIzzCv7AdVatJGTY/OuJpurtOY1SAhGivzFany5kpDl16eBHo8M
 /BAw==
X-Gm-Message-State: ACrzQf2kONK6FIT7hKn+lEtR1J9Bjy5L2fk8OwCSP4HURfr7BRN+yUue
 2F7SuVUz51pxlWfKR9214zZKSdVV8HtiKQ==
X-Google-Smtp-Source: AMsMyM6eZoleafTCBiCUBjKmw7M+bio+p3uD0GI9Hz6MQo0aq6XdhabrZpjaMhkLc+VcaEhDHfH/og==
X-Received: by 2002:a05:6602:2e8d:b0:6bd:543c:6fd7 with SMTP id
 m13-20020a0566022e8d00b006bd543c6fd7mr5221946iow.134.1667166910838; 
 Sun, 30 Oct 2022 14:55:10 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 w10-20020a6bf00a000000b0067b75781af9sm2118528ioc.37.2022.10.30.14.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 14:55:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 15:54:58 -0600
Message-Id: <20221030215458.3773991-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=if9dlKI5xY/Y+khEVsfPE1I25c5vwIUeMl8j0U+OH/Y=;
 b=UULA+hhOZdzUS7LfCMPKSseLrCyci3bPsCiJey6glx8DgkQNWceCVufgwnJikyCijU
 i3t/s7fqoc6908RPGrOKrgCklyg2ouzxoQSt0+F13xxS2sj3q5cIh7FGow36YZOxvF3v
 pztjNyPKAdua8KZqassO9NtveiaT3ORRUkG/FgzUFk79q+6xh+QRYW0Knj1ri2vUACb8
 xBcMQRnBiK/Wkch9zliAo9MlXyhe8IesQivhULsON+s43ooSyW08fs5CDToSIRVIqKw+
 83+XManteomz4VvRZZtGD8PymsKSXjdWwuvH0qXkRaNoL8Utds4WlOgsssCDRztT7aXA
 gt/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UULA+hhO
Subject: [Buildroot] [PATCH 1/1] package/gawk: fix double free during kernel
 build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport an upstream patch to fix a crash during kernel build.

Details: https://bugs.gentoo.org/868567

Fixes:
  GEN     /home/buildroot/buildroot/output/build/linux-6.0.6/tools/objtool/arch/x86/lib/inat-tables.c
free(): double free detected in tcache 2
Aborted

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../0002-Fix-a-bug-with-Node_elem_new.patch   | 155 ++++++++++++++++++
 1 file changed, 155 insertions(+)
 create mode 100644 package/gawk/0002-Fix-a-bug-with-Node_elem_new.patch

diff --git a/package/gawk/0002-Fix-a-bug-with-Node_elem_new.patch b/package/gawk/0002-Fix-a-bug-with-Node_elem_new.patch
new file mode 100644
index 0000000000..502f7dcd95
--- /dev/null
+++ b/package/gawk/0002-Fix-a-bug-with-Node_elem_new.patch
@@ -0,0 +1,155 @@
+From baab183439ff4e0c6b77d62156d447e61fc1dcfb Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Wed, 14 Sep 2022 21:08:59 +0300
+Subject: [PATCH] Fix a bug with Node_elem_new.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+baab183439ff4e0c6b77d62156d447e61fc1dcfb]
+---
+ ChangeLog         | 8 ++++++++
+ interpret.h       | 1 +
+ test/ChangeLog    | 5 +++++
+ test/Makefile.am  | 4 +++-
+ test/Makefile.in  | 9 ++++++++-
+ test/Maketests    | 5 +++++
+ test/elemnew1.awk | 9 +++++++++
+ test/elemnew1.ok  | 0
+ 8 files changed, 39 insertions(+), 2 deletions(-)
+ create mode 100644 test/elemnew1.awk
+ create mode 100644 test/elemnew1.ok
+
+diff --git a/ChangeLog b/ChangeLog
+index 5fb25483..cd9d9fcd 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,11 @@
++2022-09-14         Arnold D. Robbins     <arnold@skeeve.com>
++
++	* interpret.h (r_interpret): For the `push' opcodes, upref
++	the Node_elem_new. See test case elemnew1. Thanks to
++	Emanuel Attila Czirai <corre.a.buscar@gmail.com> for the report,
++	and to Jan Alexander Steffens (heftig)" <heftig@archlinux.org>
++	for the fix.
++	
+ 2022-09-04         Arnold D. Robbins     <arnold@skeeve.com>
+ 
+ 	* 5.2.0: Release tar ball made.
+diff --git a/interpret.h b/interpret.h
+index 57d060e6..268655b2 100644
+--- a/interpret.h
++++ b/interpret.h
+@@ -238,6 +238,7 @@ uninitialized_scalar:
+ 						_("reference to uninitialized argument `%s'") :
+ 						_("reference to uninitialized variable `%s'"),
+ 								save_symbol->vname);
++				UPREF(m);
+ 				PUSH(m);
+ 				break;
+ 
+diff --git a/test/ChangeLog b/test/ChangeLog
+index a73637bf..ea08edee 100644
+--- a/test/ChangeLog
++++ b/test/ChangeLog
+@@ -1,3 +1,8 @@
++2022-09-14         Arnold D. Robbins     <arnold@skeeve.com>
++
++	* Makefile.am (EXTRA_DIST): New test: elemnew1.
++	* elemnew1.awk, elemnew1.ok: New files.
++
+ 2022-09-04         Arnold D. Robbins     <arnold@skeeve.com>
+ 
+ 	* 5.2.0: Release tar ball made.
+diff --git a/test/Makefile.am b/test/Makefile.am
+index ab06974c..8a5c3c49 100644
+--- a/test/Makefile.am
++++ b/test/Makefile.am
+@@ -282,6 +282,8 @@ EXTRA_DIST = \
+ 	dumpvars.ok \
+ 	dynlj.awk \
+ 	dynlj.ok \
++	elemnew1.awk \
++	elemnew1.ok \
+ 	escapebrace.awk \
+ 	escapebrace.in \
+ 	escapebrace.ok \
+@@ -1480,7 +1482,7 @@ GAWK_EXT_TESTS = \
+ 	binmode1 charasbytes clos1way clos1way2 clos1way3 clos1way4 \
+ 	clos1way5 clos1way6 colonwarn commas crlf dbugeval dbugeval2 \
+ 	dbugeval3 dbugtypedre1 dbugtypedre2 delsub devfd devfd1 devfd2 \
+-	dfacheck1 dumpvars errno exit fieldwdth forcenum fpat1 fpat2 \
++	dfacheck1 dumpvars elemnew1 errno exit fieldwdth forcenum fpat1 fpat2 \
+ 	fpat3 fpat4 fpat5 fpat6 fpat7 fpat8 fpat9 fpatnull fsfwfs functab1 \
+ 	functab2 functab3 functab6 funlen fwtest fwtest2 fwtest3 fwtest4 \
+ 	fwtest5 fwtest6 fwtest7 fwtest8 genpot gensub gensub2 gensub3 \
+diff --git a/test/Makefile.in b/test/Makefile.in
+index 834feb09..a4fb1cc1 100644
+--- a/test/Makefile.in
++++ b/test/Makefile.in
+@@ -550,6 +550,8 @@ EXTRA_DIST = \
+ 	dumpvars.ok \
+ 	dynlj.awk \
+ 	dynlj.ok \
++	elemnew1.awk \
++	elemnew1.ok \
+ 	escapebrace.awk \
+ 	escapebrace.in \
+ 	escapebrace.ok \
+@@ -1748,7 +1750,7 @@ GAWK_EXT_TESTS = \
+ 	binmode1 charasbytes clos1way clos1way2 clos1way3 clos1way4 \
+ 	clos1way5 clos1way6 colonwarn commas crlf dbugeval dbugeval2 \
+ 	dbugeval3 dbugtypedre1 dbugtypedre2 delsub devfd devfd1 devfd2 \
+-	dfacheck1 dumpvars errno exit fieldwdth forcenum fpat1 fpat2 \
++	dfacheck1 dumpvars elemnew1 errno exit fieldwdth forcenum fpat1 fpat2 \
+ 	fpat3 fpat4 fpat5 fpat6 fpat7 fpat8 fpat9 fpatnull fsfwfs functab1 \
+ 	functab2 functab3 functab6 funlen fwtest fwtest2 fwtest3 fwtest4 \
+ 	fwtest5 fwtest6 fwtest7 fwtest8 genpot gensub gensub2 gensub3 \
+@@ -4476,6 +4478,11 @@ dfacheck1:
+ 	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  < "$(srcdir)"/$@.in >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
+ 	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
+ 
++elemnew1:
++	@echo $@
++	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
++	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
++
+ exit:
+ 	@echo $@
+ 	@-$(LOCALES) AWK="$(AWKPROG)" "$(srcdir)"/$@.sh  > _$@ 2>&1 || echo EXIT CODE: $$? >>_$@
+diff --git a/test/Maketests b/test/Maketests
+index 3a667af8..90828e7f 100644
+--- a/test/Maketests
++++ b/test/Maketests
+@@ -1432,6 +1432,11 @@ dfacheck1:
+ 	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  < "$(srcdir)"/$@.in >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
+ 	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
+ 
++elemnew1:
++	@echo $@
++	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
++	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
++
+ exit:
+ 	@echo $@
+ 	@-$(LOCALES) AWK="$(AWKPROG)" "$(srcdir)"/$@.sh  > _$@ 2>&1 || echo EXIT CODE: $$? >>_$@
+diff --git a/test/elemnew1.awk b/test/elemnew1.awk
+new file mode 100644
+index 00000000..58dc9fcd
+--- /dev/null
++++ b/test/elemnew1.awk
+@@ -0,0 +1,9 @@
++function add_flags(old) {
++  if (old)
++    return 0
++  if (!old)
++    return 1
++}
++BEGIN {
++  a[0]=add_flags(a[0])
++}
+diff --git a/test/elemnew1.ok b/test/elemnew1.ok
+new file mode 100644
+index 00000000..e69de29b
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
