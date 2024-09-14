Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8F1C02197
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 12:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4401404FF;
	Sat, 14 Sep 2024 12:59:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4m1s_RTD9bbR; Sat, 14 Sep 2024 12:59:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C236402E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C236402E8;
	Sat, 14 Sep 2024 12:59:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 828FF1BF228
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 12:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 705C140612
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 12:59:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4HJhR8DcH5Ya for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 12:59:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.54;
 helo=mail-ej1-f54.google.com; envelope-from=fede.evol@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D8FFF40102
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8FFF40102
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8FFF40102
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 12:59:40 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a8a706236bfso113323466b.0
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 05:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726318779; x=1726923579;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q9pFaz3UpnaS8i3rEWDK/0xEALzty+bRCVI5ZMIUm+M=;
 b=BjqgtD1oKDr2o2bByGigcNYMeSmLRXJIoT+vjNSoPkh7naL1t/adNnwjQJXIvUB763
 AmAbB/V+37vm9+QqgQVJqoP+HMJdG3JSKib4Ugn5RbTRrA/ESbJeJejeQj5W9b/D22tc
 LBf5ePpU8i86gBUH/xmoP1B10ez/JdrhUFMyJ8b12Z6j0Rd81Ns/b8+51s1diQJlMHGG
 X/ikzYsQu/1wE0QWd8BotAU2a1Gx5AP010SG5JKESfl7m7pVlu4nlNJHjFaJ7ZysgkdA
 iMmMCLzNoI/aQ7QOto+fPR5TXXESlT/FWtz1hr/AEmzSMq2gZhuz0oAEtoNilj8RbQdT
 20mg==
X-Gm-Message-State: AOJu0YzFeSLE9/68a2LSpq3RK3LCc5LRdHMmYKC9inrmsS7sso/0SHx+
 YmnauLa29jGjZmTkJfOxGqh1XT42MzorNlT3+aCYk77vIKLNnpnESj7G2Iv/7DAKqtnPQG2tKdc
 8UcSpuU4LRKj4xlHeDdHh8SXpreYoDA==
X-Google-Smtp-Source: AGHT+IHDrcF2nhslXL/ob3JpoOfxvfSmedbGaeG2RIPFQRexrg2KK7xvKW4Mu1GU13GizBEYBBWJdlC4sy8FfnA/khM=
X-Received: by 2002:a05:6402:280f:b0:5c3:cb45:2e with SMTP id
 4fb4d7f45d1cf-5c41dea6c46mr7991970a12.5.1726318778537; Sat, 14 Sep 2024
 05:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240829075015.39164-1-fede@evolware.org>
In-Reply-To: <20240829075015.39164-1-fede@evolware.org>
From: Federico Pellegrin <fede@evolware.org>
Date: Sat, 14 Sep 2024 14:59:27 +0200
Message-ID: <CAM6O0ZhECVx4eVGMx77T91F30r1z4dbUX2-eHDuNRKBCD99-tg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=evolware.org
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/netsniff-ng: fix install when building in parallel
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
Content-Type: multipart/mixed; boundary="===============0543191217391737040=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0543191217391737040==
Content-Type: multipart/alternative; boundary="0000000000009062ad062213e984"

--0000000000009062ad062213e984
Content-Type: text/plain; charset="UTF-8"

Hi,
Just a friendly ping on this as I see you are very active today :-) (sadly
will arrive to Vienna just tomorrow)

Thanks and cheers,
F.



Il giorno gio 29 ago 2024 alle ore 09:50 Federico Pellegrin <
fede@evolware.org> ha scritto:

> When building in parallel, the package will randomly fail in
> install phase due to a missing make dependency.
>
> Already submitted and merged upstream:
> Upstream:
> https://github.com/netsniff-ng/netsniff-ng/commit/36f5b55b2aabe16e8c17b8e95a5b69327d3266f4
>
> Signed-off-by: Federico Pellegrin <fede@evolware.org>
> ---
>  .../0002-Fix_post_install_deps.patch          | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 package/netsniff-ng/0002-Fix_post_install_deps.patch
>
> diff --git a/package/netsniff-ng/0002-Fix_post_install_deps.patch
> b/package/netsniff-ng/0002-Fix_post_install_deps.patch
> new file mode 100644
> index 0000000000..e34fa2229c
> --- /dev/null
> +++ b/package/netsniff-ng/0002-Fix_post_install_deps.patch
> @@ -0,0 +1,49 @@
> +From 18e111e06f5eaf074f1c1e0cff79a0e72dce7590 Mon Sep 17 00:00:00 2001
> +From: Federico Pellegrin <fede@evolware.org>
> +Date: Wed, 28 Aug 2024 06:23:35 +0200
> +Subject: [PATCH] build: fix install dependencies in Makefile template
> +
> +post_install should execute after do_install otherwise when building
> +in parallel (-j) this leads to sporadic failures of trafgen stddef
> +header, since it is installed in do_install but then post_install
> +does a mv supposing it is already there, for example:
> +
> +```
> +  INST netsniff-ng/netsniff-ng
> +  INST trafgen/trafgen
> +mv: cannot stat '/tmp/a/pref/etc/netsniff-ng/trafgen_stddef.h': No such
> file or directory
> +make: *** [trafgen/Makefile:57: trafgen_post_install] Error 1
> +make: *** Waiting for unfinished jobs....
> +  INST netsniff-ng/netsniff-ng.8.gz
> +  INST trafgen/trafgen.8.gz
> +  INST ether.conf
> +  INST tcp.conf
> +  INST trafgen_stddef.h
> +```
> +
> +(it is visible above that the stddef.h is installed later than the post
> +is trying to move it away)
> +
> +Forcing the order of post after do will guarantee that it will be there
> +when it needs to be moved and it will be safe to do a parallel install.
> +Just relying on the ordering of the $(1)_install definition is wrong and
> +dependant on make version (and luck!).
> +
> +Signed-off-by: Federico Pellegrin <fede@evolware.org>
> +
> +---
> + Template | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/Template b/Template
> +index 056f594a2..54b597291 100644
> +--- a/Template
> ++++ b/Template
> +@@ -12,6 +12,7 @@ define TOOL_templ
> +       $(Q)eval GZIP= gzip $(GZIP_ENV) $(1).8 > $(1)/$(1).8.gz
> +       $(Q)$$(call INST,$(1)/$(1).8.gz,$$(DESTDIR)$$(MAN8DIR))
> +       $(Q)$$(foreach file,$$($(1)-confs),$$(call
> INST,$$(file),$$(DESTDIR)$$(ETCDIRE));)
> ++  $(1)_post_install: $(1)_do_install
> +   $(1)_install: $(1)_do_install $(1)_post_install
> +   $(1)_uninstall: $(1)_uninstall_custom
> +       $(Q)$$(call RM,$$(DESTDIR)$$(SBINDIR)/$(1))
> --
> 2.46.0
>
>

