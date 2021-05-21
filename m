Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACD1C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:29:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0085D6103C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0085D6103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB44483BF5;
	Tue,  3 Aug 2021 22:29:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UZFGNk-UnGXr; Tue,  3 Aug 2021 22:29:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 421F283BE9;
	Tue,  3 Aug 2021 22:29:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 120811BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0A8740597
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q4IXr-gvoQDm for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71D07404F1
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BC52C810E2; Tue,  3 Aug 2021 21:09:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 21 May 2021 09:52:33 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cfb83cc5a1a7defda1a04b1b014e55bd72fb77fa
X-Git-Newrev: 9ec60e877e3cf9bb1a11f59ae18976f3f7087fed
X-Patchwork-Hint: ignore
Message-Id: <20210803210942.BC52C810E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/dhcp: add host-gawk to
 global dependencies and build environment
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

commit: https://git.buildroot.net/buildroot/commit/?id=9ec60e877e3cf9bb1a11f59ae18976f3f7087fed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

DHCP package may silently fail to install binaries to the target image.
The problem occurs when buildroot output/host and build server provide
different flavors of awk. For instance, mawk on build server and gawk
in buildroot output/host. In this case isc-dhcp configure script detects
gawk in output/host and generates Makefiles specifying gawk without
absolute path. During Buildroot installation phase, those Makefiles
are used to install dhcp binaries. They attempt to use gawk without
absolute path. However build host does not have gawk.

To resolve the issue add host-gawk to dependencies and specify absolute
path to host-gawk in dhcp configure script using DHCP_CONF_ENV.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dhcp/dhcp.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 8d7157f357..db58870f88 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -9,7 +9,7 @@ DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = MPL-2.0
 DHCP_LICENSE_FILES = LICENSE
-DHCP_DEPENDENCIES = bind
+DHCP_DEPENDENCIES = bind host-gawk
 DHCP_CPE_ID_VENDOR = isc
 
 # use libtool-enabled configure.ac
@@ -22,6 +22,8 @@ DHCP_CONF_ENV = \
 		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
 	CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1'
 
+DHCP_CONF_ENV += ac_cv_prog_AWK=$(HOST_DIR)/bin/gawk
+
 DHCP_CONF_OPTS = \
 	--with-libbind=$(STAGING_DIR)/usr \
 	--with-randomdev=/dev/random \
@@ -55,7 +57,6 @@ define DHCP_INSTALL_LIBS
 endef
 
 ifeq ($(BR2_PACKAGE_DHCP_SERVER),y)
-DHCP_DEPENDENCIES += host-gawk
 define DHCP_INSTALL_CTL_LIBS
 	$(MAKE) -C $(@D)/dhcpctl install-exec DESTDIR=$(TARGET_DIR)
 endef
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
