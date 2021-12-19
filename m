Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8E9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Dec 2021 07:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3810560B42;
	Sun, 19 Dec 2021 07:03:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NHnOmC3EzCAY; Sun, 19 Dec 2021 07:03:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AC4260AB0;
	Sun, 19 Dec 2021 07:03:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 189B71BF3C1
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 07:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07B9841DCC
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 07:03:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m_fjKge30ILr for <buildroot@lists.busybox.net>;
 Sun, 19 Dec 2021 07:03:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp4.osuosl.org (Postfix) with ESMTP id 559F941DBF
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 07:03:35 +0000 (UTC)
Received: from localhost.localdomain ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id yqEHm0SNqydyPyqEHmhQh3; Sun, 19 Dec 2021 08:03:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1639897414; bh=X8ZJU4RICU4WtbpRad8GUP6Yzg26g/FLDb54e4H/WKE=;
 h=From:To:Subject:Date:MIME-Version;
 b=dPva+mWJKuSpAO6kOoJy8f8814ojynTglbNd9Gop2dwbb+m5YWyX29vIGlSXStQ5z
 jipN9Zwu0kL4FMwWVewIzmECvA5wMFQoDV5hKM1ihC3p7hEi3SICucAngcRrAxSDHO
 mRX2NvBsCjipiri+EDQpGlcy0ApKupprFF00VU2e+fp+VxhoI9u1yzOa1Z766BbTIV
 09pk/9SONXaQj42FOmJ6u+JXWdZfyBVpaX8vpgTskQWIq72oFLTLdXhTw1iugBcjba
 C42QDmTV2UUWrrmESf6rkMDB1CIU6dEltz9gIfNYEpl/FyKTFawcSx5Np0+ZV+5lTw
 4x341iTeiaebA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Dec 2021 08:03:32 +0100
Message-Id: <20211219070332.2642029-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211217214940.106e9ed5@windsurf>
References: <20211217214940.106e9ed5@windsurf>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfF7dJxfqx4ZDXm3BareW3btvubV2mq5lVyE9kaTPEFpaeGCcIzvqGzL8Zch2SAhT7sF6PQyjSpHcL3FqN3JvVkzRlWVXmjYa2cqTk2GH3RZQh2LYDUrP
 v0f0nFWp0/jDiWBtT0aTHz8Ysoy6xxyzam8e3tEtDY+6kONF/E6X28NvW9Eu2WBJIJU07rFF2xGWnjiXbG5PRXB/IntIVnkRrzLYRvvoJhao5/riCh6ko2Z2
 kVQ5xawmdz7ZcuhojjSdg/aKGauJ3oqAIwpOidXeGGo0AF/X3XLZ1l3BWXzUVK9Ie6cur6CuTUiXaScVsrcupYwuaIMe1o+ewteXaj7JYKQXcJsF4Oh/Y5fm
 A5hJRwhKMg9OxtsrEPr3vzuojHLc1QBN9UtPpZHqvmtQFKIeCFH8b8ZGLUHl0KlNN0Foh0qf
Subject: [Buildroot] [PATCH] package/erlang-rebar: fix linking failure on
 shared library
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Johan Oudinet <johan.oudinet@gmail.com>, Will Newton <will.newton@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add patch to fix linking failure while creating shared library. As
explained in the patch itself, there is no specific variable for when we
link a shared library and rebar itself rely on the default LDFLAGS. Since
by default every CFLAGS is filled with -fPIC we need to make sure that
every LDFLAGS is the same, so not having any other *_LDFLAGS variable to
fille with -fPIC let's add it to the main LDFLAGS.

Fixes:
http://autobuild.buildroot.net/results/602/60296a48210e7ffc6bc9fa50ee586441a8957e85/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...ompiler-add-fPIC-to-LDFLAGS-by-defau.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/erlang-rebar/0001-src-rebar_port_compiler-add-fPIC-to-LDFLAGS-by-defau.patch

diff --git a/package/erlang-rebar/0001-src-rebar_port_compiler-add-fPIC-to-LDFLAGS-by-defau.patch b/package/erlang-rebar/0001-src-rebar_port_compiler-add-fPIC-to-LDFLAGS-by-defau.patch
new file mode 100644
index 0000000000..a9c1670a1f
--- /dev/null
+++ b/package/erlang-rebar/0001-src-rebar_port_compiler-add-fPIC-to-LDFLAGS-by-defau.patch
@@ -0,0 +1,35 @@
+From 7f54d48ee5db037778ead310e0b8278f3fe70b41 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sun, 19 Dec 2021 07:52:55 +0100
+Subject: [PATCH] src/rebar_port_compiler: add -fPIC to LDFLAGS by default
+
+Since both DRV_CFLAGS and EXE_CFLAGS list -fPIC we need also the LDFLAGS
+to follow them. Unfortunately adding -fPIC only to DRV_LDFLAGS and
+EXE_LDFLAGS is not sufficient, since when linking as a library(.so) it
+doesn't take into account those variables. Since -fPIC is needed by default
+by any kind of linking, let's add it to the general -fPIC. Rebar seems to
+link libraries without taking into account any variable listed in:
+src/rebar_port_compiler.erl
+this after testing and tracing for every variable.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ src/rebar_port_compiler.erl | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/rebar_port_compiler.erl b/src/rebar_port_compiler.erl
+index 9679c80..bd08b21 100644
+--- a/src/rebar_port_compiler.erl
++++ b/src/rebar_port_compiler.erl
+@@ -645,6 +645,8 @@ default_env() ->
+      {"OBJCOPY", get_tool(Arch, "objcopy", "objcopy")},
+      {"OBJDUMP", get_tool(Arch, "objdump", "objdump")},
+ 
++     {"LDFLAGS", "-fPIC $LDFLAGS"},
++
+      {"DRV_CXX_TEMPLATE",
+       "$CXX -c $CXXFLAGS $DRV_CFLAGS $PORT_IN_FILES -o $PORT_OUT_FILE"},
+      {"DRV_CC_TEMPLATE",
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
