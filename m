Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535F0C52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 03:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0AFD606C2;
	Wed,  7 Aug 2024 03:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0kNBWV7ILRNf; Wed,  7 Aug 2024 03:06:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D89F860668
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D89F860668;
	Wed,  7 Aug 2024 03:06:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F4251BF2C7
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 03:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 432B560668
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 03:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BkxcET2LF-Ov for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 03:06:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com;
 envelope-from=shengwen1997.tw@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E234960665
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E234960665
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E234960665
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 03:06:03 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-661d7e68e89so4468657b3.0
 for <buildroot@buildroot.org>; Tue, 06 Aug 2024 20:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722999962; x=1723604762;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r1ZoK2fa2IBfG8ZQCx5lRBruwCVP9swFZ2hhXVggCxw=;
 b=pkXduGhDCvygDMd8bcJOCqUHR5paDsuMRH5ZFcJjUQlVPUbfoh+WGYwrvT3XLS4C9i
 rPfdOizyszIaRXuZg5iXY+K8PSRWkZVV81zY5L0dnbB/ExFrUD2MeEyu2h0eCVLjY8Bn
 6kSGhzN4vT/EPhm57YzQY1G7eKb05nGfupfrre73bvFQ6eUueaVZrunJboM8s+JwCvy6
 jzpwSzgtaeftolT0l3zssfZeS8LJ4Q/kzaVS0QvdN2CyanAGpxpoiuRMZyH0Wm5BmBzl
 PHsFkrwVe5WWOypz7MzEI1nXQh9rmDuXnKHeDXM+Gp+0PF7jKgmYNSE872ILn43SWJDw
 U4NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwk9KVzdeM4KqYZs0xjud0WPJkY+kpAIO5D3rD2MoEHYaXEM5VfxeVuO3AtMjFOATPUbNyoFKA8sV09SqAMuxafVZLjizFkg==
X-Gm-Message-State: AOJu0Ywk5vqR6+hAPRab8WkpxDYf1eU9jZtZaXxKTCcARM1HkiUp/Da3
 42lVLtDUuFhwixaAWy/MQJlJnuDyUF2SHwUBROa4ZdGEbi+Yhe05JlAJHdyQeniD5VQeu2nYE8k
 pRhhDlpbgqsg4xcGDe7RobUhMQNeLoy/Z
X-Google-Smtp-Source: AGHT+IEAbPo0c2eg6/0eUfqPjMYhGFDPL7LM8Bo5/NTgxDEgIZ8J4q4hAh4VvlKSVEgLzhyZvPailoEVk7TlEVBFomk=
X-Received: by 2002:a81:9c04:0:b0:62f:60db:326 with SMTP id
 00721157ae682-69913c6e372mr7015997b3.20.1722999962359; Tue, 06 Aug 2024
 20:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240705132544.351613-1-shengwen1997.tw@gmail.com>
In-Reply-To: <20240705132544.351613-1-shengwen1997.tw@gmail.com>
From: Shengwen Cheng <shengwen1997.tw@gmail.com>
Date: Wed, 7 Aug 2024 11:05:51 +0800
Message-ID: <CAF=gnWj61OEvAx_52R2Kz9XJvwi9d4q3BOu-7P3528B=0XL+JA@mail.gmail.com>
To: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722999962; x=1723604762; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=r1ZoK2fa2IBfG8ZQCx5lRBruwCVP9swFZ2hhXVggCxw=;
 b=g03Aa8nZwxSp5IY7f5WhtQUHKWKBeqeCcEoJp+6pcsLKqphRWfpQqOWnsIrrxqewBq
 hnCOFFRXESP9rG33BSt8tAIFVSApxmfQTmMsMwcCbzZ1ayhLoQWxdrcl8azSpwLYRcJ2
 J3Ork3W8JHzrE+67AUW4623uMB1a7tYGEYKOBc2Nulz5Xvgz9YJsX2s6mkcVId5lY8+C
 khh12pdx7qWBmNmNda3NZHoXkbwE8etTNvEjWqvQxKih2/VA06KNnYwcK3DWMUD5AEnj
 fg57WIHM0o4KTDEsxUT5PZJj/zzK+oBgfk7gqUHTWPXa7Bv9crXh2Qr/9Uo9+rd/fes1
 Y3LA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=g03Aa8nZ
Subject: [Buildroot] Fwd: [PATCH 1/1] package/directfb2: add directfb2
 packages
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
Cc: "Ching-Chun \(Jim\) Huang" <jserv@ccns.ncku.edu.tw>
Content-Type: multipart/mixed; boundary="===============8039103841260887862=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8039103841260887862==
Content-Type: multipart/alternative; boundary="000000000000b4630c061f0f3096"

--000000000000b4630c061f0f3096
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas Petazzoni,

I submitted a change regarding the inclusion of DirectFB2 into Buildroot on
July 5th, but I haven't received a response yet.
Could you please provide any advice for my submission?

Patchwork link :
https://patchwork.ozlabs.org/project/buildroot/patch/20240705132544.351613-=
1-shengwen1997.tw@gmail.com/

Thanks,

Colin Cheng

---------- Forwarded message ---------
From: Shengwen Cheng <shengwen1997.tw@gmail.com>
Date: Fri, Jul 5, 2024 at 9:26=E2=80=AFPM
Subject: [PATCH 1/1] package/directfb2: add directfb2 packages
To: <buildroot@buildroot.org>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Jim Huang <
jserv@ccns.ncku.edu.tw>, Shengwen Cheng <shengwen1997.tw@gmail.com>


This introduces DirectFB2, a fork of DirectFB to the Buildroot. The origina=
l
DirectFB has not been maintained since 2016. Meanwhile, in 2022, DirectFB2
was
announced at FOSDEM in Brussels, with the goal of maintaining DirectFB for
use
on embedded systems.

New packages:
1. directfb2
2. directfb2-csource
3. directfb2-lite
4. directfb2-media
5. directfb2-tools
6. directfb2-examples
7. dfbterm

[1]
https://archive.fosdem.org/2022/schedule/event/directfb/attachments/slides/
5077/export/events/attachments/directfb/slides/5077/fosdem_2022_directfb2.p=
df
<https://archive.fosdem.org/2022/schedule/event/directfb/attachments/slides=
/5077/export/events/attachments/directfb/slides/5077/fosdem_2022_directfb2.=
pdf>

Signed-off-by: Shengwen Cheng <shengwen1997.tw@gmail.com>
---
 package/Config.in                             |   1 +
 package/dfbterm/Config.in                     |  11 ++
 package/dfbterm/dfbterm.mk                    |  14 +++
 package/directfb2-csource/Config.in           |   6 +
 .../directfb2-csource/directfb2-csource.mk    |  15 +++
 package/directfb2-examples/Config.in          | 104 ++++++++++++++++++
 .../directfb2-examples/directfb2-examples.mk  |  61 ++++++++++
 package/directfb2-lite/Config.in              |   7 ++
 package/directfb2-lite/directfb2-lite.mk      |  15 +++
 package/directfb2-media/Config.in             |   6 +
 package/directfb2-media/directfb2-media.mk    |  15 +++
 package/directfb2-tools/Config.in             |   5 +
 package/directfb2-tools/directfb2-tools.mk    |  14 +++
 package/directfb2/Config.in                   |  70 ++++++++++++
 package/directfb2/directfb2.mk                |  62 +++++++++++
 15 files changed, 406 insertions(+)
 create mode 100644 package/dfbterm/Config.in
 create mode 100644 package/dfbterm/dfbterm.mk
 create mode 100644 package/directfb2-csource/Config.in
 create mode 100644 package/directfb2-csource/directfb2-csource.mk
 create mode 100644 package/directfb2-examples/Config.in
 create mode 100644 package/directfb2-examples/directfb2-examples.mk
 create mode 100644 package/directfb2-lite/Config.in
 create mode 100644 package/directfb2-lite/directfb2-lite.mk
 create mode 100644 package/directfb2-media/Config.in
 create mode 100644 package/directfb2-media/directfb2-media.mk
 create mode 100644 package/directfb2-tools/Config.in
 create mode 100644 package/directfb2-tools/directfb2-tools.mk
 create mode 100644 package/directfb2/Config.in
 create mode 100644 package/directfb2/directfb2.mk

