Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0941C6379F
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 872854F25C;
	Tue, 21 Feb 2023 00:19:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 872854F25C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CVaCdxrS2ufj; Tue, 21 Feb 2023 00:19:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9522B4F26F;
	Tue, 21 Feb 2023 00:19:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9522B4F26F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2EAA71BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9AFE417CE
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9AFE417CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IM0wloY2VLyU for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 848EA417C3
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 848EA417C3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74FDF86496; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 18:54:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dd28acc1e8085c15d12e233090550580dafe1f96
X-Git-Newrev: aeec8faf3189b5dde90c465a9b14897406b1fc08
X-Patchwork-Hint: ignore
Message-Id: <20230220205250.74FDF86496@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Makefile: make check-package
 assume a git tree
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

commit: https://git.buildroot.net/buildroot/commit/?id=aeec8faf3189b5dde90c465a9b14897406b1fc08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore | 180 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 Makefile            |   8 +--
 2 files changed, 183 insertions(+), 5 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index e69de29bb2..b1f2d99b99 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -0,0 +1,180 @@
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
+package/oracle-mysql/S97mysqld Shellcheck Variables
+package/owfs/S55owserver Shellcheck Variables
+package/owfs/S60owfs Shellcheck Variables
+package/pigpio/S50pigpio Shellcheck Variables
+package/poco/0001-Fix-optional-JSON-support-for-MySQL-3753.patch Sob
+package/postgresql/S50postgresql Variables
+package/procps-ng/S02sysctl Variables
+package/proftpd/S50proftpd Indent Shellcheck Variables
+package/prosody/S50prosody Indent Shellcheck Variables
+package/ptpd/S65ptpd Indent Shellcheck Variables
+package/ptpd2/S65ptpd2 Indent Shellcheck Variables
+package/pulseaudio/S50pulseaudio ConsecutiveEmptyLines EmptyLastLine Indent Variables
+package/python-web2py/S51web2py Shellcheck Variables
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
index 817cfed13c..49ee4ff119 100644
--- a/Makefile
+++ b/Makefile
@@ -1257,14 +1257,12 @@ check-flake8:
 	| xargs -- python3 -m flake8 --statistics
 
 check-package:
-	find $(TOPDIR) -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' -o -name '*.patch' \) \
-		-a -not -name '*.orig' -a -not -name '*.rej' \
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
