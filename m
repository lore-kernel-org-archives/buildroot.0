Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6E0E6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8EE3846CB;
	Fri,  6 Sep 2024 20:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pxOCaP1oiinU; Fri,  6 Sep 2024 20:04:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B95E846C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B95E846C7;
	Fri,  6 Sep 2024 20:04:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A4A941BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 968DA407C6
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QuVYIMoi1hXM for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCC6A407AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCC6A407AF
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA9EB86587; Fri,  6 Sep 2024 19:58:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 22:32:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ed8573cddf8183fc3c9e8c03ce9ee26c5e5d0e3
X-Git-Newrev: 1b753a3c14df48f0bb36d4d9e45d98b8f94e82df
X-Patchwork-Hint: ignore
Message-Id: <20240906195858.BA9EB86587@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/chrony: install default config
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b753a3c14df48f0bb36d4d9e45d98b8f94e82df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

chrony needs a config file to work:
  Could not open /etc/chrony.conf : No such file or directory

Many distros [1][2] use example 2 as the default config, and a few
distros (such as freeBSD [3]) use example 3.

Example 1 [4] is very brief. Example 2 [5] fully includes example 1
and sets the log directory. Example 3 [6] is almost entirely comments
intended to serve as documentation. Therefore, we have chosen to
use example 2 as the out of the box configuration in Buildroot.

[1]: https://github.com/microsoft/azurelinux/blob/3.0-stable/SPECS/chrony/chrony.spec#L72
[2]: https://github.com/vmware/photon/blob/5.0-Beta/SPECS/chrony/chrony.spec#L33
[3]: https://github.com/FreeBSDDesktop/freebsd-ports/blob/master/net/chrony/Makefile#L93-L94
[4]: https://gitlab.com/chrony/chrony/-/blob/3.5-stable/examples/chrony.conf.example1
[5]: https://gitlab.com/chrony/chrony/-/blob/3.5-stable/examples/chrony.conf.example2#L35
[6]: https://gitlab.com/chrony/chrony/-/blob/3.5-stable/examples/chrony.conf.example3#L30-34

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/chrony/chrony.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index e7e6931a2a..9ed9dcff56 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -71,6 +71,7 @@ endef
 
 define CHRONY_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
+	$(INSTALL) -D -m 644 $(@D)/examples/chrony.conf.example2 $(TARGET_DIR)/etc/chrony.conf
 endef
 
 define CHRONY_INSTALL_INIT_SYSV
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
