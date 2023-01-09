Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8818C54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 22:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 601FF40903;
	Mon,  9 Jan 2023 22:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 601FF40903
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mimIW_r81v8J; Mon,  9 Jan 2023 22:07:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 246F540915;
	Mon,  9 Jan 2023 22:07:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 246F540915
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B67B41BF3F7
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 22:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CC7140915
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 22:07:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CC7140915
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CxK9ALQvzFSM for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 22:07:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 320B340903
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 320B340903
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 22:07:50 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id fc4so23756732ejc.12
 for <buildroot@buildroot.org>; Mon, 09 Jan 2023 14:07:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HM4+aC1W7lIbmIxYxJCcKcCzQLzPBF5BQiZtyEeuYTk=;
 b=RCvtpv1RN7qWKNPnW9vY+NrhZtW7gE3mn+UBpPte065ygHAXBYmxODxhLPAeCisBRK
 PmG2EWeWY7RklDV9sfrQhxElie9c6U/xY6iFHHh660XXis+prdiwsPL5w+ckEEb63cjG
 MVQ0GOgKtnKS2UI7NTx90lXoLfTRWY6fzr7phaD+uCAPriiObm02ngW1vH8IbbXNqeJ6
 Egz66/XmOa7KFu1gK/dbjd+NnAK/Hj4ByJOPaP0RtFrnd35KmCOHmVBq2Umt90VxNeHT
 AjFYOQlzOfJi0idxgUpozxK0d7W8zDokf8ev3cKybuW1GDEJyxUcvd1YJdy2c7a7gh8K
 flqA==
X-Gm-Message-State: AFqh2kry9+q8pHdHxWgIu/+icuU/9CRjnqPGhtANkTe5FK9JoKYfMRss
 216wUdIhNLtIL9eK0wbdGVsX5qncJX92Tlnc9mJFefP/
X-Google-Smtp-Source: AMrXdXufJTxpXmI8h72EWDhv+2CYOin02OBthYhXeMec8u7DwoCO+XDguAO/rdySMUesZV+o2VuTjXvmmez4+q8tTdw=
X-Received: by 2002:a17:907:34d6:b0:84d:41dd:ff43 with SMTP id
 zy22-20020a17090734d600b0084d41ddff43mr407202ejb.239.1673302068131; Mon, 09
 Jan 2023 14:07:48 -0800 (PST)
MIME-Version: 1.0
References: <20221018034605.800593-1-james.hilliard1@gmail.com>
In-Reply-To: <20221018034605.800593-1-james.hilliard1@gmail.com>
From: Charles Hardin <ckhardin@gmail.com>
Date: Mon, 9 Jan 2023 14:07:36 -0800
Message-ID: <CAN=fXj0BgK2ygmW4iUs9XuaxNZ+McUB+Z6Mu=rJ+dHRu_aFbcw@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HM4+aC1W7lIbmIxYxJCcKcCzQLzPBF5BQiZtyEeuYTk=;
 b=EG2pEPIVqoPsXgAlgsXCzzSU8ImhoB6K9q+HV/uWNozFDDlkIWNkbWIHUjtzhimQd0
 /pD1kooKhr6x9c+/R0mMDNBDWyygSB/6osC/qndOjKGL5/gPc3v4U0vgT4j3ST0S0axQ
 YUK79a/HGHOikcezval5NyYIc6zvA5rjPpPISJZREK/KdlfTj6EvCqLG+PmFjl0wZemB
 vxpeBUO3pYn8tsKtRANDfzC8RfC/Q2S8y140ya3DUBT+SkgIZdLQ6fW7E076j7NyH78m
 luCntE0ljFhrSxtWCu41pB2KbSpkq8HpxGOaxyZOEZeejdr0dQR0MFocWPK0O/6JzKEb
 xkhA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EG2pEPIV
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: fix rule order
 for re{install, build, configure}
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
Content-Type: multipart/mixed; boundary="===============3020683132155632211=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3020683132155632211==
Content-Type: multipart/alternative; boundary="0000000000005f7c6705f1dbffdc"

--0000000000005f7c6705f1dbffdc
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 17, 2022 at 8:46 PM James Hilliard <james.hilliard1@gmail.com>
wrote:

> These command rely on the clean operations being first so that the
> stamp files being deleted will rebuild the targets.
>
> The execution ordering of the clean and rebuild operations may
> change, for example if --shuffle=reversed is set.
>
> To ensure the evaluation order is always correct use double colon
> rules to make the evaluation order explicit as per make docs:
>
> The double-colon rules for a target are executed in the order they
> appear in the makefile.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>

Tested-by: Charles Hardin <ckhardin@gmail.com>

Set LINUX_OVERRIDE_SRCDIR in local.mk
touch arm64/kernel/setup.c
make linux-rebuild
See Building steps with CC on the changed file setup.c


