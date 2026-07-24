Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1DCC531F9
	for <buildroot@archiver.kernel.org>; Fri, 24 Jul 2026 14:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1B7C40B39;
	Fri, 24 Jul 2026 14:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0V8Ri3YKBn3J; Fri, 24 Jul 2026 14:14:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C22CC40B3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784902489;
	bh=gs8PiUbyH1gnlyFgj2Cw+fIXVJAgw29K7/j+K69rjow=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cvOP9mdw0uPREo+8JN4QyOgOGnb93dNU/UHMnR6XqOMhRikz937Wx1hVDJbKQQ+IO
	 AmgeNCQP8ItbCEnCC5CqusBdKNgOdLem4CjUZmhcEuSAuPUcDlCuIxdkVWpYK0AB1v
	 VdPusOboMlgqxvAj6JahWyqEl6fkApEpE1P47iw2cIz6T5/PJhjlQSN2sGmGQuvHtt
	 hJ6IcphHaxRpaQgmYI8s5sw5gJc7dq++oIG2ifeWyzcdq/c0H76sfWt7h2y+I0afSe
	 GzIb84c4ynnTxuryyBWzh8yxVCaEFU1AhP1NlZKwRHxMH3dtIt3Gn2ln0C+Ipu3wea
	 uh8draJyY7bug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C22CC40B3C;
	Fri, 24 Jul 2026 14:14:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 389863B0
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A50380C10
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:14:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P0eifW85UBP0 for <buildroot@buildroot.org>;
 Fri, 24 Jul 2026 14:14:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D0B5980B99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0B5980B99
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0B5980B99
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:14:46 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4954aff6088so4384675e9.3
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 07:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784902484; x=1785507284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=MbYFWiMWvW71u5bWY68WOFy+2NtUfIQd0ocz3L7rWuQ=;
 b=WAC2kw4XlpvgON/uNafW9nDJnhbWg5kQTIttDGnYamqIT03sQEVK40DQ0PJQfZhEOb
 9qVUC+3oMMdA0DpL6dUqby+3uv/GXw7MWPOHVeHWBMfYlY45Dc91VuuS6UyXoU/2FIW/
 +lAkU13Cf5h7o6HZ2M2FndkUCIxchXLJDbZpyDxxrg8Fc7/outHPuD1TDgbPb0dtKxLu
 j9KNZkvkyv3LaViosLm/f5pck0gEl6wy946lq3S4V2oGfdPSy+gTFgUhaTh12imA5mWq
 cgIAHbl2BV1h2xq9juS2f059CefcmNfhhrDlgzcA34J2PUDlt1hFso3UVDHrnm2wYIlV
 mUig==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr/u/gJLH5DKdeSGDHzeAt5jaitaG4YrorWc5C3750xuRhx7STg2Bl9iTKkfahn6zoZ+bNlVYIn2Gs=@buildroot.org
X-Gm-Message-State: AOJu0YzBWvX8J+eM+cRgRoklkKB3Ps228JgcFxRLtvyLldMx29meL1GQ
 9QS0UX5n2NRtFJK3gn+VtETscpQBv+l2y8Yaws4tLEnLuk4D0JCH6c3gi3lw7gJz9llbyV1sE96
 5/RT/
X-Gm-Gg: AR+sD12G49tAWRv+2JEvBfTrL8pECacVxTck3ir2/JhhhcyeEGOzpMFNSse8vGjr69w
 8hffZPJtf5963CF4jcFZwKBeGviRzJbY9C1qpcH3PcKVCTgnW9JUanExsHc0jm4RIrmeu8varpx
 RM+o51ns6FV/hephcwiGHdLAT3TQQTKEO8zCA7NazIThH0nE6+a9hbcpaWv5CtPC+nAjzr+2GP4
 xmFV+kY0qQh7sKAOlZUgptaAXdx0vPNr6hGOPGaC59+6O6Ckp5o4PJSqjE8twKSf6mx1Dv8zVpa
 W+biqTsvkgjnDB9jFAAFxMVEZS/IFT44ZhQalf5qsNR7loRxUX7ZxBWrKwiG5B8djZEtGODJ2Wd
 8fExRAztMCUR7KgcRS+IkhWFLqIX/5PIjMVTI0afDM3O499XPOiEXmoe1uSkVtqpMZ7VAny8=
