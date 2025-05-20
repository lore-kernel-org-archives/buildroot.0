Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8D8C3ABDD
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 12:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 645DB80BFF;
	Tue, 20 May 2025 12:10:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ch322qAJ_K9w; Tue, 20 May 2025 12:10:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 341CF80C07
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 341CF80C07;
	Tue, 20 May 2025 12:10:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BC93D4
 for <buildroot@buildroot.org>; Tue, 20 May 2025 12:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01F4780C07
 for <buildroot@buildroot.org>; Tue, 20 May 2025 12:10:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zSvGqN9wmjfM for <buildroot@buildroot.org>;
 Tue, 20 May 2025 12:10:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 63B4280BFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63B4280BFF
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63B4280BFF
 for <buildroot@busybox.net>; Tue, 20 May 2025 12:10:20 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-54e816aeca6so7794287e87.2
 for <buildroot@busybox.net>; Tue, 20 May 2025 05:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747743018; x=1748347818;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Df2qAKfgM2pWaubJnfMxJT/747BChmTxHX/pa3uGkT0=;
 b=ceZenfbQY5kzQY/x9brRpNGkfNCy/E1ok/IS+8Q1z5Bgvhk7HUV4CqRN0HgrpeM/KM
 fENerhyhYpwyvmgq979BRFT+bevFoHnZEWa6wru05n39x4wbKLsOMeaOR6KNPDrzV430
 vRirTAmVHpg5pIxe28E2IPDwRb8k9rMnko5PCaRQks6vFFpLOL7Ph3ijuDZBAHDgjztF
 o5C5wxkIIBC0ZNZexgKh3EG1Cd5fkmPinuSF1xU0nEiTIuCWPTjk7XStclkBGUJPAMV/
 MWBa/HLEr5OGx5Phe12wQ6eNjWtTlOHrfVfN6PV4RV7IP94kC2CHkU4D10+W3H/X1s+M
 Kq7g==
X-Gm-Message-State: AOJu0YwPypo838Jqoe4rGvc8Ly/u1jJuNaJhpVf04C1zSWnyQunWIdIo
 Sqb8wUENuRkbVWtyCeLV6G4nMGZ82VSk32XStKlcYi6yGkTS1eExzvmFo4I33xYAnHHP1swXQwj
 b9kV+plMWDWmmkHjb9v5IshW+NEXLBb0sOdA6V0qn6K4AHt3K460BIQ==
X-Gm-Gg: ASbGncvxbpgSwUuuCb6ZE94fIbSOvggWOjXiFb4P+1cQx/9NlkGRwiI8V3ul9dLSLgU
 PT4B9PU9pnOfSTNcRgQ+82xPCf1RqvXECA4dHwlkBZyCQHcsog41XGKXLQZvBmG2Bd8NukirMNR
 nU+QJPKD/EQTzs0kdmNL6bBH7oS0KDQxEHj4Pg3YIxdEGt66jBSyBzCupDIBsfiSDzjjmYn3vDc
 Y9O
X-Google-Smtp-Source: AGHT+IGfebinSXdKcLnPitNae1nP9vFRKDHR8WqqALS5S6F+wHI68wXkzMlmmyXYn2T0zgKzqUnNGcIon7l6gEVNO1E=
X-Received: by 2002:a05:6512:b28:b0:54b:117b:dc9f with SMTP id
 2adb3069b0e04-550e726d3d7mr5527113e87.57.1747743017871; Tue, 20 May 2025
 05:10:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250321062358.3955810-1-francois.perrad@gadz.org>
 <078b3188-6f5b-4b52-ae5b-66e640895472@rnout.be>
