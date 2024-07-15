Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552ABC3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3040408C8;
	Mon, 15 Jul 2024 14:43:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HtdEMxoXqbdI; Mon, 15 Jul 2024 14:43:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7612040650
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7612040650;
	Mon, 15 Jul 2024 14:43:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E68EE1BF3AD
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DED848113D
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:43:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yDa4jnZh1ikg for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:43:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A877281131
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A877281131
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A877281131
 for <buildroot@busybox.net>; Mon, 15 Jul 2024 14:43:45 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-42797289c8bso32379995e9.0
 for <buildroot@busybox.net>; Mon, 15 Jul 2024 07:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721054623; x=1721659423;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dUNgXjYgbbV9pEKLILya94AQdP2mrx5YzBF9eMVBaEA=;
 b=NYU0xA1D3k2QqITc7DqBaWlqCLCk7WiwaQoq+6FYYHNDQfHFztJXVBlSp9pc4EvzNC
 /XIbd72USg52q0EigfxAWEKgXHvGiN1Za6tCl64XcIVbBl21Ba9BMey7RBS0yhfmVV8h
 eybzzIn3THEofBxriyz95UVLCmDzMJ5jI2Ax4jTBYGGaoFjcIEu5SG6AaTmfL//iUVHH
 tM2QjSMPXnuORBSy284Kd87FEzzZ3CVpgpy+5NwLYttKwVHa8/rlPey4ZfX2wAbwLnBg
 Grky8d4D6+dfwzJ2TMJQyd562pcGvC+8jGWehxpUgGkMCUiUsPb0yJcNlwUFejxBGujh
 RNSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyOxL8P8n5c/UInI6k+cOfhen/ifwNw1+c0+MXwBK9JPPQZBWQ9Ac7r5np86JDT9rOgWIxqc2pR/LYZunSxRitfwPjDIo=
X-Gm-Message-State: AOJu0Yx/P2IRgXWj0kL5jqZDYymmOquoUe1PvDmDm58sUqGUA+nHi75z
 9JgGJwuBSHgDoZ/25P+K+klN3XKA8xmkN9CHnEAyw1LizlnSdmzRfcZHTWgUadAnLT/QgODSpmu
 BDuo=
X-Google-Smtp-Source: AGHT+IEgQg0H7PmZdW4faOWeYYNhuV1unblgi1MfXimBwsxQVQWjzCa54sOsGLuUKY1C3aTALM1Abw==
X-Received: by 2002:a5d:548b:0:b0:362:c7b3:764c with SMTP id
 ffacd0b85a97d-367ceac47bfmr11969344f8f.48.1721054623344; 
 Mon, 15 Jul 2024 07:43:43 -0700 (PDT)
Received: from [10.8.0.42] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dafbf29sm6632470f8f.70.2024.07.15.07.43.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 07:43:42 -0700 (PDT)
Message-ID: <3c634a61-d74c-408c-b2f6-fe3695430702@mind.be>
Date: Mon, 15 Jul 2024 16:43:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Francois Perrad <francois.perrad@gadz.org>, buildroot@busybox.net
References: <20240715130940.470769-1-francois.perrad@gadz.org>
Content-Language: en-GB
In-Reply-To: <20240715130940.470769-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721054623; x=1721659423; darn=busybox.net;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dUNgXjYgbbV9pEKLILya94AQdP2mrx5YzBF9eMVBaEA=;
 b=SMezyx2IwS5dQubPo2oAMdrxei5cFtciBfxx2UZ5BkvYS4hTM35d3iJVJMZLo94JGa
 GvvjR3Z7lXCo8yxla1MOKRAJTd4LnpQvXNHmoS4OvJsIiR5q8gcUpy15xS9X9MzuDaFG
 fJ8GGHDcs3BDZyUZmea0kWuA5Tur4EcB0s2ayZI1HFx3xFfOelR4Vrw/hn6BLSvq339Y
 OYeH8bOBalktjJhnK/TObbZSHtWSG/YdhW5eYokL6ZiZ5oDn3IrFvHZVSyxzqoI0e0VX
 1KXCxDif/KSuine4/W1/SUK2PhMYiHK7tTaIlSfUO9g8z8+eeMC/6fa0olK/vpz+sjC1
 PkCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SMezyx2I
Subject: Re: [Buildroot] [PATCH v2 1/3] package/lua: bump to version 5.4.7
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/07/2024 15:09, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied all three to master, thanks.

  Regards,
  Arnout

