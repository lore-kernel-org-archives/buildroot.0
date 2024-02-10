Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742F6C4829C
	for <buildroot@archiver.kernel.org>; Sat, 10 Feb 2024 21:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60064606C8;
	Sat, 10 Feb 2024 21:50:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EWY3Zrya4nni; Sat, 10 Feb 2024 21:50:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 577B56067C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 577B56067C;
	Sat, 10 Feb 2024 21:50:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2EADC1BF295
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 21:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12B0341C25
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 21:25:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id clTfsg6-TgzJ for <buildroot@lists.busybox.net>;
 Sat, 10 Feb 2024 21:25:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6868442DA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6868442DA9
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6868442DA9
 for <buildroot@buildroot.org>; Sat, 10 Feb 2024 21:25:05 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-410a462d70bso2752615e9.0
 for <buildroot@buildroot.org>; Sat, 10 Feb 2024 13:25:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707600303; x=1708205103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dxFgvP0JYL4z9TnaznFoqEl8XuiCvRBUzF+fZi9Qca4=;
 b=wJCv89Yaa5kjPqHY7yDbp+TtBex1cj5Xbkh9+7QZVQC10p17/qtrHu0hmXd7V6y9ix
 weIg7iMYAzdn9RxqKERm8WIiCRdxw/4M5RyRfeZKFrow8/CduZ7h4loDma/q8w0rFPsW
 cFTaR4TQRo4mS3vbx6N3ZrmuI3RBshJ/35Ns6mMWCZhzDBneKiRE/nDcBTY8uOmIGcCg
 kY/3YLOJwsczBI60EOYlGYNPWJY8LxwyelxKoabYXTQgYqRqcgp5EoHti2LSkOBBq5qh
 GAOFE9EdJ2O4rZe6MqjKjRTBlhrHA+W/ui5dKna+bqe9M/02EEJ1uib75u5CBF72uSFQ
 i4vA==
X-Gm-Message-State: AOJu0Yz0PDBgcInh4+wou15+/hAsw+3x8U+fvh70etW41rkzloxk3sKb
 sZydoRr8DDrfM8u0YiejKuDB5OFlxhgAQ8wZ5+tFAXYvcZF0UPYfLCNYMphD
X-Google-Smtp-Source: AGHT+IEbth3ByRCYsY3hZefHhWI+qM5fpS1lGVkpA+bpGbPWZip2EhxhvuHr9mS6TZ8jsMYfNJhunQ==
X-Received: by 2002:a05:600c:a4b:b0:40f:b0bf:6abf with SMTP id
 c11-20020a05600c0a4b00b0040fb0bf6abfmr2292709wmq.17.1707600302273; 
 Sat, 10 Feb 2024 13:25:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWD6jh++U1U69MaRj6B/yP5RfkLNYXiDIPFlgI0j3nDEPe6vse0Ai/SerxV/4aaOMgL1ggwXwR+cnmaFwzU81XBqXxA/R9ZLGRhiA==
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ba23-20020a0560001c1700b0033946c0f9e7sm2728962wrb.17.2024.02.10.13.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Feb 2024 13:25:01 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 Feb 2024 22:24:58 +0100
Message-ID: <d9354ecf6316222ddbdc9bc396ef06c17096d9db.1707600292.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707600292.git.yann.morin.1998@free.fr>
References: <cover.1707600292.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707600303; x=1708205103; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dxFgvP0JYL4z9TnaznFoqEl8XuiCvRBUzF+fZi9Qca4=;
 b=ejU3AaayM1x8ONiUxABwlJILH588xtjeDMlwg4HxRkKxAU5MOgRcmdQyxz7muNLvit
 mbUVIKlN7E125GzW2UYM8Dn2156cBYeWQ78hyhAjZ2O3I/h1VYgQYXjMvzxjaFLIBOm+
 snsBZOaxdSoTqOFWOw5H7boOl8emalia0hNuWz75/i9OOVheYYTF8PqaJpL6SNMhou97
 nmlRR1YCmpdLuyNLaxmTQ5ruMmwTlq0z0WSwLSqfmJPyaq4xItyKnz5TyFchGpWA34p1
 vXXtq1nZdZoOALFEXL2AqpT69pQeApY8UpZmsfi4z7DuxPrgz2tKwJt55EM4bpgccAe/
 +1uA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ejU3Aaay
Subject: [Buildroot] [PATCH 5/6 v2] package: switch to _CPE_ID_VALID
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that we document _CPE_ID_VALID, and that it shall be used instead of
setting a default value to one of the other _CPE_ID_* variables, change
all of the existing packages to use it, to avoid any error when we later
extend check-package to validate the sanity ofthe _CPE_ID_* variables.

Mechanical change done within the reference container, running the new
check in check-package, to report the CPE_ID errors:

    $ make check-package 2>/dev/null \
    |awk '{
            split($(1), a, ":"); fname = a[1]
            split($(2), a, "'\''"); val = a[2]
            new_var = $(8); gsub("_CPE_ID_.*", "_CPE_ID_VALID", new_var)
            printf("%s %s %s %s\n", fname, $(8), val, new_var)
    }' \
    |while read fname var val new_var; do
        sed -r -i -e "s/${var}[[:space:]]*=[[:space:]]*${val}/${new_var} = YES/" "${fname}"
    done

    $ git diff -I'CPE_ID_(VENDOR|VALID)'
    [empty]

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/acl/acl.mk                                 | 2 +-
 package/asn1c/asn1c.mk                             | 2 +-
 package/atftp/atftp.mk                             | 2 +-
 package/atop/atop.mk                               | 2 +-
 package/attr/attr.mk                               | 2 +-
 package/axel/axel.mk                               | 2 +-
 package/bdwgc/bdwgc.mk                             | 2 +-
 package/beecrypt/beecrypt.mk                       | 2 +-
 package/blktrace/blktrace.mk                       | 2 +-
 package/botan/botan.mk                             | 2 +-
 package/bwm-ng/bwm-ng.mk                           | 2 +-
 package/c-icap/c-icap.mk                           | 2 +-
 package/c-periphery/c-periphery.mk                 | 2 +-
 package/cgroupfs-mount/cgroupfs-mount.mk           | 2 +-
 package/civetweb/civetweb.mk                       | 2 +-
 package/cjson/cjson.mk                             | 2 +-
 package/cmake/cmake.mk                             | 2 +-
 package/cracklib/cracklib.mk                       | 2 +-
 package/crun/crun.mk                               | 2 +-
 package/cryptsetup/cryptsetup.mk                   | 2 +-
 package/cups-pk-helper/cups-pk-helper.mk           | 2 +-
 package/darkhttpd/darkhttpd.mk                     | 2 +-
 package/dbus-broker/dbus-broker.mk                 | 2 +-
 package/dhcpcd/dhcpcd.mk                           | 2 +-
 package/dosfstools/dosfstools.mk                   | 2 +-
 package/dracut/dracut.mk                           | 2 +-
 package/dtc/dtc.mk                                 | 2 +-
 package/duktape/duktape.mk                         | 2 +-
 package/e2fsprogs/e2fsprogs.mk                     | 2 +-
 package/elfutils/elfutils.mk                       | 2 +-
 package/exempi/exempi.mk                           | 2 +-
 package/exfat/exfat.mk                             | 2 +-
 package/f2fs-tools/f2fs-tools.mk                   | 2 +-
 package/feh/feh.mk                                 | 2 +-
 package/file/file.mk                               | 2 +-
 package/flac/flac.mk                               | 2 +-
 package/fontconfig/fontconfig.mk                   | 2 +-
 package/giflib/giflib.mk                           | 2 +-
 package/gnuplot/gnuplot.mk                         | 2 +-
 package/gpsd/gpsd.mk                               | 2 +-
 package/gutenprint/gutenprint.mk                   | 2 +-
 package/harfbuzz/harfbuzz.mk                       | 2 +-
 package/haserl/haserl.mk                           | 2 +-
 package/heimdal/heimdal.mk                         | 2 +-
 package/i2c-tools/i2c-tools.mk                     | 2 +-
 package/ipmitool/ipmitool.mk                       | 2 +-
 package/iproute2/iproute2.mk                       | 2 +-
 package/iputils/iputils.mk                         | 2 +-
 package/iucode-tool/iucode-tool.mk                 | 2 +-
 package/jansson/jansson.mk                         | 2 +-
 package/jasper/jasper.mk                           | 2 +-
 package/jhead/jhead.mk                             | 2 +-
 package/jq/jq.mk                                   | 2 +-
 package/json-for-modern-cpp/json-for-modern-cpp.mk | 2 +-
 package/jsoncpp/jsoncpp.mk                         | 2 +-
 package/jszip/jszip.mk                             | 2 +-
 package/keyutils/keyutils.mk                       | 2 +-
 package/kvmtool/kvmtool.mk                         | 2 +-
 package/lame/lame.mk                               | 2 +-
 package/lapack/lapack.mk                           | 2 +-
 package/lftp/lftp.mk                               | 2 +-
 package/libaio/libaio.mk                           | 2 +-
 package/libass/libass.mk                           | 2 +-
 package/libatomic_ops/libatomic_ops.mk             | 2 +-
 package/libbpf/libbpf.mk                           | 2 +-
 package/libcap-ng/libcap-ng.mk                     | 2 +-
 package/libcap/libcap.mk                           | 2 +-
 package/libcgroup/libcgroup.mk                     | 2 +-
 package/libconfuse/libconfuse.mk                   | 2 +-
 package/libdaemon/libdaemon.mk                     | 2 +-
 package/libesmtp/libesmtp.mk                       | 2 +-
 package/libevent/libevent.mk                       | 2 +-
 package/libexif/libexif.mk                         | 2 +-
 package/libffi/libffi.mk                           | 2 +-
 package/libfuse/libfuse.mk                         | 2 +-
 package/libgit2/libgit2.mk                         | 2 +-
 package/libical/libical.mk                         | 2 +-
 package/libjxl/libjxl.mk                           | 2 +-
 package/libmms/libmms.mk                           | 2 +-
 package/libnet/libnet.mk                           | 2 +-
 package/libnids/libnids.mk                         | 2 +-
 package/libnl/libnl.mk                             | 2 +-
 package/libqmi/libqmi.mk                           | 2 +-
 package/librsync/librsync.mk                       | 2 +-
 package/libsamplerate/libsamplerate.mk             | 2 +-
 package/libseccomp/libseccomp.mk                   | 2 +-
 package/libsndfile/libsndfile.mk                   | 2 +-
 package/libtirpc/libtirpc.mk                       | 2 +-
 package/libunwind/libunwind.mk                     | 2 +-
 package/libupnp/libupnp.mk                         | 2 +-
 package/libvncserver/libvncserver.mk               | 2 +-
 package/linuxptp/linuxptp.mk                       | 2 +-
 package/lldpd/lldpd.mk                             | 2 +-
 package/logrotate/logrotate.mk                     | 2 +-
 package/lrzsz/lrzsz.mk                             | 2 +-
 package/lsof/lsof.mk                               | 2 +-
 package/lynx/lynx.mk                               | 2 +-
 package/lz4/lz4.mk                                 | 2 +-
 package/lzo/lzo.mk                                 | 2 +-
 package/matio/matio.mk                             | 2 +-
 package/mdadm/mdadm.mk                             | 2 +-
 package/minicom/minicom.mk                         | 2 +-
 package/motion/motion.mk                           | 2 +-
 package/ncmpc/ncmpc.mk                             | 2 +-
 package/net-tools/net-tools.mk                     | 2 +-
 package/netcat/netcat.mk                           | 2 +-
 package/nettle/nettle.mk                           | 2 +-
 package/oniguruma/oniguruma.mk                     | 2 +-
 package/open-iscsi/open-iscsi.mk                   | 2 +-
 package/openblas/openblas.mk                       | 2 +-
 package/openrc/openrc.mk                           | 2 +-
 package/openresolv/openresolv.mk                   | 2 +-
 package/opensc/opensc.mk                           | 2 +-
 package/p11-kit/p11-kit.mk                         | 2 +-
 package/parted/parted.mk                           | 2 +-
 package/pcmanfm/pcmanfm.mk                         | 2 +-
 package/picocom/picocom.mk                         | 2 +-
 package/polkit/polkit.mk                           | 2 +-
 package/popt/popt.mk                               | 2 +-
 package/powerpc-utils/powerpc-utils.mk             | 2 +-
 package/procps-ng/procps-ng.mk                     | 2 +-
 package/protobuf-c/protobuf-c.mk                   | 2 +-
 package/proxychains-ng/proxychains-ng.mk           | 2 +-
 package/pugixml/pugixml.mk                         | 2 +-
 package/pwgen/pwgen.mk                             | 2 +-
 package/python-ecdsa/python-ecdsa.mk               | 2 +-
 package/python-engineio/python-engineio.mk         | 2 +-
 package/python-markdown2/python-markdown2.mk       | 2 +-
 package/python-rsa/python-rsa.mk                   | 2 +-
 package/qdecoder/qdecoder.mk                       | 2 +-
 package/qpdf/qpdf.mk                               | 2 +-
 package/quazip/quazip.mk                           | 2 +-
 package/quickjs/quickjs.mk                         | 2 +-
 package/rabbitmq-c/rabbitmq-c.mk                   | 2 +-
 package/rhash/rhash.mk                             | 2 +-
 package/ripgrep/ripgrep.mk                         | 2 +-
 package/rng-tools/rng-tools.mk                     | 2 +-
 package/rp-pppoe/rp-pppoe.mk                       | 2 +-
 package/rpcbind/rpcbind.mk                         | 2 +-
 package/rtl_433/rtl_433.mk                         | 2 +-
 package/rtmpdump/rtmpdump.mk                       | 2 +-
 package/sane-backends/sane-backends.mk             | 2 +-
 package/shellinabox/shellinabox.mk                 | 2 +-
 package/spice/spice.mk                             | 2 +-
 package/squashfs/squashfs.mk                       | 2 +-
 package/sslh/sslh.mk                               | 2 +-
 package/strace/strace.mk                           | 2 +-
 package/sylpheed/sylpheed.mk                       | 2 +-
 package/sysklogd/sysklogd.mk                       | 2 +-
 package/sysstat/sysstat.mk                         | 2 +-
 package/systemd/systemd.mk                         | 2 +-
 package/sysvinit/sysvinit.mk                       | 2 +-
 package/targetcli-fb/targetcli-fb.mk               | 2 +-
 package/tclap/tclap.mk                             | 2 +-
 package/tini/tini.mk                               | 2 +-
 package/tinyproxy/tinyproxy.mk                     | 2 +-
 package/tinyxml/tinyxml.mk                         | 2 +-
 package/tinyxml2/tinyxml2.mk                       | 2 +-
 package/tmux/tmux.mk                               | 2 +-
 package/tpm2-tools/tpm2-tools.mk                   | 2 +-
 package/trinity/trinity.mk                         | 2 +-
 package/unzip/unzip.mk                             | 2 +-
 package/upx/upx.mk                                 | 2 +-
 package/usbguard/usbguard.mk                       | 2 +-
 package/valijson/valijson.mk                       | 2 +-
 package/vsftpd/vsftpd.mk                           | 2 +-
 package/x11vnc/x11vnc.mk                           | 2 +-
 package/xscreensaver/xscreensaver.mk               | 2 +-
 package/yajl/yajl.mk                               | 2 +-
 package/yaml-cpp/yaml-cpp.mk                       | 2 +-
 package/zbar/zbar.mk                               | 2 +-
 package/zlog/zlog.mk                               | 2 +-
 package/zziplib/zziplib.mk                         | 2 +-
 173 files changed, 173 insertions(+), 173 deletions(-)

diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index a5371e1aea..6ae0581ef5 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -9,7 +9,7 @@ ACL_SOURCE = acl-$(ACL_VERSION).tar.xz
 ACL_SITE = https://download.savannah.nongnu.org/releases/acl
 ACL_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 ACL_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
-ACL_CPE_ID_VENDOR = acl_project
+ACL_CPE_ID_VALID = YES
 
 ACL_DEPENDENCIES = attr
 HOST_ACL_DEPENDENCIES = host-attr