In-Reply-To: <078b3188-6f5b-4b52-ae5b-66e640895472@rnout.be>
Date: Tue, 20 May 2025 14:10:07 +0200
X-Gm-Features: AX0GCFsd0JeWrcKLoqPTM5s2GlHrzsj6w8HeJbo0tnJS7J0n2AH1wuKE9z2HmQ8
Message-ID: <CAAE6iEXh0p7Na_yuybxVCX7=VqAt1Soa8JujZf3q=mmK2phtXA@mail.gmail.com>
To: buildroot@busybox.net
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1747743018; x=1748347818; darn=busybox.net;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Df2qAKfgM2pWaubJnfMxJT/747BChmTxHX/pa3uGkT0=;
 b=VsxPrxVzN6xOPe4LD4UvF4c/hgdIDcbP28PyMhuEfuOA5EncsKJF3dYOYAeqpMyMDN
 EGTs00C3UCO5ttjsbqEQ5tnPtIeG+4vuMU/4Q75ZfbKOM9Ao7Vjk6pRPIjDM+LYSa73L
 AOYlXz4N+9c+TvTQkx1qCfozRxqKsyYgjZK0Amfhe93P7Lh0Bj48eN2iYFAi4x4NPTrz
 CWcsAVL9fznF3BoUuNMhUvXZUhWlCBE9LsBD7cnUl7viRcU9tF/PLfBv3Rkc+C+/gQaj
 CeLc0wt4+ztYlLf98fyGips106E7wjF5pnatfa2H5uSV0WSGJ7te3rKdALArQzLJEUqR
 SkRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=VsxPrxVz
Subject: Re: [Buildroot] [RFC PATCH]
 docs/manual/customize-directory-structure: add a custom top Makefile
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
From: =?utf-8?q?Fran=C3=A7ois_Perrad_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Content-Type: multipart/mixed; boundary="===============3797106266908942941=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3797106266908942941==
Content-Type: multipart/alternative; boundary="000000000000bdc24d063590217b"

--000000000000bdc24d063590217b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 18 mai 2025 =C3=A0 18:35, Arnout Vandecappelle <arnout@rnout.be> a
=C3=A9crit :

>   Hi Francois,
>
>   Good idea to add this section!
>
> On 21/03/2025 07:23, Francois Perrad via buildroot wrote:
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >   .../manual/customize-directory-structure.adoc | 84 ++++++++++++++++++=
+
> >   1 file changed, 84 insertions(+)
> >
> > diff --git a/docs/manual/customize-directory-structure.adoc
> b/docs/manual/customize-directory-structure.adoc
> > index e0eecb564..b0beebb40 100644
> > --- a/docs/manual/customize-directory-structure.adoc
> > +++ b/docs/manual/customize-directory-structure.adoc
> > @@ -49,6 +49,7 @@ to you.
> >   |           +-- package2.mk
> >   |
> >   +-- Config.in (if using a br2-external tree)
> > ++-- Makefile (if using a custom top makefile)
> >   +-- external.mk (if using a br2-external tree)
> >   +-- external.desc (if using a br2-external tree)
> >   ----
> > @@ -109,3 +110,86 @@
> BR2_GLOBAL_PATCH_DIR=3D"board/<company>/common/patches
> board/<company>/fooboard/pa
> >
> >   then first the patches from the 'common' layer would be applied,
> >   followed by the patches from the 'fooboard' layer.
> > +
> > +=3D=3D=3D=3D Custom top Makefile
> > +
> > +Here, a custom Makefile for your project which adds some new targets,
> > +on the top of all Buildroot targets.
>
>   I've extended the text a bit to explain why you want this.
>
> > +
> > +The variable +BOARD+ needs to be adjusted to your project.
> > +
> > +With the variable +BUILDROOT+, it is easy to upgrade the Buildroot
> version
> > +used by your project.
> > +
> > +----
> > +BOARD?=3D<boardname>
>
>   I don't think it's very useful to have this if it supports only a singl=
e
> defconfig.
>
> > +BUILDROOT:=3Dbuildroot-2025.02
>
>   I think we want to motivate people to use a git submodule rather than
> downloading a tarball, because that's a shorter path to contributing
> upstream.
>

I understand this requirement.


