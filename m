Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D22C77B6E
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 21:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FB3160AAC;
	Sun,  9 Apr 2023 21:01:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FB3160AAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b4uVytAr-LWF; Sun,  9 Apr 2023 21:01:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 225E560AC4;
	Sun,  9 Apr 2023 21:01:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 225E560AC4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AEC351C38E0
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 21:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87CA060AC4
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 21:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87CA060AC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jg_QB2AHyuPz for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 21:01:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E47F60AAC
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E47F60AAC
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 21:01:48 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id v6so2997125wrv.8
 for <buildroot@buildroot.org>; Sun, 09 Apr 2023 14:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681074106;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/nRoPbm1HhpG0/Y7zGRvZXCFczEPExwwhvODm2uPe5Q=;
 b=ka0MbLYJb2Ah5Yhnh4iQwhMkQeXEAu5xnYOpUZ06icCCzhPssRSr22/9zP/TAuF3Qu
 in3fWjG++fUAHf5pXTXdD4Be/iWAQ66v6acLOjKCBqkBQTkGolh3tgIGhpAfJyP4khOW
 ZUd5VVhkvMXQbZQVAIQd9pKM/swPZ7OSj8Zx0htWIIJNC/PyK9zDQO30Y8pqe01IuTS4
 5sw6psSkhwvP1sUE4LbxIq19+w2XZXYQRyNNUKBV8XSlA+Fnmhk7GLzaEI3HKlbH7g+f
 oCqzRjT7TjclqzEbOZ+e8lU+btgx1yqpaH2Fgd3hMqySv4mkmmb5YFQZ6j0Jjxyuk8BQ
 PL6w==
X-Gm-Message-State: AAQBX9e35AwBBd9q6YQLiKhKp/10n0Ee7c+LSH0JHHQl+M7g9dmZK9Nn
 J/Xtl91DhTg/d/1A72RO4r8xXA==
X-Google-Smtp-Source: AKy350a6Rh1eBWSZfol/Gqi6U9q3XIZuX/ev+ibk3KzhURT/UV8b0lg8GgCSCKgESt5sYjNRqg9r6w==
X-Received: by 2002:a5d:56d2:0:b0:2db:9ccf:f9f5 with SMTP id
 m18-20020a5d56d2000000b002db9ccff9f5mr5719613wrw.0.1681074106312; 
 Sun, 09 Apr 2023 14:01:46 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a5d668d000000b002e61e002943sm9952233wru.116.2023.04.09.14.01.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 14:01:45 -0700 (PDT)
Message-ID: <6335b9bc-ba5c-565f-cbd1-721b65850dc4@mind.be>
Date: Sun, 9 Apr 2023 23:01:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
References: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
 <20220724054912.2354219-11-ricardo.martincoski@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220724054912.2354219-11-ricardo.martincoski@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681074106;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/nRoPbm1HhpG0/Y7zGRvZXCFczEPExwwhvODm2uPe5Q=;
 b=We8qAIPqwI2LtQYfFDnrfBJN5LTnXfv14J+Z6v232kaV0ZI9L3QUMD/K6nymRrYPZT
 9ybkpgUXtezlVuNFWIxBDI6C5yHhR0SaroJBtdq31f6SoVvfWnHMBP72OCtbDrCWB+nE
 cdoN5asMIBc+s7WYQ19S1ttuYwyy5EPNsxdZOJ35ErIhZAqZzgXzeIs/hROzY8j0Km+X
 FCT4tyoCh436uTxSvuc7W6mz/vyLD66uAaMytCD2jqZzuSwAEKGv0J0h0Z8MJLSAhnOi
 yryjy2exkxiIXDqDdNE//gh9jadS0GZnB+MIYr3dRACb62vqmQwQhKi3gJ3rVgAE7+hY
 J0Bg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=We8qAIPq
