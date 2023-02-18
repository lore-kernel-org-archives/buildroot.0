Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3FAC636CC
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 15:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EBEB41CA5;
	Sat, 18 Feb 2023 15:57:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EBEB41CA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UYkzvsHlM0yh; Sat, 18 Feb 2023 15:57:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE9A741CA0;
	Sat, 18 Feb 2023 15:57:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE9A741CA0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 88E601BF3EC
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 15:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62DC241CA0
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 15:57:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62DC241CA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xb9kAsEVyCrd for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 15:56:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A72B141C9E
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A72B141C9E
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 15:56:59 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id bi22so678545oib.9
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 07:56:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/+3eGoKbtotoOCA0wCGmluW1X+zVv0OZXfbWk+bXeDI=;
 b=EQycVudEJuoDMMCi1iRRHO8UDbG/rZcGlhAWTZki7HwetkBenzbcu/HiYKEfCBjnIf
 4jg+szaXz7qi1n2YPReskc2M8G4ERzRqzjwJfow8JcAJZdSFFyo6OIg5+SXQtSrHtK41
 lJ8l1W/o4m7cLdX7+Esm6ZzoTRagBdWpD+t3/NKvZxsrTcrjbAIEYVeUtjjucnsPzQxo
 iukpHCts/es8c1Sf2YiI4wku7W/RFXf4a1pcEEElJmDN3R7KomyB6WRkKNlUF210m0cc
 JzmMqsf+MxLg7bQSH0Fb4IKLB76E/2Jf0GTayx0Juir3e1xciNI9lw9c9KxMI51NIcAx
 XyTA==
X-Gm-Message-State: AO0yUKV7jAbq2dDbPOAO5iEkTwBgloEb7Uc38L9X8YUEJ2LtxDAuiRnX
 wnAzC1MEKPFwk7CdvucOjd1oFh5xoHJbvkj1kNBXOi2svSQ=
X-Google-Smtp-Source: AK7set9qg3SzQK/P18MAi8NVu07RZiA0oHjnAXe4QjN6mnBOKLBZpcX/97aqS7lrXF4tN7UGfKq4B382hxUChff6sWg=
X-Received: by 2002:a05:6808:2385:b0:367:18a6:eb14 with SMTP id
 bp5-20020a056808238500b0036718a6eb14mr865807oib.208.1676735818480; Sat, 18
 Feb 2023 07:56:58 -0800 (PST)
MIME-Version: 1.0
References: <CADYjeStG8bZEBprwqez+_3+n-HZ5pG9p8mBySxV+4FU7GM0r3g@mail.gmail.com>
 <20230218121940.7442410e@windsurf>
 <CADYjeSuzT5ueq5F5SQvib87d1HCKXLj565mW-Rm91N7Na1KrDQ@mail.gmail.com>
 <20230218141937.60c307f7@windsurf> <20230218142115.GC2718518@scaer>
 <20230218153216.GD2718518@scaer>
In-Reply-To: <20230218153216.GD2718518@scaer>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Sat, 18 Feb 2023 16:56:49 +0100
Message-ID: <CADYjeStKgyabCLrM8QaoU3fsUZ3KChGxzYw6mr2tMmPgYBxYFw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/+3eGoKbtotoOCA0wCGmluW1X+zVv0OZXfbWk+bXeDI=;
 b=aRyoWs1rEPQoh0CXljHtORKlFln2UJZt2s/SHvbfykuBYqaBK6Tve+91q41Ad68t9a
 d5lU23JMtbMuREVzc7j0uH/cqg5p1xjCo1zkiFYW/+LOJRwJIiOx5ICL5tG9Duv9qPOV
 abifP7hav3kPKPokmXNb4k2z/m5DcdNAmzypcNwiRMq/1tpmBMjfORrtWX+fRgCa7j8X
 2rc03tFDUwT05LdczxUH9sDf0IRANKfVyk6tcArOFTmaqwAj/wx6OVgbAYNOuntCu5Rt
 UiYeMwUNjgKJdlVSgb/dVjdIjQ/q7LzP+mbE6pue3r48Yq2/8gZx0l+YZIGNEZS1UYea
 /zuw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aRyoWs1r
Subject: Re: [Buildroot] Updating trust store using update-ca-certificates
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5269733022660184959=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5269733022660184959==
Content-Type: multipart/alternative; boundary="000000000000d7c72405f4fb7afb"

--000000000000d7c72405f4fb7afb
Content-Type: text/plain; charset="UTF-8"

Hello Yann, All,

Thanks for the update.

Yes, I will try this patch and let you know.

Also, we do remove update-ca-certificates on purpose from TARGET_DIR,
> because it is not expected that we need/can regenerate the root bundle
> on the target.
>

