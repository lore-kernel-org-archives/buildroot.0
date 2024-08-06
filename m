Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B1EC52D71
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 16:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02AA540325;
	Tue,  6 Aug 2024 16:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z0YbIjmPXNpo; Tue,  6 Aug 2024 16:40:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B2F54037A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B2F54037A;
	Tue,  6 Aug 2024 16:40:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7AB5D1BF32A
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 16:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 708A640A20
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 16:40:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AL6X-i_9r1qv for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 16:40:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=eszpotanski@antmicro.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2974B40972
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2974B40972
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2974B40972
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 16:40:10 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5b01af9b0c9so963370a12.3
 for <buildroot@buildroot.org>; Tue, 06 Aug 2024 09:40:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722962409; x=1723567209;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+uyB1ylH8lvyLSB89k21hIenB+ee0leNTIm8DPidq3w=;
 b=D7/M6E8N2AHz0oe0WhDip7uNTlkCpagyPL7vfZHD97jt++q9sIoonrf6jrh1jp2gXw
 edPvaXxx9xT2E/kGBFyXnuhOkFy0LPyC4tLJSyYlCkByH58iW0ESjPNm267TZt5EuSGd
 mhrdtLTdwkspErB+mJGAPN4Oy3cb73H/7Ek9jwqkqqaZd6YmU5DvqOUjByKiFU5t/1yE
 bZ66ALcX9uHyVFKEZtmqXbbjCM6faROBJT7FLmWYMR4Ev8uziYMoi0EZDnUk2I2OTY8L
 uBe1Od68IcnJWjO48SNBhVI9+8FwoaraYGP6vhLq9rQoO1tTsbpTqZ58eZI81yxAcIqa
 XjpQ==
X-Gm-Message-State: AOJu0YxaIvMe+KpEvDwD3tTgFIwuD2u1m13FXlnE6kSFCgOEQv280jV+
 QKjW91p5tnL+gJzJUh1nahWSXT1V08yyv2C2vOQgqM63u/A3RXmnq7lXLeLUFLhMd3k+G7bvbbE
 dNPuinZk1dgVJk8qB8AHyS4aawK0j8i+HoOHHMLn6Wj4okPH3KnK0rw==
X-Google-Smtp-Source: AGHT+IF8RyWuPrwHb+BkkZAF5WDRmrmQJUkdBqKuuiqkVrQNlW4I7liaONHVBPkrGcJiNYD6CSDJsgyJXxzleIX1mXY=
X-Received: by 2002:a17:906:7315:b0:a7a:af5d:f314 with SMTP id
 a640c23a62f3a-a7dc51bd623mr1188443766b.63.1722962408754; Tue, 06 Aug 2024
 09:40:08 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 6 Aug 2024 18:39:58 +0200
Message-ID: <CAG9w5kMVs04gOeqXtsjYUPJCgcpGNFkpi6C4J7fnsJgVdCvRqw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=antmicro.com; s=google; t=1722962409; x=1723567209; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+uyB1ylH8lvyLSB89k21hIenB+ee0leNTIm8DPidq3w=;
 b=FiApyaK88luAmc8BljesXDMrMlF7xnIIoR19wWOPsgRu01hJFhSO9ESTk3ZqQUFGgU
 recpnaQZFX5kXlYjhVLsVVOS2K/lSi0LiWsVdDqTwanmZopnHbwOz8BQ1jv2XGGFPkfb
 0pgHBqd3UBltNwAODs4q9myQRlBG01B5cNuF4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=antmicro.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=antmicro.com header.i=@antmicro.com header.a=rsa-sha256
 header.s=google header.b=FiApyaK8
Subject: [Buildroot] [PATCH 1/1] package/riscv-coremark: Create package with
 CoreMark benchmark for RISC-V
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
From: Eryk Szpotanski via buildroot <buildroot@buildroot.org>
Reply-To: Eryk Szpotanski <eszpotanski@antmicro.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============4804069647838639164=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4804069647838639164==
Content-Type: multipart/alternative; boundary="00000000000055e66d061f067237"

--00000000000055e66d061f067237
Content-Type: text/plain; charset="UTF-8"

From 3c09f5c971248c8c9c05a8bab79a5ddb45b40eb7 Mon Sep 17 00:00:00 2001
From: Eryk Szpotanski <eszpotanski@antmicro.com>
Date: Thu, 9 May 2024 12:34:08 +0200
Subject: [PATCH 1/1] package/riscv-coremark: Create package with CoreMark
 benchmark for RISC-V

