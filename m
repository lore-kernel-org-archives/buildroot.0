Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A2BCAC583
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB79B60D86;
	Wed, 10 Sep 2025 21:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3SWK3nNVSep0; Wed, 10 Sep 2025 21:33:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C461261116
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C461261116;
	Wed, 10 Sep 2025 21:33:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ACEE9234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E10C4152E
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AhDLC0xQbP8R for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:33:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BFA0F40103
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFA0F40103
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BFA0F40103
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2EBF34E40B80
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 058D6606D4
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3EA7B102F28F0; 
 Wed, 10 Sep 2025 23:33:08 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Sep 2025 23:32:08 +0200
Message-ID: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757539988; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=3rrIb1kEmgl96OFRVmX4kEjsFfubdGoOyGKm186RgPA=;
 b=jRa5X34YwlivfAi84pUAPKstO53C4iJcTWdB2pkL6u2uzVpaTHAv1D5/KeekNURzyx+35v
 2RdgMcGJtroStUIuEhNlY1EVBM99DjRorlnikcqHU6U5A/HfzTnhAzWsGLUaMsaI2PM/qF
 2gsNGEnznk6cHL51HqQw+SfE5KDNH1pNEYBUbu4mPkxWRUVqw94QRBBD1lQbLY2ly3f1Q2
 ZvN2DPdpR9B9EjGmJVRG+k5mecDnKQioxbYlARAoZPy3fJJeb5+rA2VnX6Zz9H0ogxMxgx
 WwXcF+K/hNMIaaum9xjKE3L3sEMI+I7HwxAPQMNJbp/Fqr9DGtygF1VeXNq4IA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=jRa5X34Y
Subject: [Buildroot] [PATCH 00/23] Remove libgtk2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

While attempting a full build of all packages with GCC 15.x, I
stumbled accross libgtk2, which doesn't build with GCC 15.x, and not
even with GCC 14.x.

Gtk2 upstream's last release, 2.24.33, was published in December
2020. It hasn't received a single upstream update since then.

While Debian has fixes to make it build with GCC 14.x, these are not
sufficient to build with GCC 15.x.

It is therefore time to remove Gtk2. Gtk3 and Gtk4 have been around
for a while, and with Gtk2 being unmaintained upstream, it anyway
shouldn't be used anymore.

This series therefore goes through the tedious process of removing
everything that needs libgtk2. This requires removing packages or
removing optional dependencies depending on the situation.

Best regards,

Thomas

