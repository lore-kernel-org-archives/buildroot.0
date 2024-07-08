Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAE5C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 12:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B98780CC9;
	Mon,  8 Jul 2024 12:49:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1TEJN9RmP0vm; Mon,  8 Jul 2024 12:49:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E8E580CFE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E8E580CFE;
	Mon,  8 Jul 2024 12:49:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E6B51BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 12:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C285606B9
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 12:49:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EV6s25X_4H4J for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 12:49:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.167.47;
 helo=mail-lf1-f47.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 330CA60627
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 330CA60627
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 330CA60627
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 12:49:28 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52ea7bdde68so3144020e87.0
 for <buildroot@buildroot.org>; Mon, 08 Jul 2024 05:49:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720442966; x=1721047766;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oE1YRtS9mD+/9G35M91w/AUl7fw5WyBS7ZrN3rEFHec=;
 b=mE7PyaqjNvjwR57/m4Xo5EmZPDdeefM+BX5ev+CN0o/kpYqDacC+jJsC813dlI9QLJ
 Vs2i/IILWmT41h7/uRR8vVjc8EW71UCMIcBYMrBTex70RLzc7q3USDGBcxYPm5f20EJ3
 hvFhNLzXi8lAW9dmCIGjl/KKA+Q4SlUmcO0AcxvTD4o4BdJJ6ycKzuUK//a1mnaMa2wN
 NHVZJW6RT7jXzI8o/r0PpvkhPVlSCwUGM8pZwEBQrTV6WreBzqXmBH/x3Q3gXgquLQJ5
 iaoSRxYks5GwBXKAiqYjcqJOYQSW+8o+xqGNrnlVq47G6RnRLyaRrp/VnrLhY2nW9mXi
 ZI2g==
X-Gm-Message-State: AOJu0YyO1cfIr1DUw8rsd4lnaEalDP234S9HR82DCQTP+kGGSgTwQhHR
 eplTbrw7eAYY8g8KyGNwhsvwow8sElLWtNJCbRxoEayfQkFkg7Bh4e3fnfrBGNw=
X-Google-Smtp-Source: AGHT+IFU9Dw9ShfVGtud/1Q5acKO/sH2nhxkpTzWwKWaAsY/5cv8dgOVumVY2/bOJLpo+hph3tJT2w==
X-Received: by 2002:a19:ca13:0:b0:52c:9421:2739 with SMTP id
 2adb3069b0e04-52ea061b1bemr7349219e87.9.1720442965626; 
 Mon, 08 Jul 2024 05:49:25 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab10253sm3460158e87.87.2024.07.08.05.49.25
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 05:49:25 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52ea34ffcdaso3545996e87.1
 for <buildroot@buildroot.org>; Mon, 08 Jul 2024 05:49:25 -0700 (PDT)
X-Received: by 2002:a19:ca13:0:b0:52c:9421:2739 with SMTP id
 2adb3069b0e04-52ea061b1bemr7349208e87.9.1720442965154; Mon, 08 Jul 2024
 05:49:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240708115213.623818-1-peter@korsgaard.com>
In-Reply-To: <20240708115213.623818-1-peter@korsgaard.com>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Mon, 8 Jul 2024 14:49:13 +0200
X-Gmail-Original-Message-ID: <CACXRmJghBjES36aNFB=5iQA-t567Pn0VdXWzYTpX0kSpeb9BwA@mail.gmail.com>
Message-ID: <CACXRmJghBjES36aNFB=5iQA-t567Pn0VdXWzYTpX0kSpeb9BwA@mail.gmail.com>
To: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH] package/fluent-bit: enable engines support
 in libopenssl
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
Cc: thomas@devoogdt.com, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8725673211988001060=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8725673211988001060==
Content-Type: multipart/alternative; boundary="000000000000cb718e061cbbd729"

--000000000000cb718e061cbbd729
Content-Type: text/plain; charset="UTF-8"

Hi,

