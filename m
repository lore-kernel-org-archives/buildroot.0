Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315BBCAC5B0
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 023B94169A;
	Thu, 25 Sep 2025 20:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1njneV1OIqy; Thu, 25 Sep 2025 20:17:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E9F241686
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E9F241686;
	Thu, 25 Sep 2025 20:17:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1782B177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14264411E9
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7s_pw7tUxcH for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:16:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 15AD54152E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15AD54152E
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15AD54152E
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:53 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e1cc6299cso13522265e9.1
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:16:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831412; x=1759436212;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oDttSzIyq9NWXyH0DatXzh4KCgg6qA30EGLv91zSIIY=;
 b=ALwJVbOnoVN5gC9viCd3+WpvDuHArxe4vKJIxLWVuSfVf8Vwx8fPGsbVYKXODaJywF
 zvv2I+j+dJVi7VHfdB5DRRp9CZvpegCqRCdNy9rynC25oYx9j0+51r8G40O/saplPtAV
 fXWlPzFm4XMiSF8QDfabdNDNiUi1FL3TRIcS/HNVd1y+XzEeFu5pwTkrg67zmoJPoZuv
 LCvzsPLp2v52uGuJgEpRgB0wMGeM84Ctj95keyxz66z6DKI0rGBUR4g4i/MkocmmfYZP
 SjZ/INX8qbzK7rGzStfzNcbKuSgvEWOel4CIWLPtx3GSR3nVlUb+H7ffI+WlTOkhO+7Y
 Zapg==
X-Gm-Message-State: AOJu0YwEXNJPI7QcinRFpyvXDYXRX1Yd5NT/DcQZXaArgx56P8Cwrnpq
 W3h7e5bbdk0GwK3zUC95FwO6BPYn/tgGJLd07mhPKPiWpZ4OIgW8Fa8eJ3D+NJac+2I=
X-Gm-Gg: ASbGncsJ01WLJUSLhAg/2oHCeQFH0D/nzPWsMrvOrHiLrjQY7dVmXfFF5/mBkDJAwQN
 qOCa/Dj9r1aPEa3J52dEIw6UXfhfhSsXJPfY144IEg/lUpf4MvXVkJF/ADV1f+ZY6/XypdLljlK
 ysfYEozN6RedFpKEQPH52w1X9r7xjjA8tGK2WMSKnFFT6baoh8CWoR6n38YU299zrQRL8DGIZOD
 6Qbv8BXdoYi47lNZVhkw+fXxn5MD1HzUSPr8ZaNUs3FkNEAv27elieNg6YTdCwZrIQagim7GQLm
 OphuNHrrzlsO8uP345nhrCUo5kmFNc74nlf5kTdLm05+8wPXEae4BkxQLSHcukoLT/kZkBnGatZ
 FaHlD5fkmzwEDvJU=
X-Google-Smtp-Source: AGHT+IGvPswlV51y9UH4oZKS7GXT1JhYegzAeWQkzruDDNBAM6w/3ShUU/Y5T+nRQLyYd5NI8yK/vw==
X-Received: by 2002:a05:600c:8484:b0:46e:1abc:1811 with SMTP id
 5b1f17b1804b1-46e329f653emr36928445e9.27.1758831412147; 
 Thu, 25 Sep 2025 13:16:52 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e330fbcc5sm23598505e9.4.2025.09.25.13.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:16:51 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:16:51 +0200
Message-ID: <20250925201651.43806-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250917185344.2881523-1-thomas.perale@mind.be>
References: <20250917185344.2881523-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831412; x=1759436212; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oDttSzIyq9NWXyH0DatXzh4KCgg6qA30EGLv91zSIIY=;
 b=S1BRVYQtpFm1ukcUn0Nxy3m4WstHhe3Q7cU2uLHMXPfe6831qMDcguwyxCBtlmHa0x
 UP9CokP1eO9C3Y8Xh0wRuZTPKyTqbSCwMGsI/SRZdt0xRzryxSa4C0A7mQUQNrBFvuyI
 lWnhYobzzdGoek89o3L6m+eKzuja5GouHEyFY49R2sNf+iI7+oQZmdH76M7wAsjdSBzn
 PsR/S29NLk76Xgth1rGxx9fzSI0+rcOi3H4tDBxnp3dhj+GgbaGp3nHd9geqpiLdGhzz
 QpCHBltfDgwvjq3UHoV1iA8tDfgK7fZzYBua1WeecV+La3WZvgglVyanNKi+Z6v+q/UC
 novQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S1BRVYQt
