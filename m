Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6736D107BCD5
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 17:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3591A40C17;
	Fri, 13 Mar 2026 17:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ugKCjVADJaE1; Fri, 13 Mar 2026 17:21:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B68A640C1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773422486;
	bh=3aSP+xRddQktFKB4wVU5ZRcEOby1K6k+9teFxic5o7s=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Eer4mqCnzGWpgo5PnbnwwYq/X77JKRPkkqVpuVnRRlwv/OoixaQWrMfWQX+5Y7y+4
	 fKansv45Id6Z6LD4BgOkM/fGZvuhmc+Pf78GsRRjmxeZgaptmifzpGE1KissZ+urVC
	 2uifAzDxzIM5eIsiB/j9yGTi0sGdGpP8rGHqAogMa56QcHQ4KD3GHpDOWy1JccT1GV
	 pNPZwVJgll9b+VL+HvQ+mNIll8RkfJYEnusjIcyERP4Eb0eeUbWv1eAqUYk9l4et25
	 hYoO+2k4/sUQX0xVdf6dl8Y+LX+9Gszur1Gz0Yx91EYMb2nZ+iYlVdMOIkFmojOYF0
	 tJ4f0VlFP2P7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B68A640C1B;
	Fri, 13 Mar 2026 17:21:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18AA6786
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 17:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2A998156C
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 17:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXAEowRH66jI for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 17:21:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 20EDE81567
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20EDE81567
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20EDE81567
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 17:21:23 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b8f9568e074so350357966b.0
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 10:21:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773422482; cv=none;
 d=google.com; s=arc-20240605;
 b=BWuT3k8RtLigSLP1bJmy53pihflk/0P0oja8dZCJrOOqW33HlLmCNArMaFOwk0FeUh
 cyfOrhXtQyWOUkkhtQUOSMwjZwu9lao6VFwqpNOGdeg7yDGJ8PmUlLHvgAXRKAneLWdd
 gYtG+zfHlig7C3ubQqrzNI8QeViKBD6x5eSSrmLMTNzPnPUEUk78a8X0Mowy76+lmh+u
 ODF2QQlOnHe7C4XrN/HJnJToMo9FYEE3BQiJGTlq9ibh7Bq3ae0SzHwZUy9cH1trRPDV
 RVueD0C0qhYn3y0xLtUO0sRRbZTku1Mk0q0kLFM5j65gb/nrVSOk6lwApkbFUz+Qfq/6
 SZNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=/AhDtpFnAxHobQkQLXEnQqD2Oj/iBNk+I6o1yIVMG7Q=;
 fh=WMMirCp0IvTESJms/QIymyUekEPCI12ylFwTpt51H/Y=;
 b=EF38ioxt+tBuk12vQBGIv7hslpFijSkkomoSxR/jZAUAsNPlbJQC/rW91ma0sXjdH1
 pMTsxqgFoTX0jyOzh0G81ES4CKq/3JfDQeE8ld0i6XsXrW5uzq+V11fSyabIVwRvSZbf
 RDGn3EkpRFizHSEnwQOWJbsnDoc6pqjhLm2jl9isKBfGZY2nwOUHiSs4XSyHtm+jGO/w
 F8qoVLxWtd4uw31EzzV1zacAEzjcQBzELlnIHVYPlCD0Rdlk6iMQrlbvdIpupNo4osmL
 33FY/55eRjhvNBjZIoeFBLwxRpKZXZdmBZmN9TapkQCir8Yhbpr/KXB0lrRmfRev+cLE
 vvwg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773422482; x=1774027282;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/AhDtpFnAxHobQkQLXEnQqD2Oj/iBNk+I6o1yIVMG7Q=;
 b=PkdOa6klcDBCaSO+RBT6LRBQcIZqSgGmgEUWULTLiSmu9LdSFjS072/e68nYMq9u04
 hwd418JIG0uYL7BFl8VRGB7UEKFr6GrIlawQdndxJAXKabcxvAZ4SzOdYDHHbx/xxmLT
 c8o4AEqFbZ+qURzIsrUyMuJLDKGr+cvt+tCrP8bBgc7gdCkt+7wnzztJ10wxwh0inUEN
 fM6/tMhmBfVAdu5f557eA8T1ZvjzZf7c6P1qqceVF+GlAcHAIx+Xm4Ee0jPLRDv6UyCp
 S16Vf0KifbijJ88DhyKcqjIwbmgazyyxR0z8ahpF4dtAXbLxH6RTIcuoxzzX7DO8HXnQ
 acDQ==
X-Gm-Message-State: AOJu0YxvUjauGU+zJZWLlj7RjOXl4lZo8zgH2puXQyq76LIWmtRCnmbo
 33tJAWCMolct4yMVXTjRGNtd/2qTYXJg8SIhSCpKHvxIiKCCUp/ilZpLG0dLcavHhOuksCyyFj+
 u2g6bKaYjaBvmPk0COsZ+Hy/F0Hkx5yZcMi3K
