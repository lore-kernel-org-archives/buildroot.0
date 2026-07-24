Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF45C53200
	for <buildroot@archiver.kernel.org>; Fri, 24 Jul 2026 14:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A31E40B39;
	Fri, 24 Jul 2026 14:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WWY7vK5nkVFZ; Fri, 24 Jul 2026 14:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06F3B40B3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784902347;
	bh=LuBgT0Ryi0q3NE9IVIb5gx0KBxQcjLjeIVBD4SbI5n0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EW79qzVIF7u/SD5txyXrcnv1hIi155di9CYG+Yw76odmKgQ57fcBx+JssDce87t+c
	 SBBFHFoCLN1sP8tPyhtDxAIevxSlQEasiDmLDJ6NoOow/QwDxe4O0y+2wTt15SYM8F
	 kZQTcupt6iQBQq2o1B7qRBhG9VVBVMZeAl4+gay7gr0GjkEZlquHgxkjNTBlu4ITCh
	 ZcPH0VYelmtDQitTD5aGPCqZ0mMoN8S9SlYkTTuXdR6deKZ9Tsgu9wNUfXBKrkcC6Z
	 KhqwjIEA7NwK2+dfCdawBWH4AannGPc1lG9RO5FOgwXsZXGz+914hsKfr9koM9Za3e
	 oSjYyw9NVXqTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06F3B40B3C;
	Fri, 24 Jul 2026 14:12:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F28D53B0
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3D33811BE
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:12:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZCi7BREf1f7G for <buildroot@buildroot.org>;
 Fri, 24 Jul 2026 14:12:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C03EC811BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C03EC811BD
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:12:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 165548A515; Fri, 24 Jul 2026 14:11:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Jul 2026 15:40:41 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: fbebe4a705d110482738b0e18ed28ca8849f39b4
X-Git-Newrev: 608967e670f2537b82467c5c2df1f15db578b2e8
X-Patchwork-Hint: ignore
Message-Id: <20260724141141.165548A515@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/pahole: fix build
 on modern toolchains
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8313849126484044221=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8313849126484044221==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/608967e670f2537b82467c5c2df1f15db578b2e8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

When building pahole using a modern GCC (e.g. when building
host-pahole), discarded-qualifiers warnings are produced. In builds that
don't set CMAKE_BUILD_TYPE=Release, -Werror gets set and causes a build
failure.

Fix this by backporting the applicable parts of an upstream patch and
fixing a remaining issue that implicitly got refactored away upstream
already.

Signed-off-by: Florian Larysch <fl@n621.de>
(cherry picked from commit 8419f0f0c747abe3acd90b0cffb21c2eb34ee623)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ix-discarded-qualifiers-for-strchr-strstr.patch | 134 +++++++++++++++++++++
 ...ole-preserve-const-ness-of-bsearch-result.patch |  38 ++++++
 2 files changed, 172 insertions(+)

diff --git a/package/pahole/0002-pahole-Fix-discarded-qualifiers-for-strchr-strstr.patch b/package/pahole/0002-pahole-Fix-discarded-qualifiers-for-strchr-strstr.patch
new file mode 100644
index 0000000000..fc0bcc4f7c
--- /dev/null
+++ b/package/pahole/0002-pahole-Fix-discarded-qualifiers-for-strchr-strstr.patch
@@ -0,0 +1,134 @@
+From 5eeb534e02183bcaf2b86f71e0e96efa2d2ce3d0 Mon Sep 17 00:00:00 2001
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
+[Florian: Backport of the applicable bits to v1.27]
+Signed-off-by: Florian Larysch <fl@n621.de>
+---
+ pahole.c | 35 ++++++++++++++++++-----------------
+ 1 file changed, 18 insertions(+), 17 deletions(-)
+
+diff --git a/pahole.c b/pahole.c
+index 954498d..3dcb525 100644
+--- a/pahole.c
++++ b/pahole.c
+@@ -2505,7 +2505,7 @@ static int64_t type_instance__int_value(struct type_instance *instance, const ch
+ 	int byte_offset = 0;
+ 
+ 	if (!member) {
+-		char *sep = strchr(member_name_orig, '.');
++		const char *sep = strchr(member_name_orig, '.');
+ 
+ 		if (!sep)
+ 			return -1;
+@@ -2518,8 +2518,8 @@ static int64_t type_instance__int_value(struct type_instance *instance, const ch
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
+@@ -2532,9 +2532,9 @@ out_free_member_name:
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
+@@ -2972,7 +2972,7 @@ static struct prototype *prototype__new(const char *expression)
+ 
+ 	strcpy(prototype->name, expression);
+ 
+-	const char *name = prototype->name;
++	char *name = prototype->name;
+ 
+ 	prototype->nr_args = 0;
+ 
+@@ -2986,10 +2986,9 @@ static struct prototype *prototype__new(const char *expression)
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
+@@ -3136,7 +3135,7 @@ static int type__find_type_enum(struct type *type, struct cu *cu, const char *ty
+ 		return type__add_type_enum(type, te, cu);
+ 
+ 	// Now look at a 'virtual enum', i.e. the concatenation of multiple enums
+-	char *sep = strchr(type_enum, '+');
++	const char *sep = strchr(type_enum, '+');
+ 
+ 	if (!sep)
+ 		return -1;
+@@ -3148,13 +3147,13 @@ static int type__find_type_enum(struct type *type, struct cu *cu, const char *ty
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
+@@ -3163,10 +3162,12 @@ static int type__find_type_enum(struct type *type, struct cu *cu, const char *ty
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
diff --git a/package/pahole/0003-pahole-preserve-const-ness-of-bsearch-result.patch b/package/pahole/0003-pahole-preserve-const-ness-of-bsearch-result.patch
new file mode 100644
index 0000000000..7a4cddf5d1
--- /dev/null
+++ b/package/pahole/0003-pahole-preserve-const-ness-of-bsearch-result.patch
@@ -0,0 +1,38 @@
+From f510bf5d3f3e3405710311ceb4a3539267218bde Mon Sep 17 00:00:00 2001
+From: Florian Larysch <larysch@fixme.gmbh>
+Date: Tue, 14 Jul 2026 16:03:12 +0200
+Subject: [PATCH] pahole: preserve const-ness of bsearch result
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+pahole/btf_encoder.c: In function ‘btf_encoder__tag_kfunc’:
+pahole/btf_encoder.c:1526:16: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
+ 1526 |         target = bsearch(&key, base, cnt, sizeof(key), btf_func_cmp);
+      |                ^
+
+Upstream: N/A (implicitly fixed as part of a refactor in commit c567717
+("btf_encoder: Refactor btf_encoder__tag_kfuncs()"), released in v1.30)
+Signed-off-by: Florian Larysch <fl@n621.de>
+---
+ btf_encoder.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/btf_encoder.c b/btf_encoder.c
+index c2df2bc..4118028 100644
+--- a/btf_encoder.c
++++ b/btf_encoder.c
+@@ -1516,7 +1516,7 @@ static int btf_encoder__tag_kfunc(struct btf_encoder *encoder, struct gobuffer *
+ {
+ 	struct btf_func key = { .name = kfunc };
+ 	struct btf *btf = encoder->btf;
+-	struct btf_func *target;
++	const struct btf_func *target;
+ 	const void *base;
+ 	unsigned int cnt;
+ 	int err = -1;
+-- 
+2.55.0
+

--===============8313849126484044221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8313849126484044221==--
