Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E467C433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 19:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB59F82572;
	Tue, 25 Jan 2022 19:20:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u_Z9TexKTJta; Tue, 25 Jan 2022 19:20:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34CE682538;
	Tue, 25 Jan 2022 19:20:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C4CE1BF297
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 19:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97C4C82538
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 19:20:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X9q9dg7tXNvD for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 19:20:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD01282503
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 19:20:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D9FF4822E9; Tue, 25 Jan 2022 19:13:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 19:59:22 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 2f517fae03e547d6c9e6c4fe373b17b61469afa1
X-Git-Newrev: 3c630f207bf527977150ef59659b8d0b573f26c3
X-Patchwork-Hint: ignore
Message-Id: <20220125191346.D9FF4822E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/erlang-rebar: fix
 linking failure on shared library
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3c630f207bf527977150ef59659b8d0b573f26c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Add patch to fix linking failure while creating shared library. As
explained in the patch itself, there is no specific variable for when we
link a shared library and rebar itself rely on the default LDFLAGS. Since
by default every CFLAGS is filled with -fPIC we need to make sure that
every LDFLAGS is the same, so not having any other *_LDFLAGS variable to
fille with -fPIC let's add it to the main LDFLAGS.

Fixes:
http://autobuild.buildroot.net/results/602/60296a48210e7ffc6bc9fa50ee586441a8957e85/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b00c034fe58ad2ae87b2289e07912b6c10d19ee1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ort_compiler-add-fPIC-to-LDFLAGS-by-defau.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
