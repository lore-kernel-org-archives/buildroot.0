Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557A9C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 05:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBD4E417A8;
	Sun, 24 Jul 2022 05:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBD4E417A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S5MCsJacTGOU; Sun, 24 Jul 2022 05:54:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFA6A41780;
	Sun, 24 Jul 2022 05:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFA6A41780
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 881941BF59B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6106C41729
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:51:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6106C41729
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9beFFb7mz2Fz for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 05:51:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ABEF416ED
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6ABEF416ED
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 05:51:06 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id s188so9972955oie.0
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 22:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=pFWt6gohmEji1QC8TJSes8BVmz/qZlQ5XWQik+LFeeM=;
 b=M/LKdt6d2KSCvpWZHiscIiTeEcc7JJhNnUfmeDW0hishyL0i9i0P14B8rx7If2auvQ
 TIHXZpicAh7DDZJHvLV6n1VxF4l8e5yU9Qj95MoFbeaPDoNN4d9Hcbw+HRn5CNvGvuEy
 4XFUCNc6b1+IygF2P8NritF492DsmsrejcbXZw2ljSVHW5Tw+Gt57JEqMqF2jJ209qre
 z7Mvns9L71hKzx2LlRHDBQxnn4mquYtnlZA1hkM4+uSUhoHLWBT3SkhlBaUaiSFn0ksK
 brOJQtGu5E+FcB1i4dcjonFD1IFT2MRfDqjm/HyiqvB7+klo3x0H+zcfitWjo25t4Q3x
 BRHA==
X-Gm-Message-State: AJIora/9MBigddS6cMpwxCwEEINwbIT98vTGkozzmFZw9gGMmo9yQsqy
 vpYmkgDdu4kVTWZ14Ta1WO5A1OBmiM8=
X-Google-Smtp-Source: AGRyM1uwEHnNuZqf3ZFTgn9C26UUOXpPLLJeiGH0dqu8OfIjf6LpTEsBOK5YJ7ENuZfxD5QuCWqcCA==
X-Received: by 2002:a05:6808:152c:b0:33a:bf39:a8bd with SMTP id
 u44-20020a056808152c00b0033abf39a8bdmr2950043oiw.164.1658641865250; 
 Sat, 23 Jul 2022 22:51:05 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a056870818d00b000f5d8d031b6sm4236969oae.49.2022.07.23.22.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 22:51:03 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 02:49:12 -0300
Message-Id: <20220724054912.2354219-17-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
References: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=pFWt6gohmEji1QC8TJSes8BVmz/qZlQ5XWQik+LFeeM=;
 b=g/phbBRu+lwrIFftxyI8Ke8FhAr9d1EV7vdyu2nO1+GeWqWKGTYunlelWq352Fp5Xx
 RwbkHEX//bAH7ahf1U+NvYEl+XFUXv9N59pYM/N+m7Rd2f8zrkS5qNGzZTApVLjksHZ2
 8eQ8rFakJvlw/Eu+kHBQ+V2pnRkrq1AbGkhe9vHSXoIIi8hHsUs2Fafi/AFj3cfyIKsl
 s+eB2A0HYQhZGrXAfUZhqnLEQz7z2eakciqtECRStqfW4IcypBDP5PYyISNGH7tKiuAP
 5nqesfYHIYLZiAuO6bWogrDJKdiCbemJ6Unvbf5q/yUCQIuF9jO3pPfsAs/Ye9vcjAeM
 7fwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=g/phbBRu
Subject: [Buildroot] [PATCH 16/16] utils/checkpackagelib: warn about
 $(HOST_DIR)/usr
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It's been ages (5 years at the next release) that we've not installed
host packages in $(HOST_DIR)/usr, but we still have a few packages that
reference it or install things in there. See [1]

Add a new check_function that warns when a file is added installing to
or referencing $(HOST_DIR)/usr .

[1] http://patchwork.ozlabs.org/project/buildroot/patch/bc16adfe3d7143105e840072edb169e4cb7354cc.1658007000.git.yann.morin.1998@free.fr/

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
NOTE to the maintainer applying this patch: please re-generate the list
of ignored warnings while applying:
$ ./utils/docker-run
br-user@...$ ./utils/check-package --failed-only `git ls-tree -r --name-only HEAD` > .checkpackageignore

