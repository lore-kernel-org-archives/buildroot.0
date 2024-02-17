Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514BEC48BC3
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 09:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E095883CE7;
	Sat, 17 Feb 2024 09:32:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4HXhgdTlU6ba; Sat, 17 Feb 2024 09:32:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE48B83D10
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE48B83D10;
	Sat, 17 Feb 2024 09:32:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0AF431BF3FD
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 09:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC7716088D
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 09:32:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V5ImX0pY7RhT for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 09:32:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 77BBB60860
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77BBB60860
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 77BBB60860
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 09:32:49 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-55a035669d5so4275539a12.2
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 01:32:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708162367; x=1708767167;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c0X68w6/0UI756P4WOY09MHFlzZovthxirNflyk02Yg=;
 b=BGNWV4+Hx8q0BV7/daEw7ODyN/knpG1bcq+nDVB2MQB1DK3SHvNcQI+hJvmt0fzEBI
 bkb+t81YJK35ZVsfaqPk6/V8uuQmHsMrQBcAcnQYv/bnCpREUHSE9veW50Iw5z7V0wMl
 1S1o9GJxsxjBY0lOJXohJ7PlXjnFDVpPNnwJxFNsrJpTn5COQV32K66LoLIQyujTIKrl
 6iOEn6nYQsqNk6GRNeADXZQASx/WQ3zUGnQkmDPq4XIiYflEtR410QZH3XN5rttDE0hu
 IklhDBDp9U17guvMDQs7o2HpiT+mwuT8NOL4SBOCJ0qwKD89S0rskVYgzCOznkyB6FtQ
 Uucw==
X-Gm-Message-State: AOJu0YyYtXLHbAvR1vlGoozXsDgeaMbFAg5HiP+mdT2WPuxl3jYEE759
 T0mbjdg9Y1MNF3+8LizTX8K5X9qjg1or6FQBkdZk+JepNnoWvSk6/HJMniSsXMpxBqiUrl9/zzO
 y688=
X-Google-Smtp-Source: AGHT+IGcC5rNagI+JXXhzgdk+PnAAd1AgYQ7R0yiaI6x7Y4sAA/yflnoyWc/afM/lXSf7+qJKAr8Xw==
X-Received: by 2002:a17:907:382:b0:a3d:841e:3d75 with SMTP id
 ss2-20020a170907038200b00a3d841e3d75mr4783439ejb.61.1708162366979; 
 Sat, 17 Feb 2024 01:32:46 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com.
 [209.85.218.47]) by smtp.gmail.com with ESMTPSA id
 n18-20020a1709062bd200b00a3d3bc0d689sm821592ejg.72.2024.02.17.01.32.45
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Feb 2024 01:32:46 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a3de25186fbso162791266b.0
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 01:32:45 -0800 (PST)
X-Received: by 2002:a17:906:2288:b0:a3d:d0e3:6b6a with SMTP id
 p8-20020a170906228800b00a3dd0e36b6amr2960671eja.41.1708162365424; Sat, 17 Feb
 2024 01:32:45 -0800 (PST)
MIME-Version: 1.0
Date: Sat, 17 Feb 2024 01:32:33 -0800
X-Gmail-Original-Message-ID: <CA+h8R2qSV+Yd=HDfNKKFvERdWRTdsXxpsnZe9DHG26pEigphaQ@mail.gmail.com>
Message-ID: <CA+h8R2qSV+Yd=HDfNKKFvERdWRTdsXxpsnZe9DHG26pEigphaQ@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1708162367; x=1708767167; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=c0X68w6/0UI756P4WOY09MHFlzZovthxirNflyk02Yg=;
 b=cPRDdbtSv1+OImoUi63ccTBseB1SanzOCk4Y35l6Qz/ya4h8oI4VWUJF+u3+ZMIQhe
 vZb6P9BZ1eWtKHekOOB/z+Y5fwkfamcBLd2g2EhDT1RANAfCYbfEVk0hHdzFrGdxgRGF
 AKNnPB8O3KHmok1/BrJY76uAnBDcETPIM4E6kTM9V4BMbLb/893an+ptjHM54DRWy7J4
 Kl4ov3EktIcsvik9DzgpDipgniNSr0NJ14QcISYQD7D7kcOTA4Cc0mkTQHS2R/x64jT6
 Ka7U1fUBTp+AihNcdhXr+qtBVVH24kOougitkaGl+JEluzrptwcMrRKcBWPf74iMlrFx
 MFsQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=cPRDdbtS
Subject: [Buildroot] build failure on Ubuntu 22.04 LTS: TIME_BITS=64 is
 allowed only with FILE_OFFSET_BITS=64
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============0390450407616117334=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0390450407616117334==
Content-Type: multipart/alternative; boundary="0000000000000289d20611908be4"

--0000000000000289d20611908be4
Content-Type: text/plain; charset="UTF-8"

On a fresh Ubuntu 22.04.4 LTS VM:

git clone https://github.com/buildroot/buildroot
cd buildroot

# master as of this e-mail
git checkout 6c455505eb5ed8ed5bbf090f2bfb6241c9f153a2

cat <<EOF >> defconfig
BR2_arm=y
BR2_cortex_a7=y
BR2_BINUTILS_VERSION_2_41_X=y
BR2_GCC_VERSION_13_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_CCACHE=y
BR2_PACKAGE_SUDO=y
EOF

make defconfig BR2_DEFCONFIG=defconfig

# fails with error shown below
make sudo

I was able to fix it with this patch, but I'm not sure if this is the
"correct" fix:

