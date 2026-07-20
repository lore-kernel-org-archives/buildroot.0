Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AA2C44529
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 20:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8262405BE;
	Mon, 20 Jul 2026 20:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vSLmdxtOQeKC; Mon, 20 Jul 2026 20:44:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00DBB405C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784580240;
	bh=2DAwJHKxIXdT7YL+uPzolpL7ksa0kmEuWH1b1Lm4OYA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QroDp+CUF5bLLtgZ2VFoomNTfK0ARUQ4xjaXN4wrB84amZBUxqHlTeFwvLr3zB/lh
	 /V3n+d5lWKxs0LfNP6D3HTUMvEiKN3hMqJzMF96BgIdnMP26hq41S6MUJDFsHg9300
	 nYtFDCoaUMnRqjyGm14UYN272kRIimzQ17Xj8kV4tGz+6Hkbtm9VR3eSLQETtwdamR
	 AxH7IhyMtb91DOZ1S2VIYR7YwXLoAwqsk5mo2p96TmesxDptNZPpPy4OSrQh2PcV4V
	 28JsWfUmmBE0VbbDwBdgKIInb8R9gA16/NtHGoODkB8lfOx0EcqlUwxbkR/vMQUu4c
	 IiIhIE9KQ5JZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00DBB405C2;
	Mon, 20 Jul 2026 20:44:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 863DB224
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 20:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AB7B80AAF
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 20:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BiTkm0rEZvDJ for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 20:43:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5C20180AA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C20180AA1
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C20180AA1
 for <buildroot@busybox.net>; Mon, 20 Jul 2026 20:43:57 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-472326ca506so8175478f8f.2
 for <buildroot@busybox.net>; Mon, 20 Jul 2026 13:43:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784580235; cv=none;
 d=google.com; s=arc-20260327;
 b=N3GxE9uWv/LKo1OJ8X3ec7JfV1oLsiJY6damZdVTe9UrFp9DEMK9a/zi3SwvHP3yqL
 0p8Ns0+JqMtx5Gp2kMkVy+tVxi1FEY4+Z0s1GgcCGyBVqAuTaikd6lrzaMrhUhEGayQO
 HOc0foX7CpAHWxOm/aeMQM0NsEoCKJh+XyJ9SzymYu38eySnxQwwpssIDmLuJ7m9BEvL
 OFlT3Jq48JsroNBFSgiRADYIj3mo2v7wlCQcPBjoh3gDGAcIMFNL6oo3TRS3vuUQl1a5
 ESS+qtz5JWy5B80lfXw1xMr/kSp13ujgEhZT06lDC+QKp+CpP83GFnHClZKKzdFN1OtK
 R/rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=r0MsMsduVRaq/yMQGh4AIbeH8Vhl/JS48M4UsHIt7cA=;
 fh=VNw8oRJ4yDo+R8ejTeA7f8DeFOcMqW8WglK3J8mppws=;
 b=iaLynxbajkl/61OWVnyccQ7Cw3YwRMGPZnuIbekA/Ug/N3y5hImmDWGRTA3qzOqKLy
 gNua+KOrk5GF98AEwC/X9L5ndQYc3G06gUM0tdd5fhzBMmjKGNoe4LaAvIHyot5BIbP1
 X7jHOIxWDZ4HUv8zbuXivJOW0m0zErtCB7HOLafkl20Q+uhsoZ5/81VXJ/sEuyqUCxJI
 PWtBmAv5AtnU6XyKU6Qwnw23rmmbW+inR9PKgYUAOkxuqQuknfyXJG1szaJtaq7hS6RO
 heWntfytbUsZZMRmCCTPVkSkQJb7b80mfo+X6+PkbrLDy/0GMKfZFF7rcKP58wJ/yJxF
 ZqCQ==; darn=busybox.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784580235; x=1785185035;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=r0MsMsduVRaq/yMQGh4AIbeH8Vhl/JS48M4UsHIt7cA=;
 b=sDxgt5NnP8LIGpX/CooaaZQzEuT6XpeYRoVs3mjpwDvPednnCiGvFSzHHJU7bAgMOl
 8wnKE9eMqmyiUnQpwchOEynQOtiojwOI/Buf4xN1ylYYdGdq4PKgw9XdgChrFRrqbOsD
 0CXQ2IIEcvqzW17upJQt1KdQCN45Y95TENJIN1LL6UGZRsL22Q0OhLdfuVmOYEABOrjq
 uz4sXL9pjqeb2NM92CpH7ih0lKwlKGkpbAsbVKOQPmSwQ8yikptt55KIMiFx7Vr/36JZ
 iSbQ0eIQbjWlJ4NdfsWEQ0AyfIHdfPZe9OepVgJeW5rsLWJw+UdbBf9u3ds33akS1H2G
 pf6g==
