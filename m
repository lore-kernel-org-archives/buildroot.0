Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FD4C55174
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 21:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D83A6062D;
	Fri, 31 Jul 2026 21:05:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CF1Znmcw2O0j; Fri, 31 Jul 2026 21:05:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91ED560657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785531903;
	bh=U/WbTWmqbgQ+H7uS9jnfpWKqj1Ge2Z4wiYOtUbdiUNw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SrkSClr0Et9Drk8VGSm+gcVstjvBm2OKC4DAUYNA+lwwGzrguDnXX/kibRxyJuhQg
	 G/36TRVkmnNc3fr9Cd+aBD8NFdzGAe1BmZbWmCpcmvymjaNdeJbzZPm9RGyOEa2VwC
	 G7OR40ZBwoQo507DAe6QZ3QbtgPSLZYqCoPAvHEv1VZhdHJ2CuwwWPuGq7BmVveqjc
	 ADLCdHDigQj9uIFc3UKIT6WckXwwSOpwRQPaLtRQ8V9W52sbnCF5F2ff4bNzyLS5DD
	 KrGWT9LLXT8kVIM0dj+dYwt60ygIwD8sDrjvcjBbaFKf0Tdh6l1duqwR6yLHnMSzCl
	 O9zBOhgCTzHtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91ED560657;
	Fri, 31 Jul 2026 21:05:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8074B3B6
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 21:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6ABBD60657
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 21:05:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FwYslOCtzMkn for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 21:05:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com;
 envelope-from=aford173@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8C5766062D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C5766062D
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C5766062D
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 21:05:00 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-497e6956acfso1091961b6e.1
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 14:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785531899; cv=none;
 d=google.com; s=arc-20260327;
 b=HhLcPlXeMmEeSN76MKu8s2l009F+FvzJP0TMN6Qo0JsmGUMEW6fa2qqR8TPskXQ3aZ
 TyRUh0QLYN9S5y4IgcICBnNJr6ZJ0qkc6pP0+iofpwTz7B89dulQc/CfECZ75O4MVM4Y
 +Hw2l4Voeq0xGSesfzH5beliiMKiRq4AghekWadmojyiidXc5Q7O3iLFDSHvLzkGk6DH
 5GxC8jw21lCpP/Fxgh+8Y6aaTAGWhf0ZbKsXTr/COuSA0Bn6D54SBRlJXaWA+3ot7buq
 2jxYXbHPuptR4vZl62H5RRA6CKeIN+uay6TzRl8A8ZfvBhlHre3e9eIbEs7AtW46oTTc
 fcSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=rw0IY4Tvwgvu4cKrIHmgi/tKpxUxkNrB1ZuA6KIpO1g=;
 fh=MFfYaWyeXo/Z9GsQRr5zo5CyMKcVkmR0by3HEFPAyw0=;
 b=ErFJ1fOZ74PcTJy/VyV7AHX/uofOBNK+aeA6jA6vJoyebpOJLkqHXqqt/KmEAe7DVB
 mjLpP066bt5FWukbpt45CCvgKQ31ebwe6TMD+xgXFII/bTcuvWrWUjTAo0D6yNEcpB3n
 iKDxAbgeXbFkiuAsiuXVB70RLSyflcbHd2TZxSvxpKPnEaw1KGJlHLIq7JOsnS2DkmxS
 vu6FY07B6XgZk8R/elOe+7NZVKf+XQzEaza8oUVBeMvZdLiw8Jdabd+a37zbCsDIPoZm
 y/DrtrpP2B9yR0yHEQEJ39YBPE4La8XQsc88oZs1gwXOTRvekjh6wCy/0snDuxb9PSeL
 WYjQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785531899; x=1786136699;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=rw0IY4Tvwgvu4cKrIHmgi/tKpxUxkNrB1ZuA6KIpO1g=;
 b=N5IKFIUax2EN++gyjgMR0+VnCenEGYMj0r9iQymHWNiI8TD/E0oOFERpOvgdkrox8q
 xeO1V1gY+tzj28xAXFg4DdlmFBLZsYKVWY9IlGb2ZuAzL7FHAoHXivMGeEaz4zkAClp3
 P9/VB/jBAet05qlhpZmLFm6U/sobSBNbkzzff3vOzeDccOLwydnJguW5HxKJjsqKqI5A
 Y4L5sBJpmM6nztFadsHNDeRRKqFMjXh43uleXWPpibaIVMlZKPlLmUX/0aRI2IryZG3G
 djngUROyEb9pZSpWSgesz0gMTIxv1SFBmrbUJGLdbMgNv7w3cNSfx/xN43mCzQd3rlNQ
 tAQw==
