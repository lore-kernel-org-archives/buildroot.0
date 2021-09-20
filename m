Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 938E1C433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 09:45:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19E2760F93
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 09:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 19E2760F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E207F81D65;
	Mon, 20 Sep 2021 09:45:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N8CeQl6qAkmD; Mon, 20 Sep 2021 09:45:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11BC381D46;
	Mon, 20 Sep 2021 09:44:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A49511BF36E
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 09:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AB3C403A0
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 09:44:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5s_2xnzAu4CK for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 09:44:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37DCE40357
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 09:44:56 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id c21so58538689edj.0
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 02:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nk6f2iW9ArEGabawxW0IGcN5545IQK7CFq/e/rk8qNA=;
 b=3lM1Euq+o7VXocm2wZxrCugzV9WoCjojrAzxl1afPlOAX3MUX2aqevxF66rfQJSKy4
 V8FbA8aJZ7V4iyplRixHxWcGZJGOeOQgkG0yRbpYi6xtFfLgJNdZEyG6swsBcprSY5p2
 +mAmew4Eb70qMzbbFyPtzDCzKKR/ipdJi6nQIBfhRdUItXo/dmwEfJcgyimiZz57CBIh
 kyBP5SXhw934YNJX0x19uH6U3652yvAgAN0JAK6mFqaU3CESOLgx28DLVIvLCQANhV06
 PyXFffAah+hjZsMYIa5c2KVTvAbqDGdKPr2UJuuAGdt4wFbwvdgBS/tNzvUNajfAfaSw
 U+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nk6f2iW9ArEGabawxW0IGcN5545IQK7CFq/e/rk8qNA=;
 b=Oeu3Raz2nfcjqDHZFzbVyhDNgN+Mt2XiorAQijInEJSCjowOzBXUP3JYr3lH8NqtRT
 55l2zMdQxUHTSNU+r5kLbKzKm81Wz23KL4wYKzVNWh2DGDXDMLFNgfVGSfqG3OZB6zWL
 bCTFGLNOkngIPwL2nYAZp9KpWTkdoucT1Go8/XlTO0la6AhJFJ+mqCPvcKtqwu7LTjhE
 IAKZEQ2nlu9r+JkX4r8uPvEaFTZZ9uJX74nFABt2QkuOclCjGUCttMxjzVp1KMx5cFgh
 oubH69nbFjnj0Am3PnUmayZyQXiq1BbKryID1m0jamkc8LdPyftpn5XM8ns+bd/Ek4T7
 BVXQ==
X-Gm-Message-State: AOAM533how/KGXhG7fN3Ex/wzyrxnIv//CipcekKkE1b6sqek/ivQqLE
 Hv6rEl7SaAUN/LAsxH7gmq7Iehmtuo9bD8EOMUAcag==
X-Google-Smtp-Source: ABdhPJwT1zb0C93jApeoOIz88pEzxvocedpRzynJSgkC08Y1gKtSCXMomW9Aqe6ykTv5g8VagRxypNoUdI0oSEZEiBw=
X-Received: by 2002:aa7:d814:: with SMTP id v20mr2468828edq.169.1632131093440; 
 Mon, 20 Sep 2021 02:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210830114531.2285178-1-jose.pekkarinen@unikie.com>
 <163189935709.536094.10717640766848618610@kwain>
 <CAJPV9MrYNwrrZ34-JgRPO62Y_6yT0HZ564YuB_qFKYdsRo7nXQ@mail.gmail.com>
 <163213021612.4283.1135197152174473636@kwain>
In-Reply-To: <163213021612.4283.1135197152174473636@kwain>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Mon, 20 Sep 2021 12:44:42 +0300
Message-ID: <CAJPV9Mphsf6BhYHhsD7BFRXms2Psbi0xFX9SUaBbyu40iZCecQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0459342917201462621=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============0459342917201462621==
Content-Type: multipart/alternative; boundary="0000000000000d472605cc6a225a"

--0000000000000d472605cc6a225a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 12:30 PM Antoine Tenart <atenart@kernel.org> wrote:

> Quoting Jos=C3=A9 Pekkarinen (2021-09-20 08:01:27)
> >    On Fri, Sep 17, 2021 at 8:22 PM Antoine Tenart <[1]atenart@kernel.or=
g
> >
> >    wrote:
> >      Quoting Jos=C3=A9 Pekkarinen (2021-08-30 13:45:31)
> >      > The current processing of the modules doesn't work for
> >      > custom made policies appended through the extra dir mechanism,
> >      > since sed won't find a match for custom modules, it will
> >      > continue without triggering and error. This patch removes
> >      > all the modules from modules.conf and add them one by
> >      > one using REFPOLICY_MODULES values.
> >
> >      I'm failing to see what particular setup the change below would fi=
x.
> >
> >      Could you elaborate on the above? Maybe including configuration
> >      snippets and example of such a module (with the file tree, startin=
g
> from
> >      REFPOLICY_EXTRA_MODULES_DIRS).
> >
> >    Absolutely, in the security section of my .config we can read the
> >    following:
> >    BR2_PACKAGE_POLICYCOREUTILS=3Dy
> >    BR2_PACKAGE_REFPOLICY=3Dy
> >    BR2_REFPOLICY_EXTRA_MODULES_DIRS=3D"$OUTPUT_DIR/selinux"
> >    BR2_PACKAGE_REFPOLICY_POLICY_STATE_ENFORCING=3Dy
>
> This should work. Did you check the content of your module show up after
> applying this patch?
>

Hi,

Yes, after the patch I can see the module copied in the folder:

build/refpolicy-2.20200818$ ls policy/modules/buildroot/
base.fc  base.if  base.te  metadata.xml  secure.fc  secure.if  secure.te