> ---
>  package/pkg-generic.mk | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index f24e03a325..6cb461af90 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -1057,17 +1057,20 @@ endif
>                         rm -f $$($(2)_TARGET_INSTALL_IMAGES)
>                         rm -f $$($(2)_TARGET_INSTALL_HOST)
>
> -$(1)-reinstall:                $(1)-clean-for-reinstall $(1)
> +$(1)-reinstall::               $(1)-clean-for-reinstall
> +$(1)-reinstall::               $(1)
>
>  $(1)-clean-for-rebuild: $(1)-clean-for-reinstall
>                         rm -f $$($(2)_TARGET_BUILD)
>
> -$(1)-rebuild:          $(1)-clean-for-rebuild $(1)
> +$(1)-rebuild::         $(1)-clean-for-rebuild
> +$(1)-rebuild::         $(1)
>
>  $(1)-clean-for-reconfigure: $(1)-clean-for-rebuild
>                         rm -f $$($(2)_TARGET_CONFIGURE)
>
> -$(1)-reconfigure:      $(1)-clean-for-reconfigure $(1)
> +$(1)-reconfigure::     $(1)-clean-for-reconfigure
> +$(1)-reconfigure::     $(1)
>
>  # define the PKG variable for all targets, containing the
>  # uppercase package variable prefix
> --
> 2.34.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000005f7c6705f1dbffdc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 17, 2022 at 8:46 PM James=
 Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com">james.hilliard1@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">These command rely on the clean operations being first so that t=
he<br>
stamp files being deleted will rebuild the targets.<br>
<br>
The execution ordering of the clean and rebuild operations may<br>
change, for example if --shuffle=3Dreversed is set.<br>
<br>
To ensure the evaluation order is always correct use double colon<br>
rules to make the evaluation order explicit as per make docs:<br>
<br>
The double-colon rules for a target are executed in the order they<br>
appear in the makefile.<br>
<br>
Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.c=
om" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br></blockquote><di=
v><br></div><div>Tested-by: Charles Hardin &lt;<a href=3D"mailto:ckhardin@g=
mail.com">ckhardin@gmail.com</a>&gt;</div><div><br></div><div>Set LINUX_OVE=
RRIDE_SRCDIR in <a href=3D"http://local.mk">local.mk</a></div><div>touch ar=
m64/kernel/setup.c</div><div>make linux-rebuild</div><div>See Building step=
s with CC on the changed file setup.c</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0package/<a href=3D"http://pkg-generic.mk" rel=3D"noreferrer" target=
=3D"_blank">pkg-generic.mk</a> | 9 ++++++---<br>
=C2=A01 file changed, 6 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/package/<a href=3D"http://pkg-generic.mk" rel=3D"noreferrer" t=
arget=3D"_blank">pkg-generic.mk</a> b/package/<a href=3D"http://pkg-generic=
.mk" rel=3D"noreferrer" target=3D"_blank">pkg-generic.mk</a><br>
index f24e03a325..6cb461af90 100644<br>
--- a/package/<a href=3D"http://pkg-generic.mk" rel=3D"noreferrer" target=
=3D"_blank">pkg-generic.mk</a><br>
+++ b/package/<a href=3D"http://pkg-generic.mk" rel=3D"noreferrer" target=
=3D"_blank">pkg-generic.mk</a><br>
@@ -1057,17 +1057,20 @@ endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rm -f $$($(2)_TARGET_INSTALL_IMAGES)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rm -f $$($(2)_TARGET_INSTALL_HOST)<br>
<br>
-$(1)-reinstall:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(1=
)-clean-for-reinstall $(1)<br>
+$(1)-reinstall::=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(1=
)-clean-for-reinstall<br>
+$(1)-reinstall::=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(1=
)<br>
<br>
=C2=A0$(1)-clean-for-rebuild: $(1)-clean-for-reinstall<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rm -f $$($(2)_TARGET_BUILD)<br>
<br>
-$(1)-rebuild:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(1)-clean-for-rebuild $(1=
)<br>
+$(1)-rebuild::=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(1)-clean-for-rebuild<br>
+$(1)-rebuild::=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(1)<br>
<br>
=C2=A0$(1)-clean-for-reconfigure: $(1)-clean-for-rebuild<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rm -f $$($(2)_TARGET_CONFIGURE)<br>
<br>
-$(1)-reconfigure:=C2=A0 =C2=A0 =C2=A0 $(1)-clean-for-reconfigure $(1)<br>
+$(1)-reconfigure::=C2=A0 =C2=A0 =C2=A0$(1)-clean-for-reconfigure<br>
+$(1)-reconfigure::=C2=A0 =C2=A0 =C2=A0$(1)<br>
<br>
=C2=A0# define the PKG variable for all targets, containing the<br>
=C2=A0# uppercase package variable prefix<br>
-- <br>
2.34.1<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--0000000000005f7c6705f1dbffdc--

--===============3020683132155632211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3020683132155632211==--
