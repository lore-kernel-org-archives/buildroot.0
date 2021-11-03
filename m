Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB7DC433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 22:08:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B80461101
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 22:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B80461101
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FF2A81766;
	Wed,  3 Nov 2021 22:08:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XiZYhNKZZSB5; Wed,  3 Nov 2021 22:07:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B510080F87;
	Wed,  3 Nov 2021 22:07:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CDE361BF292
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 22:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCBEB403AC
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 22:07:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Oncum5AMY3u for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 22:07:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCAB640165
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 22:07:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0A8E28A50E; Wed,  3 Nov 2021 22:04:14 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 23:07:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6fab4aeb224077242e3e6d3d526030219016da5e
X-Git-Newrev: d66f0c0b62c407f2723c31b19469d29522ae968a
X-Patchwork-Hint: ignore
Message-Id: <20211103220414.0A8E28A50E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/softhsm2: add p11-kit optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=d66f0c0b62c407f2723c31b19469d29522ae968a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

p11-kit is an optional dependency which is enabled by default since the
addition of the package in commit
53873b6daecd2a97740833cae7c5b4cdb185a6b2 and softhsm2 needs help to
properly install files:

 /usr/bin/install -c -m 644 softhsm2.module '/home/buildroot/autobuild/instance-0/output-1/host/nios2-buildroot-linux-gnu/sysroot/home/buildroot/autobuild/instance-0/output-1/host/bin/../nios2-buildroot-linux-gnu/sysroot/usr/share/p11-kit/modules'

[...]

softhsm2: installs files in /home/buildroot/autobuild/instance-0/output-1/host/nios2-buildroot-linux-gnu/sysroot//home/buildroot/autobuild/instance-0/output-1
package/pkg-generic.mk:330: recipe for target '/home/buildroot/autobuild/instance-0/output-1/build/softhsm2-2.6.1/.stamp_staging_installed' failed

Fixes:
 - http://autobuild.buildroot.org/results/a05bb71cfe016f793c89b2a035835718836039c8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/softhsm2/softhsm2.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/softhsm2/softhsm2.mk b/package/softhsm2/softhsm2.mk
index c418e3648e..5e37e42dde 100644
--- a/package/softhsm2/softhsm2.mk
+++ b/package/softhsm2/softhsm2.mk
@@ -12,4 +12,13 @@ SOFTHSM2_LICENSE_FILES = LICENSE
 SOFTHSM2_DEPENDENCIES = openssl
 SOFTHSM2_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_P11_KIT),y)
+SOFTHSM2_CONF_OPTS += \
+	--enable-p11-kit \
+	--with-p11-kit=/usr/share/p11-kit/modules
+SOFTHSM2_DEPENDENCIES += p11-kit
+else
+SOFTHSM2_CONF_OPTS += --disable-p11-kit
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