Subject: Re: [Buildroot] [PATCH 10/16] utils/check-package: check all shell
 scripts
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/07/2022 07:49, Ricardo Martincoski wrote:
> Currently only SysV init scripts are checked using shellcheck and a few
> other rules (e.g. variable naming, file naming).
> 
> Extend the check using shellcheck to all shell scripts in the tree.
> This is actually limited to the list of directories that check-package
> knows that can check, but that list can be expanded later.
> 
> In order to apply the check to all shell scripts, use python3-magic to
> determine the file type.
> Keep testing first for name pattern, and only in the case there is no
> match, check the file type. This ensures, for instance, that SysV
> init scripts follow specific rules.
> 
> Apply these checks for shell scripts:
>   - shellcheck;
>   - trailing space;
>   - consecutive empty lines;
>   - empty last line on file;
>   - newline at end of file.
> 
> Update the list of ignored warnings.
> 
> Since 'make check-package' always run using the docker image, there is
> no dependency added to the host machine.
> 
> Do not add unit tests since no function was added, they were just
> reused.
> But expand the runtime test for check-package using as fixture a file
> that generates a shellcheck warning.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> NOTE to the maintainer applying this patch: please re-generate the list
> of ignored warnings while applying:
> $ ./utils/docker-run
> br-user@...$ ./utils/check-package --failed-only `git ls-tree -r --name-only HEAD` > .checkpackageignore


  Applied to master, after regenerating the list thanks.

  Regards,
  Arnout

