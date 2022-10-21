Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68B2C433FE
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 18:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5629D8143A;
	Fri, 21 Oct 2022 18:58:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5629D8143A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ycELPtb2Zn_3; Fri, 21 Oct 2022 18:58:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69F7481407;
	Fri, 21 Oct 2022 18:58:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69F7481407
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD9641BF863
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 18:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C44E740223
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 18:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C44E740223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z1mccEOxjNYc for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 18:58:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01F484063C
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 18:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01F484063C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE3DF86F53; Fri, 21 Oct 2022 18:58:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 21 Oct 2022 20:58:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3b962c93579f02775fbf057f317bcd58772131e
X-Git-Newrev: 2c9ef36242341b5f8db171251d737d29fc376e0c
X-Patchwork-Hint: ignore
Message-Id: <20221021185834.DE3DF86F53@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gpsd: actually wait for after
 chrony
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c9ef36242341b5f8db171251d737d29fc376e0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We use gpsd's upstream systemd service unit files, which define a
dependency on chronyd.service. And indeed, upstream chrony does
provide an example service unit file chronyd.service.

However, in Buildroot, we are not using chrony's upstream unit, we are
providing our own, much simplified as compared to upstream. We install
that unit file as chrony.service. Notice that subtle difference in the
name: upstream's is chronyd, with a trailing 'd', while ours just
chrony, without the trailing 'd'.

As a consequence, in a Buildroot-built system, gpsd does not wait for
after chrony is started, which causes all kind of mayhem when gpsd
actually needs to talk to chrony.

We have multiple options:
 1. use chrony's upstream unit file;
 2  rename the chrony service file as installed by Buildroot, to match
    what chrony would actually do;
 3. tweak gpsd's unit file to refer to chrony.service, not
    chronyd.service;
 4. leverage systemd's flexibility in how units are defined, and provide
    a drop-in to complement gpsd's unit to also wait for chrony.service.

For 1. it is totally unknown why we do have our unit file to begin with,
rather than use upstream's. Since upstream's is much more complex than
ours, using it might have unforetold consequences.

Going with 2. seems the easiest at first sight, but then it would break
systems where users provide their own drop-ins for chrony, as they would
no longer match.

3. is relatively easy, but running sed is not entirely nice. Besides, it
semantically should be a post-install hook, rather than a systemd-init
command, but again that makes things a bit more ugly. Also, some people
may have their own gpsd.service in an overlay or whatever, which would
break our fixup.

Solution 4. is pretty straightforward, although it is not ideal either.

To be noted: some distributions, like Ubuntu 20.04 at least, do install
the chrony unit file as chrony.service, like Buildroot does. However,
there does not appear to be any fixup in gpsd for this discrepancy, as
their gpsd install still refers to chronyd.service. So that does not
help us decide what to do.

So, eventually, we decided to go with solution 4, which has the least
impact on the system, and keeps the status-quo for all other use-cases.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gpsd/br-chrony.conf | 2 ++
 package/gpsd/gpsd.mk        | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/package/gpsd/br-chrony.conf b/package/gpsd/br-chrony.conf
new file mode 100644
index 0000000000..67a79e5f65
--- /dev/null
+++ b/package/gpsd/br-chrony.conf
@@ -0,0 +1,2 @@
+[Unit]
+After=chrony.service
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index b8526c0260..961ebde649 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -213,6 +213,14 @@ define GPSD_INSTALL_INIT_SYSV
 	$(SED) 's,^DEVICES=.*,DEVICES=$(BR2_PACKAGE_GPSD_DEVICES),' $(TARGET_DIR)/etc/init.d/S50gpsd
 endef
 
+# When using chrony, wait for after Buildroot's chrony.service
+ifeq ($(BR2_PACKAGE_CHRONY),y)
+define GPSD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(GPSD_PKGDIR)/br-chrony.conf \
+		$(TARGET_DIR)/usr/lib/systemd/system/gpsd.service.d/br-chrony.conf
+endef
+endif
+
 define GPSD_INSTALL_STAGING_CMDS
 	(cd $(@D); \
 		$(GPSD_SCONS_ENV) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