Signed-off-by: Eryk Szpotanski <eszpotanski@antmicro.com>
---
 package/Config.in                             |  1 +
 ...ype-to-match-it-with-definition-from.patch | 27 +++++++++++++++++++
 package/riscv-coremark/Config.in              |  8 ++++++
 package/riscv-coremark/riscv-coremark.hash    |  3 +++
 package/riscv-coremark/riscv-coremark.mk      | 22 +++++++++++++++
 5 files changed, 61 insertions(+)
 create mode 100644
package/riscv-coremark/0001-Update-clock_t-type-to-match-it-with-definition-from.patch
 create mode 100644 package/riscv-coremark/Config.in
 create mode 100644 package/riscv-coremark/riscv-coremark.hash
 create mode 100644 package/riscv-coremark/riscv-coremark.mk

diff --git a/package/Config.in b/package/Config.in
index 2ac351cce5..09dab28ef3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -145,6 +145,7 @@ menu "Debugging, profiling and benchmark"
  source "package/racehound/Config.in"
  source "package/ramsmp/Config.in"
  source "package/ramspeed/Config.in"
+ source "package/riscv-coremark/Config.in"
  source "package/rt-tests/Config.in"
  source "package/rwmem/Config.in"
  source "package/sentry-native/Config.in"
diff --git
a/package/riscv-coremark/0001-Update-clock_t-type-to-match-it-with-definition-from.patch
b/package/riscv-coremark/0001-Update-clock_t-type-to-match-it-with-definition-from.patch
new file mode 100644
index 0000000000..fda488198d
--- /dev/null
+++
b/package/riscv-coremark/0001-Update-clock_t-type-to-match-it-with-definition-from.patch
@@ -0,0 +1,27 @@
+From a6c8e2e00e5534b340885181d99ecf19286a9ff8 Mon Sep 17 00:00:00 2001
+From: Eryk Szpotanski <eszpotanski@antmicro.com>
+Date: Tue, 6 Aug 2024 13:44:21 +0200
+Subject: [PATCH] Update clock_t type, to match it with external definition
+Upstream: N/A This patch adjust the clock_t type to match it with the
definition from RISC-V toolchain
+
+Signed-off-by: Eryk Szpotanski <eszpotanski@antmicro.com>
+---
+ riscv64/core_portme.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/riscv64/core_portme.h b/riscv64/core_portme.h
+index 4e28afd..1e7708e 100755
+--- a/riscv64/core_portme.h
++++ b/riscv64/core_portme.h
+@@ -71,7 +71,7 @@ typedef clock_t CORE_TICKS;
+      Note these need to match the size of the clock output and the xLen
the processor supports
+  */
+ typedef unsigned long int size_t;
+-typedef unsigned long int clock_t;
++typedef long int clock_t;
+ typedef clock_t CORE_TICKS;
+ #endif
+
+--
+2.45.2
+
diff --git a/package/riscv-coremark/Config.in
b/package/riscv-coremark/Config.in
new file mode 100644
index 0000000000..c9ed47befa
--- /dev/null
+++ b/package/riscv-coremark/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_RISCV_COREMARK
+ bool "riscv-coremark"
+ depends on BR2_RISCV_64
+ help
+  CoreMark benchmark with utility files provided to
+  support RISC-V architecture
+
+  https://github.com/riscv-boom/riscv-coremark/
diff --git a/package/riscv-coremark/riscv-coremark.hash
b/package/riscv-coremark/riscv-coremark.hash
new file mode 100644
index 0000000000..5be3db6bf8
--- /dev/null
+++ b/package/riscv-coremark/riscv-coremark.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  0dde3285b9a1e6bb22bab82e485b5cf58a3e6a026d9cdc22102619a5584a6c7f
 riscv-coremark-6e1d72b864e45f67031ffaedb0b01b5d030d6d3c-br1.tar.gz
+sha256  fc8a88c0c1b5a6bc7358f18c43cdd562c1bfd83b08d81a43f726917582c0e260
 LICENSE