diff --git a/package/Config.in b/package/Config.in
index 550fdc1f41..d9b96201ff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -346,6 +346,7 @@ comment "Graphic libraries"
        source "package/cegui/Config.in"
        source "package/directfb/Config.in"
        source "package/directfb-examples/Config.in"
+       source "package/directfb2/Config.in"
        source "package/efl/Config.in"
        source "package/fb-test-app/Config.in"
        source "package/fbdump/Config.in"
diff --git a/package/dfbterm/Config.in b/package/dfbterm/Config.in
new file mode 100644
index 0000000000..4258a857b9
--- /dev/null
+++ b/package/dfbterm/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_DFBTERM
+       bool "DFBTerm"
+       depends on BR2_PACKAGE_DIRECTFB2
+       select BR2_PACKAGE_DIRECTFB2_LITE
+       help
+         DFBTerm is a terminal emulator runnning on DirectFB2 and
+         based on libzvt.
+
+         libzvt (Zed's virtual terminal emulation library) is
+         included directly in the source code, although it is
+         possible to use the system's libzvt library.
diff --git a/package/dfbterm/dfbterm.mk b/package/dfbterm/dfbterm.mk
new file mode 100644
index 0000000000..8f53883dfc
--- /dev/null
+++ b/package/dfbterm/dfbterm.mk
@@ -0,0 +1,14 @@
+##########################################################################=
######
+#
+# dfbterm
+#
+##########################################################################=
######
+
+DFBTERM_VERSION =3D 0e78750b5e58655d521da54540dc0a9bdca2f840
+DFBTERM_SITE =3D "https://github.com/directfb2/DFBTerm"
+DFBTERM_SITE_METHOD =3D git
+DFBTERM_LICENSE =3D GPL-2.0
+DFBTERM_LICENSE_FILES =3D COPYING
+DFBTERM_DEPENDENCIES =3D directfb2 directfb2-lite
+
+$(eval $(meson-package))
diff --git a/package/directfb2-csource/Config.in
b/package/directfb2-csource/Config.in
new file mode 100644
index 0000000000..0419bcb839
--- /dev/null
+++ b/package/directfb2-csource/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_DIRECTFB2_CSOURCE
+       bool "directfb2-csource"
+       depends on BR2_PACKAGE_DIRECTFB2
+       help
+         directfb2-csource is a data header file generation utility for
+         DirectFB2 code.
diff --git a/package/directfb2-csource/directfb2-csource.mk
b/package/directfb2-csource/directfb2-csource.mk
new file mode 100644
index 0000000000..231c848442
--- /dev/null
+++ b/package/directfb2-csource/directfb2-csource.mk
@@ -0,0 +1,15 @@
+##########################################################################=
######
+#
+# directfb2-csource
+#
+##########################################################################=
######
+
+DIRECTFB2_CSOURCE_VERSION =3D 2758dee7937e8850d6c8105bd6ef1db06c86064f
+DIRECTFB2_CSOURCE_SITE =3D "https://github.com/directfb2/directfb-csource"
+DIRECTFB2_CSOURCE_SITE_METHOD =3D git
+DIRECTFB2_CSOURCE_LICENSE =3D GPL-2.0
+DIRECTFB2_CSOURCE_LICENSE_FILES =3D COPYING
+DIRECTFB2_CSOURCE_DEPENDENCIES =3D directfb2
+DIRECTFB2_CSOURCE_INSTALL_STAGING =3D YES
+
+$(eval $(meson-package))
diff --git a/package/directfb2-examples/Config.in
b/package/directfb2-examples/Config.in
new file mode 100644
index 0000000000..05f34ee002
--- /dev/null
+++ b/package/directfb2-examples/Config.in
@@ -0,0 +1,104 @@
+menuconfig BR2_PACKAGE_DIRECTFB2_EXAMPLES
+       bool "DirectFB2 examples"
+       depends on BR2_PACKAGE_DIRECTFB2
+       select BR2_PACKAGE_DIRECTFB2_CSOURCE
+       help
+         The DirectFB2-examples package contains a set of simple
+         DirectFB2 applications that can be used to test and
+         demonstrate various DirectFB2 features. Note that DirectFB2
+         is a fork of DirectFB, as the original DirectFB stopped
+         being maintained in 2016.
+
+         The official DirectFB2 website can be visited via
+         https://directfb2.github.io/
+
+if BR2_PACKAGE_DIRECTFB2_EXAMPLES
+
+choice
+       prompt "DirectFBGL interface version"
+       default BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_VERSION_NULL
+
+config BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_VERSION_NULL
+       bool "-"
+comment "Build without version flag specified"
+
+config BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_VERSION_1
+       bool "1"
+comment "Pass -Ddirectfbgl=3D1 to the Meson build system"
+
+config BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_VERSION_2
+       bool "2"
+comment "Pass -Ddirectfbgl=3D2 to the Meson build system"
+
+endchoice
+
+config BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL
+       string "PATH to OpenGL header"
+       default ""
+
+config BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_CFLAGS
+       string "CFLAGS of the OpenGL implementation"
+       default ""
+
+config BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_LDFLAGS
+       string "LDFLAGS of the OpenGL implementation"
+       default ""
+
+# Disabled for now as directfb2-csource currently does not generate
+# pkgconfig file
+#
+# choice
+#      prompt "Select font header for DirectFB2 examples"
+#      default BR2_PACKAGE_DIRECTFB2_EXAMPLES_FONT_HEADER_DISABLED
+#
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_FONT_HEADER_DISABLED
+#      bool "disabled"
+#
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_FONT_HEADER_DGIFF
+#      bool "dgiff"
+#
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_FONT_HEADER_ttf
+#      bool "ttf"
+#
+#endchoice
+
+# Disabled for now as directfb2-csource currently does not generate
+# pkgconfig file
+#
+# choice
+#      prompt "Select image header for DirectFB2 examples"
+#      default BR2_PACKAGE_DIRECTFB2_EXAMPLES_DISABLED
+#
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_DISABLED
+#      bool "disabled"
+#
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_DFIFF
+#      bool "dfiff"
+#
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_PNG
+#      bool "png"
+#
+# endchoice
+
+# Disabled for now as directfb2-csource currently does not generate
+# pkgconfig file
+#
+# choice
+#      prompt "Select video header for DirectFB2 examples"
+#      default BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_DISABLED
+#
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_DISABLED
+#      bool "disabled"
+#
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_DFVFF
+#      bool "dfvff"
+#
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_M2V
+#      bool "m2v"
+#
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_264
+#      bool "264"
+#
+# endchoice
+
+endif # BR2_PACKAGE_DIRECTFB2_EXAMPLES
diff --git a/package/directfb2-examples/directfb2-examples.mk
b/package/directfb2-examples/directfb2-examples.mk
new file mode 100644
index 0000000000..b627ba6906
--- /dev/null
+++ b/package/directfb2-examples/directfb2-examples.mk
@@ -0,0 +1,61 @@
+##########################################################################=
######
+#
+# directfb2-examples
+#
+##########################################################################=
######
+
+DIRECTFB2_EXAMPLES_VERSION =3D d627550430407ce6f1e42a861985ec42c0f4ac19
+DIRECTFB2_EXAMPLES_SITE =3D "https://github.com/directfb2/DirectFB-example=
s"
+DIRECTFB2_EXAMPLES_SITE_METHOD =3D git
+DIRECTFB2_EXAMPLES_LICENSE =3D MIT
+DIRECTFB2_EXAMPLES_LICENSE_FILES =3D COPYING
+DIRECTFB2_EXAMPLES_DEPENDENCIES =3D directfb2 directfb2-csource
+
+ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_VERSION_1),y)
+DIRECTFB2_EXAMPLES_CONF_OPTS +=3D -Ddirectfbgl=3D1
+else ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_VERSION_2),y)
+DIRECTFB2_EXAMPLES_CONF_OPTS +=3D -Ddirectfbgl=3D2
+endif
+
+ifneq ($(call qstrip, $(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL)),)
+DIRECTFB2_EXAMPLES_CONF_OPTS +=3D -Dgl=3D$(BR2_PACKAGE_DIRECTFB2_EXAMPLES_=
GL)
+endif
+
+ifneq ($(call qstrip, $(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_CFLAGS)),)
+DIRECTFB2_EXAMPLES_CONF_OPTS +=3D
-Dgl-cflags=3D$(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_CFLAGS)
+endif
+
+ifneq ($(call qstrip, $(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_LDFLAGS)),)
+DIRECTFB2_EXAMPLES_CONF_OPTS +=3D
-Dgl-ldflags=3D$(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_LDFLAGS)
+endif
+
+# Disabled for now as directfb2-csource currently does not generate
+# pkgconfig file
+#
+# ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_FONT_HEADER_DGIFF),y)
+# DIRECTFB2_EXAMPLES_CONF_OPTS +=3D -Dfont-headers=3Ddgiff
+# else ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_FONT_HEADER_ttf),y)
+# DIRECTFB2_EXAMPLES_CONF_OPTS +=3D -Dfont-headers=3Dttf
+# endif
+
+# Disabled for now as directfb2-csource currently does not generate
+# pkgconfig file
+#
+# ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_DFIFF),y)
+# DIRECTFB2_EXAMPLES_CONF_OPTS +=3D -Dimage-headers=3Ddfiff
+# else ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_PNG),y)
+# DIRECTFB2_EXAMPLES_CONF_OPTS +=3D -Dimage-headers=3Dpng
+# endif
+
+# Disabled for now as directfb2-csource currently does not generate
+# pkgconfig file
+#
+# ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_DFVFF),y)
+# DIRECTFB2_EXAMPLES_CONF_OPTS +=3D -Dvideo-headers=3Ddfvff
+# else ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_M2V),y)
+# DIRECTFB2_EXAMPLES_CONF_OPTS +=3D -Dvideo-headers=3Dm2v
+# else ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_264),y)
+# DIRECTFB2_EXAMPLES_CONF_OPTS +=3D -Dvideo-headers=3D264
+# endif
+
+$(eval $(meson-package))
diff --git a/package/directfb2-lite/Config.in
b/package/directfb2-lite/Config.in
new file mode 100644
index 0000000000..d76a2896e1
--- /dev/null
+++ b/package/directfb2-lite/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_DIRECTFB2_LITE
+       bool "directfb2-lite"
+       depends on BR2_PACKAGE_DIRECTFB2
+       help
+         LiTE stands for Lightweight Toolkit Enabler and is a simple
+         user interface library on top of DirectFB2. Widgets can be
+         used with a default theme, or with its own custom theme.
diff --git a/package/directfb2-lite/directfb2-lite.mk
b/package/directfb2-lite/directfb2-lite.mk
new file mode 100644
index 0000000000..56cb099e98
--- /dev/null
+++ b/package/directfb2-lite/directfb2-lite.mk
@@ -0,0 +1,15 @@
+##########################################################################=
######
+#
+# directfb2-lite
+#
+##########################################################################=
######
+
+DIRECTFB2_LITE_VERSION =3D 164bb5eca507c3cee1be2adf3798745f305495d7
+DIRECTFB2_LITE_SITE =3D "https://github.com/directfb2/LiTE"
+DIRECTFB2_LITE_SITE_METHOD =3D git
+DIRECTFB2_LITE_LICENSE =3D LGPL-2.1
+DIRECTFB2_LITE_LICENSE_FILES =3D COPYING
+DIRECTFB2_LITE_DEPENDENCIES =3D directfb2
+DIRECTFB2_LITE_INSTALL_STAGING =3D YES
+
+$(eval $(meson-package))
diff --git a/package/directfb2-media/Config.in
b/package/directfb2-media/Config.in
new file mode 100644
index 0000000000..1a0e09d077
--- /dev/null
+++ b/package/directfb2-media/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_DIRECTFB2_MEDIA
+       bool "directfb2-media"
+       depends on BR2_PACKAGE_DIRECTFB2
+       help
+         DirectFB2-media contains additional font/image/music/video
+         providers for DirectFB2.
diff --git a/package/directfb2-media/directfb2-media.mk
b/package/directfb2-media/directfb2-media.mk
new file mode 100644
index 0000000000..50efa168d9
--- /dev/null
+++ b/package/directfb2-media/directfb2-media.mk
@@ -0,0 +1,15 @@
+##########################################################################=
######
+#
+# directfb2-media
+#
+##########################################################################=
######
+
+DIRECTFB2_MEDIA_VERSION =3D 8f8cb02a3d67a3eb9726ca2927061e2697b7f2de
+DIRECTFB2_MEDIA_SITE =3D "https://github.com/directfb2/DirectFB2-media"
+DIRECTFB2_MEDIA_SITE_METHOD =3D git
+DIRECTFB2_MEDIA_LICENSE =3D LGPL-2.1
+DIRECTFB2_MEDIA_LICENSE_FILES =3D COPYING
+DIRECTFB2_MEDIA_DEPENDENCIES =3D directfb2
+DIRECTFB2_MEDIA_INSTALL_STAGING =3D YES
+
+$(eval $(meson-package))
diff --git a/package/directfb2-tools/Config.in
b/package/directfb2-tools/Config.in
new file mode 100644
index 0000000000..f4d16596bc
--- /dev/null
+++ b/package/directfb2-tools/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_DIRECTFB2_TOOLS
+       bool "directfb2-tools"
+       depends on BR2_PACKAGE_DIRECTFB2
+       help
+         DirectFB2-tools contains various DirectFB2 utilities.
diff --git a/package/directfb2-tools/directfb2-tools.mk
b/package/directfb2-tools/directfb2-tools.mk
new file mode 100644
index 0000000000..7930159f2b
--- /dev/null
+++ b/package/directfb2-tools/directfb2-tools.mk
@@ -0,0 +1,14 @@
+##########################################################################=
######
+#
+# directfb2-tools
+#
+##########################################################################=
######
+
+DIRECTFB2_TOOLS_VERSION =3D 679838c281cbe7849011f7f6db1c815167c44fee
+DIRECTFB2_TOOLS_SITE =3D "https://github.com/directfb2/DirectFB2-tools"
+DIRECTFB2_TOOLS_SITE_METHOD =3D git
+DIRECTFB2_TOOLS_LICENSE =3D GPL-2.0
+DIRECTFB2_TOOLS_LICENSE_FILES =3D COPYING
+DIRECTFB2_TOOLS_DEPENDENCIES =3D directfb2
+
+$(eval $(meson-package))
diff --git a/package/directfb2/Config.in b/package/directfb2/Config.in
new file mode 100644
index 0000000000..6ef6e69a07
--- /dev/null
+++ b/package/directfb2/Config.in
@@ -0,0 +1,70 @@
+menuconfig BR2_PACKAGE_DIRECTFB2
+       bool "DirectFB2"
+       default n
+       help
+         DirectFB2 is a fork of DirectFB (Direct Frame Buffer) whose
+         purpose is to preserve and maintain the DirectFB graphics
+         backend, particularly for use on embedded systems.
+
+         The official DirectFB2 website can be visited via
+         https://directfb2.github.io/
+
+if BR2_PACKAGE_DIRECTFB2
+
+menu "DirectFB2 Options"
+
+config BR2_PACKAGE_DIRECTFB2_DRMKMS
+       bool "Enable Linux DRM/KMS support"
+
+config BR2_PACKAGE_DIRECTFB2_FBDEV
+       bool "Enable Linux Framebuffer support"
+
+config BR2_PACKAGE_DIRECTFB2_LINUX_INPUT
+       bool "Enable Linux input support"
+
+if BR2_X86_CPU_HAS_MMX
+config BR2_PACKAGE_DIRECTFB2_MMX
+       bool "Enable MMX assembly support"
+       default y
+endif #        BR2_X86_CPU_HAS_MMX
+
+config BR2_PACKAGE_DIRECTFB2_MULTI
+       bool "Enable multi application support"
+
+config BR2_PACKAGE_DIRECTFB2_MULTI_KERNEL
+       bool "Enable Linux fusion device support for multi application"
+       select BR2_PACKAGE_DIRECTFB2_MULTI
+
+# if BR2_ARM_CPU_HAS_NEON
+# config BR2_PACKAGE_DIRECTFB2_NEON
+#      bool "Enable NEON assembly support"
+#      default y
+# endif # BR2_ARM_CPU_HAS_NEON
+#
+# DirectFB2 currently has issues enabling NEON. For more details, see:
+# https://github.com/directfb2/DirectFB2/issues/142
+
+config BR2_PACKAGE_DIRECTFB2_NETWORK
+       bool "Enable network support"
+
+config BR2_PACKAGE_DIRECTFB2_SENTINELS
+       bool "Enable surface sentinels at the end of chunks in video memory=
"
+
+config BR2_PACKAGE_DIRECTFB2_SMOOTH_SCALING
+       bool "Enable smooth scaling support"
+
+endmenu
+
+menu "DirectFB2 Applications"
+source "package/directfb2-examples/Config.in"
+source "package/dfbterm/Config.in"
+endmenu
+
+menu "DirectFB2 Utilities"
+source "package/directfb2-media/Config.in"
+source "package/directfb2-tools/Config.in"
+source "package/directfb2-csource/Config.in"
+source "package/directfb2-lite/Config.in"
+endmenu
+
+endif # BR2_PACKAGE_DIRECTFB2
diff --git a/package/directfb2/directfb2.mk b/package/directfb2/directfb2.m=
k
new file mode 100644
index 0000000000..197ff38632
--- /dev/null
+++ b/package/directfb2/directfb2.mk
@@ -0,0 +1,62 @@
+##########################################################################=
######
+#
+# directfb2
+#
+##########################################################################=
######
+
+DIRECTFB2_VERSION =3D 2952d1d16b546be09e1cbb5da5e0c718d8f5ee32
+DIRECTFB2_SITE =3D "https://github.com/directfb2/DirectFB2"
+DIRECTFB2_SITE_METHOD =3D git
+DIRECTFB2_LICENSE =3D LGPL-2.1
+DIRECTFB2_LICENSE_FILES =3D COPYING
+DIRECTFB2_INSTALL_STAGING =3D YES
+
+ifeq ($(BR2_PACKAGE_DIRECTFB2_DRMKMS),y)
+DIRECTFB2_CONF_OPTS +=3D -Ddrmkms=3Dtrue
+endif
+
+ifeq ($(BR2_PACKAGE_DIRECTFB2_FBDEV),y)
+DIRECTFB2_CONF_OPTS +=3D -Dfbdev=3Dtrue
+endif
+
+ifeq ($(BR2_PACKAGE_DIRECTFB2_LINUX_INPUT),y)
+DIRECTFB2_CONF_OPTS +=3D -Dlinux_input=3Dtrue
+endif
+
+ifeq ($(BR2_PACKAGE_DIRECTFB2_MMX),y)
+DIRECTFB2_CONF_OPTS +=3D -Dmmx=3Dtrue
+else ifeq ($(BR2_PACKAGE_DIRECTFB2_MMX),n)
+DIRECTFB2_CONF_OPTS +=3D -Dmmx=3Dfalse
+endif
+
+ifeq ($(BR2_PACKAGE_DIRECTFB2_MULTI),y)
+DIRECTFB2_CONF_OPTS +=3D -Dmulti=3Dtrue
+endif
+
+ifeq ($(BR2_PACKAGE_DIRECTFB2_MULTI_KERNEL),y)
+DIRECTFB2_CONF_OPTS +=3D -Dmulti-kernel=3Dtrue
+endif
+
+# ifeq ($(BR2_PACKAGE_DIRECTFB2_NEON),y)
+# DIRECTFB2_CONF_OPTS +=3D -Dneon=3Dtrue
+# else ifeq ($(BR2_PACKAGE_DIRECTFB2_NEON),y)
+# DIRECTFB2_CONF_OPTS +=3D -Dneon=3Dfalse
+# endif
+#
+# DirectFB2 currently has issues enabling NEON. For more details, see:
+# https://github.com/directfb2/DirectFB2/issues/142
+DIRECTFB2_CONF_OPTS +=3D -Dneon=3Dfalse
+
+ifeq ($(BR2_PACKAGE_DIRECTFB2_NETWORK),y)
+DIRECTFB2_CONF_OPTS +=3D -Dnetwork=3Dtrue
+endif
+
+ifeq ($(BR2_PACKAGE_DIRECTFB2_SENTINELS),y)
+DIRECTFB2_CONF_OPTS +=3D -Dsentinels=3Dtrue
+endif
+
+ifeq ($(BR2_PACKAGE_DIRECTFB2_SMOOTH_SCALING),y)
+DIRECTFB2_CONF_OPTS +=3D -Dsmooth-scaling=3Dtrue
+endif
+
+$(eval $(meson-package))
--=20
2.34.1

