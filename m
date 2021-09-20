Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16174C433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 06:01:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A66D61019
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 06:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A66D61019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 066E4607AB;
	Mon, 20 Sep 2021 06:01:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EvDhdu7jPnXG; Mon, 20 Sep 2021 06:01:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21B60607B1;
	Mon, 20 Sep 2021 06:01:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B3CA01BF3F4
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 06:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DDB840364
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 06:01:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zNyVzkrdeipz for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 06:01:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28C45400A4
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 06:01:43 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id v5so56292758edc.2
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 23:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vIf/vqhNUNqIRBEh7o2DH7eUjmcz0xiSSHQ+1RGoLqM=;
 b=Gi28pAiJBDM+pMdnm2RXoG1cfHuXKJnthl6nkQ1lRTy4NK/LuEw8OC/JoBKUoUShCg
 lYAm1IlVQkBUXxoFbqrUx78NmhsSZTYVti7HuTOcQsNZwcQKXq3zK6m+0r5+VSbEfanz
 CwcnSh1Lt5k4xpOjS+RF63SScMTG2O5MEf/DugW5tEJlLFxmS87m+dZkx7XYzhA46Xwh
 qSJ1VEvQt1S2boQsgaHU0btjBo/3df0+/D+x13Z6fntgqjvUwmn75Y5Ei0+SNKCyXRvh
 ZGDrjsQMPtzY4Ek3HitZXZONvTBmmG6o9nT3QIdYlBTBKDVHjT7LOf/FTRVsXvbUx06c
 2daQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vIf/vqhNUNqIRBEh7o2DH7eUjmcz0xiSSHQ+1RGoLqM=;
 b=2aKDm6u822qmQN/Gm6+qH4xDT/qlKrHbWSX+5LLEzbpba+sw7s2B2EdVFVFFa7hwtZ
 OWBRIG+qJvIQvNwpE0PKEF4MzMAKJCrFsL8D5vnJ77SuhqIZKgxp/9Gs1rY1TVUcTII/
 1RuK2h3AKqayBsA0t5XiIYSFr+UpN3BhWqANdfhOb2uD9cBZWM+2Eht8yUMntzCRn+op
 JFlONY4Tb+rSPWtEZlGTmq6TxTwBSZzINBHBM6i3ZcudLf80RyFNgCxE5+7Dn/JcXxwR
 Pcq4LgPk7Uw+iHA4UpmVH1uFnhdS05ZGwkGN+8LXP4PFjtMvJgwMCEX2khxZLmIrkjlf
 Easg==
X-Gm-Message-State: AOAM530w9mfazWDCxzDKNHbXBlzKFS3SEEcEdalWbB01d4Arj4YUbKs4
 MevbbEOGFNoBMJse5cndOZO6cD1quhaaTAAvq4wnmw==
X-Google-Smtp-Source: ABdhPJylKHVBlGpiecHUrZvTYdg7HSTe57tsV7v7MFjLQ6T1xKSceN6Ufh559xVukSiA2PAY4XCmZp1y4uuvxw85LOU=
X-Received: by 2002:a05:6402:1a53:: with SMTP id
 bf19mr27439922edb.235.1632117697643; 
 Sun, 19 Sep 2021 23:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210830114531.2285178-1-jose.pekkarinen@unikie.com>
 <163189935709.536094.10717640766848618610@kwain>
In-Reply-To: <163189935709.536094.10717640766848618610@kwain>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Mon, 20 Sep 2021 09:01:27 +0300
Message-ID: <CAJPV9MrYNwrrZ34-JgRPO62Y_6yT0HZ564YuB_qFKYdsRo7nXQ@mail.gmail.com>
To: Antoine Tenart <atenart@kernel.org>
Subject: Re: [Buildroot] [PATCH] package/refpolicy: Treat all modules as
 custom
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2338623537853993600=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============2338623537853993600==
Content-Type: multipart/alternative; boundary="00000000000099a1f805cc6703f0"

--00000000000099a1f805cc6703f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 8:22 PM Antoine Tenart <atenart@kernel.org> wrote:

> Hello Jos=C3=A9,
>
> Quoting Jos=C3=A9 Pekkarinen (2021-08-30 13:45:31)
> > The current processing of the modules doesn't work for
> > custom made policies appended through the extra dir mechanism,
> > since sed won't find a match for custom modules, it will
> > continue without triggering and error. This patch removes
> > all the modules from modules.conf and add them one by
> > one using REFPOLICY_MODULES values.
>
> I'm failing to see what particular setup the change below would fix.
>
> Could you elaborate on the above? Maybe including configuration
> snippets and example of such a module (with the file tree, starting from
> REFPOLICY_EXTRA_MODULES_DIRS).
>
> Thanks!
> Antoine
>

