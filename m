Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5A2C27C53
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 20:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A616E80D7D;
	Wed, 19 Jun 2024 20:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id foo8ld6c5CEF; Wed, 19 Jun 2024 20:34:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 921CA80E3F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 921CA80E3F;
	Wed, 19 Jun 2024 20:34:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 490091BF846
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35EFF413CD
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:34:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sh7it9cJ6wQp for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 20:34:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B8242410C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8242410C5
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B8242410C5
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 20:34:04 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-354b722fe81so133747f8f.3
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 13:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718829242; x=1719434042;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h1b6Nowb2HfYWFmWnlvKHqUPU/tC+orbHxu0YZeKvEc=;
 b=W3D4nrFyXs/vgickEtJsSDYSNuaG3BA5q4JnjSAUGnl55F25l0+MRmhH0kwayNfgHo
 cLiJGc4NKKX3Wssq+IMCjV47VP5IwzpHXO5gAcMZgQfdE/rV0oLG1HD6xZerv8Xrk4ub
 t95QGrVSyCv88iG64rAdqCiiazOvD3rBhNY9qXyqdTqzcuEpoTNwzJnFabGyWQdwBv8t
 cXoQB7lBKwFSqKlV28lqf306o+OEPY2MARKLbvo7c35YhCzN111le29CqdGgRtzXj1Oe
 FL8rvCNPtILKYd2dGjlc2xHqLtzHtiO3yeWNsDmwwXYiD2W00olIB71DY96nOBiGNscZ
 rJVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOBbRACAFb7VvsdS8VazLWbnLF6jZkUoeW8U0fobhV8Z/+IoIy5+0dmD+Urg3k8t7kfWfz9MvyrMGOtUt1te+G0BuXfyTOVA==
X-Gm-Message-State: AOJu0Yy2xJcWlX0QvpuxwnyKL330AvP+/s5q8hV5u2eKccHO5tTxB8VQ
 f3tdEYP3QRNMAkulp1Nyr1ieFPU5kDQJJ58QRc15HyKPGvXymTVvjqztOhkqIaMffl49Z0VOC52
 i
X-Google-Smtp-Source: AGHT+IFKLCw/lUKgQf4npo8squuSBrP6xS8uCp6g5VwT3exQyLsHzVodA0pU0yTNXe3pCOJ5DV7rxA==
X-Received: by 2002:a05:6000:1c3:b0:362:9c7f:6df9 with SMTP id
 ffacd0b85a97d-363171e2c5emr2701672f8f.7.1718829242126; 
 Wed, 19 Jun 2024 13:34:02 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-360750ad1absm17878014f8f.62.2024.06.19.13.34.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 13:34:01 -0700 (PDT)
