Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA4BC44501
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 14:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 340CA80E91;
	Tue, 14 Jul 2026 14:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qft4xzaoUFVE; Tue, 14 Jul 2026 14:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3717C80EE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784040403;
	bh=YRiLqCq1vOcDVO3+6xCHSHsTQvrNHXW8M/pwoZXEf+Y=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AMgZpdFtOeekuJ031OpgedXyEfH7e9GkiboqI1ziw+JEHSlcdwIBI5uSlf0d086jD
	 ubwZ9XhtMaX8R5psHbh8wSw5ENzsP+9VDwcvCyrpmqQI4gMFBVWEZfxsC4V6XPaf1+
	 cK/lcuWC1fx0vhMDDqBUnZf0+qnw8OEaS6jeRvNZOG4OD+QzPD1mw7wrQZ9XQ23BMD
	 e8OS1UVneOM72FqQAEWNriB7ILIdPHXvEAI0BhVxgXxEmcxycDqsRGf55rQZTeXhvw
	 n5ajB1v9zhW10z4+zhA5OvJgeFTiA2R3n8wifRmtcxSwSz4mXRf06IJE1XjZ+RH/Nu
	 NBifbtvZnz9Gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3717C80EE9;
	Tue, 14 Jul 2026 14:46:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BA7E270
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 14:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D2B8404C5
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 14:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gk-2M-RFJC3p for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 14:46:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E625C40086
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E625C40086
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E625C40086
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 14:46:39 +0000 (UTC)
Received: from charybdis.office.fixme.cloud (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id A1248E002E4;
 Tue, 14 Jul 2026 16:46:36 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Francis Laniel <flaniel@linux.microsoft.com>, Florian Larysch <fl@n621.de>
Date: Tue, 14 Jul 2026 16:46:34 +0200
Message-ID: <20260714144635.20560-1-fl@n621.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1784040396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=c22ugZ7WNy5164r/zdE9tt8H85JLnuqleV/yTPSGgzg=;
 b=gZGnjiZVu85EYVeFHAlmMo/CPTrqiJwSkkmKNw/81yqwRO6RJUp73xgGh16o9TAXaFuyCv
 0ddgGW/YpnUXByqnCCW/TXcTNVmhb9IxiUkmmfSkaHaFOwR5GCoNbx0wIEKBLXR+Atwrfm
 o4PVT1LOTPna1G7v3E4vu3t/zj2GSn8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=gZGnjiZV
Subject: [Buildroot] [PATCH 1/1] package/pahole: fix build on modern
 toolchains
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building pahole using a modern GCC (e.g. when building
host-pahole), discarded-qualifiers and unused-but-set-variable warnings
are produced. In builds that don't set CMAKE_BUILD_TYPE=Release, -Werror
gets set and causes a build failure.

Fix this by backporting an unreleased upstream patch (for
discarded-qualifiers) and adding another pending one for
unused-but-set-variable (and, arguably, a correctness issue).

Fixes: https://autobuild.buildroot.org/results/ba7/ba79fb9d08b2c6ec573b79fdbb6b4880bf603a57

Signed-off-by: Florian Larysch <fl@n621.de>
---
 ...scarded-qualifiers-for-strchr-strstr.patch | 147 ++++++++++++++++++
 ...-function-parameter-type-match-check.patch |  41 +++++
 2 files changed, 188 insertions(+)
 create mode 100644 package/pahole/0001-pahole-Fix-discarded-qualifiers-for-strchr-strstr.patch
 create mode 100644 package/pahole/0002-pahole-fix-BTF-function-parameter-type-match-check.patch

diff --git a/package/pahole/0001-pahole-Fix-discarded-qualifiers-for-strchr-strstr.patch b/package/pahole/0001-pahole-Fix-discarded-qualifiers-for-strchr-strstr.patch
new file mode 100644
index 0000000000..87a63cfdc9
--- /dev/null
+++ b/package/pahole/0001-pahole-Fix-discarded-qualifiers-for-strchr-strstr.patch
@@ -0,0 +1,147 @@
+From 5f5809cd50cc4d583a2fe3f4d556cb120760e229 Mon Sep 17 00:00:00 2001
+From: Damien Hourtoulle <damien.hourtoulle@gmail.com>
+Date: Wed, 11 Mar 2026 15:09:39 +0100
+Subject: [PATCH] pahole: Fix discarded-qualifiers for strchr/strstr.
+
+Glibc 2.43 added C23 const-preserving overloads :
+https://sourceware.org/glibc/wiki/Release/2.43.
+
+For the function prototype__new, fix local variable declaration to use
+the correct const char* type instead of char*, removing the need to
+discard the const qualifier.
+
+Also fix a pre-existing bug in type__find_type_enum: when iterating
+over a '+'-concatenated list of enum names, after advancing to the next
+segment the new separator was not nullified, causing "second+third" to
+be passed to cu__find_enumeration_by_name instead of "second".  Add a
+null check before writing to sep_mutable to avoid a null dereference
+when no further '+' is present.
+
+Signed-off-by: Damien Hourtoulle <damien.hourtoulle@gmail.com>
+Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
+Link: https://lore.kernel.org/dwarves/20260311140938.81459-2-d.hourtoulle@geoide.fr/
+
+Upstream: https://git.kernel.org/pub/scm/devel/pahole/pahole.git/commit/?id=ba31cfa08ffcfe6ff5757f325de5b03ca157cb78
+Signed-off-by: Florian Larysch <fl@n621.de>
+---
+ btf_encoder.c |  2 +-
+ pahole.c      | 35 ++++++++++++++++++-----------------
+ 2 files changed, 19 insertions(+), 18 deletions(-)
+
+diff --git a/btf_encoder.c b/btf_encoder.c
+index 03bc3c7..4a585f5 100644
+--- a/btf_encoder.c
++++ b/btf_encoder.c
+@@ -1199,7 +1199,7 @@ static bool str_contains_non_fn_suffix(const char *str) {
+ 		".cold",
+ 		".part"
+ 	};
+-	char *suffix = strchr(str, '.');
++	const char *suffix = strchr(str, '.');
+ 	int i;
+ 
+ 	if (!suffix)
+diff --git a/pahole.c b/pahole.c
+index ef01e58..8c827fc 100644
+--- a/pahole.c
++++ b/pahole.c
+@@ -2482,7 +2482,7 @@ static int64_t type_instance__int_value(struct type_instance *instance, const ch
+ 	int byte_offset = 0;
+ 
+ 	if (!member) {
+-		char *sep = strchr(member_name_orig, '.');
++		const char *sep = strchr(member_name_orig, '.');
+ 
+ 		if (!sep)
+ 			return -1;
+@@ -2495,8 +2495,8 @@ static int64_t type_instance__int_value(struct type_instance *instance, const ch
+ 		char *member_name = member_name_alloc;
+ 		struct type *type = instance->type;
+ 
+-		sep = member_name_alloc + (sep - member_name_orig);
+-		*sep = 0;
++		char *sep_mutable = member_name_alloc + (sep - member_name_orig);  // sep mutable for the copy
++		*sep_mutable = 0;
+ 
+ 		while (1) {
+ 			member = type__find_member_by_name(type, member_name);
+@@ -2509,9 +2509,9 @@ out_free_member_name:
+ 			type = tag__type(cu__type(cu, member->tag.type));
+ 			if (type == NULL)
+ 				goto out_free_member_name;
+-			member_name = sep + 1;
+-			sep = strchr(member_name, '.');
+-			if (!sep)
++			member_name = sep_mutable + 1;
++			sep_mutable = strchr(member_name, '.');
++			if (!sep_mutable)
+ 				break;
+ 
+ 		}
+@@ -2949,7 +2949,7 @@ static struct prototype *prototype__new(const char *expression)
+ 
+ 	strcpy(prototype->name, expression);
+ 
+-	const char *name = prototype->name;
++	char *name = prototype->name;
+ 
+ 	prototype->nr_args = 0;
+ 
+@@ -2963,10 +2963,9 @@ static struct prototype *prototype__new(const char *expression)
+ 	if (args_close == NULL)
+ 		goto out_no_closing_parens;
+ 
++	*args_open++ = *args_close = '\0';
+ 	char *args = args_open;
+ 
+-	*args++ = *args_close = '\0';
+-
+ 	while (isspace(*args))
+ 		++args;
+ 
+@@ -3113,7 +3112,7 @@ static int type__find_type_enum(struct type *type, struct cu *cu, const char *ty
+ 		return type__add_type_enum(type, te, cu);
+ 
+ 	// Now look at a 'virtual enum', i.e. the concatenation of multiple enums
+-	char *sep = strchr(type_enum, '+');
++	const char *sep = strchr(type_enum, '+');
+ 
+ 	if (!sep)
+ 		return -1;
+@@ -3125,13 +3124,13 @@ static int type__find_type_enum(struct type *type, struct cu *cu, const char *ty
+ 
+ 	int ret = -1;
+ 
+-	sep = type_enums + (sep - type_enum);
++	char *sep_mutable = type_enums + (sep - type_enum);
++	char *cur = type_enums;
+ 
+-	type_enum = type_enums;
+-	*sep = '\0';
++	*sep_mutable = '\0';
+ 
+ 	while (1) {
+-		te = cu__find_enumeration_by_name(cu, type_enum, NULL);
++		te = cu__find_enumeration_by_name(cu, cur, NULL);
+ 
+ 		if (!te)
+ 			goto out;
+@@ -3140,10 +3139,12 @@ static int type__find_type_enum(struct type *type, struct cu *cu, const char *ty
+ 		if (ret)
+ 			goto out;
+ 
+-		if (sep == NULL)
++		if (sep_mutable == NULL)
+ 			break;
+-		type_enum = sep + 1;
+-		sep = strchr(type_enum, '+');
++		cur = sep_mutable + 1;
++		sep_mutable = strchr(cur, '+');
++		if (sep_mutable)
++			*sep_mutable = '\0';
+ 	}
+ 
+ 	ret = 0;
+-- 
+2.55.0
+
diff --git a/package/pahole/0002-pahole-fix-BTF-function-parameter-type-match-check.patch b/package/pahole/0002-pahole-fix-BTF-function-parameter-type-match-check.patch
new file mode 100644
index 0000000000..0bea2a602f
--- /dev/null
+++ b/package/pahole/0002-pahole-fix-BTF-function-parameter-type-match-check.patch
@@ -0,0 +1,41 @@
+From f282f4e995becc55a8fa380781dc36e0ff0796d2 Mon Sep 17 00:00:00 2001
+From: Florian Larysch <fl@n621.de>
+Date: Tue, 14 Jul 2026 16:07:54 +0200
+Subject: [PATCH] pahole: fix BTF function parameter type match check
+
+The BTF_KIND_FUNC_PROTO arm in types__match() first checks whether two
+function types identified by t1/t2 have matching return types and then
+attempts to iterate over the function parameters (p1/p2) to check them
+for compatibility too.
+
+However, the loop just repeats the check on t1/t2 instead of p1/p2, so
+we just keep re-checking return type compatibility, ignoring possible
+mismatches of the actual parameter types.
+
+Fix this by actually comparing p1 and p2. This also resolves a
+unused-but-set-variable build-time warning.
+
+Upstream: https://lore.kernel.org/dwarves/20260714140858.17507-1-fl@n621.de/
+Signed-off-by: Florian Larysch <fl@n621.de>
+---
+ btf_encoder.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/btf_encoder.c b/btf_encoder.c
+index 4a585f5..4f9790e 100644
+--- a/btf_encoder.c
++++ b/btf_encoder.c
+@@ -1109,8 +1109,8 @@ static bool types__match(struct btf_encoder *encoder,
+ 					  btf2, t2->type))
+ 				return false;
+ 			for (i = 0; i < vlen; i++, p1++, p2++) {
+-				if (!types__match(encoder, btf1, t1->type,
+-						  btf2, t2->type))
++				if (!types__match(encoder, btf1, p1->type,
++						  btf2, p2->type))
+ 					return false;
+ 			}
+ 			return true;
+-- 
+2.55.0
+
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