Absolutely, in the security section of my .config we can read the

following:

BR2_PACKAGE_POLICYCOREUTILS=3Dy
BR2_PACKAGE_REFPOLICY=3Dy
BR2_REFPOLICY_EXTRA_MODULES_DIRS=3D"$OUTPUT_DIR/selinux"
BR2_PACKAGE_REFPOLICY_POLICY_STATE_ENFORCING=3Dy

In $OUTPUT_DIR/selinux I have the following files:

$ ls
secure.fc  secure.if  secure.te
$ cat secure.fc
$ cat secure.if
$  cat secure.te
policy_module(secure, 1.0);

#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D bin_t =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
allow bin_t user_home_t:dir { getattr open read };
allow bin_t user_home_t:file { getattr open read };

#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D chkpwd_t =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
allow chkpwd_t device_t:chr_file { read write };
allow chkpwd_t proc_t:filesystem getattr;
allow chkpwd_t sysctl_kernel_t:dir search;
allow chkpwd_t sysctl_kernel_t:file { open read };
allow chkpwd_t tmpfs_t:dir search;
[...]

The problem arises because the secure module is not

known to refpolicy, and at the time of building, policy/modules.conf
requires a line that the recipe sed, but no reference of secure
module is in the file beforehand. Since then, the sed modifies
nothing and the policies I have in the file doesn't turn up if
I execute sesearch on the policy file that in my case is policy.32
since I'm working with buildroot 2021.02.x. Please let me know
if there is any further question.

Best regards.

Jos=C3=A9.


> diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/
> refpolicy.mk
> > index 0194708b37..1c0a2c3385 100644
> > --- a/package/refpolicy/refpolicy.mk
> > +++ b/package/refpolicy/refpolicy.mk
> > @@ -85,9 +85,9 @@ endef
> >  # In the context of a monolithic policy enabling a piece of the policy
> as
> >  # 'base' or 'module' is equivalent, so we enable them as 'base'.
> >  define REFPOLICY_CONFIGURE_MODULES
> > -       $(SED) "s/ =3D module/ =3D no/g" $(@D)/policy/modules.conf
> > +       $(SED) "/ =3D module/d" $(@D)/policy/modules.conf
> >         $(foreach m,$(sort $(REFPOLICY_MODULES)),
> > -               $(SED) "/^$(m) =3D/c\$(m) =3D base" $(@D)/policy/module=
s.conf
> > +               $(SED) "/^# Module: $(m)/a\$(m) =3D base"
> $(@D)/policy/modules.conf
> >         )
> >  endef
> >
> > --
> > 2.25.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>


--=20

Jos=C3=A9.

--00000000000099a1f805cc6703f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 17, 2021 at 8:22 PM Antoi=
ne Tenart &lt;<a href=3D"mailto:atenart@kernel.org">atenart@kernel.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello=
 Jos=C3=A9,<br>
<br>
Quoting Jos=C3=A9 Pekkarinen (2021-08-30 13:45:31)<br>
&gt; The current processing of the modules doesn&#39;t work for<br>
&gt; custom made policies appended through the extra dir mechanism,<br>
&gt; since sed won&#39;t find a match for custom modules, it will<br>
&gt; continue without triggering and error. This patch removes<br>
&gt; all the modules from modules.conf and add them one by<br>
&gt; one using REFPOLICY_MODULES values.<br>
<br>
I&#39;m failing to see what particular setup the change below would fix.<br=
>
<br>
Could you elaborate on the above? Maybe including configuration<br>
snippets and example of such a module (with the file tree, starting from<br=
>
REFPOLICY_EXTRA_MODULES_DIRS).<br>
<br>
Thanks!<br>
Antoine<br></blockquote><div><br></div></div><blockquote style=3D"margin:0 =
0 0 40px;border:none;padding:0px"><div class=3D"gmail_quote"><div>Absolutel=
y, in the security section of my .config we can read the</div></div></block=
quote>following:<div><br></div><div>BR2_PACKAGE_POLICYCOREUTILS=3Dy<br>BR2_=
PACKAGE_REFPOLICY=3Dy<br>BR2_REFPOLICY_EXTRA_MODULES_DIRS=3D&quot;$OUTPUT_D=
IR/selinux&quot;<br>BR2_PACKAGE_REFPOLICY_POLICY_STATE_ENFORCING=3Dy</div><=
div><br></div><div><blockquote style=3D"margin:0 0 0 40px;border:none;paddi=
ng:0px"><div>In $OUTPUT_DIR/selinux I have the following files:</div><div><=
br></div></blockquote><div class=3D"gmail_quote">$ ls<br>secure.fc =C2=A0se=
cure.if =C2=A0secure.te</div><div class=3D"gmail_quote">$ cat secure.fc =C2=
=A0<br>$ cat secure.if</div>$ =C2=A0cat secure.te<br>policy_module(secure, =
1.0);<br><br>#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D bin_t =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>allow bin_t user_home_t:dir { getattr open r=
ead };<br>allow bin_t user_home_t:file { getattr open read };<br><br>#=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D chkpwd_t =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>allow chkpwd_t device_t:chr_file { read write };<br>allo=
w chkpwd_t proc_t:filesystem getattr;<br>allow chkpwd_t sysctl_kernel_t:dir=
 search;<br>allow chkpwd_t sysctl_kernel_t:file { open read };<br>allow chk=
