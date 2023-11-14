Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F09CC4332F
	for <buildroot@archiver.kernel.org>; Tue, 14 Nov 2023 18:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3864613B5;
	Tue, 14 Nov 2023 18:18:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3864613B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mEPsQad_lXkK; Tue, 14 Nov 2023 18:18:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC3696114C;
	Tue, 14 Nov 2023 18:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC3696114C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B17121BF3CB
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 18:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 974BB41D77
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 18:18:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 974BB41D77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id clwFK7aGq0b6 for <buildroot@lists.busybox.net>;
 Tue, 14 Nov 2023 18:18:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B532C41BD1
 for <buildroot@buildroot.org>; Tue, 14 Nov 2023 18:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B532C41BD1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F8FF86BC9; Tue, 14 Nov 2023 18:18:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Nov 2023 19:15:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5c9f4d64de3b7d87909393c45cf98734645678ba
X-Git-Newrev: 41978f360ac35361b2680fb4e84fa59003e56a5a
X-Patchwork-Hint: ignore
Message-Id: <20231114181849.9F8FF86BC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.08.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=41978f360ac35361b2680fb4e84fa59003e56a5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8ad64e724c37fbf7624136e95441b6ddb82de982)
[Peter: drop Makefile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 49 ++++++++++++++++++++++++++++++++++++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index 585f4e9380..49b8dba4a9 100644
--- a/CHANGES
+++ b/CHANGES
@@ -86,6 +86,55 @@
 	#15826: nodejs modules with native extensions fail to install
 	#15835: Incompatibility between network-manager and libcurl 8.4
 
+2023.08.3, released November 14th, 2023
+
+	Important / security related fixes.
+
+	Per-package builds: Unbreak SDK relocation logic. Only drop
+	the hard links for the final host / target directory, fixing a
+	build time / size regression in 2023.08.2.
+
+	Packages where a free-form version/site can be specified
+	(E.G. Linux, U-Boot, ..) can now have the corresponding
+	tarballs of these custom downloads checked by the download
+	infrastructure based on .hash files in the global patch
+	directory. These hashes are optional unless
+	BR2_DOWNLOAD_FORCE_CHECK_HASHES is enabled.
+
+	A utils/add-custom-hashes helper script has been added to
+	assist in managing such hash files.
+
+	Defconfigs: Avenger96: Downgrade to TF-A v2.5 to fix boot
+	issue since 2023.08, stm32mp157a-dk1, stm32mp157c-dk2: Unbreak
+	TF-A build, stm32mp157c-odessey: Use a fixed TF-A version for
+	reproducibility
+
+	Updated/fixed packages: apache, arm-trusted-firmware, aufs,
+	aufs-util, azure-iot-sdk, casync, cjson, clamav, conmon,
+	cups-filters, dhcpcd, docker-cli, docker-engine,
+	freeradius-server, go, inadyn, ksmbd-tools, kvmtool,
+	libgdiplus, libgeos, libmemcached, libmdbx, libopenssl,
+	libosmium, libtommath, libupnp, libzlib, lightning, linux-pam,
+	lxc, mender, minizip-zlib, mpd, mxsldr, nano, nettle,
+	network-manager, nghttp2, nodejs-src, opencv4,
+	opencv4-contrib, openjdk-bin, openvpn, opusfile, paho-mqtt-c,
+	pango, perl-lwp-protocol-https, petitboot, php, pistache,
+	python-django, python-pycryptodomex, python-urllib3,
+	python-web2py, rabbitmq-c, redis, reproc,
+	riscv64-elf-toolchain, sedutil, snort3, suricata, tar, tiff,
+	tor, traceroute, vim, websocketpp, wireshark, wolfssl,
+	xdg-dbus-proxy, xen, xlib_libX11, xlib_libXpm, zabbix, zchunk
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14741: e2fsck is failing during cronjob build where fail...
+	#15772: lz4 failed to compile with gcc 10.4.0
+	#15787: atmel_sama5d3_xplained_mmc_defconfig: Missing...
+	#15790: at91sam9x5ek_dev_defconfig: Missing...
+	#15820: make linux-menuconfig does not modify correct .config..
+	#15823: Installing nodejs modules with native extensions ...
+	#15835: Incompatibility between network-manager and libcurl 8.4
+
 2023.08.2, released October 15th, 2023
 
 	Important / security related fixes.
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 1d42a647ac..250a8810e5 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2023.08.2'
+RELEASE='2023.08.3'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
