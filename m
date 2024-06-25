Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70AC9C2BBCA
	for <buildroot@archiver.kernel.org>; Tue, 25 Jun 2024 11:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 045CD41979;
	Tue, 25 Jun 2024 11:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h24iGcTOpijK; Tue, 25 Jun 2024 11:56:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A4E641972
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A4E641972;
	Tue, 25 Jun 2024 11:56:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3CA791BF426
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 11:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3532641972
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 11:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PaERnXp4ctnT for <buildroot@lists.busybox.net>;
 Tue, 25 Jun 2024 11:56:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7E7E841802
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E7E841802
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E7E841802
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 11:56:17 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-dff305df675so5828209276.1
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 04:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719316576; x=1719921376;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hRQ0I4W5n1pMHKwef+pZV+gxK9SQuUg0jTRhZAx8oPQ=;
 b=X1Smo8JMDm8lAc5WZh8BLFQco815h22VrxBbVdb3acjDyxUHLy8VZgLLss3kthzFQU
 kjXpXpCPRWDcteHM8RdGb9XiNtV2gGyHsM0ZDXauH1RAnAmJBqcs6i6hD5aW4ZSBKrN7
 NK2MjJMPn7o4iHqBJZ+EWJpG5UKYETP4UxYPsgkOgn8dJovzTA3dazG1pNn8imclKmic
 gPB1h4Dnv1Xz6lKgTgnKKEAIDX3YJgQAwNgS+dSM+kwT+BJ7A/VNwZ10sIkSYoaOTxsW
 Tg3HhgBJLOz/1dtSR9zMYik+QxjjUfOm2o2QiJvYQzeoCIShyYbomW4oMVhyg9YmrqNH
 aMbQ==
X-Gm-Message-State: AOJu0YySV13rOnHJkQXxqUmouJHPEFBLSknUUSVgkiOy0A3RStkklJOm
 IpYYKj8K02dd7TeJ6P4Y+fUJ4VU3Ymp/lIee5Wa/sFHlfgFR3xFhnaCYSsoG6mzcvsHvi9hZa4M
 /3Gm28KL5mgdQwhM9qmrXbS8kjlRvvQDq8pnb0wBY/kqmx56E
X-Google-Smtp-Source: AGHT+IGAA9+BjgGKWt717qVCXb1MY4wnRhrt5DeftwAtVJlQp7GLSzdx5P9fPhqNgzqRIie0WWrJ6BNLuz81CExxr/s=
X-Received: by 2002:a25:69c6:0:b0:dfa:ff7e:d410 with SMTP id
 3f1490d57ef6-e0303ffb521mr6170101276.40.1719316576080; Tue, 25 Jun 2024
 04:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <e2b3835bcee63a27b24a757a2db3e9103faebc63.1719316003.git.yann.morin@orange.com>
In-Reply-To: <e2b3835bcee63a27b24a757a2db3e9103faebc63.1719316003.git.yann.morin@orange.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 25 Jun 2024 13:56:05 +0200
Message-ID: <CABGWkvobc38thMwekt0fsHefa6QSADKdemyZ9Mj84EgYB6UbXQ@mail.gmail.com>
To: yann.morin@orange.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1719316576; x=1719921376;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hRQ0I4W5n1pMHKwef+pZV+gxK9SQuUg0jTRhZAx8oPQ=;
 b=n7okMC29rcaNQosW4v70izcKHSGNExUdFC9bQ6QoxqVW9gnINpt/eRn7dMPagK/2Q7
 e668FnyqEBiV3vRsSlScmRUC/1phi3Wf6XjWIHpq8lXhKFxL0C0MycBngWg0DOU3R6T0
 xzPc40YJspyfGhwbuOMZtxscED79WcL1wAJdE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=n7okMC29
Subject: Re: [Buildroot] [PATCH] package/slang: fix patch fuzz
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4687876271415297823=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4687876271415297823==
Content-Type: multipart/alternative; boundary="000000000000c63a4f061bb595cb"