--000000000000b4630c061f0f3096
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Thomas Petazzoni,<div><br></div><div>I submitted a=
 change regarding the inclusion of DirectFB2 into Buildroot on July 5th, bu=
t I haven&#39;t received a response yet.<br></div><div>Could you please pro=
vide any advice for my submission?<br></div><div><br></div><div>Patchwork l=
ink :=C2=A0<a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/=
20240705132544.351613-1-shengwen1997.tw@gmail.com/">https://patchwork.ozlab=
s.org/project/buildroot/patch/20240705132544.351613-1-shengwen1997.tw@gmail=
.com/</a></div><div><br></div><div>Thanks,</div><div><br></div><div>Colin C=
heng</div><div><br></div><div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">---------- Forwarded message ---------<br>From: <strong=
 class=3D"gmail_sendername" dir=3D"auto">Shengwen Cheng</strong> <span dir=
=3D"auto">&lt;<a href=3D"mailto:shengwen1997.tw@gmail.com">shengwen1997.tw@=
gmail.com</a>&gt;</span><br>Date: Fri, Jul 5, 2024 at 9:26=E2=80=AFPM<br>Su=
bject: [PATCH 1/1] package/directfb2: add directfb2 packages<br>To:  &lt;<a=
 href=3D"mailto:buildroot@buildroot.org">buildroot@buildroot.org</a>&gt;<br=