X-Gm-Gg: ATEYQzwV0jb6MINC3yrvxDzPx4ys1ROAg+vxKkdPc/i2j+6FT8O1E8IyKjyv8KJEGD+
 6m/ZnSAFewrTuWsEgWK9oQONuHjfibndvECF4xo1a9qAxCRxdTC0TQrATh1YOlk99Fp41EhKI7G
 BhA8vrpRxyruphIcwZnCN3fIK0X9nm5M8etH7yDfyd4GFFHCsHJFF86jr/4+d++VETzBV2mmBND
 7CEmJxkq4V8Pgm2uGAtC8JBKiiK1nFvnfYBdmZUEG5ZQHG5ERFd5qHJTYmnYzt7OOtTN9fBVECT
 WfRtYn4Dh06iHMSiEfJQZ6SCjP//AJIpoMPXUmDG
X-Received: by 2002:a17:907:26c8:b0:b96:eb7e:bc3b with SMTP id
 a640c23a62f3a-b9765402ac3mr229517566b.49.1773422481488; Fri, 13 Mar 2026
 10:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260313110739.90948-1-chakrabortyshubham66@gmail.com>
 <402fa802-4fd9-49a8-926a-ce9dbde5ce5e@gmx.de>
In-Reply-To: <402fa802-4fd9-49a8-926a-ce9dbde5ce5e@gmx.de>
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Fri, 13 Mar 2026 22:51:10 +0530
X-Gm-Features: AaiRm50KBCXBUpRAmsA8LPOdBjyB8PkPeJnlxao8X17u2E-pmchHsXi0bT815oo
Message-ID: <CABvxksw3uvsH7Nz=4Xx4aT0CRvq=1M-bcsA=_jbdarXtROCKBg@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773422482; x=1774027282; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/AhDtpFnAxHobQkQLXEnQqD2Oj/iBNk+I6o1yIVMG7Q=;
 b=OkutaLybLkk/Mq194vV+deF9E6iGDrDyTtolSxNkxRjMBNLHFfW6eYHx5uCXym+hxA
 9+8JbHScp0d5XMxl7sLJHaA7b+xzJ2+97MyNfrVoegr5+X2vong6JnMt6W36kr2wXXoQ
 PpDqeT9kpKrcQCbDPv3GG7VajRHz/KAwVxOcn4ti2mn09ZKtYyLlWO5tsbayZqDa08/X
 LhSs63CYm6aqdbjr7/2zsfl1DpN4qEH1J2ttRmEICnkix4tB+2ERoCmuNloIVm8d97am
 8uWFCkWJeL/ATch8+QTNPsG0tUFSBdOjBxE31ff1YDrUzeEKdSdHN/UfV/lKAGtyYkFY
 GTjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OkutaLyb
Subject: Re: [Buildroot] [PATCH] package/host-ccache: force use of
 BR_CACHE_DIR instead of user directories
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
Content-Type: multipart/mixed; boundary="===============5226435044250599303=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5226435044250599303==
Content-Type: multipart/alternative; boundary="0000000000000bbf59064ceb19a6"

--0000000000000bbf59064ceb19a6
Content-Type: text/plain; charset="UTF-8"

Hi Fiona,

Thank you for the review and for raising this important point.

You're absolutely correct - the existing HOST_CCACHE_PATCH_CONFIGURATION
approach does work and achieves the same functional goal. This patch is
primarily a maintainability improvement rather than fixing a specific bug.

My rationale for proposing this change was:

   1. *Maintainability*: A proper patch file is easier to maintain across
   ccache version updates than runtime sed commands, which can silently
   break if the source code structure changes.
   2. *Transparency*: Having the modifications as a formal patch file makes
   the changes more visible and reviewable.
   3. *Potential upstream path*: A well-formed patch could potentially be
   submitted upstream to ccache with a Buildroot-specific configuration option.

However, if the current sed-based approach is working well and is the
preferred method by the Buildroot maintainers, I'm happy to withdraw this
patch. I don't want to introduce unnecessary churn if the existing solution
is adequate.

Please let me know your preference. If you'd like me to proceed, I can add
more context to the commit message explaining the maintenance benefits.
Otherwise, I'll withdraw the patch.

Best regards, Shubham


On Fri, 13 Mar, 2026, 10:36 pm Fiona Klute, <fiona.klute@gmx.de> wrote:

> Am 13.03.26 um 13:07 schrieb Shubham Chakraborty:
> > Override ccache's default cache directory paths to use Buildroot's
> > BR_CACHE_DIR environment variable instead of CCACHE_DIR and XDG
> > standard directories.
> >
> > By default, ccache stores its cache in user home directories
> > (~/.ccache, ~/.cache/ccache, ~/.config/ccache) based on XDG_CACHE_HOME
> > and XDG_CONFIG_HOME environment variables. This causes issues in
> > Buildroot because:
> >
> >   - Pollutes user home directories during builds
> >   - Breaks reproducibility across different build environments
> >   - Complicates cache management in CI/CD systems
> >   - May cause permission issues in shared build systems
>
> Under what circumstances can these issues appear? I've done many
> Buildroot builds with CCache enabled and haven't encountered any of
> them. HOST_CCACHE_PATCH_CONFIGURATION should already be doing what you
> describe as the purpose of the new patch, if that's not working
> understanding why seems important.
>
> Best regards,
> Fiona
>
> > This patch modifies ccache source to:
> >   - Replace util::getenv_path("CCACHE_DIR") with "BR_CACHE_DIR"
> >   - Replace hardcoded paths (.ccache, .cache/ccache, .config/ccache)
> >     with Buildroot's HOST_CCACHE_DEFAULT_CCACHE_DIR
> >   - Disable XDG_CACHE_HOME, XDG_CONFIG_HOME, and XDG_RUNTIME_DIR lookups
> >   - Update command-line option handling to use BR_CACHE_DIR
> >
> > This ensures ccache respects Buildroot's cache directory configuration
> > and avoids user home directory pollution.
> >
> > Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> > ---
> >   ...ost-ccache-force-use-of-BR_CACHE_DIR.patch | 108 ++++++++++++++++++
> >   package/ccache/ccache.mk                      |  11 +-
> >   2 files changed, 110 insertions(+), 9 deletions(-)
> >   create mode 100644
> package/ccache/0001-package-host-ccache-force-use-of-BR_CACHE_DIR.patch
> >
> > diff --git
> a/package/ccache/0001-package-host-ccache-force-use-of-BR_CACHE_DIR.patch
> b/package/ccache/0001-package-host-ccache-force-use-of-BR_CACHE_DIR.patch
> > new file mode 100644
> > index 0000000000..a990c43dd2
> > --- /dev/null
> > +++
> b/package/ccache/0001-package-host-ccache-force-use-of-BR_CACHE_DIR.patch
> > @@ -0,0 +1,108 @@
> > +From 5140c64cdd2d469ff5be7f94cc11de928cbe585a Mon Sep 17 00:00:00 2001
> > +From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> > +Date: Fri, 13 Mar 2026 15:38:53 +0530
> > +Subject: [PATCH] package/host-ccache: force use of BR_CACHE_DIR.
> > +
> > +Override ccache's default cache directory paths to use Buildroot's
> > +BR_CACHE_DIR environment variable instead of CCACHE_DIR and XDG
> > +standard directories.
> > +
> > +By default, ccache stores its cache in user home directories
> > +(~/.ccache, ~/.cache/ccache, ~/.config/ccache) based on XDG_CACHE_HOME
> > +and XDG_CONFIG_HOME environment variables. This causes issues in
> > +Buildroot because:
> > +
> > + - Pollutes user home directories during builds
> > + - Breaks reproducibility across different build environments
> > + - Complicates cache management in CI/CD systems
> > + - May cause permission issues in shared build systems
> > +
> > +This patch modifies ccache source to:
> > + - Replace util::getenv_path("CCACHE_DIR") with "BR_CACHE_DIR"
> > + - Replace hardcoded paths (.ccache, .cache/ccache, .config/ccache)
> > +   with Buildroot's HOST_CCACHE_DEFAULT_CCACHE_DIR
> > + - Disable XDG_CACHE_HOME, XDG_CONFIG_HOME, and XDG_RUNTIME_DIR lookups
> > + - Update command-line option handling to use BR_CACHE_DIR
> > +
> > +This ensures ccache respects Buildroot's cache directory configuration
> > +and avoids user home directory pollution.
> > +
> > +Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> > +---
> > + src/ccache/config.cpp           | 14 +++++++-------
> > + src/ccache/core/mainoptions.cpp |  2 +-
> > + 2 files changed, 8 insertions(+), 8 deletions(-)
> > +
> > +diff --git a/src/ccache/config.cpp b/src/ccache/config.cpp
> > +index a4f67d8..1a6e130 100644
> > +--- a/src/ccache/config.cpp
> > ++++ b/src/ccache/config.cpp
> > +@@ -500,7 +500,7 @@ default_cache_dir(const fs::path& home_dir)
> > + #  ifdef __APPLE__
> > +   return home_dir / "Library/Caches/ccache";
> > + #  else
> > +-  return home_dir / ".cache/ccache";
> > ++  return home_dir / HOST_CCACHE_DEFAULT_CCACHE_DIR;
> > + #  endif
> > + }
> > +
> > +@@ -510,7 +510,7 @@ default_config_dir(const fs::path& home_dir)
> > + #  ifdef __APPLE__
> > +   return home_dir / "Library/Preferences/ccache";
> > + #  else
> > +-  return home_dir / ".config/ccache";
> > ++  return home_dir / HOST_CCACHE_DEFAULT_CCACHE_DIR;
> > + #  endif
> > + }
> > +
> > +@@ -598,13 +598,13 @@ Config::read(const std::vector<std::string>&
> cmdline_config_settings)
> > +     create_cmdline_settings_map(cmdline_config_settings);
> > +
> > +   const fs::path home_dir = home_directory();
> > +-  const util::DirEntry legacy_ccache_dir = home_dir / ".ccache";
> > ++  const util::DirEntry legacy_ccache_dir = home_dir /
> HOST_CCACHE_DEFAULT_CCACHE_DIR;
> > + #ifdef _WIN32
> > +   auto env_appdata = util::getenv_path("APPDATA");
> > +   auto env_local_appdata = util::getenv_path("LOCALAPPDATA");
> > + #else
> > +-  auto env_xdg_cache_home = util::getenv_path("XDG_CACHE_HOME");
> > +-  auto env_xdg_config_home = util::getenv_path("XDG_CONFIG_HOME");
> > ++  auto env_xdg_cache_home = std::optional<fs::path>(std::nullopt);
> > ++  auto env_xdg_config_home = std::optional<fs::path>(std::nullopt);
> > + #endif
> > +
> > +   auto env_ccache_configpath = util::getenv_path("CCACHE_CONFIGPATH");
> > +@@ -627,7 +627,7 @@ Config::read(const std::vector<std::string>&
> cmdline_config_settings)
> > +     // A missing config file in SYSCONFDIR is OK so don't check return
> value.
> > +     update_from_file(system_config_path());
> > +
> > +-    auto env_ccache_dir = util::getenv_path("CCACHE_DIR");
> > ++    auto env_ccache_dir = util::getenv_path("BR_CACHE_DIR");
> > +     auto cmdline_cache_dir = cmdline_settings_map.find("cache_dir");
> > +
> > +     fs::path config_dir;
> > +@@ -1232,7 +1232,7 @@ Config::default_temporary_dir() const
> > + {
> > +   static const fs::path run_user_tmp_dir = [] {
> > + #ifndef _WIN32
> > +-    const char* const xdg_runtime_dir = getenv("XDG_RUNTIME_DIR");
> > ++    const char* const xdg_runtime_dir = nullptr;
> > +     if (xdg_runtime_dir && DirEntry(xdg_runtime_dir).is_directory()) {
> > +       fs::path dir = FMT("{}/ccache-tmp", xdg_runtime_dir);
> > +       if (fs::create_directories(dir) && access(dir.c_str(), W_OK) ==
> 0) {
> > +diff --git a/src/ccache/core/mainoptions.cpp
> b/src/ccache/core/mainoptions.cpp
> > +index d253ebc..9ad2824 100644
> > +--- a/src/ccache/core/mainoptions.cpp
> > ++++ b/src/ccache/core/mainoptions.cpp
> > +@@ -527,7 +527,7 @@ process_main_options(int argc, const char* const*
> argv)
> > +
> > +     switch (c) {
> > +     case 'd': // --dir
> > +-      util::setenv("CCACHE_DIR", arg);
> > ++      util::setenv("BR_CACHE_DIR", arg);
> > +       break;
> > +     case FORMAT:
> > +       if (arg == "tab") {
> > +--
> > +2.53.0
> > +
> > diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
> > index 30f87f7d90..f2f73a115d 100644
> > --- a/package/ccache/ccache.mk
> > +++ b/package/ccache/ccache.mk
> > @@ -42,16 +42,9 @@ HOST_CCACHE_CONF_OPTS += \
> >   #    so rewrite BR_CACHE_DIR to take that into consideration for SDK
> purpose
> >   HOST_CCACHE_DEFAULT_CCACHE_DIR = $(patsubst
> $(HOME)/%,%,$(BR_CACHE_DIR))
> >
> > -define HOST_CCACHE_PATCH_CONFIGURATION
> > -     sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),'
> $(@D)/src/ccache/config.cpp
> > -     sed -i 's,".ccache","$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",'
> $(@D)/src/ccache/config.cpp
> > -     sed -i 's,"/.cache/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",'
> $(@D)/src/ccache/config.cpp
> > -     sed -i 's,"/.config/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",'
> $(@D)/src/ccache/config.cpp
> > -     sed -i 's,getenv("XDG_CACHE_HOME"),nullptr,'
> $(@D)/src/ccache/config.cpp
> > -     sed -i 's,getenv("XDG_CONFIG_HOME"),nullptr,'
> $(@D)/src/ccache/config.cpp
> > -endef
> > +HOST_CCACHE_CONF_OPTS += \
> > +     -DCMAKE_CXX_FLAGS='$(HOST_CXXFLAGS)
> -DHOST_CCACHE_DEFAULT_CCACHE_DIR=\"$(HOST_CCACHE_DEFAULT_CCACHE_DIR)\"'
> >
> > -HOST_CCACHE_POST_PATCH_HOOKS += HOST_CCACHE_PATCH_CONFIGURATION
> >
> >   define HOST_CCACHE_MAKE_CACHE_DIR
> >       mkdir -p $(BR_CACHE_DIR)
>
>

--0000000000000bbf59064ceb19a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-font-claude-response-body gmail-break-wo=
rds gmail-whitespace-normal gmail-leading-[1.7]">Hi Fiona,</p>
<p class=3D"gmail-font-claude-response-body gmail-break-words gmail-whitesp=
ace-normal gmail-leading-[1.7]">Thank you for the review and for raising th=
is important point.</p>
<p class=3D"gmail-font-claude-response-body gmail-break-words gmail-whitesp=
ace-normal gmail-leading-[1.7]">You&#39;re absolutely correct - the existin=
g <code class=3D"gmail-bg-text-200/5 gmail-border gmail-border-0.5 gmail-bo=
rder-border-300 gmail-text-danger-000 gmail-whitespace-pre-wrap gmail-round=
ed-[0.4rem] gmail-px-1 gmail-py-px gmail-text-[0.9rem]">HOST_CCACHE_PATCH_C=
ONFIGURATION</code> approach does work and achieves the same functional goa=
l. This patch is primarily a maintainability improvement rather than fixing=
 a specific bug.</p>
<p class=3D"gmail-font-claude-response-body gmail-break-words gmail-whitesp=
ace-normal gmail-leading-[1.7]">My rationale for proposing this change was:=
</p>
<ol class=3D"gmail-[li_&amp;]:mb-0 gmail-[li_&amp;]:mt-1 gmail-[li_&amp;]:g=
ap-1 gmail-[&amp;:not(:last-child)_ul]:pb-1 gmail-[&amp;:not(:last-child)_o=
l]:pb-1 gmail-list-decimal gmail-flex gmail-flex-col gmail-gap-1 gmail-pl-8=
 gmail-mb-3">
<li class=3D"gmail-whitespace-normal gmail-break-words gmail-pl-2"><strong>=
Maintainability</strong>: A proper patch file is easier to maintain across =
ccache version updates than runtime <code class=3D"gmail-bg-text-200/5 gmai=
l-border gmail-border-0.5 gmail-border-border-300 gmail-text-danger-000 gma=
il-whitespace-pre-wrap gmail-rounded-[0.4rem] gmail-px-1 gmail-py-px gmail-=
text-[0.9rem]">sed</code> commands, which can silently break if the source =
code structure changes.</li>
<li class=3D"gmail-whitespace-normal gmail-break-words gmail-pl-2"><strong>=
Transparency</strong>: Having the modifications as a formal patch file make=
s the changes more visible and reviewable.</li>
<li class=3D"gmail-whitespace-normal gmail-break-words gmail-pl-2"><strong>=
Potential upstream path</strong>: A well-formed patch could potentially be =
submitted upstream to ccache with a Buildroot-specific configuration option=
.</li>
</ol>
<p class=3D"gmail-font-claude-response-body gmail-break-words gmail-whitesp=
ace-normal gmail-leading-[1.7]">However, if the current <code class=3D"gmai=
l-bg-text-200/5 gmail-border gmail-border-0.5 gmail-border-border-300 gmail=
-text-danger-000 gmail-whitespace-pre-wrap gmail-rounded-[0.4rem] gmail-px-=
1 gmail-py-px gmail-text-[0.9rem]">sed</code>-based approach is working wel=
l and is the preferred method by the Buildroot maintainers, I&#39;m happy t=
o withdraw this patch. I don&#39;t want to introduce unnecessary churn if t=
he existing solution is adequate.</p>
<p class=3D"gmail-font-claude-response-body gmail-break-words gmail-whitesp=
ace-normal gmail-leading-[1.7]">Please let me know your preference. If you&=
#39;d like me to proceed, I can add more context to the commit message expl=
aining the maintenance benefits. Otherwise, I&#39;ll withdraw the patch.</p=
>
<p class=3D"gmail-font-claude-response-body gmail-break-words gmail-whitesp=
ace-pre-wrap gmail-leading-[1.7]">Best regards,
Shubham</p></div><div dir=3D"auto"><br></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 13 Mar, 2026, 10:36 pm Fiona=
 Klute, &lt;<a href=3D"mailto:fiona.klute@gmx.de" target=3D"_blank">fiona.k=
lute@gmx.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Am 13.03.26 um 13:07 schrieb Shubham Chakraborty:<br>
&gt; Override ccache&#39;s default cache directory paths to use Buildroot&#=
39;s<br>
&gt; BR_CACHE_DIR environment variable instead of CCACHE_DIR and XDG<br>
&gt; standard directories.<br>
&gt; <br>
&gt; By default, ccache stores its cache in user home directories<br>
&gt; (~/.ccache, ~/.cache/ccache, ~/.config/ccache) based on XDG_CACHE_HOME=
<br>
&gt; and XDG_CONFIG_HOME environment variables. This causes issues in<br>
&gt; Buildroot because:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0- Pollutes user home directories during builds<br>
&gt;=C2=A0 =C2=A0- Breaks reproducibility across different build environmen=
ts<br>
&gt;=C2=A0 =C2=A0- Complicates cache management in CI/CD systems<br>
&gt;=C2=A0 =C2=A0- May cause permission issues in shared build systems<br>
<br>
Under what circumstances can these issues appear? I&#39;ve done many <br>
Buildroot builds with CCache enabled and haven&#39;t encountered any of <br=
>
them. HOST_CCACHE_PATCH_CONFIGURATION should already be doing what you <br>
describe as the purpose of the new patch, if that&#39;s not working <br>
understanding why seems important.<br>
<br>
Best regards,<br>
Fiona<br>
<br>
&gt; This patch modifies ccache source to:<br>
&gt;=C2=A0 =C2=A0- Replace util::getenv_path(&quot;CCACHE_DIR&quot;) with &=
quot;BR_CACHE_DIR&quot;<br>
&gt;=C2=A0 =C2=A0- Replace hardcoded paths (.ccache, .cache/ccache, .config=
/ccache)<br>
&gt;=C2=A0 =C2=A0 =C2=A0with Buildroot&#39;s HOST_CCACHE_DEFAULT_CCACHE_DIR=
<br>
&gt;=C2=A0 =C2=A0- Disable XDG_CACHE_HOME, XDG_CONFIG_HOME, and XDG_RUNTIME=
_DIR lookups<br>
&gt;=C2=A0 =C2=A0- Update command-line option handling to use BR_CACHE_DIR<=
br>
&gt; <br>
&gt; This ensures ccache respects Buildroot&#39;s cache directory configura=
tion<br>
&gt; and avoids user home directory pollution.<br>
&gt; <br>
&gt; Signed-off-by: Shubham Chakraborty &lt;<a href=3D"mailto:chakrabortysh=
ubham66@gmail.com" rel=3D"noreferrer" target=3D"_blank">chakrabortyshubham6=
6@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0...ost-ccache-force-use-of-BR_CACHE_DIR.patch | 108 ++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A0package/ccache/<a href=3D"http://ccache.mk" rel=3D"norefer=
rer noreferrer" target=3D"_blank">ccache.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 11 +-<br>
&gt;=C2=A0 =C2=A02 files changed, 110 insertions(+), 9 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 package/ccache/0001-package-host-ccache=
-force-use-of-BR_CACHE_DIR.patch<br>
&gt; <br>
&gt; diff --git a/package/ccache/0001-package-host-ccache-force-use-of-BR_C=
ACHE_DIR.patch b/package/ccache/0001-package-host-ccache-force-use-of-BR_CA=
CHE_DIR.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a990c43dd2<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/ccache/0001-package-host-ccache-force-use-of-BR_CACHE_DI=
R.patch<br>
&gt; @@ -0,0 +1,108 @@<br>
&gt; +From 5140c64cdd2d469ff5be7f94cc11de928cbe585a Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Shubham Chakraborty &lt;<a href=3D"mailto:chakrabortyshubham66@=
gmail.com" rel=3D"noreferrer" target=3D"_blank">chakrabortyshubham66@gmail.=
com</a>&gt;<br>
&gt; +Date: Fri, 13 Mar 2026 15:38:53 +0530<br>
&gt; +Subject: [PATCH] package/host-ccache: force use of BR_CACHE_DIR.<br>
&gt; +<br>
&gt; +Override ccache&#39;s default cache directory paths to use Buildroot&=
#39;s<br>
&gt; +BR_CACHE_DIR environment variable instead of CCACHE_DIR and XDG<br>
&gt; +standard directories.<br>
&gt; +<br>
&gt; +By default, ccache stores its cache in user home directories<br>
&gt; +(~/.ccache, ~/.cache/ccache, ~/.config/ccache) based on XDG_CACHE_HOM=
E<br>
&gt; +and XDG_CONFIG_HOME environment variables. This causes issues in<br>
&gt; +Buildroot because:<br>
&gt; +<br>
&gt; + - Pollutes user home directories during builds<br>
&gt; + - Breaks reproducibility across different build environments<br>
&gt; + - Complicates cache management in CI/CD systems<br>
&gt; + - May cause permission issues in shared build systems<br>
&gt; +<br>
&gt; +This patch modifies ccache source to:<br>
&gt; + - Replace util::getenv_path(&quot;CCACHE_DIR&quot;) with &quot;BR_CA=
CHE_DIR&quot;<br>
&gt; + - Replace hardcoded paths (.ccache, .cache/ccache, .config/ccache)<b=
r>
&gt; +=C2=A0 =C2=A0with Buildroot&#39;s HOST_CCACHE_DEFAULT_CCACHE_DIR<br>
&gt; + - Disable XDG_CACHE_HOME, XDG_CONFIG_HOME, and XDG_RUNTIME_DIR looku=
ps<br>
&gt; + - Update command-line option handling to use BR_CACHE_DIR<br>
&gt; +<br>
&gt; +This ensures ccache respects Buildroot&#39;s cache directory configur=
ation<br>
&gt; +and avoids user home directory pollution.<br>
&gt; +<br>
&gt; +Signed-off-by: Shubham Chakraborty &lt;<a href=3D"mailto:chakrabortys=
hubham66@gmail.com" rel=3D"noreferrer" target=3D"_blank">chakrabortyshubham=
66@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/ccache/config.cpp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 +=
++++++-------<br>
&gt; + src/ccache/core/mainoptions.cpp |=C2=A0 2 +-<br>
&gt; + 2 files changed, 8 insertions(+), 8 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/ccache/config.cpp b/src/ccache/config.cpp<br>
&gt; +index a4f67d8..1a6e130 100644<br>
&gt; +--- a/src/ccache/config.cpp<br>
&gt; ++++ b/src/ccache/config.cpp<br>
&gt; +@@ -500,7 +500,7 @@ default_cache_dir(const fs::path&amp; home_dir)<b=
r>
&gt; + #=C2=A0 ifdef __APPLE__<br>
&gt; +=C2=A0 =C2=A0return home_dir / &quot;Library/Caches/ccache&quot;;<br>
&gt; + #=C2=A0 else<br>
&gt; +-=C2=A0 return home_dir / &quot;.cache/ccache&quot;;<br>
&gt; ++=C2=A0 return home_dir / HOST_CCACHE_DEFAULT_CCACHE_DIR;<br>
&gt; + #=C2=A0 endif<br>
&gt; + }<br>
&gt; +<br>
&gt; +@@ -510,7 +510,7 @@ default_config_dir(const fs::path&amp; home_dir)<=
br>
&gt; + #=C2=A0 ifdef __APPLE__<br>
&gt; +=C2=A0 =C2=A0return home_dir / &quot;Library/Preferences/ccache&quot;=
;<br>
&gt; + #=C2=A0 else<br>
&gt; +-=C2=A0 return home_dir / &quot;.config/ccache&quot;;<br>
&gt; ++=C2=A0 return home_dir / HOST_CCACHE_DEFAULT_CCACHE_DIR;<br>
&gt; + #=C2=A0 endif<br>
&gt; + }<br>
&gt; +<br>
&gt; +@@ -598,13 +598,13 @@ Config::read(const std::vector&lt;std::string&g=
t;&amp; cmdline_config_settings)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0create_cmdline_settings_map(cmdline_config_settin=
gs);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0const fs::path home_dir =3D home_directory();<br>
&gt; +-=C2=A0 const util::DirEntry legacy_ccache_dir =3D home_dir / &quot;.=
ccache&quot;;<br>
&gt; ++=C2=A0 const util::DirEntry legacy_ccache_dir =3D home_dir / HOST_CC=
ACHE_DEFAULT_CCACHE_DIR;<br>
&gt; + #ifdef _WIN32<br>
&gt; +=C2=A0 =C2=A0auto env_appdata =3D util::getenv_path(&quot;APPDATA&quo=
t;);<br>
&gt; +=C2=A0 =C2=A0auto env_local_appdata =3D util::getenv_path(&quot;LOCAL=
APPDATA&quot;);<br>
&gt; + #else<br>
&gt; +-=C2=A0 auto env_xdg_cache_home =3D util::getenv_path(&quot;XDG_CACHE=
_HOME&quot;);<br>
&gt; +-=C2=A0 auto env_xdg_config_home =3D util::getenv_path(&quot;XDG_CONF=
IG_HOME&quot;);<br>
&gt; ++=C2=A0 auto env_xdg_cache_home =3D std::optional&lt;fs::path&gt;(std=
::nullopt);<br>
&gt; ++=C2=A0 auto env_xdg_config_home =3D std::optional&lt;fs::path&gt;(st=
d::nullopt);<br>
&gt; + #endif<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0auto env_ccache_configpath =3D util::getenv_path(&quot;C=
CACHE_CONFIGPATH&quot;);<br>
&gt; +@@ -627,7 +627,7 @@ Config::read(const std::vector&lt;std::string&gt;=
&amp; cmdline_config_settings)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// A missing config file in SYSCONFDIR is OK so d=
on&#39;t check return value.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0update_from_file(system_config_path());<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 auto env_ccache_dir =3D util::getenv_path(&quot;CCACHE=
_DIR&quot;);<br>
&gt; ++=C2=A0 =C2=A0 auto env_ccache_dir =3D util::getenv_path(&quot;BR_CAC=
HE_DIR&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0auto cmdline_cache_dir =3D cmdline_settings_map.f=
ind(&quot;cache_dir&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fs::path config_dir;<br>
&gt; +@@ -1232,7 +1232,7 @@ Config::default_temporary_dir() const<br>
&gt; + {<br>
&gt; +=C2=A0 =C2=A0static const fs::path run_user_tmp_dir =3D [] {<br>
&gt; + #ifndef _WIN32<br>
&gt; +-=C2=A0 =C2=A0 const char* const xdg_runtime_dir =3D getenv(&quot;XDG=
_RUNTIME_DIR&quot;);<br>
&gt; ++=C2=A0 =C2=A0 const char* const xdg_runtime_dir =3D nullptr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (xdg_runtime_dir &amp;&amp; DirEntry(xdg_runti=
me_dir).is_directory()) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fs::path dir =3D FMT(&quot;{}/ccache-tmp&q=
uot;, xdg_runtime_dir);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fs::create_directories(dir) &amp;&amp;=
 access(dir.c_str(), W_OK) =3D=3D 0) {<br>
&gt; +diff --git a/src/ccache/core/mainoptions.cpp b/src/ccache/core/mainop=
tions.cpp<br>
&gt; +index d253ebc..9ad2824 100644<br>
&gt; +--- a/src/ccache/core/mainoptions.cpp<br>
&gt; ++++ b/src/ccache/core/mainoptions.cpp<br>
&gt; +@@ -527,7 +527,7 @@ process_main_options(int argc, const char* const*=
 argv)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (c) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case &#39;d&#39;: // --dir<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 util::setenv(&quot;CCACHE_DIR&quot;, arg);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 util::setenv(&quot;BR_CACHE_DIR&quot;, arg);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case FORMAT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (arg =3D=3D &quot;tab&quot;) {<br>
&gt; +--<br>
&gt; +2.53.0<br>
&gt; +<br>
&gt; diff --git a/package/ccache/<a href=3D"http://ccache.mk" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">ccache.mk</a> b/package/ccache/<a href=
=3D"http://ccache.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">ccach=
e.mk</a><br>
&gt; index 30f87f7d90..f2f73a115d 100644<br>
&gt; --- a/package/ccache/<a href=3D"http://ccache.mk" rel=3D"noreferrer no=
referrer" target=3D"_blank">ccache.mk</a><br>
&gt; +++ b/package/ccache/<a href=3D"http://ccache.mk" rel=3D"noreferrer no=
referrer" target=3D"_blank">ccache.mk</a><br>
&gt; @@ -42,16 +42,9 @@ HOST_CCACHE_CONF_OPTS +=3D \<br>
&gt;=C2=A0 =C2=A0#=C2=A0 =C2=A0 so rewrite BR_CACHE_DIR to take that into c=
onsideration for SDK purpose<br>
&gt;=C2=A0 =C2=A0HOST_CCACHE_DEFAULT_CCACHE_DIR =3D $(patsubst $(HOME)/%,%,=
$(BR_CACHE_DIR))<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -define HOST_CCACHE_PATCH_CONFIGURATION<br>
&gt; -=C2=A0 =C2=A0 =C2=A0sed -i &#39;s,getenv(&quot;CCACHE_DIR&quot;),gete=
nv(&quot;BR_CACHE_DIR&quot;),&#39; $(@D)/src/ccache/config.cpp<br>
&gt; -=C2=A0 =C2=A0 =C2=A0sed -i &#39;s,&quot;.ccache&quot;,&quot;$(HOST_CC=
ACHE_DEFAULT_CCACHE_DIR)&quot;,&#39; $(@D)/src/ccache/config.cpp<br>
&gt; -=C2=A0 =C2=A0 =C2=A0sed -i &#39;s,&quot;/.cache/ccache&quot;,&quot;/$=
(HOST_CCACHE_DEFAULT_CCACHE_DIR)&quot;,&#39; $(@D)/src/ccache/config.cpp<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0sed -i &#39;s,&quot;/.config/ccache&quot;,&quot;/=
$(HOST_CCACHE_DEFAULT_CCACHE_DIR)&quot;,&#39; $(@D)/src/ccache/config.cpp<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0sed -i &#39;s,getenv(&quot;XDG_CACHE_HOME&quot;),=
nullptr,&#39; $(@D)/src/ccache/config.cpp<br>
&gt; -=C2=A0 =C2=A0 =C2=A0sed -i &#39;s,getenv(&quot;XDG_CONFIG_HOME&quot;)=
,nullptr,&#39; $(@D)/src/ccache/config.cpp<br>
&gt; -endef<br>
&gt; +HOST_CCACHE_CONF_OPTS +=3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-DCMAKE_CXX_FLAGS=3D&#39;$(HOST_CXXFLAGS) -DHOST_=
CCACHE_DEFAULT_CCACHE_DIR=3D\&quot;$(HOST_CCACHE_DEFAULT_CCACHE_DIR)\&quot;=
&#39;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -HOST_CCACHE_POST_PATCH_HOOKS +=3D HOST_CCACHE_PATCH_CONFIGURATION<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0define HOST_CCACHE_MAKE_CACHE_DIR<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p $(BR_CACHE_DIR)<br>
<br>
</blockquote></div>

--0000000000000bbf59064ceb19a6--

--===============5226435044250599303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5226435044250599303==--