Run of unit tests:
$ utils/docker-run python3 -m pytest -vv utils/checkpackagelib/
232 passed in 0.86s
---
 .checkpackageignore                  | 22 ++++++++++++++++++++++
 utils/checkpackagelib/lib_mk.py      | 12 ++++++++++++
 utils/checkpackagelib/test_lib_mk.py | 23 +++++++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/.checkpackageignore b/.checkpackageignore
index 6f1a838562..92ab426685 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -91,9 +91,11 @@ board/zynqmp/post-build.sh Shellcheck
 board/zynqmp/post-image.sh Shellcheck
 board/zynqmp/zcu106/patches/uboot/0001-arm64-zynqmp-zynqmp-zcu102-revA-Fix-DP-PLL-configura.patch NumberedSubject
 boot/binaries-marvell/binaries-marvell.hash HashSpaces
+boot/grub2/grub2.mk DoNotInstallToHostdirUsr
 boot/s500-bootloader/s500-bootloader.hash HashSpaces
 boot/shim/shim.hash HashSpaces
 package/abootimg/abootimg.hash HashSpaces
+package/abootimg/abootimg.mk DoNotInstallToHostdirUsr
 package/acpitool/acpitool.hash HashSpaces
 package/aespipe/aespipe.hash HashSpaces
 package/alsamixergui/0001-misc-fixes.patch Sob
@@ -132,6 +134,7 @@ package/bcg729/bcg729.hash HashSpaces
 package/bdwgc/bdwgc.hash HashSpaces
 package/berkeleydb/berkeleydb.hash HashSpaces
 package/bind/S81named Indent Shellcheck Variables
+package/bind/bind.mk DoNotInstallToHostdirUsr
 package/biosdevname/biosdevname.hash HashSpaces
 package/bitstream/bitstream.hash HashSpaces
 package/bluez5_utils/S40bluetooth NotExecutable Variables
@@ -163,6 +166,7 @@ package/chrony/S49chrony Indent Shellcheck Variables
 package/cmocka/cmocka.hash HashSpaces
 package/collectd/collectd.hash HashSpaces
 package/comix-cursors/comix-cursors.hash HashSpaces
+package/compiler-rt/compiler-rt.mk DoNotInstallToHostdirUsr
 package/connman-gtk/connman-gtk.hash HashSpaces
 package/connman/S45connman Variables
 package/conntrack-tools/conntrack-tools.hash HashSpaces
@@ -192,6 +196,7 @@ package/datatables-buttons/datatables-buttons.hash HashSpaces
 package/datatables-fixedcolumns/datatables-fixedcolumns.hash HashSpaces
 package/datatables-responsive/datatables-responsive.hash HashSpaces
 package/datatables/datatables.hash HashSpaces
+package/dbus-python/dbus-python.mk DoNotInstallToHostdirUsr
 package/dbus/S30dbus Indent Shellcheck TrailingSpace Variables
 package/dc3dd/dc3dd.hash HashSpaces
 package/dcron/S90dcron Variables
@@ -267,6 +272,7 @@ package/frr/S50frr Shellcheck
 package/fstrcmp/fstrcmp.hash HashSpaces
 package/ftop/ftop.hash HashSpaces
 package/gamin/0002-no-const-return.patch Sob
+package/gawk/gawk.mk DoNotInstallToHostdirUsr
 package/gcc/arc-2020.09-release/0002-libsanitizer-Remove-cyclades-from-libsanitizer.patch Sob
 package/gconf/gconf.hash HashSpaces
 package/gengetopt/gengetopt.hash HashSpaces
@@ -274,6 +280,7 @@ package/genpart/genpart.hash HashSpaces
 package/genromfs/0001-build-system.patch Sob
 package/geoip/geoip.hash HashSpaces
 package/gerbera/S99gerbera Indent
+package/gettext-tiny/gettext-tiny.mk DoNotInstallToHostdirUsr
 package/gflags/gflags.hash HashSpaces
 package/ghostscript-fonts/ghostscript-fonts.hash HashSpaces
 package/giflib/giflib.hash HashSpaces
@@ -282,6 +289,7 @@ package/glm/glm.hash HashSpaces
 package/glorytun/glorytun.hash HashSpaces
 package/gnuradio/gnuradio.hash HashSpaces
 package/go/0002-cmd-dist-use-gohostarch-for-ssa-rewrite-check.patch Sob
