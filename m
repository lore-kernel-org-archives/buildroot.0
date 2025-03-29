Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75400C36008
	for <buildroot@archiver.kernel.org>; Sat, 29 Mar 2025 10:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22A888475A;
	Sat, 29 Mar 2025 10:19:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p2ztHS176bKH; Sat, 29 Mar 2025 10:19:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 467328474A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 467328474A;
	Sat, 29 Mar 2025 10:19:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A61C319A
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 10:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86F48606D4
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 10:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2J0BaPYIH0S4 for <buildroot@buildroot.org>;
 Sat, 29 Mar 2025 10:19:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CD1C60749
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CD1C60749
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 10:19:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64B57835F5; Sat, 29 Mar 2025 10:19:37 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 29 Mar 2025 11:18:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3ce9a56f92a07c1fe30ea6054923a2266dcb5b2
X-Git-Newrev: e172bb48d3460d994e5eaff9059b3055172d28bb
X-Patchwork-Hint: ignore
Message-Id: <20250329101937.64B57835F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcap: do not attempt to run
 ldconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=e172bb48d3460d994e5eaff9059b3055172d28bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libcap Makefile is hand-coded (i.e. not autotools), and hard-codes
calls to /sbin/ldconfig, unless it is installed out-of-tree. For target
packages, this is done, but for host package this is not done, as we
do set PREFIX instead, which causes libcap's Makefile to call ldconfig
and emits a spurious warning (twice):

    install -m 0755 libcap.so.2.73 /home/ymorin/dev/buildroot/O/master/per-package/host-libcap/host/lib/libcap.so.2.73
    ln -sf libcap.so.2.73 /home/ymorin/dev/buildroot/O/master/per-package/host-libcap/host/lib/libcap.so.2
    ln -sf libcap.so.2 /home/ymorin/dev/buildroot/O/master/per-package/host-libcap/host/lib/libcap.so
    /sbin/ldconfig
    /sbin/ldconfig: Can't create temporary cache file /etc/ld.so.cache~: Permission denied
    make[4]: [Makefile:200: install-shared-cap] Error 1 (ignored)

This is just a warning, but it is incorrect still.

Fake an out-of-tree install with a non-empy DESTDIR that is just '/',
and thus does in fact not install out-of-tree. This is enough to
actually silence the warning. Add a little comment to explain that.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libcap/libcap.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 5a6ed5b494..25b3a46c44 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -64,8 +64,11 @@ define HOST_LIBCAP_BUILD_CMDS
 		$(HOST_LIBCAP_MAKE_FLAGS)
 endef
 
+# Set DESTDIR to a non-empty path, so that libcap's Makefile
+# does not trigger calls to ldconfig
 define HOST_LIBCAP_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_LIBCAP_MAKE_FLAGS) install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_LIBCAP_MAKE_FLAGS) \
+		DESTDIR=/ install
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