I can confirm that this will fix the issue. I also  applied the same patch
a few weeks ago, but was not yet able to upstream it since I'm on holiday.

Kr,

Thomas

Op ma 8 jul. 2024 13:52 schreef Peter Korsgaard <peter@korsgaard.com>:

> Fixes:
>
> http://autobuild.buildroot.net/results/c08/c08c00f52b8f42fd408a1e84e41606d75558c3ce/
>
> The embedded librdkafka copy unconditionally enables calls the (deprecated)
> ENGINE_* logic in openssl:
>
>
> https://github.com/confluentinc/librdkafka/blob/v2.4.0/src/rdkafka_conf.h#L37
>
> Which are now no longer available in !BR2_PACKAGE_LIBOPENSSL_ENGINES builds
> since commit 623d3bbe43 (package/libopenssl: no-engine), so enable it to
> fix
> the build issue.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/fluent-bit/Config.in | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
> index 53284ee17d..697cb1bf15 100644
> --- a/package/fluent-bit/Config.in
> +++ b/package/fluent-bit/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_FLUENT_BIT
>         select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
>         select BR2_PACKAGE_OPENSSL
>         select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
> +       select BR2_PACKAGE_LIBOPENSSL_ENGINES # needed by bundled
> librdkafka
>         select BR2_PACKAGE_LIBYAML
>         help
>           Fast and Lightweight Logs and Metrics processor.
> --
> 2.39.2
>
>
>

--000000000000cb718e061cbbd729
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi,</p>
<p dir=3D"ltr">I can confirm that this will fix the issue. I also=C2=A0 app=
lied the same patch a few weeks ago, but was not yet able to upstream it si=
nce I&#39;m on holiday. </p>
<p dir=3D"ltr">Kr,</p>
<p dir=3D"ltr">Thomas </p>
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Op ma =
8 jul. 2024 13:52 schreef Peter Korsgaard &lt;<a href=3D"mailto:peter@korsg=
aard.com">peter@korsgaard.com</a>&gt;:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">Fixes:<br>
<a href=3D"http://autobuild.buildroot.net/results/c08/c08c00f52b8f42fd408a1=
e84e41606d75558c3ce/" rel=3D"noreferrer noreferrer" target=3D"_blank">http:=
//autobuild.buildroot.net/results/c08/c08c00f52b8f42fd408a1e84e41606d75558c=
3ce/</a><br>
<br>
The embedded librdkafka copy unconditionally enables calls the (deprecated)=
<br>
ENGINE_* logic in openssl:<br>
<br>
<a href=3D"https://github.com/confluentinc/librdkafka/blob/v2.4.0/src/rdkaf=
ka_conf.h#L37" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/confluentinc/librdkafka/blob/v2.4.0/src/rdkafka_conf.h#L37</a><br>
<br>
Which are now no longer available in !BR2_PACKAGE_LIBOPENSSL_ENGINES builds=
<br>
since commit 623d3bbe43 (package/libopenssl: no-engine), so enable it to fi=
x<br>
the build issue.<br>
<br>
Signed-off-by: Peter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com" t=
arget=3D"_blank" rel=3D"noreferrer">peter@korsgaard.com</a>&gt;<br>
---<br>
=C2=A0package/fluent-bit/Config.in | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in<br=
>
index 53284ee17d..697cb1bf15 100644<br>
--- a/package/fluent-bit/Config.in<br>
+++ b/package/fluent-bit/Config.in<br>
@@ -6,6 +6,7 @@ config BR2_PACKAGE_FLUENT_BIT<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_U=
SES_GLIBC<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_OPENSSL<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBOPENSSL_ENGINES # needed =
by bundled librdkafka<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_LIBYAML<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Fast and Lightweight Logs and Metrics pr=
ocessor.<br>
-- <br>
2.39.2<br>
<br>
<br>
</blockquote></div>

--000000000000cb718e061cbbd729--

--===============8725673211988001060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8725673211988001060==--
