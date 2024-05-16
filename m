Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303D2C25B78
	for <buildroot@archiver.kernel.org>; Thu, 16 May 2024 11:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E204941CB3;
	Thu, 16 May 2024 11:01:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KZ3PDXTMKOa6; Thu, 16 May 2024 11:01:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3EBC40B90
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3EBC40B90;
	Thu, 16 May 2024 11:01:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 462381BF59A
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 11:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3206A40B36
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 11:00:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eXuv0S1SuKz4 for <buildroot@lists.busybox.net>;
 Thu, 16 May 2024 11:00:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com;
 envelope-from=jonhenrik@qbee.io; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1BB6240363
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BB6240363
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BB6240363
 for <buildroot@buildroot.org>; Thu, 16 May 2024 11:00:52 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-de5b1e6beceso8993997276.0
 for <buildroot@buildroot.org>; Thu, 16 May 2024 04:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715857252; x=1716462052;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2cHe7+sXLSt/DhyDmOf9x3IpFRrAIAIYz8rNcKpQGj0=;
 b=Rp1zCTB2/4xiOr564gmduB6NaCG2FKpnZZ9FPQ/SVf68d5Kox101VESlGnRga71mdK
 jW9SsChlzq5Dx1bFi2w/32bxSTiu4KxW6BGrVyj4+EE+8fh6xekzsu5Jtg5xC1UizKS+
 SkHfNNeUv163RBUDj2Nv2PDND1p1luI2rLwugN/KW4W18yr6pWyKu3hk4oUS3kQuwv5G
 LVskatyCioBxVSPPrxMURG2o/sAe9ASN/RqvvmbO8mc0BZx9iMRVcIOXgdammHWzwpt+
 f7N212sTQNNnwOHcRWy3MinBls/apfd8RT//pB9IzLto/KCvDtXQQLmi2351CMZRvcig
 RWHg==
X-Gm-Message-State: AOJu0YyX+tU2l8iW1OPyyuSwFDNPAaDBJ3NveRREsa66l6A9BkUpqMdV
 xjVo8aFM/jSDLlX8SZ8gxoiEbbz8l6MZytyJV4dVH+X9a2ysWCgfexLQRStGZnmEz9POcnR9/JN
 N9BYzSmA+l56Nn9AXK/BzmvJmv1m5VtJkiIC3b4LtyaQcAxUg
X-Google-Smtp-Source: AGHT+IFUf8/yhslMp81dLR4IvEjSsWeTlCENoy25xcO+XO5tb0I1KMN0OC082Kn4i4JVnFuv7GYOjefFdttzeYw2fQ8=
X-Received: by 2002:a25:b101:0:b0:df1:cdfa:8e46 with SMTP id
 3f1490d57ef6-df1cdfa9222mr4661683276.41.1715857251787; Thu, 16 May 2024
 04:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240305093839.3152030-1-jonhenrik@qbee.io>
 <20240305093839.3152030-2-jonhenrik@qbee.io>
 <20240512120544.002e958a@windsurf>
In-Reply-To: <20240512120544.002e958a@windsurf>
Date: Thu, 16 May 2024 13:00:40 +0200
Message-ID: <CAC3uuevvjJjwgaVnhsjEDABB1WH7kMZ=d+nfd4v+jAarAA6q=Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qbee.io; s=google; t=1715857252; x=1716462052; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2cHe7+sXLSt/DhyDmOf9x3IpFRrAIAIYz8rNcKpQGj0=;
 b=Qg66Man1tuDIf3hAVqxxygpl/CMPB/jNL+gKDe2+CqaGWDgY1jfnH3CuuxWyd0FSjq
 FSTBCUQAdWaxBc02HodjT4wY0iMFrkw5+D2zY+YvK7HfDFWxOqbF0M3tmZgbdr5FAgyD
 euRppxy/AkEffpJQQWB33stviGSiTCppLafmM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=qbee.io
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=qbee.io header.i=@qbee.io header.a=rsa-sha256
 header.s=google header.b=Qg66Man1
