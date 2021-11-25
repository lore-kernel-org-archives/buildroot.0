Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D10C433EF
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 12:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56A6E400DE;
	Thu, 25 Nov 2021 12:27:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Ytt3cdCHllC; Thu, 25 Nov 2021 12:27:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C920402A1;
	Thu, 25 Nov 2021 12:27:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7DA541BF3CC
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 12:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D02F60737
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 12:27:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dDXCLIQpD7uk for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 12:27:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F8AA606CA
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 12:27:14 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id e3so24947691edu.4
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 04:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=oJ9Ajakij2gRHseIIhgTd7PS3ugfbWRvmX6nVrS5Z2s=;
 b=JeaOn0tqjtzJ5bYnfoGSxBHgXOJaU49DEQtrJqhiM1k3NURnxB0v0OiocvrkA+bt3x
 C+BcB6qj8h8nr4N8OxzMOavkHcI7lsq1juLU94sCEr255SrCRH/WR12VhetnKRJOz1By
 uxoQq2JQYvQvV/3oHTyFufZrzdaldx52EqWdquraRrNSslsy1IvkIVD1MdwAAG+P1b+y
 w+QjFL67RbGOf+UJIHd9asDjwsmo5FATpEQxn0ecK5cNgzpBGIhsuYFyyrVw0/uluyuI
 Sh1uJBuh+Og4e5wsT94CQcdE7X5JpLyo4xv+05zA5PLfHkIHcD9uX9KpvHHMZRJMnF4y
 YOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=oJ9Ajakij2gRHseIIhgTd7PS3ugfbWRvmX6nVrS5Z2s=;
 b=ksdEFImnaB5geszeGe28K+ri25snW21EOUBnblhTiz8RqU/rvHKiKUkZvOBNJNPgvf
 oE2hupjxDFnkNgATNkI2VI/BFfScbief61v9JXitaDTaAvhfKxCF+9htQBlpBXXZNkff
 aB5JwCdre0vWogxgNkwmyC87tAfzi9eMsX3Z8vGDtqYEsMj1rjFq825kXlC8TUq5w4Bl
 fvYmzcICOW06Tg5fzXX06ChyezY0qG/ggFSYhvrav2T6/b1T2gMACXFQsalZBHSZmsK6
 yrBJ1CazOmlBcm02uowE23FaIMtd5weamA52wZ30/Mklv5cJxnNhAZbEPvv499OJp7dA
 HIog==
X-Gm-Message-State: AOAM5325p2z7vdibNbuaHGFkMMqW90PozVwvUHc0tIPH0U8f5ss/m/4O
 FtsZ8HFkRiwC7Skhm/y04dJyO6inMhcxtw8DpQd1KV4x1kHvq8AbqnAHIQ==
X-Google-Smtp-Source: ABdhPJzqfhoOSQbyrNsG1tfncHSCCU6wSEXvbSn6PO1Ax+al67ek6Zo8bSrRVKrlCHdrqO5q29Pq7CI/hVhJ1qV/4zY=
X-Received: by 2002:a50:da0a:: with SMTP id z10mr37818069edj.298.1637843232413; 
 Thu, 25 Nov 2021 04:27:12 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Thu, 25 Nov 2021 14:27:01 +0200
Message-ID: <CAJPV9MrtNQVuADbYs1HWE89Hnnf7h=68tRZEQ6=0n8XPMPYb6g@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
Subject: [Buildroot] Package dependency
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
Content-Type: multipart/mixed; boundary="===============1055067940768458422=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1055067940768458422==
Content-Type: multipart/alternative; boundary="00000000000010f38e05d19c184a"

--00000000000010f38e05d19c184a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi buildroot list,

I'm working on a package for minijail that

has a build dependency on libcap. I'm having
troubles to set the dependency in the recipe and
I fail to find what is wrong, so I want to ask for hints.

Current Config.in:


config BR2_PACKAGE_MINIJAIL
       bool "minijail"
       select BR2_PACKAGE_HOST_LIBCAP
       select BR2_PACKAGE_LIBCAP
       help
         Minijail is a sandboxing tool maintained by google.

         https://google.github.io/minijail/

Current recipe:


###########################################################################=
#####

#
# minijail
#
###########################################################################=
#####