X-Received: by 2002:a05:600c:190a:b0:495:6e68:5df2 with SMTP id
 5b1f17b1804b1-49573c9995bmr94986205e9.12.1784902484541; 
 Fri, 24 Jul 2026 07:14:44 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957af6b049sm82686895e9.6.2026.07.24.07.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2026 07:14:44 -0700 (PDT)
To: Florian Larysch <fl@n621.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Jul 2026 16:14:43 +0200
Message-ID: <20260724141443.477733-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260714144635.20560-1-fl@n621.de>
References: <20260714144635.20560-1-fl@n621.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1784902484; x=1785507284; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MbYFWiMWvW71u5bWY68WOFy+2NtUfIQd0ocz3L7rWuQ=;
 b=ebSEXyjBa8Pv1ilh2XFSOkvkB0isW5ZhKBPbofOOqvJKHQ8JuR59eT4PG+gCD1lm9Q
 drFE+jJcxJGyC/hkWVT+PQjfgTt/Xeof6Tr6U8fCtWsgBevPRRaDEN0SNfcrOrcLG3Ny
 2FCKliUU0R/zNxF/MGGwBqpRCMdZdMDfxzH392KuekfOnBtvHDdOKqdTLApE+SdqpLjU
 GwyL3BoRJnmdzjfvurWZ4fJY+HWHWU+6SEMGjw1OPzDzG4RbZvc5G+fQ38juHIOYZC+4
 7+rUJHFok7iFLv92yL4Cp1Aci1YJkf9UN8zW/nnX/ZswfXZnHkqwvGL8gPk2F980kSfK
 Y69A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ebSEXyjB
Subject: Re: [Buildroot] [PATCH 1/1] package/pahole: fix build on modern
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> When building pahole using a modern GCC (e.g. when building
> host-pahole), discarded-qualifiers and unused-but-set-variable warnings
> are produced. In builds that don't set CMAKE_BUILD_TYPE=Release, -Werror
> gets set and causes a build failure.
> 
> Fix this by backporting an unreleased upstream patch (for
> discarded-qualifiers) and adding another pending one for
> unused-but-set-variable (and, arguably, a correctness issue).
> 
> Fixes: https://autobuild.buildroot.org/results/ba7/ba79fb9d08b2c6ec573b79fdbb6b4880bf603a57
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

Applied to 2026.05.x. Thanks