Message-ID: <0dd31e7e-32b9-4f48-a4c7-a45c7ab160df@mind.be>
Date: Wed, 19 Jun 2024 22:33:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240609172148.88446-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20240609172148.88446-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1718829242; x=1719434042; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=h1b6Nowb2HfYWFmWnlvKHqUPU/tC+orbHxu0YZeKvEc=;
 b=LdY8q/DSMp2qZEXihBtDEEYKtClWvyxUAhJVWbQv1OEqlfHKvLeJaGrzT3q6yagjaP
 qW3HFcFENuUOzub7TVmG5Z/PfeJxXZFa6Cnq2qwQw0mRyfbwOrbSDWbxzaFi3pUhgPQM
 C8vKN7RyIP4jiHM64dBkWTXJzzhU6JBarSWnGIXnnlKrtu7KJb35S7G9TdeUGEJ7GGQ1
 rTwVIYoIT49qesbg+PzF54d3KyGMpfm5/A9tM981yZiaR0XAIlY1tDk92BeB97h9jPw8
 CNURQSw5GB9zmdW5A8aTFNP1yiDp1qOxYKh2nnBw+fG1odCdGL0zideJ8gipO35ylJvt
 v9wg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LdY8q/DS
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add ntp runtime test
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/06/2024 19:21, Julien Olivain wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS                                    |  2 +
>   support/testing/tests/package/test_ntp.py     | 86 +++++++++++++++++++
>   .../test_ntp/rootfs-overlay/etc/ntp.conf      | 10 +++
>   3 files changed, 98 insertions(+)
>   create mode 100644 support/testing/tests/package/test_ntp.py
>   create mode 100644 support/testing/tests/package/test_ntp/rootfs-overlay/etc/ntp.conf
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 03aa7bfa742..0fc43592c26 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1870,6 +1870,8 @@ F:	support/testing/tests/package/test_netsnmp/
>   F:	support/testing/tests/package/test_nftables.py
>   F:	support/testing/tests/package/test_nftables/
>   F:	support/testing/tests/package/test_ngrep.py
> +F:	support/testing/tests/package/test_ntp.py
> +F:	support/testing/tests/package/test_ntp/
>   F:	support/testing/tests/package/test_numactl.py
>   F:	support/testing/tests/package/test_numactl/
>   F:	support/testing/tests/package/test_octave.py
> diff --git a/support/testing/tests/package/test_ntp.py b/support/testing/tests/package/test_ntp.py
> new file mode 100644
> index 00000000000..13fff6419be
> --- /dev/null
> +++ b/support/testing/tests/package/test_ntp.py
> @@ -0,0 +1,86 @@
> +import os
> +import re
> +import time
> +
> +import infra.basetest
> +
> +
> +class TestNtp(infra.basetest.BRTest):
> +    rootfs_overlay = \
> +        infra.filepath("tests/package/test_ntp/rootfs-overlay")
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        f"""
> +        BR2_PACKAGE_NTP=y
> +        BR2_PACKAGE_NTP_NTPD=y
> +        BR2_PACKAGE_NTP_NTPQ=y
> +        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def dict_from_ntpq_output(self, output):
> +        d = {}
> +        for line in output:
> +            if ':' not in line:
> +                continue
> +            fields = re.split(r":", line, maxsplit=2)
> +            name = fields[0].strip()
> +            value = fields[1].strip()
> +            d[name] = value
> +        return d
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        # Check our binaries can execute.
> +        self.assertRunOk("ntpd --version")
> +        self.assertRunOk("ntpq --version")
> +
> +        # The ntp daemon is expected to be started from init startup
> +        # scripts, for the Buildroot package recipe. We wait a bit
> +        # here to let the daemon settle. The next test step checks for
> +        # the local peer to be the system peer (by checking the
> +        # '*'). If querying the peers too soon after startup the peer
> +        # will not be marked as such.
> +        time.sleep(3 * self.timeout_multiplier)
> +
> +        # We query the ntp daemon peers. From our test configuration
> +        # file, we should have exactly one.
> +        out, ret = self.emulator.run("ntpq --peers")
> +        self.assertEqual(ret, 0)
> +        # ntpq --peers produces two lines of headers. So we check we
> +        # have at least 3 lines of output.
> +        self.assertGreaterEqual(len(out), 3)
> +        # We check we see our undisciplined local clock and it's the
> +        # system peer.
> +        self.assertTrue(out[2].startswith("*LOCAL(0)"))
> +
> +        # We query the refid variable. We expect to see our
> +        # undisciplined local clock.
> +        out, ret = self.emulator.run("ntpq -c 'readvar 0 refid'")
> +        self.assertEqual(ret, 0)
> +        self.assertEqual(out[0], "refid=LOCAL(0)")
> +
> +        # We query the ntp system info. We check the reference ID is
> +        # the same as in the test configuration file.
> +        out, ret = self.emulator.run("ntpq -c sysinfo")
> +        self.assertEqual(ret, 0)
> +        sysinfo = self.dict_from_ntpq_output(out)
> +        refid = "reference ID"
> +        self.assertIn(refid, sysinfo)
> +        self.assertEqual(sysinfo[refid], "127.127.1.0")
> +
> +        # Finally, we query the ntp system statistics. We check we can
> +        # see some uptime. We waited a bit at the beginning of this
> +        # test, plus the few queries we previously did should have
> +        # accumulated some uptime.
> +        out, ret = self.emulator.run("ntpq -c sysstats")
> +        self.assertEqual(ret, 0)
> +        sysstats = self.dict_from_ntpq_output(out)
> +        up = "uptime"
> +        self.assertIn(up, sysstats)
> +        self.assertGreater(int(sysstats[up]), 0)
> diff --git a/support/testing/tests/package/test_ntp/rootfs-overlay/etc/ntp.conf b/support/testing/tests/package/test_ntp/rootfs-overlay/etc/ntp.conf
> new file mode 100644
> index 00000000000..2ead3deb6ab
> --- /dev/null
> +++ b/support/testing/tests/package/test_ntp/rootfs-overlay/etc/ntp.conf
> @@ -0,0 +1,10 @@
> +# Set an undisciplined local clock for testing without the need of
> +# network connectivity.
> +server 127.127.1.0 iburst prefer
> +fudge  127.127.1.0 stratum 10
> +
> +# Keep standard access control setup. The test is doing local queries
> +# from 127.0.0.1.
> +restrict default nomodify nopeer noquery limited kod
> +restrict 127.0.0.1
> +restrict [::1]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
