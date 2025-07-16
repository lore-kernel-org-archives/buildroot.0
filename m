Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D97C83F22
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 20:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50F7561506;
	Wed, 16 Jul 2025 20:39:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MAXmk7wWHUSi; Wed, 16 Jul 2025 20:39:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7173960DBF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7173960DBF;
	Wed, 16 Jul 2025 20:39:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 111DD234
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 20:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0221683E85
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 20:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b3VvNU8tvF0j for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 20:39:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D77C83CC0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D77C83CC0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D77C83CC0
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 20:39:10 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso188771f8f.0
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 13:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752698349; x=1753303149;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i/uVCsSoPZF28b2mArxHNTV3akeJ4kYUbB1khdhF7EI=;
 b=azfSOKbUZjTOCYXLvqE+Sp+30yLYfhrY4la6mXGlXsG9vgMLm0hz6NFbTBePEMEYjF
 ilmob/ACkG0GBESbynO9uJvQX+tSkirjnjPADSY97ry+Q60NI/BQM+ftygmhfC70lo//
 vZzinjOdW5HjITkKuiGMPodqrRSa6F43GzvtuZgZVFeartYZt1XvEvijPmZvfVl3lHlT
 imsF9Vvoh7K5eYF9GN4M/2Mm8EItyClMJJNoc0wJdM+6XXkVydwrr3yjBF4OZAA62BZr
 ALh5ztgw6wKBhuwj//L5LWZOlkUdN6/2CLh56aezzVAwqo86SdFUqfVbmx04yHu8yNkM
 1mAg==
X-Gm-Message-State: AOJu0YxBhUU+MosF4mF+/qO/6UOqWzPbWeDEG5pNv0gsz9tCZbIuCxX2
 996BtviiMnO4Qj0TUzVJiE+xxpfj6R/QIbNtPDhqKMXn3Vq/Yf8TMRK9BrWjZQ==
X-Gm-Gg: ASbGncvpz3r5LvyWcwVrgID5/i5Yo4GlqM1TZZ2C0X+QTW+wSqQXV6jUfQ8zJugP1jz
 u3d2z79Bcp56SmoTci94VQk5o1ZkD0j4OaI9Os+vefEt24QibBpfmWupoZLamsKSVtKoRi+tNwP
 7/K7V8YPjDq5KL4mgHbiq7fe/3uOmsKQWanKs3h5B+XbGXeYL2d/9xeLc9vUc6HC9jWypKOHcwU
 UW2Gqt3Mekr2xLbbfUiQwId5Hy5Yk7Zwc6ar885e1zxko3MPXQUmcCT/mViYWiFlxx7g2XL97gl
 4iLDvvrC8XAki4vaHh+jsRJc98PiY39pn3qOYP803UVwxjOwWOY6RWw4h81sBfNeJ3h99g2/Wy6
 VAH6epFxBeBuFekSXfoIRnyj3w0g=
X-Google-Smtp-Source: AGHT+IEyn9ChmeREkD9pk7RacQCtpJDXyPXdpPdEV1GuCvEc1pVpBZAkdUGnLh0Dr4QxIAwqUZmOpA==
X-Received: by 2002:a05:6000:43c6:10b0:3a4:f744:e01b with SMTP id
 ffacd0b85a97d-3b60e50fde7mr2615293f8f.39.1752698348715; 
 Wed, 16 Jul 2025 13:39:08 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e1e1a5sm18473548f8f.74.2025.07.16.13.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 13:39:08 -0700 (PDT)
Date: Wed, 16 Jul 2025 22:39:06 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: Buildroot development <buildroot@buildroot.org>,
 Julien Olivain <ju.o@free.fr>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20250716203906.GA9246@pevik>
References: <af8e78be-f4ad-4543-a166-b2527c0e9c3a@grenoble.cnrs.fr>
 <8c5d92c3-172b-405e-8711-1b561c7ae7b1@grenoble.cnrs.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8c5d92c3-172b-405e-8711-1b561c7ae7b1@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752698349; x=1753303149; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/uVCsSoPZF28b2mArxHNTV3akeJ4kYUbB1khdhF7EI=;
 b=D+gNqtv6gFZsF3yhpyzU33PwBKsPitsAZlVqgkqx1MdSQb8whmFDCG97AdNFkeZp3k
 sIHbvFuYqyGbzxMxig433zz4v7mknejf4BdSWpfmvO84bItW6SUq0LloMgXrYE3n2YcE
 wk6pNYuu4iNhsODk9qD5ErHLgAEZRE3Hw9zx/GW7f0xZfb++8rxX75Fjayy0ySL6AOue
 SPLGRQx6Bvc8MPiQrRvWLJJ39Z5wNkv6O0EqbDTW2BIVexOIXwm4dhrC5Vk4A/SPY8th
 wh82lN3VdRWerPpCzTwk9xynaf0eEOXpO6tgOn0UsQo6DM4AOEkUFHEp+hPoXZCjxtCj
 x8wQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=D+gNqtv6
Subject: Re: [Buildroot] [PATCH v2 1/4] support/kconfig/patches: make all
 patches quilt-friendly
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Edgar,

> According to support/kconfig/README.buildroot, the patches in
> support/kconfig/patches/ are meant to be applied by quilt. However, two
> of those patches are in git format, which makes quilt error out with:

>     Applying patch patches/22-kconfig-lxdialog-fix-check-with-GCC14.patch
>     can't find file to patch at input line 32
>     [...]
>     No file to patch.  Skipping patch.

> Fix the format to make quilt happy.