X-Gm-Message-State: AOJu0YyYp9AN+WTb4/Eyw+0vz0RzFqUJEdb9K2QgxZ/3RCO56xcQTKXl
 Up1104K2HZHh6qSQkcn04UZNRKWxJwStyTf8cg2ewBZjK9DqXLg7hnImDTkn8cjc8OcuSlkKm8X
 1buVT+Ybvrqht40ZVhezu2cJo+ubx0CSEeA==
X-Gm-Gg: AR+sD10oWAz/NJ+StKjzo+w2FCHktH9Zt3dKi5LREPYAXjvWQc6FqONyxsTuOLnlwMT
 0NBqP08FfTi0STjPuPxO4ATz7gQh2zrfRKt+n//zDiPMSz2gYZSkbmHekG/GE2ho8DTJW55BkGT
 3XAxgJ75Jg2fcEShTIohgyt+XuJvCWFyMr//C0aDyNFg5MgzQVefYYkUR4Co5RRTtT39Ey+Lo/x
 vVeh6NIUlqp/pPXGbYE9Q0o/dzZrlltMcTP7YzLc4eb319EmEFyiAa8Rq3CMEyYicHTMPeEIwi4
 N5jXiKydL7b7zeXgpWUEbbteY1f/sUg=
X-Received: by 2002:a5d:5f91:0:b0:46f:7d90:8121 with SMTP id
 ffacd0b85a97d-47f62305661mr19916174f8f.14.1784580235004; Mon, 20 Jul 2026
 13:43:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260720150236.243961-1-francois.perrad@gadz.org>
 <20260720150236.243961-2-francois.perrad@gadz.org> <871pcxprvl.fsf@tarshish>
In-Reply-To: <871pcxprvl.fsf@tarshish>
From: =?UTF-8?Q?Fran=C3=A7ois_PERRAD?= <francois.perrad.86@gmail.com>
Date: Mon, 20 Jul 2026 22:43:42 +0200
X-Gm-Features: AUfX_mwmK3hSSd2wtGu1sEqjK3WuSRs2vvMKNAcW0RDcYuB4aNXVkbDj3aHGf84
Message-ID: <CAMTop8_W_ZjJmiBvHZDMsUtmVXV1k2YbLEWRQoquQt0QPOG1_Q@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@busybox.net
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784580235; x=1785185035; darn=busybox.net;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=r0MsMsduVRaq/yMQGh4AIbeH8Vhl/JS48M4UsHIt7cA=;
 b=To8nY0owxURRuDb9qYLye4sZKQhxNDpvbiQA8GFnOjrH3k2yGhchBVBnhL9XYn4yt7
 AzW7+RlnHmpSi4dGhbJWR0In+9Z1iiR/KCa3Ku0HWu3/RKXfdEGnVwsLW+9VsYaiaXyq
 Zw+7o4LHP+OchzveHNbtPe/6Hr+qSj3ggxhxjN57xkqcVhrdBmaa17tWAzFq3UvS26kK
 C4ND02PlchZvYaRBAI/UsPnMXlUG0ZTNQQocirkJCRy/KrR6wEX9FlIfCl+hXp5p/Dt+
 46PqPVBFjSpJnB2mOTFaevgpk0NyMducSImgHGLSCdL5vjQLClq3/MC+21pnok/covo9
 E7KA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=To8nY0ow
Subject: Re: [Buildroot] [PATCH v2 1/8] package/qbe: new host package
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
Content-Type: multipart/mixed; boundary="===============2760163306344206847=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2760163306344206847==
Content-Type: multipart/alternative; boundary="000000000000fb0d9d065710f670"

--000000000000fb0d9d065710f670
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 20 juil. 2026 =C3=A0 18:06, Baruch Siach <baruch@tkos.co.il> a =C3=
=A9crit :

