Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222DCC38142
	for <buildroot@archiver.kernel.org>; Tue, 24 Jan 2023 16:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7054E40C8E;
	Tue, 24 Jan 2023 16:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7054E40C8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 41YL3v_WJxrg; Tue, 24 Jan 2023 16:50:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAD9540C88;
	Tue, 24 Jan 2023 16:50:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAD9540C88
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE5571BF36F
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 16:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C622140C88
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 16:50:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C622140C88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ryGHRR20ps4 for <buildroot@lists.busybox.net>;
 Tue, 24 Jan 2023 16:50:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13DF940396
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13DF940396
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 16:50:32 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 e10-20020a17090a630a00b0022bedd66e6dso2638039pjj.1
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 08:50:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L7b+m9hadnFkJKREZ2i5xFCv4RBOM3PU7zyQcHVYjaM=;
 b=r5bPZYrONf4qVIccxTMsSz0yWxCCvOnurRQ7zgLYA3Az/MbjTraNXMeoref+mSNxca
 Gy5ViJBglBi+ZLVKnSgc3uWDaJl+OCfNfYvhGtRGOTVxk2SZXYiYevUmawW2ZMo84Dm6
 SWu86PeH8Gszu+bv4l2jEQQj+q9wBZcUiNKr4nvundXFv8GCEdZ6AbDKmLlA69lrA1FN
 Ymz5qXXaKHAt8zqnt7nP93Tax2p4UYfTGEvJd1ngDl7X/sLNZFqeBtNxBWkCwPJiK0x0
 eK77oQg4L49gaDF4WUzmk9ixPWrGe1Iha8zmAAp4SQ/ckvbJ77uer8hvY/jhj8dBGmlk
 0weA==
X-Gm-Message-State: AFqh2kqgHHNWwaXP+yCzpDyqy1o/tbyuCF9lW//pVPuepeVbxT5nK00p
 OXEOg/reAoWpcyjmu8qVMGFtdc1ctLpxGVNJaqfRyw==
X-Google-Smtp-Source: AMrXdXt434IvB0OjGMjzAtXDZpkXaQwyYrHBsf/LchRJnfgfdjbwghvEXWQC+3TR93jeu//SqxeJvucxgk7ALVIes2s=
X-Received: by 2002:a17:90a:9dcb:b0:22b:b9ee:eb14 with SMTP id
 x11-20020a17090a9dcb00b0022bb9eeeb14mr1839552pjv.36.1674579032311; Tue, 24
 Jan 2023 08:50:32 -0800 (PST)
MIME-Version: 1.0
References: <20230122090947.1369673-1-yann.morin.1998@free.fr>
In-Reply-To: <20230122090947.1369673-1-yann.morin.1998@free.fr>
Date: Tue, 24 Jan 2023 11:50:21 -0500
Message-ID: <CABGDZC=gUDkp0YK1vEeKXSyNm045rb0d56fkHHzk6dHivwX5wQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=starry.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=L7b+m9hadnFkJKREZ2i5xFCv4RBOM3PU7zyQcHVYjaM=;
 b=sEgI+VPaD5Ee83JZS9egugJz/WPPoyGeSBJlbyetshLX45uEkcyj/T4C4Nfza4ZI1E
 IIXbL+xdQxr7PB4WQhp+yN06TAqwgKBeCDAG7tHT8ibAt4zCkz/Iat2dk1/d6dpJhXvY
 NSiIAYCp7jgK6IVjJt2K6RU6M3h+/X39u2n7E=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=starry.com header.i=@starry.com
 header.a=rsa-sha256 header.s=google header.b=sEgI+VPa
Subject: Re: [Buildroot] [PATCH] Makefile: fix build when $(O) ends in
 _defconfig
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
From: Nevo Hed via buildroot <buildroot@buildroot.org>
Reply-To: Nevo Hed <nhed+buildroot@starry.com>
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann,

Though I'm a tad baffled by the concept of naming anything but a
defconfig (Kconf) file with the same pattern, the fix seems
reasonable.

--Nevo

On Sun, Jan 22, 2023 at 4:09 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Commit e6195c53041f (Makefile: fix use of many br2-external trees) fixed
> a slowdown with many br2-external trees. In doing so, it changed the
> type of the %_defconfig rule: the stem is no longer present in the
> prerequisites, so it changes from a pattern rule to an implicit pattern
> rule [0].
>
> It is not unusual to name the build directory after the defconfig that
> is being built, so we may end up with a build directory named
> meh_defconfig. Before e6195c53041f, the pattern rule would not match
> [1], but now it does, which causes somewhat-cryptic build failures:
>
>     Makefile:1015: *** "Can't find /some/path/meh_defconfig".  Stop.
>
> The issue is that we have this set of rules and assignments (elided and
> reordered for legibility):
>
>     all: world
>     world: target-post-image
>     target-post-image: staging-finalize
>     staging-finalize: $(STAGING_DIR_SYMLINK)
>     $(STAGING_DIR_SYMLINK): | $(BASE_DIR)
>     BASE_DIR := $(CANONICAL_O)
>     CANONICAL_O := $(shell mkdir -p $(O) >/dev/null 2>&1)$(realpath $(O))
>
> So, there is a rule that (eventually) has a dependency on $(O), but we
> have no rule that provides it explicitly, so the %_defconfig rule kicks
> in, with the stem as "/some/path/meh". When the loop searches all the
> ".../configs/" directories for a file named ".../configs/%_defconfig",
> it actually lookes for a file named ".../configs//some/path/meh_defconfig"
> and that indeed never matches anything.
>
> The solution is to provide an actual rule for $(BASE_DIR), so that the
> implicit rule does not kick in.
>
> [0] Terminology and behaviour in make is hard, so the terms we used here
>     may be wrong or incorrectly used, and/or the explanations for the
>     behavious be wrong or incomplete... Still, the reasoning stands, and
>     the root cause is the removal of the stem in the RHS of the rule
>     (adding one back does fix the issue).
>
> [1] not sure how the prerequisite was solved  before e6195c53041f,
>     though...
>
> Fixes: e6195c53041f
>
> Reported-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Nevo Hed <nhed+buildroot@starry.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 8517d563d5..f39af5eae9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1042,7 +1042,7 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>
>  # staging and target directories do NOT list these as
>  # dependencies anywhere else
> -$(BUILD_DIR) $(BASE_TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST) $(PER_PACKAGE_DIR):
> +$(BASE_DIR) $(BUILD_DIR) $(BASE_TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST) $(PER_PACKAGE_DIR):
>         @mkdir -p $@
>
>  # outputmakefile generates a Makefile in the output directory, if using a
> --
> 2.25.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
