Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C995DD2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E99484331;
	Tue, 13 Jan 2026 19:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z5Rxrbz3h0BV; Tue, 13 Jan 2026 19:47:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8147A84333
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333629;
	bh=qVLMKjCP/PXKI1yxRMBJ5dBgKOHofKnPkPmvOhzP2iE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qpsyI3q2NRZ+/bRx3vYLkkogcAX8UOTJ2BG5xGJgfG16mMawi5CGmqPElZBgi8jyI
	 3+XFZskWZmDGkhBL9V7IYg7ArVtXJUGR0B1E1GNnDd/6s9OZQjH4PAYlRRhq77sYrI
	 JAzh5EnQcGL9/TIqxz5cHORcOqUErmH6l4DBbue1dbaBzRgTdzIJfw33uRUvEVyyvz
	 0/kp7PVrgZ4P/BjazIBEZ/UQCmfq8NxXVH1tGNL3kggvMDDOsNAlntjOE3sdBrLwzp
	 CE3rWlD3X/4y8zgdusCudFWe5gIGfoEjazliWp0l31LfeI7OsHLJSzBVKJU/Z+vnbB
	 ar5AbJjDvV5Cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8147A84333;
	Tue, 13 Jan 2026 19:47:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04E24231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF66260BD1
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vFuXQ3V6p6Ov for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:47:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AE20060BB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE20060BB3
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE20060BB3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DDBE1B97A886; Tue, 13 Jan 2026 20:47:05 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:47:04 +0100
Message-ID: <20260113194704.99382-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-4-thomas.perale@mind.be>
References: <20251230081917.18676-4-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333626; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=dmjpwpx4Lj+1BGojTa7WoKTOskV2PNMxRSV+gEhVwiU=;
 b=VcNmiDMC5ELSpm0IaLpW/XzNnWVnSJeioowRQQoBqlJp/YiRyc7GTJvA30tNaou0nHv0th
 VCdA7ST6CKFdr9bfkkU8yukN9n7O2v1cQLiuRKxu0u/dXxVNl+2AyGpekAG0GCMmmi4vrb
 V1VSp+tE36y3PzdybXMQkYKSVPA0DNCwTutajAWp9hrDE0g/CsFP1dOhs/q1Rd7lf04pPx
 NUmr4lKQq5ljMBKSJpaUnwdCCLgbdF8PZJRXsLiaZ83EGMDOhj5VteUA1ughqbmez++biE
 2FDJ8Rry+cGgwAz8VycNrgao4oZRXz6d3+hRtyQwBNT5LOWj6dqvYcQFm4nnqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=VcNmiDMC