>Cc: Eric Le Bihan &lt;<a href=3D"mailto:eric.le.bihan.dev@free.fr">eric.le=
.bihan.dev@free.fr</a>&gt;, Jim Huang &lt;<a href=3D"mailto:jserv@ccns.ncku=
.edu.tw">jserv@ccns.ncku.edu.tw</a>&gt;, Shengwen Cheng &lt;<a href=3D"mail=
to:shengwen1997.tw@gmail.com">shengwen1997.tw@gmail.com</a>&gt;<br></div><b=
r><br>This introduces DirectFB2, a fork of DirectFB to the Buildroot. The o=
riginal<br>
DirectFB has not been maintained since 2016. Meanwhile, in 2022, DirectFB2 =
was<br>
announced at FOSDEM in Brussels, with the goal of maintaining DirectFB for =
use<br>
on embedded systems.<br>
<br>
New packages:<br>
1. directfb2<br>
2. directfb2-csource<br>
3. directfb2-lite<br>
4. directfb2-media<br>
5. directfb2-tools<br>
6. directfb2-examples<br>
7. dfbterm<br>
<br>
[1] <a href=3D"https://archive.fosdem.org/2022/schedule/event/directfb/atta=
chments/slides/5077/export/events/attachments/directfb/slides/5077/fosdem_2=
022_directfb2.pdf" rel=3D"noreferrer" target=3D"_blank">https://archive.fos=
dem.org/2022/schedule/event/directfb/attachments/slides/<br>
5077/export/events/attachments/directfb/slides/5077/fosdem_2022_directfb2.p=
df</a><br>
<br>
Signed-off-by: Shengwen Cheng &lt;<a href=3D"mailto:shengwen1997.tw@gmail.c=
om" target=3D"_blank">shengwen1997.tw@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0package/dfbterm/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 ++<br>
=C2=A0package/dfbterm/<a href=3D"http://dfbterm.mk" rel=3D"noreferrer" targ=
et=3D"_blank">dfbterm.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 14 +++<br>
=C2=A0package/directfb2-csource/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A06 +<br>
=C2=A0.../directfb2-csource/<a href=3D"http://directfb2-csource.mk" rel=3D"=
noreferrer" target=3D"_blank">directfb2-csource.mk</a>=C2=A0 =C2=A0 |=C2=A0=
 15 +++<br>