From 6dc2b9350ceffc808fe7d048ff9dbe585649c304 Mon Sep 17 00:00:00 2001
From: Christian Stewart <christian@aperture.us>
Date: Sat, 17 Feb 2024 01:16:09 -0800
Subject: [PATCH] package/Makefile.in: fix build failure on Ubuntu 22.04 LTS

Add flags for 64 bit timestamps when building host packages.

-D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64

Build failure fixed:

/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is
allowed only with _FILE_OFFSET_BITS=64"
   26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"

Fixes: https://github.com/skiffos/SkiffOS/issues/306

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 3e276d23d6..82d3a435fd 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -246,7 +246,7 @@ UNZIP := $(shell which unzip || type -p unzip) -q

 APPLY_PATCHES = PATH=$(HOST_DIR)/bin:$$PATH
support/scripts/apply-patches.sh $(if $(QUIET),-s)

-HOST_CPPFLAGS  = -I$(HOST_DIR)/include
+HOST_CPPFLAGS  = -I$(HOST_DIR)/include -D_FILE_OFFSET_BITS=64
-D_TIME_BITS=64
 HOST_CFLAGS   ?= -O2
 HOST_CFLAGS   += $(HOST_CPPFLAGS)
 HOST_CXXFLAGS += $(HOST_CFLAGS)
-- 
2.43.1

Thanks,
Christian Stewart

--0000000000000289d20611908be4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On a fresh Ubuntu 22.04.4 LTS VM:<br><div><br></div><div>g=
it clone <a href=3D"https://github.com/buildroot/buildroot">https://github.=
com/buildroot/buildroot</a></div><div>cd buildroot</div><div><br></div><div=
># master as of this e-mail<br></div><div>git checkout 6c455505eb5ed8ed5bbf=
090f2bfb6241c9f153a2</div><div><br></div><div>cat &lt;&lt;EOF &gt;&gt; defc=
onfig<br>BR2_arm=3Dy<br>BR2_cortex_a7=3Dy<br>BR2_BINUTILS_VERSION_2_41_X=3D=
y<br>BR2_GCC_VERSION_13_X=3Dy<br>BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy</div><div>=
BR2_CCACHE=3Dy</div><div>BR2_PACKAGE_SUDO=3Dy</div><div>EOF</div><div><br><=
/div><div>make defconfig BR2_DEFCONFIG=3Ddefconfig</div><div><br></div><div=
># fails with error shown below<br></div><div>make sudo</div><div><br></div=
><div>I was able to fix it with this patch, but I&#39;m not sure if this is=
 the &quot;correct&quot; fix:</div><div><br></div><div>From 6dc2b9350ceffc8=
08fe7d048ff9dbe585649c304 Mon Sep 17 00:00:00 2001<br>From: Christian Stewa=
rt &lt;<a href=3D"mailto:christian@aperture.us">christian@aperture.us</a>&g=
t;<br>Date: Sat, 17 Feb 2024 01:16:09 -0800<br>Subject: [PATCH] package/Mak=
efile.in: fix build failure on Ubuntu 22.04 LTS<br><br>Add flags for 64 bit=
 timestamps when building host packages.<br><br>-D_FILE_OFFSET_BITS=3D64 -D=
_TIME_BITS=3D64<br><br>Build failure fixed:<br><br>/usr/include/features-ti=
me64.h:26:5: error: #error &quot;_TIME_BITS=3D64 is allowed only with _FILE=
_OFFSET_BITS=3D64&quot;<br>=C2=A0 =C2=A026 | # =C2=A0 error &quot;_TIME_BIT=
S=3D64 is allowed only with _FILE_OFFSET_BITS=3D64&quot;</div><div><br></di=
v><div>Fixes: <a href=3D"https://github.com/skiffos/SkiffOS/issues/306">htt=
ps://github.com/skiffos/SkiffOS/issues/306</a></div><div><br></div><div>Sig=
ned-off-by: Christian Stewart &lt;<a href=3D"mailto:christian@aperture.us">=
christian@aperture.us</a>&gt;<br>---<br>=C2=A0package/Makefile.in | 2 +-<br=
>=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br><br>diff --git a/pa=
ckage/Makefile.in b/package/Makefile.in<br>index 3e276d23d6..82d3a435fd 100=
644<br>--- a/package/Makefile.in<br>+++ b/package/Makefile.in<br>@@ -246,7 =
+246,7 @@ UNZIP :=3D $(shell which unzip || type -p unzip) -q<br>=C2=A0<br>=
=C2=A0APPLY_PATCHES =3D PATH=3D$(HOST_DIR)/bin:$$PATH support/scripts/apply=
-patches.sh $(if $(QUIET),-s)<br>=C2=A0<br>-HOST_CPPFLAGS =C2=A0=3D -I$(HOS=
T_DIR)/include<br>+HOST_CPPFLAGS =C2=A0=3D -I$(HOST_DIR)/include -D_FILE_OF=
FSET_BITS=3D64 -D_TIME_BITS=3D64<br>=C2=A0HOST_CFLAGS =C2=A0 ?=3D -O2<br>=
=C2=A0HOST_CFLAGS =C2=A0 +=3D $(HOST_CPPFLAGS)<br>=C2=A0HOST_CXXFLAGS +=3D =
$(HOST_CFLAGS)<br>-- <br>2.43.1</div><div><br></div><div>Thanks,</div><div>=
Christian Stewart<br></div><div><br></div></div>

--0000000000000289d20611908be4--

--===============0390450407616117334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0390450407616117334==--