And:

/build/refpolicy-2.20200818$ grep secure policy/modules.conf
# Module: secure
secure =3D base
# Small and secure DNS daemon.

I'm wondering if this has to do with:
>
>   BR2_REFPOLICY_EXTRA_MODULES_DIRS=3D"$OUTPUT_DIR/selinux"
>
> What is the value of $OUTPUT_DIR? Where does this come from? Could you
> try without using a variable in BR2_REFPOLICY_EXTRA_MODULES_DIRS?
>

I put that to try to make your life easier, in fact we use more

variables in this line that are modified on the fly by a makefile. The
line translates to something like:

$ ls /output/secure/output_x86_qemu/selinux/
base.fc  base.if  base.te  secure.fc  secure.if  secure.te

Best regards.

Jos=C3=A9.

--0000000000000d472605cc6a225a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 20, 2021 at 12:30 PM Anto=
ine Tenart &lt;<a href=3D"mailto:atenart@kernel.org">atenart@kernel.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Quot=
ing Jos=C3=A9 Pekkarinen (2021-09-20 08:01:27)<br>
&gt;=C2=A0 =C2=A0 On Fri, Sep 17, 2021 at 8:22 PM Antoine Tenart &lt;[1]<a =
href=3D"mailto:atenart@kernel.org" target=3D"_blank">atenart@kernel.org</a>=
&gt;<br>
&gt;=C2=A0 =C2=A0 wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Quoting Jos=C3=A9 Pekkarinen (2021-08-30 13:45:31)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; The current processing of the modules doesn&#=
39;t work for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; custom made policies appended through the ext=
ra dir mechanism,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; since sed won&#39;t find a match for custom m=
odules, it will<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; continue without triggering and error. This p=
atch removes<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; all the modules from modules.conf and add the=
m one by<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; one using REFPOLICY_MODULES values.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 I&#39;m failing to see what particular setup the c=
hange below would fix.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 Could you elaborate on the above? Maybe including =
configuration<br>
&gt;=C2=A0 =C2=A0 =C2=A0 snippets and example of such a module (with the fi=
le tree, starting from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 REFPOLICY_EXTRA_MODULES_DIRS).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 Absolutely, in the security section of my .config we can =
read the<br>
&gt;=C2=A0 =C2=A0 following:<br>
&gt;=C2=A0 =C2=A0 BR2_PACKAGE_POLICYCOREUTILS=3Dy<br>
&gt;=C2=A0 =C2=A0 BR2_PACKAGE_REFPOLICY=3Dy<br>
&gt;=C2=A0 =C2=A0 BR2_REFPOLICY_EXTRA_MODULES_DIRS=3D&quot;$OUTPUT_DIR/seli=
nux&quot;<br>
&gt;=C2=A0 =C2=A0 BR2_PACKAGE_REFPOLICY_POLICY_STATE_ENFORCING=3Dy<br>
<br>
This should work. Did you check the content of your module show up after<br=
>
applying this patch?<br></blockquote><div><br></div></div><blockquote style=
=3D"margin:0 0 0 40px;border:none;padding:0px"><div class=3D"gmail_quote"><=
div>Hi,</div><div><br></div></div></blockquote><blockquote style=3D"margin:=
0 0 0 40px;border:none;padding:0px"><div class=3D"gmail_quote"><div>Yes, af=
ter the patch I can see the module copied in the folder:</div><div><br></di=
v></div></blockquote><div class=3D"gmail_quote">build/refpolicy-2.20200818$=
 ls policy/modules/buildroot/<br>base.fc =C2=A0base.if =C2=A0base.te =C2=A0=
metadata.xml =C2=A0secure.fc =C2=A0secure.if =C2=A0secure.te</div><div clas=
s=3D"gmail_quote"><br></div><div class=3D"gmail_quote"><blockquote style=3D=
"margin:0 0 0 40px;border:none;padding:0px"><div class=3D"gmail_quote">And:=
<br><br></div></blockquote>/build/refpolicy-2.20200818$ grep secure policy/=
modules.conf<br># Module: secure<br>secure =3D base<br># Small and secure D=
NS daemon.</div><div class=3D"gmail_quote"><br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
I&#39;m wondering if this has to do with:<br>
<br>
=C2=A0 BR2_REFPOLICY_EXTRA_MODULES_DIRS=3D&quot;$OUTPUT_DIR/selinux&quot;<b=
r>
<br>
What is the value of $OUTPUT_DIR? Where does this come from? Could you<br>
try without using a variable in BR2_REFPOLICY_EXTRA_MODULES_DIRS?<br></bloc=
kquote><div><br></div></div><blockquote style=3D"margin:0 0 0 40px;border:n=
one;padding:0px"><div class=3D"gmail_quote"><div>I put that to try to make =
your life easier, in fact we use more</div></div></blockquote>variables in =
this line that are modified on the fly by a makefile. The<div>line translat=
es to something like:</div><div><br></div>$ ls /output/secure/output_x86_qe=
mu/selinux/<br>base.fc =C2=A0base.if =C2=A0base.te =C2=A0secure.fc =C2=A0se=
cure.if =C2=A0secure.te=C2=A0<div><div><div><div><br></div></div></div><blo=
ckquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><div><div><div>=
Best regards.</div></div></div><div><br></div></blockquote><div><div><div d=
ir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><blockquote style=3D"=
margin:0px 0px 0px 40px;border:none;padding:0px">Jos=C3=A9.</blockquote></d=
iv></div></div></div></div></div>

--0000000000000d472605cc6a225a--

--===============0459342917201462621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0459342917201462621==--
