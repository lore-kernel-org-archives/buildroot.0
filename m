Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D25EC00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 19:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 166EA414E4;
	Sun, 31 Jul 2022 19:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 166EA414E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cxPLm_aEayMO; Sun, 31 Jul 2022 19:36:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AC26414E6;
	Sun, 31 Jul 2022 19:36:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AC26414E6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8441B1BF2EB
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C06082977
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:35:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C06082977
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IaM2E5il69EM for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 19:35:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A2CD8294A
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [IPv6:2607:f8b0:4864:20::e2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A2CD8294A
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 19:35:57 +0000 (UTC)
Received: by mail-vs1-xe2d.google.com with SMTP id x125so9255442vsb.13
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 12:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Df3R8gAkXeASnmDtENB2eq/7Y7zV3Vr2Uz2upxUFvx4=;
 b=23H0oGfvWE98RPYO9O+hT70mbBScY5E1S3okV42EymWD3DjFC8GJz8+WCYU1n028HB
 o+KbDhyl8OVWtjn1J7eRnPd9HwxDGfLIqtbGPYTZPIGbonnXCr2NxRMDT1nBC5fd7y5h
 2jWrxrzrfCVZn5gDoS5sbqZpBy70y1TTiNZwmVyB3cFtwt/ea1jCpShE9OAGXGthkeAQ
 MAHU1vXEmr/qPdqErDvq9rTOksarBi4g2ertJj76QdRP90KrUB21uQmJntFcpTlIWcCv
 XFP/G943nWklYCaszGbJdu2KrrxKCZNDrnNvD5rkdEbMKypujCU94ITILDJ61s65Wmh7
 QSjg==
X-Gm-Message-State: AJIora+0drC1QICtiZ3PdwbjmkWkNk5u9I/2iGPwY57V9BrG/B07owcs
 JabcvOixnnz52L94mQ0oIvZp3zV3Rt4=
X-Google-Smtp-Source: AGRyM1uLidFxipeEusZ9Cc+NqxCXVwQuJz03IzIQ6jIBfGQ7ORiY/qDIMB8PabDmtJtjlqCyYl6WGg==
X-Received: by 2002:a67:e997:0:b0:358:535e:fccc with SMTP id
 b23-20020a67e997000000b00358535efcccmr4248208vso.63.1659296155988; 
 Sun, 31 Jul 2022 12:35:55 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a056102074500b0037ddf9489f2sm1418667vsg.13.2022.07.31.12.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 12:35:54 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 31 Jul 2022 16:35:11 -0300
Message-Id: <20220731193521.1217825-5-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
References: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Df3R8gAkXeASnmDtENB2eq/7Y7zV3Vr2Uz2upxUFvx4=;
 b=DhIBu3fGXEjQdTi2jSSzxdxDiajaj4ER7anCVeFua4nKGzbD8kz89OvIQWi34y+C/d
 Dvx774WjPM2d5p6UcFDqKxPwzgZIPY9Hm/eY6hgGPBmMZ9Vy2k9ZxAtjpNhKcnaxevoR
 AFcUZiBhpcXtkTgbI6uI7r930FRMRGo4fvJ1aGFxB0hgogx3SEYjdVO57ydSERfR7cFB
 HJ+K7s5JiR2ExFDcQgyAAPrCPW3sCQ18b4vhllJaXtr5BTNjwQcEZ4bUSwzU3JJLVYvL
 +sBK1puGItnMD4ZX/2iYm1nwp9VNVXUXleAcKuGh6lcksHT47IoaIClWtQIjm02bIjsh
 wQwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DhIBu3fG
Subject: [Buildroot] [PATCH v2 04/14] Makefile: make check-package assume a
 git tree
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

... just like check-flake8 already does.

When a new check_function is added to check-package, often there are
files in the tree that would generate warnings.

An example is the Sob check_function for patch files:
| $ ./utils/check-package --i Sob $(git ls-files) >/dev/null
| 369301 lines processed
| 46 warnings generated
Currently these warnings are listed when calling check-package directly,
and also at the output of pkg-stats, but the check_function does not run
on 'make check-package' (that is used to catch regressions on GitLab CI
'check-package' job) until all warnings in the tree are fixed.
This (theoretically) allows new .patch files be added without SoB,
without the GitLab CI catching it.

Since now check-package has an ignore file to list all warnings in the
tree, that will eventually be fixed, there is no need to filter the
files passed to check-package.
So test all files in the tree when 'make check-package' is called.
It brings following advantages;
- any new check_function added to check-package takes place immediately
  for new files;
- adding new check_functions is less traumatic to the developer doing
  this, since he/she does not need anymore to fix all warnings in the
  tree before the new check_function takes effect;
- prevent regressions, e.g. ANY new .patch file must have SoB;
- as a side-effect, print a single statistics line as output of
  'make ckeck-package'.

But just enabling the check would generate many warnings when
'make check-package' is called, so update the ignore file by using:
$ ./utils/docker-run make .checkpackageignore

Notice: in order to ensure reproducible results, one should run 'make
check-package' and 'make .checkpackageignore' inside the docker image,
otherwise a variation in shellcheck version (installed in the host) can
produce different results.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v2:
  - use 'make .checkpackageignore' created on previous patch
  - update the ignored list of warnings for current master branch
  - use Sob as example in the commit message, since the Hashes were fixed

NOTE to the maintainer applying this patch: please re-generate the list
of ignored warnings while applying:
$ ./utils/docker-run make .checkpackageignore
---
 .checkpackageignore | 185 ++++++++++++++++++++++++++++++++++++++++++++
 Makefile            |   7 +-
 2 files changed, 188 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index e69de29bb2..d8947e89fc 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -0,0 +1,185 @@
+package/alsamixergui/0001-misc-fixes.patch Sob
+package/am33x-cm3/S93-am335x-pm-firmware-load Variables
+package/android-tools/0008-Include-sysmacros.h-to-compile-with-glibc-2.28.patch Sob
+package/apache/S50apache Indent Shellcheck Variables
+package/at/S99at Indent Variables
+package/audit/S02auditd Shellcheck Variables
+package/avahi/S05avahi-setup.sh Indent Variables
+package/avahi/S50avahi-daemon Indent Variables
+package/babeld/S50babeld Indent Shellcheck Variables
+package/bind/S81named Indent Shellcheck Variables
+package/bluez5_utils/S40bluetooth NotExecutable Variables
+package/boinc/S99boinc-client Indent Shellcheck Variables
+package/brickd/S70brickd Indent Shellcheck Variables
+package/brltty/S10brltty Indent Shellcheck Variables
+package/busybox/S02sysctl Variables
+package/busybox/S10mdev ConsecutiveEmptyLines Indent Shellcheck
+package/busybox/S15watchdog Indent Variables
+package/busybox/S50telnet Indent Shellcheck Variables
+package/c-icap/S96cicap Indent Shellcheck Variables
+package/cfm/S65cfm Indent Variables
+package/cgroupfs-mount/S30cgroupfs Indent Shellcheck Variables
+package/chrony/S49chrony Indent Shellcheck Variables
+package/connman/S45connman Variables
+package/curlftpfs/0001-fix-CURLOPT_INFILESIZE.patch Sob
+package/curlftpfs/0002-free_ftpfs_file-memleak-fix.patch Sob
+package/curlftpfs/0003-nocache-memleak-fix.patch Sob
+package/dante/S50dante Indent Shellcheck Variables
+package/darkhttpd/S50darkhttpd Indent Shellcheck Variables
+package/dbus/S30dbus Indent Shellcheck TrailingSpace Variables
+package/dcron/S90dcron Variables
+package/dhcp/S80dhcp-relay Shellcheck Variables
+package/dhcp/S80dhcp-server Shellcheck Variables
+package/dhcpcd/S41dhcpcd Indent Variables
+package/dhrystone/0001-cmdline-nruns.patch Sob
+package/dhrystone/0002-HZ.patch Sob
+package/dhrystone/0003-exit.patch Sob
+package/dhrystone/0004-headers.patch Sob
+package/dhrystone/0005-prototypes.patch Sob
+package/directfb-examples/0001-remove-bzero.patch Sob
+package/dmraid/S20dmraid Variables
+package/dnsmasq/S80dnsmasq Shellcheck Variables
+package/docker-engine/S60dockerd Indent Shellcheck Variables
+package/domoticz/S99domoticz Shellcheck
+package/dropbear/S50dropbear Indent Shellcheck Variables
+package/earlyoom/S02earlyoom Indent Shellcheck
+package/ejabberd/S50ejabberd Indent Shellcheck Variables
+package/eudev/S10udev ConsecutiveEmptyLines Indent Shellcheck Variables
+package/exim/S86exim Indent Variables
+package/fail2ban/S60fail2ban Shellcheck Variables
+package/fbv/0001-cross.patch Sob
+package/fbv/0002-fix-24bpp-support-on-big-endian.patch Sob
+package/fbv/0005-include.patch Sob
+package/freescale-imx/imx-uuc/S80imx-uuc Indent Shellcheck Variables
+package/frr/S50frr Shellcheck
+package/gamin/0002-no-const-return.patch Sob
+package/gcc/arc-2020.09-release/0002-libsanitizer-Remove-cyclades-from-libsanitizer.patch Sob
+package/genromfs/0001-build-system.patch Sob
+package/gerbera/S99gerbera Indent
+package/go/0002-cmd-dist-use-gohostarch-for-ssa-rewrite-check.patch Sob
+package/gpsd/S50gpsd Indent Shellcheck Variables
+package/haveged/S21haveged Shellcheck Variables
+package/htpdate/S43htpdate Shellcheck
+package/i2pd/S99i2pd Indent Shellcheck Variables
+package/ifplugd/0001-cross.patch Sob
+package/ifplugd/0002-fix-headers.patch Sob
+package/ifupdown-scripts/S40network EmptyLastLine Indent Shellcheck Variables
+package/igd2-for-linux/S99upnpd Indent Shellcheck Variables
+package/inadyn/S70inadyn Indent NotExecutable
+package/input-event-daemon/S99input-event-daemon ConsecutiveEmptyLines Indent Variables
+package/iptables/S35iptables Shellcheck
+package/irda-utils/0001-daemon.patch Sob
+package/irda-utils/0002-nommu.patch Sob
+package/irda-utils/0003-subdir.patch Sob
+package/irqbalance/S13irqbalance Indent Shellcheck Variables
+package/iucode-tool/S00iucode-tool Variables
+package/iwd/S40iwd Shellcheck Variables
+package/keyutils/0002-cifs.patch Sob
+package/kodi/S50kodi Shellcheck Variables
+package/libart/0001-art-config-cross.patch Sob
+package/libcgicc/0001-disable-documentation-option.patch Sob
+package/libfcgi/0002-disable-examples.patch Sob
+package/libftdi/0001-pkgconfig_libusb.patch Sob
+package/libftdi/0002-libftdi.pc-requires-libusb-fix-static-build.patch Sob
+package/libiio/S99iiod Shellcheck Variables
+package/libmad/0001-mips-h-constraint-removal.patch Sob
+package/lighttpd/S50lighttpd EmptyLastLine Indent Shellcheck Variables
+package/linux-tools/S10hyperv Indent Variables
+package/linuxptp/S65ptp4l Indent Shellcheck
+package/linuxptp/S66phc2sys Indent Shellcheck
+package/lirc-tools/S25lircd Indent Variables
+package/lite/0001-dfbspy-stat.patch Sob
+package/lite/0002-no-tests.patch Sob
+package/lite/0003-pkg-config.patch Sob
+package/lldpd/S60lldpd Indent Shellcheck Variables
+package/lockfile-progs/0001-sus3v-legacy.patch Sob
+package/madplay/0001-switch-to-new-alsa-api.patch Sob
+package/mariadb/S97mysqld Indent Shellcheck Variables
+package/mender-connect/S43mender-connect Shellcheck
+package/mii-diag/0001-strchr.patch Sob
+package/minidlna/S60minidlnad Indent Shellcheck Variables
+package/minissdpd/S50minissdpd Indent Shellcheck Variables
+package/modem-manager/S44modem-manager Shellcheck Variables
+package/mosquitto/S50mosquitto Indent Shellcheck Variables
+package/motion/S99motion Indent Shellcheck Variables
+package/mpd/S95mpd Variables
+package/mrouted/S41mrouted NotExecutable
+package/mrp/S65mrp Indent Variables
+package/multipath-tools/S60multipathd Shellcheck
+package/neard/S53neard Indent Shellcheck Variables
+package/netatalk/S50netatalk EmptyLastLine Indent Variables
+package/netcat/0001-signed-bit-counting.patch Sob
+package/netopeer2/S52netopeer2 Shellcheck Variables
+package/netplug/0001-makefile-flags.patch Sob
+package/netplug/S29netplug Indent Shellcheck Variables
+package/netsnmp/S59snmpd Indent Shellcheck Variables
+package/network-manager/S45network-manager ConsecutiveEmptyLines EmptyLastLine Shellcheck Variables
+package/nfs-utils/S60nfs ConsecutiveEmptyLines Shellcheck Variables
+package/nginx/S50nginx Indent Variables
+package/nodm/S90nodm Indent Shellcheck Variables
+package/nss-pam-ldapd/S45nslcd EmptyLastLine Indent Shellcheck Variables
+package/ntp/S49ntp.in Variables
+package/ofono/S46ofono Variables
+package/olsr/S50olsr Indent Shellcheck Variables
+package/openntpd/S49ntp Shellcheck Variables
+package/openssh/S50sshd EmptyLastLine Indent Variables
+package/openvpn/S60openvpn Indent Shellcheck Variables
+package/optee-client/S30optee Indent Shellcheck Variables
+package/oracle-mysql/S97mysqld Shellcheck Variables
+package/owfs/S55owserver Shellcheck Variables
+package/owfs/S60owfs Shellcheck Variables
+package/pigpio/S50pigpio Shellcheck Variables
+package/polkit/S50polkit NotExecutable Shellcheck Variables
+package/postgresql/S50postgresql Variables
+package/procps-ng/S02sysctl Variables
+package/proftpd/S50proftpd Indent Shellcheck Variables
+package/prosody/S50prosody Indent Shellcheck Variables
+package/ptpd/S65ptpd Indent Shellcheck Variables
+package/ptpd2/S65ptpd2 Indent Shellcheck Variables
+package/pulseaudio/S50pulseaudio ConsecutiveEmptyLines EmptyLastLine Indent Variables
+package/python-huepy/0001-fix-import-with-python3.patch Sob
+package/python-web2py/S51web2py Shellcheck Variables
+package/rabbitmq-server/S50rabbitmq-server Indent Shellcheck Variables
+package/rdesktop/0001-8bit-colors.patch Sob
+package/redis/S50redis Shellcheck Variables
+package/restorecond/S02restorecond Shellcheck
+package/rng-tools/S21rngd Shellcheck Variables
+package/rpcbind/S30rpcbind EmptyLastLine Indent Variables
+package/rubix/0002-misc-fixes.patch Sob
+package/rygel/S99rygel Indent Shellcheck Variables
+package/samba4/S91smb Indent Shellcheck Variables
+package/seatd/S70seatd NotExecutable Variables
+package/ser2net/S50ser2net Indent Shellcheck Variables
+package/shairport-sync/S99shairport-sync Indent Shellcheck Variables
+package/smcroute/S41smcroute Indent NotExecutable Variables
+package/smstools3/S50smsd Shellcheck Variables
+package/solarus/0002-Add-a-basic-FindOpenGLES2.cmake.patch Sob
+package/squid/S97squid Indent Shellcheck Variables
+package/ssdp-responder/S50ssdpd Indent NotExecutable Shellcheck Variables
+package/sshguard/S49sshguard Indent
+package/sslh/S35sslh Indent Shellcheck Variables
+package/stunnel/S50stunnel Indent Shellcheck Variables
+package/supervisor/S99supervisord Variables
+package/suricata/S99suricata Shellcheck
+package/sysrepo/S51sysrepo-plugind Indent Shellcheck
+package/targetcli-fb/S50target Shellcheck Variables
+package/tcf-agent/S55tcf-agent Shellcheck Variables
+package/tftpd/S80tftpd-hpa Indent Shellcheck Variables
+package/ti-gfx/S80ti-gfx Shellcheck Variables
+package/ti-sgx-um/S80ti-sgx Variables
+package/tpm2-abrmd/S80tpm2-abrmd Indent Shellcheck Variables
+package/transmission/S92transmission ConsecutiveEmptyLines Indent Shellcheck Variables
+package/triggerhappy/S10triggerhappy Indent Shellcheck Variables
+package/tvheadend/S99tvheadend Indent Shellcheck Variables
+package/unbound/S70unbound Shellcheck
+package/unscd/S46unscd Indent Shellcheck Variables
+package/upmpdcli/S99upmpdcli Indent Shellcheck Variables
+package/urandom-scripts/S20urandom Variables
+package/usbguard/S20usbguard Indent Shellcheck Variables
+package/vsftpd/S70vsftpd Indent Shellcheck Variables
+package/watchdogd/S01watchdogd Indent NotExecutable
+package/x11r7/xapp_xdm/S99xdm Indent Variables
+package/x11r7/xdriver_xf86-video-mach64/0001-cross-compile.patch Sob
+package/x11r7/xdriver_xf86-video-savage/0001-cross-compile.patch Sob
+package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch Sob
+package/x11r7/xserver_xorg-server/S40xorg Shellcheck Variables
diff --git a/Makefile b/Makefile
index e49080b110..c5dee409f1 100644
--- a/Makefile
+++ b/Makefile
@@ -1241,13 +1241,12 @@ check-flake8:
 	| xargs -- python3 -m flake8 --statistics
 
 check-package:
-	find $(TOPDIR) -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' -o -name '*.patch' \) \
-		-exec ./utils/check-package --exclude=Sob {} +
+	$(Q)./utils/check-package `git ls-tree -r --name-only HEAD`
 
 .PHONY: .checkpackageignore
 .checkpackageignore:
-	find $(TOPDIR) -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' -o -name '*.patch' \) \
-		-exec ./utils/check-package --exclude=Sob --failed-only {} > .checkpackageignore +
+	$(Q)./utils/check-package --failed-only `git ls-tree -r --name-only HEAD` \
+		> .checkpackageignore
 
 include docs/manual/manual.mk
 -include $(foreach dir,$(BR2_EXTERNAL_DIRS),$(sort $(wildcard $(dir)/docs/*/*.mk)))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
