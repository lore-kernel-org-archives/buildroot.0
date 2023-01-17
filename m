Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1E6C38142
	for <buildroot@archiver.kernel.org>; Tue, 17 Jan 2023 23:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0E0D409D3;
	Tue, 17 Jan 2023 23:48:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0E0D409D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ldu-yraZg30j; Tue, 17 Jan 2023 23:48:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFE024061F;
	Tue, 17 Jan 2023 23:48:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFE024061F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B0BBD1BF33F
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 23:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8593981E1F
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 23:48:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8593981E1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rc5FOKl7WVeO for <buildroot@lists.busybox.net>;
 Tue, 17 Jan 2023 23:48:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66B6E81E19
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66B6E81E19
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 23:48:00 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id pa22so17017547qkn.9
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 15:48:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=imkEUTgLuFY6vgvtyJ8RQ75oLADEQ01u0fQbF8ZHsK8=;
 b=f8FRfFSomhOgtrgA2GPpqRrwH9i4e5Gopvc+08FHF77kFQuDxY4u2oG2mBo8gkHr35
 xaIQoaTWkIycW51PTIX5rUhXb4BsRZZYAIiz5g3Yoav+zvhQrM8a+ngdwGuDvV5U8eur
 R3VXoZr8Uk7H+M7fsz3D4QNmf5uw5YCEamplG9uC9D6G9bYdP0CD8ocTzZ7eCdmehUvE
 uL6qgNZ6zP8cjxC5PXb2YnpEoNsrymXKnxWGA5Mw1GqgJU3y9L8wftoCUk3v6g7hucIt
 RNnkc77+KE6ktnwrwclzT9bAZ8O3m+fpzV1DyPQDK1BducKURavlnfmABhpcnfD4wy1p
 mWYQ==
X-Gm-Message-State: AFqh2krI5YhgW6poTW2+jTEHwUtvUzt/kOMQKPgF3v7fP5j1QORzxAJE
 nZOdwvkpLCH/nn9rcG1lQ6z1WLS/BQ52abS56C8=
X-Google-Smtp-Source: AMrXdXu2CHhM11a9Rfd6a/rzD5vmCbgw+v15JKQn25hHSGr5/ksHlPKbKvtdwjlh+5hfHI4jE7dpX1yLo4t4vNORTT8=
X-Received: by 2002:a05:620a:2aee:b0:705:f3c6:47f6 with SMTP id
 bn46-20020a05620a2aee00b00705f3c647f6mr266821qkb.639.1673999279103; Tue, 17
 Jan 2023 15:47:59 -0800 (PST)
MIME-Version: 1.0
References: <20230117205630.221898-1-casey@xogium.me>
In-Reply-To: <20230117205630.221898-1-casey@xogium.me>
From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 18 Jan 2023 00:47:48 +0100
Message-ID: <CADYdroNyMxqV-_vMfGXPu17YChy1Qg=7ugdrPS_Cw8tTBshi-Q@mail.gmail.com>
To: Casey Reeves <casey@xogium.me>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=imkEUTgLuFY6vgvtyJ8RQ75oLADEQ01u0fQbF8ZHsK8=;
 b=OIX0NyS39p07Kk9sHmM4Yx95kCn8sLr1WG7ABbOBJ16IsyYPnIsF6FTqdB9cQt+Qoa
 QrD3Qi2DoHI30aUeOOQ4uuzJ0H1OI8iffIrNdE3bzxFAfOgaFNO5Dcg7ZBIQFoG0E39v
 JjShOpRhlFE9A0dLambFwENhR20aIzDNfmaCKzvE80WHQSp/JWbaRhrAvGgRaTtncxQN
 zo6MsrTVMJA2h5QsJy1Q6er3wDtklLMXjftQ244jZROlqkCxi3eEsF/spMjKalxoVLz1
 aj30LDef3UNQ4aTCvFQCW1mql/inrI/U/trFFDLgswCjBEh67NULQl98PROPFjhFPCnq
 2b1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OIX0NyS3
Subject: Re: [Buildroot] [PATCH] package/systemd: reenable utmp support
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
Cc: Sen Hastings <sen@phobosdpl.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============8777119851904704142=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8777119851904704142==
Content-Type: multipart/alternative; boundary="00000000000062a22b05f27e5453"

--00000000000062a22b05f27e5453
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Jan 2023, 21:57 Casey Reeves, <casey@xogium.me> wrote:

>     This patch re-enables utmp support. This was originally disabled as it
>     showed information about other users on the system, but this
> information
>     can be found in other ways by a snoopy user (ps, journalctl, loginctl,
>     top)...
>

The smart thing to do would be to use those other ways - because they are
more secure and don't have assumptions that dont hold nowadays (containers
and other isolation methods).


>     More importantly, this behaviour causes tools like uptime and
>     who to falsely state 0 users are logged in. Revert it to fix those
>     applications, as it can be very confusing and is not improving
> security.
>

That's kinda like saying running a webserver on win95 is not a security
risk, because I can run a webserver on Linux too. The problem is not what,
but how.

The gist of the issue is, that you require multiple programs to read and
-modify-write a single file, this is opening race conditions, permission
problems and those security risks.

Buildroot is not a everything-and-the-kitchensink distro, for comparison
alpine has stubs that redirect /run/utmp to /dev/null, basically because
you can't solve this in a good way without a demon [1].

Maybe it would be sound to add symlinks to /dev/null, mimicking alpine, so
uptime should work.