diff --git a/package/asn1c/asn1c.mk b/package/asn1c/asn1c.mk
index a5fb9ccf1b..e76a9f84fd 100644
--- a/package/asn1c/asn1c.mk
+++ b/package/asn1c/asn1c.mk
@@ -8,6 +8,6 @@ ASN1C_VERSION = 0.9.28
 ASN1C_SITE = https://github.com/vlm/asn1c/releases/download/v$(ASN1C_VERSION)
 ASN1C_LICENSE = BSD-2-Clause
 ASN1C_LICENSE_FILES = LICENSE
-ASN1C_CPE_ID_VENDOR = asn1c_project
+ASN1C_CPE_ID_VALID = YES
 
 $(eval $(host-autotools-package))
diff --git a/package/atftp/atftp.mk b/package/atftp/atftp.mk
index 288501bc11..d41178cac4 100644
--- a/package/atftp/atftp.mk
+++ b/package/atftp/atftp.mk
@@ -8,7 +8,7 @@ ATFTP_VERSION = 0.8.0
 ATFTP_SITE = http://sourceforge.net/projects/atftp/files
 ATFTP_LICENSE = GPL-2.0+
 ATFTP_LICENSE_FILES = LICENSE
-ATFTP_CPE_ID_VENDOR = atftp_project
+ATFTP_CPE_ID_VALID = YES
 ATFTP_SELINUX_MODULES = tftp
 # No configure in tarball
 ATFTP_AUTORECONF = YES
diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index 6a0ff3a0d1..27cd537f64 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -8,7 +8,7 @@ ATOP_VERSION = 2.9.0
 ATOP_SITE = http://www.atoptool.nl/download
 ATOP_LICENSE = GPL-2.0+
 ATOP_LICENSE_FILES = COPYING
-ATOP_CPE_ID_VENDOR = atop_project
+ATOP_CPE_ID_VALID = YES
 ATOP_DEPENDENCIES = ncurses zlib
 
 ATOP_CFLAGS = $(TARGET_CFLAGS)
diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index 6ecf5c53f4..d1397921ff 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -9,7 +9,7 @@ ATTR_SOURCE = attr-$(ATTR_VERSION).tar.xz
 ATTR_SITE = http://download.savannah.gnu.org/releases/attr
 ATTR_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 ATTR_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
-ATTR_CPE_ID_VENDOR = attr_project
+ATTR_CPE_ID_VALID = YES
 
 ATTR_INSTALL_STAGING = YES
 
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index fbfbc8be34..90e5156e06 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -9,7 +9,7 @@ AXEL_SITE = https://github.com/axel-download-accelerator/axel/releases/download/
 AXEL_SOURCE = axel-$(AXEL_VERSION).tar.xz
 AXEL_LICENSE = GPL-2.0+
 AXEL_LICENSE_FILES = COPYING
-AXEL_CPE_ID_VENDOR = axel_project
+AXEL_CPE_ID_VALID = YES
 AXEL_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 
 # ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index bff703ee98..0e9c9d849c 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -10,7 +10,7 @@ BDWGC_SITE = https://github.com/ivmai/bdwgc/releases/download/v$(BDWGC_VERSION)
 BDWGC_INSTALL_STAGING = YES
 BDWGC_LICENSE = bdwgc license
 BDWGC_LICENSE_FILES = README.QUICK
-BDWGC_CPE_ID_VENDOR = bdwgc_project
+BDWGC_CPE_ID_VALID = YES
 BDWGC_DEPENDENCIES = libatomic_ops host-pkgconf
 HOST_BDWGC_DEPENDENCIES = host-libatomic_ops host-pkgconf
 
diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index 78c3c2ebb1..20e1a122d0 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -10,7 +10,7 @@ BEECRYPT_AUTORECONF = YES
 BEECRYPT_INSTALL_STAGING = YES
 BEECRYPT_LICENSE = LGPL-2.1+
 BEECRYPT_LICENSE_FILES = COPYING.LIB
-BEECRYPT_CPE_ID_VENDOR = beecrypt_project
+BEECRYPT_CPE_ID_VALID = YES
 
 BEECRYPT_CONF_OPTS = \
 	--disable-expert-mode \
diff --git a/package/blktrace/blktrace.mk b/package/blktrace/blktrace.mk
index d66a35227e..90038fc788 100644
--- a/package/blktrace/blktrace.mk
+++ b/package/blktrace/blktrace.mk
@@ -10,7 +10,7 @@ BLKTRACE_SITE = http://brick.kernel.dk/snaps
 BLKTRACE_DEPENDENCIES = libaio
 BLKTRACE_LICENSE = GPL-2.0+
 BLKTRACE_LICENSE_FILES = COPYING
-BLKTRACE_CPE_ID_VENDOR = blktrace_project
+BLKTRACE_CPE_ID_VALID = YES
 
 define BLKTRACE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(TARGET_CONFIGURE_OPTS)
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 74cf6175dd..b933e99785 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -9,7 +9,7 @@ BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
 BOTAN_LICENSE_FILES = license.txt
-BOTAN_CPE_ID_VENDOR = botan_project
+BOTAN_CPE_ID_VALID = YES
 
 BOTAN_INSTALL_STAGING = YES
 
diff --git a/package/bwm-ng/bwm-ng.mk b/package/bwm-ng/bwm-ng.mk
index bf3ed74afc..31edda0c23 100644
--- a/package/bwm-ng/bwm-ng.mk
+++ b/package/bwm-ng/bwm-ng.mk
@@ -9,7 +9,7 @@ BWM_NG_SITE = $(call github,vgropp,bwm-ng,v$(BWM_NG_VERSION))
 BWM_NG_CONF_OPTS = --with-procnetdev --with-diskstats
 BWM_NG_LICENSE = GPL-2.0+
 BWM_NG_LICENSE_FILES = COPYING
-BWM_NG_CPE_ID_VENDOR = bwm-ng_project
+BWM_NG_CPE_ID_VALID = YES
 BWM_NG_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index 707069870d..36ef1c8b12 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -9,7 +9,7 @@ C_ICAP_SOURCE = c_icap-$(C_ICAP_VERSION).tar.gz
 C_ICAP_SITE = http://downloads.sourceforge.net/c-icap
 C_ICAP_LICENSE = LGPL-2.1+
 C_ICAP_LICENSE_FILES = COPYING
-C_ICAP_CPE_ID_VENDOR = c-icap_project
+C_ICAP_CPE_ID_VALID = YES
 C_ICAP_INSTALL_STAGING = YES
 C_ICAP_CONFIG_SCRIPTS = c-icap-config c-icap-libicapapi-config
 C_ICAP_CONF_OPTS = \
diff --git a/package/c-periphery/c-periphery.mk b/package/c-periphery/c-periphery.mk
index 367ac319b3..e3745c4af6 100644
--- a/package/c-periphery/c-periphery.mk
+++ b/package/c-periphery/c-periphery.mk
@@ -9,6 +9,6 @@ C_PERIPHERY_SITE = $(call github,vsergeev,c-periphery,v$(C_PERIPHERY_VERSION))
 C_PERIPHERY_INSTALL_STAGING = YES
 C_PERIPHERY_LICENSE = MIT
 C_PERIPHERY_LICENSE_FILES = LICENSE
-C_PERIPHERY_CPE_ID_VENDOR = c-periphery_project
+C_PERIPHERY_CPE_ID_VALID = YES
 
 $(eval $(cmake-package))
diff --git a/package/cgroupfs-mount/cgroupfs-mount.mk b/package/cgroupfs-mount/cgroupfs-mount.mk
index acf7442056..5af87629ea 100644
--- a/package/cgroupfs-mount/cgroupfs-mount.mk
+++ b/package/cgroupfs-mount/cgroupfs-mount.mk
@@ -8,7 +8,7 @@ CGROUPFS_MOUNT_VERSION = 1.4
 CGROUPFS_MOUNT_SITE = $(call github,tianon,cgroupfs-mount,$(CGROUPFS_MOUNT_VERSION))
 CGROUPFS_MOUNT_LICENSE = GPL-3.0+
 CGROUPFS_MOUNT_LICENSE_FILES = debian/copyright
-CGROUPFS_MOUNT_CPE_ID_VENDOR = cgroupfs-mount_project
+CGROUPFS_MOUNT_CPE_ID_VALID = YES
 
 define CGROUPFS_MOUNT_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/cgroupfs-mount $(TARGET_DIR)/usr/bin/cgroupfs-mount
diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index 633ae21c00..629c1b59b2 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -8,7 +8,7 @@ CIVETWEB_VERSION = 1.16
 CIVETWEB_SITE = $(call github,civetweb,civetweb,v$(CIVETWEB_VERSION))
 CIVETWEB_LICENSE = MIT
 CIVETWEB_LICENSE_FILES = LICENSE.md
-CIVETWEB_CPE_ID_VENDOR = civetweb_project
+CIVETWEB_CPE_ID_VALID = YES
 
 CIVETWEB_CONF_OPTS = TARGET_OS=LINUX WITH_IPV6=1 \
 	$(if $(BR2_INSTALL_LIBSTDCPP),WITH_CPP=1)
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index f699c160ef..4719a3dc9b 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -9,7 +9,7 @@ CJSON_SITE = $(call github,DaveGamble,cjson,v$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
 CJSON_LICENSE_FILES = LICENSE
-CJSON_CPE_ID_VENDOR = cjson_project
+CJSON_CPE_ID_VALID = YES
 # Set ENABLE_CUSTOM_COMPILER_FLAGS to OFF in particular to disable
 # -fstack-protector-strong which depends on BR2_TOOLCHAIN_HAS_SSP
 CJSON_CONF_OPTS += \
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index f56be9ba5c..23d00b95c5 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -10,7 +10,7 @@ CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
-CMAKE_CPE_ID_VENDOR = cmake_project
+CMAKE_CPE_ID_VALID = YES
 # Tool download MITM attack warning if using npm package to install cmake
 CMAKE_IGNORE_CVES = CVE-2016-10642
 
diff --git a/package/cracklib/cracklib.mk b/package/cracklib/cracklib.mk
index c1834b4730..c5226b3326 100644
--- a/package/cracklib/cracklib.mk
+++ b/package/cracklib/cracklib.mk
@@ -9,7 +9,7 @@ CRACKLIB_SOURCE = cracklib-$(CRACKLIB_VERSION).tar.xz
 CRACKLIB_SITE = https://github.com/cracklib/cracklib/releases/download/v$(CRACKLIB_VERSION)
 CRACKLIB_LICENSE = LGPL-2.1
 CRACKLIB_LICENSE_FILES = COPYING.LIB
-CRACKLIB_CPE_ID_VENDOR = cracklib_project
+CRACKLIB_CPE_ID_VALID = YES
 CRACKLIB_INSTALL_STAGING = YES
 CRACKLIB_DEPENDENCIES = host-cracklib $(TARGET_NLS_DEPENDENCIES)
 CRACKLIB_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
diff --git a/package/crun/crun.mk b/package/crun/crun.mk
index a6088c13a0..005d5fb397 100644
--- a/package/crun/crun.mk
+++ b/package/crun/crun.mk
@@ -10,7 +10,7 @@ CRUN_DEPENDENCIES = host-pkgconf yajl
 
 CRUN_LICENSE = GPL-2.0+ (crun binary), LGPL-2.1+ (libcrun)
 CRUN_LICENSE_FILES = COPYING COPYING.libcrun
-CRUN_CPE_ID_VENDOR = crun_project
+CRUN_CPE_ID_VALID = YES
 
 CRUN_AUTORECONF = YES
 CRUN_CONF_OPTS = --disable-embedded-yajl
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 1b181e1b75..d17de96143 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -15,7 +15,7 @@ CRYPTSETUP_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES)
 CRYPTSETUP_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
-CRYPTSETUP_CPE_ID_VENDOR = cryptsetup_project
+CRYPTSETUP_CPE_ID_VALID = YES
 CRYPTSETUP_INSTALL_STAGING = YES
 
 CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
diff --git a/package/cups-pk-helper/cups-pk-helper.mk b/package/cups-pk-helper/cups-pk-helper.mk
index 2bd00c6912..2e057c2de0 100644
--- a/package/cups-pk-helper/cups-pk-helper.mk
+++ b/package/cups-pk-helper/cups-pk-helper.mk
@@ -9,7 +9,7 @@ CUPS_PK_HELPER_SITE = https://www.freedesktop.org/software/cups-pk-helper/releas
 CUPS_PK_HELPER_SOURCE = cups-pk-helper-$(CUPS_PK_HELPER_VERSION).tar.xz
 CUPS_PK_HELPER_LICENSE = GPL-2.0+
 CUPS_PK_HELPER_LICENSE_FILES = COPYING
-CUPS_PK_HELPER_CPE_ID_VENDOR = cups-pk-helper_project
+CUPS_PK_HELPER_CPE_ID_VALID = YES
 CUPS_PK_HELPER_DEPENDENCIES = cups libglib2 polkit
 
 $(eval $(meson-package))
diff --git a/package/darkhttpd/darkhttpd.mk b/package/darkhttpd/darkhttpd.mk
index e13f8f7770..956ef4042c 100644
--- a/package/darkhttpd/darkhttpd.mk
+++ b/package/darkhttpd/darkhttpd.mk
@@ -8,7 +8,7 @@ DARKHTTPD_VERSION = 1.15
 DARKHTTPD_SITE = $(call github,emikulic,darkhttpd,v$(DARKHTTPD_VERSION))
 DARKHTTPD_LICENSE = ISC
 DARKHTTPD_LICENSE_FILES = COPYING
-DARKHTTPD_CPE_ID_VENDOR = darkhttpd_project
+DARKHTTPD_CPE_ID_VALID = YES
 
 define DARKHTTPD_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
diff --git a/package/dbus-broker/dbus-broker.mk b/package/dbus-broker/dbus-broker.mk
index c4e3679a2e..4266441ac9 100644
--- a/package/dbus-broker/dbus-broker.mk
+++ b/package/dbus-broker/dbus-broker.mk
@@ -23,7 +23,7 @@ DBUS_BROKER_LICENSE_FILES = \
 	subprojects/libcstdaux-1/AUTHORS subprojects/libcstdaux-1/README.md \
 	subprojects/libcutf8-1/AUTHORS subprojects/libcutf8-1/README.md
 
-DBUS_BROKER_CPE_ID_VENDOR = dbus-broker_project
+DBUS_BROKER_CPE_ID_VALID = YES
 DBUS_BROKER_DEPENDENCIES = expat systemd
 DBUS_BROKER_CONF_OPTS = -Dlauncher=true
 
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index ab3f98dd5a..991c5cca57 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -10,7 +10,7 @@ DHCPCD_SITE = https://github.com/NetworkConfiguration/dhcpcd/releases/download/v
 DHCPCD_DEPENDENCIES = host-pkgconf
 DHCPCD_LICENSE = BSD-2-Clause
 DHCPCD_LICENSE_FILES = LICENSE
-DHCPCD_CPE_ID_VENDOR = dhcpcd_project
+DHCPCD_CPE_ID_VALID = YES
 
 DHCPCD_CONFIG_OPTS = \
 	--libexecdir=/lib/dhcpcd \
diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 26a28670c0..5019bd125d 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -8,7 +8,7 @@ DOSFSTOOLS_VERSION = 4.2
 DOSFSTOOLS_SITE = https://github.com/dosfstools/dosfstools/releases/download/v$(DOSFSTOOLS_VERSION)
 DOSFSTOOLS_LICENSE = GPL-3.0+
 DOSFSTOOLS_LICENSE_FILES = COPYING
-DOSFSTOOLS_CPE_ID_VENDOR = dosfstools_project
+DOSFSTOOLS_CPE_ID_VALID = YES
 DOSFSTOOLS_SELINUX_MODULES = fstools
 DOSFSTOOLS_CONF_OPTS = --enable-compat-symlinks --exec-prefix=/
 HOST_DOSFSTOOLS_CONF_OPTS = --enable-compat-symlinks
diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index 1de11d208d..8573e64055 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -8,7 +8,7 @@ DRACUT_VERSION = 059
 DRACUT_SITE = $(call github,dracutdevs,dracut,$(DRACUT_VERSION))
 DRACUT_LICENSE = GPL-2.0
 DRACUT_LICENSE_FILES = COPYING
-DRACUT_CPE_ID_VENDOR = dracut_project
+DRACUT_CPE_ID_VALID = YES
 
 HOST_DRACUT_DEPENDENCIES = host-pkgconf host-kmod host-prelink-cross
 
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index ff3ed49b37..5868ae0e5a 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -9,7 +9,7 @@ DTC_SOURCE = dtc-$(DTC_VERSION).tar.xz
 DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
 DTC_LICENSE = GPL-2.0+ or BSD-2-Clause (library)
 DTC_LICENSE_FILES = README.license GPL BSD-2-Clause
-DTC_CPE_ID_VENDOR = dtc_project
+DTC_CPE_ID_VALID = YES
 DTC_INSTALL_STAGING = YES
 DTC_DEPENDENCIES = host-bison host-flex host-pkgconf
 HOST_DTC_DEPENDENCIES = host-bison host-flex host-pkgconf
diff --git a/package/duktape/duktape.mk b/package/duktape/duktape.mk
index 9b5fb65f06..59fc17f7ed 100644
--- a/package/duktape/duktape.mk
+++ b/package/duktape/duktape.mk
@@ -11,7 +11,7 @@ DUKTAPE_SITE = \
 DUKTAPE_LICENSE = MIT
 DUKTAPE_LICENSE_FILES = LICENSE.txt
 DUKTAPE_INSTALL_STAGING = YES
-DUKTAPE_CPE_ID_VENDOR = duktape_project
+DUKTAPE_CPE_ID_VALID = YES
 
 define DUKTAPE_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) -f Makefile.sharedlibrary
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 7491f4c067..cbaac4f40b 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -9,7 +9,7 @@ E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
 E2FSPROGS_LICENSE_FILES = NOTICE lib/ss/mit-sipb-copyright.h lib/et/internal.h
-E2FSPROGS_CPE_ID_VENDOR = e2fsprogs_project
+E2FSPROGS_CPE_ID_VALID = YES
 E2FSPROGS_INSTALL_STAGING = YES
 
 # Use libblkid and libuuid from util-linux for host and target packages.
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index d43b545f2f..521c37a776 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -10,7 +10,7 @@ ELFUTILS_SITE = https://sourceware.org/elfutils/ftp/$(ELFUTILS_VERSION)
 ELFUTILS_INSTALL_STAGING = YES
 ELFUTILS_LICENSE = GPL-2.0+ or LGPL-3.0+ (library)
 ELFUTILS_LICENSE_FILES = COPYING COPYING-GPLV2 COPYING-LGPLV3
-ELFUTILS_CPE_ID_VENDOR = elfutils_project
+ELFUTILS_CPE_ID_VALID = YES
 ELFUTILS_DEPENDENCIES = host-pkgconf zlib $(TARGET_NLS_DEPENDENCIES)
 HOST_ELFUTILS_DEPENDENCIES = host-pkgconf host-zlib host-bzip2 host-xz
 
diff --git a/package/exempi/exempi.mk b/package/exempi/exempi.mk
index f808afd53c..b5156c1e3c 100644
--- a/package/exempi/exempi.mk
+++ b/package/exempi/exempi.mk
@@ -13,6 +13,6 @@ EXEMPI_DEPENDENCIES = host-pkgconf expat zlib \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 EXEMPI_LICENSE = BSD-3-Clause
 EXEMPI_LICENSE_FILES = COPYING
-EXEMPI_CPE_ID_VENDOR = exempi_project
+EXEMPI_CPE_ID_VALID = YES
 
 $(eval $(autotools-package))
diff --git a/package/exfat/exfat.mk b/package/exfat/exfat.mk
index a8efe5b0ba..d8c28464db 100644
--- a/package/exfat/exfat.mk
+++ b/package/exfat/exfat.mk
@@ -12,7 +12,7 @@ EXFAT_DEPENDENCIES = \
 	host-pkgconf
 EXFAT_LICENSE = GPL-2.0+
 EXFAT_LICENSE_FILES = COPYING
-EXFAT_CPE_ID_VENDOR = exfat_project
+EXFAT_CPE_ID_VALID = YES
 
 EXFAT_CONF_OPTS += --exec-prefix=/
 
diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index a92ab4fe3e..87f4487750 100644
--- a/package/f2fs-tools/f2fs-tools.mk
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -14,7 +14,7 @@ F2FS_TOOLS_AUTORECONF = YES
 F2FS_TOOLS_INSTALL_STAGING = YES
 F2FS_TOOLS_LICENSE = GPL-2.0
 F2FS_TOOLS_LICENSE_FILES = COPYING
-F2FS_TOOLS_CPE_ID_VENDOR = f2fs-tools_project
+F2FS_TOOLS_CPE_ID_VALID = YES
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 F2FS_TOOLS_CONF_OPTS += --with-selinux
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 3aa509abfe..df03deedde 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -10,7 +10,7 @@ FEH_SITE = http://feh.finalrewind.org
 FEH_DEPENDENCIES = imlib2 libpng xlib_libXt
 FEH_LICENSE = MIT
 FEH_LICENSE_FILES = COPYING
-FEH_CPE_ID_VENDOR = feh_project
+FEH_CPE_ID_VALID = YES
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 FEH_DEPENDENCIES += libcurl
diff --git a/package/file/file.mk b/package/file/file.mk
index 5fc540bc9d..b67fcaead4 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -8,7 +8,7 @@ FILE_VERSION = 5.45
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_LICENSE = BSD-2-Clause, BSD-4-Clause (one file), BSD-3-Clause (one file)
 FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
-FILE_CPE_ID_VENDOR = file_project
+FILE_CPE_ID_VALID = YES
 
 FILE_AUTORECONF = YES
 
diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index ab06af826e..6bac9ef8a7 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -11,7 +11,7 @@ FLAC_INSTALL_STAGING = YES
 FLAC_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 FLAC_LICENSE = Xiph BSD-like (libFLAC), GPL-2.0+ (tools), LGPL-2.1+ (other libraries)
 FLAC_LICENSE_FILES = COPYING.Xiph COPYING.GPL COPYING.LGPL
-FLAC_CPE_ID_VENDOR = flac_project
+FLAC_CPE_ID_VALID = YES
 
 FLAC_CONF_OPTS = \
 	$(if $(BR2_INSTALL_LIBSTDCPP),--enable-cpplibs,--disable-cpplibs) \
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index d2eb76e40a..11758a4c80 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -18,7 +18,7 @@ HOST_FONTCONFIG_DEPENDENCIES = \
 	host-gettext
 FONTCONFIG_LICENSE = fontconfig license
 FONTCONFIG_LICENSE_FILES = COPYING
-FONTCONFIG_CPE_ID_VENDOR = fontconfig_project
+FONTCONFIG_CPE_ID_VALID = YES
 
 FONTCONFIG_CONF_OPTS = \
 	--with-arch=$(GNU_TARGET_NAME) \
diff --git a/package/giflib/giflib.mk b/package/giflib/giflib.mk
index d91c77e2ee..3ac74f9244 100644
--- a/package/giflib/giflib.mk
+++ b/package/giflib/giflib.mk
@@ -9,7 +9,7 @@ GIFLIB_SITE = http://downloads.sourceforge.net/project/giflib
 GIFLIB_INSTALL_STAGING = YES
 GIFLIB_LICENSE = MIT
 GIFLIB_LICENSE_FILES = COPYING
-GIFLIB_CPE_ID_VENDOR = giflib_project
+GIFLIB_CPE_ID_VALID = YES
 
 # 0002-Fix-CVE-2022-28506.patch
 GIFLIB_IGNORE_CVES = CVE-2022-28506
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index 825863d080..91e9bfb9bf 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -8,7 +8,7 @@ GNUPLOT_VERSION = 5.4.10
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
-GNUPLOT_CPE_ID_VENDOR = gnuplot_project
+GNUPLOT_CPE_ID_VALID = YES
 
 GNUPLOT_AUTORECONF = YES
 
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index d7425513fd..1d4013d122 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -8,7 +8,7 @@ GPSD_VERSION = 3.25
 GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
 GPSD_LICENSE = BSD-2-Clause
 GPSD_LICENSE_FILES = COPYING
-GPSD_CPE_ID_VENDOR = gpsd_project
+GPSD_CPE_ID_VALID = YES
 GPSD_SELINUX_MODULES = gpsd
 GPSD_INSTALL_STAGING = YES
 
diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
index b0fcd5a598..bcc9c54beb 100644
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -10,7 +10,7 @@ GUTENPRINT_SITE = http://downloads.sourceforge.net/project/gimp-print/gutenprint
 GUTENPRINT_SOURCE = gutenprint-$(GUTENPRINT_VERSION).tar.bz2
 GUTENPRINT_LICENSE = GPL-2.0+
 GUTENPRINT_LICENSE_FILES = COPYING
-GUTENPRINT_CPE_ID_VENDOR = gutenprint_project
+GUTENPRINT_CPE_ID_VALID = YES
 
 # Needed, as we touch Makefile.am
 GUTENPRINT_AUTORECONF = YES
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 4435cbb736..599ea548d0 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -9,7 +9,7 @@ HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZ
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
 HARFBUZZ_LICENSE_FILES = COPYING
-HARFBUZZ_CPE_ID_VENDOR = harfbuzz_project
+HARFBUZZ_CPE_ID_VALID = YES
 HARFBUZZ_INSTALL_STAGING = YES
 HARFBUZZ_CONF_OPTS = \
 	-Dgdi=disabled \
diff --git a/package/haserl/haserl.mk b/package/haserl/haserl.mk
index 22950f4d6d..f2a9d714b7 100644
--- a/package/haserl/haserl.mk
+++ b/package/haserl/haserl.mk
@@ -8,7 +8,7 @@ HASERL_VERSION = 0.9.36
 HASERL_SITE = http://downloads.sourceforge.net/project/haserl/haserl-devel
 HASERL_LICENSE = GPL-2.0
 HASERL_LICENSE_FILES = COPYING
-HASERL_CPE_ID_VENDOR = haserl_project
+HASERL_CPE_ID_VALID = YES
 HASERL_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_HASERL_WITH_LUA),y)
diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index 59b64c358b..786d94a1aa 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -32,7 +32,7 @@ HOST_HEIMDAL_CONF_OPTS = \
 HOST_HEIMDAL_CONF_ENV = ac_cv_prog_COMPILE_ET=no MAKEINFO=true
 HEIMDAL_LICENSE = BSD-3-Clause
 HEIMDAL_LICENSE_FILES = LICENSE
-HEIMDAL_CPE_ID_VENDOR = heimdal_project
+HEIMDAL_CPE_ID_VALID = YES
 
 # We need compile_et for samba4
 define HOST_HEIMDAL_INSTALL_COMPILE_ET
diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index f8d1bcb4b0..99388d9537 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -9,7 +9,7 @@ I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.xz
 I2C_TOOLS_SITE = https://www.kernel.org/pub/software/utils/i2c-tools
 I2C_TOOLS_LICENSE = GPL-2.0+, GPL-2.0 (py-smbus), LGPL-2.1+ (libi2c)
 I2C_TOOLS_LICENSE_FILES = COPYING COPYING.LGPL README
-I2C_TOOLS_CPE_ID_VENDOR = i2c-tools_project
+I2C_TOOLS_CPE_ID_VALID = YES
 I2C_TOOLS_MAKE_OPTS = EXTRA=eeprog
 I2C_TOOLS_INSTALL_STAGING = YES
 
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index b3f1e217ff..4f2151904d 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -8,7 +8,7 @@ IPMITOOL_VERSION = 1_8_19
 IPMITOOL_SITE = $(call github,ipmitool,ipmitool,IPMITOOL_$(IPMITOOL_VERSION))
 IPMITOOL_LICENSE = BSD-3-Clause
 IPMITOOL_LICENSE_FILES = COPYING
-IPMITOOL_CPE_ID_VENDOR = ipmitool_project
+IPMITOOL_CPE_ID_VALID = YES
 # From git
 IPMITOOL_AUTORECONF = YES
 IPMITOOL_DEPENDENCIES = host-pkgconf
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 7e70f62ff2..4adb4e3356 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -11,7 +11,7 @@ IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBMNL),libmnl)
 IPROUTE2_LICENSE = GPL-2.0+
 IPROUTE2_LICENSE_FILES = COPYING
-IPROUTE2_CPE_ID_VENDOR = iproute2_project
+IPROUTE2_CPE_ID_VALID = YES
 
 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
 IPROUTE2_DEPENDENCIES += elfutils
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 58e44d673a..08d849e69d 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -8,7 +8,7 @@ IPUTILS_VERSION = 20240117
 IPUTILS_SITE = https://github.com/iputils/iputils/releases/download/$(IPUTILS_VERSION)
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
 IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
-IPUTILS_CPE_ID_VENDOR = iputils_project
+IPUTILS_CPE_ID_VALID = YES
 IPUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 # Selectively build binaries
diff --git a/package/iucode-tool/iucode-tool.mk b/package/iucode-tool/iucode-tool.mk
index b123973a90..e22e782804 100644
--- a/package/iucode-tool/iucode-tool.mk
+++ b/package/iucode-tool/iucode-tool.mk
@@ -9,7 +9,7 @@ IUCODE_TOOL_SOURCE = iucode-tool_$(IUCODE_TOOL_VERSION).tar.xz
 IUCODE_TOOL_SITE = https://gitlab.com/iucode-tool/releases/raw/master
 IUCODE_TOOL_LICENSE = GPL-2.0+
 IUCODE_TOOL_LICENSE_FILES = COPYING
-IUCODE_TOOL_CPE_ID_VENDOR = iucode-tool_project
+IUCODE_TOOL_CPE_ID_VALID = YES
 
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 IUCODE_TOOL_DEPENDENCIES += argp-standalone $(TARGET_NLS_DEPENDENCIES)
diff --git a/package/jansson/jansson.mk b/package/jansson/jansson.mk
index 99e1817eef..8efe28bf4a 100644
--- a/package/jansson/jansson.mk
+++ b/package/jansson/jansson.mk
@@ -10,7 +10,7 @@ JANSSON_SITE = \
 	https://github.com/akheron/jansson/releases/download/v$(JANSSON_VERSION)
 JANSSON_LICENSE = MIT
 JANSSON_LICENSE_FILES = LICENSE
-JANSSON_CPE_ID_VENDOR = jansson_project
+JANSSON_CPE_ID_VALID = YES
 JANSSON_INSTALL_STAGING = YES
 JANSSON_CONF_ENV = LIBS="-lm"
 
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 6b6bbcd6e6..45b9c49558 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -9,7 +9,7 @@ JASPER_SITE = https://github.com/jasper-software/jasper/releases/download/versio
 JASPER_INSTALL_STAGING = YES
 JASPER_LICENSE = JasPer-2.0
 JASPER_LICENSE_FILES = LICENSE
-JASPER_CPE_ID_VENDOR = jasper_project
+JASPER_CPE_ID_VALID = YES
 JASPER_SUPPORTS_IN_SOURCE_BUILD = NO
 JASPER_CONF_OPTS = \
 	-DJAS_ENABLE_DOC=OFF \
diff --git a/package/jhead/jhead.mk b/package/jhead/jhead.mk
index f07739bc21..940312780e 100644
--- a/package/jhead/jhead.mk
+++ b/package/jhead/jhead.mk
@@ -8,7 +8,7 @@ JHEAD_VERSION = 3.08
 JHEAD_SITE = $(call github,Matthias-Wandel,jhead,$(JHEAD_VERSION))
 JHEAD_LICENSE = Public Domain
 JHEAD_LICENSE_FILES = readme.txt