> Hi Francois,
>
> On Mon, Jul 20 2026, Francois Perrad wrote:
> > dependency for host-hare
>
> [...]
>
> > diff --git a/package/qbe/qbe.mk b/package/qbe/qbe.mk
> > new file mode 100644
> > index 000000000..a6e3e4d57
> > --- /dev/null
> > +++ b/package/qbe/qbe.mk
> > @@ -0,0 +1,22 @@
> >
> +########################################################################=
########
> > +#
> > +# qbe
> > +#
> >
> +########################################################################=
########
> > +
> > +QBE_VERSION =3D 1.2
>
> Any reason to prefer 1.2 over the latest 1.3 version?
>
> baruch
>
>
Hare 0.26.0 was developed & tested with QBE 1.2.
QBE 1.3 will wait for the next Hare release.

Fran=C3=A7ois


> > +QBE_SITE =3D https://c9x.me/compile/release
> > +QBE_SOURCE =3D qbe-$(QBE_VERSION).tar.xz
> > +QBE_LICENSE =3D MIT
> > +QBE_LICENSE_FILES =3D LICENSE
> > +
> > +define HOST_QBE_BUILD_CMDS
> > +     $(HOST_MAKE_ENV) $(MAKE) -C $(@D)
> > +endef
> > +
> > +define HOST_QBE_INSTALL_CMDS
> > +     $(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
> > +             PREFIX=3D/usr DESTDIR=3D"$(HOST_DIR)" install
> > +endef
> > +
> > +$(eval $(host-generic-package))
>
> --
>                                                      ~. .~   Tk Open
> Systems
> =3D}------------------------------------------------ooO--U--Ooo----------=
--{=3D
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
>

--000000000000fb0d9d065710f670
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 20=
 juil. 2026 =C3=A0=C2=A018:06, Baruch Siach &lt;<a href=3D"mailto:baruch@tk=
os.co.il">baruch@tkos.co.il</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Hi Francois,<br>
<br>
On Mon, Jul 20 2026, Francois Perrad wrote:<br>
&gt; dependency for host-hare<br>
<br>
[...]<br>
<br>
&gt; diff --git a/package/qbe/<a href=3D"http://qbe.mk" rel=3D"noreferrer" =
target=3D"_blank">qbe.mk</a> b/package/qbe/<a href=3D"http://qbe.mk" rel=3D=
"noreferrer" target=3D"_blank">qbe.mk</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000..a6e3e4d57<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/qbe/<a href=3D"http://qbe.mk" rel=3D"noreferrer" target=
=3D"_blank">qbe.mk</a><br>
&gt; @@ -0,0 +1,22 @@<br>
&gt; +#####################################################################=
###########<br>
&gt; +#<br>
&gt; +# qbe<br>
&gt; +#<br>
&gt; +#####################################################################=
###########<br>
&gt; +<br>
&gt; +QBE_VERSION =3D 1.2<br>
<br>
Any reason to prefer 1.2 over the latest 1.3 version?<br>
<br>
baruch<br>
<br></blockquote><div><br></div><div>Hare 0.26.0 was developed &amp; tested=
 with QBE 1.2.</div><div>QBE 1.3 will wait for the next Hare release.</div>=
<div><br></div><div>Fran=C3=A7ois</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
&gt; +QBE_SITE =3D <a href=3D"https://c9x.me/compile/release" rel=3D"norefe=
rrer" target=3D"_blank">https://c9x.me/compile/release</a><br>
&gt; +QBE_SOURCE =3D qbe-$(QBE_VERSION).tar.xz<br>
&gt; +QBE_LICENSE =3D MIT<br>
&gt; +QBE_LICENSE_FILES =3D LICENSE<br>
&gt; +<br>
&gt; +define HOST_QBE_BUILD_CMDS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(HOST_MAKE_ENV) $(MAKE) -C $(@D)<br>
&gt; +endef<br>
&gt; +<br>
&gt; +define HOST_QBE_INSTALL_CMDS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PREFIX=3D/usr DESTDIR=
=3D&quot;$(HOST_DIR)&quot; install<br>
&gt; +endef<br>
&gt; +<br>
&gt; +$(eval $(host-generic-package))<br>
<br>
-- <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~. .~=C2=A0 =C2=A0Tk Open Systems<=
br>
=3D}------------------------------------------------ooO--U--Ooo------------=
{=3D<br>
=C2=A0 =C2=A0- <a href=3D"mailto:baruch@tkos.co.il" target=3D"_blank">baruc=
h@tkos.co.il</a> - tel: +972.52.368.4656, <a href=3D"http://www.tkos.co.il"=
 rel=3D"noreferrer" target=3D"_blank">http://www.tkos.co.il</a> -<br>
</blockquote></div></div>

--000000000000fb0d9d065710f670--

--===============2760163306344206847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2760163306344206847==--
