Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C350ECD4F4A
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 998468427A;
	Fri, 15 May 2026 13:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xz6YMGeyzVeo; Fri, 15 May 2026 13:34:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4231584375
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852078;
	bh=t6mKilHRZX4THXLlW926xynWY/Wm9u59doc4BnDoqto=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Cf/vyU22Rcv/ZzSArGPiO3tnCT6Lli4og/RZ8tj53OwwN2egNiJ5TI3VuXS4e0wRw
	 ZfLFSwoPaLjR0LdCY5oK0I35oNJd50gBcWHMM+o7S0wu3GNYSFydeH7ozn5J3Ys3Ct
	 R7+DwpzTirn4R3cAJtz5U4JQE6I3/MEU4p5a1pII1yNOS+vIV9MzkkXj47RzkQchfs
	 LTil5fajQwSR4NerSazzQVIWoL6QlfzVkNRi9jf+b5VE11QC1/Xc0n0asm329hrwpS
	 Wn5GlmDaD9LSQEMtel3st/AFgpv2XOWSg/Vz0VWiwgMbo6e3vuQKul62tatjIrX+Ts
	 wua4PCeAQIm8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4231584375;
	Fri, 15 May 2026 13:34:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0461736E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA03A40E24
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fyyXqnwotz5i for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:34:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 87E0140E23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87E0140E23
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87E0140E23
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:28 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-43d7645adbdso5066765f8f.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852066; x=1779456866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BzC8Vku6qGjjyEhomYk4nlQgDny0eHF1fxQguA2Tm6U=;
 b=LSM8RTOJq0fcRHuwLaVmOZl6+jeQ+lpcLRidjfWmgbZkox0riGmDsIf/K4SuedtUnC
 9+tAlcPsXhiTdJdhwA+2/QN8yQ9isY2d5q/2fccU4KCz6z2r5AADv5810mxPgu2MxGFA
 zMAOrb6jlFkCWWIwgvj8yps7Q8iz4LBl6Z3nnHcoTcy1tIoqbyIUN9UE1kgCW+xtBFOZ
 +0uObRAmnLN0YIL9vDrDCct3Q62uBPnWO++ImcsvbEaA70YMHnvC+cMtiIBjg0IxHBQQ
 XFSZjp1o9+/HI0zitcYu+4mdcslruJImULOsRghHZ/RSuohX5Z6yIBEhhG2nscf4/Y66
 t1cg==
X-Gm-Message-State: AOJu0YxG3NP4dKLG8gjkROqSEYu2+aTR3Fh9i9iMYW8pAycMkrqpJU2z
 dSLxpYtxbqjHjmh4Oku00LKa4SpaieBKzaKTXtsNFcsNUepo6DD0DWF1yqhAuL7HX9sahe+pkk/
 VBTIZ
X-Gm-Gg: Acq92OEE0hQKeXzBD+ikDLEHOfpuJ83wqfc4MJFKAJjQylUj3pVPnNa7tC8ZdIQeStN
 yjH5QeWjRxcwP7MBd68y3ArGB2pDSIpaK4PHefCG60yWLSivuYCHxI7shupnmj33aAQz6UsNAe+
 MITLQrOa17HCLSlC+PNJmpvdezbRo4eq30oVzpr15asUELOpPBn7mj1Qk/wIgFOSNKp5kd48eyr
 P1dxdLCPnJqAcj7MW/JKAybXjGLyWSGPhFW/8L0kivUVaAf5em91DFXkMkIWaHTBrGpkwJ2u1Zw
 fYkj1unHdGFxY5pXtDnUp3RYHlXR7KZdkLoaEVnGh7Fo5iMkoJfUXw+4zFImG1Gvq8zsHoOSGi8
 uPJafKbtH44QJuejYNpu+eLb4AYllkcDwpyeMqnqijdDM2pL5B95rXJh/uyKSyIXnTLtmpV5vRT
 W0bnpqSLvZaTGrjfhFAJ6jVImeOEOR7HWRV2u0Qg5j2i1K