+package/go/go.mk DoNotInstallToHostdirUsr
 package/gob2/gob2.hash HashSpaces
 package/google-breakpad/gen-syms.sh Shellcheck
 package/googlefontdirectory/googlefontdirectory.hash HashSpaces
@@ -326,6 +334,7 @@ package/iucode-tool/S00iucode-tool Variables
 package/iucode-tool/iucode-tool.hash HashSpaces
 package/iwd/S40iwd Shellcheck Variables
 package/jailhouse/jailhouse.hash HashSpaces
+package/jimtcl/jimtcl.mk DoNotInstallToHostdirUsr
 package/joe/joe.hash HashSpaces
 package/jquery/jquery.hash HashSpaces
 package/jsmin/jsmin.hash HashSpaces
@@ -337,6 +346,7 @@ package/kyua/kyua.hash HashSpaces
 package/lbreakout2/lbreakout2.hash HashSpaces
 package/lensfun/lensfun.hash HashSpaces
 package/libao/libao.hash HashSpaces
+package/libapparmor/libapparmor.mk DoNotInstallToHostdirUsr
 package/libart/0001-art-config-cross.patch Sob
 package/libart/libart.hash HashSpaces
 package/libasplib/libasplib.hash HashSpaces
@@ -424,6 +434,7 @@ package/libtool/libtool.hash HashSpaces
 package/libtorrent/libtorrent.hash HashSpaces
 package/libucl/libucl.hash HashSpaces
 package/libuecc/libuecc.hash HashSpaces
+package/libva/libva.mk DoNotInstallToHostdirUsr
 package/libwebsock/libwebsock.hash HashSpaces
 package/libxml-parser-perl/libxml-parser-perl.hash HashSpaces
 package/lightning/lightning.hash HashSpaces
@@ -482,6 +493,7 @@ package/lua-testmore/lua-testmore.hash HashSpaces
 package/lua-utf8/lua-utf8.hash HashSpaces
 package/lua-valua/lua-valua.hash HashSpaces
 package/lua-zlib/lua-zlib.hash HashSpaces
+package/lua/lua.mk DoNotInstallToHostdirUsr
 package/luadbi-sqlite3/luadbi-sqlite3.hash HashSpaces
 package/luadbi/luadbi.hash HashSpaces
 package/luaexpatutils/luaexpatutils.hash HashSpaces
@@ -564,10 +576,12 @@ package/obsidian-cursors/obsidian-cursors.hash HashSpaces
 package/ocrad/ocrad.hash HashSpaces
 package/odb/odb.hash HashSpaces
 package/ofono/S46ofono Variables
+package/ola/ola.mk DoNotInstallToHostdirUsr
 package/olsr/S50olsr Indent Shellcheck Variables
 package/olsr/olsr.hash HashSpaces
 package/omxplayer/omxplayer.hash HashSpaces
 package/opencore-amr/opencore-amr.hash HashSpaces
+package/openjdk-bin/openjdk-bin.mk DoNotInstallToHostdirUsr
 package/openmpi/openmpi.hash HashSpaces
 package/openntpd/S49ntp Shellcheck Variables
 package/openobex/openobex.hash HashSpaces
@@ -660,7 +674,11 @@ package/perl-xml-libxml/perl-xml-libxml.hash HashSpaces
 package/perl-xml-namespacesupport/perl-xml-namespacesupport.hash HashSpaces
 package/perl-xml-sax-base/perl-xml-sax-base.hash HashSpaces
 package/perl-xml-sax/perl-xml-sax.hash HashSpaces
+package/php-apcu/php-apcu.mk DoNotInstallToHostdirUsr
+package/php-lua/php-lua.mk DoNotInstallToHostdirUsr
+package/php-pam/php-pam.mk DoNotInstallToHostdirUsr
 package/php-pecl-dbus/php-pecl-dbus.hash HashSpaces
+package/php-pecl-dbus/php-pecl-dbus.mk DoNotInstallToHostdirUsr
 package/physfs/physfs.hash HashSpaces
 package/picocom/picocom.hash HashSpaces
 package/pigpio/S50pigpio Shellcheck Variables
@@ -703,6 +721,7 @@ package/python-cherrypy/python-cherrypy.hash HashSpaces
 package/python-constantly/python-constantly.hash HashSpaces
 package/python-couchdb/python-couchdb.hash HashSpaces
 package/python-crcmod/python-crcmod.hash HashSpaces