X-Gm-Message-State: AOJu0YxZJRX5lUmz/aOY86CLYKUjeU/htIHSawiy3Wvd7CP7+lZURZFh
 NGQh5XmR8JxsSdTNenWJ8/Me0JiO1SA6vglFGvU8U76siwQgXMi7Lcylb3az6ok+nrjYjaTtqBf
 IpQQbadarAAlrufj//XdgwoDJiwZTBBpL4zCEgmg=
X-Gm-Gg: AR+sD10mrzo25Uwq5m+ZxJhfow5xGU6ElSgGPLguBmufL2VsFUxYtpOjxNLYyZZgi8x
 c/fc4Kte2r4XAyd674mo4aWrynJsryhp+OJAtuOi2NXEwVWt+C2A2xush77sMJNy6J+apL2bBAz
 WErTcTivuqZEz3rWSfzH//LlxELPkcqhAiJW0jlyDn++5u+qRADTd61uzWJHrc5HQBE+E+V3js2
 AR3rbc2J/ZnDfdLqcVEBE+RH5lZ1ncCy7GRtJDDJiSqSIE0LRrf84MZ4+9/9VfmVGVPEOAezTeL
 f2XTZrgPSJ4lpzavy+3vT7Gce9q5vbw11PHCSIhVNH7r
X-Received: by 2002:a05:6808:1797:b0:495:f697:92d9 with SMTP id
 5614622812f47-4ae3188b02dmr5115714b6e.7.1785531899471; Fri, 31 Jul 2026
 14:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260716133001.2147463-1-aford173@gmail.com>
In-Reply-To: <20260716133001.2147463-1-aford173@gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 31 Jul 2026 16:04:47 -0500
X-Gm-Features: AUfX_mwa6cd2B6-hO1w_2lJnCidu8cofrduFzr2vyCbYD7Dd2IB-jTsqCQx4oYA
Message-ID: <CAHCN7xJ-wBrivyVoGxHF8g07USrcbPjbN0MnYP7rupcEEEh1rg@mail.gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785531899; x=1786136699; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=rw0IY4Tvwgvu4cKrIHmgi/tKpxUxkNrB1ZuA6KIpO1g=;
 b=ZqoUvgeTaUSsVgyrsuX96QJoMyC97nQtXA0c7BuQVOeSbU1nOky1S1MFuMW8h2P3yx
 b8E/eFlpFEdimvXojsLrKC1ZLWezcZvkKEi+W3CDm4mB/tofgnG1W90uHnskbrTa77QF
 8q6nCIqKhvdJBkENDC3WnOEHzLMXoNwawofz5SsGp2Rm2UOogwXYC4zub03sCJTzLLLs
 43imXu69387Z62dXrjgRv8rzwkdxZMuVaABZSTGK58obgYwKrJD1ERCDblonPS8zH7Gu
 WE3oQfJOWobykISwrpU3l2IV9WcpKExsCEWRFakdpy1T8eQQQl+Y1PR1zezQwXfwEL2O
 1pdg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ZqoUvgeT
Subject: Re: [Buildroot] [PATCH] package/libxml-parser-perl: add
 host-libxcrypt dependency
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
Content-Type: multipart/mixed; boundary="===============7727270951125185115=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7727270951125185115==
Content-Type: multipart/alternative; boundary="0000000000009a6b340657ee8a15"

--0000000000009a6b340657ee8a15
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 8:30=E2=80=AFAM Adam Ford <aford173@gmail.com> wrot=
e:

> host-libxml-parser-perl compiles XS modules against the system perl
> headers, which #include <crypt.h>. On build hosts without libcrypt-dev
> installed, the build fails:
>
>     .../CORE/reentr.h:126:16: fatal error: crypt.h: No such file or
> directory
>
> Declaring host-libxcrypt ensures crypt.h is present in the per-package
> host sysroot before the build.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
>