> ---
>  ...scarded-qualifiers-for-strchr-strstr.patch | 147 ++++++++++++++++++
>  ...-function-parameter-type-match-check.patch |  41 +++++
>  2 files changed, 188 insertions(+)
>  create mode 100644 package/pahole/0001-pahole-Fix-discarded-qualifiers-for-strchr-strstr.patch
>  create mode 100644 package/pahole/0002-pahole-fix-BTF-function-parameter-type-match-check.patch
> 
> diff --git a/package/pahole/0001-pahole-Fix-discarded-qualifiers-for-strchr-strstr.patch b/package/pahole/0001-pahole-Fix-discarded-qualifiers-for-strchr-strstr.patch
> new file mode 100644
> index 0000000000..87a63cfdc9
> --- /dev/null
> +++ b/package/pahole/0001-pahole-Fix-discarded-qualifiers-for-strchr-strstr.patch
> @@ -0,0 +1,147 @@
> +From 5f5809cd50cc4d583a2fe3f4d556cb120760e229 Mon Sep 17 00:00:00 2001
> +From: Damien Hourtoulle <damien.hourtoulle@gmail.com>
> +Date: Wed, 11 Mar 2026 15:09:39 +0100
> +Subject: [PATCH] pahole: Fix discarded-qualifiers for strchr/strstr.
> +
> +Glibc 2.43 added C23 const-preserving overloads :
> +https://sourceware.org/glibc/wiki/Release/2.43.
> +
> +For the function prototype__new, fix local variable declaration to use
> +the correct const char* type instead of char*, removing the need to
> +discard the const qualifier.
> +
> +Also fix a pre-existing bug in type__find_type_enum: when iterating
> +over a '+'-concatenated list of enum names, after advancing to the next
> +segment the new separator was not nullified, causing "second+third" to
> +be passed to cu__find_enumeration_by_name instead of "second".  Add a
> +null check before writing to sep_mutable to avoid a null dereference
> +when no further '+' is present.
> +
> +Signed-off-by: Damien Hourtoulle <damien.hourtoulle@gmail.com>
> +Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> +Link: https://lore.kernel.org/dwarves/20260311140938.81459-2-d.hourtoulle@geoide.fr/
> +
> +Upstream: https://git.kernel.org/pub/scm/devel/pahole/pahole.git/commit/?id=ba31cfa08ffcfe6ff5757f325de5b03ca157cb78
> +Signed-off-by: Florian Larysch <fl@n621.de>
> +---
> + btf_encoder.c |  2 +-
> + pahole.c      | 35 ++++++++++++++++++-----------------
> + 2 files changed, 19 insertions(+), 18 deletions(-)
> +
> +diff --git a/btf_encoder.c b/btf_encoder.c
> +index 03bc3c7..4a585f5 100644
> +--- a/btf_encoder.c
> ++++ b/btf_encoder.c
> +@@ -1199,7 +1199,7 @@ static bool str_contains_non_fn_suffix(const char *str) {
> + 		".cold",
> + 		".part"
> + 	};
> +-	char *suffix = strchr(str, '.');
> ++	const char *suffix = strchr(str, '.');
> + 	int i;
> + 
> + 	if (!suffix)
> +diff --git a/pahole.c b/pahole.c
> +index ef01e58..8c827fc 100644
> +--- a/pahole.c
> ++++ b/pahole.c
> +@@ -2482,7 +2482,7 @@ static int64_t type_instance__int_value(struct type_instance *instance, const ch
> + 	int byte_offset = 0;
> + 
> + 	if (!member) {
> +-		char *sep = strchr(member_name_orig, '.');
> ++		const char *sep = strchr(member_name_orig, '.');
> + 
> + 		if (!sep)
> + 			return -1;
> +@@ -2495,8 +2495,8 @@ static int64_t type_instance__int_value(struct type_instance *instance, const ch
> + 		char *member_name = member_name_alloc;
> + 		struct type *type = instance->type;
> + 
> +-		sep = member_name_alloc + (sep - member_name_orig);
> +-		*sep = 0;
> ++		char *sep_mutable = member_name_alloc + (sep - member_name_orig);  // sep mutable for the copy
> ++		*sep_mutable = 0;
> + 
> + 		while (1) {
> + 			member = type__find_member_by_name(type, member_name);
> +@@ -2509,9 +2509,9 @@ out_free_member_name:
> + 			type = tag__type(cu__type(cu, member->tag.type));
> + 			if (type == NULL)
> + 				goto out_free_member_name;
> +-			member_name = sep + 1;
> +-			sep = strchr(member_name, '.');
> +-			if (!sep)
> ++			member_name = sep_mutable + 1;
> ++			sep_mutable = strchr(member_name, '.');
> ++			if (!sep_mutable)
> + 				break;
> + 
> + 		}
> +@@ -2949,7 +2949,7 @@ static struct prototype *prototype__new(const char *expression)
> + 
> + 	strcpy(prototype->name, expression);
> + 
> +-	const char *name = prototype->name;
> ++	char *name = prototype->name;
> + 
> + 	prototype->nr_args = 0;
> + 
> +@@ -2963,10 +2963,9 @@ static struct prototype *prototype__new(const char *expression)
> + 	if (args_close == NULL)
> + 		goto out_no_closing_parens;
> + 
> ++	*args_open++ = *args_close = '\0';
> + 	char *args = args_open;
> + 
> +-	*args++ = *args_close = '\0';
> +-
> + 	while (isspace(*args))
> + 		++args;
> + 
> +@@ -3113,7 +3112,7 @@ static int type__find_type_enum(struct type *type, struct cu *cu, const char *ty
> + 		return type__add_type_enum(type, te, cu);
> + 
> + 	// Now look at a 'virtual enum', i.e. the concatenation of multiple enums
> +-	char *sep = strchr(type_enum, '+');
> ++	const char *sep = strchr(type_enum, '+');
> + 
> + 	if (!sep)
> + 		return -1;
> +@@ -3125,13 +3124,13 @@ static int type__find_type_enum(struct type *type, struct cu *cu, const char *ty
> + 
> + 	int ret = -1;
> + 
> +-	sep = type_enums + (sep - type_enum);
> ++	char *sep_mutable = type_enums + (sep - type_enum);
> ++	char *cur = type_enums;
> + 
> +-	type_enum = type_enums;
> +-	*sep = '\0';
> ++	*sep_mutable = '\0';
> + 
> + 	while (1) {
> +-		te = cu__find_enumeration_by_name(cu, type_enum, NULL);
> ++		te = cu__find_enumeration_by_name(cu, cur, NULL);
> + 
> + 		if (!te)
> + 			goto out;
> +@@ -3140,10 +3139,12 @@ static int type__find_type_enum(struct type *type, struct cu *cu, const char *ty
> + 		if (ret)
> + 			goto out;
> + 
> +-		if (sep == NULL)
> ++		if (sep_mutable == NULL)
> + 			break;
> +-		type_enum = sep + 1;
> +-		sep = strchr(type_enum, '+');
> ++		cur = sep_mutable + 1;
> ++		sep_mutable = strchr(cur, '+');
> ++		if (sep_mutable)
> ++			*sep_mutable = '\0';
> + 	}
> + 
> + 	ret = 0;
> +-- 
> +2.55.0
> +
> diff --git a/package/pahole/0002-pahole-fix-BTF-function-parameter-type-match-check.patch b/package/pahole/0002-pahole-fix-BTF-function-parameter-type-match-check.patch
> new file mode 100644
> index 0000000000..0bea2a602f
> --- /dev/null
> +++ b/package/pahole/0002-pahole-fix-BTF-function-parameter-type-match-check.patch
> @@ -0,0 +1,41 @@
> +From f282f4e995becc55a8fa380781dc36e0ff0796d2 Mon Sep 17 00:00:00 2001
> +From: Florian Larysch <fl@n621.de>
> +Date: Tue, 14 Jul 2026 16:07:54 +0200
> +Subject: [PATCH] pahole: fix BTF function parameter type match check
> +
> +The BTF_KIND_FUNC_PROTO arm in types__match() first checks whether two
> +function types identified by t1/t2 have matching return types and then
> +attempts to iterate over the function parameters (p1/p2) to check them
> +for compatibility too.
> +
> +However, the loop just repeats the check on t1/t2 instead of p1/p2, so
> +we just keep re-checking return type compatibility, ignoring possible
> +mismatches of the actual parameter types.
> +
> +Fix this by actually comparing p1 and p2. This also resolves a
> +unused-but-set-variable build-time warning.
> +
> +Upstream: https://lore.kernel.org/dwarves/20260714140858.17507-1-fl@n621.de/
> +Signed-off-by: Florian Larysch <fl@n621.de>
> +---
> + btf_encoder.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/btf_encoder.c b/btf_encoder.c
> +index 4a585f5..4f9790e 100644
> +--- a/btf_encoder.c
> ++++ b/btf_encoder.c
> +@@ -1109,8 +1109,8 @@ static bool types__match(struct btf_encoder *encoder,
> + 					  btf2, t2->type))
> + 				return false;
> + 			for (i = 0; i < vlen; i++, p1++, p2++) {
> +-				if (!types__match(encoder, btf1, t1->type,
> +-						  btf2, t2->type))
> ++				if (!types__match(encoder, btf1, p1->type,
> ++						  btf2, p2->type))
> + 					return false;
> + 			}
> + 			return true;
> +-- 
> +2.55.0
> +
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