Subject: Re: [Buildroot] [PATCH 1/1] package/qbee-agent: new package
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
From: =?utf-8?q?Jon_Henrik_Bj=C3=B8rnstad_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?Q?Jon_Henrik_Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Cc: Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>,
 =?UTF-8?Q?Jon_Henrik_Bj=C3=B8rnstad_via_buildroot?=
 <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============0192741551836401183=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0192741551836401183==
Content-Type: multipart/alternative; boundary="000000000000fa81af0618902535"

--000000000000fa81af0618902535
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Thank you very much for the feedback and reviewing my patch. As this patch
was for an older version of the qbee-agent, I have today submitted a patch
to bump the version.

With kind regards,

Jon Henrik Bj=C3=B8rnstad

On Sun, May 12, 2024 at 12:05=E2=80=AFPM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Jon,
>
> Thanks for your patch, and sorry for the long delay in getting back to
> you. I have applied your patch, with some fixes (see below).
>
> On Tue,  5 Mar 2024 10:38:39 +0100
> Jon Henrik Bj=C3=B8rnstad via buildroot <buildroot@buildroot.org> wrote:
>
> > diff --git a/package/qbee-agent/Config.in b/package/qbee-agent/Config.i=
n
> > new file mode 100644
> > index 0000000000..02e35827ef
> > --- /dev/null
> > +++ b/package/qbee-agent/Config.in
> > @@ -0,0 +1,17 @@
> > +config BR2_PACKAGE_QBEE_AGENT
> > +     bool "qbee-agent"
> > +     depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> > +     select BR2_PACKAGE_IPTABLES # runtime
> > +     select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # runtime
> > +     select BR2_PACKAGE_SHADOW # runtime
> > +     select BR2_PACKAGE_BASH # runtime
>
> When you select something, you need to replicate the "depends on" of
> the thing you are selecting. So here:
>
> +       depends on BR2_USE_MMU # bash
> +       depends on !BR2_STATIC_LIBS # shadow
> +       depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 # shadow
>
> > +     help
> > +       Qbee is a device management platform that comprise
> > +       of an open-source agent and a hosted SaaS backend.
> > +       This config installs pre-built static binaries made
> > +       with the official public signing key for qbee.io. The
> > +       binaries will work seamlessly with the qbee.io device
> > +       management backend.
> > +
> > +       https://github.com/qbee-io/qbee-agent
> > +       https://qbee.io
>
> And you need to add a Config.in comment about those dependencies:
>
> +comment "qbee-agent needs a toolchain w/ headers >=3D 4.14, dynamic libr=
ary"
> +       depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +       depends on BR2_USE_MMU
> +       depends on BR2_STATIC_LIBS || \
> +               !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>
> > diff --git a/package/qbee-agent/qbee-agent.hash
> b/package/qbee-agent/qbee-agent.hash
> > new file mode 100644
> > index 0000000000..1c6a361ff6
> > --- /dev/null
> > +++ b/package/qbee-agent/qbee-agent.hash
> > @@ -0,0 +1,3 @@
> > +# Locally calculated
> > +sha256
> b1b5a6d4e18fbd8536d05616c632f10ef309d26036a19c5ce28d0635c45d8cab
> qbee-agent-2024.09.tar.gz
>
> I had to update the hash and the filename, due to the recent changes in
> the download infrastructure (not your fault, the changes were committed
> very recently).
>
> > +sha256
> 02d07d96be99eb042b01ba650079a440ce26a78c5e0e1e8060c33a8c9e200404  LICENSE
> > diff --git a/package/qbee-agent/qbee-agent.mk b/package/qbee-agent/
> qbee-agent.mk
> > new file mode 100644
> > index 0000000000..66037195c1
> > --- /dev/null
> > +++ b/package/qbee-agent/qbee-agent.mk
> > @@ -0,0 +1,35 @@
> >
> +########################################################################=
########
> > +#
> > +# qbee-agent package
> > +#
> >
> +########################################################################=
########
> > +
> > +QBEE_AGENT_VERSION =3D 2024.09
>
> Added a comment above this line, saying that QBEE_AGENT_COMMIT_ID
> should be kept in sync.
>
> > +QBEE_AGENT_SITE =3D $(call
> github,qbee-io,qbee-agent,$(QBEE_AGENT_VERSION))
> > +QBEE_AGENT_LICENSE =3D Apache-2.0
> > +QBEE_AGENT_LICENSE_FILES =3D LICENSE
> > +
> > +QBEE_AGENT_COMMIT_ID =3D c30d43b8e64cfef960cee9475b58ae083e4ad246
> > +
> > +QBEE_AGENT_GOMOD =3D go.qbee.io/agent
> > +
> > +QBEE_AGENT_LDFLAGS =3D -s -w \
> > +     -X $(QBEE_AGENT_GOMOD)/app.Version=3D$(QBEE_AGENT_VERSION) \
> > +     -X $(QBEE_AGENT_GOMOD)/app.Commit=3D$(QBEE_AGENT_COMMIT_ID)
> > +
> > +define QBEE_AGENT_INSTALL_TARGET_CMDS
> > +     $(INSTALL) -m 0755 $(@D)/bin/qbee-agent
> $(TARGET_DIR)/usr/bin/qbee-agent
> > +     $(INSTALL) -D -m 0600 $(@D)/package/share/ssl/ca.cert
> $(TARGET_DIR)/etc/qbee/ppkeys/ca.cert
> > +endef
>
> As suggested by Yann E. Morin in a previous iteration, I dropped the
> installation of the binary from there, and turned this into a
> post-install target hook. Indeed, the golang-package infrastructure
> already takes care of installing the binary.
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000fa81af0618902535
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Thomas,</div><div><br></div><div>Thank you very mu=
ch for the feedback and reviewing my patch. As this patch was for an older =
version of the qbee-agent, I have today submitted a patch to bump the versi=
on.</div><div><br></div><div>With kind regards,</div><div><br></div><div>Jo=
n Henrik Bj=C3=B8rnstad <br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Sun, May 12, 2024 at 12:05=E2=80=AFPM =
Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas=
.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Hello Jon,<br>
<br>
Thanks for your patch, and sorry for the long delay in getting back to<br>
you. I have applied your patch, with some fixes (see below).<br>
<br>
On Tue,=C2=A0 5 Mar 2024 10:38:39 +0100<br>
Jon Henrik Bj=C3=B8rnstad via buildroot &lt;<a href=3D"mailto:buildroot@bui=
ldroot.org" target=3D"_blank">buildroot@buildroot.org</a>&gt; wrote:<br>
<br>
&gt; diff --git a/package/qbee-agent/Config.in b/package/qbee-agent/Config.=
in<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..02e35827ef<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/qbee-agent/Config.in<br>
&gt; @@ -0,0 +1,17 @@<br>
&gt; +config BR2_PACKAGE_QBEE_AGENT<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;qbee-agent&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPOR=
TS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_IPTABLES # runtime<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # runtime<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_SHADOW # runtime<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_BASH # runtime<br>
<br>
When you select something, you need to replicate the &quot;depends on&quot;=
 of<br>
