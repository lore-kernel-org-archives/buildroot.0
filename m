Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F76C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 05:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 743D540B36;
	Sun, 24 Jul 2022 05:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 743D540B36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3slKP9_nG9JZ; Sun, 24 Jul 2022 05:51:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65E2A400F1;
	Sun, 24 Jul 2022 05:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65E2A400F1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 572721BF59B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3175F840B2
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3175F840B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uu8oYsnDZ0Ud for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 05:50:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BA3D83385
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BA3D83385
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 05:50:37 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id s204so9927178oif.5
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 22:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ZdoM8j+xQhpxG6wDGr1N4nzj3k8OVn1MX8xx6td4tGg=;
 b=d89kbQ+htstnmJ7G6pM0/Y2BBBXJ0sbe0gPO6E8RNhuIKU+T/bNpqNa+8reHIQDOeE
 jmVM98VExAZzTt7CVouqifQOxO1oAKwADtWP3a1SQWRBtAjhnJNvrPnsZ/W+X5qkekSO
 uGMTQNgtNdikCeurow2SIx5aFClt6PJ5Py3HHkKR38N7aK7SS4A/HYGgmafe8Zocras+
 2h0sohQk/xJ/koXTJGlTf6QlUFeQG0u6v9uh/wbASHhyjv0AK320xiEddhb2Cdt0TwuZ
 ak2shyx8NpRxFkyIh/B7jJ7l98mwOOb11h9Ve3hlh3OCvJZAHXK2CaRLntukdbA1qQkT
 UYFg==
X-Gm-Message-State: AJIora8DFmHAzWXbII5kjfwLYx7Moh8+g3rDymiKW8apIhF9JAp1aVBr
 N7ABlKnHfrx5QPXqRXdOi+OtLMe6tf0=
X-Google-Smtp-Source: AGRyM1vwldwBH2RkW4F7p+mokH+iHZcMG5dbWJv1u+ljqVdzZoWPeZkcnAc5iuyyewR8kfpSVpFmAw==
X-Received: by 2002:aca:1c10:0:b0:33a:c08d:b879 with SMTP id
 c16-20020aca1c10000000b0033ac08db879mr3607881oic.60.1658641835986; 
 Sat, 23 Jul 2022 22:50:35 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a056870818d00b000f5d8d031b6sm4236969oae.49.2022.07.23.22.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 22:50:34 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 02:49:02 -0300
Message-Id: <20220724054912.2354219-7-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
References: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ZdoM8j+xQhpxG6wDGr1N4nzj3k8OVn1MX8xx6td4tGg=;
 b=epD+RECf63Z0pn4rxbpUC09cwjNkCamhEXxpz1ZTRyJ1sXQ04/tvERJwpgBiOdEdvf
 Tp4BLCpQaBL6X8QL3tfM5uDFjDeT/e7GWOMe2YLwviI89M0FsX3DYEmynt2+g1xEr3UF
 3IQBzsZc7+YDb+82w9dUfaTVk+iK/RsMkhgkmPfjY1KkQ5VaEChA7GxKR+9KS9Nk+iQc
 mZsLWD9YyX+ZAAx0jCqEk5B4GCitZ/+DJi8NXXbrG8h2qwJG4v/ibkGzc4e43Qg+jhBQ
 /J5e7nJbg9riqNP2EYpF/HA9/v2wwQFeWPtS8SoF3g8C1mLhPV35OJvaWDfdT1UT+YXU
 fsnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=epD+RECf
Subject: [Buildroot] [PATCH 06/16] Makefile: make check-package assume a git
 tree
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
- prevent regressions, e.g. ANY new .hash file must have 2 spaces;
- as a side-effect, print a single statistics line as output of
  'make ckeck-package'.

But just enabling the check would generate many warnings when
'make check-package' is called, so update the ignore file by using:
$ ./utils/docker-run
br-user@...$ ./utils/check-package --failed-only \
               `git ls-tree -r --name-only HEAD` > .checkpackageignore

Notice: in order to ensure reproducible results, one should run
'make check-package' inside the docker image, otherwise a variation in
shellcheck version (installed in the host) can produce different
results.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
NOTE to the maintainer applying this patch: please re-generate the list
of ignored warnings while applying:
$ ./utils/docker-run
br-user@...$ ./utils/check-package --failed-only `git ls-tree -r --name-only HEAD` > .checkpackageignore
---
 .checkpackageignore | 922 ++++++++++++++++++++++++++++++++++++++++++++
 Makefile            |   3 +-
 2 files changed, 923 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index e69de29bb2..98099508ba 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -0,0 +1,922 @@
