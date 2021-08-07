Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F374C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 21:20:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB93760F42
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 21:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB93760F42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79B0540188;
	Sat,  7 Aug 2021 21:20:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uhQcXukjPEjl; Sat,  7 Aug 2021 21:20:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6136D400EF;
	Sat,  7 Aug 2021 21:20:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 865711BF3BC
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 21:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75977402FD
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 21:20:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u9zT8oft9MXQ for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 21:20:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B171A4020C
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 21:20:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8F97A8CE82; Sat,  7 Aug 2021 21:19:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 23:19:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5108554dfe0d4815c9c84f75b118298c147ccd33
X-Git-Newrev: f4961dea504bcc999988b174466423eb72052a6e
X-Patchwork-Hint: ignore
Message-Id: <20210807211952.8F97A8CE82@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvirt: disable stack-protector
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=f4961dea504bcc999988b174466423eb72052a6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set warning_level to 1 instead of the default value of 2 to disable
stack-protector and avoid the following build failure since the addition
of the package in commit ccfc90e1010e42e6529afae3a5ea8bf7226dabc1:

/tmp/instance-5/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: tests/commandhelper.p/commandhelper.c.o: in function `printInput':
commandhelper.c:(.text+0xad): undefined reference to `__stack_chk_guard'

Fixes:
 - http://autobuild.buildroot.org/results/a2657eb18b579752c8217ab356adcb52931f6785

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr:
  - move to a separate assignment
  - add a big fat comment to explain it
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libvirt/libvirt.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index a0fd5af951..cd037a6b02 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -53,6 +53,13 @@ LIBVIRT_CONF_OPTS = \
 	-Dudev=enabled \
 	-Dwireshark_dissector=disabled
 
+# warning_level should only drive the level of warnings during the
+# compilation of C code. However, libvirt misuses that to also
+# enable SSP when warning_level == 2
+# Force warning_level=1 to disable SSP, and let our toolchain wrapper
+# handle it.
+LIBVIRT_CONF_OPTS += -Dwarning_level=1
+
 ifeq ($(BR2_PACKAGE_ATTR),y)
 LIBVIRT_CONF_OPTS += -Dattr=enabled
 LIBVIRT_DEPENDENCIES += attr
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