> So I just wrote that _somehow_ you have to make sure the buildroot
> directory exists.
>
> > +OUTPUT:=3Doutput_$(BOARD)
> > +SD?=3D/dev/sdX
> > +
> > +export BR2_DL_DIR=3D$(CURDIR)/download
> > +
> > +all: $(BOARD)
> > +
> > +.PHONY: buildroot
> > +buildroot: $(BUILDROOT)
> > +
> > +.PHONY: buildroot-clean
> > +buildroot-clean:
> > +     rm -rf $(BUILDROOT)
> > +
> > +.PHONY: conf
> > +conf: $(OUTPUT)/.config
> > +
> > +.PHONY: conf-clean
> > +conf-clean:
> > +     rm -f $(OUTPUT)/.config
>

the targets `conf` & `conf-clean` allow to take in account a change in the
defconfig without all remove & rebuild (like with targets `board` &
`board-clean`).


> > +
> > +.PHONY: board
> > +board: $(BOARD)
> > +
> > +.PHONY: board-clean
> > +board-clean:
> > +     rm -rf $(OUTPUT)
>
> +
> > +.PHONY: dd
> > +dd:
> > +     @mount | grep $(SD)
> > +     sudo dd status=3Dprogress if=3D$(OUTPUT)/images/sdcard.img of=3D$=
(SD)
> > +     sync
> > +     sync
>
>   This is a super specific use case. I instead wrote in the text that you
> can
> add targets to upload it to a device.
>
>
Most of readme.txt in board/ have an example of `dd` command.
So, I think it is an useful example, and when it is not useful for an user,
it is easy to remove it.

I don't want the most concise Makefile.
But I want to provide examples of commands that are useful to a beginner,
even if they are trivial to an expert.


>
> > +$(BR2_DL_DIR)/buildroot/$(BUILDROOT).tar.xz:
> > +     mkdir -p $(BR2_DL_DIR)/buildroot
> > +     cd $(BR2_DL_DIR)/buildroot && wget
> https://buildroot.org/downloads/$(BUILDROOT).tar.xz
> > +
> > +$(BUILDROOT): $(BR2_DL_DIR)/buildroot/$(BUILDROOT).tar.xz
> > +     tar xfJ $(BR2_DL_DIR)/buildroot/$(BUILDROOT).tar.xz
> > +     touch $(BUILDROOT)
> > +     # here, apply patches against the Buildroot official tarball
> > +
> > +$(OUTPUT)/.config: $(BUILDROOT)
> > +     $(MAKE) -C $(BUILDROOT) O=3D$(CURDIR)/$(OUTPUT) defconfig
> BR2_DEFCONFIG=3D../configs/$(BOARD)_defconfig BR2_EXTERNAL=3D..
>
>   Since this supports only a single defconfig, I've instead added a
> simplification of the rules I use myself to support multiple configs, eac=
h
> in
> their own output directory.
>
>
There are too many cut/simplification.
The Makefile is currently broken, or I don't understand how to use it.


> > +
> > +.PHONY: $(BOARD)
> > +$(BOARD): $(OUTPUT)/.config
> > +     $(MAKE) -C $(BUILDROOT) O=3D$(CURDIR)/$(OUTPUT)
> > +
> > +# delegate all other targets to the Buildroot makefile
> > +%:
> > +     $(MAKE) -C $(BUILDROOT) O=3D$(CURDIR)/$(OUTPUT) $@
>
>   Unfortunately, this bit is not relevant in the multiple-output-director=
y
> case,
> so I dropped it.
>
>   Regards,
>   Arnout
>
> > +----
> > +
> > +Now, an example of work session.
> > +
> > +----
> > + $ make buildroot       # custom
> > + $ make conf            # custom
> > + $ make nconfig         # Buildroot
> > + $ make savedefconfig   # Buildroot
> > + $ make source          # Buildroot
> > + $ make board           # custom
> > + $ make dd              # custom
> > +
> > + $ make help            # Buildroot
> > +----
>
>
find below my example updated with submodule.

Fran=C3=A7ois