-JHEAD_CPE_ID_VENDOR = jhead_project
+JHEAD_CPE_ID_VALID = YES
 
 define JHEAD_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index 8c417fad31..ba27e22f7f 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -8,7 +8,7 @@ JQ_VERSION = 1.7.1
 JQ_SITE = https://github.com/jqlang/jq/releases/download/jq-$(JQ_VERSION)
 JQ_LICENSE = MIT (code), ICU (decNumber), CC-BY-3.0 (documentation)
 JQ_LICENSE_FILES = COPYING
-JQ_CPE_ID_VENDOR = jq_project
+JQ_CPE_ID_VALID = YES
 JQ_INSTALL_STAGING = YES
 
 # uses c99 specific features
diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.mk b/package/json-for-modern-cpp/json-for-modern-cpp.mk
index b89eb32a45..345280b346 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.mk
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.mk
@@ -9,7 +9,7 @@ JSON_FOR_MODERN_CPP_SOURCE = json-$(JSON_FOR_MODERN_CPP_VERSION).tar.gz
 JSON_FOR_MODERN_CPP_SITE = $(call github,nlohmann,json,v$(JSON_FOR_MODERN_CPP_VERSION))
 JSON_FOR_MODERN_CPP_LICENSE = MIT
 JSON_FOR_MODERN_CPP_LICENSE_FILES = LICENSE.MIT
-JSON_FOR_MODERN_CPP_CPE_ID_VENDOR = json-for-modern-cpp_project
+JSON_FOR_MODERN_CPP_CPE_ID_VALID = YES
 
 JSON_FOR_MODERN_CPP_INSTALL_STAGING = YES
 # header only library
diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index e7022bfd39..5ef62befbc 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -8,7 +8,7 @@ JSONCPP_VERSION = 1.9.5
 JSONCPP_SITE = $(call github,open-source-parsers,jsoncpp,$(JSONCPP_VERSION))
 JSONCPP_LICENSE = Public Domain or MIT
 JSONCPP_LICENSE_FILES = LICENSE
-JSONCPP_CPE_ID_VENDOR = jsoncpp_project
+JSONCPP_CPE_ID_VALID = YES
 JSONCPP_INSTALL_STAGING = YES
 JSONCPP_CONF_OPTS = -Dtests=false
 
diff --git a/package/jszip/jszip.mk b/package/jszip/jszip.mk
index b282610a0d..f038263a77 100644
--- a/package/jszip/jszip.mk
+++ b/package/jszip/jszip.mk
@@ -8,7 +8,7 @@ JSZIP_VERSION = 3.10.1
 JSZIP_SITE = $(call github,Stuk,jszip,v$(JSZIP_VERSION))
 JSZIP_LICENSE = MIT or GPL-3.0
 JSZIP_LICENSE_FILES = LICENSE.markdown
-JSZIP_CPE_ID_VENDOR = jszip_project
+JSZIP_CPE_ID_VALID = YES
 
 define JSZIP_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/dist/jszip.min.js \
diff --git a/package/keyutils/keyutils.mk b/package/keyutils/keyutils.mk
index 5af5c4e92c..fb387ed1a3 100644
--- a/package/keyutils/keyutils.mk
+++ b/package/keyutils/keyutils.mk
@@ -8,7 +8,7 @@ KEYUTILS_VERSION = 1.6.3
 KEYUTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git/snapshot
 KEYUTILS_LICENSE = GPL-2.0+, LGPL-2.1+
 KEYUTILS_LICENSE_FILES = LICENCE.GPL LICENCE.LGPL
-KEYUTILS_CPE_ID_VENDOR = keyutils_project
+KEYUTILS_CPE_ID_VALID = YES
 KEYUTILS_INSTALL_STAGING = YES
 
 KEYUTILS_MAKE_PARAMS = \
diff --git a/package/kvmtool/kvmtool.mk b/package/kvmtool/kvmtool.mk
index 9c58e44876..2bcd556f9b 100644
--- a/package/kvmtool/kvmtool.mk
+++ b/package/kvmtool/kvmtool.mk
@@ -17,7 +17,7 @@ KVMTOOL_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_ZLIB),zlib)
 KVMTOOL_LICENSE = GPL-2.0
 KVMTOOL_LICENSE_FILES = COPYING
-KVMTOOL_CPE_ID_VENDOR = kvmtool_project
+KVMTOOL_CPE_ID_VALID = YES
 
 # Disable -Werror, otherwise musl is not happy
 KVMTOOL_MAKE_OPTS = \
diff --git a/package/lame/lame.mk b/package/lame/lame.mk
index 3a57cffe3d..206e4407c9 100644
--- a/package/lame/lame.mk
+++ b/package/lame/lame.mk
@@ -12,7 +12,7 @@ LAME_CONF_ENV = GTK_CONFIG=/bin/false
 LAME_CONF_OPTS = --enable-dynamic-frontends
 LAME_LICENSE = LGPL-2.0+
 LAME_LICENSE_FILES = COPYING
-LAME_CPE_ID_VENDOR = lame_project
+LAME_CPE_ID_VALID = YES
 
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
 LAME_DEPENDENCIES += libsndfile
diff --git a/package/lapack/lapack.mk b/package/lapack/lapack.mk
index 3db2797202..3c1ab1fc67 100644
--- a/package/lapack/lapack.mk
+++ b/package/lapack/lapack.mk
@@ -8,7 +8,7 @@ LAPACK_VERSION = 3.10.1
 LAPACK_LICENSE = BSD-3-Clause
 LAPACK_LICENSE_FILES = LICENSE
 LAPACK_SITE = $(call github,Reference-LAPACK,lapack,v$(LAPACK_VERSION))
-LAPACK_CPE_ID_VENDOR = lapack_project
+LAPACK_CPE_ID_VALID = YES
 LAPACK_INSTALL_STAGING = YES
 LAPACK_SUPPORTS_IN_SOURCE_BUILD = NO
 LAPACK_CONF_OPTS = -DLAPACKE=ON -DCBLAS=ON
diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index 00b33b91fb..483ca298cd 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -9,7 +9,7 @@ LFTP_SOURCE = lftp-$(LFTP_VERSION).tar.xz
 LFTP_SITE = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPL-3.0+
 LFTP_LICENSE_FILES = COPYING
-LFTP_CPE_ID_VENDOR = lftp_project
+LFTP_CPE_ID_VALID = YES
 LFTP_DEPENDENCIES = readline zlib host-pkgconf
 
 # Help lftp finding readline and zlib
diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index 12cfbc4ef4..16cb502f16 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -9,7 +9,7 @@ LIBAIO_SITE = https://releases.pagure.org/libaio
 LIBAIO_INSTALL_STAGING = YES
 LIBAIO_LICENSE = LGPL-2.1+
 LIBAIO_LICENSE_FILES = COPYING
-LIBAIO_CPE_ID_VENDOR = libaio_project
+LIBAIO_CPE_ID_VALID = YES
 
 LIBAIO_CONFIGURE_OPTS = $(TARGET_CONFIGURE_OPTS)
 
diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index 8b14c899c4..f48673014a 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -12,7 +12,7 @@ LIBASS_SITE = https://github.com/libass/libass/releases/download/$(LIBASS_VERSIO
 LIBASS_INSTALL_STAGING = YES
 LIBASS_LICENSE = ISC
 LIBASS_LICENSE_FILES = COPYING
-LIBASS_CPE_ID_VENDOR = libass_project
+LIBASS_CPE_ID_VALID = YES
 LIBASS_DEPENDENCIES = \
 	host-pkgconf \
 	freetype \
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index bf6994b3a0..555ba678fe 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -16,7 +16,7 @@ LIBATOMIC_OPS_AUTORECONF = YES
 # library, libatomic_ops_gpl.a."
 LIBATOMIC_OPS_LICENSE = MIT (main library) / GPL-2.0+ (gpl extension)
 LIBATOMIC_OPS_LICENSE_FILES = COPYING LICENSE
-LIBATOMIC_OPS_CPE_ID_VENDOR = libatomic_ops_project
+LIBATOMIC_OPS_CPE_ID_VALID = YES
 
 LIBATOMIC_OPS_INSTALL_STAGING = YES
 
diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index 670dbee87e..ef33542f2d 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -8,7 +8,7 @@ LIBBPF_VERSION = 1.1.0
 LIBBPF_SITE = $(call github,libbpf,libbpf,v$(LIBBPF_VERSION))
 LIBBPF_LICENSE = GPL-2.0, LGPL-2.1, BSD-2-Clause
 LIBBPF_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.LGPL-2.1
-LIBBPF_CPE_ID_VENDOR = libbpf_project
+LIBBPF_CPE_ID_VALID = YES
 LIBBPF_DEPENDENCIES = host-bison host-flex host-pkgconf elfutils zlib
 HOST_LIBBPF_DEPENDENCIES = host-bison host-flex host-pkgconf host-elfutils host-zlib
 LIBBPF_INSTALL_STAGING = YES
diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index 5e3ca20029..2ec88810b4 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -8,7 +8,7 @@ LIBCAP_NG_VERSION = 0.8.4
 LIBCAP_NG_SITE = http://people.redhat.com/sgrubb/libcap-ng
 LIBCAP_NG_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
-LIBCAP_NG_CPE_ID_VENDOR = libcap-ng_project
+LIBCAP_NG_CPE_ID_VALID = YES
 LIBCAP_NG_INSTALL_STAGING = YES
 
 LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index c9727c75c9..fe2f24ad8c 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -9,7 +9,7 @@ LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
 LIBCAP_LICENSE_FILES = License
-LIBCAP_CPE_ID_VENDOR = libcap_project
+LIBCAP_CPE_ID_VALID = YES
 
 LIBCAP_DEPENDENCIES = host-gperf
 LIBCAP_INSTALL_STAGING = YES
diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
index e3de48c561..cfe1d0f9f8 100644
--- a/package/libcgroup/libcgroup.mk
+++ b/package/libcgroup/libcgroup.mk
@@ -8,7 +8,7 @@ LIBCGROUP_VERSION = 2.0.3
 LIBCGROUP_SITE = https://github.com/libcgroup/libcgroup/releases/download/v$(LIBCGROUP_VERSION)
 LIBCGROUP_LICENSE = LGPL-2.1
 LIBCGROUP_LICENSE_FILES = COPYING
-LIBCGROUP_CPE_ID_VENDOR = libcgroup_project
+LIBCGROUP_CPE_ID_VALID = YES
 LIBCGROUP_DEPENDENCIES = host-bison host-flex
 LIBCGROUP_INSTALL_STAGING = YES
 
diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index e7c2ef0a84..76123a7e6b 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -11,7 +11,7 @@ LIBCONFUSE_INSTALL_STAGING = YES
 LIBCONFUSE_CONF_OPTS = --disable-rpath
 LIBCONFUSE_LICENSE = ISC
 LIBCONFUSE_LICENSE_FILES = LICENSE
-LIBCONFUSE_CPE_ID_VENDOR = libconfuse_project
+LIBCONFUSE_CPE_ID_VALID = YES
 LIBCONFUSE_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 # 0001-Fix-163-unterminated-username-used-with-getpwnam.patch
diff --git a/package/libdaemon/libdaemon.mk b/package/libdaemon/libdaemon.mk
index cdf0819e68..aa9bb8080e 100644
--- a/package/libdaemon/libdaemon.mk
+++ b/package/libdaemon/libdaemon.mk
@@ -8,7 +8,7 @@ LIBDAEMON_VERSION = 0.14
 LIBDAEMON_SITE = http://0pointer.de/lennart/projects/libdaemon
 LIBDAEMON_LICENSE = LGPL-2.1+
 LIBDAEMON_LICENSE_FILES = LICENSE
-LIBDAEMON_CPE_ID_VENDOR = libdaemon_project
+LIBDAEMON_CPE_ID_VALID = YES
 
 LIBDAEMON_INSTALL_STAGING = YES
 LIBDAEMON_CONF_ENV = ac_cv_func_setpgrp_void=no
diff --git a/package/libesmtp/libesmtp.mk b/package/libesmtp/libesmtp.mk
index 10fe7bf324..6456e83e10 100644
--- a/package/libesmtp/libesmtp.mk
+++ b/package/libesmtp/libesmtp.mk
@@ -9,7 +9,7 @@ LIBESMTP_SITE = $(call github,libesmtp,libESMTP,v$(LIBESMTP_VERSION))
 LIBESMTP_INSTALL_STAGING = YES
 LIBESMTP_LICENSE = GPL-2.0+ (examples), LGPL-2.1+ (library)
 LIBESMTP_LICENSE_FILES = COPYING.GPL LICENSE
-LIBESMTP_CPE_ID_VENDOR = libesmtp_project
+LIBESMTP_CPE_ID_VALID = YES
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBESMTP_CONF_OPTS += -Dtls=enabled
diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 4c23156f72..355dfedcc1 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -10,7 +10,7 @@ LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
 LIBEVENT_INSTALL_STAGING = YES
 LIBEVENT_LICENSE = BSD-3-Clause, OpenBSD
 LIBEVENT_LICENSE_FILES = LICENSE
-LIBEVENT_CPE_ID_VENDOR = libevent_project
+LIBEVENT_CPE_ID_VALID = YES
 LIBEVENT_CONF_OPTS = \
 	--disable-libevent-regress \
 	--disable-samples
diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
index 921029b4ac..858901f40e 100644
--- a/package/libexif/libexif.mk
+++ b/package/libexif/libexif.mk
@@ -12,6 +12,6 @@ LIBEXIF_INSTALL_STAGING = YES
 LIBEXIF_DEPENDENCIES = host-pkgconf
 LIBEXIF_LICENSE = LGPL-2.1+
 LIBEXIF_LICENSE_FILES = COPYING
-LIBEXIF_CPE_ID_VENDOR = libexif_project
+LIBEXIF_CPE_ID_VALID = YES
 
 $(eval $(autotools-package))
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 8f6844113c..6249023eae 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -9,7 +9,7 @@ LIBFFI_SITE = \
 	https://github.com/libffi/libffi/releases/download/v$(LIBFFI_VERSION)
 LIBFFI_LICENSE = MIT
 LIBFFI_LICENSE_FILES = LICENSE
-LIBFFI_CPE_ID_VENDOR = libffi_project
+LIBFFI_CPE_ID_VALID = YES
 LIBFFI_INSTALL_STAGING = YES
 # We're patching Makefile.am
 LIBFFI_AUTORECONF = YES
diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index 723060931f..147b38b2e2 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -9,7 +9,7 @@ LIBFUSE_SOURCE = fuse-$(LIBFUSE_VERSION).tar.gz
 LIBFUSE_SITE = https://github.com/libfuse/libfuse/releases/download/fuse-$(LIBFUSE_VERSION)
 LIBFUSE_LICENSE = GPL-2.0, LGPL-2.1
 LIBFUSE_LICENSE_FILES = COPYING COPYING.LIB
-LIBFUSE_CPE_ID_VENDOR = libfuse_project
+LIBFUSE_CPE_ID_VALID = YES
 LIBFUSE_INSTALL_STAGING = YES
 # We're patching configure.ac
 LIBFUSE_AUTORECONF = YES
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 92563d24bb..46ccc1e517 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -15,7 +15,7 @@ LIBGIT2_LICENSE = \
 	BSD-2-Clause (basename_r), \
 	LGPL-2.1+ (libxdiff)
 LIBGIT2_LICENSE_FILES = COPYING
-LIBGIT2_CPE_ID_VENDOR = libgit2_project
+LIBGIT2_CPE_ID_VALID = YES
 LIBGIT2_INSTALL_STAGING = YES
 
 LIBGIT2_CONF_OPTS = \
diff --git a/package/libical/libical.mk b/package/libical/libical.mk
index afbbfd98c8..992ef51375 100644
--- a/package/libical/libical.mk
+++ b/package/libical/libical.mk
@@ -9,7 +9,7 @@ LIBICAL_SITE = https://github.com/libical/libical/releases/download/v$(LIBICAL_V
 LIBICAL_INSTALL_STAGING = YES
 LIBICAL_LICENSE = MPL-1.0 or LGPL-2.1
 LIBICAL_LICENSE_FILES = LICENSE