I am not sure if I understood this completely. I have a generic question:
What if someone wants to update castore on the target itself. Let's say if
the local CA is already available on the target then how can it be added to
the trust store with update-ca-certificates? Is it not a good option to
include "update-ca-certificates" in TARGET_DIR?

On Sat, 18 Feb 2023 at 16:32, Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> Thomas, Sourabh, All,
>
> On 2023-02-18 15:21 +0100, Yann E. MORIN spake thusly:
> > On 2023-02-18 14:19 +0100, Thomas Petazzoni via buildroot spake thusly:
> > > On Sat, 18 Feb 2023 13:54:15 +0100
> > > Sourabh Hegde <hrsourabh011@gmail.com> wrote:
> > > > I was thinking the ca-certificates package will take care of this.
> Maybe I
> > > > was wrong.
> > > > So, how should we add local CA to the trust store in the target?
> > > I am not sure as I'm not super familiar with that aspect. If what you
> > > need to do is to call update-ca-certificates during the build, then we
> > > could potentially build it for the host, and run it as a post-build
> > > script. Of course, this assumes update-ca-certificates is capable of
> > > doing its work on a root filesystem that isn't at the root.
>
> No, update-ca-certificates does not know how to work out-of-tree, which
> is the reason why we already need to handle it manually when we install
> ca-certificates.
>
> Also, we do remove update-ca-certificates on purpose from TARGET_DIR,
> because it is not expected that we need/can regenerate the root bundle
> on the target.
>
> > > Do you have more details about what needs to be done? With more
> > > details, we could probably give some more useful hints.
> >
> > I think we just need to split CA_CERTIFICATES_INSTALL_TARGET_CMDS in two:
> > one part to actually instll the certifcates provided by ca-certificates
> > itself, and the rest to update the castore with all certificate, as a
> > target-finalize hook.
> >
> > I.e. all that starts from "Remove any existing certificates under
> > /etc/ssl/certs" should be moved to a target-finalize hook.
>
> Basically, something around those lines (totally untested):
>
> diff --git a/package/ca-certificates/ca-certificates.mk
> b/package/ca-certificates/ca-certificates.mk
> index 0b6962ab7b..cc55d39957 100644
> --- a/package/ca-certificates/ca-certificates.mk
> +++ b/package/ca-certificates/ca-certificates.mk
> @@ -20,7 +20,9 @@ define CA_CERTIFICATES_INSTALL_TARGET_CMDS
>         $(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/ssl/certs
>         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
>         rm -f $(TARGET_DIR)/usr/sbin/update-ca-certificates
> +endef
>
> +define CA_CERTIFICATES_GEN_BUNDLE
>         # Remove any existing certificates under /etc/ssl/certs
>         rm -f $(TARGET_DIR)/etc/ssl/certs/*
>
> @@ -30,14 +32,15 @@ define CA_CERTIFICATES_INSTALL_TARGET_CMDS
>         for i in `find usr/share/ca-certificates -name "*.crt" |
> LC_COLLATE=C sort` ; do \
>                 ln -sf ../../../$$i etc/ssl/certs/`basename $${i}
> .crt`.pem ;\
>                 cat $$i ;\
> -       done >$(@D)/ca-certificates.crt
> +       done >$(BUILD_DIR)/ca-certificates.crt
>
>         # Create symlinks to the certificates by their hash values
>         $(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
>
>         # Install the certificates bundle
> -       $(INSTALL) -D -m 644 $(@D)/ca-certificates.crt \
> +       $(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
>                 $(TARGET_DIR)/etc/ssl/certs/ca-certificates.crt
>  endef
> +CA_CERTIFICATES_TARGET_FINALIZE_HOOKS += CA_CERTIFICATES_GEN_BUNDLE
>
>  $(eval $(generic-package))
>
> Sourabh, can you test and adapt that and report, please?
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>

--000000000000d7c72405f4fb7afb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello=C2=A0Yann, All,<div><br></div><div>Thanks for the up=
date.</div><div><br></div><div>Yes, I will try this patch and let you know.=
</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Also=
, we do remove update-ca-certificates on purpose from TARGET_DIR,<br>becaus=
e it is not expected that we need/can regenerate the root bundle<br>on the =
target.<br></blockquote><div><br></div><div>I am not sure if I understood t=
his completely. I have a generic question: What if someone wants to update =
castore on the target itself. Let&#39;s say if the local CA is already avai=
lable on the target then how can it be added to the trust store with update=
-ca-certificates? Is it not a good option to include &quot;update-ca-certif=
icates&quot; in TARGET_DIR?</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Sat, 18 Feb 2023 at 16:32, Yann E. MORI=
N &lt;<a href=3D"mailto:yann.morin.1998@free.fr">yann.morin.1998@free.fr</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Tho=
mas, Sourabh, All,<br>
<br>
On 2023-02-18 15:21 +0100, Yann E. MORIN spake thusly:<br>
&gt; On 2023-02-18 14:19 +0100, Thomas Petazzoni via buildroot spake thusly=
:<br>
&gt; &gt; On Sat, 18 Feb 2023 13:54:15 +0100<br>
&gt; &gt; Sourabh Hegde &lt;<a href=3D"mailto:hrsourabh011@gmail.com" targe=
t=3D"_blank">hrsourabh011@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; I was thinking the ca-certificates package will take care of=
 this. Maybe I<br>
&gt; &gt; &gt; was wrong.<br>
&gt; &gt; &gt; So, how should we add local CA to the trust store in the tar=
get?<br>
&gt; &gt; I am not sure as I&#39;m not super familiar with that aspect. If =
what you<br>
&gt; &gt; need to do is to call update-ca-certificates during the build, th=
en we<br>
&gt; &gt; could potentially build it for the host, and run it as a post-bui=
ld<br>
&gt; &gt; script. Of course, this assumes update-ca-certificates is capable=
 of<br>
&gt; &gt; doing its work on a root filesystem that isn&#39;t at the root.<b=
r>
<br>
No, update-ca-certificates does not know how to work out-of-tree, which<br>
is the reason why we already need to handle it manually when we install<br>
ca-certificates.<br>
<br>
Also, we do remove update-ca-certificates on purpose from TARGET_DIR,<br>
because it is not expected that we need/can regenerate the root bundle<br>
on the target.<br>
<br>
&gt; &gt; Do you have more details about what needs to be done? With more<b=
r>
&gt; &gt; details, we could probably give some more useful hints.<br>
&gt; <br>
&gt; I think we just need to split CA_CERTIFICATES_INSTALL_TARGET_CMDS in t=
wo:<br>
&gt; one part to actually instll the certifcates provided by ca-certificate=
s<br>
&gt; itself, and the rest to update the castore with all certificate, as a<=
br>
&gt; target-finalize hook.<br>
&gt; <br>
&gt; I.e. all that starts from &quot;Remove any existing certificates under=
<br>
&gt; /etc/ssl/certs&quot; should be moved to a target-finalize hook.<br>
<br>
Basically, something around those lines (totally untested):<br>
<br>
diff --git a/package/ca-certificates/<a href=3D"http://ca-certificates.mk" =
rel=3D"noreferrer" target=3D"_blank">ca-certificates.mk</a> b/package/ca-ce=
rtificates/<a href=3D"http://ca-certificates.mk" rel=3D"noreferrer" target=
=3D"_blank">ca-certificates.mk</a><br>
index 0b6962ab7b..cc55d39957 100644<br>
--- a/package/ca-certificates/<a href=3D"http://ca-certificates.mk" rel=3D"=
noreferrer" target=3D"_blank">ca-certificates.mk</a><br>
+++ b/package/ca-certificates/<a href=3D"http://ca-certificates.mk" rel=3D"=
noreferrer" target=3D"_blank">ca-certificates.mk</a><br>
@@ -20,7 +20,9 @@ define CA_CERTIFICATES_INSTALL_TARGET_CMDS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/ssl/cer=
ts<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DES=
TDIR=3D$(TARGET_DIR)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f $(TARGET_DIR)/usr/sbin/update-ca-certific=
ates<br>
+endef<br>
<br>
+define CA_CERTIFICATES_GEN_BUNDLE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove any existing certificates under /etc/s=
sl/certs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f $(TARGET_DIR)/etc/ssl/certs/*<br>
<br>
@@ -30,14 +32,15 @@ define CA_CERTIFICATES_INSTALL_TARGET_CMDS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in `find usr/share/ca-certificates -name =
&quot;*.crt&quot; | LC_COLLATE=3DC sort` ; do \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ../../../$$i=
 etc/ssl/certs/`basename $${i} .crt`.pem ;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cat $$i ;\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0done &gt;$(@D)/ca-certificates.crt<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done &gt;$(BUILD_DIR)/ca-certificates.crt<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Create symlinks to the certificates by their =
hash values<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/=
certs<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Install the certificates bundle<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 644 $(@D)/ca-certificates.crt =
\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificat=
es.crt \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TARGET_DIR)/etc/s=
sl/certs/ca-certificates.crt<br>
=C2=A0endef<br>
+CA_CERTIFICATES_TARGET_FINALIZE_HOOKS +=3D CA_CERTIFICATES_GEN_BUNDLE<br>
<br>
=C2=A0$(eval $(generic-package))<br>
<br>
Sourabh, can you test and adapt that and report, please?<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
-- <br>
.-----------------.--------------------.------------------.----------------=
----.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer" target=3D"_bl=
ank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =C2=A0 =
|=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
</blockquote></div>

--000000000000d7c72405f4fb7afb--

--===============5269733022660184959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5269733022660184959==--
