Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B24EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 17:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E632782141;
	Thu, 20 Jul 2023 17:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E632782141
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S6DcOOZNV-yh; Thu, 20 Jul 2023 17:32:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C039D82848;
	Thu, 20 Jul 2023 17:32:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C039D82848
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E61B1BF5DA
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 17:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77BB061216
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 17:32:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77BB061216
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PPG1getMODU3 for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 17:32:18 +0000 (UTC)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B25B61162
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 17:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B25B61162
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fb5bcb9a28so1703982e87.3
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 10:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689874336; x=1690479136;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r6mCupjKkan+/+FDLfuE8YFOfM/nI1p0xZaX9FMibr0=;
 b=ZNiGXONJS8Ui2BGv8+07ZGwQ1g7DfJRXX07/9uKBYX8JrJ60VIaaV7p7rvE6Oiuu6Y
 CtMRprjBTKhp7jcVSyI0Q+fKavJNHxFcyT+RwFxd+c8t/4sbIiqCJtYmcNFH0dPOH7Uu
 a5GxPsci8VNir8DIgPkZkKbLdemKz1TrWNivKYUBfACoBfdc7jwYz1AjPqwqDHyQpK/T
 5lvWZWCofietjjbLMKF4p5hZuZR6RSnq4XLXH9VN4Meakrdhjoh0HP1nrl9z4+oO5iwu
 QICZbr3RCWZiqTRkkFEe15nOXWBG0+/YDTb7D84OpqlVFTvFiopshRN7CSxazCjXLwC7
 B1pg==
X-Gm-Message-State: ABy/qLakng32G4NehHsAfGy6qzLShmcSfkdOaNw1sghB5h7zPw/dJGB/
 wal9m/KHxr7gTdXxDYi2C9HYyrBFg+r7u19Usqw=
X-Google-Smtp-Source: APBJJlEOIru0n41K4GxNE+TwEC9iwGiZS/CAZQvY3qaiDtKYks5BbWHEM78ZmXuJWkQkQv6eTyTiDWwqpRUYM1B0rOE=
X-Received: by 2002:ac2:4e8c:0:b0:4fb:7c40:9f97 with SMTP id
 o12-20020ac24e8c000000b004fb7c409f97mr2533531lfr.27.1689874335804; Thu, 20
 Jul 2023 10:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230615134315.494330-1-sebastian.weyer@smile.fr>
 <20230615134315.494330-9-sebastian.weyer@smile.fr>
In-Reply-To: <20230615134315.494330-9-sebastian.weyer@smile.fr>
From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 20 Jul 2023 10:32:04 -0700
Message-ID: <CAFSsvmrE7cPPT=Aw0HcaJCuW+64kdyvOL8_qFgv1VB8j5LJVeg@mail.gmail.com>
To: Sebastian Weyer <sebastian.weyer@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689874336; x=1690479136;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=r6mCupjKkan+/+FDLfuE8YFOfM/nI1p0xZaX9FMibr0=;
 b=Nw31c9K+YQjYlo0gxIFpLq23qcX3vSufYMXNwW2O7bCTvysyTZumwWjPkVNQwCp1vA
 mshWpojYvZwxnIzu4Fsc/RWYvj0K9BGumKnS8VvJ1+NN288E1H927S2JPC+RdS+c5PBN
 ++0TJDQVEGquu98+iPgnyHc2YD2fcZBphOchjskZG4O5Lk8oLTiTq7qcx4QiVlQRPjjK
 +RkE+nWpahnAd876Jclz2Xr9WjFo3qQhYUY6eiNAnMnuIhVohmJYPZqmmpT0hfrdjCl5
 N5Mb6SEK+9BWFGGkXI4ph0xNec8xkFFP+OKJ8XMJpJkHGMjHjGN+HdEuEA9mU26rAIAq
 66zw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Nw31c9K+
