Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703AEE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 17:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3335580EAF;
	Sat, 11 Jan 2025 17:18:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T7mB7P2yQpfI; Sat, 11 Jan 2025 17:18:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BB6980E0A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BB6980E0A;
	Sat, 11 Jan 2025 17:18:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C8A5950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CF8F40939
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:18:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yzIQGBPxSzQm for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 17:18:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=david.laight.linux@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C2FA24091F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2FA24091F
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2FA24091F
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:18:46 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so21798445e9.3
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 09:18:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736615924; x=1737220724;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4uPxvZlOJvDlLKlzElqzCfzi9WKtKwUwH/PYZUQDdLg=;
 b=YCTZtAksaLxxltRvR/iKARrE4vgA7OXUAAxuL8xLZkKJSrWUHPXgxNyYca5UgpMnfr
 ePJdKUDGOm0blWElukFekCTtZmqS7ZzRrMkqaF0p9EVgLjpUgFqVcqH8WASG/9QUH4Fc
 i/4NsZCS2TZ7mG3eh7PKQ6nvMjV9jXwRgyc2UEznKo+OaI/mzgXA1Grjy6HKDYh0yEPC
 E6roHkD/Rw+Ivqr5Jg4+7HtTLg19Ib5mR8ppVGj0c8JjLlSfHqkTOWjEjdbsAQYyTsLq
 t2tyIb1lvzz/s6K36FDS1TPVb346Pp8XBO1rYfV2V4Wn/xmgdvg8qIUpedpWzTxCDIId
 f05g==
X-Gm-Message-State: AOJu0YzwoSJWCOXTKr5whWw2TXJi3hTKg/GLVO7b4jcKcIj1PKs8k5Bo
 NrkmBGhjCCVast0xeWlq9DGlBeaIG5oWjDlLoWvnoERBsEa/+uyldhSZxw==
X-Gm-Gg: ASbGnctIKUeTa/yTwtPQEhWbeApLuFf8HJ3olG0fztg8hwAqIcYw4mgFlju2gg/g56L
 CLU3BYK4y38vfpANv9gw/TKGlg0lHpSXX0Mwy+1R2Z6WwL0XmUhD/aLQvQTReND1dNOc23AWBx8
 LTzDA9tfeyqRovHJDmi2sryVAkxOgk/0uAoUjWXWbHL4LarXLxqAtzMGn/nuu3VeBZ90DtOqr2V
 iqAy9+ZbWAKXIT4SZxjJ8cTL79ehao16zG/WhXL0my7USQuAwUF35PSZ2a52GBktlnzYFPXOAq0
 dJ/IZ0aYeUJ72gCbVKs=
X-Google-Smtp-Source: AGHT+IEmgZPCaqcD5zut7tQ7DRZAhq13MIfn1/U1NWyrG1PHN+Mbczx+sBgKuWbSnVBpmxKAEhhCxw==
X-Received: by 2002:a05:6000:712:b0:388:da10:ff13 with SMTP id
 ffacd0b85a97d-38a87306e8bmr15192941f8f.21.1736615924409; 
 Sat, 11 Jan 2025 09:18:44 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e384f2bsm7633668f8f.41.2025.01.11.09.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 09:18:44 -0800 (PST)
Date: Sat, 11 Jan 2025 17:18:43 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>, Julien Olivain <ju.o@free.fr>
Message-ID: <20250111171843.35dff62f@pumpkin>
In-Reply-To: <20250111162841.3456137-1-romain.naour@smile.fr>
References: <20250111162841.3456137-1-romain.naour@smile.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736615924; x=1737220724; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4uPxvZlOJvDlLKlzElqzCfzi9WKtKwUwH/PYZUQDdLg=;
 b=UAgvXBkn4ZbjaHQpVwWy0feDL2l9SHiQavLbI/Gs07Ql+XriH220QrmKe4U8Gg0n4l
 9oVLRufRglBNABvqP4/HjlLDDtj2g12Qw88bRu+jeCX85bxSRFvpZtuRLcPwt33i7KBp
 GFW+pZ1Isn+5tjnpj21wc1gYdZRKBsovk1tI9xELHFuwplJnBU1E6Mzsb18icYGVKRIx
 dVCa3YCYmxriA4IECWzRe6c7hn5YPniMAbLvV4g5Qn9ssXjTEvwnSBkHewbJ6Ssc79zP
 ZKMYoKUJyO6ZZICr90ZJYnmCA30roECTCqMzyr/6tFuVkm2vsMYP+oAmWuF6Y97Cki1A
 kyLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UAgvXBkn