pwd_t tmpfs_t:dir search;<br>[...]</div><div><br></div><div><blockquote sty=
le=3D"margin:0 0 0 40px;border:none;padding:0px"><div>The problem arises be=
cause the secure module is not</div></blockquote>known to refpolicy, and at=
 the time of building, policy/modules.conf</div><div>requires a line that t=
he recipe sed, but no reference of secure</div><div>module is in the file b=
eforehand. Since then, the sed modifies</div><div>nothing and the policies =
I have in the file doesn&#39;t turn up if</div><div>I execute sesearch on t=
he policy file that in my case is policy.32</div><div>since I&#39;m working=
 with buildroot 2021.02.x. Please let me know</div><div>if there is any fur=
ther question.</div><div><br></div><div><blockquote style=3D"margin:0 0 0 4=
0px;border:none;padding:0px"><div>Best regards.</div><div><br></div></block=
quote><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><div>=
Jos=C3=A9.</div></blockquote></div><div><br></div><div><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; diff --git a/package/refpolicy/<a href=3D"http://refpolicy.mk" rel=3D"=
noreferrer" target=3D"_blank">refpolicy.mk</a> b/package/refpolicy/<a href=
=3D"http://refpolicy.mk" rel=3D"noreferrer" target=3D"_blank">refpolicy.mk<=
/a><br>
&gt; index 0194708b37..1c0a2c3385 100644<br>
&gt; --- a/package/refpolicy/<a href=3D"http://refpolicy.mk" rel=3D"norefer=
rer" target=3D"_blank">refpolicy.mk</a><br>
&gt; +++ b/package/refpolicy/<a href=3D"http://refpolicy.mk" rel=3D"norefer=
rer" target=3D"_blank">refpolicy.mk</a><br>
&gt; @@ -85,9 +85,9 @@ endef<br>
&gt;=C2=A0 # In the context of a monolithic policy enabling a piece of the =
policy as<br>
&gt;=C2=A0 # &#39;base&#39; or &#39;module&#39; is equivalent, so we enable=
 them as &#39;base&#39;.<br>
&gt;=C2=A0 define REFPOLICY_CONFIGURE_MODULES<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(SED) &quot;s/ =3D module/ =3D no/g&quot;=
 $(@D)/policy/modules.conf<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(SED) &quot;/ =3D module/d&quot; $(@D)/po=
licy/modules.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(foreach m,$(sort $(REFPOLICY_MODULE=
S)),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(SED) &quot;/=
^$(m) =3D/c\$(m) =3D base&quot; $(@D)/policy/modules.conf<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(SED) &quot;/=
^# Module: $(m)/a\$(m) =3D base&quot; $(@D)/policy/modules.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt;=C2=A0 endef<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@busybox.net" target=3D"_blank">buildroot@b=
usybox.net</a><br>
&gt; <a href=3D"http://lists.busybox.net/mailman/listinfo/buildroot" rel=3D=
"noreferrer" target=3D"_blank">http://lists.busybox.net/mailman/listinfo/bu=
ildroot</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><blockquote style=3D"margin:0px=
 0px 0px 40px;border:none;padding:0px">Jos=C3=A9.</blockquote></div></div><=
/div></div>

--00000000000099a1f805cc6703f0--

--===============2338623537853993600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2338623537853993600==--
