Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97623C3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 23:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11D6E41A79;
	Wed,  3 Jan 2024 23:15:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11D6E41A79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H9qvxCjUO60n; Wed,  3 Jan 2024 23:15:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2A4F4193E;
	Wed,  3 Jan 2024 23:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2A4F4193E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C0E21BF3C9
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 23:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 517D36109D
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 23:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 517D36109D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AF03kN62UMP5 for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 23:15:00 +0000 (UTC)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16426610B0
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 23:14:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16426610B0
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-28c9d424cceso679986a91.0
 for <buildroot@buildroot.org>; Wed, 03 Jan 2024 15:14:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704323699; x=1704928499;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NIfDJNHV7LFapcIeAkHpQjWyOe1hkVoa4riNos8jMYM=;
 b=lTf1Rz69afWCyrNpaycOLqXknvF4cISPbG6dW7gCWuuqg6WVQfQCFUJ5IP5qVB+VOh
 umDxKW9iehcg3TJO3JOS8JyGR/EQ6CtjfH6K4t1suT9hpV39Y/EOzvpojeFAswN++cS4
 za+gGmiTmFG0rEnHe5AUdpEpDjfwRCfNsbE5mzL6cCfIdi7xZcHWm8DczIcawN119zua
 /ZaFExVcntpqi82FILrZ1sscKE39ko9uk9slF8OBXfCyTajdcqCRL0wYOWCT1a0P2lOw
 Agpfv76jKTHeCAjvAIpSuBblt0SNEnEJCCJ7nA2EQfyWG7fn1sWEEHB8H0ZNrBYy/TWp
 U8kg==
X-Gm-Message-State: AOJu0YwSL8tuPvSnS1etHA2gGRXOr9xVRj4tEfvB4hSUMASWyzf8OzY8
 VjCCZxiAT7cdnduKDMFPzkfd5I06AHspT6j48Ic04aX3qiQ=
X-Google-Smtp-Source: AGHT+IEHu3eTNeO+nGHMo/jw0FxlOcwIOiX2o8H8LQjlSMp9abTcdq+OjUM1NFkfU7m5H2tZuoMmTuP8zI6zrCvh0XE=
X-Received: by 2002:a17:90b:2401:b0:28b:e70e:b5fa with SMTP id
 nr1-20020a17090b240100b0028be70eb5famr1988687pjb.35.1704323699267; Wed, 03
 Jan 2024 15:14:59 -0800 (PST)
MIME-Version: 1.0
References: <20231220134816.6306-1-jlangholzj@gmail.com>
 <ZZGksUJvkY_8e8PV@landeda>
In-Reply-To: <ZZGksUJvkY_8e8PV@landeda>
From: John Langholz <jlangholzj@gmail.com>
Date: Wed, 3 Jan 2024 18:14:47 -0500
Message-ID: <CAPL9kM1qCDN98Cc_ygYvKHsLgnmjVmD3vDxxPrKsLFjwgnp9RQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704323699; x=1704928499; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NIfDJNHV7LFapcIeAkHpQjWyOe1hkVoa4riNos8jMYM=;
 b=lX/V8fzuXW6Y4a3S3AraXK/foUldopxD5lNQeAiT8yKwiTcVpgt7a+WhH50EmeE8hT
 ucfpy3fvsPGLB5BsAxsFGiJukKnt/YMh0xzk1EiLCOmcHlQQswtukaJkomBZfKu4r9u+
 Lk2Ccn8/Lr3640FAaOupuFfZK02sQ49YRFbOW7wS1TB4VrbvC7BXleZV95jWQA19tsn/
 4dllqQDAVCCuVQK5QoEEqiPZiAhdZ5LEC8oJZzR9JERA9ngh70ybgA5YebA1+UvsRfY9
 V+mUisV/1k+8Zs9BsvvWW5wVzD9BU0ZL2Wdm6AGU2VUcAtGzzJEkHuFHRh6tQiu8Knpa
 3RzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lX/V8fzu
