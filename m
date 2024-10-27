Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40B7D10C15
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 10:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F357403A4;
	Sun, 27 Oct 2024 10:28:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8M4W6KkIudze; Sun, 27 Oct 2024 10:28:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D105240393
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D105240393;
	Sun, 27 Oct 2024 10:28:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EF93B971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 10:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD00080591
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 10:28:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p56m5Y3QlbV5 for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 10:28:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E2F8580B47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2F8580B47
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2F8580B47
 for <buildroot@busybox.net>; Sun, 27 Oct 2024 10:28:19 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-71e4244fdc6so2414727b3a.0
 for <buildroot@busybox.net>; Sun, 27 Oct 2024 03:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730024899; x=1730629699;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bKdIBpXPosz1Mgfmf7akIEWuQnC4i4BHbNdbg6HYfLo=;
 b=UaagVEuq+sFtKkXq8ho2cpsFnk/Kfai4bq4ICSmNsOYXTzsm9q6ZWvOrHHkhhN6/pI
 4BBGhOnUda4Y4iawfya/hai/K2KSDW4oTc/aEdtFCCMVrqbtIXHJ6pk4Y9tJP0nWXJ9g
 bD7CRjWEqQDCypV8pGP3TC2R9QsYp2KioGqgX3l/xIBC6GBLrMjndksGHo952yRudZIH
 0B4DeiR4PymB2qYTEXRguD9A5GWdvdicQhEhfLPCNxeppKUQ122svNVWKdKUzG7NcXav
 o+nNNLwSdK+xuXXpi4AO7BLvgn13WmOVriI83Uo/weZQWnHMTjrKdD5y5x0YKTLqa6hs
 97PA==
X-Gm-Message-State: AOJu0YyYJBauo9qc4v6LVcBffvmSNEOuMGn6UOyCH0qGKjElu9ILpFqb
 aeoCD6NlLNwVksW5dPmaLEuFTFhju+nD6gdGHLRnMoUHW19IM+rU/TAImGHdEU75FbatoR1LlUo
 Z8H3NzHCzUkEWTXJksQ3PCC93pNXvV/8v5BilReL9yX3cIumISkbq
X-Google-Smtp-Source: AGHT+IE1Xws1xW5NOCGhtJLBzzZ0EgsByXGtFZOubsIPWU8Rrj5sKx8jhBrb+ZYkFOAt71Jjo0mFPajoca7oGmpgwPE=
X-Received: by 2002:a05:6a00:3929:b0:71d:ee1b:c854 with SMTP id
 d2e1a72fcca58-72062f83c34mr7818213b3a.9.1730024899004; Sun, 27 Oct 2024
 03:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240920181212.3572055-1-francois.perrad@gadz.org>
 <20240920181212.3572055-3-francois.perrad@gadz.org>
 <20241026231408.1690b774@windsurf>
In-Reply-To: <20241026231408.1690b774@windsurf>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 27 Oct 2024 11:28:08 +0100
Message-ID: <CAAE6iEUM4qmw0hU_BTfXRicMU0GHwPVxe-cHpkDW=a1vp_LzTA@mail.gmail.com>
To: buildroot@busybox.net
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1730024899; x=1730629699; darn=busybox.net;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bKdIBpXPosz1Mgfmf7akIEWuQnC4i4BHbNdbg6HYfLo=;
 b=mIsjAiwJ3h+aneECNkQ9CPUbKvh45xENcQG8R0NUL3k8I6ZmhqgHOR939IaeRt2yYK
 ARvfsDzTb6Q6g4yo1jNjBSbjFQ2zngcfPoxebQeAmRO55KvOdVoPGt+sWNt76CjjnDCu
 45F1QV2Rr40fFeUvxKNxOFriZKBE3LrpqlzCs7YGs2C4MKF8FD9fcM/tRNPqQ7Ap4ftt
 nmKxixmdpDWn8gTtC9wcbnLVFGNYmvUvnJVFayHrM+RJX7ScxkAWBXQSOltJgOmj/kIV
 VGbrU4DdNbyRyRSdM5Wj7ibyI6KDWpQxlIVhffBhLKcgObmBpOtUse8BNJY/ygunOjyZ
 KPMw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=mIsjAiwJ
