Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EE5CD37AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C0F640239;
	Tue,  3 Sep 2024 20:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id miqXi0sFartZ; Tue,  3 Sep 2024 20:33:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CB724029C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CB724029C;
	Tue,  3 Sep 2024 20:33:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 601B61BF57B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D8D980E6E
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:33:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Py-Y9vpp1pif for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:33:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A90280E78
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A90280E78
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:33:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54AAC86C64; Tue,  3 Sep 2024 20:33:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 22:32:05 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1ed8573cddf8183fc3c9e8c03ce9ee26c5e5d0e3
X-Git-Newrev: 1b753a3c14df48f0bb36d4d9e45d98b8f94e82df
X-Patchwork-Hint: ignore
Message-Id: <20240903203309.54AAC86C64@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/chrony: install
 default config
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