Subject: Re: [Buildroot] [PATCH] package/python3: add tk as core module
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7288771803050207548=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7288771803050207548==
Content-Type: multipart/alternative; boundary="000000000000ad5f7a060e12c8ee"

--000000000000ad5f7a060e12c8ee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yann,

Thanks for the additional input, I've got some questions below. Overall, I
tried hitting the manual the best I could but obviously missed a few
things; I'm new to the git world and buildroot so I appreciate the patience
and extra clarification!

On Sun, Dec 31, 2023 at 12:28=E2=80=AFPM Yann E. MORIN <yann.morin.1998@fre=
e.fr>
wrote:

> John, All,
>
> I see that Thomas already sent a review, and you had further questions,
> so let me try and address them here, as a review of your patch; it's
> going to be basically the same comments as Thomas already provided, but
> I'll try to expand on those.
>
> Also, please do not top-post; instead, reply in-line
>
> On 2023-12-20 08:48 -0500, J. Langholz spake thusly:
> > ---
>
> First, your commit needs a commit log; here it was empty. A commit log
> explains what the situation is, why it needs to change, and how it is
> changed. The "how" part is not a description of the patch; it is an
> explanation. It can all be very brief in the most basic cases, but here
> you may have to explain why the Tk module in python is important.
>
>
Then, your commit will have to be signed-off. The sign-off is described
> in the manual:
>     https://buildroot.org/downloads/manual/manual.html#submitting-patches
>
> Quoting:
>
>     Finally, the patch should be signed off. This is done by adding
>     Signed-off-by: Your Real Name <your@email.address> at the end of the
>     commit message. [...] See the Developer Certificate of Origin [0]
>     for details.
>
>     [0] http://developercertificate.org/
>
>
As mentioned, I had originally included the additional information per the
submitting patches part of the manual [1] in the cover-letter (that didn't
get sent). I see now that it's appropriate for each of the patches to have
that pertinent information in them before the "signed-off by section"
regardless of if a cover-letter is or isn't included. In addition to the
manual, I was referencing some other resources to set-up everything with
git, gitmail, etc. and I think there was just a misunderstanding of the
methodology on my end. For any future changes I'll make sure to include
that appropriately.

[1] https://buildroot.org/downloads/manual/manual.html#submitting-patches


> >  package/python3/Config.in  | 6 ++++++
> >  package/python3/python3.mk | 9 +++++++--
> >  2 files changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/python3/Config.in b/package/python3/Config.in
> > index 38f0580aa4..65afd4e6e2 100644
> > --- a/package/python3/Config.in
> > +++ b/package/python3/Config.in
> > @@ -108,6 +108,12 @@ config BR2_PACKAGE_PYTHON3_SQLITE
> >       help
> >         SQLite database support
> >
> > +config BR2_PACKAGE_PYTHON3_TK
> > +     bool "tk module"
> > +     select BR2_PACKAGE_TK
> > +     help
> > +       tk (a.k.a. tkinter) module support
>
> This new option is in the section dedicated to the python that will run
> on the target. That is, it does not impact the python interpreter used
> at build time.
>
> Since you "select TK", you have to reproduce its dependencies. In this
> case, all but one of the dependencies for TK are already dependencies
> of Python3, and the probability python loses any of those dependencies
> is extremely low, so we can just assume that will never happen, so we
> don't need to expressly propagate them.
>
> Except for the dependency on Xorg. That one you must propagate, because
> Kconfig does not do it automatically. That then needs a little comment
> to inform the user about the missing dependency.
>
> So, ultimately, this new option may look something like:
>
>     config BR2_PACKAGE_PYTHON3_TK
>         bool "tk module"
>         # All other tk dependencies already python dependencies
>         depends on BR2_PACKAGE_XORG7 # tk
>         select BR2_PACKAGE_TK
>         help
>           tk (a.k.a. tkinter) module support
>
>     comment "Tk module needs Xorg"
>         depends on !BR2_PACKAGE_XORG7
>