Subject: Re: [Buildroot] [PATCH 1/1] package/lua/5.1.5: add patch for
 CVE-2014-5461
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
> This CVE is specific for the version 5.1.5 still present in Buildroot.
> It has been fixed in 5.2.3 and thereby doesn't affects the other
> versions available in Buildroot.
> 
> - CVE-2014-5461
> 
> Buffer overflow in the vararg functions in ldo.c in Lua 5.1 through
> 5.2.x before 5.2.3 allows context-dependent attackers to cause a denial
> of service (crash) via a small number of arguments to a function with a
> large number of fixed arguments.
> 
> For more information see:
>   - https://security-tracker.debian.org/tracker/CVE-2014-5461
>   - https://udd.debian.org/patches.cgi?src=lua5.1&version=5.1.5-11
> 
> A patch present in Debian is used to address this vulnerability.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  ...x-stack-overflow-in-vararg-functions.patch | 24 +++++++++++++++++++
>  package/lua/lua.mk                            |  6 +++++
>  2 files changed, 30 insertions(+)
>  create mode 100644 package/lua/5.1.5/0003-Fix-stack-overflow-in-vararg-functions.patch
> 
> diff --git a/package/lua/5.1.5/0003-Fix-stack-overflow-in-vararg-functions.patch b/package/lua/5.1.5/0003-Fix-stack-overflow-in-vararg-functions.patch
> new file mode 100644
> index 0000000000..00142d2338
> --- /dev/null
> +++ b/package/lua/5.1.5/0003-Fix-stack-overflow-in-vararg-functions.patch
> @@ -0,0 +1,24 @@
> +From: Enrico Tassi <gareuselesinge@debian.org>
> +Date: Tue, 26 Aug 2014 16:20:55 +0200
> +Subject: Fix stack overflow in vararg functions
> +
> +CVE: CVE-2014-5461
> +Upstream: https://sources.debian.org/data/main/l/lua5.1/5.1.5-11/debian/patches/0004-Fix-stack-overflow-in-vararg-functions.patch
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/ldo.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/ldo.c b/src/ldo.c
> +index d1bf786..30333bf 100644
> +--- a/src/ldo.c
> ++++ b/src/ldo.c
> +@@ -274,7 +274,7 @@ int luaD_precall (lua_State *L, StkId func, int nresults) {
> +     CallInfo *ci;
> +     StkId st, base;
> +     Proto *p = cl->p;
> +-    luaD_checkstack(L, p->maxstacksize);
> ++    luaD_checkstack(L, p->maxstacksize + p->numparams);
> +     func = restorestack(L, funcr);
> +     if (!p->is_vararg) {  /* no varargs? */
> +       base = func + 1;
> diff --git a/package/lua/lua.mk b/package/lua/lua.mk
> index 455b7e58b2..269eafe4bb 100644
> --- a/package/lua/lua.mk
> +++ b/package/lua/lua.mk
> @@ -21,6 +21,12 @@ LUA_LICENSE_FILES = COPYRIGHT
>  endif
>  LUA_CPE_ID_VENDOR = lua
>  
> +ifeq ($(BR2_PACKAGE_LUA_5_1),y)
> +# Only affect lua version 5.1.5
> +# 5.1.5/0003-Fix-stack-overflow-in-vararg-functions.patch
> +LUA_IGNORE_CVES += CVE-2014-5461
> +endif
> +
>  LUA_PROVIDES = luainterpreter
>  
>  LUA_CFLAGS = -Wall -fPIC -DLUA_USE_POSIX
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
