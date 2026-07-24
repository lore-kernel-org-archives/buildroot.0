Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C632C53200
	for <buildroot@archiver.kernel.org>; Fri, 24 Jul 2026 14:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F42B60B88;
	Fri, 24 Jul 2026 14:14:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7mzRCLQriWb2; Fri, 24 Jul 2026 14:13:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64CC160B8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784902438;
	bh=55BKptY3E3H3ulrEtV0Yf3gQ0GyF2NAyYYY8hFTzvjA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Zn6waFTjNqNjF/I45iykOaO/6CqDZ8zFE3sMZGDwBRqqGwXMZkHlKcaYs3kJqSDB6
	 U0Yjj7QSzNhWp29F9AHqmbiWGpOIEjN4YwE/jKXlB63QV2J9IfR4+R+j4eiC7Xpayz
	 eN1vBxG9tGeuKhQWJ/TfeLTQOJUHzbfEiJhI4L+/lSn9AtF5AqHY7vLRD+nh+mF7w4
	 ld09lDT+8NQWGhPdGzLGWwR+02Cx/Uz3OVSKrMxY/7u/jCHX/H/+wBzttUnV7kzewi
	 9qZWbYV3wZ7P3DJ/31H3g6VrqwuZV/bLoUudBJt+16AtaE8+rx/EmtmOX59perYa+K
	 X2Qb19iM3P1DQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64CC160B8D;
	Fri, 24 Jul 2026 14:13:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3986F3B0
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FC7E60B7B
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:13:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9KnSZnGdxrLn for <buildroot@buildroot.org>;
 Fri, 24 Jul 2026 14:13:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 185BD60B83
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 185BD60B83
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:13:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70DD68A50C; Fri, 24 Jul 2026 14:13:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Jul 2026 16:01:10 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: b55c4f1a5c6f0afcb5f936d0e60f463305dff365
X-Git-Newrev: c69868315d55bd9ae3933ca5124f9f1fd0e6d4e4
X-Patchwork-Hint: ignore
Message-Id: <20260724141311.70DD68A50C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/pahole: fix build
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
Content-Type: multipart/mixed; boundary="===============2862653405366645098=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2862653405366645098==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c69868315d55bd9ae3933ca5124f9f1fd0e6d4e4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

When building pahole using a modern GCC (e.g. when building
host-pahole), discarded-qualifiers and unused-but-set-variable warnings
are produced. In builds that don't set CMAKE_BUILD_TYPE=Release, -Werror
gets set and causes a build failure.

Fix this by backporting an unreleased upstream patch (for
discarded-qualifiers) and adding another pending one for
unused-but-set-variable (and, arguably, a correctness issue).

Fixes: https://autobuild.buildroot.org/results/ba7/ba79fb9d08b2c6ec573b79fdbb6b4880bf603a57

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8419f0f0c747abe3acd90b0cffb21c2eb34ee623)
[Thomas: backport to v1.28]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ix-discarded-qualifiers-for-strchr-strstr.patch | 134 +++++++++++++++++++++
 ...x-BTF-function-parameter-type-match-check.patch |  41 +++++++
 ...ole-preserve-const-ness-of-bsearch-result.patch |  38 ++++++
 ...s-Fix-clang-warning-about-unused-variable.patch |  45 +++++++
 4 files changed, 258 insertions(+)

diff --git a/package/pahole/0001-pahole-Fix-discarded-qualifiers-for-strchr-strstr.patch b/package/pahole/0001-pahole-Fix-discarded-qualifiers-for-strchr-strstr.patch
new file mode 100644
index 0000000000..0ceea478a4
--- /dev/null
+++ b/package/pahole/0001-pahole-Fix-discarded-qualifiers-for-strchr-strstr.patch
@@ -0,0 +1,134 @@
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
diff --git a/package/pahole/0003-pahole-preserve-const-ness-of-bsearch-result.patch b/package/pahole/0003-pahole-preserve-const-ness-of-bsearch-result.patch
new file mode 100644
index 0000000000..901bc91992
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
+@@ -1817,7 +1817,7 @@ static int btf_encoder__tag_kfunc(struct btf_encoder *encoder, struct gobuffer *
+ {
+ 	struct btf_func key = { .name = kfunc };
+ 	struct btf *btf = encoder->btf;
+-	struct btf_func *target;
++	const struct btf_func *target;
+ 	const void *base;
+ 	unsigned int cnt;
+ 	int err;
+-- 
+2.55.0
+
diff --git a/package/pahole/0004-dwarves-Fix-clang-warning-about-unused-variable.patch b/package/pahole/0004-dwarves-Fix-clang-warning-about-unused-variable.patch
new file mode 100644
index 0000000000..e4f16ad42e
--- /dev/null
+++ b/package/pahole/0004-dwarves-Fix-clang-warning-about-unused-variable.patch
@@ -0,0 +1,45 @@
+From 06350d14776a77e16ea5064030fea63bbdd22f27 Mon Sep 17 00:00:00 2001
+From: Alan Maguire <alan.maguire@oracle.com>
+Date: Fri, 28 Feb 2025 12:24:29 +0000
+Subject: [PATCH] dwarves: Fix clang warning about unused variable
+
+With dwarves CI, clang builds give a legit warning:
+
+/build/dwarves_fprintf.c:2102:9: error: variable 'printed' set but not used [-Werror,-Wunused-but-set-variable]
+ 2102 |         size_t printed = fprintf(fp, "namespace %s {\n", namespace__name(space));
+      |                ^
+1 error generated.
+
+And in fact we accumulate values in printed but never use it
+for the return value.  Add the printed count to the final fprintf().
+
+Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
+Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
+Cc: Alexei Starovoitov <ast@kernel.org>
+Cc: Andrii Nakryiko <andrii@kernel.org>
+Cc: Yonghong Song <yonghong.song@linux.dev>
+Cc: Daniel Borkmann <daniel@iogearbox.net>
+Cc: Song Liu <song@kernel.org>
+Cc: Eduard Zingerman <eddyz87@gmail.com>
+Cc: Jiri Olsa <olsajiri@gmail.com>
+Link: https://lore.kernel.org/dwarves/20250401092435.1619617-3-alan.maguire@oracle.com/
+
+Upstream: https://github.com/acmel/dwarves/commit/06350d14776a77e16ea5064030fea63bbdd22f27
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ dwarves_fprintf.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dwarves_fprintf.c b/dwarves_fprintf.c
+index c3e7f3c0..4407fd14 100644
+--- a/dwarves_fprintf.c
++++ b/dwarves_fprintf.c
+@@ -2110,7 +2110,7 @@ static size_t namespace__fprintf(const struct tag *tag, const struct cu *cu,
+ 		printed += fprintf(fp, "\n\n");
+ 	}
+ 
+-	return fprintf(fp, "%.*s}", conf->indent, tabs);
++	return printed + fprintf(fp, "%.*s}", conf->indent, tabs);
+ }
+ 
+ size_t tag__fprintf(struct tag *tag, const struct cu *cu,

--===============2862653405366645098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2862653405366645098==--