In my initial reply to Thomas, this is what I was trying to convey. I had
done a few checks on the other dependencies (for tk) but the link to XORG
was one I was unsure about. I don't think tk would ever be used without a
graphical environment (due to its nature) but I agree/understand that
including the dependency makes it the most robust, so I'll include it.
Also, reading through the kconfig documentation [2] I see how the "comment"
line works as well. I had looked through a couple other config files but
wasn't sure on how to include it at the time but it makes sense now.

[2] https://kernel.org/doc/Documentation/kbuild/kconfig-language.txt


> >  config BR2_PACKAGE_PYTHON3_PYEXPAT
> >       bool "xml module"
> >       select BR2_PACKAGE_EXPAT
> > diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> > index b9c5054a21..ca797f8cda 100644
> > --- a/package/python3/python3.mk
> > +++ b/package/python3/python3.mk
> > @@ -20,7 +20,6 @@ HOST_PYTHON3_CONF_OPTS +=3D \
> >       --without-ensurepip \
> >       --without-cxx-main \
> >       --disable-sqlite3 \
> > -     --disable-tk \
>
> [1] This part of the change affects the python interpreter that is built
> for the build machine, not the one that runs on the target, i.e. not the
> one the option defined above applies to.
>
> See later for a further discussion on that matter.
>

Understood, based on the discussion below, I think this can be left as-is
before my changes then. See my response below.

>       --with-expat=3Dsystem \
> >       --disable-curses \
> >       --disable-codecs-cjk \
> > @@ -114,6 +113,13 @@ else
> >  PYTHON3_CONF_OPTS +=3D --disable-openssl
> >  endif
> >
> > +ifeq ($(BR2_PACKAGE_PYTHON3_TK),y)
> > +PYTHON3_DEPENDENCIES +=3D tk
> > +PYTHON3_CONF_OPTS +=3D --enable-tk
> > +else
> > +PYTHON3_CONF_OPTS +=3D --disable-tk
> > +endif
>
> This change, and...
>
> >  ifneq ($(BR2_PACKAGE_PYTHON3_CODECSCJK),y)
> >  PYTHON3_CONF_OPTS +=3D --disable-codecs-cjk
> >  endif
> > @@ -184,7 +190,6 @@ PYTHON3_CONF_OPTS +=3D \
> >       --with-system-ffi \
> >       --disable-pydoc \
> >       --disable-test-modules \
> > -     --disable-tk \
>
> ... this change, do apply to the target python, so they are correct.
>
> So, if all you wanted was the Tk module on the target, what you did was
> almost correct, except for the part [1], and for a non-empty commit log.
>

Correct, the only intent was to include tk on the target. Reading through
this I understand a bit better what Thomas was initially asking. I didn't
fully realize what was going on with the mk file but looking at it now, I
see the comment above the HOST_PYTHON3_CONF_OPTS line and why the local
host needs python for cross-compiling. I'm not 100% sure, but I don't think
the tk module is needed for that purpose and at the very least, it was
functioning fine for other python needs before. Just to be sure I'll update
the changes and re-verify with an image on my end and test it to be sure
before submitting the updated patch.


> In this case, just fix those little nits, and respin a v2 of your patch.
>

With regards to v2 of the patch, I see section (25.5.5) of the manual has
some information on it. I've also made an account on patchwork and found
the original patch to get the messageID. Just to confirm, after I make the
above changes and generate v2 of the patch, the full command for mailing
out the v2 patch would be "$ git send-email --in-reply-to <message-id>"; is
that correct? Or does the "origin/master" option also need to be specified
for the v2 submittal (like what is shown at the end of section 22.5.2)?