=C2=A0package/directfb2-examples/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 104 ++++++++++++++++++<br>
=C2=A0.../directfb2-examples/<a href=3D"http://directfb2-examples.mk" rel=
=3D"noreferrer" target=3D"_blank">directfb2-examples.mk</a>=C2=A0 |=C2=A0 6=
1 ++++++++++<br>
=C2=A0package/directfb2-lite/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A07 ++<br>
=C2=A0package/directfb2-lite/<a href=3D"http://directfb2-lite.mk" rel=3D"no=
referrer" target=3D"_blank">directfb2-lite.mk</a>=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 15 +++<br>
=C2=A0package/directfb2-media/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A06 +<br>
=C2=A0package/directfb2-media/<a href=3D"http://directfb2-media.mk" rel=3D"=
noreferrer" target=3D"_blank">directfb2-media.mk</a>=C2=A0 =C2=A0 |=C2=A0 1=
5 +++<br>
=C2=A0package/directfb2-tools/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
=C2=A0package/directfb2-tools/<a href=3D"http://directfb2-tools.mk" rel=3D"=
noreferrer" target=3D"_blank">directfb2-tools.mk</a>=C2=A0 =C2=A0 |=C2=A0 1=
4 +++<br>
=C2=A0package/directfb2/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 70 ++++++++++++<br>
=C2=A0package/directfb2/<a href=3D"http://directfb2.mk" rel=3D"noreferrer" =
target=3D"_blank">directfb2.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 62 +++++++++++<br>
=C2=A015 files changed, 406 insertions(+)<br>
=C2=A0create mode 100644 package/dfbterm/Config.in<br>
=C2=A0create mode 100644 package/dfbterm/<a href=3D"http://dfbterm.mk" rel=
=3D"noreferrer" target=3D"_blank">dfbterm.mk</a><br>
=C2=A0create mode 100644 package/directfb2-csource/Config.in<br>
=C2=A0create mode 100644 package/directfb2-csource/<a href=3D"http://direct=
fb2-csource.mk" rel=3D"noreferrer" target=3D"_blank">directfb2-csource.mk</=
a><br>
=C2=A0create mode 100644 package/directfb2-examples/Config.in<br>
=C2=A0create mode 100644 package/directfb2-examples/<a href=3D"http://direc=
tfb2-examples.mk" rel=3D"noreferrer" target=3D"_blank">directfb2-examples.m=
k</a><br>
=C2=A0create mode 100644 package/directfb2-lite/Config.in<br>
=C2=A0create mode 100644 package/directfb2-lite/<a href=3D"http://directfb2=
-lite.mk" rel=3D"noreferrer" target=3D"_blank">directfb2-lite.mk</a><br>
=C2=A0create mode 100644 package/directfb2-media/Config.in<br>
=C2=A0create mode 100644 package/directfb2-media/<a href=3D"http://directfb=
2-media.mk" rel=3D"noreferrer" target=3D"_blank">directfb2-media.mk</a><br>
=C2=A0create mode 100644 package/directfb2-tools/Config.in<br>
=C2=A0create mode 100644 package/directfb2-tools/<a href=3D"http://directfb=
2-tools.mk" rel=3D"noreferrer" target=3D"_blank">directfb2-tools.mk</a><br>
=C2=A0create mode 100644 package/directfb2/Config.in<br>
=C2=A0create mode 100644 package/directfb2/<a href=3D"http://directfb2.mk" =
rel=3D"noreferrer" target=3D"_blank">directfb2.mk</a><br>
<br>
diff --git a/package/Config.in b/package/Config.in<br>
index 550fdc1f41..d9b96201ff 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -346,6 +346,7 @@ comment &quot;Graphic libraries&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/cegui/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/directfb/Config.in&quot;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/directfb-examples/Config.i=
n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/directfb2/Config.in&quot;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/efl/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/fb-test-app/Config.in&quot=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/fbdump/Config.in&quot;<br>
diff --git a/package/dfbterm/Config.in b/package/dfbterm/Config.in<br>
new file mode 100644<br>
index 0000000000..4258a857b9<br>
--- /dev/null<br>
+++ b/package/dfbterm/Config.in<br>
@@ -0,0 +1,11 @@<br>
+config BR2_PACKAGE_DFBTERM<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;DFBTerm&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_DIRECTFB2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_DIRECTFB2_LITE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DFBTerm is a terminal emulator runnning =
on DirectFB2 and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0based on libzvt.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libzvt (Zed&#39;s virtual terminal emula=
tion library) is<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0included directly in the source code, al=
though it is<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0possible to use the system&#39;s libzvt =
library.<br>
diff --git a/package/dfbterm/<a href=3D"http://dfbterm.mk" rel=3D"noreferre=
r" target=3D"_blank">dfbterm.mk</a> b/package/dfbterm/<a href=3D"http://dfb=
term.mk" rel=3D"noreferrer" target=3D"_blank">dfbterm.mk</a><br>
new file mode 100644<br>
index 0000000000..8f53883dfc<br>
--- /dev/null<br>
+++ b/package/dfbterm/<a href=3D"http://dfbterm.mk" rel=3D"noreferrer" targ=
et=3D"_blank">dfbterm.mk</a><br>
@@ -0,0 +1,14 @@<br>
+##########################################################################=
######<br>
+#<br>
+# dfbterm<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+DFBTERM_VERSION =3D 0e78750b5e58655d521da54540dc0a9bdca2f840<br>
+DFBTERM_SITE =3D &quot;<a href=3D"https://github.com/directfb2/DFBTerm" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/directfb2/DFBTerm</a>=
&quot;<br>
+DFBTERM_SITE_METHOD =3D git<br>
+DFBTERM_LICENSE =3D GPL-2.0<br>
+DFBTERM_LICENSE_FILES =3D COPYING<br>
+DFBTERM_DEPENDENCIES =3D directfb2 directfb2-lite<br>
+<br>
+$(eval $(meson-package))<br>
diff --git a/package/directfb2-csource/Config.in b/package/directfb2-csourc=
e/Config.in<br>
new file mode 100644<br>
index 0000000000..0419bcb839<br>
--- /dev/null<br>
+++ b/package/directfb2-csource/Config.in<br>
@@ -0,0 +1,6 @@<br>
+config BR2_PACKAGE_DIRECTFB2_CSOURCE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;directfb2-csource&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_DIRECTFB2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0directfb2-csource is a data header file =
generation utility for<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DirectFB2 code.<br>
diff --git a/package/directfb2-csource/<a href=3D"http://directfb2-csource.=
mk" rel=3D"noreferrer" target=3D"_blank">directfb2-csource.mk</a> b/package=
/directfb2-csource/<a href=3D"http://directfb2-csource.mk" rel=3D"noreferre=
r" target=3D"_blank">directfb2-csource.mk</a><br>
new file mode 100644<br>
index 0000000000..231c848442<br>
--- /dev/null<br>
+++ b/package/directfb2-csource/<a href=3D"http://directfb2-csource.mk" rel=
=3D"noreferrer" target=3D"_blank">directfb2-csource.mk</a><br>
@@ -0,0 +1,15 @@<br>
+##########################################################################=
######<br>
+#<br>
+# directfb2-csource<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+DIRECTFB2_CSOURCE_VERSION =3D 2758dee7937e8850d6c8105bd6ef1db06c86064f<br>
+DIRECTFB2_CSOURCE_SITE =3D &quot;<a href=3D"https://github.com/directfb2/d=
irectfb-csource" rel=3D"noreferrer" target=3D"_blank">https://github.com/di=
rectfb2/directfb-csource</a>&quot;<br>
+DIRECTFB2_CSOURCE_SITE_METHOD =3D git<br>
+DIRECTFB2_CSOURCE_LICENSE =3D GPL-2.0<br>
+DIRECTFB2_CSOURCE_LICENSE_FILES =3D COPYING<br>
+DIRECTFB2_CSOURCE_DEPENDENCIES =3D directfb2<br>
+DIRECTFB2_CSOURCE_INSTALL_STAGING =3D YES<br>
+<br>
+$(eval $(meson-package))<br>
diff --git a/package/directfb2-examples/Config.in b/package/directfb2-examp=
les/Config.in<br>
new file mode 100644<br>
index 0000000000..05f34ee002<br>
--- /dev/null<br>
+++ b/package/directfb2-examples/Config.in<br>
@@ -0,0 +1,104 @@<br>
+menuconfig BR2_PACKAGE_DIRECTFB2_EXAMPLES<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;DirectFB2 examples&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_DIRECTFB2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_DIRECTFB2_CSOURCE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The DirectFB2-examples package contains =
a set of simple<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DirectFB2 applications that can be used =
to test and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0demonstrate various DirectFB2 features. =
Note that DirectFB2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0is a fork of DirectFB, as the original D=
irectFB stopped<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0being maintained in 2016.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The official DirectFB2 website can be vi=
sited via<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://directfb2.github.io/"=
 rel=3D"noreferrer" target=3D"_blank">https://directfb2.github.io/</a><br>
