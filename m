Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD029C48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F25D41B1A;
	Thu, 29 Feb 2024 15:53:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DPnwxP3m1bwZ; Thu, 29 Feb 2024 15:53:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CA1841937
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CA1841937;
	Thu, 29 Feb 2024 15:53:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE1FA1BF980
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B1A360EF8
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lnh_5h7a0w-g for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:48:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90DAF60EF7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90DAF60EF7
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:48:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7AC9D87DAC; Thu, 29 Feb 2024 15:48:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 16:41:06 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 56a3517ba139380cd611c40ca1bd498dbae8f260
X-Git-Newrev: 8e47248d3817440f3ce06265d096b7d9f4e94158
X-Patchwork-Hint: ignore
Message-Id: <20240229154802.7AC9D87DAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/brltty: disable
 emacs and lua bindings
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

commit: https://git.buildroot.net/buildroot/commit/?id=8e47248d3817440f3ce06265d096b7d9f4e94158
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
(cherry picked from commit 19f06441e8b616159d45a552beac6e1fe05bc42a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
