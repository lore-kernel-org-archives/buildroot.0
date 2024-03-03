Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8956C54E49
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 16:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E55081FC2;
	Sun,  3 Mar 2024 16:18:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9WFDBAptyr4e; Sun,  3 Mar 2024 16:18:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DD1681FAB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DD1681FAB;
	Sun,  3 Mar 2024 16:18:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3A861BF575
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEEF860827
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:18:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8yeWyHjUMNXu for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 16:18:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5F76160812
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F76160812
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F76160812
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 16:18:17 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5101cd91017so4992875e87.2
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 08:18:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709482695; x=1710087495;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y6+EOgPDPJwDoXCvHNwFhHoZucNMidbU1U/kefEqcpM=;
 b=Wm+uRlcu3L71+Ye27I3kVK13KSgf4B40J46LYTYqlblQmYJrZnyry5X/W+TROcAHKO
 7Rd4sdUZkCiTW0BCKFbC1uz7L3MUV5cN4NHXP2sMTOgne36UKCv3QkNokA07u9IBTPTw
 xqaEnQAIIR5tfpEd/hWUpipsZcJ2QLColw1wKXaaqcl7rT2vtfBdLy0Tbr0zbelEy1q3
 ahnB0CFVM8oE08rPqHMRgtb0btyARDjdlj1rssAevRxFf29dXB9XlHvt7wjYlI5VVPtp
 ZbEqUyCcnuov0G5D+kMpFVB9SMlsT+4o64aNNIPaDwWjInDCX4GsTjoifb83dcFL4qQW
 nAuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKozZdoMQZGFk/6pBzpKBbG/PvZk1bjdedJHFGYJ3QYyQ69n+42PJX0SR72O4OquNEDFhzUQsdSGp4fw9/+p9Dkhp/b6513Q==
X-Gm-Message-State: AOJu0Yyq7LExvfi1b3u7Uwn6hFNkGPG/e7CHdS1ZzegaiQxwwKD08k9d
 8yBq8uy6aKVhGfv4F1Ehx/QBZvj4UpmNNwOc6DZYVYj5C9LuD1k/hA1iTqZx/7jOc6/D2gxzSy+
 b
X-Google-Smtp-Source: AGHT+IG0pSUljQw55x8VuTkWa/wlWy+pkEL2uY0CoQGdHPl61zDignU/e29Vj095bw08w9hYGh0OTQ==
X-Received: by 2002:a05:6512:3114:b0:513:172d:5b46 with SMTP id
 n20-20020a056512311400b00513172d5b46mr4389507lfb.39.1709482694953; 
 Sun, 03 Mar 2024 08:18:14 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 gl7-20020a170906e0c700b00a44e65447f9sm1535534ejb.7.2024.03.03.08.18.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Mar 2024 08:18:14 -0800 (PST)
Message-ID: <93236dca-7dbb-4b9a-abb8-962091693095@mind.be>
Date: Sun, 3 Mar 2024 17:18:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240106131026.127457-1-ju.o@free.fr>
In-Reply-To: <20240106131026.127457-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1709482695; x=1710087495; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y6+EOgPDPJwDoXCvHNwFhHoZucNMidbU1U/kefEqcpM=;
 b=fmGvL4TWD9jgcYsIMfaDrfEVYw0IoPoqU8t516Zg1c949J006cOCovM/6GS91gmRGY
 w07iRdOIHsbZXDHYrzEMdPJcQE6leFowBxChg4O7nLCLWR+5+xhR4xJRCkgh78ESHnUs
 VBdHpIjv/JCyC8mQ+dPg2PQeOb1z8ygaftqWJsrAAD1H7et3BTQ800tt+vJqTpqCMpbh
 utnaBjSmuZCV36LnrR4tQVFOjiBkd6iOJZz8Goy5QKcodKBJgRboS6rdK23caStVbIPM
 BZnuiRQS8fy61HFY0vNDqLoIk2rJ7s4Apty7BRHvFKVBnyb+DmvHHN6YWuOeSbkd+BkE
 uqTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fmGvL4TW
Subject: Re: [Buildroot] [PATCH v2 1/1] package/octave: add libreadline
 search prefix
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