+<br>
+if BR2_PACKAGE_DIRECTFB2_EXAMPLES<br>
+<br>
+choice<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0prompt &quot;DirectFBGL interface version&quot;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_VERSI=
ON_NULL<br>
+<br>
+config BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_VERSION_NULL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;-&quot;<br>
+comment &quot;Build without version flag specified&quot;<br>
+<br>
+config BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_VERSION_1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;1&quot;<br>
+comment &quot;Pass -Ddirectfbgl=3D1 to the Meson build system&quot;<br>
+<br>
+config BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_VERSION_2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;2&quot;<br>
+comment &quot;Pass -Ddirectfbgl=3D2 to the Meson build system&quot;<br>
+<br>
+endchoice<br>
+<br>
+config BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0string &quot;PATH to OpenGL header&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default &quot;&quot;<br>
+<br>
+config BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_CFLAGS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0string &quot;CFLAGS of the OpenGL implementatio=
n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default &quot;&quot;<br>
+<br>
+config BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_LDFLAGS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0string &quot;LDFLAGS of the OpenGL implementati=
on&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default &quot;&quot;<br>
+<br>
+# Disabled for now as directfb2-csource currently does not generate<br>
+# pkgconfig file<br>
+#<br>
+# choice<br>
+#=C2=A0 =C2=A0 =C2=A0 prompt &quot;Select font header for DirectFB2 exampl=
es&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0 default BR2_PACKAGE_DIRECTFB2_EXAMPLES_FONT_HEADER_D=
ISABLED<br>
+#<br>
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_FONT_HEADER_DISABLED<br>
+#=C2=A0 =C2=A0 =C2=A0 bool &quot;disabled&quot;<br>
+#<br>
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_FONT_HEADER_DGIFF<br>
+#=C2=A0 =C2=A0 =C2=A0 bool &quot;dgiff&quot;<br>
+#<br>
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_FONT_HEADER_ttf<br>
+#=C2=A0 =C2=A0 =C2=A0 bool &quot;ttf&quot;<br>
+#<br>
+#endchoice<br>
+<br>
+# Disabled for now as directfb2-csource currently does not generate<br>
+# pkgconfig file<br>
+#<br>
+# choice<br>
+#=C2=A0 =C2=A0 =C2=A0 prompt &quot;Select image header for DirectFB2 examp=
les&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0 default BR2_PACKAGE_DIRECTFB2_EXAMPLES_DISABLED<br>
+#<br>
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_DISABLED<br>
+#=C2=A0 =C2=A0 =C2=A0 bool &quot;disabled&quot;<br>
+#<br>
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_DFIFF<br>
+#=C2=A0 =C2=A0 =C2=A0 bool &quot;dfiff&quot;<br>
+#<br>
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_PNG<br>
+#=C2=A0 =C2=A0 =C2=A0 bool &quot;png&quot;<br>
+#<br>
+# endchoice<br>
+<br>
+# Disabled for now as directfb2-csource currently does not generate<br>
+# pkgconfig file<br>
+#<br>
+# choice<br>
+#=C2=A0 =C2=A0 =C2=A0 prompt &quot;Select video header for DirectFB2 examp=
les&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0 default BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS=
_DISABLED<br>
+#<br>
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_DISABLED<br>
+#=C2=A0 =C2=A0 =C2=A0 bool &quot;disabled&quot;<br>
+#<br>
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_DFVFF<br>
+#=C2=A0 =C2=A0 =C2=A0 bool &quot;dfvff&quot;<br>
+#<br>
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_M2V<br>
+#=C2=A0 =C2=A0 =C2=A0 bool &quot;m2v&quot;<br>
+#<br>
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_264<br>
+#=C2=A0 =C2=A0 =C2=A0 bool &quot;264&quot;<br>
+#<br>
+# endchoice<br>
+<br>
+endif # BR2_PACKAGE_DIRECTFB2_EXAMPLES<br>
diff --git a/package/directfb2-examples/<a href=3D"http://directfb2-example=
s.mk" rel=3D"noreferrer" target=3D"_blank">directfb2-examples.mk</a> b/pack=
age/directfb2-examples/<a href=3D"http://directfb2-examples.mk" rel=3D"nore=
ferrer" target=3D"_blank">directfb2-examples.mk</a><br>
new file mode 100644<br>
index 0000000000..b627ba6906<br>
--- /dev/null<br>
+++ b/package/directfb2-examples/<a href=3D"http://directfb2-examples.mk" r=
el=3D"noreferrer" target=3D"_blank">directfb2-examples.mk</a><br>
@@ -0,0 +1,61 @@<br>
+##########################################################################=
######<br>
+#<br>
+# directfb2-examples<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+DIRECTFB2_EXAMPLES_VERSION =3D d627550430407ce6f1e42a861985ec42c0f4ac19<br=
>
+DIRECTFB2_EXAMPLES_SITE =3D &quot;<a href=3D"https://github.com/directfb2/=
DirectFB-examples" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
directfb2/DirectFB-examples</a>&quot;<br>
+DIRECTFB2_EXAMPLES_SITE_METHOD =3D git<br>
+DIRECTFB2_EXAMPLES_LICENSE =3D MIT<br>
+DIRECTFB2_EXAMPLES_LICENSE_FILES =3D COPYING<br>
+DIRECTFB2_EXAMPLES_DEPENDENCIES =3D directfb2 directfb2-csource<br>
+<br>
+ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_VERSION_1),y)<br>
+DIRECTFB2_EXAMPLES_CONF_OPTS +=3D -Ddirectfbgl=3D1<br>
+else ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_VERSION_2),y)<br>
+DIRECTFB2_EXAMPLES_CONF_OPTS +=3D -Ddirectfbgl=3D2<br>
+endif<br>
+<br>
+ifneq ($(call qstrip, $(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL)),)<br>
+DIRECTFB2_EXAMPLES_CONF_OPTS +=3D -Dgl=3D$(BR2_PACKAGE_DIRECTFB2_EXAMPLES_=
GL)<br>
+endif<br>
+<br>
+ifneq ($(call qstrip, $(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_CFLAGS)),)<br>
+DIRECTFB2_EXAMPLES_CONF_OPTS +=3D -Dgl-cflags=3D$(BR2_PACKAGE_DIRECTFB2_EX=
AMPLES_GL_CFLAGS)<br>
+endif<br>
+<br>
+ifneq ($(call qstrip, $(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_LDFLAGS)),)<br>
+DIRECTFB2_EXAMPLES_CONF_OPTS +=3D -Dgl-ldflags=3D$(BR2_PACKAGE_DIRECTFB2_E=
XAMPLES_GL_LDFLAGS)<br>
+endif<br>
+<br>
+# Disabled for now as directfb2-csource currently does not generate<br>
+# pkgconfig file<br>
+#<br>
+# ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_FONT_HEADER_DGIFF),y)<br>
+# DIRECTFB2_EXAMPLES_CONF_OPTS +=3D -Dfont-headers=3Ddgiff<br>
+# else ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_FONT_HEADER_ttf),y)<br>
+# DIRECTFB2_EXAMPLES_CONF_OPTS +=3D -Dfont-headers=3Dttf<br>
+# endif<br>
+<br>
+# Disabled for now as directfb2-csource currently does not generate<br>
+# pkgconfig file<br>
+#<br>
+# ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_DFIFF),y)<br>
+# DIRECTFB2_EXAMPLES_CONF_OPTS +=3D -Dimage-headers=3Ddfiff<br>
+# else ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_PNG),y)<br>
+# DIRECTFB2_EXAMPLES_CONF_OPTS +=3D -Dimage-headers=3Dpng<br>
+# endif<br>
+<br>
+# Disabled for now as directfb2-csource currently does not generate<br>
+# pkgconfig file<br>
+#<br>
+# ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_DFVFF),y)<br>
+# DIRECTFB2_EXAMPLES_CONF_OPTS +=3D -Dvideo-headers=3Ddfvff<br>
+# else ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_M2V),y)<br>
+# DIRECTFB2_EXAMPLES_CONF_OPTS +=3D -Dvideo-headers=3Dm2v<br>
+# else ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_264),y)<br>
+# DIRECTFB2_EXAMPLES_CONF_OPTS +=3D -Dvideo-headers=3D264<br>
+# endif<br>
+<br>
+$(eval $(meson-package))<br>
diff --git a/package/directfb2-lite/Config.in b/package/directfb2-lite/Conf=
ig.in<br>
new file mode 100644<br>
index 0000000000..d76a2896e1<br>
--- /dev/null<br>
+++ b/package/directfb2-lite/Config.in<br>
@@ -0,0 +1,7 @@<br>
+config BR2_PACKAGE_DIRECTFB2_LITE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;directfb2-lite&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_DIRECTFB2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LiTE stands for Lightweight Toolkit Enab=
ler and is a simple<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0user interface library on top of DirectF=
B2. Widgets can be<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0used with a default theme, or with its o=
wn custom theme.<br>
diff --git a/package/directfb2-lite/<a href=3D"http://directfb2-lite.mk" re=
l=3D"noreferrer" target=3D"_blank">directfb2-lite.mk</a> b/package/directfb=
2-lite/<a href=3D"http://directfb2-lite.mk" rel=3D"noreferrer" target=3D"_b=
lank">directfb2-lite.mk</a><br>
new file mode 100644<br>
index 0000000000..56cb099e98<br>
--- /dev/null<br>
+++ b/package/directfb2-lite/<a href=3D"http://directfb2-lite.mk" rel=3D"no=
referrer" target=3D"_blank">directfb2-lite.mk</a><br>
@@ -0,0 +1,15 @@<br>
+##########################################################################=
######<br>
+#<br>
+# directfb2-lite<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+DIRECTFB2_LITE_VERSION =3D 164bb5eca507c3cee1be2adf3798745f305495d7<br>
+DIRECTFB2_LITE_SITE =3D &quot;<a href=3D"https://github.com/directfb2/LiTE=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/directfb2/LiTE</a=
>&quot;<br>
+DIRECTFB2_LITE_SITE_METHOD =3D git<br>
+DIRECTFB2_LITE_LICENSE =3D LGPL-2.1<br>
+DIRECTFB2_LITE_LICENSE_FILES =3D COPYING<br>
+DIRECTFB2_LITE_DEPENDENCIES =3D directfb2<br>
+DIRECTFB2_LITE_INSTALL_STAGING =3D YES<br>
+<br>
+$(eval $(meson-package))<br>
diff --git a/package/directfb2-media/Config.in b/package/directfb2-media/Co=
nfig.in<br>
new file mode 100644<br>
index 0000000000..1a0e09d077<br>
--- /dev/null<br>
+++ b/package/directfb2-media/Config.in<br>
@@ -0,0 +1,6 @@<br>
+config BR2_PACKAGE_DIRECTFB2_MEDIA<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;directfb2-media&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_DIRECTFB2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DirectFB2-media contains additional font=
/image/music/video<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0providers for DirectFB2.<br>
diff --git a/package/directfb2-media/<a href=3D"http://directfb2-media.mk" =
rel=3D"noreferrer" target=3D"_blank">directfb2-media.mk</a> b/package/direc=
tfb2-media/<a href=3D"http://directfb2-media.mk" rel=3D"noreferrer" target=
=3D"_blank">directfb2-media.mk</a><br>
new file mode 100644<br>
index 0000000000..50efa168d9<br>
--- /dev/null<br>
+++ b/package/directfb2-media/<a href=3D"http://directfb2-media.mk" rel=3D"=
noreferrer" target=3D"_blank">directfb2-media.mk</a><br>
@@ -0,0 +1,15 @@<br>
+##########################################################################=
######<br>
+#<br>
+# directfb2-media<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+DIRECTFB2_MEDIA_VERSION =3D 8f8cb02a3d67a3eb9726ca2927061e2697b7f2de<br>
+DIRECTFB2_MEDIA_SITE =3D &quot;<a href=3D"https://github.com/directfb2/Dir=
ectFB2-media" rel=3D"noreferrer" target=3D"_blank">https://github.com/direc=
tfb2/DirectFB2-media</a>&quot;<br>
+DIRECTFB2_MEDIA_SITE_METHOD =3D git<br>
+DIRECTFB2_MEDIA_LICENSE =3D LGPL-2.1<br>
+DIRECTFB2_MEDIA_LICENSE_FILES =3D COPYING<br>
+DIRECTFB2_MEDIA_DEPENDENCIES =3D directfb2<br>
+DIRECTFB2_MEDIA_INSTALL_STAGING =3D YES<br>
+<br>
+$(eval $(meson-package))<br>
diff --git a/package/directfb2-tools/Config.in b/package/directfb2-tools/Co=
nfig.in<br>
new file mode 100644<br>
index 0000000000..f4d16596bc<br>
--- /dev/null<br>
+++ b/package/directfb2-tools/Config.in<br>
@@ -0,0 +1,5 @@<br>
+config BR2_PACKAGE_DIRECTFB2_TOOLS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;directfb2-tools&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_DIRECTFB2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DirectFB2-tools contains various DirectF=
B2 utilities.<br>
diff --git a/package/directfb2-tools/<a href=3D"http://directfb2-tools.mk" =
rel=3D"noreferrer" target=3D"_blank">directfb2-tools.mk</a> b/package/direc=
tfb2-tools/<a href=3D"http://directfb2-tools.mk" rel=3D"noreferrer" target=
=3D"_blank">directfb2-tools.mk</a><br>
new file mode 100644<br>
index 0000000000..7930159f2b<br>
--- /dev/null<br>
+++ b/package/directfb2-tools/<a href=3D"http://directfb2-tools.mk" rel=3D"=
noreferrer" target=3D"_blank">directfb2-tools.mk</a><br>
@@ -0,0 +1,14 @@<br>
+##########################################################################=
######<br>
+#<br>
+# directfb2-tools<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+DIRECTFB2_TOOLS_VERSION =3D 679838c281cbe7849011f7f6db1c815167c44fee<br>
+DIRECTFB2_TOOLS_SITE =3D &quot;<a href=3D"https://github.com/directfb2/Dir=
ectFB2-tools" rel=3D"noreferrer" target=3D"_blank">https://github.com/direc=
tfb2/DirectFB2-tools</a>&quot;<br>
+DIRECTFB2_TOOLS_SITE_METHOD =3D git<br>
+DIRECTFB2_TOOLS_LICENSE =3D GPL-2.0<br>
+DIRECTFB2_TOOLS_LICENSE_FILES =3D COPYING<br>
+DIRECTFB2_TOOLS_DEPENDENCIES =3D directfb2<br>
+<br>
+$(eval $(meson-package))<br>
diff --git a/package/directfb2/Config.in b/package/directfb2/Config.in<br>
new file mode 100644<br>
index 0000000000..6ef6e69a07<br>
--- /dev/null<br>
+++ b/package/directfb2/Config.in<br>
@@ -0,0 +1,70 @@<br>
+menuconfig BR2_PACKAGE_DIRECTFB2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;DirectFB2&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default n<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DirectFB2 is a fork of DirectFB (Direct =
Frame Buffer) whose<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0purpose is to preserve and maintain the =
DirectFB graphics<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0backend, particularly for use on embedde=
d systems.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The official DirectFB2 website can be vi=
sited via<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://directfb2.github.io/"=
 rel=3D"noreferrer" target=3D"_blank">https://directfb2.github.io/</a><br>