X-Received: by 2002:a05:6000:2087:b0:441:36b7:7262 with SMTP id
 ffacd0b85a97d-45e5c36735emr5465086f8f.13.1778852066383; 
 Fri, 15 May 2026 06:34:26 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ed30110sm15740091f8f.13.2026.05.15.06.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:34:26 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 15 May 2026 15:34:25 +0200
Message-ID: <20260515133425.317313-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513103913.419755-2-thomas.perale@mind.be>
References: <20260513103913.419755-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852066; x=1779456866; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BzC8Vku6qGjjyEhomYk4nlQgDny0eHF1fxQguA2Tm6U=;
 b=Zn3FAPYovxiZbAHnac3A8GvsObavC+48OIFwLLLH8gs9gqTcPbG8EjeGgj19kZ3XAF
 wmkiiBd4SIpasSIF/YySLwwoa+JM2zHR53jwnrecYTdrUuH83zzJG20sZlLx5iJ4cMV0
 hE8Z3byLJZYR6HDnLjvmzOlKjOyZcD65g4vfAIlrrbaF4hYnciCJniNtApym+0nSN/aB
 mkQF/EMg6ypGIoLclyOgM9mnUAyyXM3T9lLHGMsRE2Edt1wvyjIGBAn8dcQCvkw9+eq3
 i3UaBGJ7UMRRvMaKPaiWkxssarW3yhm5AGSXXN+RdGsh+8NWhEP2nVbE31DFWMeJaOHI
 WODg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Zn3FAPYo
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/dropbear: patch
 CVE-2019-6111 CVE-2026-35385
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
> While CVE-2019-6111 was already fixed in 2025.89, the version 2026.90
> provided a follow up of that fix.
> 
> Note that the author provided this note with this patch:
> 
> > Note breaking change: "-r" is now disallowed when the target directory exists
> > (an additional change in Dropbear's version). If that's required an alternative
> > such as rsync could be used.
> 
> Adapt your usage of dropbear accordingly.
> 
> - CVE-2019-6111:
>     An issue was discovered in OpenSSH 7.9. Due to the scp implementation
>     being derived from 1983 rcp, the server chooses which
>     files/directories are sent to the client. However, the scp client only
>     performs cursory validation of the object name returned (only
>     directory traversal attacks are prevented). A malicious scp server (or
>     Man-in-The-Middle attacker) can overwrite arbitrary files in the scp
>     client target directory. If recursive operation (-r) is performed, the
>     server can manipulate subdirectories as well (for example, to
>     overwrite the .ssh/authorized_keys file).
> 
> For more information, see:
>     https://www.cve.org/CVERecord?id=CVE-2019-6111
> 
> - CVE-2026-35385:
>     In OpenSSH before 10.3, a file downloaded by scp may be installed
>     setuid or setgid, an outcome contrary to some users' expectations, if
>     the download is performed as root with -O (legacy scp protocol) and
>     without -p (preserve mode).
> 
> For more information, see:
>     https://www.cve.org/CVERecord?id=CVE-2026-35385
> 
> [1] https://github.com/mkj/dropbear/releases/tag/DROPBEAR_2026.90
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/dropbear/0001-CVE-2019-6111.patch  | 364 +++++++++++++++++++++
>  package/dropbear/0002-CVE-2026-35385.patch |  40 +++
>  package/dropbear/dropbear.mk               |   6 +
>  3 files changed, 410 insertions(+)
>  create mode 100644 package/dropbear/0001-CVE-2019-6111.patch
>  create mode 100644 package/dropbear/0002-CVE-2026-35385.patch
> 
> diff --git a/package/dropbear/0001-CVE-2019-6111.patch b/package/dropbear/0001-CVE-2019-6111.patch
> new file mode 100644
> index 0000000000..6ec149444a
> --- /dev/null
> +++ b/package/dropbear/0001-CVE-2019-6111.patch
> @@ -0,0 +1,364 @@
> +From 143291baca6ebb3407a0c25c85bd53bf041a6ab7 Mon Sep 17 00:00:00 2001
> +From: Matt Johnston <matt@ucc.asn.au>
> +Date: Mon, 20 Apr 2026 20:57:11 +0800
> +Subject: [PATCH] scp: more CVE-2019-6111 fix
> +
> +Cherrypicked from OpenSSH portable
> +
> +commit 3d896c157c722bc47adca51a58dca859225b5874
> +djm Sun Feb 10 11:15:52 2019 +0000
> +
> +upstream: when checking that filenames sent by the server side
> +
> +match what the client requested, be prepared to handle shell-style brace
> +alternations, e.g. "{foo,bar}".
> +
> +"looks good to me" millert@ + in snaps for the last week courtesy
> +deraadt@
> +
> +Upstream: https://github.com/mkj/dropbear/commit/143291baca6ebb3407a0c25c85bd53bf041a6ab7.patch
> +CVE: CVE-2019-6111
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/scp.c | 281 +++++++++++++++++++++++++++++++++++++++++++++++++++---
> + 1 file changed, 269 insertions(+), 12 deletions(-)
> +
> +diff --git a/src/scp.c b/src/scp.c
> +index bf98986c..d151587c 100644
> +--- a/src/scp.c
> ++++ b/src/scp.c
> +@@ -74,7 +74,6 @@
> +  */
> + 
> + #include "includes.h"
> +-/*RCSID("$OpenBSD: scp.c,v 1.130 2006/01/31 10:35:43 djm Exp $");*/
> + 
> + #include <fnmatch.h>
> + 
> +@@ -600,6 +599,253 @@ tolocal(int argc, char **argv)
> + 	}
> + }
> + 
> ++/* Appends a string to an array; returns 0 on success, -1 on alloc failure */
> ++static int
> ++append(char *cp, char ***ap, size_t *np)
> ++{
> ++	char **tmp;
> ++
> ++	if ((tmp = reallocarray(*ap, *np + 1, sizeof(*tmp))) == NULL)
> ++		return -1;
> ++	tmp[(*np)] = cp;
> ++	(*np)++;
> ++	*ap = tmp;
> ++	return 0;
> ++}
> ++
> ++/*
> ++ * Finds the start and end of the first brace pair in the pattern.
> ++ * returns 0 on success or -1 for invalid patterns.
> ++ */
> ++static int
> ++find_brace(const char *pattern, int *startp, int *endp)
> ++{
> ++	int i;
> ++	int in_bracket, brace_level;
> ++
> ++	*startp = *endp = -1;
> ++	in_bracket = brace_level = 0;
> ++	for (i = 0; i < INT_MAX && *endp < 0 && pattern[i] != '\0'; i++) {
> ++		switch (pattern[i]) {
> ++		case '\\':
> ++			/* skip next character */
> ++			if (pattern[i + 1] != '\0')
> ++				i++;
> ++			break;
> ++		case '[':
> ++			in_bracket = 1;
> ++			break;
> ++		case ']':
> ++			in_bracket = 0;
> ++			break;
> ++		case '{':
> ++			if (in_bracket)
> ++				break;
> ++			if (pattern[i + 1] == '}') {
> ++				/* Protect a single {}, for find(1), like csh */
> ++				i++; /* skip */
> ++				break;
> ++			}
> ++			if (*startp == -1)
> ++				*startp = i;
> ++			brace_level++;
> ++			break;
> ++		case '}':
> ++			if (in_bracket)
> ++				break;
> ++			if (*startp < 0) {
> ++				/* Unbalanced brace */
> ++				return -1;
> ++			}
> ++			if (--brace_level <= 0)
> ++				*endp = i;
> ++			break;
> ++		}
> ++	}
> ++	/* unbalanced brackets/braces */
> ++	if (*endp < 0 && (*startp >= 0 || in_bracket))
> ++		return -1;
> ++	return 0;
> ++}
> ++
> ++/*
> ++ * Assembles and records a successfully-expanded pattern, returns -1 on
> ++ * alloc failure.
> ++ */
> ++static int
> ++emit_expansion(const char *pattern, int brace_start, int brace_end,
> ++    int sel_start, int sel_end, char ***patternsp, size_t *npatternsp)
> ++{
> ++	char *cp;
> ++	int o = 0, tail_len = strlen(pattern + brace_end + 1);
> ++
> ++	if ((cp = malloc(brace_start + (sel_end - sel_start) +
> ++	    tail_len + 1)) == NULL)
> ++		return -1;
> ++
> ++	/* Pattern before initial brace */
> ++	if (brace_start > 0) {
> ++		memcpy(cp, pattern, brace_start);
> ++		o = brace_start;
> ++	}
> ++	/* Current braced selection */
> ++	if (sel_end - sel_start > 0) {
> ++		memcpy(cp + o, pattern + sel_start,
> ++		    sel_end - sel_start);
> ++		o += sel_end - sel_start;
> ++	}
> ++	/* Remainder of pattern after closing brace */
> ++	if (tail_len > 0) {
> ++		memcpy(cp + o, pattern + brace_end + 1, tail_len);
> ++		o += tail_len;
> ++	}
> ++	cp[o] = '\0';
> ++	if (append(cp, patternsp, npatternsp) != 0) {
> ++		free(cp);
> ++		return -1;
> ++	}
> ++	return 0;
> ++}
> ++
> ++/*
> ++ * Expand the first encountered brace in pattern, appending the expanded
> ++ * patterns it yielded to the *patternsp array.
> ++ *
> ++ * Returns 0 on success or -1 on allocation failure.
> ++ *
> ++ * Signals whether expansion was performed via *expanded and whether
> ++ * pattern was invalid via *invalid.
> ++ */
> ++static int
> ++brace_expand_one(const char *pattern, char ***patternsp, size_t *npatternsp,
> ++    int *expanded, int *invalid)
> ++{
> ++	int i;
> ++	int in_bracket, brace_start, brace_end, brace_level;
> ++	int sel_start, sel_end;
> ++
> ++	*invalid = *expanded = 0;
> ++
> ++	if (find_brace(pattern, &brace_start, &brace_end) != 0) {
> ++		*invalid = 1;
> ++		return 0;
> ++	} else if (brace_start == -1)
> ++		return 0;
> ++
> ++	in_bracket = brace_level = 0;
> ++	for (i = sel_start = brace_start + 1; i < brace_end; i++) {
> ++		switch (pattern[i]) {
> ++		case '{':
> ++			if (in_bracket)
> ++				break;
> ++			brace_level++;
> ++			break;
> ++		case '}':
> ++			if (in_bracket)
> ++				break;
> ++			brace_level--;
> ++			break;
> ++		case '[':
> ++			in_bracket = 1;
> ++			break;
> ++		case ']':
> ++			in_bracket = 0;
> ++			break;
> ++		case '\\':
> ++			if (i < brace_end - 1)
> ++				i++; /* skip */
> ++			break;
> ++		}
> ++		if (pattern[i] == ',' || i == brace_end - 1) {
> ++			if (in_bracket || brace_level > 0)
> ++				continue;
> ++			/* End of a selection, emit an expanded pattern */
> ++
> ++			/* Adjust end index for last selection */
> ++			sel_end = (i == brace_end - 1) ? brace_end : i;
> ++			if (emit_expansion(pattern, brace_start, brace_end,
> ++			    sel_start, sel_end, patternsp, npatternsp) != 0)
> ++				return -1;
> ++			/* move on to the next selection */
> ++			sel_start = i + 1;
> ++			continue;
> ++		}
> ++	}
> ++	if (in_bracket || brace_level > 0) {
> ++		*invalid = 1;
> ++		return 0;
> ++	}
> ++	/* success */
> ++	*expanded = 1;
> ++	return 0;
> ++}
> ++
> ++/* Expand braces from pattern. Returns 0 on success, -1 on failure */
> ++static int
> ++brace_expand(const char *pattern, char ***patternsp, size_t *npatternsp)
> ++{
> ++	char *cp, *cp2, **active = NULL, **done = NULL;
> ++	size_t i, nactive = 0, ndone = 0;
> ++	int ret = -1, invalid = 0, expanded = 0;
> ++
> ++	*patternsp = NULL;
> ++	*npatternsp = 0;
> ++
> ++	/* Start the worklist with the original pattern */
> ++	if ((cp = strdup(pattern)) == NULL)
> ++		return -1;
> ++	if (append(cp, &active, &nactive) != 0) {
> ++		free(cp);
> ++		return -1;
> ++	}
> ++	while (nactive > 0) {
> ++		cp = active[nactive - 1];
> ++		nactive--;
> ++		if (brace_expand_one(cp, &active, &nactive,
> ++		    &expanded, &invalid) == -1) {
> ++			free(cp);
> ++			goto fail;
> ++		}
> ++		if (invalid)
> ++			fatal("%s: invalid brace pattern \"%s\"", __func__, cp);
> ++		if (expanded) {
> ++			/*
> ++			 * Current entry expanded to new entries on the
> ++			 * active list; discard the progenitor pattern.
> ++			 */
> ++			free(cp);
> ++			continue;
> ++		}
> ++		/*
> ++		 * Pattern did not expand; append the finename component to
> ++		 * the completed list
> ++		 */
> ++		if ((cp2 = strrchr(cp, '/')) != NULL)
> ++			*cp2++ = '\0';
> ++		else
> ++			cp2 = cp;
> ++		if (append(xstrdup(cp2), &done, &ndone) != 0) {
> ++			free(cp);
> ++			goto fail;
> ++		}
> ++		free(cp);
> ++	}
> ++	/* success */
> ++	*patternsp = done;
> ++	*npatternsp = ndone;
> ++	done = NULL;
> ++	ndone = 0;
> ++	ret = 0;
> ++ fail:
> ++	for (i = 0; i < nactive; i++)
> ++		free(active[i]);
> ++	free(active);
> ++	for (i = 0; i < ndone; i++)
> ++		free(done[i]);
> ++	free(done);
> ++	return ret;
> ++}
> ++
> + void
> + source(int argc, char **argv)
> + {
> +@@ -841,7 +1087,8 @@ sink(int argc, char **argv, const char *src)
> + 	off_t size, statbytes;
> + 	int setimes, targisdir, wrerrno = 0;
> + 	char ch, *cp, *np, *targ, *why, *vect[1], buf[2048];
> +-	char *src_copy = NULL, *restrict_pattern = NULL;
> ++	char **patterns = NULL;
> ++	size_t n, npatterns = 0;
> + 	struct timeval tv[2];
> + 
> + #define	atime	tv[0]
> +@@ -868,16 +1115,13 @@ sink(int argc, char **argv, const char *src)
> + 		 * Prepare to try to restrict incoming filenames to match
> + 		 * the requested destination file glob.
> + 		 */
> +-		if ((src_copy = strdup(src)) == NULL)
> +-			fatal("strdup failed");
> +-		if ((restrict_pattern = strrchr(src_copy, '/')) != NULL) {
> +-			*restrict_pattern++ = '\0';
> +-		}
> ++		if (brace_expand(src, &patterns, &npatterns) != 0)
> ++			fatal("%s: could not expand pattern", __func__);
> + 	}
> + 	for (first = 1;; first = 0) {
> + 		cp = buf;
> + 		if (atomicio(read, remin, cp, 1) != 1)
> +-			return;
> ++			goto done;
> + 		if (*cp++ == '\n')
> + 			SCREWUP("unexpected <newline>");
> + 		do {
> +@@ -900,7 +1144,7 @@ sink(int argc, char **argv, const char *src)
> + 		}
> + 		if (buf[0] == 'E') {
> + 			(void) atomicio(vwrite, remout, "", 1);
> +-			return;
> ++			goto done;
> + 		}
> + 		if (ch == '\n')
> + 			*--cp = 0;
> +@@ -956,9 +1200,14 @@ sink(int argc, char **argv, const char *src)
> + 			run_err("error: unexpected filename: %s", cp);
> + 			exit(1);
> + 		}
> +-		if (restrict_pattern != NULL &&
> +-		    fnmatch(restrict_pattern, cp, 0) != 0)
> +-			SCREWUP("filename does not match request");
> ++		if (npatterns > 0) {
> ++			for (n = 0; n < npatterns; n++) {
> ++				if (fnmatch(patterns[n], cp, 0) == 0)
> ++					break;
> ++			}
> ++			if (n >= npatterns)
> ++				SCREWUP("filename does not match request");
> ++		}
> + 		if (targisdir) {
> + 			static char *namebuf = NULL;
> + 			static size_t cursize = 0;
> +@@ -1123,7 +1372,15 @@ bad:			run_err("%s: %s", np, strerror(errno));
> + 			break;
> + 		}
> + 	}
> ++done:
> ++	for (n = 0; n < npatterns; n++)
> ++		free(patterns[n]);
> ++	free(patterns);
> ++	return;
> + screwup:
> ++	for (n = 0; n < npatterns; n++)
> ++		free(patterns[n]);
> ++	free(patterns);
> + 	run_err("protocol error: %s", why);
> + 	exit(1);
> + }
> diff --git a/package/dropbear/0002-CVE-2026-35385.patch b/package/dropbear/0002-CVE-2026-35385.patch
> new file mode 100644
> index 0000000000..59c9f4bb69
> --- /dev/null
> +++ b/package/dropbear/0002-CVE-2026-35385.patch
> @@ -0,0 +1,40 @@
> +From 443ccc1fd1b9a4e3747f6b5cd644b7af49064308 Mon Sep 17 00:00:00 2001
> +From: Matt Johnston <matt@ucc.asn.au>
> +Date: Sat, 2 May 2026 08:17:25 +0800
> +Subject: [PATCH] scp: clear setuid/setgid bits on received files
> +
> +From openssh-portable 487e8ac146f7d6616f65c125d5edb210519b833a
> +Tracked as CVE-2026-35385
> +
> +upstream: when downloading files as root in legacy (-O) mode and
> +
> +without the -p (preserve modes) flag set, clear setuid/setgid bits from
> +downloaded files as one might expect.
> +
> +AFAIK this bug dates back to the original Berkeley rcp program.
> +
> +Reported by Christos Papakonstantinou of Cantina and Spearbit.
> +
> +Upstream: https://github.com/mkj/dropbear/commit/443ccc1fd1b9a4e3747f6b5cd644b7af49064308.patch
> +CVE: CVE-2026-35385
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/scp.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/scp.c b/src/scp.c
> +index 09297a5b..79b0a12d 100644
> +--- a/src/scp.c
> ++++ b/src/scp.c
> +@@ -1106,8 +1106,10 @@ sink(int argc, char **argv, const char *src)
> + 
> + 	setimes = targisdir = 0;
> + 	mask = umask(0);
> +-	if (!pflag)
> ++	if (!pflag) {
> ++		mask |= 07000;
> + 		(void) umask(mask);
> ++	}
> + 	if (argc != 1) {
> + 		run_err("ambiguous target");
> + 		exit(1);
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index e4e42cf994..36acd7a4e4 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -14,6 +14,12 @@ DROPBEAR_PROGRAMS = dropbear $(DROPBEAR_TARGET_BINS)
>  DROPBEAR_CPE_ID_VENDOR = dropbear_ssh_project
>  DROPBEAR_CPE_ID_PRODUCT = dropbear_ssh
>  
> +# 0001-CVE-2019-6111.patch
> +DROPBEAR_IGNORE_CVES += CVE-2019-6111
> +
> +# 0002-CVE-2026-35385.patch
> +DROPBEAR_IGNORE_CVES += CVE-2026-35385
> +
>  # Disable hardening flags added by dropbear configure.ac, and let
>  # Buildroot add them when the relevant options are enabled. This
>  # prevents dropbear from using SSP support when not available.
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