Now, if you (also?) wanted the Tk module in the host python interpreter,
> this is going to be a bit more involved. In this case, you'll hit a few
> more issues.
>
> First, we do not have ahost variant of Tk, so you would first need to
> introduce it. We do have a variant of tcl, though, but you'll have to
> see if it is fit (I noticed host-tcl has no dependency on host-zlib;
> that's probably an oversight, and may also need to be fixed).
>
> Then, Tk depends on xlib_libXft, so host-tk would probably also need to
> depend on host-xlib_libXft, but we do not have a host variant of it, so
> you'd need to introduce that as well. And that in turn, has a lot of
> dependencies: fontconfig, freetype, xlib_libX11, xlib_libXext,
> xlib_libXrender, and xorgproto, and you'd need you have a host variant
> for each of them and so on, recursively...
>
> Sine this is going to be a big stack of dependencies, we do not want to
> enable it systematically, so we'd need an option to enable Tk, in a
> similar manner as for the target variant, something like the following,
> in package/python3/Config.in.host:
>
>     config BR2_PACKAGE_HOST_PYTHON3_SSL
>         bool "tk"
>         help
>           Tk module for host python3.
>
> and in package/python3/python3.mk:
>
>     ifeq ($(BR2_PACKAGE_HOST_PYTHON3_TK),y)
>     HOST_PYTHON3_DEPENDENCIES +=3D host-tk
>     HOST_PYTHON3_CONF_OPTS +=3D --enable-tk
>     else
>     HOST_PYTHON3_CONF_OPTS +=3D --disable-tk
>     endif
>
> I am not sure what you explained in your other reply to Thomas, but if
> the underlying explanation was "that will rely on the Tk library as
> provided on the build machine distribution", then this is not going to
> be OK, because we don't require that to be available. So, all the
> dependencies will have to be available in Buildroot if you want to add
> the Tk module in the host python interpreter.
>
> And finally, if you need to have the Tk module in the host python
> interpreter, you'll have to provide a commit log that explains the
> use-case.
>
> As Thomas noted: do we need the host python to have Tk support, so that
> we can build the target python with tk support?
>
> So, if you don't need the Tk module on the host python interpreter, then
> do not add it just for the sake of adding it.
>
> I hope that the above will answer your questions on Thomas' reply.
>
> Do not hesitate to reply further if that was not clear enough.
>
> In the meantime, I'll mark your patch as "changes requested" in
> patchwork.
>
> Regards,
> Yann E. MORIN.
>
> >       --disable-nis \
> >       --disable-idle3 \
> >       --disable-pyc-build
> > --
> > 2.34.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------=
------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There i=
s
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------=
------'
>


--=20
Thanks,

-John Langholz

--000000000000ad5f7a060e12c8ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yann,</div><div><br></div><div>Thanks for the additio=
nal input, I&#39;ve got some questions below. Overall, I tried hitting the =
manual the best I could but obviously missed a few things;
I&#39;m new to the git world and buildroot so I appreciate the patience and=
 extra clarification!

</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Sun, Dec 31, 2023 at 12:28=E2=80=AFPM Yann E. MORIN &lt;<a href=3D"mailt=
o:yann.morin.1998@free.fr">yann.morin.1998@free.fr</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">John, All,<br>
<br>
I see that Thomas already sent a review, and you had further questions,<br>
so let me try and address them here, as a review of your patch; it&#39;s<br=
>
going to be basically the same comments as Thomas already provided, but<br>
I&#39;ll try to expand on those.<br>
<br>
Also, please do not top-post; instead, reply in-line<br>
<br>
On 2023-12-20 08:48 -0500, J. Langholz spake thusly:<br>
&gt; ---<br>
<br>
First, your commit needs a commit log; here it was empty. A commit log<br>
explains what the situation is, why it needs to change, and how it is<br>
changed. The &quot;how&quot; part is not a description of the patch; it is =
an<br>
explanation. It can all be very brief in the most basic cases, but here<br>
you may have to explain why the Tk module in python is important.<br>=C2=A0=
 <br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Then, your commit will have to be signed-off. The sign-off is described<br>
in the manual:<br>
=C2=A0 =C2=A0 <a href=3D"https://buildroot.org/downloads/manual/manual.html=
#submitting-patches" rel=3D"noreferrer" target=3D"_blank">https://buildroot=
.org/downloads/manual/manual.html#submitting-patches</a><br>
<br>
Quoting:<br>
<br>
=C2=A0 =C2=A0 Finally, the patch should be signed off. This is done by addi=
ng<br>
=C2=A0 =C2=A0 Signed-off-by: Your Real Name &lt;your@email.address&gt; at t=
he end of the<br>
=C2=A0 =C2=A0 commit message. [...] See the Developer Certificate of Origin=
 [0]<br>
=C2=A0 =C2=A0 for details.<br>
<br>
=C2=A0 =C2=A0 [0] <a href=3D"http://developercertificate.org/" rel=3D"noref=
errer" target=3D"_blank">http://developercertificate.org/</a><br>
<br></blockquote><div><br></div><div>As mentioned, I had originally include=
d the additional information per the=20
submitting patches part of the manual [1]=20
in the cover-letter (that didn&#39;t get sent). I see now that it&#39;s app=
ropriate for each of the patches to have that pertinent information in them=
 before the &quot;signed-off by section&quot; regardless of if a cover-lett=
er is or isn&#39;t included. In addition to the manual, I was referencing s=
ome other resources to set-up everything with git, gitmail, etc. and I thin=
k there was just a misunderstanding of the methodology on my end.
For any future changes I&#39;ll make sure to include that appropriately.<br=
></div><div><br></div><div>[1] <a href=3D"https://buildroot.org/downloads/m=
anual/manual.html#submitting-patches">https://buildroot.org/downloads/manua=
l/manual.html#submitting-patches</a><br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 package/python3/Config.in=C2=A0 | 6 ++++++<br>
&gt;=C2=A0 package/python3/<a href=3D"http://python3.mk" rel=3D"noreferrer"=
 target=3D"_blank">python3.mk</a> | 9 +++++++--<br>
&gt;=C2=A0 2 files changed, 13 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/python3/Config.in b/package/python3/Config.in<br>
&gt; index 38f0580aa4..65afd4e6e2 100644<br>
&gt; --- a/package/python3/Config.in<br>
&gt; +++ b/package/python3/Config.in<br>
&gt; @@ -108,6 +108,12 @@ config BR2_PACKAGE_PYTHON3_SQLITE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SQLite database support<br>
&gt;=C2=A0 <br>
&gt; +config BR2_PACKAGE_PYTHON3_TK<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;tk module&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_TK<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tk (a.k.a. tkinter) module support<br>
<br>
This new option is in the section dedicated to the python that will run<br>
on the target. That is, it does not impact the python interpreter used<br>
at build time.<br>
<br>
Since you &quot;select TK&quot;, you have to reproduce its dependencies. In=
 this<br>
case, all but one of the dependencies for TK are already dependencies<br>
of Python3, and the probability python loses any of those dependencies<br>
is extremely low, so we can just assume that will never happen, so we<br>
don&#39;t need to expressly propagate them.<br>
<br>
Except for the dependency on Xorg. That one you must propagate, because<br>
Kconfig does not do it automatically. That then needs a little comment<br>
to inform the user about the missing dependency.<br>
<br>
So, ultimately, this new option may look something like:<br>
<br>
=C2=A0 =C2=A0 config BR2_PACKAGE_PYTHON3_TK<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;tk module&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # All other tk dependencies already python depe=
ndencies<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_PACKAGE_XORG7 # tk<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_TK<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tk (a.k.a. tkinter) module support<br>
<br>
=C2=A0 =C2=A0 comment &quot;Tk module needs Xorg&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on !BR2_PACKAGE_XORG7<br></blockquote><=
div><br></div><div>In my initial reply to Thomas, this is what I was trying=
 to convey. I had done a few checks on the other dependencies (for tk) but =
the link to XORG was one I was unsure about. I don&#39;t think tk would eve=
r be used without a graphical environment (due to its nature) but I agree/u=
nderstand that including the dependency makes it the most robust, so I&#39;=
ll include it. Also, reading through the kconfig documentation [2] I see ho=
w the &quot;comment&quot; line works as well. I had looked through a couple=
 other config files but wasn&#39;t sure on how to include it at the time bu=
t it makes sense now.</div><div><br></div><div>[2] <a href=3D"https://kerne=
l.org/doc/Documentation/kbuild/kconfig-language.txt">https://kernel.org/doc=
/Documentation/kbuild/kconfig-language.txt</a><br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 config BR2_PACKAGE_PYTHON3_PYEXPAT<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;xml module&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_EXPAT<br>
&gt; diff --git a/package/python3/<a href=3D"http://python3.mk" rel=3D"nore=
ferrer" target=3D"_blank">python3.mk</a> b/package/python3/<a href=3D"http:=
//python3.mk" rel=3D"noreferrer" target=3D"_blank">python3.mk</a><br>
&gt; index b9c5054a21..ca797f8cda 100644<br>
&gt; --- a/package/python3/<a href=3D"http://python3.mk" rel=3D"noreferrer"=
 target=3D"_blank">python3.mk</a><br>
&gt; +++ b/package/python3/<a href=3D"http://python3.mk" rel=3D"noreferrer"=
 target=3D"_blank">python3.mk</a><br>
&gt; @@ -20,7 +20,6 @@ HOST_PYTHON3_CONF_OPTS +=3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--without-ensurepip \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--without-cxx-main \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-sqlite3 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0--disable-tk \<br>
<br>
[1] This part of the change affects the python interpreter that is built<br=
>
for the build machine, not the one that runs on the target, i.e. not the<br=
>
one the option defined above applies to.<br>
<br>
See later for a further discussion on that matter.<br></blockquote><div>=C2=
=A0</div><div>Understood, based on the discussion below, I think this can b=
e left as-is before my changes then. See my response below.<br></div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--with-expat=3Dsystem \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-curses \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-codecs-cjk \<br>
&gt; @@ -114,6 +113,13 @@ else<br>
&gt;=C2=A0 PYTHON3_CONF_OPTS +=3D --disable-openssl<br>
&gt;=C2=A0 endif<br>
&gt;=C2=A0 <br>
&gt; +ifeq ($(BR2_PACKAGE_PYTHON3_TK),y)<br>
&gt; +PYTHON3_DEPENDENCIES +=3D tk<br>
&gt; +PYTHON3_CONF_OPTS +=3D --enable-tk<br>
&gt; +else<br>
&gt; +PYTHON3_CONF_OPTS +=3D --disable-tk<br>
&gt; +endif<br>
<br>
This change, and...<br>
<br>
&gt;=C2=A0 ifneq ($(BR2_PACKAGE_PYTHON3_CODECSCJK),y)<br>
&gt;=C2=A0 PYTHON3_CONF_OPTS +=3D --disable-codecs-cjk<br>
&gt;=C2=A0 endif<br>
&gt; @@ -184,7 +190,6 @@ PYTHON3_CONF_OPTS +=3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--with-system-ffi \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-pydoc \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-test-modules \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0--disable-tk \<br>
<br>
... this change, do apply to the target python, so they are correct.<br>
<br>
So, if all you wanted was the Tk module on the target, what you did was<br>
almost correct, except for the part [1], and for a non-empty commit log.<br=
></blockquote><div><br></div><div>
<div>Correct, the only intent was to include tk on the=20
target. Reading through this I understand a bit better what Thomas was=20
initially asking. I didn&#39;t fully realize what was going on with the mk =
file but looking at it now, I see the comment above the HOST_PYTHON3_CONF_O=
PTS line and why the local host needs python for cross-compiling. I&#39;m n=
ot 100% sure, but I don&#39;t think the tk module is needed for that purpos=
e and at the very least, it was functioning fine for other python needs bef=
ore. Just to be sure I&#39;ll update the changes and re-verify with an imag=
e on my end and test it to be sure before submitting the updated patch.<br>=
</div>

</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
In this case, just fix those little nits, and respin a v2 of your patch.<br=
></blockquote></div><div class=3D"gmail_quote"><br></div><div class=3D"gmai=
l_quote">With regards to v2 of the patch, I see section (25.5.5) of the man=
ual has some information on it. I&#39;ve also made an account on patchwork =
and found the original patch to get the messageID. Just to confirm, after I=
 make the above changes and generate v2 of the patch, the full command for =
mailing out the v2 patch would be &quot;$ git send-email --in-reply-to &lt;=
message-id&gt;&quot;; is that correct? Or does the &quot;origin/master&quot=
; option also need to be specified for the v2 submittal (like what is shown=
 at the end of section 22.5.2)?<code class=3D"gmail-literal"></code></div><=
div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
Now, if you (also?) wanted the Tk module in the host python interpreter,<br=
>
this is going to be a bit more involved. In this case, you&#39;ll hit a few=
<br>
more issues.<br>
<br>
First, we do not have ahost variant of Tk, so you would first need to<br>
introduce it. We do have a variant of tcl, though, but you&#39;ll have to<b=
r>
see if it is fit (I noticed host-tcl has no dependency on host-zlib;<br>
that&#39;s probably an oversight, and may also need to be fixed).<br>
<br>
Then, Tk depends on xlib_libXft, so host-tk would probably also need to<br>
depend on host-xlib_libXft, but we do not have a host variant of it, so<br>
you&#39;d need to introduce that as well. And that in turn, has a lot of<br=
>
dependencies: fontconfig, freetype, xlib_libX11, xlib_libXext,<br>
xlib_libXrender, and xorgproto, and you&#39;d need you have a host variant<=
br>
for each of them and so on, recursively...<br>
<br>
Sine this is going to be a big stack of dependencies, we do not want to<br>
enable it systematically, so we&#39;d need an option to enable Tk, in a<br>
similar manner as for the target variant, something like the following,<br>
in package/python3/Config.in.host:<br>
<br>
=C2=A0 =C2=A0 config BR2_PACKAGE_HOST_PYTHON3_SSL<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;tk&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Tk module for host python3.<br>
<br>
and in package/python3/<a href=3D"http://python3.mk" rel=3D"noreferrer" tar=
get=3D"_blank">python3.mk</a>:<br>
<br>
=C2=A0 =C2=A0 ifeq ($(BR2_PACKAGE_HOST_PYTHON3_TK),y)<br>
=C2=A0 =C2=A0 HOST_PYTHON3_DEPENDENCIES +=3D host-tk<br>
=C2=A0 =C2=A0 HOST_PYTHON3_CONF_OPTS +=3D --enable-tk<br>
=C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 HOST_PYTHON3_CONF_OPTS +=3D --disable-tk<br>
=C2=A0 =C2=A0 endif<br>
<br>
I am not sure what you explained in your other reply to Thomas, but if<br>
the underlying explanation was &quot;that will rely on the Tk library as<br=
>
provided on the build machine distribution&quot;, then this is not going to=
<br>
be OK, because we don&#39;t require that to be available. So, all the<br>
dependencies will have to be available in Buildroot if you want to add<br>
the Tk module in the host python interpreter.<br>
<br>
And finally, if you need to have the Tk module in the host python<br>
interpreter, you&#39;ll have to provide a commit log that explains the<br>
use-case.<br>
<br>
As Thomas noted: do we need the host python to have Tk support, so that<br>
we can build the target python with tk support?<br>
<br>
So, if you don&#39;t need the Tk module on the host python interpreter, the=
n<br>
do not add it just for the sake of adding it.<br>
<br>
I hope that the above will answer your questions on Thomas&#39; reply.<br>
<br>
Do not hesitate to reply further if that was not clear enough.<br>
<br>
In the meantime, I&#39;ll mark your patch as &quot;changes requested&quot; =
in<br>
patchwork.<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-nis \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-idle3 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-pyc-build<br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
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
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr">Thanks,<div><br></div><div>-John Langholz</div></div></div></div>

--000000000000ad5f7a060e12c8ee--

--===============7288771803050207548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7288771803050207548==--