-LIBICAL_CPE_ID_VENDOR = libical_project
+LIBICAL_CPE_ID_VALID = YES
 
 # 0002-icaltypes-c-icalreqstattype_from_string-copy-the-reqstattype.patch
 LIBICAL_IGNORE_CVES += CVE-2016-9584
diff --git a/package/libjxl/libjxl.mk b/package/libjxl/libjxl.mk
index d2c5e70c98..4072633ffe 100644
--- a/package/libjxl/libjxl.mk
+++ b/package/libjxl/libjxl.mk
@@ -8,7 +8,7 @@ LIBJXL_VERSION = 0.9.0
 LIBJXL_SITE = $(call github,libjxl,libjxl,v$(LIBJXL_VERSION))
 LIBJXL_LICENSE = BSD-3-Clause
 LIBJXL_LICENSE_FILES = LICENSE PATENTS
-LIBJXL_CPE_ID_VENDOR = libjxl_project
+LIBJXL_CPE_ID_VALID = YES
 LIBJXL_INSTALL_STAGING = YES
 
 LIBJXL_DEPENDENCIES = \
diff --git a/package/libmms/libmms.mk b/package/libmms/libmms.mk
index a4c40ad60a..1140996cb8 100644
--- a/package/libmms/libmms.mk
+++ b/package/libmms/libmms.mk
@@ -10,6 +10,6 @@ LIBMMS_INSTALL_STAGING = YES
 LIBMMS_DEPENDENCIES = host-pkgconf libglib2
 LIBMMS_LICENSE = LGPL-2.1+
 LIBMMS_LICENSE_FILES = COPYING.LIB
-LIBMMS_CPE_ID_VENDOR = libmms_project
+LIBMMS_CPE_ID_VALID = YES
 
 $(eval $(autotools-package))
diff --git a/package/libnet/libnet.mk b/package/libnet/libnet.mk
index a803fcd17a..3bc9e30dfa 100644
--- a/package/libnet/libnet.mk
+++ b/package/libnet/libnet.mk
@@ -14,7 +14,7 @@ LIBNET_CONF_OPTS = \
 	--disable-doxygen-doc
 LIBNET_LICENSE = BSD-2-Clause, BSD-3-Clause
 LIBNET_LICENSE_FILES = LICENSE
-LIBNET_CPE_ID_VENDOR = libnet_project
+LIBNET_CPE_ID_VALID = YES
 LIBNET_CONFIG_SCRIPTS = libnet-config
 
 $(eval $(autotools-package))
diff --git a/package/libnids/libnids.mk b/package/libnids/libnids.mk
index 40620eca57..712630bac8 100644
--- a/package/libnids/libnids.mk
+++ b/package/libnids/libnids.mk
@@ -8,7 +8,7 @@ LIBNIDS_VERSION = 1.26
 LIBNIDS_SITE = $(call github,MITRECND,libnids,$(LIBNIDS_VERSION))
 LIBNIDS_LICENSE = GPL-2.0
 LIBNIDS_LICENSE_FILES = COPYING
-LIBNIDS_CPE_ID_VENDOR = libnids_project
+LIBNIDS_CPE_ID_VALID = YES
 LIBNIDS_INSTALL_STAGING = YES
 LIBNIDS_DEPENDENCIES = host-pkgconf libpcap
 LIBNIDS_AUTORECONF = YES
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 8fbea3db5f..6f50fd6afc 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -8,7 +8,7 @@ LIBNL_VERSION = 3.9.0
 LIBNL_SITE = https://github.com/thom311/libnl/releases/download/libnl$(subst .,_,$(LIBNL_VERSION))
 LIBNL_LICENSE = LGPL-2.1+
 LIBNL_LICENSE_FILES = COPYING
-LIBNL_CPE_ID_VENDOR = libnl_project
+LIBNL_CPE_ID_VALID = YES
 
 LIBNL_INSTALL_STAGING = YES
 LIBNL_DEPENDENCIES = host-bison host-flex host-pkgconf
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index c3db50a92c..eae41446e2 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -8,7 +8,7 @@ LIBQMI_VERSION = 1.32.2
 LIBQMI_SITE = https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/archive/$(LIBQMI_VERSION)
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
-LIBQMI_CPE_ID_VENDOR = libqmi_project
+LIBQMI_CPE_ID_VALID = YES
 LIBQMI_INSTALL_STAGING = YES
 
 LIBQMI_DEPENDENCIES = libglib2
diff --git a/package/librsync/librsync.mk b/package/librsync/librsync.mk
index 1465963c61..26c003be21 100644
--- a/package/librsync/librsync.mk
+++ b/package/librsync/librsync.mk
@@ -8,7 +8,7 @@ LIBRSYNC_VERSION = 2.3.4
 LIBRSYNC_SITE = https://github.com/librsync/librsync/releases/download/v$(LIBRSYNC_VERSION)
 LIBRSYNC_LICENSE = LGPL-2.1+
 LIBRSYNC_LICENSE_FILES = COPYING
-LIBRSYNC_CPE_ID_VENDOR = librsync_project
+LIBRSYNC_CPE_ID_VALID = YES
 LIBRSYNC_INSTALL_STAGING = YES
 LIBRSYNC_DEPENDENCIES = host-pkgconf zlib bzip2 popt
 
diff --git a/package/libsamplerate/libsamplerate.mk b/package/libsamplerate/libsamplerate.mk
index 2844fde33c..0ac3c42451 100644
--- a/package/libsamplerate/libsamplerate.mk
+++ b/package/libsamplerate/libsamplerate.mk
@@ -17,7 +17,7 @@ LIBSAMPLERATE_CONF_OPTS = \
 	--program-transform-name=''
 LIBSAMPLERATE_LICENSE = BSD-2-Clause
 LIBSAMPLERATE_LICENSE_FILES = COPYING
-LIBSAMPLERATE_CPE_ID_VENDOR = libsamplerate_project
+LIBSAMPLERATE_CPE_ID_VALID = YES
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 LIBSAMPLERATE_DEPENDENCIES += alsa-lib
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index ff295e986a..10d57bb78c 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -8,7 +8,7 @@ LIBSECCOMP_VERSION = 2.5.5
 LIBSECCOMP_SITE = https://github.com/seccomp/libseccomp/releases/download/v$(LIBSECCOMP_VERSION)
 LIBSECCOMP_LICENSE = LGPL-2.1
 LIBSECCOMP_LICENSE_FILES = LICENSE
-LIBSECCOMP_CPE_ID_VENDOR = libseccomp_project
+LIBSECCOMP_CPE_ID_VALID = YES
 LIBSECCOMP_INSTALL_STAGING = YES
 LIBSECCOMP_DEPENDENCIES = host-gperf
 
diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index 89eb4f3c1d..dc23d94cb1 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -10,7 +10,7 @@ LIBSNDFILE_SITE = https://github.com/libsndfile/libsndfile/releases/download/$(L
 LIBSNDFILE_INSTALL_STAGING = YES
 LIBSNDFILE_LICENSE = LGPL-2.1+
 LIBSNDFILE_LICENSE_FILES = COPYING
-LIBSNDFILE_CPE_ID_VENDOR = libsndfile_project
+LIBSNDFILE_CPE_ID_VALID = YES
 LIBSNDFILE_DEPENDENCIES = host-pkgconf
 
 LIBSNDFILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 298b3c36bd..04196f2f7c 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -9,7 +9,7 @@ LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
 LIBTIRPC_SITE = http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
 LIBTIRPC_LICENSE = BSD-3-Clause
 LIBTIRPC_LICENSE_FILES = COPYING
-LIBTIRPC_CPE_ID_VENDOR = libtirpc_project
+LIBTIRPC_CPE_ID_VALID = YES
 
 LIBTIRPC_INSTALL_STAGING = YES
 
diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
index afc17f7b25..d7ddb8f179 100644
--- a/package/libunwind/libunwind.mk
+++ b/package/libunwind/libunwind.mk
@@ -9,7 +9,7 @@ LIBUNWIND_SITE = http://download.savannah.gnu.org/releases/libunwind
 LIBUNWIND_INSTALL_STAGING = YES
 LIBUNWIND_LICENSE_FILES = COPYING
 LIBUNWIND_LICENSE = MIT
-LIBUNWIND_CPE_ID_VENDOR = libunwind_project
+LIBUNWIND_CPE_ID_VALID = YES
 LIBUNWIND_AUTORECONF = YES
 
 LIBUNWIND_CONF_OPTS = \
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index f8551a2a0d..61e52c095a 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -12,7 +12,7 @@ LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
 LIBUPNP_INSTALL_STAGING = YES
 LIBUPNP_LICENSE = BSD-3-Clause
 LIBUPNP_LICENSE_FILES = COPYING
-LIBUPNP_CPE_ID_VENDOR = libupnp_project
+LIBUPNP_CPE_ID_VALID = YES
 LIBUPNP_DEPENDENCIES = host-pkgconf
 
 # Bind the internal miniserver socket with reuseaddr to allow clean restarts.
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index 700e26a8d6..3a15a82d08 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -9,7 +9,7 @@ LIBVNCSERVER_SOURCE = LibVNCServer-$(LIBVNCSERVER_VERSION).tar.gz
 LIBVNCSERVER_SITE = https://github.com/LibVNC/libvncserver/archive
 LIBVNCSERVER_LICENSE = GPL-2.0+
 LIBVNCSERVER_LICENSE_FILES = COPYING
-LIBVNCSERVER_CPE_ID_VENDOR = libvncserver_project
+LIBVNCSERVER_CPE_ID_VALID = YES
 LIBVNCSERVER_INSTALL_STAGING = YES
 LIBVNCSERVER_DEPENDENCIES = host-pkgconf lzo
 LIBVNCSERVER_CONF_OPTS = -DWITH_LZO=ON
diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
index e0ab82a2c4..eea41f0baf 100644
--- a/package/linuxptp/linuxptp.mk
+++ b/package/linuxptp/linuxptp.mk
@@ -9,7 +9,7 @@ LINUXPTP_SOURCE = linuxptp-$(LINUXPTP_VERSION).tgz
 LINUXPTP_SITE = http://downloads.sourceforge.net/linuxptp
 LINUXPTP_LICENSE = GPL-2.0+
 LINUXPTP_LICENSE_FILES = COPYING
-LINUXPTP_CPE_ID_VENDOR = linuxptp_project
+LINUXPTP_CPE_ID_VALID = YES
 
 LINUXPTP_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index 75457a25e3..34e1c8c249 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -14,7 +14,7 @@ LLDPD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_VALGRIND),valgrind)
 LLDPD_LICENSE = ISC
 LLDPD_LICENSE_FILES = LICENSE
-LLDPD_CPE_ID_VENDOR = lldpd_project
+LLDPD_CPE_ID_VALID = YES
 
 # Detection of c99 support in configure fails without WCHAR. To enable
 # automatic detection of c99 support by configure, we need to enable
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 37c48121f1..3fed1b957f 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -9,7 +9,7 @@ LOGROTATE_SOURCE = logrotate-$(LOGROTATE_VERSION).tar.xz
 LOGROTATE_SITE = https://github.com/logrotate/logrotate/releases/download/$(LOGROTATE_VERSION)
 LOGROTATE_LICENSE = GPL-2.0+
 LOGROTATE_LICENSE_FILES = COPYING