+package/python-cryptography/python-cryptography.mk DoNotInstallToHostdirUsr
 package/python-cssselect/python-cssselect.hash HashSpaces
 package/python-daemonize/python-daemonize.hash HashSpaces
 package/python-daphne/python-daphne.hash HashSpaces
@@ -750,6 +769,7 @@ package/python-piexif/python-piexif.hash HashSpaces
 package/python-ply/python-ply.hash HashSpaces
 package/python-portend/python-portend.hash HashSpaces
 package/python-pyaes/python-pyaes.hash HashSpaces
+package/python-pybind/python-pybind.mk DoNotInstallToHostdirUsr
 package/python-pyicu/python-pyicu.hash HashSpaces
 package/python-pylibftdi/python-pylibftdi.hash HashSpaces
 package/python-pyqrcode/python-pyqrcode.hash HashSpaces
@@ -806,6 +826,7 @@ package/rcw-smarc-sal28/rcw-smarc-sal28.hash HashSpaces
 package/rdesktop/0001-8bit-colors.patch Sob
 package/reaver/reaver.hash HashSpaces
 package/redis/S50redis Shellcheck Variables
+package/refpolicy/refpolicy.mk DoNotInstallToHostdirUsr
 package/restorecond/S02restorecond Shellcheck
 package/rings/rings.hash HashSpaces
 package/ripgrep/ripgrep.hash HashSpaces
@@ -1018,6 +1039,7 @@ package/xl2tp/xl2tpd TrailingSpace
 package/xmlstarlet/xmlstarlet.hash HashSpaces
 package/xutil_util-macros/xutil_util-macros.hash HashSpaces
 package/yad/yad.hash HashSpaces
+package/zfs/zfs.mk DoNotInstallToHostdirUsr
 package/zip/zip.hash HashSpaces
 package/zmqpp/zmqpp.hash HashSpaces
 package/zxing-cpp/zxing-cpp.hash HashSpaces
diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index b50a19ac62..eaef19b2ec 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -21,6 +21,18 @@ continue_conditional = ["elif", "else"]
 end_conditional = ["endif"]
 
 
+class DoNotInstallToHostdirUsr(_CheckFunction):
+    INSTALL_TO_HOSTDIR_USR = re.compile(r"^[^#].*\$\(HOST_DIR\)/usr")
+
+    def check_line(self, lineno, text):
+        if self.INSTALL_TO_HOSTDIR_USR.match(text.rstrip()):
+            if self.filename in ['package/skeleton/skeleton.mk']:
+                return
+            return ["{}:{}: install files to $(HOST_DIR)/ instead of $(HOST_DIR)/usr/"
+                    .format(self.filename, lineno),
+                    text]
+
+
 class Indent(_CheckFunction):
     COMMENT = re.compile(r"^\s*#")
     CONDITIONAL = re.compile(r"^\s*({})\s".format("|".join(start_conditional + end_conditional + continue_conditional)))
diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
index 49fa216fcd..db6641f14c 100644
--- a/utils/checkpackagelib/test_lib_mk.py
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -3,6 +3,29 @@ import checkpackagelib.test_util as util
 import checkpackagelib.lib_mk as m
 
 
+DoNotInstallToHostdirUsr = [
+    ('real case',
+     'libapparmor.mk',
+     'LIBAPPARMOR_CONF_OPTS += \\\n'
+     '\t--with-python \\\n'
+     '\tPYTHON=$(HOST_DIR)/usr/bin/python3 \\\n'
+     '\tPYTHON_CONFIG=$(STAGING_DIR)/usr/bin/python3-config \\\n'
+     '\tSWIG=$(SWIG)\n',
+     [['libapparmor.mk:3: install files to $(HOST_DIR)/ instead of $(HOST_DIR)/usr/',
+       '\tPYTHON=$(HOST_DIR)/usr/bin/python3 \\\n']]),
+    ('ignore comment',
+     'any',
+     '# following code do not install to $(HOST_DIR)/usr/\n',
+     []),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', DoNotInstallToHostdirUsr)
+def test_DoNotInstallToHostdirUsr(testname, filename, string, expected):
+    warnings = util.check_file(m.DoNotInstallToHostdirUsr, filename, string)
+    assert warnings == expected
+
+
 Indent = [
     ('ignore comment at beginning of line',
      'any',
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