Subject: Re: [Buildroot] [PATCH v2 2/2] package/lynis: new package
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
Content-Type: multipart/mixed; boundary="===============3525609705906540894=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3525609705906540894==
Content-Type: multipart/alternative; boundary="0000000000008f7a2a062572cf20"

--0000000000008f7a2a062572cf20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 26 oct. 2024 =C3=A0 23:14, Thomas Petazzoni <thomas.petazzoni@bootl=
in.com>
a =C3=A9crit :

> Hello Fran=C3=A7ois,
>
> On Fri, 20 Sep 2024 20:12:12 +0200
> Francois Perrad <francois.perrad@gadz.org> wrote:
>
> > diff --git a/package/lynis/Config.in b/package/lynis/Config.in
> > new file mode 100644
> > index 000000000..3f64bc2e1
> > --- /dev/null
> > +++ b/package/lynis/Config.in
> > @@ -0,0 +1,11 @@
> > +config BR2_PACKAGE_LYNIS
> > +     bool "lynis"
> > +     select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> > +     select BR2_PACKAGE_COREUTILS  # runtime (stat)
>
> The "stat" from Busybox cannot be used?
>
>
You are right.
I could write something like:

ifneq ($(BR2_PACKAGE_COREUTILS),y)
define LYNIS_STAT_BUSYBOX_CONFIG_FIXUPS
       $(call KCONFIG_ENABLE_OPT,CONFIG_STAT)
endef
endif


> > +    def test_run(self):
> > +        self.login()
> > +        self.assertRunOk("lynis show version", timeout=3D90)
>
> Is this a useful enough test? Does it check that runtime dependencies
> are present and working?
>
>
Lynis has no installation process.
So, the current goal of the test is to check what the installation of
various components is correct (see LYNIS_INSTALL_TARGET_CMDS).

Fran=C3=A7ois


> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000008f7a2a062572cf20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 26 oct.=
 2024 =C3=A0=C2=A023:14, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.peta=
zzoni@bootlin.com" target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt; a=
 =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Hello Fran=C3=A7ois,<br>
<br>
On Fri, 20 Sep 2024 20:12:12 +0200<br>
Francois Perrad &lt;<a href=3D"mailto:francois.perrad@gadz.org" target=3D"_=
blank">francois.perrad@gadz.org</a>&gt; wrote:<br>
<br>
&gt; diff --git a/package/lynis/Config.in b/package/lynis/Config.in<br>
&gt; new file mode 100644<br>
&gt; index 000000000..3f64bc2e1<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/lynis/Config.in<br>
&gt; @@ -0,0 +1,11 @@<br>
&gt; +config BR2_PACKAGE_LYNIS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;lynis&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_COREUTILS=C2=A0 # runtime (sta=
t)<br>
<br>
The &quot;stat&quot; from Busybox cannot be used?<br>
<br></blockquote><div><br></div><div>You are right.<br>I could write someth=
ing like:<br><br>ifneq ($(BR2_PACKAGE_COREUTILS),y)<br>define LYNIS_STAT_BU=
SYBOX_CONFIG_FIXUPS<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT=
,CONFIG_STAT)<br>endef<br>endif<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 def test_run(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.login()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRunOk(&quot;lynis show version=
&quot;, timeout=3D90)<br>
<br>
Is this a useful enough test? Does it check that runtime dependencies<br>
are present and working?<br>
<br></blockquote><div><br></div><div>Lynis has no installation process.<br>=
So, the current goal of the test is to check what the installation of vario=
us components is correct (see LYNIS_INSTALL_TARGET_CMDS).</div><div><br></d=
iv><div>Fran=C3=A7ois<br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>
</div>

--0000000000008f7a2a062572cf20--

--===============3525609705906540894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3525609705906540894==--