On 06/01/2024 14:10, Julien Olivain wrote:
> GNU Octave changed its detection of readline library in [1]. This
> commit was first included in version 8.1.0.
> 
> GNU Octave was updated to 8.1.0 in Buildroot in commit b36e4b10f3
> "package/octave: bump to version 8.1.0".
> 
> Since this commit, Octave can fail to find readline automatically in
> some specific situations. For example, when host system is Fedora 39
> and the host "readline-devel" package is installed (see detailed
> explanation below).
> 
> Octave is now using a m4 macro from gnulib to detect readline.
> See [2].
> 
> This macro is calling AC_LIB_LINKFLAGS_BODY([readline]). Note that
> this macro will look into $libdir and $includedir by default. See [3].
> 
> Buildroot is calling target autotools configure command with
> --prefix=/usr and --exec-prefix=/usr arguments. See [4].
> 
> Autotools derives libdir='${exec_prefix}/lib' and
> includedir='${prefix}/include'.
> 
> Finally, gnulib will also search automatically into alternate library
> directories (i.e. lib32, lib64). See [5].
> 
> All of this will make the configure script searching the readline
> library by default (i.e. if the library prefix is not provided) into
> the host "/usr/lib", "/usr/lib32" and "/usr/lib64", when configuring
> for target.
> 
> This issue is not happening on the Buildroot docker reference image,
> because the package "libreadline-dev" is not present in this image.
> 
> Even if the package "libreadline-dev" is installed on a Debian based
> host systems, the issue is still not happening because libraries are
> installed in the path "/usr/lib/x86_64-linux-gnu", which is not
> searched by gnulib macros.
> 
> On host systems which installs libraries into one of the
> "/usr/lib{,32,64}" directories, the Octave configuration script will
> fail, because it will detect the host library and try to link against
> it with target architecture and compilation flags and will fail. Since
> the --enable-readline configure option is present, the configuration
> script will fail because it cannot find a working readline library.
> 
> This can be seen in the octave configuration log, in file:
> output/build/octave-8.4.0/config.log
> 
>      configure:73671: checking for readline
>      configure:73705: /buildroot/output/host/bin/aarch64-none-linux-gnu-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1 -pthread -fopenmp -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -lpthread -lm  /usr/lib64/libreadline.so >&5
>      /buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-none-linux-gnu/13.2.1/../../../../aarch64-none-linux-gnu/bin/ld: /usr/lib64/libreadline.so: error adding symbols: file in wrong format
>      collect2: error: ld returned 1 exit status
> 
> This situation can be reproduced on a Fedora 39 x86_64 host system,
> with the "readline-devel" package installed. Note: uninstalling the
> "readline-devel" will work around the issue.
> 
> The issue can be reproduced with a Buildroot configuration such as:
> 
>      cat > .config <<EOF
>      BR2_aarch64=y
>      BR2_TOOLCHAIN_EXTERNAL=y
>      BR2_PACKAGE_OCTAVE=y
>      BR2_PACKAGE_READLINE=y
>      EOF
>      make olddefconfig
>      make
> 
> In order to avoid those host/target readline detection mix-ups, the
> readline search prefix need to be explicitly passed during octave
> configuration. This commit adds this search prefix to fix this build
> issue.
> 
> Fixes:
> 
>      checking for readline... (cached) no
>      checking for readline/readline.h... (cached) yes
>      checking for readline/history.h... (cached) yes
>      configure: WARNING: I need GNU Readline 4.2 or later
>      configure: error: this is fatal unless you specify --disable-readline
> 
> [1] https://github.com/gnu-octave/octave/commit/3645c78658c4c66f2bc346fdbc5c7c77d8d8dd12
> [2] https://git.savannah.gnu.org/cgit/gnulib.git/tree/m4/readline.m4?id=2cdc1bafb20b187ad067056e090fcb4396ed9099
> [3] https://git.savannah.gnu.org/cgit/gnulib.git/tree/m4/lib-link.m4?id=2cdc1bafb20b187ad067056e090fcb4396ed9099#n190
> [4] https://gitlab.com/buildroot.org/buildroot/-/blob/2023.11/package/pkg-autotools.mk#L175
> [5] https://git.savannah.gnu.org/cgit/gnulib.git/tree/m4/lib-prefix.m4?id=2cdc1bafb20b187ad067056e090fcb4396ed9099#n276
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>


  Applied to master, thanks. And thank you for the _excellent_ commit message!

  Regards,
  Arnout


> ---
> Changes v1 -> v2:
> - Rewrote the commit log to include the full analysis.
>    The root cause was more complex that initially thought,
>    and the issue was not reproduced in Buildroot reference
>    docker image.
>    The patch content is exactly the same as v1.
> ---
>   package/octave/octave.mk | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/octave/octave.mk b/package/octave/octave.mk
> index cae0de7620..f240a5057c 100644
> --- a/package/octave/octave.mk
> +++ b/package/octave/octave.mk
> @@ -20,7 +20,9 @@ OCTAVE_DEPENDENCIES = \
>   	pcre2
>   
>   ifeq ($(BR2_PACKAGE_READLINE),y)
> -OCTAVE_CONF_OPTS += --enable-readline
> +OCTAVE_CONF_OPTS += \
> +	--enable-readline \
> +	--with-libreadline-prefix=$(STAGING_DIR)/usr
>   OCTAVE_DEPENDENCIES += readline
>   else
>   OCTAVE_CONF_OPTS += --disable-readline
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
