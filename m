Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9BCC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CFE140160;
	Mon,  5 Feb 2024 21:31:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CFE140160
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PQBPfkR_Av78; Mon,  5 Feb 2024 21:31:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90EAD403A2;
	Mon,  5 Feb 2024 21:31:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90EAD403A2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 408E11BF341
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B9DB81E9E
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:31:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B9DB81E9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2zpZb5k4db95 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:31:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0392C81E10
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:31:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0392C81E10
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD12D86E01; Mon,  5 Feb 2024 21:31:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 22:31:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 840849afff07f91668f88570c5055eaf6687deb2
X-Git-Newrev: 19f06441e8b616159d45a552beac6e1fe05bc42a
X-Patchwork-Hint: ignore
Message-Id: <20240205213122.DD12D86E01@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/brltty: disable emacs and lua
 bindings
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=19f06441e8b616159d45a552beac6e1fe05bc42a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable lua bindings to avoid the following build failure if host-lua
and lua are built before brltty raised since bump to version 6.5 in
commit 82c6e87d5eaaf5b32aa340ab384f88539238cbe1 and
https://github.com/brltty/brltty/commit/42bf48ca010d9163652cb0a014662fa243132736:

configure: lua package: lua
configure: lua includes:
configure: lua libs: -L/home/autobuild/autobuild/instance-0/output-1/host/bin/../sparc64-buildroot-linux-gnu/sysroot/usr/lib -llua -lm -ldl
checking for lua5.4... no
checking for lua... /home/autobuild/autobuild/instance-0/output-1/host/bin/lua
configure: Lua shell: /home/autobuild/autobuild/instance-0/output-1/host/bin/lua
configure: Lua library directory: /home/autobuild/autobuild/instance-0/output-1/host/lib/lua/5.3

[...]

/usr/bin/install -c -d /home/autobuild/autobuild/instance-0/output-1/target/home/autobuild/autobuild/instance-0/output-1/host/lib/lua/5.3
/usr/bin/install -c -s --strip-program /bin/true brlapi.so /home/autobuild/autobuild/instance-0/output-1/target/home/autobuild/autobuild/instance-0/output-1/host/lib/lua/5.3
make[3]: Leaving directory '/home/autobuild/autobuild/instance-0/output-1/build/brltty-6.6/Bindings/Lua'

[...]

brltty: installs files in /home/autobuild/autobuild/instance-0/output-1/target//home/autobuild/autobuild/instance-0/output-1

While at it, disable emacs bindings which have also been added in
version 6.5 with
https://github.com/brltty/brltty/commit/64a487e29941df54796645229a872ecbe2a06bfe

Fixes:
 - http://autobuild.buildroot.org/results/f424e6727bbe61ea4b7703e93aae6fcab7506898
 - http://autobuild.buildroot.org/results/bf4a161fc66fb99a24f08bea3436b13738f2e383

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/brltty/brltty.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index f00a18cc6f..22d58ebd00 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -23,8 +23,10 @@ BRLTTY_CONF_ENV = \
 	PKG_CONFIG_FOR_BUILD=$(HOST_DIR)/bin/pkgconf
 
 BRLTTY_CONF_OPTS = \
+	--disable-emacs-bindings \
 	--disable-java-bindings \
 	--disable-lisp-bindings \
+	--disable-lua-bindings \
 	--disable-ocaml-bindings \
 	--disable-python-bindings \
 	--disable-tcl-bindings \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