--000000000000c63a4f061bb595cb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

*Dario Binacchi*

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


*Amarula Solutions SRL*

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

Hi Yann,

Il giorno mar 25 giu 2024 alle 13:46 <yann.morin@orange.com> ha scritto:

> From: "Yann E. MORIN" <yann.morin@orange.com>
>
> Since commit 8f88a644ed7d (support/scripts/apply-patches.sh: set the
> maximum fuzz factor to 0), we no longer accept fuzz in patches. Before
> 8f88a644ed7d was applied, alot of patches were fixed in preparatory
> commits, but slang was missed (although the patch has been present since
> 2017.


>
what configuration does contain this package?
I=E2=80=99m on holiday and I don=E2=80=99t have my PC with me, so I am not =
able to check it.

Thanks and regards,
Dario

>
> Fix the fuzz:
>   - leading TABs in Makefile commands
>   - fix context
>
> Fixes: 8f88a644ed7d6c9ea55fd4fbe9d7f37055920016
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/slang/0001-slsh-libs.patch | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/slang/0001-slsh-libs.patch
> b/package/slang/0001-slsh-libs.patch
> index fad16d1b2f..100399e818 100644
> --- a/package/slang/0001-slsh-libs.patch
> +++ b/package/slang/0001-slsh-libs.patch
> @@ -12,10 +12,10 @@ Signed-off-by: Fabrice Fontaine <
> fontaine.fabrice@gmail.com>
>  +++ b/slsh/Makefile.in
>  @@ -92,7 +92,7 @@
>   $(OBJDIR)/slsh_exe: $(OBJDIR)/slsh.o $(OBJDIR)/readline.o
> -    $(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o
> $(OBJDIR)/slsh_exe $(LDFLAGS) $(DLINK_FLAGS) $(SRC_LIBS)
> +       $(CC) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh_exe
> $(LDFLAGS) $(DLINK_FLAGS) $(SRC_LIBS)
>   $(OBJDIR)/slsh: $(OBJDIR)/slsh.o $(OBJDIR)/readline.o
>  -      $(CC) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh
> $(LDFLAGS) $(DLINK_FLAGS) $(INST_LIBS)
>  +      $(CC) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh
> $(LDFLAGS) $(DLINK_FLAGS) $(SRC_LIBS)
>   $(OBJDIR)/slsh.o: $(OBJDIR_TSTAMP) slsh.c slsh.h config.h Makefile
> -    cd $(OBJDIR) && $(CC) $(SLANG_SRCINC) $(CFLAGS) -c $(DEFS)
> $(SRCDIR)/slsh.c
> +       cd $(OBJDIR) && $(CC) $(SLANG_SRCINC) $(CFLAGS) -c $(DEFS)
> $(SRCDIR)/slsh.c
>   $(OBJDIR)/readline.o: $(OBJDIR_TSTAMP) readline.c slsh.h config.h
> Makefile
> --
> 2.34.1
>
>
> _________________________________________________________________________=
___________________________________
> Ce message et ses pieces jointes peuvent contenir des informations
> confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez
> recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages
> electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme o=
u
> falsifie. Merci.
>
> This message and its attachments may contain confidential or privileged
> information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and
> delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have bee=
n
> modified, changed or falsified.
> Thank you.
>
>

--000000000000c63a4f061bb595cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br clear=3D"all"><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gma=
il_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><span><p =
dir=3D"ltr" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><spa=
n style=3D"font-size:10pt;font-family:Ubuntu,sans-serif;vertical-align:base=
line;white-space:pre-wrap;background-color:transparent;color:rgb(0,0,0)"><b=
 style=3D"font-family:Ubuntu,sans-serif">Dario Binacchi</b></span></p><p di=
r=3D"ltr" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;verti=
cal-align:baseline;white-space:pre-wrap;background-color:transparent;color:=
rgb(0,0,0)">Senior Embedded Linux Developer</span></p><p dir=3D"ltr" style=
=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-s=
ize:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;vertical-align:basel=
ine;white-space:pre-wrap;background-color:transparent;color:rgb(0,0,0)"><a =
href=3D"mailto:dario.binacchi@amarulasolutions.com" target=3D"_blank" style=
=3D"font-family:&quot;Ubuntu Mono&quot;,monospace">dario.binacchi@amarulaso=
lutions.com</a></span></p><p dir=3D"ltr" style=3D"line-height:1.8;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ub=
untu Mono&quot;,monospace;vertical-align:baseline;white-space:pre-wrap;back=
ground-color:transparent;color:rgb(0,0,0)">________________________________=
__</span></p><p dir=3D"ltr" style=3D"line-height:1.8;margin-top:0pt;margin-=
bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quo=
t;,monospace;vertical-align:baseline;white-space:pre-wrap;background-color:=
transparent;color:rgb(0,0,0)"><br></span><span style=3D"font-size:10pt;font=
-family:Ubuntu,sans-serif;vertical-align:baseline;white-space:pre-wrap;back=
ground-color:transparent;color:rgb(0,0,0)"><b style=3D"font-family:Ubuntu,s=
ans-serif">Amarula Solutions SRL</b></span></p><p dir=3D"ltr" style=3D"line=
-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt=
;font-family:&quot;Ubuntu Mono&quot;,monospace;vertical-align:baseline;whit=
e-space:pre-wrap;background-color:transparent;color:rgb(0,0,0)">Via Le Cane=
vare 30, 31100 Treviso, Veneto, IT</span></p><p dir=3D"ltr" style=3D"line-h=
eight:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;f=
ont-family:&quot;Ubuntu Mono&quot;,monospace;vertical-align:baseline;white-=
space:pre-wrap;background-color:transparent;color:rgb(0,0,0)">T. +39 042 24=
3 5310</span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&qu=
ot;,monospace;vertical-align:baseline;white-space:pre-wrap;background-color=
:transparent;color:rgb(0,0,0)"><br></span><span style=3D"font-size:10pt;fon=
t-family:&quot;Ubuntu Mono&quot;,monospace;vertical-align:baseline;white-sp=
ace:pre-wrap;background-color:transparent;color:rgb(0,0,0)"><a href=3D"mail=
to:info@amarulasolutions.com" target=3D"_blank" style=3D"font-family:&quot;=
Ubuntu Mono&quot;,monospace">info@amarulasolutions.com</a></span></p><p dir=
=3D"ltr" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><a href=
=3D"http://www.amarulasolutions.com/" target=3D"_blank"><span style=3D"font=
-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;vertical-align:bas=
eline;white-space:pre-wrap;background-color:transparent;color:rgb(0,0,0)">w=
ww.amarulasolutions.com</span></a></p></span></div></div></div></div><div><=
br></div><div dir=3D"auto">Hi Yann,</div><div dir=3D"auto"><br><div class=
=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">Il gior=
no mar 25 giu 2024 alle 13:46 &lt;<a href=3D"mailto:yann.morin@orange.com">=
yann.morin@orange.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-le=
ft-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">From: &=
quot;Yann E. MORIN&quot; &lt;<a href=3D"mailto:yann.morin@orange.com" targe=
t=3D"_blank">yann.morin@orange.com</a>&gt;<br>
<br>
Since commit 8f88a644ed7d (support/scripts/apply-patches.sh: set the<br>
maximum fuzz factor to 0), we no longer accept fuzz in patches. Before<br>
8f88a644ed7d was applied, alot of patches were fixed in preparatory<br>
commits, but slang was missed (although the patch has been present since<br=
>
2017.</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;b=
order-left-color:rgb(204,204,204)" dir=3D"auto"><br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">what configurati=
on does contain this package?</div><div dir=3D"auto">I=E2=80=99m on holiday=
 and I don=E2=80=99t have my PC with me, so I am not able to check it.</div=
><div dir=3D"auto"><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks and=
 regards,</div><div dir=3D"auto">Dario</div></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
Fix the fuzz:<br>
=C2=A0 - leading TABs in Makefile commands<br>
=C2=A0 - fix context<br>
<br>
Fixes: 8f88a644ed7d6c9ea55fd4fbe9d7f37055920016<br>
Signed-off-by: Yann E. MORIN &lt;<a href=3D"mailto:yann.morin@orange.com" t=
arget=3D"_blank">yann.morin@orange.com</a>&gt;<br>
Cc: Dario Binacchi &lt;<a href=3D"mailto:dario.binacchi@amarulasolutions.co=
m" target=3D"_blank">dario.binacchi@amarulasolutions.com</a>&gt;<br>
---<br>
=C2=A0package/slang/0001-slsh-libs.patch | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/package/slang/0001-slsh-libs.patch b/package/slang/0001-slsh-l=
ibs.patch<br>
index fad16d1b2f..100399e818 100644<br>
--- a/package/slang/0001-slsh-libs.patch<br>
+++ b/package/slang/0001-slsh-libs.patch<br>
@@ -12,10 +12,10 @@ Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:f=
ontaine.fabrice@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>=
&gt;<br>
=C2=A0+++ b/slsh/Makefile.in<br>
=C2=A0@@ -92,7 +92,7 @@<br>
=C2=A0 $(OBJDIR)/slsh_exe: $(OBJDIR)/slsh.o $(OBJDIR)/readline.o<br>
-=C2=A0 =C2=A0 $(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(O=
BJDIR)/slsh_exe $(LDFLAGS) $(DLINK_FLAGS) $(SRC_LIBS)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o =
$(OBJDIR)/slsh_exe $(LDFLAGS) $(DLINK_FLAGS) $(SRC_LIBS)<br>
=C2=A0 $(OBJDIR)/slsh: $(OBJDIR)/slsh.o $(OBJDIR)/readline.o<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 $(CC) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o =
$(OBJDIR)/slsh $(LDFLAGS) $(DLINK_FLAGS) $(INST_LIBS)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 $(CC) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o =
$(OBJDIR)/slsh $(LDFLAGS) $(DLINK_FLAGS) $(SRC_LIBS)<br>
=C2=A0 $(OBJDIR)/slsh.o: $(OBJDIR_TSTAMP) slsh.c slsh.h config.h Makefile<b=
r>
-=C2=A0 =C2=A0 cd $(OBJDIR) &amp;&amp; $(CC) $(SLANG_SRCINC) $(CFLAGS) -c $=
(DEFS) $(SRCDIR)/slsh.c<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd $(OBJDIR) &amp;&amp; $(CC) $(SLANG_SRCINC) $=
(CFLAGS) -c $(DEFS) $(SRCDIR)/slsh.c<br>
=C2=A0 $(OBJDIR)/readline.o: $(OBJDIR_TSTAMP) readline.c slsh.h config.h Ma=
kefile<br>
-- <br>
2.34.1<br>
<br>
___________________________________________________________________________=
_________________________________<br>
Ce message et ses pieces jointes peuvent contenir des informations confiden=
tielles ou privilegiees et ne doivent donc<br>
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu=
 ce message par erreur, veuillez le signaler<br>
a l&#39;expediteur et le detruire ainsi que les pieces jointes. Les message=
s electroniques etant susceptibles d&#39;alteration,<br>
Orange decline toute responsabilite si ce message a ete altere, deforme ou =
falsifie. Merci.<br>
<br>
This message and its attachments may contain confidential or privileged inf=
ormation that may be protected by law;<br>
they should not be distributed, used or copied without authorisation.<br>
If you have received this email in error, please notify the sender and dele=
te this message and its attachments.<br>
As emails may be altered, Orange is not liable for messages that have been =
modified, changed or falsified.<br>
Thank you.<br>
<br>
</blockquote></div></div>

--000000000000c63a4f061bb595cb--

--===============4687876271415297823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4687876271415297823==--
