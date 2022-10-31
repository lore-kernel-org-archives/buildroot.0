Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D815FA3741
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 14:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E88B405D1;
	Mon, 31 Oct 2022 14:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E88B405D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4IIisarBrKew; Mon, 31 Oct 2022 14:35:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2203640533;
	Mon, 31 Oct 2022 14:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2203640533
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA2F71BF3D7
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 14:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3BB260F2C
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 14:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3BB260F2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YPDTjLEb3N1k for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 14:35:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BA6360F2E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BA6360F2E
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 14:35:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id A4083B0051B;
 Mon, 31 Oct 2022 15:34:23 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 31 Oct 2022 15:34:23 +0100
Date: Mon, 31 Oct 2022 15:34:23 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221031143423.GE1058960@scaer>
References: <20221030215458.3773991-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221030215458.3773991-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667226865;
 bh=di+OZ59ucW7Bn5dPe1alsPVkhhDgc1RENBBm1C/Jemg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=msWEV6SQ637mDDhsRvA5kOsJ491gg0WZK0DSNcS6G2h3AxdR2xXknNKu+ClzXjHXC
 GSxP4Q76EczkYWjQhcpU5DCqDW9Nj3zvv9+nRWlc6O19cbYj6w/ex+fMQ8Ez1PIjhf
 QCC2LLnxAW8WA7hjYSyd100xzwhfcB/hur/SXIZeMHJc8YFh9YTkfxr7WuYhuDZ9Xg
 r2bAWxZeYBOOB7PF/Hxql7ztehSAD7wYJE+ZVaP8+EzeJour4/yh45Ffk62ZRdtRay
 U6Sd1tsoEJjX7sJpnprql/sCBY7m+KgH8gpwRARJ50jrOa3PU43LImPj2Xwf6/YB7e
 +5J7ioPxs3LRA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=msWEV6SQ
Subject: Re: [Buildroot] [PATCH 1/1] package/gawk: fix double free during
 kernel build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-10-30 15:54 -0600, James Hilliard spake thusly:
> Backport an upstream patch to fix a crash during kernel build.
> 
> Details: https://bugs.gentoo.org/868567
> 
> Fixes:
>   GEN     /home/buildroot/buildroot/output/build/linux-6.0.6/tools/objtool/arch/x86/lib/inat-tables.c
> free(): double free detected in tcache 2
> Aborted
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[--SNIP--]
> +---
> + ChangeLog         | 8 ++++++++
> + interpret.h       | 1 +
> + test/ChangeLog    | 5 +++++
> + test/Makefile.am  | 4 +++-
> + test/Makefile.in  | 9 ++++++++-

As noticed by Romain, this triggers hidden autoreconf, which obviously
fails most of the time.

I noticed the issue when applying your patch this morning, but a build
here did not trigger the silent autoreconf, and since Makefile.in is
patched after Makefile.am, it seemed all was going to tbe OK.

It did not:

    http://autobuild.buildroot.org/results/068/0686697cb52d22c42ae2249db3442c008082fe72/
    http://autobuild.buildroot.org/results/754/75463639cb9cbc32108f059bd6044810a078db06/

So I dropped all the hunks about Makfile.am and Makefile .in, as they
are only about tests, which we don't care much about, and while at it
I also dropped the hunks about changelogs, which we really don't care
much about either, and pushed that to master.

Regards,
Yann E. MORIN.