-LOGROTATE_CPE_ID_VENDOR = logrotate_project
+LOGROTATE_CPE_ID_VALID = YES
 LOGROTATE_DEPENDENCIES = popt host-pkgconf
 LOGROTATE_SELINUX_MODULES = logrotate
 LOGROTATE_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs popt`"
diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index 3897975d73..d9be23540e 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -9,7 +9,7 @@ LRZSZ_SITE = http://www.ohse.de/uwe/releases
 LRZSZ_CONF_OPTS = --disable-timesync
 LRZSZ_LICENSE = GPL-2.0+
 LRZSZ_LICENSE_FILES = COPYING
-LRZSZ_CPE_ID_VENDOR = lrzsz_project
+LRZSZ_CPE_ID_VALID = YES
 LRZSZ_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 LRZSZ_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 1831080b17..cb4e987bd5 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -8,7 +8,7 @@ LSOF_VERSION = 4.99.3
 LSOF_SITE = $(call github,lsof-org,lsof,$(LSOF_VERSION))
 LSOF_LICENSE = lsof license
 LSOF_LICENSE_FILES = COPYING
-LSOF_CPE_ID_VENDOR = lsof_project
+LSOF_CPE_ID_VALID = YES
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 LSOF_DEPENDENCIES += libtirpc
diff --git a/package/lynx/lynx.mk b/package/lynx/lynx.mk
index b441eacef7..da57eb2601 100644
--- a/package/lynx/lynx.mk
+++ b/package/lynx/lynx.mk
@@ -13,7 +13,7 @@ LYNX_PATCH = \
 LYNX_IGNORE_CVES += CVE-2021-38165
 LYNX_LICENSE = GPL-2.0
 LYNX_LICENSE_FILES = COPYING
-LYNX_CPE_ID_VENDOR = lynx_project
+LYNX_CPE_ID_VALID = YES
 
 LYNX_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 
diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index 5da1ae2703..202dc172f7 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -9,7 +9,7 @@ LZ4_SITE = $(call github,lz4,lz4,v$(LZ4_VERSION))
 LZ4_INSTALL_STAGING = YES
 LZ4_LICENSE = BSD-2-Clause (library), GPL-2.0+ (programs)
 LZ4_LICENSE_FILES = lib/LICENSE programs/COPYING
-LZ4_CPE_ID_VENDOR = lz4_project
+LZ4_CPE_ID_VALID = YES
 
 ifeq ($(BR2_STATIC_LIBS),y)
 LZ4_MAKE_OPTS += BUILD_SHARED=no
diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index 0682d8d0ff..76c00615d5 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -8,7 +8,7 @@ LZO_VERSION = 2.10
 LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
 LZO_LICENSE = GPL-2.0+
 LZO_LICENSE_FILES = COPYING
-LZO_CPE_ID_VENDOR = lzo_project
+LZO_CPE_ID_VALID = YES
 LZO_INSTALL_STAGING = YES
 LZO_SUPPORTS_IN_SOURCE_BUILD = NO
 
diff --git a/package/matio/matio.mk b/package/matio/matio.mk
index d8268a109f..dc9be2ac18 100644
--- a/package/matio/matio.mk
+++ b/package/matio/matio.mk
@@ -10,7 +10,7 @@ MATIO_SITE = \
 	https://downloads.sourceforge.net/project/matio/matio/$(MATIO_VERSION)
 MATIO_LICENSE = BSD-2-Clause
 MATIO_LICENSE_FILES = COPYING
-MATIO_CPE_ID_VENDOR = matio_project
+MATIO_CPE_ID_VALID = YES
 MATIO_DEPENDENCIES = zlib
 MATIO_INSTALL_STAGING = YES
 
diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index ef518cd238..b54e34b230 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -9,7 +9,7 @@ MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.xz
 MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
 MDADM_LICENSE = GPL-2.0+
 MDADM_LICENSE_FILES = COPYING
-MDADM_CPE_ID_VENDOR = mdadm_project
+MDADM_CPE_ID_VALID = YES
 
 MDADM_CXFLAGS = $(TARGET_CFLAGS)
 
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index 2f10fe627b..8bc5717417 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -10,7 +10,7 @@ MINICOM_SITE = \
 	https://salsa.debian.org/minicom-team/minicom/-/archive/$(MINICOM_VERSION)
 MINICOM_LICENSE = GPL-2.0+
 MINICOM_LICENSE_FILES = COPYING
-MINICOM_CPE_ID_VENDOR = minicom_project
+MINICOM_CPE_ID_VALID = YES
 
 MINICOM_DEPENDENCIES = ncurses $(if $(BR2_ENABLE_LOCALE),,libiconv) \
 	$(TARGET_NLS_DEPENDENCIES) host-pkgconf
diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index 554d056999..a42c2ad149 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -8,7 +8,7 @@ MOTION_VERSION = 4.6.0
 MOTION_SITE = $(call github,Motion-Project,motion,release-$(MOTION_VERSION))
 MOTION_LICENSE = GPL-2.0
 MOTION_LICENSE_FILES = LICENSE
-MOTION_CPE_ID_VENDOR = motion_project
+MOTION_CPE_ID_VALID = YES
 MOTION_DEPENDENCIES = host-pkgconf jpeg libmicrohttpd $(TARGET_NLS_DEPENDENCIES)
 # From git
 MOTION_AUTORECONF = YES
diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index bc8a62daea..ee75c2a676 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -16,7 +16,7 @@ NCMPC_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES)
 NCMPC_LICENSE = GPL-2.0+
 NCMPC_LICENSE_FILES = COPYING
-NCMPC_CPE_ID_VENDOR = ncmpc_project
+NCMPC_CPE_ID_VALID = YES
 
 NCMPC_CONF_OPTS = \
 	-Dcurses=ncurses \
diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
index 4a03e3d846..0744bf18cb 100644
--- a/package/net-tools/net-tools.mk
+++ b/package/net-tools/net-tools.mk
@@ -10,7 +10,7 @@ NET_TOOLS_SITE = http://downloads.sourceforge.net/project/net-tools
 NET_TOOLS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 NET_TOOLS_LICENSE = GPL-2.0+
 NET_TOOLS_LICENSE_FILES = COPYING
-NET_TOOLS_CPE_ID_VENDOR = net-tools_project
+NET_TOOLS_CPE_ID_VALID = YES
 
 define NET_TOOLS_CONFIGURE_CMDS
 	(cd $(@D); yes "" | ./configure.sh config.in )
diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
index 939c9fa9fb..c9d7952e59 100644
--- a/package/netcat/netcat.mk
+++ b/package/netcat/netcat.mk
@@ -8,6 +8,6 @@ NETCAT_VERSION = 0.7.1
 NETCAT_SITE = http://downloads.sourceforge.net/project/netcat/netcat/$(NETCAT_VERSION)
 NETCAT_LICENSE = GPL-2.0+
 NETCAT_LICENSE_FILES = COPYING
-NETCAT_CPE_ID_VENDOR = netcat_project
+NETCAT_CPE_ID_VALID = YES
 
 $(eval $(autotools-package))
diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index adeaf40868..20f755cc98 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -10,7 +10,7 @@ NETTLE_DEPENDENCIES = host-m4 gmp
 NETTLE_INSTALL_STAGING = YES
 NETTLE_LICENSE = Dual GPL-2.0+/LGPL-3.0+
 NETTLE_LICENSE_FILES = COPYING.LESSERv3 COPYINGv2
-NETTLE_CPE_ID_VENDOR = nettle_project
+NETTLE_CPE_ID_VALID = YES
 # don't include openssl support for (unused) examples as it has problems
 # with static linking
 NETTLE_CONF_OPTS = --disable-openssl
diff --git a/package/oniguruma/oniguruma.mk b/package/oniguruma/oniguruma.mk
index 1e8a119cf1..e056048cb5 100644
--- a/package/oniguruma/oniguruma.mk
+++ b/package/oniguruma/oniguruma.mk
@@ -10,7 +10,7 @@ ONIGURUMA_SITE = \
 ONIGURUMA_SOURCE = onig-$(ONIGURUMA_VERSION).tar.gz
 ONIGURUMA_LICENSE = BSD-2-Clause
 ONIGURUMA_LICENSE_FILES = COPYING
-ONIGURUMA_CPE_ID_VENDOR = oniguruma_project
+ONIGURUMA_CPE_ID_VALID = YES
 ONIGURUMA_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
diff --git a/package/open-iscsi/open-iscsi.mk b/package/open-iscsi/open-iscsi.mk
index 00370a339a..d1f40d3e20 100644
--- a/package/open-iscsi/open-iscsi.mk
+++ b/package/open-iscsi/open-iscsi.mk
@@ -8,7 +8,7 @@ OPEN_ISCSI_VERSION = 2.1.9
 OPEN_ISCSI_SITE = $(call github,open-iscsi,open-iscsi,$(OPEN_ISCSI_VERSION))
 OPEN_ISCSI_LICENSE = GPL-2.0+, GPL-3.0+, LGPL-3.0+
 OPEN_ISCSI_LICENSE_FILES = COPYING README libopeniscsiusr/COPYING
-OPEN_ISCSI_CPE_ID_VENDOR = open-iscsi_project
+OPEN_ISCSI_CPE_ID_VALID = YES
 OPEN_ISCSI_DEPENDENCIES = kmod open-isns openssl util-linux
 
 OPEN_ISCSI_CONF_OPTS = -Ddbroot=/var/lib/iscsi
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index 2d6cdaa7bb..a678153d7b 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -9,7 +9,7 @@ OPENBLAS_SITE = https://github.com/OpenMathLib/OpenBLAS/releases/download/v$(OPE
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
 OPENBLAS_INSTALL_STAGING = YES
-OPENBLAS_CPE_ID_VENDOR = openblas_project
+OPENBLAS_CPE_ID_VALID = YES
 
 # Initialise OpenBLAS make options to $(TARGET_CONFIGURE_OPTS)
 OPENBLAS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 0dd6a5d1ac..f8e51f6720 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -8,7 +8,7 @@ OPENRC_VERSION = 0.52.1
 OPENRC_SITE = $(call github,OpenRC,openrc,$(OPENRC_VERSION))
 OPENRC_LICENSE = BSD-2-Clause
 OPENRC_LICENSE_FILES = LICENSE
-OPENRC_CPE_ID_VENDOR = openrc_project
+OPENRC_CPE_ID_VALID = YES
 
 OPENRC_DEPENDENCIES = ncurses
 
diff --git a/package/openresolv/openresolv.mk b/package/openresolv/openresolv.mk
index 176f6dab3a..8a8b578781 100644
--- a/package/openresolv/openresolv.mk
+++ b/package/openresolv/openresolv.mk
@@ -9,7 +9,7 @@ OPENRESOLV_SITE = https://github.com/rsmarples/openresolv/releases/download/v$(O
 OPENRESOLV_SOURCE = openresolv-$(OPENRESOLV_VERSION).tar.xz
 OPENRESOLV_LICENSE = BSD-2-Clause
 OPENRESOLV_LICENSE_FILES = LICENSE
-OPENRESOLV_CPE_ID_VENDOR = openresolv_project
+OPENRESOLV_CPE_ID_VALID = YES
 
 define OPENRESOLV_CONFIGURE_CMDS
 	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure --sysconfdir=/etc
diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
index 49bdcae37a..aa82bd18da 100644
--- a/package/opensc/opensc.mk
+++ b/package/opensc/opensc.mk
@@ -8,7 +8,7 @@ OPENSC_VERSION = 0.24.0
 OPENSC_SITE = https://github.com/OpenSC/OpenSC/releases/download/$(OPENSC_VERSION)
 OPENSC_LICENSE = LGPL-2.1+
 OPENSC_LICENSE_FILES = COPYING
-OPENSC_CPE_ID_VENDOR = opensc_project
+OPENSC_CPE_ID_VALID = YES
 OPENSC_DEPENDENCIES = openssl pcsc-lite
 OPENSC_INSTALL_STAGING = YES
 OPENSC_CONF_OPTS = --disable-cmocka --disable-strict --disable-tests
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 8547ee33c2..53e953e070 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -13,7 +13,7 @@ P11_KIT_CONF_ENV = ac_cv_have_decl_program_invocation_short_name=yes \
 	ac_cv_have_decl___progname=no
 P11_KIT_LICENSE = BSD-3-Clause
 P11_KIT_LICENSE_FILES = COPYING
-P11_KIT_CPE_ID_VENDOR = p11-kit_project
+P11_KIT_CPE_ID_VALID = YES
 
 ifeq ($(BR2_PACKAGE_LIBFFI),y)
 P11_KIT_DEPENDENCIES += host-pkgconf libffi
diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index bfd9ef3432..5b55a9f21e 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -11,7 +11,7 @@ PARTED_DEPENDENCIES = host-pkgconf util-linux
 PARTED_INSTALL_STAGING = YES
 PARTED_LICENSE = GPL-3.0+
 PARTED_LICENSE_FILES = COPYING
-PARTED_CPE_ID_VENDOR = parted_project
+PARTED_CPE_ID_VALID = YES
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 PARTED_DEPENDENCIES += readline
diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index 1379b19f5d..9b233f614d 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -10,7 +10,7 @@ PCMANFM_SITE = http://sourceforge.net/projects/pcmanfm/files
 PCMANFM_DEPENDENCIES = libglib2 menu-cache libfm $(TARGET_NLS_DEPENDENCIES)
 PCMANFM_LICENSE = GPL-2.0+
 PCMANFM_LICENSE_FILES = COPYING
-PCMANFM_CPE_ID_VENDOR = pcmanfm_project
+PCMANFM_CPE_ID_VALID = YES
 PCMANFM_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
index 2828c98fb7..bb55c3c1d1 100644
--- a/package/picocom/picocom.mk
+++ b/package/picocom/picocom.mk
@@ -8,7 +8,7 @@ PICOCOM_VERSION = 2023-04
 PICOCOM_SITE = $(call gitlab,wsakernel,picocom,$(PICOCOM_VERSION))
 PICOCOM_LICENSE = GPL-2.0+
 PICOCOM_LICENSE_FILES = LICENSE.txt
-PICOCOM_CPE_ID_VENDOR = picocom_project
+PICOCOM_CPE_ID_VALID = YES
 
 define PICOCOM_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index f58dbe43de..e393672c1e 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -8,7 +8,7 @@ POLKIT_VERSION = 123
 POLKIT_SITE = https://gitlab.freedesktop.org/polkit/polkit/-/archive/$(POLKIT_VERSION)
 POLKIT_LICENSE = GPL-2.0
 POLKIT_LICENSE_FILES = COPYING
-POLKIT_CPE_ID_VENDOR = polkit_project
+POLKIT_CPE_ID_VALID = YES
 POLKIT_INSTALL_STAGING = YES
 POLKIT_DEPENDENCIES = \
 	duktape libglib2 host-intltool expat $(TARGET_NLS_DEPENDENCIES)
diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index 5cee8e9673..06bab375f6 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -9,7 +9,7 @@ POPT_SITE = http://ftp.rpm.org/popt/releases/popt-1.x
 POPT_INSTALL_STAGING = YES
 POPT_LICENSE = MIT
 POPT_LICENSE_FILES = COPYING
-POPT_CPE_ID_VENDOR = popt_project
+POPT_CPE_ID_VALID = YES
 
 POPT_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
index 8d5491133b..ddeb830b07 100644
--- a/package/powerpc-utils/powerpc-utils.mk
+++ b/package/powerpc-utils/powerpc-utils.mk
@@ -10,7 +10,7 @@ POWERPC_UTILS_DEPENDENCIES = zlib numactl
 POWERPC_UTILS_AUTORECONF = YES
 POWERPC_UTILS_LICENSE = GPL-2.0+
 POWERPC_UTILS_LICENSE_FILES = COPYING
-POWERPC_UTILS_CPE_ID_VENDOR = powerpc-utils_project
+POWERPC_UTILS_CPE_ID_VALID = YES
 
 POWERPC_UTILS_CONF_ENV = \
 	ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 46f75a48ef..ba8958d146 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -9,7 +9,7 @@ PROCPS_NG_SOURCE = procps-ng-$(PROCPS_NG_VERSION).tar.xz
 PROCPS_NG_SITE = http://downloads.sourceforge.net/project/procps-ng/Production
 PROCPS_NG_LICENSE = GPL-2.0+, LGPL-2.0+ (libproc and libps)
 PROCPS_NG_LICENSE_FILES = COPYING COPYING.LIB
-PROCPS_NG_CPE_ID_VENDOR = procps-ng_project
+PROCPS_NG_CPE_ID_VALID = YES
 PROCPS_NG_INSTALL_STAGING = YES
 # We're patching configure.ac
 PROCPS_NG_AUTORECONF = YES
diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
index ccabd4723f..2b3e86a1bc 100644
--- a/package/protobuf-c/protobuf-c.mk
+++ b/package/protobuf-c/protobuf-c.mk
@@ -13,7 +13,7 @@ PROTOBUF_C_CONF_OPTS = --disable-protoc
 PROTOBUF_C_INSTALL_STAGING = YES
 PROTOBUF_C_LICENSE = BSD-2-Clause
 PROTOBUF_C_LICENSE_FILES = LICENSE
-PROTOBUF_C_CPE_ID_VENDOR = protobuf-c_project
+PROTOBUF_C_CPE_ID_VALID = YES
 
 # when building with protoc (from host-protobuf) c++17 is now required
 HOST_PROTOBUF_C_CONF_ENV += CXXFLAGS="$(HOST_CXXFLAGS) -std=c++17"
diff --git a/package/proxychains-ng/proxychains-ng.mk b/package/proxychains-ng/proxychains-ng.mk
index beb8909088..3573cf1f09 100644
--- a/package/proxychains-ng/proxychains-ng.mk
+++ b/package/proxychains-ng/proxychains-ng.mk
@@ -9,7 +9,7 @@ PROXYCHAINS_NG_SOURCE = proxychains-ng-$(PROXYCHAINS_NG_VERSION).tar.xz
 PROXYCHAINS_NG_SITE = https://github.com/rofl0r/proxychains-ng/releases/download/v$(PROXYCHAINS_NG_VERSION)
 PROXYCHAINS_NG_LICENSE = GPL-2.0+
 PROXYCHAINS_NG_LICENSE_FILES = COPYING
-PROXYCHAINS_NG_CPE_ID_VENDOR = proxychains-ng_project
+PROXYCHAINS_NG_CPE_ID_VALID = YES
 
 define PROXYCHAINS_NG_CONFIGURE_CMDS
 	cd $(@D) && \
diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index 9772788d2d..3935526af6 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -8,7 +8,7 @@ PUGIXML_VERSION = 1.14
 PUGIXML_SITE = https://github.com/zeux/pugixml/releases/download/v$(PUGIXML_VERSION)
 PUGIXML_LICENSE = MIT
 PUGIXML_LICENSE_FILES = LICENSE.md
-PUGIXML_CPE_ID_VENDOR = pugixml_project
+PUGIXML_CPE_ID_VALID = YES
 
 PUGIXML_INSTALL_STAGING = YES
 
diff --git a/package/pwgen/pwgen.mk b/package/pwgen/pwgen.mk
index 89925bb300..90b5ac63fa 100644
--- a/package/pwgen/pwgen.mk
+++ b/package/pwgen/pwgen.mk
@@ -8,7 +8,7 @@ PWGEN_VERSION = 2.08
 PWGEN_SITE = http://downloads.sourceforge.net/project/pwgen/pwgen/$(PWGEN_VERSION)
 PWGEN_LICENSE = GPL-2.0
 PWGEN_LICENSE_FILES = debian/copyright
-PWGEN_CPE_ID_VENDOR = pwgen_project
+PWGEN_CPE_ID_VALID = YES
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/python-ecdsa/python-ecdsa.mk b/package/python-ecdsa/python-ecdsa.mk
index d3d49c2520..321e87e0a3 100644
--- a/package/python-ecdsa/python-ecdsa.mk
+++ b/package/python-ecdsa/python-ecdsa.mk
@@ -10,6 +10,6 @@ PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/ff/7b/ba6547a76c468a
 PYTHON_ECDSA_SETUP_TYPE = setuptools
 PYTHON_ECDSA_LICENSE = MIT
 PYTHON_ECDSA_LICENSE_FILES = LICENSE
-PYTHON_ECDSA_CPE_ID_VENDOR = python-ecdsa_project
+PYTHON_ECDSA_CPE_ID_VALID = YES
 
 $(eval $(python-package))
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index 7702b5f294..67092402b4 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -9,6 +9,6 @@ PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/e2/24/4a69dd119d1
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
-PYTHON_ENGINEIO_CPE_ID_VENDOR = python-engineio_project
+PYTHON_ENGINEIO_CPE_ID_VALID = YES
 
 $(eval $(python-package))
diff --git a/package/python-markdown2/python-markdown2.mk b/package/python-markdown2/python-markdown2.mk
index 4c21eb98e8..a78e6ea0d8 100644
--- a/package/python-markdown2/python-markdown2.mk
+++ b/package/python-markdown2/python-markdown2.mk
@@ -10,6 +10,6 @@ PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/3c/e4/87a454674a
 PYTHON_MARKDOWN2_SETUP_TYPE = setuptools
 PYTHON_MARKDOWN2_LICENSE = MIT
 PYTHON_MARKDOWN2_LICENSE_FILES = LICENSE.txt
-PYTHON_MARKDOWN2_CPE_ID_VENDOR = python-markdown2_project
+PYTHON_MARKDOWN2_CPE_ID_VALID = YES
 
 $(eval $(python-package))
diff --git a/package/python-rsa/python-rsa.mk b/package/python-rsa/python-rsa.mk
index 01b5c49b50..d84ba8b431 100644
--- a/package/python-rsa/python-rsa.mk
+++ b/package/python-rsa/python-rsa.mk
@@ -10,6 +10,6 @@ PYTHON_RSA_SITE = https://files.pythonhosted.org/packages/aa/65/7d973b89c4d2351d
 PYTHON_RSA_SETUP_TYPE = setuptools
 PYTHON_RSA_LICENSE = Apache-2.0
 PYTHON_RSA_LICENSE_FILES = LICENSE
-PYTHON_RSA_CPE_ID_VENDOR = python-rsa_project
+PYTHON_RSA_CPE_ID_VALID = YES
 
 $(eval $(python-package))
diff --git a/package/qdecoder/qdecoder.mk b/package/qdecoder/qdecoder.mk
index c465617e26..9544dcf5e1 100644
--- a/package/qdecoder/qdecoder.mk
+++ b/package/qdecoder/qdecoder.mk
@@ -8,7 +8,7 @@ QDECODER_VERSION = 12.1.0
 QDECODER_SITE = $(call github,wolkykim,qdecoder,v$(QDECODER_VERSION))
 QDECODER_LICENSE = BSD-2-Clause
 QDECODER_LICENSE_FILES = COPYING
-QDECODER_CPE_ID_VENDOR = qdecoder_project
+QDECODER_CPE_ID_VALID = YES
 QDECODER_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
 QDECODER_INSTALL_STAGING = YES
diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
index a58781f4f1..d479515789 100644
--- a/package/qpdf/qpdf.mk
+++ b/package/qpdf/qpdf.mk
@@ -9,7 +9,7 @@ QPDF_SITE = http://downloads.sourceforge.net/project/qpdf/qpdf/$(QPDF_VERSION)
 QPDF_INSTALL_STAGING = YES
 QPDF_LICENSE = Apache-2.0 or Artistic-2.0
 QPDF_LICENSE_FILES = LICENSE.txt Artistic-2.0
-QPDF_CPE_ID_VENDOR = qpdf_project
+QPDF_CPE_ID_VALID = YES
 QPDF_DEPENDENCIES = host-pkgconf zlib jpeg
 
 QPDF_CONF_OPTS = --with-random=/dev/urandom
diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
index 665058d890..ac28792f20 100644
--- a/package/quazip/quazip.mk
+++ b/package/quazip/quazip.mk
@@ -18,6 +18,6 @@ endif
 
 QUAZIP_LICENSE = LGPL-2.1
 QUAZIP_LICENSE_FILES = COPYING
-QUAZIP_CPE_ID_VENDOR = quazip_project
+QUAZIP_CPE_ID_VALID = YES
 
 $(eval $(cmake-package))
diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
index 091862635e..186397f9aa 100644
--- a/package/quickjs/quickjs.mk
+++ b/package/quickjs/quickjs.mk
@@ -9,7 +9,7 @@ QUICKJS_SOURCE = quickjs-$(QUICKJS_VERSION).tar.xz
 QUICKJS_SITE = https://bellard.org/quickjs
 QUICKJS_LICENSE = MIT
 QUICKJS_LICENSE_FILES = LICENSE
-QUICKJS_CPE_ID_VENDOR = quickjs_project
+QUICKJS_CPE_ID_VALID = YES
 QUICKJS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
diff --git a/package/rabbitmq-c/rabbitmq-c.mk b/package/rabbitmq-c/rabbitmq-c.mk
index cac0f67ddc..5a0775f353 100644
--- a/package/rabbitmq-c/rabbitmq-c.mk
+++ b/package/rabbitmq-c/rabbitmq-c.mk
@@ -8,7 +8,7 @@ RABBITMQ_C_VERSION = 0.13.0
 RABBITMQ_C_SITE = $(call github,alanxz,rabbitmq-c,v$(RABBITMQ_C_VERSION))
 RABBITMQ_C_LICENSE = MIT
 RABBITMQ_C_LICENSE_FILES = LICENSE README.md
-RABBITMQ_C_CPE_ID_VENDOR = rabbitmq-c_project
+RABBITMQ_C_CPE_ID_VALID = YES
 RABBITMQ_C_INSTALL_STAGING = YES
 RABBITMQ_C_CONF_OPTS = \
 	-DBUILD_API_DOCS=OFF \
diff --git a/package/rhash/rhash.mk b/package/rhash/rhash.mk
index 99762ec0c7..3cc9d427a7 100644
--- a/package/rhash/rhash.mk
+++ b/package/rhash/rhash.mk
@@ -9,7 +9,7 @@ RHASH_SOURCE = rhash-$(RHASH_VERSION)-src.tar.gz
 RHASH_SITE = https://sourceforge.net/projects/rhash/files/rhash/$(RHASH_VERSION)
 RHASH_LICENSE = 0BSD
 RHASH_LICENSE_FILES = COPYING
-RHASH_CPE_ID_VENDOR = rhash_project
+RHASH_CPE_ID_VALID = YES
 RHASH_INSTALL_STAGING = YES
 RHASH_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
index 05b8d5c48e..288c20ee95 100644
--- a/package/ripgrep/ripgrep.mk
+++ b/package/ripgrep/ripgrep.mk
@@ -8,7 +8,7 @@ RIPGREP_VERSION = 14.1.0
 RIPGREP_SITE = $(call github,burntsushi,ripgrep,$(RIPGREP_VERSION))
 RIPGREP_LICENSE = MIT
 RIPGREP_LICENSE_FILES = LICENSE-MIT
-RIPGREP_CPE_ID_VENDOR = ripgrep_project
+RIPGREP_CPE_ID_VALID = YES
 
 # CVE only impacts ripgrep on Windows
 RIPGREP_IGNORE_CVES += CVE-2021-3013
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index 933370c9a9..f50005343b 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -8,7 +8,7 @@ RNG_TOOLS_VERSION = 6.16
 RNG_TOOLS_SITE = $(call github,nhorman,rng-tools,v$(RNG_TOOLS_VERSION))
 RNG_TOOLS_LICENSE = GPL-2.0
 RNG_TOOLS_LICENSE_FILES = COPYING
-RNG_TOOLS_CPE_ID_VENDOR = rng-tools_project
+RNG_TOOLS_CPE_ID_VALID = YES
 RNG_TOOLS_SELINUX_MODULES = rngd
 
 RNG_TOOLS_DEPENDENCIES = host-pkgconf libcap openssl
diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index 698894fda9..f50f1e5a1f 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -8,7 +8,7 @@ RP_PPPOE_VERSION = 3.15
 RP_PPPOE_SITE = https://dianne.skoll.ca/projects/rp-pppoe/download
 RP_PPPOE_LICENSE = GPL-2.0
 RP_PPPOE_LICENSE_FILES = doc/LICENSE
-RP_PPPOE_CPE_ID_VENDOR = rp-pppoe_project
+RP_PPPOE_CPE_ID_VALID = YES
 
 RP_PPPOE_DEPENDENCIES = pppd
 RP_PPPOE_SUBDIR = src
diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index 2eee116755..2c158213ad 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -9,7 +9,7 @@ RPCBIND_SITE = http://downloads.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIN
 RPCBIND_SOURCE = rpcbind-$(RPCBIND_VERSION).tar.bz2
 RPCBIND_LICENSE = BSD-3-Clause
 RPCBIND_LICENSE_FILES = COPYING
-RPCBIND_CPE_ID_VENDOR = rpcbind_project
+RPCBIND_CPE_ID_VALID = YES
 RPCBIND_SELINUX_MODULES = rpcbind
 
 RPCBIND_CONF_ENV += \
diff --git a/package/rtl_433/rtl_433.mk b/package/rtl_433/rtl_433.mk
index 7c33a71f31..0af25c7936 100644
--- a/package/rtl_433/rtl_433.mk
+++ b/package/rtl_433/rtl_433.mk
@@ -8,7 +8,7 @@ RTL_433_VERSION = 23.11
 RTL_433_SITE = $(call github,merbanan,rtl_433,$(RTL_433_VERSION))
 RTL_433_LICENSE = GPL-2.0+
 RTL_433_LICENSE_FILES = COPYING
-RTL_433_CPE_ID_VENDOR = rtl_433_project
+RTL_433_CPE_ID_VALID = YES
 
 # Force Release build to remove ASAN.
 RTL_433_CONF_OPTS = \
diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
index fb381d0e10..4c8ecfe127 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -12,7 +12,7 @@ RTMPDUMP_INSTALL_STAGING = YES
 # care about librtmp, it's LGPL-2.1+
 RTMPDUMP_LICENSE = LGPL-2.1+
 RTMPDUMP_LICENSE_FILES = librtmp/COPYING
-RTMPDUMP_CPE_ID_VENDOR = rtmpdump_project
+RTMPDUMP_CPE_ID_VALID = YES
 RTMPDUMP_DEPENDENCIES = zlib
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index 83c40e684f..fe89e7747d 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -10,7 +10,7 @@ SANE_BACKENDS_SITE = \
 SANE_BACKENDS_CONFIG_SCRIPTS = sane-config
 SANE_BACKENDS_LICENSE = GPL-2.0+
 SANE_BACKENDS_LICENSE_FILES = COPYING
-SANE_BACKENDS_CPE_ID_VENDOR = sane-backends_project
+SANE_BACKENDS_CPE_ID_VALID = YES
 SANE_BACKENDS_INSTALL_STAGING = YES
 
 SANE_BACKENDS_CONF_OPTS = \
diff --git a/package/shellinabox/shellinabox.mk b/package/shellinabox/shellinabox.mk
index 58c1668112..725b8d9c52 100644
--- a/package/shellinabox/shellinabox.mk
+++ b/package/shellinabox/shellinabox.mk
@@ -8,7 +8,7 @@ SHELLINABOX_VERSION = 2.20
 SHELLINABOX_SITE = $(call github,shellinabox,shellinabox,v$(SHELLINABOX_VERSION))
 SHELLINABOX_LICENSE = GPL-2.0 with OpenSSL exception
 SHELLINABOX_LICENSE_FILES = COPYING GPL-2
-SHELLINABOX_CPE_ID_VENDOR = shellinabox_project
+SHELLINABOX_CPE_ID_VALID = YES
 
 # 0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch
 SHELLINABOX_IGNORE_CVES += CVE-2018-16789
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index 5f7bcd9d2f..608a9413fe 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -9,7 +9,7 @@ SPICE_SOURCE = spice-$(SPICE_VERSION).tar.bz2
 SPICE_SITE = http://www.spice-space.org/download/releases/spice-server
 SPICE_LICENSE = LGPL-2.1+
 SPICE_LICENSE_FILES = COPYING
-SPICE_CPE_ID_VENDOR = spice_project
+SPICE_CPE_ID_VALID = YES
 SPICE_INSTALL_STAGING = YES
 SPICE_DEPENDENCIES = \
 	host-pkgconf \
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 082104b6d4..b9fbf54b01 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -8,7 +8,7 @@ SQUASHFS_VERSION = 4.6.1
 SQUASHFS_SITE = $(call github,plougher,squashfs-tools,$(SQUASHFS_VERSION))
 SQUASHFS_LICENSE = GPL-2.0+
 SQUASHFS_LICENSE_FILES = COPYING
-SQUASHFS_CPE_ID_VENDOR = squashfs_project
+SQUASHFS_CPE_ID_VALID = YES
 SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=1
 
 ifeq ($(BR2_PACKAGE_SQUASHFS_LZ4),y)
diff --git a/package/sslh/sslh.mk b/package/sslh/sslh.mk
index 5dad6aafc2..e829af0bba 100644
--- a/package/sslh/sslh.mk
+++ b/package/sslh/sslh.mk
@@ -9,7 +9,7 @@ SSLH_SOURCE = sslh-v$(SSLH_VERSION).tar.gz
 SSLH_SITE = http://www.rutschle.net/tech/sslh
 SSLH_LICENSE = GPL-2.0+
 SSLH_LICENSE_FILES = COPYING
-SSLH_CPE_ID_VENDOR = sslh_project
+SSLH_CPE_ID_VALID = YES
 SSLH_DEPENDENCIES = pcre2
 
 SSLH_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 6279622fdb..70b4a8f6c6 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -9,7 +9,7 @@ STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
 STRACE_LICENSE_FILES = COPYING LGPL-2.1-or-later
-STRACE_CPE_ID_VENDOR = strace_project
+STRACE_CPE_ID_VALID = YES
 STRACE_CONF_OPTS = --enable-mpers=no
 
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index a7c7adade3..fc419e2867 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -10,7 +10,7 @@ SYLPHEED_SOURCE = sylpheed-$(SYLPHEED_VERSION).tar.xz
 SYLPHEED_SITE = http://sylpheed.sraoss.jp/sylpheed/v$(SYLPHEED_VERSION_MAJOR)
 SYLPHEED_LICENSE = GPL-2.0+ (executables), LGPL-2.1+ (library, attachment plugin)
 SYLPHEED_LICENSE_FILES = COPYING COPYING.LIB
-SYLPHEED_CPE_ID_VENDOR = sylpheed_project
+SYLPHEED_CPE_ID_VALID = YES
 SYLPHEED_CONF_OPTS = --disable-gtkspell --disable-gpgme
 SYLPHEED_DEPENDENCIES = host-pkgconf libgtk2
 
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 7a46d759d3..083f505a2b 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -9,7 +9,7 @@ SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKL
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
 SYSKLOGD_INSTALL_STAGING = YES
-SYSKLOGD_CPE_ID_VENDOR = sysklogd_project
+SYSKLOGD_CPE_ID_VALID = YES
 
 # Busybox install logger in /usr/bin, and syslogd in /sbin, so install in
 # the same locations so that busybox does not install its applets in there.
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index ec0c666157..f77a60b1da 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -11,7 +11,7 @@ SYSSTAT_CONF_OPTS = --disable-file-attr
 SYSSTAT_DEPENDENCIES = host-gettext $(TARGET_NLS_DEPENDENCIES)
 SYSSTAT_LICENSE = GPL-2.0+
 SYSSTAT_LICENSE_FILES = COPYING
-SYSSTAT_CPE_ID_VENDOR = sysstat_project
+SYSSTAT_CPE_ID_VALID = YES
 SYSSTAT_SELINUX_MODULES = sysstat
 
 ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index d371233cfe..528fe60b1d 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -46,7 +46,7 @@ SYSTEMD_LICENSE_FILES = \
 	LICENSES/murmurhash2-public-domain.txt \
 	LICENSES/OFL-1.1.txt \
 	LICENSES/README.md
-SYSTEMD_CPE_ID_VENDOR = systemd_project
+SYSTEMD_CPE_ID_VALID = YES
 SYSTEMD_INSTALL_STAGING = YES
 SYSTEMD_DEPENDENCIES = \
 	$(BR2_COREUTILS_HOST_DEPENDENCY) \
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index b7fe39ca43..49c92ec2ac 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -9,7 +9,7 @@ SYSVINIT_SOURCE = sysvinit-$(SYSVINIT_VERSION).tar.xz
 SYSVINIT_SITE = http://download.savannah.nongnu.org/releases/sysvinit
 SYSVINIT_LICENSE = GPL-2.0+
 SYSVINIT_LICENSE_FILES = COPYING
-SYSVINIT_CPE_ID_VENDOR = sysvinit_project
+SYSVINIT_CPE_ID_VALID = YES
 
 SYSVINIT_MAKE_OPTS = SYSROOT=$(STAGING_DIR)
 
diff --git a/package/targetcli-fb/targetcli-fb.mk b/package/targetcli-fb/targetcli-fb.mk
index c6ca776b27..d2cbf79e26 100644
--- a/package/targetcli-fb/targetcli-fb.mk
+++ b/package/targetcli-fb/targetcli-fb.mk
@@ -10,7 +10,7 @@ TARGETCLI_FB_VERSION = 2.1.54
 TARGETCLI_FB_SITE = $(call github,open-iscsi,targetcli-fb,v$(TARGETCLI_FB_VERSION))
 TARGETCLI_FB_LICENSE = Apache-2.0
 TARGETCLI_FB_LICENSE_FILES = COPYING
-TARGETCLI_FB_CPE_ID_VENDOR = targetcli-fb_project
+TARGETCLI_FB_CPE_ID_VALID = YES
 TARGETCLI_FB_SETUP_TYPE = setuptools
 TARGETCLI_FB_DEPENDENCIES = python-configshell-fb python-rtslib-fb python-six
 
diff --git a/package/tclap/tclap.mk b/package/tclap/tclap.mk
index d7f96bd034..665bec2d67 100644
--- a/package/tclap/tclap.mk
+++ b/package/tclap/tclap.mk
@@ -9,7 +9,7 @@ TCLAP_SITE = http://downloads.sourceforge.net/project/tclap
 TCLAP_LICENSE = MIT
 TCLAP_LICENSE_FILES = COPYING
 TCLAP_INSTALL_STAGING = YES
-TCLAP_CPE_ID_VENDOR = tclap_project
+TCLAP_CPE_ID_VALID = YES
 
 # This package is a pure C++ template library, only made of headers.
 TCLAP_INSTALL_TARGET = NO
diff --git a/package/tini/tini.mk b/package/tini/tini.mk
index aa8e259db2..83e86237d4 100644
--- a/package/tini/tini.mk
+++ b/package/tini/tini.mk
@@ -8,7 +8,7 @@ TINI_VERSION = 0.19.0
 TINI_SITE = $(call github,krallin,tini,v$(TINI_VERSION))
 TINI_LICENSE = MIT
 TINI_LICENSE_FILES = LICENSE
-TINI_CPE_ID_VENDOR = tini_project
+TINI_CPE_ID_VALID = YES
 
 TINI_CFLAGS = $(TARGET_CFLAGS) \
 	-static \
diff --git a/package/tinyproxy/tinyproxy.mk b/package/tinyproxy/tinyproxy.mk
index e91a886888..e989f70a22 100644
--- a/package/tinyproxy/tinyproxy.mk
+++ b/package/tinyproxy/tinyproxy.mk
@@ -9,7 +9,7 @@ TINYPROXY_SITE = https://github.com/tinyproxy/tinyproxy/releases/download/$(TINY
 TINYPROXY_SOURCE = tinyproxy-$(TINYPROXY_VERSION).tar.xz
 TINYPROXY_LICENSE = GPL-2.0+
 TINYPROXY_LICENSE_FILES = COPYING
-TINYPROXY_CPE_ID_VENDOR = tinyproxy_project
+TINYPROXY_CPE_ID_VALID = YES
 
 # 0001-prevent-junk-from-showing-up-in-error-page-in-invalid-requests.patch
 TINYPROXY_IGNORE_CVES += CVE-2022-40468
diff --git a/package/tinyxml/tinyxml.mk b/package/tinyxml/tinyxml.mk
index 8e706f1a1e..01c25f7c1c 100644
--- a/package/tinyxml/tinyxml.mk
+++ b/package/tinyxml/tinyxml.mk
@@ -12,7 +12,7 @@ TINYXML_AUTORECONF = YES
 TINYXML_INSTALL_STAGING = YES
 TINYXML_LICENSE = Zlib
 TINYXML_LICENSE_FILES = README
-TINYXML_CPE_ID_VENDOR = tinyxml_project
+TINYXML_CPE_ID_VALID = YES
 
 # 0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch
 TINYXML_IGNORE_CVES += CVE-2021-42260
diff --git a/package/tinyxml2/tinyxml2.mk b/package/tinyxml2/tinyxml2.mk
index f53e8d6b99..044b8f82db 100644
--- a/package/tinyxml2/tinyxml2.mk
+++ b/package/tinyxml2/tinyxml2.mk
@@ -9,7 +9,7 @@ TINYXML2_SITE = $(call github,leethomason,tinyxml2,$(TINYXML2_VERSION))
 TINYXML2_LICENSE = Zlib
 TINYXML2_LICENSE_FILES = LICENSE.txt
 TINYXML2_INSTALL_STAGING = YES
-TINYXML2_CPE_ID_VENDOR = tinyxml2_project
+TINYXML2_CPE_ID_VALID = YES
 
 ifeq ($(BR2_STATIC_LIBS),y)
 TINYXML2_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index af06c8570b..533a82bbad 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -8,7 +8,7 @@ TMUX_VERSION = 3.3a
 TMUX_SITE = https://github.com/tmux/tmux/releases/download/$(TMUX_VERSION)
 TMUX_LICENSE = ISC
 TMUX_LICENSE_FILES = COPYING
-TMUX_CPE_ID_VENDOR = tmux_project
+TMUX_CPE_ID_VALID = YES
 TMUX_DEPENDENCIES = libevent ncurses host-pkgconf
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
index 01b029d942..12f924eee5 100644
--- a/package/tpm2-tools/tpm2-tools.mk
+++ b/package/tpm2-tools/tpm2-tools.mk
@@ -8,7 +8,7 @@ TPM2_TOOLS_VERSION = 5.2
 TPM2_TOOLS_SITE = https://github.com/tpm2-software/tpm2-tools/releases/download/$(TPM2_TOOLS_VERSION)
 TPM2_TOOLS_LICENSE = BSD-3-Clause
 TPM2_TOOLS_LICENSE_FILES = doc/LICENSE
-TPM2_TOOLS_CPE_ID_VENDOR = tpm2-tools_project
+TPM2_TOOLS_CPE_ID_VALID = YES
 TPM2_TOOLS_SELINUX_MODULES = tpm2
 TPM2_TOOLS_DEPENDENCIES = libcurl openssl tpm2-tss host-pkgconf
 
diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
index 4dca50c0b6..f6b56f6241 100644
--- a/package/trinity/trinity.mk
+++ b/package/trinity/trinity.mk
@@ -9,7 +9,7 @@ TRINITY_SITE = http://codemonkey.org.uk/projects/trinity
 TRINITY_SOURCE = trinity-$(TRINITY_VERSION).tar.xz
 TRINITY_LICENSE = GPL-2.0
 TRINITY_LICENSE_FILES = COPYING
-TRINITY_CPE_ID_VENDOR = trinity_project
+TRINITY_CPE_ID_VALID = YES
 
 TRINITY_LDFLAGS = $(TARGET_LDFLAGS)
 
diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
index 14ccedd48f..5effebee4a 100644
--- a/package/unzip/unzip.mk
+++ b/package/unzip/unzip.mk
@@ -10,7 +10,7 @@ UNZIP_PATCH = unzip_$(UNZIP_VERSION)-27.debian.tar.xz
 UNZIP_SITE = https://snapshot.debian.org/archive/debian/20220916T090657Z/pool/main/u/unzip
 UNZIP_LICENSE = Info-ZIP
 UNZIP_LICENSE_FILES = LICENSE
-UNZIP_CPE_ID_VENDOR = unzip_project
+UNZIP_CPE_ID_VALID = YES
 
 # unzip_$(UNZIP_VERSION)-27.debian.tar.xz has patches to fix:
 UNZIP_IGNORE_CVES = \
diff --git a/package/upx/upx.mk b/package/upx/upx.mk
index d6c068fc3b..65f4bac517 100644
--- a/package/upx/upx.mk
+++ b/package/upx/upx.mk
@@ -9,7 +9,7 @@ UPX_SITE = https://github.com/upx/upx/releases/download/v$(UPX_VERSION)
 UPX_SOURCE = upx-$(UPX_VERSION)-src.tar.xz
 UPX_LICENSE = GPL-2.0+
 UPX_LICENSE_FILES = COPYING
-UPX_CPE_ID_VENDOR = upx_project
+UPX_CPE_ID_VALID = YES
 UPX_SUPPORTS_IN_SOURCE_BUILD = NO
 
 $(eval $(host-cmake-package))
diff --git a/package/usbguard/usbguard.mk b/package/usbguard/usbguard.mk
index 60b69df3be..4a5028f509 100644
--- a/package/usbguard/usbguard.mk
+++ b/package/usbguard/usbguard.mk
@@ -8,7 +8,7 @@ USBGUARD_VERSION = 1.1.2
 USBGUARD_SITE = https://github.com/USBGuard/usbguard/releases/download/usbguard-$(USBGUARD_VERSION)
 USBGUARD_LICENSE = GPL-2.0+
 USBGUARD_LICENSE_FILES = LICENSE
-USBGUARD_CPE_ID_VENDOR = usbguard_project
+USBGUARD_CPE_ID_VALID = YES
 USBGUARD_SELINUX_MODULES = usbguard
 USBGUARD_CONF_ENV = ac_cv_prog_A2X=""
 USBGUARD_CONF_OPTS = \
diff --git a/package/valijson/valijson.mk b/package/valijson/valijson.mk
index 5b68dc9864..df640577ac 100644
--- a/package/valijson/valijson.mk
+++ b/package/valijson/valijson.mk
@@ -8,7 +8,7 @@ VALIJSON_VERSION = 1.0.2
 VALIJSON_SITE = $(call github,tristanpenman,valijson,v$(VALIJSON_VERSION))
 VALIJSON_LICENSE = BSD-2-Clause
 VALIJSON_LICENSE_FILES = LICENSE
-VALIJSON_CPE_ID_VENDOR = valijson_project
+VALIJSON_CPE_ID_VALID = YES
 VALIJSON_INSTALL_STAGING = YES
 VALIJSON_INSTALL_TARGET = NO
 VALIJSON_CONF_OPTS = -Dvalijson_BUILD_TESTS=FALSE
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 3e7b233e48..6742843c19 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -9,7 +9,7 @@ VSFTPD_SITE = https://security.appspot.com/downloads
 VSFTPD_LIBS = -lcrypt
 VSFTPD_LICENSE = GPL-2.0
 VSFTPD_LICENSE_FILES = COPYING
-VSFTPD_CPE_ID_VENDOR = vsftpd_project
+VSFTPD_CPE_ID_VALID = YES
 VSFTPD_SELINUX_MODULES = ftp
 
 define VSFTPD_DISABLE_UTMPX
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index 1eda717c68..aa0f14c456 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -12,7 +12,7 @@ X11VNC_CONF_OPTS = --without-sdl
 X11VNC_DEPENDENCIES = xlib_libXt xlib_libXext xlib_libXtst libvncserver
 X11VNC_LICENSE = GPL-2.0+
 X11VNC_LICENSE_FILES = COPYING
-X11VNC_CPE_ID_VENDOR = x11vnc_project
+X11VNC_CPE_ID_VALID = YES
 # 0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch
 X11VNC_IGNORE_CVES += CVE-2020-29074
 
diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index 6cc7e8febe..466d309940 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -10,7 +10,7 @@ XSCREENSAVER_SITE = https://www.jwz.org/xscreensaver
 # N.B. GPL-2.0+ code (in the hacks/glx subdirectory) is not currently built.
 XSCREENSAVER_LICENSE = MIT-like, GPL-2.0+
 XSCREENSAVER_LICENSE_FILES = hacks/screenhack.h hacks/glx/chessmodels.h
-XSCREENSAVER_CPE_ID_VENDOR = xscreensaver_project
+XSCREENSAVER_CPE_ID_VALID = YES
 XSCREENSAVER_SELINUX_MODULES = xdg xscreensaver xserver
 
 XSCREENSAVER_DEPENDENCIES = \
diff --git a/package/yajl/yajl.mk b/package/yajl/yajl.mk
index cd23c8728d..1a13cb9da8 100644
--- a/package/yajl/yajl.mk
+++ b/package/yajl/yajl.mk
@@ -9,6 +9,6 @@ YAJL_SITE = $(call github,lloyd,yajl,refs/tags/$(YAJL_VERSION))
 YAJL_INSTALL_STAGING = YES
 YAJL_LICENSE = ISC
 YAJL_LICENSE_FILES = COPYING
-YAJL_CPE_ID_VENDOR = yajl_project
+YAJL_CPE_ID_VALID = YES
 
 $(eval $(cmake-package))
diff --git a/package/yaml-cpp/yaml-cpp.mk b/package/yaml-cpp/yaml-cpp.mk
index 1f87956589..c259f1e531 100644
--- a/package/yaml-cpp/yaml-cpp.mk
+++ b/package/yaml-cpp/yaml-cpp.mk
@@ -9,7 +9,7 @@ YAML_CPP_SITE = $(call github,jbeder,yaml-cpp,$(YAML_CPP_VERSION))
 YAML_CPP_INSTALL_STAGING = YES
 YAML_CPP_LICENSE = MIT
 YAML_CPP_LICENSE_FILES = LICENSE
-YAML_CPP_CPE_ID_VENDOR = yaml-cpp_project
+YAML_CPP_CPE_ID_VALID = YES
 
 # Disable testing and parse tools
 YAML_CPP_CONF_OPTS += \
diff --git a/package/zbar/zbar.mk b/package/zbar/zbar.mk
index 1a1e4eb24b..0e79004bb3 100644
--- a/package/zbar/zbar.mk
+++ b/package/zbar/zbar.mk
@@ -9,7 +9,7 @@ ZBAR_SOURCE = zbar-$(ZBAR_VERSION).tar.bz2
 ZBAR_SITE = https://www.linuxtv.org/downloads/zbar
 ZBAR_LICENSE = LGPL-2.1+
 ZBAR_LICENSE_FILES = LICENSE.md
-ZBAR_CPE_ID_VENDOR = zbar_project
+ZBAR_CPE_ID_VALID = YES
 ZBAR_INSTALL_STAGING = YES
 ZBAR_DEPENDENCIES = libv4l jpeg $(TARGET_NLS_DEPENDENCIES)
 # uses C99 features
diff --git a/package/zlog/zlog.mk b/package/zlog/zlog.mk
index 347f482211..e5bbf6ff3b 100644
--- a/package/zlog/zlog.mk
+++ b/package/zlog/zlog.mk
@@ -8,7 +8,7 @@ ZLOG_VERSION = 1.2.17
 ZLOG_SITE = $(call github,HardySimpson,zlog,$(ZLOG_VERSION))
 ZLOG_LICENSE = Apache-2.0
 ZLOG_LICENSE_FILES = LICENSE
-ZLOG_CPE_ID_VENDOR = zlog_project
+ZLOG_CPE_ID_VALID = YES
 ZLOG_INSTALL_STAGING = YES
 
 define ZLOG_BUILD_CMDS
diff --git a/package/zziplib/zziplib.mk b/package/zziplib/zziplib.mk
index 6b7b64cacc..6cb9dedce8 100644
--- a/package/zziplib/zziplib.mk
+++ b/package/zziplib/zziplib.mk
@@ -8,7 +8,7 @@ ZZIPLIB_VERSION = 0.13.72
 ZZIPLIB_SITE = $(call github,gdraheim,zziplib,v$(ZZIPLIB_VERSION))
 ZZIPLIB_LICENSE = LGPL-2.0+ or MPL-1.1
 ZZIPLIB_LICENSE_FILES = docs/COPYING.LIB docs/COPYING.MPL docs/copying.htm
-ZZIPLIB_CPE_ID_VENDOR = zziplib_project
+ZZIPLIB_CPE_ID_VALID = YES
 ZZIPLIB_INSTALL_STAGING = YES
 ZZIPLIB_CONF_OPTS += \
 	-DZZIPDOCS=OFF \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