Subject: Re: [Buildroot] [PATCH v4 08/10]
 package/llvm-project/llvm-libunwind: new package
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
Cc: Lang Daniel <d.lang@abatec.at>, Romain Naour <romain.naour@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============9148437966356205241=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9148437966356205241==
Content-Type: multipart/alternative; boundary="0000000000008031a40600ee8773"

--0000000000008031a40600ee8773
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>

On Thu, Jun 15, 2023 at 6:46=E2=80=AFAM Sebastian Weyer <sebastian.weyer@sm=
ile.fr>
wrote:

> From: Lang Daniel <d.lang@abatec.at>
>
> Starting with version 15, lld needs the llvm implementation
> of libunwind, therefore it is added as a host package.
>
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> ---
> v3: force llvm-libunwind version to 15.0.3 since LLVM_PROJECT_VERSION
>     is still at 11.1.0
> ---
>  .../llvm-libunwind/llvm-libunwind.hash         |  3 +++
>  .../llvm-libunwind/llvm-libunwind.mk           | 18 ++++++++++++++++++
>  2 files changed, 21 insertions(+)
>  create mode 100644 package/llvm-project/llvm-libunwind/llvm-libunwind.ha=
sh
>  create mode 100644 package/llvm-project/llvm-libunwind/llvm-libunwind.mk
>
> diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
> b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
> new file mode 100644
> index 0000000000..86775f5dba
> --- /dev/null
> +++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
> @@ -0,0 +1,3 @@
> +# locally computed
> +sha256  0ab6e07bf05359e242e9ea80e4089b819914867fa997a715e324e584bcfdf114
> libunwind-15.0.3.src.tar.xz
> +sha256  b5efebcaca80879234098e52d1725e6d9eb8fb96a19fce625d39184b705f7b6d
> LICENSE.TXT
> diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.mk
> b/package/llvm-project/llvm-libunwind/llvm-libunwind.mk
> new file mode 100644
> index 0000000000..825e1beac0
> --- /dev/null
> +++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.mk
> @@ -0,0 +1,18 @@
>
> +########################################################################=
########
> +#
> +# llvm-libunwind
> +#
>
> +########################################################################=
########
> +
> +LLVM_LIBUNWIND_VERSION =3D 15.0.3
> +LLVM_LIBUNWIND_SITE =3D $(LLVM_PROJECT_SITE)
> +LLVM_LIBUNWIND_SOURCE =3D libunwind-$(LLVM_LIBUNWIND_VERSION).src.tar.xz
> +LLVM_LIBUNWIND_LICENSE =3D Apache-2.0 with exceptions
> +LLVM_LIBUNWIND_LICENSE_FILES =3D LICENSE.TXT
> +LLVM_LIBUNWIND_SUPPORTS_IN_SOURCE_BUILD =3D NO
> +
> +HOST_LLVM_LIBUNWIND_CONF_OPTS +=3D \
> +       -DCMAKE_MODULE_PATH=3D"$(HOST_DIR)/lib/cmake/llvm" \
> +       -DLIBUNWIND_INSTALL_HEADERS=3DON
> +
> +$(eval $(host-cmake-package))
> --
> 2.34.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000008031a40600ee8773
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Tested-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett=
@amarulasolutions.com" target=3D"_blank">adam.duskett@amarulasolutions.com<=
/a>&gt;<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Thu, Jun 15, 2023 at 6:46=E2=80=AFAM Sebastian Weyer &lt;<a h=
ref=3D"mailto:sebastian.weyer@smile.fr">sebastian.weyer@smile.fr</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Lang =
Daniel &lt;<a href=3D"mailto:d.lang@abatec.at" target=3D"_blank">d.lang@aba=
tec.at</a>&gt;<br>
<br>
Starting with version 15, lld needs the llvm implementation<br>
of libunwind, therefore it is added as a host package.<br>
<br>
Signed-off-by: Daniel Lang &lt;<a href=3D"mailto:d.lang@abatec.at" target=
=3D"_blank">d.lang@abatec.at</a>&gt;<br>
Signed-off-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@smile.fr" ta=
rget=3D"_blank">romain.naour@smile.fr</a>&gt;<br>
Signed-off-by: Sebastian Weyer &lt;<a href=3D"mailto:sebastian.weyer@smile.=
fr" target=3D"_blank">sebastian.weyer@smile.fr</a>&gt;<br>
---<br>
v3: force llvm-libunwind version to 15.0.3 since LLVM_PROJECT_VERSION<br>
=C2=A0 =C2=A0 is still at 11.1.0<br>
---<br>
=C2=A0.../llvm-libunwind/llvm-libunwind.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 3 +++<br>
=C2=A0.../llvm-libunwind/<a href=3D"http://llvm-libunwind.mk" rel=3D"norefe=
rrer" target=3D"_blank">llvm-libunwind.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 18 ++++++++++++++++++<br>
=C2=A02 files changed, 21 insertions(+)<br>
=C2=A0create mode 100644 package/llvm-project/llvm-libunwind/llvm-libunwind=
.hash<br>
=C2=A0create mode 100644 package/llvm-project/llvm-libunwind/<a href=3D"htt=
p://llvm-libunwind.mk" rel=3D"noreferrer" target=3D"_blank">llvm-libunwind.=
mk</a><br>
<br>
diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash b/pack=
age/llvm-project/llvm-libunwind/llvm-libunwind.hash<br>
new file mode 100644<br>
index 0000000000..86775f5dba<br>
--- /dev/null<br>
+++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash<br>
@@ -0,0 +1,3 @@<br>
+# locally computed<br>
+sha256=C2=A0 0ab6e07bf05359e242e9ea80e4089b819914867fa997a715e324e584bcfdf=
114=C2=A0 libunwind-15.0.3.src.tar.xz<br>
+sha256=C2=A0 b5efebcaca80879234098e52d1725e6d9eb8fb96a19fce625d39184b705f7=
b6d=C2=A0 LICENSE.TXT<br>
diff --git a/package/llvm-project/llvm-libunwind/<a href=3D"http://llvm-lib=
unwind.mk" rel=3D"noreferrer" target=3D"_blank">llvm-libunwind.mk</a> b/pac=
kage/llvm-project/llvm-libunwind/<a href=3D"http://llvm-libunwind.mk" rel=
=3D"noreferrer" target=3D"_blank">llvm-libunwind.mk</a><br>
new file mode 100644<br>
index 0000000000..825e1beac0<br>
--- /dev/null<br>
+++ b/package/llvm-project/llvm-libunwind/<a href=3D"http://llvm-libunwind.=
mk" rel=3D"noreferrer" target=3D"_blank">llvm-libunwind.mk</a><br>
@@ -0,0 +1,18 @@<br>
+##########################################################################=
######<br>
+#<br>
+# llvm-libunwind<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+LLVM_LIBUNWIND_VERSION =3D 15.0.3<br>
+LLVM_LIBUNWIND_SITE =3D $(LLVM_PROJECT_SITE)<br>
+LLVM_LIBUNWIND_SOURCE =3D libunwind-$(LLVM_LIBUNWIND_VERSION).src.tar.xz<b=
r>
+LLVM_LIBUNWIND_LICENSE =3D Apache-2.0 with exceptions<br>
+LLVM_LIBUNWIND_LICENSE_FILES =3D LICENSE.TXT<br>
+LLVM_LIBUNWIND_SUPPORTS_IN_SOURCE_BUILD =3D NO<br>
+<br>
+HOST_LLVM_LIBUNWIND_CONF_OPTS +=3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DCMAKE_MODULE_PATH=3D&quot;$(HOST_DIR)/lib/cma=
ke/llvm&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DLIBUNWIND_INSTALL_HEADERS=3DON<br>
+<br>
+$(eval $(host-cmake-package))<br>
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
</blockquote></div>

--0000000000008031a40600ee8773--

--===============9148437966356205241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9148437966356205241==--