--0000000000009062ad062213e984
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>Hi,</div><div>Just a friendly ping on =
this as I see you are very active today :-) (sadly will arrive to Vienna ju=
st tomorrow)</div><div><br></div><div>Thanks and cheers,</div><div>F.</div>=
<div><br></div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Il giorno gio 29 ago 2024 alle ore 09:50 Fede=
rico Pellegrin &lt;<a href=3D"mailto:fede@evolware.org">fede@evolware.org</=
a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">When building in parallel, the package will randomly fail in<br>
install phase due to a missing make dependency.<br>
<br>
Already submitted and merged upstream:<br>
Upstream: <a href=3D"https://github.com/netsniff-ng/netsniff-ng/commit/36f5=
b55b2aabe16e8c17b8e95a5b69327d3266f4" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/netsniff-ng/netsniff-ng/commit/36f5b55b2aabe16e8c17b8e95=
a5b69327d3266f4</a><br>
<br>
Signed-off-by: Federico Pellegrin &lt;<a href=3D"mailto:fede@evolware.org" =
target=3D"_blank">fede@evolware.org</a>&gt;<br>
---<br>
=C2=A0.../0002-Fix_post_install_deps.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 49 +++++++++++++++++++<br>
=C2=A01 file changed, 49 insertions(+)<br>
=C2=A0create mode 100644 package/netsniff-ng/0002-Fix_post_install_deps.pat=
ch<br>
<br>
diff --git a/package/netsniff-ng/0002-Fix_post_install_deps.patch b/package=
/netsniff-ng/0002-Fix_post_install_deps.patch<br>
new file mode 100644<br>
index 0000000000..e34fa2229c<br>
--- /dev/null<br>
+++ b/package/netsniff-ng/0002-Fix_post_install_deps.patch<br>
@@ -0,0 +1,49 @@<br>
+From 18e111e06f5eaf074f1c1e0cff79a0e72dce7590 Mon Sep 17 00:00:00 2001<br>
+From: Federico Pellegrin &lt;<a href=3D"mailto:fede@evolware.org" target=
=3D"_blank">fede@evolware.org</a>&gt;<br>
+Date: Wed, 28 Aug 2024 06:23:35 +0200<br>
+Subject: [PATCH] build: fix install dependencies in Makefile template<br>
+<br>
+post_install should execute after do_install otherwise when building<br>
+in parallel (-j) this leads to sporadic failures of trafgen stddef<br>
+header, since it is installed in do_install but then post_install<br>
+does a mv supposing it is already there, for example:<br>
+<br>
+```<br>
+=C2=A0 INST netsniff-ng/netsniff-ng<br>
+=C2=A0 INST trafgen/trafgen<br>
+mv: cannot stat &#39;/tmp/a/pref/etc/netsniff-ng/trafgen_stddef.h&#39;: No=
 such file or directory<br>
+make: *** [trafgen/Makefile:57: trafgen_post_install] Error 1<br>
+make: *** Waiting for unfinished jobs....<br>
+=C2=A0 INST netsniff-ng/netsniff-ng.8.gz<br>
+=C2=A0 INST trafgen/trafgen.8.gz<br>
+=C2=A0 INST ether.conf<br>
+=C2=A0 INST tcp.conf<br>
+=C2=A0 INST trafgen_stddef.h<br>
+```<br>
+<br>
+(it is visible above that the stddef.h is installed later than the post<br=
>
+is trying to move it away)<br>
+<br>
+Forcing the order of post after do will guarantee that it will be there<br=
>
+when it needs to be moved and it will be safe to do a parallel install.<br=
>
+Just relying on the ordering of the $(1)_install definition is wrong and<b=
r>
+dependant on make version (and luck!).<br>
+<br>
+Signed-off-by: Federico Pellegrin &lt;<a href=3D"mailto:fede@evolware.org"=
 target=3D"_blank">fede@evolware.org</a>&gt;<br>
+<br>
+---<br>
+ Template | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/Template b/Template<br>
+index 056f594a2..54b597291 100644<br>
+--- a/Template<br>
++++ b/Template<br>
+@@ -12,6 +12,7 @@ define TOOL_templ<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q)eval GZIP=3D gzip $(GZIP_ENV) $(1).8 &gt; $=
(1)/$(1).8.gz<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q)$$(call INST,$(1)/$(1).8.gz,$$(DESTDIR)$$(M=
AN8DIR))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q)$$(foreach file,$$($(1)-confs),$$(call INST=
,$$(file),$$(DESTDIR)$$(ETCDIRE));)<br>
++=C2=A0 $(1)_post_install: $(1)_do_install<br>
+=C2=A0 =C2=A0$(1)_install: $(1)_do_install $(1)_post_install<br>
+=C2=A0 =C2=A0$(1)_uninstall: $(1)_uninstall_custom<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q)$$(call RM,$$(DESTDIR)$$(SBINDIR)/$(1))<br>
-- <br>
2.46.0<br>
<br>
</blockquote></div>

--0000000000009062ad062213e984--

--===============0543191217391737040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0543191217391737040==--