diff --git a/package/riscv-coremark/riscv-coremark.mk
b/package/riscv-coremark/riscv-coremark.mk
new file mode 100644
index 0000000000..819fac2313
--- /dev/null
+++ b/package/riscv-coremark/riscv-coremark.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# RISC-V Coremark
+#
+################################################################################
+
+RISCV_COREMARK_SITE_METHOD = git
+RISCV_COREMARK_GIT_SUBMODULES = YES
+RISCV_COREMARK_VERSION = 6e1d72b864e45f67031ffaedb0b01b5d030d6d3c
+RISCV_COREMARK_SITE = https://github.com/riscv-boom/riscv-coremark.git
+RISCV_COREMARK_LICENSE = BSD-3
+RISCV_COREMARK_LICENSE_FILE = LICENSE
+
+define RISCV_COREMARK_BUILD_CMDS
+ $(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(@D)/coremark
PORT_DIR=$(@D)/riscv64 compile
+endef
+
+define RISCV_COREMARK_INSTALL_TARGET_CMDS
+ $(INSTALL) -D $(@D)/coremark/coremark.riscv
$(TARGET_DIR)/usr/bin/coremark.riscv
+endef
+
+$(eval $(generic-package))
-- 
2.45.2

--00000000000055e66d061f067237
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">From 3c09f5c971248c8c9c05a8bab79a5ddb45b40eb7 Mon Sep 17 0=
0:00:00 2001<div class=3D"gmail_quote"><div dir=3D"ltr"><div class=3D"gmail=
_quote"><div dir=3D"ltr">From: Eryk Szpotanski &lt;<a href=3D"mailto:eszpot=
anski@antmicro.com" target=3D"_blank">eszpotanski@antmicro.com</a>&gt;<br>D=
ate: Thu, 9 May 2024 12:34:08 +0200<br>Subject: [PATCH 1/1] package/riscv-c=
oremark: Create package with CoreMark<br>=C2=A0benchmark for RISC-V<br><br>=
Signed-off-by: Eryk Szpotanski &lt;<a href=3D"mailto:eszpotanski@antmicro.c=
om" target=3D"_blank">eszpotanski@antmicro.com</a>&gt;<br>---<br>=C2=A0pack=
age/Config.in =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A01 +<br>=C2=A0...ype-to-match=
-it-with-definition-from.patch | 27 +++++++++++++++++++<br>=C2=A0package/ri=
scv-coremark/Config.in =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A08 ++++++<br>=C2=A0package/riscv-coremark/riscv-coremark.hash =C2=A0 =
=C2=A0| =C2=A03 +++<br>=C2=A0package/riscv-coremark/<a href=3D"http://riscv=
-coremark.mk" target=3D"_blank">riscv-coremark.mk</a> =C2=A0 =C2=A0 =C2=A0|=
 22 +++++++++++++++<br>=C2=A05 files changed, 61 insertions(+)<br>=C2=A0cre=
ate mode 100644 package/riscv-coremark/0001-Update-clock_t-type-to-match-it=
-with-definition-from.patch<br>=C2=A0create mode 100644 package/riscv-corem=
ark/Config.in<br>=C2=A0create mode 100644 package/riscv-coremark/riscv-core=
mark.hash<br>=C2=A0create mode 100644 package/riscv-coremark/<a href=3D"htt=
p://riscv-coremark.mk" target=3D"_blank">riscv-coremark.mk</a><br><br>diff =
--git a/package/Config.in b/package/Config.in<br>index 2ac351cce5..09dab28e=
f3 100644<br>--- a/package/Config.in<br>+++ b/package/Config.in<br>@@ -145,=
6 +145,7 @@ menu &quot;Debugging, profiling and benchmark&quot;<br>=C2=A0	s=
ource &quot;package/racehound/Config.in&quot;<br>=C2=A0	source &quot;packag=
e/ramsmp/Config.in&quot;<br>=C2=A0	source &quot;package/ramspeed/Config.in&=
quot;<br>+	source &quot;package/riscv-coremark/Config.in&quot;<br>=C2=A0	so=
urce &quot;package/rt-tests/Config.in&quot;<br>=C2=A0	source &quot;package/=
rwmem/Config.in&quot;<br>=C2=A0	source &quot;package/sentry-native/Config.i=
n&quot;<br>diff --git a/package/riscv-coremark/0001-Update-clock_t-type-to-=
match-it-with-definition-from.patch b/package/riscv-coremark/0001-Update-cl=
ock_t-type-to-match-it-with-definition-from.patch<br>new file mode 100644<b=
r>index 0000000000..fda488198d<br>--- /dev/null<br>+++ b/package/riscv-core=
mark/0001-Update-clock_t-type-to-match-it-with-definition-from.patch<br>@@ =
-0,0 +1,27 @@<br>+From a6c8e2e00e5534b340885181d99ecf19286a9ff8 Mon Sep 17 =
00:00:00 2001<br>+From: Eryk Szpotanski &lt;<a href=3D"mailto:eszpotanski@a=
ntmicro.com" target=3D"_blank">eszpotanski@antmicro.com</a>&gt;<br>+Date: T=
ue, 6 Aug 2024 13:44:21 +0200<br>+Subject: [PATCH] Update clock_t type, to =
match it with external definition<br>+Upstream: N/A This patch adjust the c=
lock_t type to match it with the definition from RISC-V toolchain<br>+<br>+=
Signed-off-by: Eryk Szpotanski &lt;<a href=3D"mailto:eszpotanski@antmicro.c=
om" target=3D"_blank">eszpotanski@antmicro.com</a>&gt;<br>+---<br>+ riscv64=
/core_portme.h | 2 +-<br>+ 1 file changed, 1 insertion(+), 1 deletion(-)<br=
>+<br>+diff --git a/riscv64/core_portme.h b/riscv64/core_portme.h<br>+index=
 4e28afd..1e7708e 100755<br>+--- a/riscv64/core_portme.h<br>++++ b/riscv64/=
core_portme.h<br>+@@ -71,7 +71,7 @@ typedef clock_t CORE_TICKS;<br>+ =C2=A0=
 =C2=A0 =C2=A0Note these need to match the size of the clock output and the=
 xLen the processor supports<br>+ =C2=A0*/<br>+ typedef unsigned long int s=
ize_t;<br>+-typedef unsigned long int clock_t;<br>++typedef long int clock_=
t;<br>+ typedef clock_t CORE_TICKS;<br>+ #endif<br>+ <br>+-- <br>+2.45.2<br=
>+<br>diff --git a/package/riscv-coremark/Config.in b/package/riscv-coremar=
k/Config.in<br>new file mode 100644<br>index 0000000000..c9ed47befa<br>--- =
/dev/null<br>+++ b/package/riscv-coremark/Config.in<br>@@ -0,0 +1,8 @@<br>+=
config BR2_PACKAGE_RISCV_COREMARK<br>+	bool &quot;riscv-coremark&quot;<br>+=
	depends on BR2_RISCV_64<br>+	help<br>+	 =C2=A0CoreMark benchmark with util=
ity files provided to<br>+	 =C2=A0support RISC-V architecture<br>+<br>+	 =
=C2=A0<a href=3D"https://github.com/riscv-boom/riscv-coremark/" target=3D"_=
blank">https://github.com/riscv-boom/riscv-coremark/</a><br>diff --git a/pa=
ckage/riscv-coremark/riscv-coremark.hash b/package/riscv-coremark/riscv-cor=
emark.hash<br>new file mode 100644<br>index 0000000000..5be3db6bf8<br>--- /=
dev/null<br>+++ b/package/riscv-coremark/riscv-coremark.hash<br>@@ -0,0 +1,=
3 @@<br>+# Locally computed<br>+sha256 =C2=A00dde3285b9a1e6bb22bab82e485b5c=
f58a3e6a026d9cdc22102619a5584a6c7f =C2=A0riscv-coremark-6e1d72b864e45f67031=
ffaedb0b01b5d030d6d3c-br1.tar.gz<br>+sha256 =C2=A0fc8a88c0c1b5a6bc7358f18c4=
3cdd562c1bfd83b08d81a43f726917582c0e260 =C2=A0LICENSE<br>diff --git a/packa=
ge/riscv-coremark/<a href=3D"http://riscv-coremark.mk" target=3D"_blank">ri=
scv-coremark.mk</a> b/package/riscv-coremark/<a href=3D"http://riscv-corema=
rk.mk" target=3D"_blank">riscv-coremark.mk</a><br>new file mode 100644<br>i=
ndex 0000000000..819fac2313<br>--- /dev/null<br>+++ b/package/riscv-coremar=
k/<a href=3D"http://riscv-coremark.mk" target=3D"_blank">riscv-coremark.mk<=
/a><br>@@ -0,0 +1,22 @@<br>+###############################################=
#################################<br>+#<br>+# RISC-V Coremark<br>+#<br>+###=
###########################################################################=
##<br>+<br>+RISCV_COREMARK_SITE_METHOD =3D git<br>+RISCV_COREMARK_GIT_SUBMO=
DULES =3D YES<br>+RISCV_COREMARK_VERSION =3D 6e1d72b864e45f67031ffaedb0b01b=
5d030d6d3c<br>+RISCV_COREMARK_SITE =3D <a href=3D"https://github.com/riscv-=
boom/riscv-coremark.git" target=3D"_blank">https://github.com/riscv-boom/ri=
scv-coremark.git</a><br>+RISCV_COREMARK_LICENSE =3D BSD-3<br>+RISCV_COREMAR=
K_LICENSE_FILE =3D LICENSE<br>+<br>+define RISCV_COREMARK_BUILD_CMDS<br>+	$=
(TARGET_MAKE_ENV) $(MAKE) CC=3D&quot;$(TARGET_CC)&quot; -C $(@D)/coremark P=
ORT_DIR=3D$(@D)/riscv64 compile<br>+endef<br>+<br>+define RISCV_COREMARK_IN=
STALL_TARGET_CMDS<br>+	$(INSTALL) -D $(@D)/coremark/coremark.riscv $(TARGET=
_DIR)/usr/bin/coremark.riscv<br>+endef<br>+<br>+$(eval $(generic-package))<=
br>-- <br>2.45.2<br><br></div>
</div></div>
</div></div>

--00000000000055e66d061f067237--

--===============4804069647838639164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4804069647838639164==--
