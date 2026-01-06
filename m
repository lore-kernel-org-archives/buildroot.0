Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8F0D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7219A80FC6;
	Wed,  7 Jan 2026 17:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eQ4Guiu9shkQ; Wed,  7 Jan 2026 17:47:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C6B681DFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808061;
	bh=iefbbuH1Gzv2T7qbr3nhgPzvXpcK+PtMzTD2kx5g3gY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Fev28Cepxgn3y8yBKHTetJfzCo1fnriMfsvS/Qyf4KSo2JVeG8UVyz8QDZ22/puCX
	 1ig7gG8z2TM8oiYqCyzxJ+rQTdCqmdv3xByefH83gkARtvGqVlztnODhazV8jEBY9a
	 XTeSc3Trw/hxdSZwwMxQ2pdvcbM3wxqHejYOoHSXf+ie6uHWqyM3SsZYE4vEdUZtn0
	 Ks02VQotB9mD6OUZLwuFgYAyPkbu7e09EyTNBdFsEJ6LsDj1d9j7aEJcBNk59KQZ/o
	 eIi3OLlptpqc4kV3HwMFvqZmwpnaRAUTahGANgzmxkGRMLRaArZYHLqSe1FTMw+NAw
	 jmnYBKwreuQvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C6B681DFF;
	Wed,  7 Jan 2026 17:47:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 779EB9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C84AB60B71
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XCAzzJ-1JzCv for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 187436087C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 187436087C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18092883AA; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:17:10 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 50fafbfadebec7d6ba7e7c1edf4792d975fee459
X-Git-Newrev: 384a9c596fe72cfbfdd277051a14f495516fd456
X-Patchwork-Hint: ignore
Message-Id: <20260107174641.18092883AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/vim: fix
 reinstallation
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=384a9c596fe72cfbfdd277051a14f495516fd456
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

While not very common, it is nice when package re-installation
works. Unfortunately the "installlinks" target of vim installs links
with "ln -s", causing a package reinstallation to fail with:

cd /home/thomas/buildroot/br/output-all/target/usr/bin; ln -s vim ex
cd /home/thomas/buildroot/br/output-all/target/usr/bin; ln -s vim view
cd /home/thomas/buildroot/br/output-all/target/usr/bin; ln -s vim rvim
cd /home/thomas/buildroot/br/output-all/target/usr/bin; ln -s vim rview
cd /home/thomas/buildroot/br/output-all/target/usr/bin; ln -s vim vimdiff
ln: failed to create symbolic link 'ex': File exists
ln: failed to create symbolic link 'view': File exists
make[2]: *** [Makefile:2749: /home/thomas/buildroot/br/output-all/target/usr/bin/ex] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: *** [Makefile:2752: /home/thomas/buildroot/br/output-all/target/usr/bin/view] Error 1
ln: failed to create symbolic link 'rvim': File exists
ln: failed to create symbolic link 'rview': File exists

To fix this, we remove the target links before proceeding with the
installation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 67e84345c156170fa01103289f1d255a74ad830d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/vim/vim.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 4297bdd198..36015c6085 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -47,6 +47,7 @@ VIM_CONF_OPTS += --disable-selinux
 endif
 
 define VIM_INSTALL_TARGET_CMDS
+	$(RM) -f $(TARGET_DIR)/usr/bin/{ex,view,rvim,rview,vimdiff}
 	cd $(@D)/src; \
 		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installvimbin; \
 		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installpack; \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