> + test/Maketests    | 5 +++++
> + test/elemnew1.awk | 9 +++++++++
> + test/elemnew1.ok  | 0
> + 8 files changed, 39 insertions(+), 2 deletions(-)
> + create mode 100644 test/elemnew1.awk
> + create mode 100644 test/elemnew1.ok
> +
> +diff --git a/ChangeLog b/ChangeLog
> +index 5fb25483..cd9d9fcd 100644
> +--- a/ChangeLog
> ++++ b/ChangeLog
> +@@ -1,3 +1,11 @@
> ++2022-09-14         Arnold D. Robbins     <arnold@skeeve.com>
> ++
> ++	* interpret.h (r_interpret): For the `push' opcodes, upref
> ++	the Node_elem_new. See test case elemnew1. Thanks to
> ++	Emanuel Attila Czirai <corre.a.buscar@gmail.com> for the report,
> ++	and to Jan Alexander Steffens (heftig)" <heftig@archlinux.org>
> ++	for the fix.
> ++	
> + 2022-09-04         Arnold D. Robbins     <arnold@skeeve.com>
> + 
> + 	* 5.2.0: Release tar ball made.
> +diff --git a/interpret.h b/interpret.h
> +index 57d060e6..268655b2 100644
> +--- a/interpret.h
> ++++ b/interpret.h
> +@@ -238,6 +238,7 @@ uninitialized_scalar:
> + 						_("reference to uninitialized argument `%s'") :
> + 						_("reference to uninitialized variable `%s'"),
> + 								save_symbol->vname);
> ++				UPREF(m);
> + 				PUSH(m);
> + 				break;
> + 
> +diff --git a/test/ChangeLog b/test/ChangeLog
> +index a73637bf..ea08edee 100644
> +--- a/test/ChangeLog
> ++++ b/test/ChangeLog
> +@@ -1,3 +1,8 @@
> ++2022-09-14         Arnold D. Robbins     <arnold@skeeve.com>
> ++
> ++	* Makefile.am (EXTRA_DIST): New test: elemnew1.
> ++	* elemnew1.awk, elemnew1.ok: New files.
> ++
> + 2022-09-04         Arnold D. Robbins     <arnold@skeeve.com>
> + 
> + 	* 5.2.0: Release tar ball made.
> +diff --git a/test/Makefile.am b/test/Makefile.am
> +index ab06974c..8a5c3c49 100644
> +--- a/test/Makefile.am
> ++++ b/test/Makefile.am
> +@@ -282,6 +282,8 @@ EXTRA_DIST = \
> + 	dumpvars.ok \
> + 	dynlj.awk \
> + 	dynlj.ok \
> ++	elemnew1.awk \
> ++	elemnew1.ok \
> + 	escapebrace.awk \
> + 	escapebrace.in \
> + 	escapebrace.ok \
> +@@ -1480,7 +1482,7 @@ GAWK_EXT_TESTS = \
> + 	binmode1 charasbytes clos1way clos1way2 clos1way3 clos1way4 \
> + 	clos1way5 clos1way6 colonwarn commas crlf dbugeval dbugeval2 \
> + 	dbugeval3 dbugtypedre1 dbugtypedre2 delsub devfd devfd1 devfd2 \
> +-	dfacheck1 dumpvars errno exit fieldwdth forcenum fpat1 fpat2 \
> ++	dfacheck1 dumpvars elemnew1 errno exit fieldwdth forcenum fpat1 fpat2 \
> + 	fpat3 fpat4 fpat5 fpat6 fpat7 fpat8 fpat9 fpatnull fsfwfs functab1 \
> + 	functab2 functab3 functab6 funlen fwtest fwtest2 fwtest3 fwtest4 \
> + 	fwtest5 fwtest6 fwtest7 fwtest8 genpot gensub gensub2 gensub3 \
> +diff --git a/test/Makefile.in b/test/Makefile.in
> +index 834feb09..a4fb1cc1 100644
> +--- a/test/Makefile.in
> ++++ b/test/Makefile.in
> +@@ -550,6 +550,8 @@ EXTRA_DIST = \
> + 	dumpvars.ok \
> + 	dynlj.awk \
> + 	dynlj.ok \
> ++	elemnew1.awk \
> ++	elemnew1.ok \
> + 	escapebrace.awk \
> + 	escapebrace.in \
> + 	escapebrace.ok \
> +@@ -1748,7 +1750,7 @@ GAWK_EXT_TESTS = \
> + 	binmode1 charasbytes clos1way clos1way2 clos1way3 clos1way4 \
> + 	clos1way5 clos1way6 colonwarn commas crlf dbugeval dbugeval2 \
> + 	dbugeval3 dbugtypedre1 dbugtypedre2 delsub devfd devfd1 devfd2 \
> +-	dfacheck1 dumpvars errno exit fieldwdth forcenum fpat1 fpat2 \
> ++	dfacheck1 dumpvars elemnew1 errno exit fieldwdth forcenum fpat1 fpat2 \
> + 	fpat3 fpat4 fpat5 fpat6 fpat7 fpat8 fpat9 fpatnull fsfwfs functab1 \
> + 	functab2 functab3 functab6 funlen fwtest fwtest2 fwtest3 fwtest4 \
> + 	fwtest5 fwtest6 fwtest7 fwtest8 genpot gensub gensub2 gensub3 \
> +@@ -4476,6 +4478,11 @@ dfacheck1:
> + 	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  < "$(srcdir)"/$@.in >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
> + 	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
> + 
> ++elemnew1:
> ++	@echo $@
> ++	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
> ++	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
> ++
> + exit:
> + 	@echo $@
> + 	@-$(LOCALES) AWK="$(AWKPROG)" "$(srcdir)"/$@.sh  > _$@ 2>&1 || echo EXIT CODE: $$? >>_$@
> +diff --git a/test/Maketests b/test/Maketests
> +index 3a667af8..90828e7f 100644
> +--- a/test/Maketests
> ++++ b/test/Maketests
> +@@ -1432,6 +1432,11 @@ dfacheck1:
> + 	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  < "$(srcdir)"/$@.in >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
> + 	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
> + 
> ++elemnew1:
> ++	@echo $@
> ++	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
> ++	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
> ++
> + exit:
> + 	@echo $@
> + 	@-$(LOCALES) AWK="$(AWKPROG)" "$(srcdir)"/$@.sh  > _$@ 2>&1 || echo EXIT CODE: $$? >>_$@
> +diff --git a/test/elemnew1.awk b/test/elemnew1.awk
> +new file mode 100644
> +index 00000000..58dc9fcd
> +--- /dev/null
> ++++ b/test/elemnew1.awk
> +@@ -0,0 +1,9 @@
> ++function add_flags(old) {
> ++  if (old)
> ++    return 0
> ++  if (!old)
> ++    return 1
> ++}
> ++BEGIN {
> ++  a[0]=add_flags(a[0])
> ++}
> +diff --git a/test/elemnew1.ok b/test/elemnew1.ok
> +new file mode 100644
> +index 00000000..e69de29b
> +-- 
> +2.34.1
> +
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