> ---
>   .checkpackageignore                                         | 6 +++---
>   package/lua/5.4.6/lua.hash                                  | 5 -----
>   package/lua/{5.4.6 => 5.4.7}/0001-root-path.patch           | 0
>   package/lua/{5.4.6 => 5.4.7}/0002-shared-libs-for-lua.patch | 0
>   .../0011-linenoise.patch => 5.4.7/0003-linenoise.patch}     | 2 +-
>   package/lua/5.4.7/lua.hash                                  | 5 +++++
>   package/lua/lua.mk                                          | 2 +-
>   7 files changed, 10 insertions(+), 10 deletions(-)
>   delete mode 100644 package/lua/5.4.6/lua.hash
>   rename package/lua/{5.4.6 => 5.4.7}/0001-root-path.patch (100%)
>   rename package/lua/{5.4.6 => 5.4.7}/0002-shared-libs-for-lua.patch (100%)
>   rename package/lua/{5.4.6/0011-linenoise.patch => 5.4.7/0003-linenoise.patch} (97%)
>   create mode 100644 package/lua/5.4.7/lua.hash
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 72ebab6d8..497cac8d4 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -985,9 +985,9 @@ package/lua/5.1.5/0012-fix-reader-at-eoz.patch lib_patch.Upstream
>   package/lua/5.3.6/0001-root-path.patch lib_patch.Upstream
>   package/lua/5.3.6/0002-shared-libs-for-lua.patch lib_patch.Upstream
>   package/lua/5.3.6/0003-linenoise.patch lib_patch.Upstream
> -package/lua/5.4.6/0001-root-path.patch lib_patch.Upstream
> -package/lua/5.4.6/0002-shared-libs-for-lua.patch lib_patch.Upstream
> -package/lua/5.4.6/0011-linenoise.patch lib_patch.Upstream
> +package/lua/5.4.7/0001-root-path.patch lib_patch.Upstream
> +package/lua/5.4.7/0002-shared-libs-for-lua.patch lib_patch.Upstream
> +package/lua/5.4.7/0003-linenoise.patch lib_patch.Upstream
>   package/luajit/0001-no-bin-symlink.patch lib_patch.Upstream
>   package/luajit/0002-install-inc.patch lib_patch.Upstream
>   package/luasyslog/0001-remove-AX_LUA_LIBS.patch lib_patch.Upstream
> diff --git a/package/lua/5.4.6/lua.hash b/package/lua/5.4.6/lua.hash
> deleted file mode 100644
> index 0b03fd563..000000000
> --- a/package/lua/5.4.6/lua.hash
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -# Hashes from: https://www.lua.org/ftp/
> -sha256  7d5ea1b9cb6aa0b59ca3dde1c6adcb57ef83a1ba8e5432c0ecd06bf439b3ad88  lua-5.4.6.tar.gz
> -
> -# Locally computed
> -sha256  8f1bff27c5b0585ab679dbe4e37e75a1014af0f79732f42a79f86728321a0c6d  doc/readme.html
> diff --git a/package/lua/5.4.6/0001-root-path.patch b/package/lua/5.4.7/0001-root-path.patch
> similarity index 100%
> rename from package/lua/5.4.6/0001-root-path.patch
> rename to package/lua/5.4.7/0001-root-path.patch
> diff --git a/package/lua/5.4.6/0002-shared-libs-for-lua.patch b/package/lua/5.4.7/0002-shared-libs-for-lua.patch
> similarity index 100%
> rename from package/lua/5.4.6/0002-shared-libs-for-lua.patch
> rename to package/lua/5.4.7/0002-shared-libs-for-lua.patch
> diff --git a/package/lua/5.4.6/0011-linenoise.patch b/package/lua/5.4.7/0003-linenoise.patch
> similarity index 97%
> rename from package/lua/5.4.6/0011-linenoise.patch
> rename to package/lua/5.4.7/0003-linenoise.patch
> index 5054ae19e..2fcbc49f6 100644
> --- a/package/lua/5.4.6/0011-linenoise.patch
> +++ b/package/lua/5.4.7/0003-linenoise.patch
> @@ -8,7 +8,7 @@ Index: b/src/lua.c
>   ===================================================================
>   --- a/src/lua.c
>   +++ b/src/lua.c
> -@@ -438,6 +438,14 @@
> +@@ -447,6 +447,14 @@
>    #define lua_saveline(L,line)	((void)L, add_history(line))
>    #define lua_freeline(L,b)	((void)L, free(b))
>    
> diff --git a/package/lua/5.4.7/lua.hash b/package/lua/5.4.7/lua.hash
> new file mode 100644
> index 000000000..d67fdcf6c
> --- /dev/null
> +++ b/package/lua/5.4.7/lua.hash
> @@ -0,0 +1,5 @@
> +# Hashes from: https://www.lua.org/ftp/
> +sha256  9fbf5e28ef86c69858f6d3d34eccc32e911c1a28b4120ff3e84aaa70cfbf1e30  lua-5.4.7.tar.gz
> +
> +# Locally computed
> +sha256  33a975a766520bc54de2d71e45442e504effa0519e331e31ee3fc46eca4f98bd  doc/readme.html
> diff --git a/package/lua/lua.mk b/package/lua/lua.mk
> index 93d480381..15772dbdf 100644
> --- a/package/lua/lua.mk
> +++ b/package/lua/lua.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   ifeq ($(BR2_PACKAGE_LUA_5_4),y)
> -LUA_VERSION = 5.4.6
> +LUA_VERSION = 5.4.7
>   else ifeq ($(BR2_PACKAGE_LUA_5_3),y)
>   LUA_VERSION = 5.3.6
>   else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
