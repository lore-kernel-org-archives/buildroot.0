Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790A5EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 17:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCD6F82245;
	Thu, 20 Jul 2023 17:31:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCD6F82245
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4gopYSoxq2IL; Thu, 20 Jul 2023 17:31:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6454F82257;
	Thu, 20 Jul 2023 17:31:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6454F82257
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D6CE1BF5DA
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 17:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83ADD82257
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 17:31:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83ADD82257
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vG57rPkMJ-R9 for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 17:31:00 +0000 (UTC)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5794282245
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 17:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5794282245
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b95d5ee18dso16428761fa.1
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 10:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689874258; x=1690479058;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V4/nj/1lcUi9NJ2oIw0FQ1v4PHMGpThdFXic7WOXCvc=;
 b=TeYEILtg2azg/dPpmvqyiA3IjAWIzNfllnHCXEEVs+3kj/DESSFvJFsdSrnivW/s1g
 uURMhAMHy3hT8GicAtjbl0i4lcpGC3lJhkIWK+VcttDkzOIzNIHDzAwf3F0G1ksWj0wz
 rYmJd2jzRTzxUiTN5kI8vPQIHKhRzdhxXsQKBSi75TCXyxMuvLulKI3i2Zus11bwFKsV
 tR8fwBlnc9ttnNFf49GjEzuzh1lsNe3mscWGnkmYoglTxeIPYrznzCyxBeh7mJns+B6W
 fiPJzP1FW1GZ1xUOLUItTYIMfygswXhE2UQyY9s1JaGetAgAIBi6wn7j7bTFfNljeS9E
 7N1g==
X-Gm-Message-State: ABy/qLYVSaC3AbJxS/X32A5gwNlfFU2a9HniODcmRnm5RIMJCmzO0PS9
 AkK68evzGyQoTLt2pDJj4ATKtpUSSzYkjUdKg7s=
X-Google-Smtp-Source: APBJJlFz1DgAaA6MLqCj/tV/llbXPtVf6woGV4haGVK41Ax26sJ5Sot8WRvlfNQrvGYl1qObNzaaWB++BRXjyBzNiBM=
X-Received: by 2002:a2e:7314:0:b0:2b9:54e1:6711 with SMTP id
 o20-20020a2e7314000000b002b954e16711mr2775052ljc.7.1689874257989; Thu, 20 Jul
 2023 10:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230615134315.494330-1-sebastian.weyer@smile.fr>
 <20230615134315.494330-2-sebastian.weyer@smile.fr>
In-Reply-To: <20230615134315.494330-2-sebastian.weyer@smile.fr>
From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 20 Jul 2023 10:30:46 -0700
Message-ID: <CAFSsvmov7dQNi=6u-nSfOB9OnxzyiK6v=V10wWxNTa+w+66Bng@mail.gmail.com>
To: Sebastian Weyer <sebastian.weyer@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689874258; x=1690479058;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=V4/nj/1lcUi9NJ2oIw0FQ1v4PHMGpThdFXic7WOXCvc=;
 b=KyG/NnMdCjWb38eAdmLH1Ddl0ONg+nT+my7dTXZEzmlsXNQhfQj+F8U+xY9uHrI6xo
 nVpruq/PwltLEpE6AT1U3+th+giT3tk/z5Mvnf4gcGNM1SFuXBMxcp2ktZBgnURWaNQ8
 yzSQb++yHLajDT6L9u+O9g+5qDDDFEQFrzDAuXHwM297WHCSlTvl2NnkVSz+0mPQkMqz
 kI1Fk5bdGoF6grwAWbeUzl9hJ2jHMh7paCEsGFAzRT7Qz0dsG9k6lL2ktsh2fC5qEJk8
 lZfAB8dT65flPUaiXIFrmO32KzkJK6T2GTboy0XJ6Vq/7I1bR9JtfvNoXXstbWAHlWjo
 u6AQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=KyG/NnMd
Subject: Re: [Buildroot] [PATCH v4 01/10] package/llvm-project: new group
 for llvm packages
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
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3779336925893313660=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3779336925893313660==
Content-Type: multipart/alternative; boundary="000000000000dcd7c60600ee82b1"

--000000000000dcd7c60600ee82b1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>

On Thu, Jun 15, 2023 at 6:44=E2=80=AFAM Sebastian Weyer <sebastian.weyer@sm=
ile.fr>
wrote:

> From: Lang Daniel <d.lang@abatec.at>
>
> To make updating easier in the future, group all llvm projects in
> one subfolder and define some variables for all of them.
>
> Introduce LLVM_PROJECT_VERSION_MAJOR to be used by the clang package
> in a followup change.
>
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> Reviewed-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> ---
> v3: Add LLVM_PROJECT_VERSION_MAJOR
> ---
>  package/llvm-project/llvm-project.mk | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 package/llvm-project/llvm-project.mk
>
> diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/
> llvm-project.mk
> new file mode 100644
> index 0000000000..747a6f5647
> --- /dev/null
> +++ b/package/llvm-project/llvm-project.mk
> @@ -0,0 +1,11 @@
>
> +########################################################################=
########
> +#
> +# llvm-project
> +#
>
> +########################################################################=
########
> +
> +LLVM_PROJECT_VERSION_MAJOR =3D 11
> +LLVM_PROJECT_VERSION =3D $(LLVM_PROJECT_VERSION_MAJOR).1.0
> +LLVM_PROJECT_SITE =3D
> https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PRO=
JECT_VERSION)
> +
> +include $(sort $(wildcard package/llvm-project/*/*.mk))
> --
> 2.34.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000dcd7c60600ee82b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Tested-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett=
@amarulasolutions.com">adam.duskett@amarulasolutions.com</a>&gt;<div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun =
15, 2023 at 6:44=E2=80=AFAM Sebastian Weyer &lt;<a href=3D"mailto:sebastian=
.weyer@smile.fr">sebastian.weyer@smile.fr</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">From: Lang Daniel &lt;<a href=3D"m=
ailto:d.lang@abatec.at" target=3D"_blank">d.lang@abatec.at</a>&gt;<br>
<br>
To make updating easier in the future, group all llvm projects in<br>
one subfolder and define some variables for all of them.<br>
<br>
Introduce LLVM_PROJECT_VERSION_MAJOR to be used by the clang package<br>
in a followup change.<br>
<br>
Signed-off-by: Daniel Lang &lt;<a href=3D"mailto:d.lang@abatec.at" target=
=3D"_blank">d.lang@abatec.at</a>&gt;<br>
Reviewed-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@smile.fr" targ=
et=3D"_blank">romain.naour@smile.fr</a>&gt;<br>
Signed-off-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@smile.fr" ta=
rget=3D"_blank">romain.naour@smile.fr</a>&gt;<br>
Signed-off-by: Sebastian Weyer &lt;<a href=3D"mailto:sebastian.weyer@smile.=
fr" target=3D"_blank">sebastian.weyer@smile.fr</a>&gt;<br>
---<br>
v3: Add LLVM_PROJECT_VERSION_MAJOR<br>
---<br>
=C2=A0package/llvm-project/<a href=3D"http://llvm-project.mk" rel=3D"norefe=
rrer" target=3D"_blank">llvm-project.mk</a> | 11 +++++++++++<br>
=C2=A01 file changed, 11 insertions(+)<br>
=C2=A0create mode 100644 package/llvm-project/<a href=3D"http://llvm-projec=
t.mk" rel=3D"noreferrer" target=3D"_blank">llvm-project.mk</a><br>
<br>
diff --git a/package/llvm-project/<a href=3D"http://llvm-project.mk" rel=3D=
"noreferrer" target=3D"_blank">llvm-project.mk</a> b/package/llvm-project/<=
a href=3D"http://llvm-project.mk" rel=3D"noreferrer" target=3D"_blank">llvm=
-project.mk</a><br>
new file mode 100644<br>
index 0000000000..747a6f5647<br>
--- /dev/null<br>
+++ b/package/llvm-project/<a href=3D"http://llvm-project.mk" rel=3D"norefe=
rrer" target=3D"_blank">llvm-project.mk</a><br>
@@ -0,0 +1,11 @@<br>
+##########################################################################=
######<br>
+#<br>
+# llvm-project<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+LLVM_PROJECT_VERSION_MAJOR =3D 11<br>
+LLVM_PROJECT_VERSION =3D $(LLVM_PROJECT_VERSION_MAJOR).1.0<br>
+LLVM_PROJECT_SITE =3D <a href=3D"https://github.com/llvm/llvm-project/rele=
ases/download/llvmorg-$(LLVM_PROJECT_VERSION)" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/llvm/llvm-project/releases/download/llvmorg-$(L=
LVM_PROJECT_VERSION)</a><br>
+<br>
+include $(sort $(wildcard package/llvm-project/*/*.mk))<br>
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
</blockquote></div></div></div>

--000000000000dcd7c60600ee82b1--

--===============3779336925893313660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3779336925893313660==--
