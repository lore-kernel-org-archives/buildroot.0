Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C2FC4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 15:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7A0F4058D;
	Sun, 11 Feb 2024 15:31:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YLQ1V_p_iCv3; Sun, 11 Feb 2024 15:31:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13629405DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13629405DB;
	Sun, 11 Feb 2024 15:31:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 930C31BF39A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E42482143
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:31:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rWO-Q3EhXH-m for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 15:31:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7541F82142
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7541F82142
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 15:31:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D5BF875E6; Sun, 11 Feb 2024 15:31:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 16:30:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ddf66867b192b5576632a44c4edfe23c98d8a3d8
X-Git-Newrev: c19cca045225164e7df4046c500c5e7117114f1b
X-Patchwork-Hint: ignore
Message-Id: <20240211153111.6D5BF875E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package: switch to _CPE_ID_VALID
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

commit: https://git.buildroot.net/buildroot/commit/?id=c19cca045225164e7df4046c500c5e7117114f1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