+boot/binaries-marvell/binaries-marvell.hash HashSpaces
+boot/s500-bootloader/s500-bootloader.hash HashSpaces
+boot/shim/shim.hash HashSpaces
+package/abootimg/abootimg.hash HashSpaces
+package/acpitool/acpitool.hash HashSpaces
+package/aespipe/aespipe.hash HashSpaces
+package/alsamixergui/0001-misc-fixes.patch Sob
+package/alsamixergui/alsamixergui.hash HashSpaces
+package/alure/alure.hash HashSpaces
+package/am33x-cm3/S93-am335x-pm-firmware-load Variables
+package/android-tools/0008-Include-sysmacros.h-to-compile-with-glibc-2.28.patch Sob
+package/android-tools/android-tools.hash HashSpaces
+package/angular-websocket/angular-websocket.hash HashSpaces
+package/aoetools/aoetools.hash HashSpaces
+package/apache/S50apache Indent Shellcheck Variables
+package/apr-util/apr-util.hash HashSpaces
+package/apr/apr.hash HashSpaces
+package/argparse/argparse.hash HashSpaces
+package/argus/argus.hash HashSpaces
+package/arm-gnu-toolchain/arm-gnu-toolchain.hash HashSpaces
+package/arp-scan/arp-scan.hash HashSpaces
+package/arptables/arptables.hash HashSpaces
+package/ascii-invaders/ascii-invaders.hash HashSpaces
+package/asterisk/asterisk.hash HashSpaces
+package/at/S99at Indent Variables
+package/atest/atest.hash HashSpaces
+package/atf/atf.hash HashSpaces
+package/aubio/aubio.hash HashSpaces
+package/audit/S02auditd Shellcheck Variables
+package/autossh/autossh.hash HashSpaces
+package/avahi/S05avahi-setup.sh Indent Variables
+package/avahi/S50avahi-daemon Indent Variables
+package/avahi/avahi.hash HashSpaces
+package/b43-firmware/b43-firmware.hash HashSpaces
+package/b43-fwcutter/b43-fwcutter.hash HashSpaces
+package/babeld/S50babeld Indent Shellcheck Variables
+package/bc/bc.hash HashSpaces
+package/bcache-tools/bcache-tools.hash HashSpaces
+package/bcg729/bcg729.hash HashSpaces
+package/bdwgc/bdwgc.hash HashSpaces
+package/berkeleydb/berkeleydb.hash HashSpaces
+package/bind/S81named Indent Shellcheck Variables
+package/biosdevname/biosdevname.hash HashSpaces
+package/bitstream/bitstream.hash HashSpaces
+package/bluez5_utils/S40bluetooth NotExecutable Variables
+package/boinc/S99boinc-client Indent Shellcheck Variables
+package/bonnie/bonnie.hash HashSpaces
+package/brickd/S70brickd Indent Shellcheck Variables
+package/brltty/S10brltty Indent Shellcheck Variables
+package/bsdiff/bsdiff.hash HashSpaces
+package/busybox/S02sysctl Variables
+package/busybox/S10mdev ConsecutiveEmptyLines Indent Shellcheck
+package/busybox/S15watchdog Indent Variables
+package/busybox/S50telnet Indent Shellcheck Variables
+package/bzip2/bzip2.hash HashSpaces
+package/c-icap/S96cicap Indent Shellcheck Variables
+package/cache-calibrator/cache-calibrator.hash HashSpaces
+package/cage/cage.hash HashSpaces
+package/cairo/cairo.hash HashSpaces
+package/caps/caps.hash HashSpaces
+package/cbootimage/cbootimage.hash HashSpaces
+package/cctz/cctz.hash HashSpaces
+package/cfm/S65cfm Indent Variables
+package/cgic/cgic.hash HashSpaces
+package/cgilua/cgilua.hash HashSpaces
+package/cgroupfs-mount/S30cgroupfs Indent Shellcheck Variables
+package/chartjs/chartjs.hash HashSpaces
+package/chipmunk/chipmunk.hash HashSpaces
+package/chrony/S49chrony Indent Shellcheck Variables
+package/cmocka/cmocka.hash HashSpaces
+package/collectd/collectd.hash HashSpaces
+package/comix-cursors/comix-cursors.hash HashSpaces
+package/connman-gtk/connman-gtk.hash HashSpaces
+package/connman/S45connman Variables
+package/conntrack-tools/conntrack-tools.hash HashSpaces
+package/copas/copas.hash HashSpaces
+package/coxpcall/coxpcall.hash HashSpaces
+package/cpio/cpio.hash HashSpaces
+package/cppdb/cppdb.hash HashSpaces
+package/cppunit/cppunit.hash HashSpaces
+package/cpuburn-arm/cpuburn-arm.hash HashSpaces
+package/cpuload/cpuload.hash HashSpaces
+package/cracklib/cracklib.hash HashSpaces
+package/ctorrent/ctorrent.hash HashSpaces
+package/cunit/cunit.hash HashSpaces
+package/curlftpfs/0001-fix-CURLOPT_INFILESIZE.patch Sob
+package/curlftpfs/0002-free_ftpfs_file-memleak-fix.patch Sob
+package/curlftpfs/0003-nocache-memleak-fix.patch Sob
+package/curlpp/curlpp.hash HashSpaces
+package/cwiid/cwiid.hash HashSpaces
+package/cxxtest/cxxtest.hash HashSpaces
+package/czmq/czmq.hash HashSpaces
+package/dacapo/dacapo.hash HashSpaces
+package/dado/dado.hash HashSpaces
+package/dante/S50dante Indent Shellcheck Variables
+package/darkhttpd/S50darkhttpd Indent Shellcheck Variables
+package/datatables-buttons/datatables-buttons.hash HashSpaces
+package/datatables-fixedcolumns/datatables-fixedcolumns.hash HashSpaces
+package/datatables-responsive/datatables-responsive.hash HashSpaces
+package/datatables/datatables.hash HashSpaces
+package/dbus/S30dbus Indent Shellcheck TrailingSpace Variables
+package/dc3dd/dc3dd.hash HashSpaces
+package/dcron/S90dcron Variables
+package/debianutils/debianutils.hash HashSpaces
+package/dhcp/S80dhcp-relay Shellcheck Variables
+package/dhcp/S80dhcp-server Shellcheck Variables
+package/dhcpcd/S41dhcpcd Indent Variables
+package/dhcpdump/dhcpdump.hash HashSpaces
+package/dhrystone/0001-cmdline-nruns.patch Sob
+package/dhrystone/0002-HZ.patch Sob
+package/dhrystone/0003-exit.patch Sob
+package/dhrystone/0004-headers.patch Sob
+package/dhrystone/0005-prototypes.patch Sob
+package/dhrystone/dhrystone.hash HashSpaces
+package/dieharder/dieharder.hash HashSpaces
+package/directfb-examples/0001-remove-bzero.patch Sob
+package/dmraid/S20dmraid Variables
+package/dmraid/dmraid.hash HashSpaces
+package/dnsmasq/S80dnsmasq Shellcheck Variables
+package/docker-compose/docker-compose.hash HashSpaces
+package/docker-engine/S60dockerd Indent Shellcheck Variables
+package/domoticz/S99domoticz Shellcheck
+package/doom-wad/doom-wad.hash HashSpaces
+package/dropbear/S50dropbear Indent Shellcheck Variables
+package/dt/dt.hash HashSpaces
+package/dump1090/dump1090.hash HashSpaces
+package/dvblast/dvblast.hash HashSpaces
+package/dvdauthor/dvdauthor.hash HashSpaces
+package/e2tools/e2tools.hash HashSpaces
+package/earlyoom/S02earlyoom Indent Shellcheck
+package/ecryptfs-utils/ecryptfs-utils.hash HashSpaces
+package/efivar/efivar.hash HashSpaces
+package/ejabberd/S50ejabberd Indent Shellcheck Variables
+package/elftosb/elftosb.hash HashSpaces
+package/elixir/elixir.hash HashSpaces
+package/emlog/emlog.hash HashSpaces
+package/enscript/enscript.hash HashSpaces
+package/erlang-base64url/erlang-base64url.hash HashSpaces
+package/erlang-goldrush/erlang-goldrush.hash HashSpaces
+package/erlang-rebar/erlang-rebar.hash HashSpaces
+package/eudev/S10udev ConsecutiveEmptyLines Indent Shellcheck Variables
+package/exfat-utils/exfat-utils.hash HashSpaces
+package/exfat/exfat.hash HashSpaces
+package/exim/S86exim Indent Variables
+package/f2fs-tools/f2fs-tools.hash HashSpaces
+package/fail2ban/S60fail2ban Shellcheck Variables
+package/fan-ctrl/fan-ctrl.hash HashSpaces
+package/fbdump/fbdump.hash HashSpaces
+package/fbterm/fbterm.hash HashSpaces
+package/fbv/0001-cross.patch Sob
+package/fbv/0002-fix-24bpp-support-on-big-endian.patch Sob
+package/fbv/0005-include.patch Sob
+package/feh/feh.hash HashSpaces
+package/fftw/fftw-double/fftw-double.hash HashSpaces
+package/fftw/fftw-long-double/fftw-long-double.hash HashSpaces
+package/fftw/fftw-quad/fftw-quad.hash HashSpaces
+package/fftw/fftw-single/fftw-single.hash HashSpaces
+package/fftw/fftw.hash HashSpaces
+package/flannel/flannel.hash HashSpaces
+package/flex/flex.hash HashSpaces
+package/flickcurl/flickcurl.hash HashSpaces
+package/flot/flot.hash HashSpaces
+package/fluid-soundfont/fluid-soundfont.hash HashSpaces
+package/font-awesome/font-awesome.hash HashSpaces
+package/fontconfig/fontconfig.hash HashSpaces
+package/freescale-imx/imx-m4fwloader/imx-m4fwloader.hash HashSpaces
+package/freescale-imx/imx-uuc/S80imx-uuc Indent Shellcheck Variables
+package/freescale-imx/imx-uuc/imx-uuc.hash HashSpaces
+package/frr/S50frr Shellcheck
+package/fstrcmp/fstrcmp.hash HashSpaces
+package/ftop/ftop.hash HashSpaces
+package/gamin/0002-no-const-return.patch Sob
+package/gcc/arc-2020.09-release/0002-libsanitizer-Remove-cyclades-from-libsanitizer.patch Sob
+package/gconf/gconf.hash HashSpaces
+package/gengetopt/gengetopt.hash HashSpaces
+package/genpart/genpart.hash HashSpaces
+package/genromfs/0001-build-system.patch Sob
+package/geoip/geoip.hash HashSpaces
+package/gerbera/S99gerbera Indent
+package/gflags/gflags.hash HashSpaces
+package/ghostscript-fonts/ghostscript-fonts.hash HashSpaces
+package/giflib/giflib.hash HashSpaces
+package/gli/gli.hash HashSpaces
+package/glm/glm.hash HashSpaces
+package/glorytun/glorytun.hash HashSpaces
+package/gnuradio/gnuradio.hash HashSpaces
+package/go/0002-cmd-dist-use-gohostarch-for-ssa-rewrite-check.patch Sob
+package/gob2/gob2.hash HashSpaces
+package/googlefontdirectory/googlefontdirectory.hash HashSpaces
+package/gperf/gperf.hash HashSpaces
+package/gpsd/S50gpsd Indent Shellcheck Variables
+package/gstreamer1/gst1-imx/gst1-imx.hash HashSpaces
+package/gtkmm3/gtkmm3.hash HashSpaces
+package/gtksourceview/gtksourceview.hash HashSpaces
+package/hans/hans.hash HashSpaces
+package/haveged/S21haveged Shellcheck Variables
+package/heimdal/heimdal.hash HashSpaces
+package/heirloom-mailx/heirloom-mailx.hash HashSpaces
+package/htpdate/S43htpdate Shellcheck
+package/httping/httping.hash HashSpaces
+package/i2pd/S99i2pd Indent Shellcheck Variables
+package/ibrcommon/ibrcommon.hash HashSpaces
+package/ifenslave/ifenslave.hash HashSpaces
+package/ifmetric/ifmetric.hash HashSpaces
+package/ifplugd/0001-cross.patch Sob
+package/ifplugd/0002-fix-headers.patch Sob
+package/ifupdown-scripts/S40network EmptyLastLine Indent Shellcheck Variables
+package/igd2-for-linux/S99upnpd Indent Shellcheck Variables
+package/igh-ethercat/igh-ethercat.hash HashSpaces
+package/ijs/ijs.hash HashSpaces
+package/ima-evm-utils/ima-evm-utils.hash HashSpaces
+package/inadyn/S70inadyn Indent NotExecutable
+package/input-event-daemon/S99input-event-daemon ConsecutiveEmptyLines Indent Variables
+package/intltool/intltool.hash HashSpaces
+package/iodine/iodine.hash HashSpaces
+package/iptables/S35iptables Shellcheck
+package/iputils/iputils.hash HashSpaces
+package/irda-utils/0001-daemon.patch Sob
+package/irda-utils/0002-nommu.patch Sob
+package/irda-utils/0003-subdir.patch Sob
+package/irqbalance/S13irqbalance Indent Shellcheck Variables
+package/irrlicht/irrlicht.hash HashSpaces
+package/iucode-tool/S00iucode-tool Variables
+package/iucode-tool/iucode-tool.hash HashSpaces
+package/iwd/S40iwd Shellcheck Variables
+package/jailhouse/jailhouse.hash HashSpaces
+package/joe/joe.hash HashSpaces
+package/jquery/jquery.hash HashSpaces
+package/jsmin/jsmin.hash HashSpaces
+package/jsmn/jsmn.hash HashSpaces
+package/jszip/jszip.hash HashSpaces
+package/keyutils/0002-cifs.patch Sob
+package/kodi/S50kodi Shellcheck Variables
+package/kyua/kyua.hash HashSpaces
+package/lbreakout2/lbreakout2.hash HashSpaces
+package/lensfun/lensfun.hash HashSpaces
+package/libao/libao.hash HashSpaces
+package/libart/0001-art-config-cross.patch Sob
+package/libart/libart.hash HashSpaces
+package/libasplib/libasplib.hash HashSpaces
+package/libatasmart/libatasmart.hash HashSpaces
+package/libavl/libavl.hash HashSpaces
+package/libbacktrace/libbacktrace.hash HashSpaces
+package/libbson/libbson.hash HashSpaces
+package/libcddb/libcddb.hash HashSpaces
+package/libcdio-paranoia/libcdio-paranoia.hash HashSpaces
+package/libcdio/libcdio.hash HashSpaces
+package/libcgi/libcgi.hash HashSpaces
+package/libcgicc/0001-disable-documentation-option.patch Sob
+package/libcgicc/libcgicc.hash HashSpaces
+package/libcorrect/libcorrect.hash HashSpaces
+package/libcsv/libcsv.hash HashSpaces
+package/libcue/libcue.hash HashSpaces
+package/libcuefile/libcuefile.hash HashSpaces
+package/libcutl/libcutl.hash HashSpaces
+package/libdaemon/libdaemon.hash HashSpaces
+package/libdcadec/libdcadec.hash HashSpaces
+package/libdri2/libdri2.hash HashSpaces
+package/libdvbcsa/libdvbcsa.hash HashSpaces
+package/libdvbpsi/libdvbpsi.hash HashSpaces
+package/libeastl/libeastl.hash HashSpaces
+package/libee/libee.hash HashSpaces
+package/libenca/libenca.hash HashSpaces
+package/libestr/libestr.hash HashSpaces
+package/libfcgi/0002-disable-examples.patch Sob
+package/libfcgi/libfcgi.hash HashSpaces
+package/libfreefare/libfreefare.hash HashSpaces
+package/libfreeimage/libfreeimage.hash HashSpaces
+package/libftdi/0001-pkgconfig_libusb.patch Sob
+package/libftdi/0002-libftdi.pc-requires-libusb-fix-static-build.patch Sob
+package/libfuse/libfuse.hash HashSpaces
+package/libgdiplus/libgdiplus.hash HashSpaces
+package/libglade/libglade.hash HashSpaces
+package/libical/libical.hash HashSpaces
+package/libiconv/libiconv.hash HashSpaces
+package/libiio/S99iiod Shellcheck Variables
+package/libiio/libiio.hash HashSpaces
+package/libimxvpuapi/libimxvpuapi.hash HashSpaces
+package/libiscsi/libiscsi.hash HashSpaces
+package/libkcapi/libkcapi.hash HashSpaces
+package/libllcp/libllcp.hash HashSpaces
+package/liblog4c-localtime/liblog4c-localtime.hash HashSpaces
+package/liblogging/liblogging.hash HashSpaces
+package/libloki/libloki.hash HashSpaces
+package/libmad/0001-mips-h-constraint-removal.patch Sob
+package/libmbus/libmbus.hash HashSpaces
+package/libmemcached/libmemcached.hash HashSpaces
+package/libmng/libmng.hash HashSpaces
+package/libmpd/libmpd.hash HashSpaces
+package/libmspack/libmspack.hash HashSpaces
+package/libnatpmp/libnatpmp.hash HashSpaces
+package/libnet/libnet.hash HashSpaces
+package/libnetfilter_acct/libnetfilter_acct.hash HashSpaces
+package/libnfs/libnfs.hash HashSpaces
+package/libnpth/libnpth.hash HashSpaces
+package/libodb-mysql/libodb-mysql.hash HashSpaces
+package/libodb-pgsql/libodb-pgsql.hash HashSpaces
+package/libodb/libodb.hash HashSpaces
+package/libopenaptx/libopenaptx.hash HashSpaces
+package/liboping/liboping.hash HashSpaces
+package/libpam-radius-auth/libpam-radius-auth.hash HashSpaces
+package/libpciaccess/libpciaccess.hash HashSpaces
+package/libpng/libpng.hash HashSpaces
+package/libpqxx/libpqxx.hash HashSpaces
+package/libpthread-stubs/libpthread-stubs.hash HashSpaces
+package/libraw1394/libraw1394.hash HashSpaces
+package/libreplaygain/libreplaygain.hash HashSpaces
+package/libroxml/libroxml.hash HashSpaces
+package/libserial/libserial.hash HashSpaces
+package/libsha1/libsha1.hash HashSpaces
+package/libsidplay2/libsidplay2.hash HashSpaces
+package/libsigrok/libsigrok.hash HashSpaces
+package/libsigrokdecode/libsigrokdecode.hash HashSpaces
+package/libsodium/libsodium.hash HashSpaces
+package/libsquish/libsquish.hash HashSpaces
+package/libsvg-cairo/libsvg-cairo.hash HashSpaces
+package/libsvg/libsvg.hash HashSpaces
+package/libtelnet/libtelnet.hash HashSpaces
+package/libtheora/libtheora.hash HashSpaces
+package/libtommath/libtommath.hash HashSpaces
+package/libtool/libtool.hash HashSpaces
+package/libtorrent/libtorrent.hash HashSpaces
+package/libucl/libucl.hash HashSpaces
+package/libuecc/libuecc.hash HashSpaces
+package/libwebsock/libwebsock.hash HashSpaces
+package/libxml-parser-perl/libxml-parser-perl.hash HashSpaces
+package/lightning/lightning.hash HashSpaces
+package/lighttpd/S50lighttpd EmptyLastLine Indent Shellcheck Variables
+package/linux-tools/S10hyperv Indent Variables
+package/linux-zigbee/linux-zigbee.hash HashSpaces
+package/linuxptp/S65ptp4l Indent Shellcheck
+package/linuxptp/S66phc2sys Indent Shellcheck
+package/lirc-tools/S25lircd Indent Variables
+package/lirc-tools/lirc-tools.hash HashSpaces
+package/lite/0001-dfbspy-stat.patch Sob
+package/lite/0002-no-tests.patch Sob
+package/lite/0003-pkg-config.patch Sob
+package/ljlinenoise/ljlinenoise.hash HashSpaces
+package/ljsyscall/ljsyscall.hash HashSpaces
+package/lksctp-tools/lksctp-tools.hash HashSpaces
+package/lldpd/S60lldpd Indent Shellcheck Variables
+package/lockfile-progs/0001-sus3v-legacy.patch Sob
+package/log4cpp/log4cpp.hash HashSpaces
+package/logsurfer/logsurfer.hash HashSpaces
+package/lpeg/lpeg.hash HashSpaces
+package/lpty/lpty.hash HashSpaces
+package/lrandom/lrandom.hash HashSpaces
+package/lsqlite3/lsqlite3.hash HashSpaces
+package/lttng-babeltrace/lttng-babeltrace.hash HashSpaces
+package/lua-binaryheap/lua-binaryheap.hash HashSpaces
+package/lua-bit32/lua-bit32.hash HashSpaces
+package/lua-cjson/lua-cjson.hash HashSpaces
+package/lua-coat/lua-coat.hash HashSpaces
+package/lua-coatpersistent/lua-coatpersistent.hash HashSpaces
+package/lua-codegen/lua-codegen.hash HashSpaces
+package/lua-compat53/lua-compat53.hash HashSpaces
+package/lua-csnappy/lua-csnappy.hash HashSpaces
+package/lua-datafile/lua-datafile.hash HashSpaces
+package/lua-fifo/lua-fifo.hash HashSpaces
+package/lua-flu/lua-flu.hash HashSpaces
+package/lua-http/lua-http.hash HashSpaces
+package/lua-iconv/lua-iconv.hash HashSpaces
+package/lua-inotify/lua-inotify.hash HashSpaces
+package/lua-livr-extra/lua-livr-extra.hash HashSpaces
+package/lua-livr/lua-livr.hash HashSpaces
+package/lua-lpeg-patterns/lua-lpeg-patterns.hash HashSpaces
+package/lua-lunitx/lua-lunitx.hash HashSpaces
+package/lua-lunix/lua-lunix.hash HashSpaces
+package/lua-markdown/lua-markdown.hash HashSpaces
+package/lua-messagepack/lua-messagepack.hash HashSpaces
+package/lua-periphery/lua-periphery.hash HashSpaces
+package/lua-resty-http/lua-resty-http.hash HashSpaces
+package/lua-rotas/lua-rotas.hash HashSpaces
+package/lua-sailor/lua-sailor.hash HashSpaces
+package/lua-silva/lua-silva.hash HashSpaces
+package/lua-std-debug/lua-std-debug.hash HashSpaces
+package/lua-std-normalize/lua-std-normalize.hash HashSpaces
+package/lua-stdlib/lua-stdlib.hash HashSpaces
+package/lua-testmore/lua-testmore.hash HashSpaces
+package/lua-utf8/lua-utf8.hash HashSpaces
+package/lua-valua/lua-valua.hash HashSpaces
+package/lua-zlib/lua-zlib.hash HashSpaces
+package/luadbi-sqlite3/luadbi-sqlite3.hash HashSpaces
+package/luadbi/luadbi.hash HashSpaces
+package/luaexpatutils/luaexpatutils.hash HashSpaces
+package/luafilesystem/luafilesystem.hash HashSpaces
+package/luajson/luajson.hash HashSpaces
+package/lualdap/lualdap.hash HashSpaces
+package/lualogging/lualogging.hash HashSpaces
+package/luaossl/luaossl.hash HashSpaces
+package/luasql-sqlite3/luasql-sqlite3.hash HashSpaces
+package/luksmeta/luksmeta.hash HashSpaces
+package/lzma/lzma.hash HashSpaces
+package/lzo/lzo.hash HashSpaces
+package/lzop/lzop.hash HashSpaces
+package/madplay/0001-switch-to-new-alsa-api.patch Sob
+package/make/make.hash HashSpaces
+package/mali-driver/mali-driver.hash HashSpaces
+package/mariadb/S97mysqld Indent Shellcheck Variables
+package/matchbox-common/matchbox-common.hash HashSpaces
+package/matchbox-desktop/matchbox-desktop.hash HashSpaces
+package/matchbox-keyboard/matchbox-keyboard.hash HashSpaces
+package/matchbox-panel/matchbox-panel.hash HashSpaces
+package/matchbox-startup-monitor/matchbox-startup-monitor.hash HashSpaces
+package/memstat/memstat.hash HashSpaces
+package/mender-connect/S43mender-connect Shellcheck
+package/mender-grubenv/mender-grubenv.hash HashSpaces
+package/menu-cache/menu-cache.hash HashSpaces
+package/mesa3d-demos/mesa3d-demos.hash HashSpaces
+package/mg/mg.hash HashSpaces
+package/mii-diag/0001-strchr.patch Sob
+package/mini-snmpd/mini-snmpd.hash HashSpaces
+package/minidlna/S60minidlnad Indent Shellcheck Variables
+package/minimodem/minimodem.hash HashSpaces
+package/minissdpd/S50minissdpd Indent Shellcheck Variables
+package/mjpg-streamer/mjpg-streamer.hash HashSpaces
+package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash HashSpaces
+package/modem-manager/S44modem-manager Shellcheck Variables
+package/monolite/monolite.hash HashSpaces
+package/mosh/mosh.hash HashSpaces
+package/mosquitto/S50mosquitto Indent Shellcheck Variables
+package/most/most.hash HashSpaces
+package/motion/S99motion Indent Shellcheck Variables
+package/mpd/S95mpd Variables
+package/mrouted/S41mrouted NotExecutable
+package/mrp/S65mrp Indent Variables
+package/multicat/multicat.hash HashSpaces
+package/multipath-tools/S60multipathd Shellcheck
+package/mupdf/mupdf.hash HashSpaces
+package/murata-cyw-fw/murata-cyw-fw.hash HashSpaces
+package/musepack/musepack.hash HashSpaces
+package/musl-compat-headers/musl-compat-headers.hash HashSpaces
+package/musl-fts/musl-fts.hash HashSpaces
+package/nanomsg/nanomsg.hash HashSpaces
+package/neard/S53neard Indent Shellcheck Variables
+package/neardal/neardal.hash HashSpaces
+package/netatalk/S50netatalk EmptyLastLine Indent Variables
+package/netcalc/netcalc.hash HashSpaces
+package/netcat/0001-signed-bit-counting.patch Sob
+package/netifrc/netifrc.hash HashSpaces
+package/netopeer2/S52netopeer2 Shellcheck Variables
+package/netplug/0001-makefile-flags.patch Sob
+package/netplug/S29netplug Indent Shellcheck Variables
+package/netsnmp/S59snmpd Indent Shellcheck Variables
+package/network-manager/S45network-manager ConsecutiveEmptyLines EmptyLastLine Shellcheck Variables
+package/newt/newt.hash HashSpaces
+package/nfacct/nfacct.hash HashSpaces
+package/nfs-utils/S60nfs ConsecutiveEmptyLines Shellcheck Variables
+package/nginx-dav-ext/nginx-dav-ext.hash HashSpaces
+package/nginx/S50nginx Indent Variables
+package/nload/nload.hash HashSpaces
+package/nodm/S90nodm Indent Shellcheck Variables
+package/nss-myhostname/nss-myhostname.hash HashSpaces
+package/nss-pam-ldapd/S45nslcd EmptyLastLine Indent Shellcheck Variables
+package/nss-pam-ldapd/nss-pam-ldapd.hash HashSpaces
+package/ntp/S49ntp.in Variables
+package/nvidia-driver/nvidia-driver.hash HashSpaces
+package/nvidia-modprobe/nvidia-modprobe.hash HashSpaces
+package/obsidian-cursors/obsidian-cursors.hash HashSpaces
+package/ocrad/ocrad.hash HashSpaces
+package/odb/odb.hash HashSpaces
+package/ofono/S46ofono Variables
+package/olsr/S50olsr Indent Shellcheck Variables
+package/olsr/olsr.hash HashSpaces
+package/omxplayer/omxplayer.hash HashSpaces
+package/opencore-amr/opencore-amr.hash HashSpaces
+package/openmpi/openmpi.hash HashSpaces
+package/openntpd/S49ntp Shellcheck Variables
+package/openobex/openobex.hash HashSpaces
+package/openpowerlink/openpowerlink.hash HashSpaces
+package/openssh/S50sshd EmptyLastLine Indent Variables
+package/opentyrian-data/opentyrian-data.hash HashSpaces
+package/openvpn/S60openvpn Indent Shellcheck Variables
+package/optee-client/S30optee Indent Shellcheck Variables
+package/opus-tools/opus-tools.hash HashSpaces
+package/opus/opus.hash HashSpaces
+package/oracle-mysql/S97mysqld Shellcheck Variables
+package/oracle-mysql/oracle-mysql.hash HashSpaces
+package/orbit/orbit.hash HashSpaces
+package/owfs/S55owserver Shellcheck Variables
+package/owfs/S60owfs Shellcheck Variables
+package/pamtester/pamtester.hash HashSpaces
+package/patch/patch.hash HashSpaces
+package/patchelf/patchelf.hash HashSpaces
+package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.hash HashSpaces
+package/perl-appconfig/perl-appconfig.hash HashSpaces
+package/perl-astro-suntime/perl-astro-suntime.hash HashSpaces
+package/perl-class-inspector/perl-class-inspector.hash HashSpaces
+package/perl-class-load/perl-class-load.hash HashSpaces
+package/perl-class-method-modifiers/perl-class-method-modifiers.hash HashSpaces
+package/perl-class-std-fast/perl-class-std-fast.hash HashSpaces
+package/perl-class-std/perl-class-std.hash HashSpaces
+package/perl-cookie-baker/perl-cookie-baker.hash HashSpaces
+package/perl-crypt-blowfish/perl-crypt-blowfish.hash HashSpaces
+package/perl-crypt-cbc/perl-crypt-cbc.hash HashSpaces
+package/perl-crypt-openssl-aes/perl-crypt-openssl-aes.hash HashSpaces
+package/perl-crypt-openssl-random/perl-crypt-openssl-random.hash HashSpaces
+package/perl-datetime-tiny/perl-datetime-tiny.hash HashSpaces
+package/perl-dbd-mysql/perl-dbd-mysql.hash HashSpaces
+package/perl-dbi/perl-dbi.hash HashSpaces
+package/perl-devel-globaldestruction/perl-devel-globaldestruction.hash HashSpaces
+package/perl-devel-stacktrace-ashtml/perl-devel-stacktrace-ashtml.hash HashSpaces
+package/perl-devel-stacktrace/perl-devel-stacktrace.hash HashSpaces
+package/perl-device-serialport/perl-device-serialport.hash HashSpaces
+package/perl-digest-sha1/perl-digest-sha1.hash HashSpaces
+package/perl-dist-checkconflicts/perl-dist-checkconflicts.hash HashSpaces
+package/perl-encode-detect/perl-encode-detect.hash HashSpaces
+package/perl-encode-locale/perl-encode-locale.hash HashSpaces
+package/perl-extutils-config/perl-extutils-config.hash HashSpaces
+package/perl-extutils-helpers/perl-extutils-helpers.hash HashSpaces
+package/perl-extutils-installpaths/perl-extutils-installpaths.hash HashSpaces
+package/perl-file-sharedir-install/perl-file-sharedir-install.hash HashSpaces
+package/perl-filesys-notify-simple/perl-filesys-notify-simple.hash HashSpaces
+package/perl-gdgraph/perl-gdgraph.hash HashSpaces
+package/perl-gdtextutil/perl-gdtextutil.hash HashSpaces
+package/perl-hash-multivalue/perl-hash-multivalue.hash HashSpaces
+package/perl-html-tagset/perl-html-tagset.hash HashSpaces
+package/perl-http-date/perl-http-date.hash HashSpaces
+package/perl-http-headers-fast/perl-http-headers-fast.hash HashSpaces
+package/perl-http-multipartparser/perl-http-multipartparser.hash HashSpaces
+package/perl-http-negotiate/perl-http-negotiate.hash HashSpaces
+package/perl-i18n/perl-i18n.hash HashSpaces
+package/perl-io-interface/perl-io-interface.hash HashSpaces
+package/perl-io-socket-multicast/perl-io-socket-multicast.hash HashSpaces
+package/perl-json-tiny/perl-json-tiny.hash HashSpaces
+package/perl-locale-maketext-lexicon/perl-locale-maketext-lexicon.hash HashSpaces
+package/perl-lwp-mediatypes/perl-lwp-mediatypes.hash HashSpaces
+package/perl-mailtools/perl-mailtools.hash HashSpaces
+package/perl-math-prime-util/perl-math-prime-util.hash HashSpaces
+package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.hash HashSpaces
+package/perl-mime-tools/perl-mime-tools.hash HashSpaces
+package/perl-module-build-tiny/perl-module-build-tiny.hash HashSpaces
+package/perl-module-build/perl-module-build.hash HashSpaces
+package/perl-module-implementation/perl-module-implementation.hash HashSpaces
+package/perl-module-runtime/perl-module-runtime.hash HashSpaces
+package/perl-mojolicious-plugin-cspheader/perl-mojolicious-plugin-cspheader.hash HashSpaces
+package/perl-mojolicious-plugin-i18n/perl-mojolicious-plugin-i18n.hash HashSpaces
+package/perl-mojolicious-plugin-securityheader/perl-mojolicious-plugin-securityheader.hash HashSpaces
+package/perl-net-snmp/perl-net-snmp.hash HashSpaces
+package/perl-net-ssleay/perl-net-ssleay.hash HashSpaces
+package/perl-netaddr-ip/perl-netaddr-ip.hash HashSpaces
+package/perl-number-bytes-human/perl-number-bytes-human.hash HashSpaces
+package/perl-path-class/perl-path-class.hash HashSpaces
+package/perl-stream-buffered/perl-stream-buffered.hash HashSpaces
+package/perl-sub-exporter-progressive/perl-sub-exporter-progressive.hash HashSpaces
+package/perl-sub-install/perl-sub-install.hash HashSpaces
+package/perl-sub-quote/perl-sub-quote.hash HashSpaces
+package/perl-sys-meminfo/perl-sys-meminfo.hash HashSpaces
+package/perl-sys-mmap/perl-sys-mmap.hash HashSpaces
+package/perl-time-parsedate/perl-time-parsedate.hash HashSpaces
+package/perl-www-form-urlencoded/perl-www-form-urlencoded.hash HashSpaces
+package/perl-www-robotrules/perl-www-robotrules.hash HashSpaces
+package/perl-x10/perl-x10.hash HashSpaces
+package/perl-xml-libxml/perl-xml-libxml.hash HashSpaces
+package/perl-xml-namespacesupport/perl-xml-namespacesupport.hash HashSpaces
+package/perl-xml-sax-base/perl-xml-sax-base.hash HashSpaces
+package/perl-xml-sax/perl-xml-sax.hash HashSpaces
+package/php-pecl-dbus/php-pecl-dbus.hash HashSpaces
+package/physfs/physfs.hash HashSpaces
+package/picocom/picocom.hash HashSpaces
+package/pigpio/S50pigpio Shellcheck Variables
+package/pimd/pimd.hash HashSpaces
+package/pixiewps/pixiewps.hash HashSpaces
+package/policycoreutils/policycoreutils.hash HashSpaces
+package/polkit/S50polkit NotExecutable Shellcheck Variables
+package/popperjs/popperjs.hash HashSpaces
+package/postgresql/S50postgresql Variables
+package/pound/pound.hash HashSpaces
+package/pptp-linux/pptp-linux.hash HashSpaces
+package/procps-ng/S02sysctl Variables
+package/proftpd/S50proftpd Indent Shellcheck Variables
+package/prosody/S50prosody Indent Shellcheck Variables
+package/pru-software-support/pru-software-support.hash HashSpaces
+package/ptm2human/ptm2human.hash HashSpaces
+package/ptpd/S65ptpd Indent Shellcheck Variables
+package/ptpd2/S65ptpd2 Indent Shellcheck Variables
+package/pulseaudio/S50pulseaudio ConsecutiveEmptyLines EmptyLastLine Indent Variables
+package/pwgen/pwgen.hash HashSpaces
+package/python-aiohttp-cors/python-aiohttp-cors.hash HashSpaces
+package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.hash HashSpaces
+package/python-aiohttp-mako/python-aiohttp-mako.hash HashSpaces
+package/python-aiohttp-security/python-aiohttp-security.hash HashSpaces
+package/python-aiologstash/python-aiologstash.hash HashSpaces
+package/python-aiomonitor/python-aiomonitor.hash HashSpaces
+package/python-alsaaudio/python-alsaaudio.hash HashSpaces
+package/python-argh/python-argh.hash HashSpaces
+package/python-asgiref/python-asgiref.hash HashSpaces
+package/python-bunch/python-bunch.hash HashSpaces
+package/python-canopen/python-canopen.hash HashSpaces
+package/python-cbor/python-cbor.hash HashSpaces
+package/python-channels-redis/python-channels-redis.hash HashSpaces
+package/python-channels/python-channels.hash HashSpaces
+package/python-characteristic/python-characteristic.hash HashSpaces
+package/python-cheetah/python-cheetah.hash HashSpaces
+package/python-cheroot/python-cheroot.hash HashSpaces
+package/python-cherrypy/python-cherrypy.hash HashSpaces
+package/python-constantly/python-constantly.hash HashSpaces
+package/python-couchdb/python-couchdb.hash HashSpaces
+package/python-crcmod/python-crcmod.hash HashSpaces
+package/python-cssselect/python-cssselect.hash HashSpaces
+package/python-daemonize/python-daemonize.hash HashSpaces
+package/python-daphne/python-daphne.hash HashSpaces
+package/python-dialog3/python-dialog3.hash HashSpaces
+package/python-dicttoxml/python-dicttoxml.hash HashSpaces
+package/python-django-enumfields/python-django-enumfields.hash HashSpaces
+package/python-docker-pycreds/python-docker-pycreds.hash HashSpaces
+package/python-docker/python-docker.hash HashSpaces
+package/python-dockerpty/python-dockerpty.hash HashSpaces
+package/python-entrypoints/python-entrypoints.hash HashSpaces
+package/python-fastentrypoints/python-fastentrypoints.hash HashSpaces
+package/python-flask-babel/python-flask-babel.hash HashSpaces
+package/python-flup/python-flup.hash HashSpaces
+package/python-future/python-future.hash HashSpaces
+package/python-gitdb2/python-gitdb2.hash HashSpaces
+package/python-huepy/0001-fix-import-with-python3.patch Sob
+package/python-huepy/python-huepy.hash HashSpaces
+package/python-ibmiotf/python-ibmiotf.hash HashSpaces
+package/python-iniparse/python-iniparse.hash HashSpaces
+package/python-iowait/python-iowait.hash HashSpaces
+package/python-ipython-genutils/python-ipython-genutils.hash HashSpaces
+package/python-jaraco-classes/python-jaraco-classes.hash HashSpaces
+package/python-jaraco-functools/python-jaraco-functools.hash HashSpaces
+package/python-json-schema-validator/python-json-schema-validator.hash HashSpaces
+package/python-jsonmodels/python-jsonmodels.hash HashSpaces
+package/python-keyring/python-keyring.hash HashSpaces
+package/python-kiwisolver/python-kiwisolver.hash HashSpaces
+package/python-libusb1/python-libusb1.hash HashSpaces
+package/python-lockfile/python-lockfile.hash HashSpaces
+package/python-logbook/python-logbook.hash HashSpaces
+package/python-m2r/python-m2r.hash HashSpaces
+package/python-matplotlib/python-matplotlib.hash HashSpaces
+package/python-mimeparse/python-mimeparse.hash HashSpaces
+package/python-mistune/python-mistune.hash HashSpaces
+package/python-nested-dict/python-nested-dict.hash HashSpaces
+package/python-netaddr/python-netaddr.hash HashSpaces
+package/python-networkmanager/python-networkmanager.hash HashSpaces
+package/python-numpy/python-numpy.hash HashSpaces
+package/python-paho-mqtt/python-paho-mqtt.hash HashSpaces
+package/python-pathpy/python-pathpy.hash HashSpaces
+package/python-pathtools/python-pathtools.hash HashSpaces
+package/python-pexpect/python-pexpect.hash HashSpaces
+package/python-pickleshare/python-pickleshare.hash HashSpaces
+package/python-piexif/python-piexif.hash HashSpaces
+package/python-ply/python-ply.hash HashSpaces
+package/python-portend/python-portend.hash HashSpaces
+package/python-pyaes/python-pyaes.hash HashSpaces
+package/python-pyicu/python-pyicu.hash HashSpaces
+package/python-pylibftdi/python-pylibftdi.hash HashSpaces
+package/python-pyqrcode/python-pyqrcode.hash HashSpaces
+package/python-pyratemp/python-pyratemp.hash HashSpaces
+package/python-pyroute2/python-pyroute2.hash HashSpaces
+package/python-pysmi/python-pysmi.hash HashSpaces
+package/python-pysnmp-mibs/python-pysnmp-mibs.hash HashSpaces
+package/python-pysnmp/python-pysnmp.hash HashSpaces
+package/python-pysocks/python-pysocks.hash HashSpaces
+package/python-pytablereader/python-pytablereader.hash HashSpaces
+package/python-pytablewriter/python-pytablewriter.hash HashSpaces
+package/python-pytest/python-pytest.hash HashSpaces
+package/python-pyxb/python-pyxb.hash HashSpaces
+package/python-raven/python-raven.hash HashSpaces
+package/python-requests-toolbelt/python-requests-toolbelt.hash HashSpaces
+package/python-rpi-gpio/python-rpi-gpio.hash HashSpaces
+package/python-scandir/python-scandir.hash HashSpaces
+package/python-sdnotify/python-sdnotify.hash HashSpaces
+package/python-see/python-see.hash HashSpaces
+package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash HashSpaces
+package/python-shutilwhich/python-shutilwhich.hash HashSpaces
+package/python-simplegeneric/python-simplegeneric.hash HashSpaces
+package/python-simplesqlite/python-simplesqlite.hash HashSpaces
+package/python-smbus-cffi/python-smbus-cffi.hash HashSpaces
+package/python-spidev/python-spidev.hash HashSpaces
+package/python-sqlalchemy/python-sqlalchemy.hash HashSpaces
+package/python-sqlparse/python-sqlparse.hash HashSpaces
+package/python-systemd/python-systemd.hash HashSpaces
+package/python-tempora/python-tempora.hash HashSpaces
+package/python-termcolor/python-termcolor.hash HashSpaces
+package/python-tomako/python-tomako.hash HashSpaces
+package/python-tqdm/python-tqdm.hash HashSpaces
+package/python-txtorcon/python-txtorcon.hash HashSpaces
+package/python-vcversioner/python-vcversioner.hash HashSpaces
+package/python-visitor/python-visitor.hash HashSpaces
+package/python-web2py/S51web2py Shellcheck Variables
+package/python-webencodings/python-webencodings.hash HashSpaces
+package/python-webpy/python-webpy.hash HashSpaces
+package/python-whoosh/python-whoosh.hash HashSpaces
+package/python-ws4py/python-ws4py.hash HashSpaces
+package/python-xlib/python-xlib.hash HashSpaces
+package/python-xlutils/python-xlutils.hash HashSpaces
+package/python-xlwt/python-xlwt.hash HashSpaces
+package/python-zc-lockfile/python-zc-lockfile.hash HashSpaces
+package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash HashSpaces
+package/qt5/qt5enginio/qt5enginio.hash HashSpaces
+package/quagga/quagga.hash HashSpaces
+package/quotatool/quotatool.hash HashSpaces
+package/rabbitmq-server/S50rabbitmq-server Indent Shellcheck Variables
+package/rapidjson/rapidjson.hash HashSpaces
+package/rapidxml/rapidxml.hash HashSpaces
+package/raspi-gpio/raspi-gpio.hash HashSpaces
+package/rcw-smarc-sal28/rcw-smarc-sal28.hash HashSpaces
+package/rdesktop/0001-8bit-colors.patch Sob
+package/reaver/reaver.hash HashSpaces
+package/redis/S50redis Shellcheck Variables
+package/restorecond/S02restorecond Shellcheck
+package/rings/rings.hash HashSpaces
+package/ripgrep/ripgrep.hash HashSpaces
+package/rng-tools/S21rngd Shellcheck Variables
+package/rockchip-mali/rockchip-mali.hash HashSpaces
+package/rpcbind/S30rpcbind EmptyLastLine Indent Variables
+package/rpcbind/rpcbind.hash HashSpaces
+package/rrdtool/rrdtool.hash HashSpaces
+package/rs485conf/rs485conf.hash HashSpaces
+package/rt-tests/rt-tests.hash HashSpaces
+package/rtorrent/rtorrent.hash HashSpaces
+package/rtptools/rtptools.hash HashSpaces
+package/rubix/0002-misc-fixes.patch Sob
+package/rubix/rubix.hash HashSpaces
+package/rygel/S99rygel Indent Shellcheck Variables
+package/samba4/S91smb Indent Shellcheck Variables
+package/sconeserver/sconeserver.hash HashSpaces
+package/sdl/sdl.hash HashSpaces
+package/sdl2_image/sdl2_image.hash HashSpaces
+package/sdl_gfx/sdl_gfx.hash HashSpaces
+package/seatd/S70seatd NotExecutable Variables
+package/sedutil/sedutil.hash HashSpaces
+package/ser2net/S50ser2net Indent Shellcheck Variables
+package/setools/setools.hash HashSpaces
+package/shairport-sync/S99shairport-sync Indent Shellcheck Variables
+package/shapelib/shapelib.hash HashSpaces
+package/shared-mime-info/shared-mime-info.hash HashSpaces
+package/shellinabox/shellinabox.hash HashSpaces
+package/slang/slang.hash HashSpaces
+package/smcroute/S41smcroute Indent NotExecutable Variables
+package/smcroute/smcroute.hash HashSpaces
+package/smstools3/S50smsd Shellcheck Variables
+package/smstools3/smstools3.hash HashSpaces
+package/snmpclitools/snmpclitools.hash HashSpaces
+package/softether/softether.hash HashSpaces
+package/solarus/0002-Add-a-basic-FindOpenGLES2.cmake.patch Sob
+package/sound-theme-borealis/sound-theme-borealis.hash HashSpaces
+package/sound-theme-freedesktop/sound-theme-freedesktop.hash HashSpaces
+package/squeezelite/squeezelite.hash HashSpaces
+package/squid/S97squid Indent Shellcheck Variables
+package/ssdp-responder/S50ssdpd Indent NotExecutable Shellcheck Variables
+package/sshguard/S49sshguard Indent
+package/sslh/S35sslh Indent Shellcheck Variables
+package/stunnel/S50stunnel Indent Shellcheck Variables
+package/supertuxkart/supertuxkart.hash HashSpaces
+package/supervisor/S99supervisord Variables
+package/suricata/S99suricata Shellcheck
+package/swig/swig.hash HashSpaces
+package/sylpheed/sylpheed.hash HashSpaces
+package/synergy/synergy.hash HashSpaces
+package/sysrepo/S51sysrepo-plugind Indent Shellcheck
+package/sysvinit/sysvinit.hash HashSpaces
+package/szip/szip.hash HashSpaces
+package/targetcli-fb/S50target Shellcheck Variables
+package/taskd/taskd.hash HashSpaces
+package/tcf-agent/S55tcf-agent Shellcheck Variables
+package/tcping/tcping.hash HashSpaces
+package/tftpd/S80tftpd-hpa Indent Shellcheck Variables
+package/thttpd/thttpd.hash HashSpaces
+package/ti-cgt-pru/ti-cgt-pru.hash HashSpaces
+package/ti-gfx/S80ti-gfx Shellcheck Variables
+package/ti-sgx-um/S80ti-sgx Variables
+package/time/time.hash HashSpaces
+package/tinc/tinc.hash HashSpaces
+package/tinymembench/tinymembench.hash HashSpaces
+package/tinyxml/tinyxml.hash HashSpaces
+package/tovid/tovid.hash HashSpaces
+package/tpm-tools/tpm-tools.hash HashSpaces
+package/tpm2-abrmd/S80tpm2-abrmd Indent Shellcheck Variables
+package/tpm2-totp/tpm2-totp.hash HashSpaces
+package/traceroute/traceroute.hash HashSpaces
+package/transmission/S92transmission ConsecutiveEmptyLines Indent Shellcheck Variables
+package/triggerhappy/S10triggerhappy Indent Shellcheck Variables
+package/trinity/trinity.hash HashSpaces
+package/tstools/tstools.hash HashSpaces
+package/turbolua/turbolua.hash HashSpaces
+package/tvheadend/S99tvheadend Indent Shellcheck Variables
+package/udev-gentoo-scripts/udev-gentoo-scripts.hash HashSpaces
+package/uftrace/uftrace.hash HashSpaces
+package/ulogd/ulogd.hash HashSpaces
+package/unbound/S70unbound Shellcheck
+package/unscd/S46unscd Indent Shellcheck Variables
+package/upmpdcli/S99upmpdcli Indent Shellcheck Variables
+package/urandom-scripts/S20urandom Variables
+package/urg/urg.hash HashSpaces
+package/usb_modeswitch_data/usb_modeswitch_data.hash HashSpaces
+package/usbguard/S20usbguard Indent Shellcheck Variables
+package/ussp-push/ussp-push.hash HashSpaces
+package/utp_com/utp_com.hash HashSpaces
+package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.hash HashSpaces
+package/vmtouch/vmtouch.hash HashSpaces
+package/vsftpd/S70vsftpd Indent Shellcheck Variables
+package/vtun/vtun.hash HashSpaces
+package/watchdogd/S01watchdogd Indent NotExecutable
+package/watchdogd/watchdogd.hash HashSpaces
+package/webrtc-audio-processing/webrtc-audio-processing.hash HashSpaces
+package/wf111/wf111.hash HashSpaces
+package/whetstone/whetstone.hash HashSpaces
+package/wireless_tools/wireless_tools.hash HashSpaces
+package/wpan-tools/wpan-tools.hash HashSpaces
+package/wsapi-fcgi/wsapi-fcgi.hash HashSpaces
+package/wsapi-xavante/wsapi-xavante.hash HashSpaces
+package/wsapi/wsapi.hash HashSpaces
+package/x11r7/xapp_bdftopcf/xapp_bdftopcf.hash HashSpaces
+package/x11r7/xapp_ico/xapp_ico.hash HashSpaces
+package/x11r7/xapp_oclock/xapp_oclock.hash HashSpaces
+package/x11r7/xapp_sessreg/xapp_sessreg.hash HashSpaces
+package/x11r7/xapp_viewres/xapp_viewres.hash HashSpaces
+package/x11r7/xapp_x11perf/xapp_x11perf.hash HashSpaces
+package/x11r7/xapp_xauth/xapp_xauth.hash HashSpaces
+package/x11r7/xapp_xbacklight/xapp_xbacklight.hash HashSpaces
+package/x11r7/xapp_xbiff/xapp_xbiff.hash HashSpaces
+package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash HashSpaces
+package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash HashSpaces
+package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.hash HashSpaces
+package/x11r7/xapp_xditview/xapp_xditview.hash HashSpaces
+package/x11r7/xapp_xdm/S99xdm Indent Variables
+package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash HashSpaces
+package/x11r7/xapp_xf86dga/xapp_xf86dga.hash HashSpaces
+package/x11r7/xapp_xfd/xapp_xfd.hash HashSpaces
+package/x11r7/xapp_xfontsel/xapp_xfontsel.hash HashSpaces
+package/x11r7/xapp_xfs/xapp_xfs.hash HashSpaces
+package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash HashSpaces
+package/x11r7/xapp_xhost/xapp_xhost.hash HashSpaces
+package/x11r7/xapp_xinit/xapp_xinit.hash HashSpaces
+package/x11r7/xapp_xinput/xapp_xinput.hash HashSpaces
+package/x11r7/xapp_xkbprint/xapp_xkbprint.hash HashSpaces
+package/x11r7/xapp_xkill/xapp_xkill.hash HashSpaces
+package/x11r7/xapp_xlogo/xapp_xlogo.hash HashSpaces
+package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash HashSpaces
+package/x11r7/xapp_xlsclients/xapp_xlsclients.hash HashSpaces
+package/x11r7/xapp_xman/xapp_xman.hash HashSpaces
+package/x11r7/xapp_xmessage/xapp_xmessage.hash HashSpaces
+package/x11r7/xapp_xmodmap/xapp_xmodmap.hash HashSpaces
+package/x11r7/xapp_xmore/xapp_xmore.hash HashSpaces
+package/x11r7/xapp_xpr/xapp_xpr.hash HashSpaces
+package/x11r7/xapp_xprop/xapp_xprop.hash HashSpaces
+package/x11r7/xapp_xrandr/xapp_xrandr.hash HashSpaces
+package/x11r7/xapp_xrefresh/xapp_xrefresh.hash HashSpaces
+package/x11r7/xapp_xset/xapp_xset.hash HashSpaces
+package/x11r7/xapp_xsetpointer/xapp_xsetpointer.hash HashSpaces
+package/x11r7/xapp_xsetroot/xapp_xsetroot.hash HashSpaces
+package/x11r7/xapp_xstdcmap/xapp_xstdcmap.hash HashSpaces
+package/x11r7/xapp_xvinfo/xapp_xvinfo.hash HashSpaces
+package/x11r7/xapp_xwininfo/xapp_xwininfo.hash HashSpaces
+package/x11r7/xapp_xwud/xapp_xwud.hash HashSpaces
+package/x11r7/xcb-util-cursor/xcb-util-cursor.hash HashSpaces
+package/x11r7/xcb-util-image/xcb-util-image.hash HashSpaces
+package/x11r7/xcb-util-keysyms/xcb-util-keysyms.hash HashSpaces
+package/x11r7/xcb-util-wm/xcb-util-wm.hash HashSpaces
+package/x11r7/xdata_xbitmaps/xdata_xbitmaps.hash HashSpaces
+package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash HashSpaces
+package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash HashSpaces
+package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash HashSpaces
+package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash HashSpaces
+package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash HashSpaces
+package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash HashSpaces
+package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash HashSpaces
+package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.hash HashSpaces
+package/x11r7/xdriver_xf86-video-mach64/0001-cross-compile.patch Sob
+package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.hash HashSpaces
+package/x11r7/xdriver_xf86-video-mga/0001-misc-fixes.patch Sob
+package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash HashSpaces
+package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.hash HashSpaces
+package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash HashSpaces
+package/x11r7/xdriver_xf86-video-savage/0001-cross-compile.patch Sob
+package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash HashSpaces
+package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.hash HashSpaces
+package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch Sob
+package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.hash HashSpaces
+package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.hash HashSpaces
+package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.hash HashSpaces
+package/x11r7/xfont_encodings/xfont_encodings.hash HashSpaces
+package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.hash HashSpaces
+package/x11r7/xfont_font-util/xfont_font-util.hash HashSpaces
+package/x11r7/xlib_libFS/xlib_libFS.hash HashSpaces
+package/x11r7/xlib_libICE/xlib_libICE.hash HashSpaces
+package/x11r7/xlib_libSM/xlib_libSM.hash HashSpaces
+package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash HashSpaces
+package/x11r7/xlib_libXau/xlib_libXau.hash HashSpaces
+package/x11r7/xlib_libXcomposite/xlib_libXcomposite.hash HashSpaces
+package/x11r7/xlib_libXdamage/xlib_libXdamage.hash HashSpaces
+package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash HashSpaces
+package/x11r7/xlib_libXext/xlib_libXext.hash HashSpaces
+package/x11r7/xlib_libXfixes/xlib_libXfixes.hash HashSpaces
+package/x11r7/xlib_libXfont/xlib_libXfont.hash HashSpaces
+package/x11r7/xlib_libXinerama/xlib_libXinerama.hash HashSpaces
+package/x11r7/xlib_libXmu/xlib_libXmu.hash HashSpaces
+package/x11r7/xlib_libXpm/xlib_libXpm.hash HashSpaces
+package/x11r7/xlib_libXrandr/xlib_libXrandr.hash HashSpaces
+package/x11r7/xlib_libXrender/xlib_libXrender.hash HashSpaces
+package/x11r7/xlib_libXt/xlib_libXt.hash HashSpaces
+package/x11r7/xlib_libXv/xlib_libXv.hash HashSpaces
+package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.hash HashSpaces
+package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash HashSpaces
+package/x11r7/xlib_libdmx/xlib_libdmx.hash HashSpaces
+package/x11r7/xlib_libfontenc/xlib_libfontenc.hash HashSpaces
+package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash HashSpaces
+package/x11r7/xlib_libxshmfence/xlib_libxshmfence.hash HashSpaces
+package/x11r7/xlib_xtrans/xlib_xtrans.hash HashSpaces
+package/x11r7/xserver_xorg-server/S40xorg Shellcheck Variables
+package/x11r7/xutil_makedepend/xutil_makedepend.hash HashSpaces
+package/xavante/xavante.hash HashSpaces
+package/xmlstarlet/xmlstarlet.hash HashSpaces
+package/xutil_util-macros/xutil_util-macros.hash HashSpaces
+package/yad/yad.hash HashSpaces
+package/zip/zip.hash HashSpaces
+package/zmqpp/zmqpp.hash HashSpaces
+package/zxing-cpp/zxing-cpp.hash HashSpaces
+toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash HashSpaces
+toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash HashSpaces
+toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.hash HashSpaces
+toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.hash HashSpaces
+toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.hash HashSpaces
+toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash HashSpaces
+toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.hash HashSpaces
+toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash HashSpaces
+toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash HashSpaces
+toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash HashSpaces
+toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash HashSpaces
diff --git a/Makefile b/Makefile
index 4305c8c3dd..bd7ab9675d 100644
--- a/Makefile
+++ b/Makefile
@@ -1245,8 +1245,7 @@ check-flake8:
 	| xargs -- python3 -m flake8 --statistics
 
 check-package:
-	find $(TOPDIR) -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' -o -name '*.patch' \) \
-		-exec ./utils/check-package --exclude=Sob --exclude=HashSpaces {} +
+	$(Q)./utils/check-package `git ls-tree -r --name-only HEAD`
 
 include docs/manual/manual.mk
 -include $(foreach dir,$(BR2_EXTERNAL_DIRS),$(sort $(wildcard $(dir)/docs/*/*.mk)))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