How about using 'git quiltimport' instead?

Kind regards,
Petr

> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
> ---
>  ...config-lxdialog-fix-check-with-GCC14.patch | 11 +++----
>  ...onfig-mn-conf-handle-backspace-H-key.patch | 31 +++++++++----------
>  2 files changed, 18 insertions(+), 24 deletions(-)

> diff --git a/support/kconfig/patches/22-kconfig-lxdialog-fix-check-with-GCC14.patch b/support/kconfig/patches/22-kconfig-lxdialog-fix-check-with-GCC14.patch
> index 41081bb45d..edcc857190 100644
> --- a/support/kconfig/patches/22-kconfig-lxdialog-fix-check-with-GCC14.patch
> +++ b/support/kconfig/patches/22-kconfig-lxdialog-fix-check-with-GCC14.patch
> @@ -25,10 +25,10 @@ Tested-by: Petr Vorel <petr.vorel@gmail.com>
>   kconfig/lxdialog/check-lxdialog.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

> -diff --git a/kconfig/lxdialog/check-lxdialog.sh b/kconfig/lxdialog/check-lxdialog.sh
> -index 16cd9a3186..27d6c30a57 100755
> ---- a/kconfig/lxdialog/check-lxdialog.sh
> -+++ b/kconfig/lxdialog/check-lxdialog.sh
> +Index: kconfig.new/lxdialog/check-lxdialog.sh
> +===================================================================
> +--- kconfig.orig/lxdialog/check-lxdialog.sh
> ++++ kconfig/lxdialog/check-lxdialog.sh
>  @@ -48,7 +48,7 @@ trap "rm -f $tmp" 0 1 2 3 15
>   check() {
>           $cc -x c - -o $tmp 2>/dev/null <<'EOF'
> @@ -38,6 +38,3 @@ index 16cd9a3186..27d6c30a57 100755
>   EOF
>   	if [ $? != 0 ]; then
>   	    echo " *** Unable to find the ncurses libraries or the"       1>&2
> --- 
> -2.44.0
> -
> diff --git a/support/kconfig/patches/23-kconfig-mn-conf-handle-backspace-H-key.patch b/support/kconfig/patches/23-kconfig-mn-conf-handle-backspace-H-key.patch
> index 6e32115f70..f72f9f339b 100644
> --- a/support/kconfig/patches/23-kconfig-mn-conf-handle-backspace-H-key.patch
> +++ b/support/kconfig/patches/23-kconfig-mn-conf-handle-backspace-H-key.patch
> @@ -16,11 +16,11 @@ Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>   kconfig/nconf.gui.c         | 3 ++-
>   3 files changed, 5 insertions(+), 3 deletions(-)

> -diff --git a/kconfig/lxdialog/inputbox.c b/kconfig/lxdialog/inputbox.c
> -index 611945611bf8..1dcfb288ee63 100644
> ---- a/kconfig/lxdialog/inputbox.c
> -+++ b/kconfig/lxdialog/inputbox.c
> -@@ -113,7 +113,8 @@ int dialog_inputbox(const char *title, const char *prompt, int height, int width
> +Index: kconfig/lxdialog/inputbox.c
> +===================================================================
> +--- kconfig.orig/lxdialog/inputbox.c
> ++++ kconfig/lxdialog/inputbox.c
> +@@ -126,7 +126,8 @@ int dialog_inputbox(const char *title, const char *prompt, int height, int width
>   			case KEY_DOWN:
>   				break;
>   			case KEY_BACKSPACE:
> @@ -30,10 +30,10 @@ index 611945611bf8..1dcfb288ee63 100644
>   				if (pos) {
>   					wattrset(dialog, dlg.inputbox.atr);
>   					if (input_x == 0) {
> -diff --git a/kconfig/nconf.c b/kconfig/nconf.c
> -index a4670f4e825a..ac92c0ded6c5 100644
> ---- a/kconfig/nconf.c
> -+++ b/kconfig/nconf.c
> +Index: kconfig/nconf.c
> +===================================================================
> +--- kconfig.orig/nconf.c
> ++++ kconfig/nconf.c
>  @@ -1048,7 +1048,7 @@ static int do_match(int key, struct match_state *state, int *ans)
>   		state->match_direction = FIND_NEXT_MATCH_UP;
>   		*ans = get_mext_match(state->pattern,
> @@ -43,11 +43,11 @@ index a4670f4e825a..ac92c0ded6c5 100644
>   		state->pattern[strlen(state->pattern)-1] = '\0';
>   		adj_match_dir(&state->match_direction);
>   	} else
> -diff --git a/kconfig/nconf.gui.c b/kconfig/nconf.gui.c
> -index 7be620a1fcdb..77f525a8617c 100644
> ---- a/kconfig/nconf.gui.c
> -+++ b/kconfig/nconf.gui.c
> -@@ -439,7 +439,8 @@ int dialog_inputbox(WINDOW *main_window,
> +Index: kconfig/nconf.gui.c
> +===================================================================
> +--- kconfig.orig/nconf.gui.c
> ++++ kconfig/nconf.gui.c
> +@@ -440,7 +440,8 @@ int dialog_inputbox(WINDOW *main_window,
>   		case KEY_F(F_EXIT):
>   		case KEY_F(F_BACK):
>   			break;
> @@ -57,6 +57,3 @@ index 7be620a1fcdb..77f525a8617c 100644
>   		case KEY_BACKSPACE:
>   			if (cursor_position > 0) {
>   				memmove(&result[cursor_position-1],
> --- 
> -2.48.1
> -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