Thomas Petazzoni (23):
  package/adwaita-icon-theme: drop reference to libgtk2
  package/cwiid: remove wmgui support, needs libgtk2
  package/gkrellm: remove package, needs libgtk2
  package/gtk2-engines: remove package, needs libgtk2
  package/gtkiostream: drop optional dependency on libgtk2
  package/gtkperf: remove package
  package/leafpad: remove package
  package/libcanberra: remove optional dependency on libgtk2
  package/{libfm,pcmanfm}: handle libgtk2 removal
  package/libglade: remove package
  package/libsexy: remove package
  package/lv2: drop optional dependency on libgtk2
  package/metacity: remove package
  package/mjpegtools: drop optional dependency on libgtk2
  package/netsurf: drop support for gtk backend
  package/opencv3: drop optional dependency on libgtk2
  package/opencv4: drop optional dependency on libgtk2
  package/pinentry: remove gtk2 backend support
  package/putty: drop optional dependency on libgtk2
  package/sylpheed: remove package
  package/xscreensaver: remove package
  package/yad: drop support for gtk2
  package/libgtk2: remove package

 .checkpackageignore                           |   5 -
 Config.in.legacy                              |  79 ++++++++++
 DEVELOPERS                                    |   3 -
 package/Config.in                             |  12 --
 package/adwaita-icon-theme/Config.in          |   2 +-
 package/cwiid/Config.in                       |  14 --
 package/cwiid/cwiid.mk                        |   9 +-
 package/gkrellm/Config.in                     |  43 ------
 package/gkrellm/gkrellm.hash                  |   4 -
 package/gkrellm/gkrellm.mk                    |  60 --------
 package/gtk2-engines/Config.in                |   5 -
 package/gtk2-engines/gtk2-engines.hash        |   4 -
 package/gtk2-engines/gtk2-engines.mk          |  88 -----------
 package/gtkiostream/gtkiostream.mk            |   4 -
 package/gtkperf/Config.in                     |  11 --
 package/gtkperf/gtkperf.hash                  |   3 -
 package/gtkperf/gtkperf.mk                    |  15 --
 package/leafpad/Config.in                     |   7 -
 package/leafpad/leafpad.hash                  |   4 -
 package/leafpad/leafpad.mk                    |  13 --
 package/libcanberra/libcanberra.mk            |  14 +-
 package/libfm/Config.in                       |  34 +++--
 package/libfm/libfm.mk                        |  11 +-
 package/libglade/Config.in                    |  21 ---
 package/libglade/libglade.hash                |   5 -
 package/libglade/libglade.mk                  |  23 ---
 .../libgtk2/0001-reduce-dependencies.patch    | 117 ---------------
 package/libgtk2/Config.in                     |  42 ------
 package/libgtk2/libgtk2.hash                  |   5 -
 package/libgtk2/libgtk2.mk                    | 139 ------------------
 package/libsexy/Config.in                     |  11 --
 package/libsexy/libsexy.hash                  |   3 -
 package/libsexy/libsexy.mk                    |  14 --
 package/lv2/lv2.mk                            |   4 -
 .../metacity/0001-add-libm-reference.patch    |  51 -------
 package/metacity/0002-gconf.patch             |  30 ----
 .../0003-mag-add-libm-reference.patch         |  45 ------
 package/metacity/Config.in                    |  18 ---
 package/metacity/Xsession                     |   6 -
 package/metacity/metacity.hash                |   5 -
 package/metacity/metacity.mk                  |  44 ------
 package/mjpegtools/mjpegtools.mk              |   8 +-
 package/netsurf/Config.in                     |   6 -
 package/netsurf/netsurf.mk                    |   7 -
 package/opencv3/Config.in                     |   9 --
 package/opencv3/opencv3.mk                    |  14 +-
 package/opencv4/Config.in                     |   9 --
 package/opencv4/opencv4.mk                    |  14 +-
 package/pcmanfm/Config.in                     |  35 +++--
 package/pcmanfm/pcmanfm.mk                    |  11 +-
 package/pinentry/Config.in                    |  22 ---
 package/pinentry/pinentry.mk                  |  12 +-
 package/putty/putty.mk                        |   2 -
 ...-link-checker-before-accepting-click.patch |  39 -----
 package/sylpheed/Config.in                    |   7 -
 package/sylpheed/sylpheed.hash                |   4 -
 package/sylpheed/sylpheed.mk                  |  37 -----
 package/xscreensaver/Config.in                |  38 -----
 package/xscreensaver/xscreensaver.hash        |   4 -
 package/xscreensaver/xscreensaver.mk          |  75 ----------
 package/yad/Config.in                         |   8 +-
 package/yad/yad.mk                            |   3 -
 62 files changed, 150 insertions(+), 1241 deletions(-)
 delete mode 100644 package/gkrellm/Config.in
 delete mode 100644 package/gkrellm/gkrellm.hash
 delete mode 100644 package/gkrellm/gkrellm.mk
 delete mode 100644 package/gtk2-engines/Config.in
 delete mode 100644 package/gtk2-engines/gtk2-engines.hash
 delete mode 100644 package/gtk2-engines/gtk2-engines.mk
 delete mode 100644 package/gtkperf/Config.in
 delete mode 100644 package/gtkperf/gtkperf.hash
 delete mode 100644 package/gtkperf/gtkperf.mk
 delete mode 100644 package/leafpad/Config.in
 delete mode 100644 package/leafpad/leafpad.hash
 delete mode 100644 package/leafpad/leafpad.mk
 delete mode 100644 package/libglade/Config.in
 delete mode 100644 package/libglade/libglade.hash
 delete mode 100644 package/libglade/libglade.mk
 delete mode 100644 package/libgtk2/0001-reduce-dependencies.patch
 delete mode 100644 package/libgtk2/Config.in
 delete mode 100644 package/libgtk2/libgtk2.hash
 delete mode 100644 package/libgtk2/libgtk2.mk
 delete mode 100644 package/libsexy/Config.in
 delete mode 100644 package/libsexy/libsexy.hash
 delete mode 100644 package/libsexy/libsexy.mk
 delete mode 100644 package/metacity/0001-add-libm-reference.patch
 delete mode 100644 package/metacity/0002-gconf.patch
 delete mode 100644 package/metacity/0003-mag-add-libm-reference.patch
 delete mode 100644 package/metacity/Config.in
 delete mode 100755 package/metacity/Xsession
 delete mode 100644 package/metacity/metacity.hash
 delete mode 100644 package/metacity/metacity.mk
 delete mode 100644 package/sylpheed/0001-harden-link-checker-before-accepting-click.patch
 delete mode 100644 package/sylpheed/Config.in
 delete mode 100644 package/sylpheed/sylpheed.hash
 delete mode 100644 package/sylpheed/sylpheed.mk
 delete mode 100644 package/xscreensaver/Config.in
 delete mode 100644 package/xscreensaver/xscreensaver.hash
 delete mode 100644 package/xscreensaver/xscreensaver.mk

-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