+<br>
+if BR2_PACKAGE_DIRECTFB2<br>
+<br>
+menu &quot;DirectFB2 Options&quot;<br>
+<br>
+config BR2_PACKAGE_DIRECTFB2_DRMKMS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Enable Linux DRM/KMS support&quot;<b=
r>
+<br>
+config BR2_PACKAGE_DIRECTFB2_FBDEV<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Enable Linux Framebuffer support&quo=
t;<br>
+<br>
+config BR2_PACKAGE_DIRECTFB2_LINUX_INPUT<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Enable Linux input support&quot;<br>
+<br>
+if BR2_X86_CPU_HAS_MMX<br>
+config BR2_PACKAGE_DIRECTFB2_MMX<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Enable MMX assembly support&quot;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default y<br>
+endif #=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_X86_CPU_HAS_MMX<br>
+<br>
+config BR2_PACKAGE_DIRECTFB2_MULTI<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Enable multi application support&quo=
t;<br>
+<br>
+config BR2_PACKAGE_DIRECTFB2_MULTI_KERNEL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Enable Linux fusion device support f=
or multi application&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_DIRECTFB2_MULTI<br>
+<br>
+# if BR2_ARM_CPU_HAS_NEON<br>
+# config BR2_PACKAGE_DIRECTFB2_NEON<br>
+#=C2=A0 =C2=A0 =C2=A0 bool &quot;Enable NEON assembly support&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0 default y<br>
+# endif # BR2_ARM_CPU_HAS_NEON<br>
+#<br>
+# DirectFB2 currently has issues enabling NEON. For more details, see:<br>
+# <a href=3D"https://github.com/directfb2/DirectFB2/issues/142" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/directfb2/DirectFB2/issues/14=
2</a><br>
+<br>
+config BR2_PACKAGE_DIRECTFB2_NETWORK<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Enable network support&quot;<br>
+<br>
+config BR2_PACKAGE_DIRECTFB2_SENTINELS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Enable surface sentinels at the end =
of chunks in video memory&quot;<br>
+<br>
+config BR2_PACKAGE_DIRECTFB2_SMOOTH_SCALING<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Enable smooth scaling support&quot;<=
br>
+<br>
+endmenu<br>
+<br>
+menu &quot;DirectFB2 Applications&quot;<br>
+source &quot;package/directfb2-examples/Config.in&quot;<br>
+source &quot;package/dfbterm/Config.in&quot;<br>
+endmenu<br>
+<br>
+menu &quot;DirectFB2 Utilities&quot;<br>
+source &quot;package/directfb2-media/Config.in&quot;<br>
+source &quot;package/directfb2-tools/Config.in&quot;<br>
+source &quot;package/directfb2-csource/Config.in&quot;<br>
+source &quot;package/directfb2-lite/Config.in&quot;<br>
+endmenu<br>
+<br>
+endif # BR2_PACKAGE_DIRECTFB2<br>
diff --git a/package/directfb2/<a href=3D"http://directfb2.mk" rel=3D"noref=
errer" target=3D"_blank">directfb2.mk</a> b/package/directfb2/<a href=3D"ht=
tp://directfb2.mk" rel=3D"noreferrer" target=3D"_blank">directfb2.mk</a><br=
>
new file mode 100644<br>
index 0000000000..197ff38632<br>
--- /dev/null<br>
+++ b/package/directfb2/<a href=3D"http://directfb2.mk" rel=3D"noreferrer" =
target=3D"_blank">directfb2.mk</a><br>
@@ -0,0 +1,62 @@<br>
+##########################################################################=
######<br>
+#<br>
+# directfb2<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+DIRECTFB2_VERSION =3D 2952d1d16b546be09e1cbb5da5e0c718d8f5ee32<br>
+DIRECTFB2_SITE =3D &quot;<a href=3D"https://github.com/directfb2/DirectFB2=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/directfb2/DirectF=
B2</a>&quot;<br>
+DIRECTFB2_SITE_METHOD =3D git<br>
+DIRECTFB2_LICENSE =3D LGPL-2.1<br>
+DIRECTFB2_LICENSE_FILES =3D COPYING<br>
+DIRECTFB2_INSTALL_STAGING =3D YES<br>
+<br>
+ifeq ($(BR2_PACKAGE_DIRECTFB2_DRMKMS),y)<br>
+DIRECTFB2_CONF_OPTS +=3D -Ddrmkms=3Dtrue<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_DIRECTFB2_FBDEV),y)<br>
+DIRECTFB2_CONF_OPTS +=3D -Dfbdev=3Dtrue<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_DIRECTFB2_LINUX_INPUT),y)<br>
+DIRECTFB2_CONF_OPTS +=3D -Dlinux_input=3Dtrue<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_DIRECTFB2_MMX),y)<br>
+DIRECTFB2_CONF_OPTS +=3D -Dmmx=3Dtrue<br>
+else ifeq ($(BR2_PACKAGE_DIRECTFB2_MMX),n)<br>
+DIRECTFB2_CONF_OPTS +=3D -Dmmx=3Dfalse<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_DIRECTFB2_MULTI),y)<br>
+DIRECTFB2_CONF_OPTS +=3D -Dmulti=3Dtrue<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_DIRECTFB2_MULTI_KERNEL),y)<br>
+DIRECTFB2_CONF_OPTS +=3D -Dmulti-kernel=3Dtrue<br>
+endif<br>
+<br>
+# ifeq ($(BR2_PACKAGE_DIRECTFB2_NEON),y)<br>
+# DIRECTFB2_CONF_OPTS +=3D -Dneon=3Dtrue<br>
+# else ifeq ($(BR2_PACKAGE_DIRECTFB2_NEON),y)<br>
+# DIRECTFB2_CONF_OPTS +=3D -Dneon=3Dfalse<br>
+# endif<br>
+#<br>
+# DirectFB2 currently has issues enabling NEON. For more details, see:<br>
+# <a href=3D"https://github.com/directfb2/DirectFB2/issues/142" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/directfb2/DirectFB2/issues/14=
2</a><br>
+DIRECTFB2_CONF_OPTS +=3D -Dneon=3Dfalse<br>
+<br>
+ifeq ($(BR2_PACKAGE_DIRECTFB2_NETWORK),y)<br>
+DIRECTFB2_CONF_OPTS +=3D -Dnetwork=3Dtrue<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_DIRECTFB2_SENTINELS),y)<br>
+DIRECTFB2_CONF_OPTS +=3D -Dsentinels=3Dtrue<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_DIRECTFB2_SMOOTH_SCALING),y)<br>
+DIRECTFB2_CONF_OPTS +=3D -Dsmooth-scaling=3Dtrue<br>
+endif<br>
+<br>
+$(eval $(meson-package))<br>
-- <br>
2.34.1<br>
<br>
</div></div></div>

--000000000000b4630c061f0f3096--

--===============8039103841260887862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8039103841260887862==--