BOARD?=3D<boardname>
OUTPUT:=3Doutput/$(BOARD)
SD?=3D/dev/mmcblk0

export BR2_DL_DIR=3D$(CURDIR)/dl

MAKE_BUILDROOT:=3D$(MAKE) -C buildroot O=3D$(CURDIR)/$(OUTPUT)

all: $(BOARD)

.PHONY: conf
conf: $(OUTPUT)/.config

.PHONY: conf-clean
conf-clean:
rm -f $(OUTPUT)/.config

.PHONY: board
board: $(BOARD)

.PHONY: board-clean
board-clean:
rm -rf $(OUTPUT)

.PHONY: dd
dd:
@mount | grep $(SD)
sudo dd if=3D$(OUTPUT)/images/sdcard.img of=3D$(SD)
sync
sync

$(OUTPUT)/.config:
$(MAKE_BUILDROOT) defconfig BR2_DEFCONFIG=3D../configs/$(BOARD)_defconfig
BR2_EXTERNAL=3D..

.PHONY: $(BOARD)
$(BOARD): $(OUTPUT)/.config
$(MAKE_BUILDROOT)

# delegate all others targets to the Buildroot makefile
%:
$(MAKE_BUILDROOT) $@

--000000000000bdc24d063590217b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=
=C2=A0dim. 18 mai 2025 =C3=A0=C2=A018:35, Arnout Vandecappelle &lt;<a href=
=3D"mailto:arnout@rnout.be" target=3D"_blank">arnout@rnout.be</a>&gt; a =C3=
=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
=C2=A0 Hi Francois,<br>
<br>
=C2=A0 Good idea to add this section!<br>
<br>
On 21/03/2025 07:23, Francois Perrad via buildroot wrote:<br>
&gt; Signed-off-by: Francois Perrad &lt;<a href=3D"mailto:francois.perrad@g=
adz.org" target=3D"_blank">francois.perrad@gadz.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../manual/customize-directory-structure.adoc | 84 +++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 84 insertions(+)<br>
&gt; <br>
&gt; diff --git a/docs/manual/customize-directory-structure.adoc b/docs/man=
ual/customize-directory-structure.adoc<br>
&gt; index e0eecb564..b0beebb40 100644<br>
&gt; --- a/docs/manual/customize-directory-structure.adoc<br>
&gt; +++ b/docs/manual/customize-directory-structure.adoc<br>
&gt; @@ -49,6 +49,7 @@ to you.<br>
&gt;=C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+-- <a href=3D"h=
ttp://package2.mk" rel=3D"noreferrer" target=3D"_blank">package2.mk</a><br>
&gt;=C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0+-- Config.in (if using a br2-external tree)<br>
&gt; ++-- Makefile (if using a custom top makefile)<br>
&gt;=C2=A0 =C2=A0+-- <a href=3D"http://external.mk" rel=3D"noreferrer" targ=
et=3D"_blank">external.mk</a> (if using a br2-external tree)<br>
&gt;=C2=A0 =C2=A0+-- external.desc (if using a br2-external tree)<br>
&gt;=C2=A0 =C2=A0----<br>
&gt; @@ -109,3 +110,86 @@ BR2_GLOBAL_PATCH_DIR=3D&quot;board/&lt;company&gt=
;/common/patches board/&lt;company&gt;/fooboard/pa<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0then first the patches from the &#39;common&#39; layer wou=
ld be applied,<br>
&gt;=C2=A0 =C2=A0followed by the patches from the &#39;fooboard&#39; layer.=
<br>
&gt; +<br>
&gt; +=3D=3D=3D=3D Custom top Makefile<br>
&gt; +<br>
&gt; +Here, a custom Makefile for your project which adds some new targets,=
<br>
&gt; +on the top of all Buildroot targets.<br>
<br>
=C2=A0 I&#39;ve extended the text a bit to explain why you want this.<br>
<br>
&gt; +<br>
&gt; +The variable +BOARD+ needs to be adjusted to your project.<br>
&gt; +<br>
&gt; +With the variable +BUILDROOT+, it is easy to upgrade the Buildroot ve=
rsion<br>
&gt; +used by your project.<br>
&gt; +<br>
&gt; +----<br>
&gt; +BOARD?=3D&lt;boardname&gt;<br>
<br>
=C2=A0 I don&#39;t think it&#39;s very useful to have this if it supports o=
nly a single <br>
defconfig.<br>
<br>
&gt; +BUILDROOT:=3Dbuildroot-2025.02<br>
<br>
=C2=A0 I think we want to motivate people to use a git submodule rather tha=
n <br>
downloading a tarball, because that&#39;s a shorter path to contributing up=
stream.<br></blockquote><div><br></div><div>I understand this requirement.<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
So I just wrote that _somehow_ you have to make sure the buildroot director=
y exists.<br>
<br>
&gt; +OUTPUT:=3Doutput_$(BOARD)<br>
&gt; +SD?=3D/dev/sdX<br>
&gt; +<br>
&gt; +export BR2_DL_DIR=3D$(CURDIR)/download<br>
&gt; +<br>
&gt; +all: $(BOARD)<br>
&gt; +<br>
&gt; +.PHONY: buildroot<br>
&gt; +buildroot: $(BUILDROOT)<br>
&gt; +<br>
&gt; +.PHONY: buildroot-clean<br>
&gt; +buildroot-clean:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rm -rf $(BUILDROOT)<br>
&gt; +<br>
&gt; +.PHONY: conf<br>
&gt; +conf: $(OUTPUT)/.config<br>
&gt; +<br>
&gt; +.PHONY: conf-clean<br>
&gt; +conf-clean:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rm -f $(OUTPUT)/.config<br></blockquote><div><br>=
</div><div>the targets `conf` &amp; `conf-clean` allow to take in account a=
 change in the defconfig without all remove &amp; rebuild (like with target=
s  `board` &amp; `board-clean`).</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
&gt; +<br>
&gt; +.PHONY: board<br>
&gt; +board: $(BOARD)<br>
&gt; +<br>
&gt; +.PHONY: board-clean<br>
&gt; +board-clean:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rm -rf $(OUTPUT)<br></blockquote><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
&gt; +<br>
&gt; +.PHONY: dd<br>
&gt; +dd:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@mount | grep $(SD)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sudo dd status=3Dprogress if=3D$(OUTPUT)/images/s=
dcard.img of=3D$(SD)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sync<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sync<br>
<br>
=C2=A0 This is a super specific use case. I instead wrote in the text that =
you can <br>
add targets to upload it to a device.<br>
<br></blockquote><div><br></div><div>Most of readme.txt in board/ have an e=
xample of `dd` command.<br> So, I think it is an useful example, and when i=
t is not useful for an user, it is easy to remove it.</div><div><br></div><=
div><div dir=3D"ltr"><span lang=3D"en"><span><span>I don&#39;t want the mos=
t concise Makefile.</span></span></span></div><div dir=3D"ltr"><span lang=
=3D"en"><span><span>But I want to provide examples of commands that are use=
ful to a beginner, even if they are trivial to an expert.</span></span></sp=
an></div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
&gt; +$(BR2_DL_DIR)/buildroot/$(BUILDROOT).tar.xz:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mkdir -p $(BR2_DL_DIR)/buildroot<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cd $(BR2_DL_DIR)/buildroot &amp;&amp; wget <a hre=
f=3D"https://buildroot.org/downloads/$(BUILDROOT).tar.xz" rel=3D"noreferrer=
" target=3D"_blank">https://buildroot.org/downloads/$(BUILDROOT).tar.xz</a>=
<br>
&gt; +<br>
&gt; +$(BUILDROOT): $(BR2_DL_DIR)/buildroot/$(BUILDROOT).tar.xz<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tar xfJ $(BR2_DL_DIR)/buildroot/$(BUILDROOT).tar.=
xz<br>
&gt; +=C2=A0 =C2=A0 =C2=A0touch $(BUILDROOT)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# here, apply patches against the Buildroot offic=
ial tarball<br>
&gt; +<br>
&gt; +$(OUTPUT)/.config: $(BUILDROOT)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(MAKE) -C $(BUILDROOT) O=3D$(CURDIR)/$(OUTPUT) d=
efconfig BR2_DEFCONFIG=3D../configs/$(BOARD)_defconfig BR2_EXTERNAL=3D..<br=
>
<br>
=C2=A0 Since this supports only a single defconfig, I&#39;ve instead added =
a <br>
simplification of the rules I use myself to support multiple configs, each =
in <br>
their own output directory.<br>
<br></blockquote><div><br></div><div>There are too many cut/simplification.=
</div><div>The Makefile is currently broken, or I don&#39;t understand how =
to use it.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
&gt; +<br>
&gt; +.PHONY: $(BOARD)<br>
&gt; +$(BOARD): $(OUTPUT)/.config<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(MAKE) -C $(BUILDROOT) O=3D$(CURDIR)/$(OUTPUT)<b=
r>
&gt; +<br>
&gt; +# delegate all other targets to the Buildroot makefile<br>
&gt; +%:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(MAKE) -C $(BUILDROOT) O=3D$(CURDIR)/$(OUTPUT) $=
@<br>
<br>
=C2=A0 Unfortunately, this bit is not relevant in the multiple-output-direc=
tory case, <br>
so I dropped it.<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; +----<br>
&gt; +<br>
&gt; +Now, an example of work session.<br>
&gt; +<br>
&gt; +----<br>
&gt; + $ make buildroot=C2=A0 =C2=A0 =C2=A0 =C2=A0# custom<br>
&gt; + $ make conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # custom<br>
&gt; + $ make nconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Buildroot<br>
&gt; + $ make savedefconfig=C2=A0 =C2=A0# Buildroot<br>
&gt; + $ make source=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Buildroot<br>
&gt; + $ make board=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# custom<br>
&gt; + $ make dd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # custom<b=
r>
&gt; +<br>
&gt; + $ make help=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Buildroot<br>
&gt; +----<br>
<br></blockquote><div><br></div><div>find below my example updated with sub=
module.</div><div><br></div><div>Fran=C3=A7ois</div><div><br></div><div><br=
>BOARD?=3D&lt;boardname&gt;<br>OUTPUT:=3Doutput/$(BOARD)<br>SD?=3D/dev/mmcb=
lk0<br><br>export BR2_DL_DIR=3D$(CURDIR)/dl<br><br>MAKE_BUILDROOT:=3D$(MAKE=
) -C buildroot O=3D$(CURDIR)/$(OUTPUT)<br><br>all: $(BOARD)<br><br>.PHONY: =
conf<br>conf: $(OUTPUT)/.config<br><br>.PHONY: conf-clean<br>conf-clean:<br=
>	rm -f $(OUTPUT)/.config<br><br>.PHONY: board<br>board: $(BOARD)<br><br>.P=
HONY: board-clean<br>board-clean:<br>	rm -rf $(OUTPUT)<br><br>.PHONY: dd<br=
>dd:<br>	@mount | grep $(SD)<br>	sudo dd if=3D$(OUTPUT)/images/sdcard.img o=
f=3D$(SD)<br>	sync<br>	sync<br><br>$(OUTPUT)/.config:<br>	$(MAKE_BUILDROOT)=
 defconfig BR2_DEFCONFIG=3D../configs/$(BOARD)_defconfig BR2_EXTERNAL=3D..<=
br><br>.PHONY: $(BOARD)<br>$(BOARD): $(OUTPUT)/.config<br>	$(MAKE_BUILDROOT=
)<br><br># delegate all others targets to the Buildroot makefile<br>%:<br>	=
$(MAKE_BUILDROOT) $@<br><br></div><div><br></div><div>=C2=A0</div></div></d=
iv>
</div>
</div>

--000000000000bdc24d063590217b--

--===============3797106266908942941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3797106266908942941==--