Subject: Re: [Buildroot] [PATCH v2 03/15] package/patch: add CVE trailer in
 patches
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Since Buildroot commit [1] the patches that fixes a security
> vulnerability needs to reference the fixed vulnerability.
> 
> This patch adds the relevant information to the patches header as well
> as the `Upstream` trailer.
> 
> [1] 1167d0ff3d docs/manual: mention CVE trailer
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  .checkpackageignore                                         | 4 ----
>  .../patch/0001-Fix-segfault-with-mangled-rename-patch.patch | 4 ++--
>  ...x-arbitrary-command-execution-in-ed-style-patches-.patch | 4 ++--
>  ...0004-Invoke-ed-directly-instead-of-using-the-shell.patch | 6 ++++--
>  ...t-follow-symlinks-unless--follow-symlinks-is-given.patch | 5 +++--
>  5 files changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 94916ecc0f..1e255f80e1 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -798,11 +798,7 @@ package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch li
>  package/owfs/S55owserver Shellcheck lib_sysv.Variables
>  package/owfs/S60owfs Shellcheck lib_sysv.Variables
>  package/owl-linux/0001-fix-for-linux-3.3.x.patch lib_patch.Upstream
> -package/patch/0001-Fix-segfault-with-mangled-rename-patch.patch lib_patch.Upstream
>  package/patch/0002-Allow-input-files-to-be-missing-for-ed-style-patches.patch lib_patch.Upstream
> -package/patch/0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch lib_patch.Upstream
> -package/patch/0004-Invoke-ed-directly-instead-of-using-the-shell.patch lib_patch.Upstream
> -package/patch/0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch lib_patch.Upstream
>  package/patchelf/0001-Add-option-to-make-the-rpath-relative-under-a-specif.patch lib_patch.Upstream
>  package/paxtest/0001-genpaxtest-move-log-location.patch lib_patch.Upstream
>  package/paxtest/0002-paxtest-page-alignment-ARM-and-NIOS2-arch.patch lib_patch.Upstream
> diff --git a/package/patch/0001-Fix-segfault-with-mangled-rename-patch.patch b/package/patch/0001-Fix-segfault-with-mangled-rename-patch.patch
> index 19a67573c4..1b8d954025 100644
> --- a/package/patch/0001-Fix-segfault-with-mangled-rename-patch.patch
> +++ b/package/patch/0001-Fix-segfault-with-mangled-rename-patch.patch
> @@ -7,10 +7,10 @@ http://savannah.gnu.org/bugs/?53132
>  * src/pch.c (intuit_diff_type): Ensure that two filenames are specified
>  for renames and copies (fix the existing check).
>  
> +CVE: CVE-2018-6951
> +Upstream: https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=f290f48a621867084884bfff87f8093c15195e6a
>  Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>  ---
> -Patch status: upstream commit f290f48a6218
> -
>   src/pch.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>  
> diff --git a/package/patch/0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch b/package/patch/0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch
> index b44bdd0fac..18497c153b 100644
> --- a/package/patch/0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch
> +++ b/package/patch/0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch
> @@ -10,11 +10,11 @@ instead of rejecting them and carrying on.
>  * tests/ed-style: New test case.
>  * tests/Makefile.am (TESTS): Add test case.
>  
> +CVE: CVE-2018-1000156
> +Upstream: https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=123eaff0d5d1aebe128295959435b9ca5909c26d
>  [baruch: drop test hunks to avoid autoreconf]
>  Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>  ---
> -Upstream status: commit 123eaff0d5d1
> -
>   src/pch.c         | 91 ++++++++++++++++++++++++++++++++++++++++---------------
>   tests/Makefile.am |  1 +
>   tests/ed-style    | 41 +++++++++++++++++++++++++
> diff --git a/package/patch/0004-Invoke-ed-directly-instead-of-using-the-shell.patch b/package/patch/0004-Invoke-ed-directly-instead-of-using-the-shell.patch
> index ae64d58b93..7ede9300e4 100644
> --- a/package/patch/0004-Invoke-ed-directly-instead-of-using-the-shell.patch
> +++ b/package/patch/0004-Invoke-ed-directly-instead-of-using-the-shell.patch
> @@ -5,8 +5,10 @@ Subject: Invoke ed directly instead of using the shell
>  
>  * src/pch.c (do_ed_script): Invoke ed directly instead of using a shell
>  command to avoid quoting vulnerabilities.
> -[Retrieved from:
> -https://git.savannah.gnu.org/cgit/patch.git/commit/?id=3fcd042d26d70856e826a42b5f93dc4854d80bf0]
> +
> +CVE: CVE-2018-20969
> +CVE: CVE-2019-13638
> +Upstream: https://git.savannah.gnu.org/cgit/patch.git/commit/?id=3fcd042d26d70856e826a42b5f93dc4854d80bf0
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  ---
>   src/pch.c | 6 ++----
> diff --git a/package/patch/0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch b/package/patch/0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch
> index e07ae0c670..c0e63081e2 100644
> --- a/package/patch/0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch
> +++ b/package/patch/0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch
> @@ -9,8 +9,9 @@ the O_NOFOLLOW flag to avoid following symlinks.  So far, we were only doing
>  that consistently for input files.
>  * src/util.c (create_backup): When creating empty backup files, (re)create them
>  with O_CREAT | O_EXCL to avoid following symlinks in that case as well.
> -[Retrieved from:
> -https://git.savannah.gnu.org/cgit/patch.git/commit/?id=dce4683cbbe107a95f1f0d45fabc304acfb5d71a]
> +
> +CVE: CVE-2019-13636
> +Upstream: https://git.savannah.gnu.org/cgit/patch.git/commit/?id=dce4683cbbe107a95f1f0d45fabc304acfb5d71a
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  ---
>   src/inp.c  | 12 ++++++++++--
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