the thing you are selecting. So here:<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU # bash<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_STATIC_LIBS # shadow<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 =
# shadow<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Qbee is a device management platform that =
comprise<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0of an open-source agent and a hosted SaaS =
backend.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0This config installs pre-built static bina=
ries made<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0with the official public signing key for <=
a href=3D"http://qbee.io" rel=3D"noreferrer" target=3D"_blank">qbee.io</a>.=
 The<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0binaries will work seamlessly with the <a =
href=3D"http://qbee.io" rel=3D"noreferrer" target=3D"_blank">qbee.io</a> de=
vice<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0management backend.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/qbee-io/qbee=
-agent" rel=3D"noreferrer" target=3D"_blank">https://github.com/qbee-io/qbe=
e-agent</a><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://qbee.io" rel=3D"norefer=
rer" target=3D"_blank">https://qbee.io</a><br>
<br>
And you need to add a Config.in comment about those dependencies:<br>
<br>
+comment &quot;qbee-agent needs a toolchain w/ headers &gt;=3D 4.14, dynami=
c library&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPP=
ORTS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_STATIC_LIBS || \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!BR2_TOOLCHAIN_HEAD=
ERS_AT_LEAST_4_14<br>
<br>
&gt; diff --git a/package/qbee-agent/qbee-agent.hash b/package/qbee-agent/q=
bee-agent.hash<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..1c6a361ff6<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/qbee-agent/qbee-agent.hash<br>
&gt; @@ -0,0 +1,3 @@<br>
&gt; +# Locally calculated<br>
&gt; +sha256=C2=A0 b1b5a6d4e18fbd8536d05616c632f10ef309d26036a19c5ce28d0635=
c45d8cab=C2=A0 qbee-agent-2024.09.tar.gz<br>
<br>
I had to update the hash and the filename, due to the recent changes in<br>
the download infrastructure (not your fault, the changes were committed<br>
very recently).<br>
<br>
&gt; +sha256=C2=A0 02d07d96be99eb042b01ba650079a440ce26a78c5e0e1e8060c33a8c=
9e200404=C2=A0 LICENSE<br>
&gt; diff --git a/package/qbee-agent/<a href=3D"http://qbee-agent.mk" rel=
=3D"noreferrer" target=3D"_blank">qbee-agent.mk</a> b/package/qbee-agent/<a=
 href=3D"http://qbee-agent.mk" rel=3D"noreferrer" target=3D"_blank">qbee-ag=