> ---
>   .checkpackageignore                           | 20 +++++++++++++++++++
>   .../utils/br2-external/utils/x-shellscript    |  2 ++
>   .../testing/tests/utils/test_check_package.py | 17 ++++++++++++++++
>   utils/check-package                           | 13 +++++++++++-
>   utils/checkpackagelib/lib_shellscript.py      |  5 +++++
>   5 files changed, 56 insertions(+), 1 deletion(-)
>   create mode 100755 support/testing/tests/utils/br2-external/utils/x-shellscript
>   create mode 100644 utils/checkpackagelib/lib_shellscript.py
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 98099508ba..541f234bfd 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -52,6 +52,7 @@ package/busybox/S02sysctl Variables
>   package/busybox/S10mdev ConsecutiveEmptyLines Indent Shellcheck
>   package/busybox/S15watchdog Indent Variables
>   package/busybox/S50telnet Indent Shellcheck Variables
> +package/busybox/udhcpc.script Shellcheck
>   package/bzip2/bzip2.hash HashSpaces
>   package/c-icap/S96cicap Indent Shellcheck Variables
>   package/cache-calibrator/cache-calibrator.hash HashSpaces
> @@ -74,6 +75,7 @@ package/connman-gtk/connman-gtk.hash HashSpaces
>   package/connman/S45connman Variables
>   package/conntrack-tools/conntrack-tools.hash HashSpaces
>   package/copas/copas.hash HashSpaces
> +package/coremark-pro/coremark-pro.sh.in Shellcheck
>   package/coxpcall/coxpcall.hash HashSpaces
>   package/cpio/cpio.hash HashSpaces
>   package/cppdb/cppdb.hash HashSpaces
> @@ -104,6 +106,7 @@ package/dcron/S90dcron Variables
>   package/debianutils/debianutils.hash HashSpaces
>   package/dhcp/S80dhcp-relay Shellcheck Variables
>   package/dhcp/S80dhcp-server Shellcheck Variables
> +package/dhcp/dhclient-script Shellcheck TrailingSpace
>   package/dhcpcd/S41dhcpcd Indent Variables
>   package/dhcpdump/dhcpdump.hash HashSpaces
>   package/dhrystone/0001-cmdline-nruns.patch Sob
> @@ -131,6 +134,7 @@ package/earlyoom/S02earlyoom Indent Shellcheck
>   package/ecryptfs-utils/ecryptfs-utils.hash HashSpaces
>   package/efivar/efivar.hash HashSpaces
>   package/ejabberd/S50ejabberd Indent Shellcheck Variables
> +package/ejabberd/check-erlang-lib Shellcheck
>   package/elftosb/elftosb.hash HashSpaces
>   package/elixir/elixir.hash HashSpaces
>   package/emlog/emlog.hash HashSpaces
> @@ -144,6 +148,7 @@ package/exfat/exfat.hash HashSpaces
>   package/exim/S86exim Indent Variables
>   package/f2fs-tools/f2fs-tools.hash HashSpaces
>   package/fail2ban/S60fail2ban Shellcheck Variables
> +package/fakedate/fakedate Shellcheck
>   package/fan-ctrl/fan-ctrl.hash HashSpaces
>   package/fbdump/fbdump.hash HashSpaces
>   package/fbterm/fbterm.hash HashSpaces
> @@ -186,6 +191,7 @@ package/glorytun/glorytun.hash HashSpaces
>   package/gnuradio/gnuradio.hash HashSpaces
>   package/go/0002-cmd-dist-use-gohostarch-for-ssa-rewrite-check.patch Sob
>   package/gob2/gob2.hash HashSpaces
> +package/google-breakpad/gen-syms.sh Shellcheck
>   package/googlefontdirectory/googlefontdirectory.hash HashSpaces
>   package/gperf/gperf.hash HashSpaces
>   package/gpsd/S50gpsd Indent Shellcheck Variables
> @@ -205,11 +211,15 @@ package/ifmetric/ifmetric.hash HashSpaces
>   package/ifplugd/0001-cross.patch Sob
>   package/ifplugd/0002-fix-headers.patch Sob
>   package/ifupdown-scripts/S40network EmptyLastLine Indent Shellcheck Variables
> +package/ifupdown-scripts/network/if-pre-up.d/wait_iface EmptyLastLine Shellcheck
> +package/ifupdown-scripts/nfs_check Shellcheck
>   package/igd2-for-linux/S99upnpd Indent Shellcheck Variables
>   package/igh-ethercat/igh-ethercat.hash HashSpaces
>   package/ijs/ijs.hash HashSpaces
>   package/ima-evm-utils/ima-evm-utils.hash HashSpaces
>   package/inadyn/S70inadyn Indent NotExecutable
> +package/initscripts/init.d/rcK ConsecutiveEmptyLines EmptyLastLine Shellcheck
> +package/initscripts/init.d/rcS ConsecutiveEmptyLines EmptyLastLine Shellcheck
>   package/input-event-daemon/S99input-event-daemon ConsecutiveEmptyLines Indent Variables
>   package/intltool/intltool.hash HashSpaces
>   package/iodine/iodine.hash HashSpaces
> @@ -400,6 +410,7 @@ package/mariadb/S97mysqld Indent Shellcheck Variables
>   package/matchbox-common/matchbox-common.hash HashSpaces
>   package/matchbox-desktop/matchbox-desktop.hash HashSpaces
>   package/matchbox-keyboard/matchbox-keyboard.hash HashSpaces
> +package/matchbox-keyboard/mb-applet-kbd-wrapper.sh Shellcheck TrailingSpace
>   package/matchbox-panel/matchbox-panel.hash HashSpaces
>   package/matchbox-startup-monitor/matchbox-startup-monitor.hash HashSpaces
>   package/memstat/memstat.hash HashSpaces
> @@ -441,6 +452,7 @@ package/netifrc/netifrc.hash HashSpaces
>   package/netopeer2/S52netopeer2 Shellcheck Variables
>   package/netplug/0001-makefile-flags.patch Sob
>   package/netplug/S29netplug Indent Shellcheck Variables
> +package/netplug/netplug-script ConsecutiveEmptyLines Shellcheck
>   package/netsnmp/S59snmpd Indent Shellcheck Variables
>   package/network-manager/S45network-manager ConsecutiveEmptyLines EmptyLastLine Shellcheck Variables
>   package/newt/newt.hash HashSpaces
> @@ -470,6 +482,7 @@ package/openobex/openobex.hash HashSpaces
>   package/openpowerlink/openpowerlink.hash HashSpaces
>   package/openssh/S50sshd EmptyLastLine Indent Variables
>   package/opentyrian-data/opentyrian-data.hash HashSpaces
> +package/openvmtools/shutdown Shellcheck
>   package/openvpn/S60openvpn Indent Shellcheck Variables
>   package/optee-client/S30optee Indent Shellcheck Variables
>   package/opus-tools/opus-tools.hash HashSpaces
> @@ -561,6 +574,7 @@ package/picocom/picocom.hash HashSpaces
>   package/pigpio/S50pigpio Shellcheck Variables
>   package/pimd/pimd.hash HashSpaces
>   package/pixiewps/pixiewps.hash HashSpaces
> +package/pkgconf/pkg-config.in Shellcheck
>   package/policycoreutils/policycoreutils.hash HashSpaces
>   package/polkit/S50polkit NotExecutable Shellcheck Variables
>   package/popperjs/popperjs.hash HashSpaces
> @@ -748,9 +762,11 @@ package/supertuxkart/supertuxkart.hash HashSpaces
>   package/supervisor/S99supervisord Variables
>   package/suricata/S99suricata Shellcheck
>   package/swig/swig.hash HashSpaces
> +package/swupdate/swupdate.sh Shellcheck
>   package/sylpheed/sylpheed.hash HashSpaces
>   package/synergy/synergy.hash HashSpaces
>   package/sysrepo/S51sysrepo-plugind Indent Shellcheck
> +package/systemd/fakeroot_tmpfiles.sh Shellcheck
>   package/sysvinit/sysvinit.hash HashSpaces
>   package/szip/szip.hash HashSpaces
>   package/targetcli-fb/S50target Shellcheck Variables
> @@ -761,6 +777,7 @@ package/tftpd/S80tftpd-hpa Indent Shellcheck Variables
>   package/thttpd/thttpd.hash HashSpaces
>   package/ti-cgt-pru/ti-cgt-pru.hash HashSpaces
>   package/ti-gfx/S80ti-gfx Shellcheck Variables
> +package/ti-gfx/esrev.sh Shellcheck
>   package/ti-sgx-um/S80ti-sgx Variables
>   package/time/time.hash HashSpaces
>   package/tinc/tinc.hash HashSpaces
> @@ -789,6 +806,7 @@ package/usb_modeswitch_data/usb_modeswitch_data.hash HashSpaces
>   package/usbguard/S20usbguard Indent Shellcheck Variables
>   package/ussp-push/ussp-push.hash HashSpaces
>   package/utp_com/utp_com.hash HashSpaces
> +package/vala/vala-wrapper Shellcheck
>   package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.hash HashSpaces
>   package/vmtouch/vmtouch.hash HashSpaces
>   package/vsftpd/S70vsftpd Indent Shellcheck Variables
> @@ -799,6 +817,7 @@ package/webrtc-audio-processing/webrtc-audio-processing.hash HashSpaces
>   package/wf111/wf111.hash HashSpaces
>   package/whetstone/whetstone.hash HashSpaces
>   package/wireless_tools/wireless_tools.hash HashSpaces
> +package/wpa_supplicant/ifupdown.sh Shellcheck
>   package/wpan-tools/wpan-tools.hash HashSpaces
>   package/wsapi-fcgi/wsapi-fcgi.hash HashSpaces
>   package/wsapi-xavante/wsapi-xavante.hash HashSpaces
> @@ -903,6 +922,7 @@ package/x11r7/xlib_xtrans/xlib_xtrans.hash HashSpaces
>   package/x11r7/xserver_xorg-server/S40xorg Shellcheck Variables
>   package/x11r7/xutil_makedepend/xutil_makedepend.hash HashSpaces
>   package/xavante/xavante.hash HashSpaces
> +package/xl2tp/xl2tpd TrailingSpace
>   package/xmlstarlet/xmlstarlet.hash HashSpaces
>   package/xutil_util-macros/xutil_util-macros.hash HashSpaces
>   package/yad/yad.hash HashSpaces
> diff --git a/support/testing/tests/utils/br2-external/utils/x-shellscript b/support/testing/tests/utils/br2-external/utils/x-shellscript
> new file mode 100755
> index 0000000000..a7de4124bd
> --- /dev/null
> +++ b/support/testing/tests/utils/br2-external/utils/x-shellscript
> @@ -0,0 +1,2 @@
> +#!/bin/bash
> +unused="text"
> diff --git a/support/testing/tests/utils/test_check_package.py b/support/testing/tests/utils/test_check_package.py
> index f21b9e939f..aeda0857e3 100644
> --- a/support/testing/tests/utils/test_check_package.py
> +++ b/support/testing/tests/utils/test_check_package.py
> @@ -232,3 +232,20 @@ class TestCheckPackage(unittest.TestCase):
>                         .format(subdir_file), w)
>           self.assertIn("{}:0: NewlineAtEof was expected to fail, did you fixed the file and forgot to update .checkpackageignore?"
>                         .format(subdir_file), w)
> +
> +        # shell scripts are tested using shellcheck
> +        rel_file = "utils/x-shellscript"
> +        abs_path = infra.filepath("tests/utils/br2-external")
> +        abs_file = os.path.join(abs_path, rel_file)
> +
> +        w, m = call_script(["check-package", "-b", rel_file],
> +                           self.WITH_UTILS_IN_PATH, abs_path)
> +        self.assert_file_was_processed(m)
> +        self.assert_warnings_generated_for_file(m)
> +        self.assertIn("{}:0: run 'shellcheck' and fix the warnings".format(rel_file), w)
> +
> +        w, m = call_script(["check-package", "-b", abs_file],
> +                           self.WITH_UTILS_IN_PATH, infra.basepath())
> +        self.assert_file_was_processed(m)
> +        self.assert_warnings_generated_for_file(m)
> +        self.assertIn("{}:0: run 'shellcheck' and fix the warnings".format(abs_file), w)
> diff --git a/utils/check-package b/utils/check-package
> index 1508e39c37..6612cee24e 100755
> --- a/utils/check-package
> +++ b/utils/check-package
> @@ -3,6 +3,7 @@
>   
>   import argparse
>   import inspect
> +import magic
>   import os
>   import re
>   import six
> @@ -13,6 +14,7 @@ import checkpackagelib.lib_config
>   import checkpackagelib.lib_hash
>   import checkpackagelib.lib_mk
>   import checkpackagelib.lib_patch
> +import checkpackagelib.lib_shellscript
>   import checkpackagelib.lib_sysv
>   
>   IGNORE_FILENAME = ".checkpackageignore"
> @@ -86,6 +88,15 @@ def parse_args():
>       return flags
>   
>   
> +def get_lib_from_filetype(fname):
> +    if not os.path.isfile(fname):
> +        return None
> +    filetype = magic.from_file(fname, mime=True)
> +    if filetype == "text/x-shellscript":
> +        return checkpackagelib.lib_shellscript
> +    return None
> +
> +
>   CONFIG_IN_FILENAME = re.compile(r"Config\.\S*$")
>   DO_CHECK_INTREE = re.compile(r"|".join([
>       r"Config.in",
> @@ -129,7 +140,7 @@ def get_lib_from_filename(fname):
>           return checkpackagelib.lib_patch
>       if SYSV_INIT_SCRIPT_FILENAME.search(fname):
>           return checkpackagelib.lib_sysv
> -    return None
> +    return get_lib_from_filetype(fname)
>   
>   
>   def common_inspect_rules(m):
> diff --git a/utils/checkpackagelib/lib_shellscript.py b/utils/checkpackagelib/lib_shellscript.py
> new file mode 100644
> index 0000000000..9b4f4aed58
> --- /dev/null
> +++ b/utils/checkpackagelib/lib_shellscript.py
> @@ -0,0 +1,5 @@
> +from checkpackagelib.lib import ConsecutiveEmptyLines  # noqa: F401
> +from checkpackagelib.lib import EmptyLastLine          # noqa: F401
> +from checkpackagelib.lib import NewlineAtEof           # noqa: F401
> +from checkpackagelib.lib import TrailingSpace          # noqa: F401
> +from checkpackagelib.tool import Shellcheck            # noqa: F401
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