Subject: Re: [Buildroot] [PATCH] support/dependencies/dependencies.sh:
 ensure wget2 is > 2.2.0 for metalink support with -O
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 11 Jan 2025 17:28:41 +0100
Romain Naour via buildroot <buildroot@buildroot.org> wrote:

> As reported by Julien Olivain, in some cases the "wget -O output ..."
> does not get honored when GNU Wget2 is used as drop-in replacement for
> GNU Wget.
> 
> For example, qt6* packages archives are failing (due to multipart
> downloads: HTTP response 206):
> 
>   [Files: 1  Bytes: 46.00M [388.39KB/s] Redirects: 1  Todo: 0  Errors: 184
> 
>   sha256sum: [...]/build/.qtbase-everywhere-src-6.8.1.tar.xz.bFXkzc/output: No such file or directory
>   ERROR: while checking hashes from package/qt6/qt6base/qt6base.hash
>   ERROR: qtbase-everywhere-src-6.8.1.tar.xz has wrong sha256 hash:
>   ERROR: expected: 40b14562ef3bd779bc0e0418ea2ae08fa28235f8ea6e8c0cb3bce1d6ad58dcaf
>   ERROR: got     :
>   ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> 
> Fedora 40 is one of the first Linux distribution providing GNU Wget2 as
> wget [1]. Some incompatibility issues with Wget1.x are discovered with
> early Wget2 versions.
> 
> This is the case here with Wget2 2.2.0 and Metalink handling that
> ignore -O option [2][3].
> 
> The issue was not noticed until now since the download infrastructure
> uses a mirror (s.b.o) as fallback.
> 
> Since wget -O is part of our download infrastructure since 2012.05 [4],
> ensure wget2 is at least 2.2.1 or any newer version that contains the
> -O fix [5].
> 
> [1] https://fedoraproject.org/wiki/Changes/Wget2asWget
> [2] https://gitlab.com/gnuwget/wget2/-/issues/685
> [3] https://gitlab.com/gnuwget/wget2/-/blob/0651b0a447e4d6dd3f100800d0d93db90f2bd2fb/docs/wget2.md#-o---output-documentfile
> [4] https://gitlab.com/buildroot.org/buildroot/-/commit/cf2486bf317e4bbf88c801fb96183ba62be78cc8
> [5] https://gitlab.com/gnuwget/wget2/-/commit/15c06c2f2a5f5eaa962893beec97a5211743ec05
> 
> Reported-by: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  support/dependencies/dependencies.sh | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index fb0defd0c9..e49831a3fd 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -184,6 +184,21 @@ for prog in perl tar wget cpio unzip rsync bc cmp find xargs ${DL_TOOLS} ; do
>  			exit 1
>  		fi
>  	fi
> +
> +	if test $prog = "wget" ; then
> +		WGET_VERSION="$(wget --version | head -n1 | cut -d ' ' -f3)"
> +		WGET_MAJOR="$(echo "${WGET_VERSION}" | cut -d . -f 1)"
> +		WGET_MINOR="$(echo "${WGET_VERSION}" | cut -d . -f 2)"
> +		WGET_PATCH="$(echo "${WGET_VERSION}" | cut -d . -f 3)"

How about:
		IFS=".$IFS"
		set $(wget --version)
		WGET_MAJOR=$3
		WGET_MINOR=$4
		WGET_PATCH=$5
		IFS="${IFS#.}"

Saves all those fork+exec.

> +
> +		# Wget2 <= 2.2.0 issue with -O : https://gitlab.com/gnuwget/wget2/-/issues/685
> +		if [ "${WGET_MAJOR}" -eq 2 ] && \
> +			! [ "${WGET_MAJOR}" -eq 2 -a "${WGET_MINOR}" -ge 2 -a "${WGET_PATCH}" -gt 0 ] ; then

Doesn't that also fail for 2.3.0 ?
I think this is ok:
		if [ $WGET_MAJOR = 2 && $WGET_MINOR$WGET_PATCH -le 20 ] ; then
any two digit minor/patch will fail the test.
(And there can't be an separators - so quotes aren't needed.)

	David


> +			echo
> +			echo "You have GNU Wget2 '${WGET_VERSION}' installed. GNU Wget2 > 2.2.0 is is required"
> +			exit 1;
> +		fi
> +	fi
>  done
>  
>  if test "${missing_progs}" = "yes" ; then

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