ent.mk</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..66037195c1<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/qbee-agent/<a href=3D"http://qbee-agent.mk" rel=3D"noref=
errer" target=3D"_blank">qbee-agent.mk</a><br>
&gt; @@ -0,0 +1,35 @@<br>
&gt; +#####################################################################=
###########<br>
&gt; +#<br>
&gt; +# qbee-agent package<br>
&gt; +#<br>
&gt; +#####################################################################=
###########<br>
&gt; +<br>
&gt; +QBEE_AGENT_VERSION =3D 2024.09<br>
<br>
Added a comment above this line, saying that QBEE_AGENT_COMMIT_ID<br>
should be kept in sync.<br>
<br>
&gt; +QBEE_AGENT_SITE =3D $(call github,qbee-io,qbee-agent,$(QBEE_AGENT_VER=
SION))<br>
&gt; +QBEE_AGENT_LICENSE =3D Apache-2.0<br>
&gt; +QBEE_AGENT_LICENSE_FILES =3D LICENSE<br>
&gt; +<br>
&gt; +QBEE_AGENT_COMMIT_ID =3D c30d43b8e64cfef960cee9475b58ae083e4ad246<br>
&gt; +<br>
&gt; +QBEE_AGENT_GOMOD =3D <a href=3D"http://go.qbee.io/agent" rel=3D"noref=
errer" target=3D"_blank">go.qbee.io/agent</a><br>
&gt; +<br>
&gt; +QBEE_AGENT_LDFLAGS =3D -s -w \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-X $(QBEE_AGENT_GOMOD)/app.Version=3D$(QBEE_AGENT=
_VERSION) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-X $(QBEE_AGENT_GOMOD)/app.Commit=3D$(QBEE_AGENT_=
COMMIT_ID)<br>
&gt; +<br>
&gt; +define QBEE_AGENT_INSTALL_TARGET_CMDS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 0755 $(@D)/bin/qbee-agent $(TARGET_=
DIR)/usr/bin/qbee-agent<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 0600 $(@D)/package/share/ssl/ca.=
cert $(TARGET_DIR)/etc/qbee/ppkeys/ca.cert<br>
&gt; +endef<br>
<br>
As suggested by Yann E. Morin in a previous iteration, I dropped the<br>
installation of the binary from there, and turned this into a<br>
post-install target hook. Indeed, the golang-package infrastructure<br>
already takes care of installing the binary.<br>
<br>
Thanks a lot!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--000000000000fa81af0618902535--

--===============0192741551836401183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0192741551836401183==--