Gentle nudge on this.


>
> diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk
> b/package/libxml-parser-perl/libxml-parser-perl.mk
> index 06bbd3b1ad..7cc60774bd 100644
> --- a/package/libxml-parser-perl/libxml-parser-perl.mk
> +++ b/package/libxml-parser-perl/libxml-parser-perl.mk
> @@ -7,7 +7,7 @@
>  LIBXML_PARSER_PERL_VERSION =3D 2.47
>  LIBXML_PARSER_PERL_SOURCE =3D
> XML-Parser-$(LIBXML_PARSER_PERL_VERSION).tar.gz
>  LIBXML_PARSER_PERL_SITE =3D $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
> -HOST_LIBXML_PARSER_PERL_DEPENDENCIES =3D host-expat
> +HOST_LIBXML_PARSER_PERL_DEPENDENCIES =3D host-expat host-libxcrypt
>  LIBXML_PARSER_PERL_LICENSE =3D Artistic or GPL-1.0+
>  LIBXML_PARSER_PERL_LICENSE_FILES =3D README
>  LIBXML_PARSER_PERL_RUN_PERL =3D `which perl`
> --
> 2.53.0
>
>

--0000000000009a6b340657ee8a15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 16,=
 2026 at 8:30=E2=80=AFAM Adam Ford &lt;<a href=3D"mailto:aford173@gmail.com=
">aford173@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">host-libxml-parser-perl compiles XS modules against the=
 system perl<br>
headers, which #include &lt;crypt.h&gt;. On build hosts without libcrypt-de=
v<br>
installed, the build fails:<br>
<br>
=C2=A0 =C2=A0 .../CORE/reentr.h:126:16: fatal error: crypt.h: No such file =
or directory<br>
<br>
Declaring host-libxcrypt ensures crypt.h is present in the per-package<br>
host sysroot before the build.<br>
<br>
Signed-off-by: Adam Ford &lt;<a href=3D"mailto:aford173@gmail.com" target=
=3D"_blank">aford173@gmail.com</a>&gt;<br></blockquote><div><br></div><div>=
Gentle nudge on this.</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
diff --git a/package/libxml-parser-perl/<a href=3D"http://libxml-parser-per=
l.mk" rel=3D"noreferrer" target=3D"_blank">libxml-parser-perl.mk</a> b/pack=
age/libxml-parser-perl/<a href=3D"http://libxml-parser-perl.mk" rel=3D"nore=
ferrer" target=3D"_blank">libxml-parser-perl.mk</a><br>
index 06bbd3b1ad..7cc60774bd 100644<br>
--- a/package/libxml-parser-perl/<a href=3D"http://libxml-parser-perl.mk" r=
el=3D"noreferrer" target=3D"_blank">libxml-parser-perl.mk</a><br>
+++ b/package/libxml-parser-perl/<a href=3D"http://libxml-parser-perl.mk" r=
el=3D"noreferrer" target=3D"_blank">libxml-parser-perl.mk</a><br>
@@ -7,7 +7,7 @@<br>
=C2=A0LIBXML_PARSER_PERL_VERSION =3D 2.47<br>
=C2=A0LIBXML_PARSER_PERL_SOURCE =3D XML-Parser-$(LIBXML_PARSER_PERL_VERSION=
).tar.gz<br>
=C2=A0LIBXML_PARSER_PERL_SITE =3D $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR<=
br>
-HOST_LIBXML_PARSER_PERL_DEPENDENCIES =3D host-expat<br>
+HOST_LIBXML_PARSER_PERL_DEPENDENCIES =3D host-expat host-libxcrypt<br>
=C2=A0LIBXML_PARSER_PERL_LICENSE =3D Artistic or GPL-1.0+<br>
=C2=A0LIBXML_PARSER_PERL_LICENSE_FILES =3D README<br>
=C2=A0LIBXML_PARSER_PERL_RUN_PERL =3D `which perl`<br>
-- <br>
2.53.0<br>
<br>
</blockquote></div></div>

--0000000000009a6b340657ee8a15--

--===============7727270951125185115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7727270951125185115==--