MINIJAIL_VERSION =3D linux-v17
MINIJAIL_SOURCE =3D $(MINIJAIL_VERSION).tar.gz
MINIJAIL_SITE =3D "https://github.com/google/minijail/archive/refs/tags"
MINIJAIL_LICENSE =3D BSD-Style
MINIJAIL_LICENSE_FILES =3D LICENSE
MINIJAIL_DEPENDENCY=3Dlibcap host-libcap

define MINIJAIL_BUILD_CMDS
       (cd $(@D); \
       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$(d) CC=3D"$(TARGET_CC)")
endef

define MINIJAIL_INSTALL_TARGET_CMDS
       $(INSTALL) -m 0755 -D $(@D)/minijail0 \
               $(TARGET_DIR)/usr/bin/minijail0
       $(INSTALL) -m 0755 -D $(@D)/libminijailpreload.so \
               $(TARGET_DIR)/lib/libminijailpreload.so
       $(INSTALL) -m 0755 -D $(@D)/libminijail.so \
               $(TARGET_DIR)/lib/libminijail.so
endef

$(eval $(generic-package))

Thanks!

Jos=C3=A9 Pekkarinen.

--00000000000010f38e05d19c184a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><blockquote style=3D"margin:0 0 0 40px;bord=
er:none;padding:0px">Hi buildroot list,<br><br>I&#39;m working on a package=
 for minijail that<br></blockquote>has a build dependency on libcap. I&#39;=
m having<div>troubles to set the dependency in the recipe and</div><div>I f=
ail to find what is wrong, so I want to ask for hints.</div><div><br></div>=
<div><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><div>C=
urrent Config.in:</div></blockquote><div><br></div>config BR2_PACKAGE_MINIJ=
AIL<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;minijail&quot;<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HOST_LIBCAP<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0select BR2_PACKAGE_LIBCAP<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Minijail is a sandboxing tool maintained by goog=
le.<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://google.gith=
ub.io/minijail/">https://google.github.io/minijail/</a></div><div><br></div=
><div><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><div>=
Current recipe:</div></blockquote><br></div><div><span style=3D"font-family=
:monospace"><span style=3D"color:rgb(0,0,0)">##############################=
##################################################
</span><br>#
<br># minijail
<br>#
<br>#######################################################################=
#########
<br>
<br>MINIJAIL_VERSION =3D linux-v17
<br>MINIJAIL_SOURCE =3D $(MINIJAIL_VERSION).tar.gz
<br>MINIJAIL_SITE =3D &quot;<a href=3D"https://github.com/google/minijail/a=
rchive/refs/tags">https://github.com/google/minijail/archive/refs/tags</a>&=
quot;
<br>MINIJAIL_LICENSE =3D BSD-Style
<br>MINIJAIL_LICENSE_FILES =3D LICENSE
<br>MINIJAIL_DEPENDENCY=3Dlibcap host-libcap
<br>
<br>define MINIJAIL_BUILD_CMDS
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(cd $(@D); \
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(TARGET_MAKE_ENV) $(MAKE) -=
C $(@D)/$(d) CC=3D&quot;$(TARGET_CC)&quot;)
<br>endef
<br>
<br>define MINIJAIL_INSTALL_TARGET_CMDS
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(INSTALL) -m 0755 -D $(@D)/=
minijail0 \
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0$(TARGET_DIR)/usr/bin/minijail0
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(INSTALL) -m 0755 -D $(@D)/=
libminijailpreload.so \
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0$(TARGET_DIR)/lib/libminijailpreload.so
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(INSTALL) -m 0755 -D $(@D)/=
libminijail.so \
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0$(TARGET_DIR)/lib/libminijail.so
<br>endef
<br>
<br>$(eval $(generic-package))<br></span></div><div><span style=3D"font-fam=
ily:monospace"><br></span></div><blockquote style=3D"margin:0 0 0 40px;bord=
er:none;padding:0px"><div><span style=3D"font-family:monospace">Thanks!</sp=
an></div><div><span style=3D"font-family:monospace"><br></span></div></bloc=
kquote><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gm=
ail_signature"><div dir=3D"ltr"><blockquote style=3D"margin:0 0 0 40px;bord=
er:none;padding:0px">Jos=C3=A9 Pekkarinen.</blockquote></div></div></div></=
div>

--00000000000010f38e05d19c184a--

--===============1055067940768458422==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1055067940768458422==--