Other than that, bringing in utmps first, and making -Dutmp
configurable/optional would be better.
There is not much use for utmp, and I would object to enabling it
unconditional.

[1] -
https://wiki.musl-libc.org/faq.html#Q:_Why_is_the_utmp/wtmp_functionality_only_implemented_as_stubs
?

    See commit 32f53bdfb482d0d78308e548c654898089b5c183.
>
> Signed-off-by: Casey Reeves <casey@xogium.me>
> ---
>  package/systemd/systemd.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index b96873b73f..92b80dcf6e 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -87,8 +87,7 @@ SYSTEMD_CONF_OPTS += \
>         -Dtelinit-path= \
>         -Dtests=false \
>         -Dtmpfiles=true \
> -       -Dumount-path=/usr/bin/umount \
> -       -Dutmp=false
> +       -Dumount-path=/usr/bin/umount
>
>  SYSTEMD_CFLAGS = $(TARGET_CFLAGS)
>  ifeq ($(BR2_OPTIMIZE_FAST),y)
> --
> 2.39.0
>

Norbert

>

--00000000000062a22b05f27e5453
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 17 Jan 2023, 21:57 Casey Reeves, &lt;<a href=
=3D"mailto:casey@xogium.me" target=3D"_blank" rel=3D"noreferrer">casey@xogi=
um.me</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=C2=A0 =C2=A0 =
This patch re-enables utmp support. This was originally disabled as it<br>
=C2=A0 =C2=A0 showed information about other users on the system, but this =
information<br>
=C2=A0 =C2=A0 can be found in other ways by a snoopy user (ps, journalctl, =
loginctl,<br>
=C2=A0 =C2=A0 top)...<br></blockquote></div></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">The smart thing to do would be to use those other ways=
 - because they are more secure and don&#39;t have assumptions that dont ho=
ld nowadays (containers and other isolation methods).</div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
=C2=A0 =C2=A0 More importantly, this behaviour causes tools like uptime and=
<br>
=C2=A0 =C2=A0 who to falsely state 0 users are logged in. Revert it to fix =
those<br>
=C2=A0 =C2=A0 applications, as it can be very confusing and is not improvin=
g security.<br></blockquote></div></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">That&#39;s kinda like saying running a webserver on win95 is not=
 a security risk, because I can run a webserver on Linux too. The problem i=
s not what, but how.</div><div dir=3D"auto"><br></div><div dir=3D"auto">The=
 gist of the issue is, that you require multiple programs to read and -modi=
fy-write a single file, this is opening race conditions, permission problem=
s and those security risks.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">Buildroot is not a everything-and-the-kitchensink distro, for compariso=
n alpine has stubs that redirect /run/utmp to /dev/null, basically because =
you can&#39;t solve this in a good way without a demon [1].</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Maybe it would be sound to add symlin=
ks to /dev/null, mimicking alpine, so uptime should work.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Other than that, bringing in utmps first,=
 and making -Dutmp configurable/optional would be better.</div><div dir=3D"=
auto">There is not much use for utmp, and I would object to enabling it unc=
onditional.</div><div dir=3D"auto"><br></div><div dir=3D"auto">[1] - <a hre=
f=3D"https://wiki.musl-libc.org/faq.html#Q:_Why_is_the_utmp/wtmp_functional=
ity_only_implemented_as_stubs" target=3D"_blank" rel=3D"noreferrer">https:/=
/wiki.musl-libc.org/faq.html#Q:_Why_is_the_utmp/wtmp_functionality_only_imp=
lemented_as_stubs</a>?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 See commit 32f53bdfb482d0d78308e548c654898089b5c183.<br>
<br>
Signed-off-by: Casey Reeves &lt;<a href=3D"mailto:casey@xogium.me" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">casey@xogium.me</a>&gt;<br>
---<br>
=C2=A0package/systemd/<a href=3D"http://systemd.mk" rel=3D"noreferrer noref=
errer noreferrer" target=3D"_blank">systemd.mk</a> | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/package/systemd/<a href=3D"http://systemd.mk" rel=3D"noreferre=
r noreferrer noreferrer" target=3D"_blank">systemd.mk</a> b/package/systemd=
/<a href=3D"http://systemd.mk" rel=3D"noreferrer noreferrer noreferrer" tar=
get=3D"_blank">systemd.mk</a><br>
index b96873b73f..92b80dcf6e 100644<br>
--- a/package/systemd/<a href=3D"http://systemd.mk" rel=3D"noreferrer noref=
errer noreferrer" target=3D"_blank">systemd.mk</a><br>
+++ b/package/systemd/<a href=3D"http://systemd.mk" rel=3D"noreferrer noref=
errer noreferrer" target=3D"_blank">systemd.mk</a><br>
@@ -87,8 +87,7 @@ SYSTEMD_CONF_OPTS +=3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dtelinit-path=3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dtests=3Dfalse \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dtmpfiles=3Dtrue \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dumount-path=3D/usr/bin/umount \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dutmp=3Dfalse<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dumount-path=3D/usr/bin/umount<br>
<br>
=C2=A0SYSTEMD_CFLAGS =3D $(TARGET_CFLAGS)<br>
=C2=A0ifeq ($(BR2_OPTIMIZE_FAST),y)<br>
-- <br>
2.39.0<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Norbert=C2=A0</div><div dir=3D"auto"><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"></blockquote></div></div><div dir=3D"auto"><br></=
div></div>

--00000000000062a22b05f27e5453--

--===============8777119851904704142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8777119851904704142==--
