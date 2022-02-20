Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44308C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 16:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B39C840878;
	Sun, 20 Feb 2022 16:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fATclBLVn6gU; Sun, 20 Feb 2022 16:02:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1B4840876;
	Sun, 20 Feb 2022 16:02:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F60A1BF303
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 16:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F04D481498
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 16:02:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aixOj7u56So3 for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 16:02:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D5F7813C0
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 16:02:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B9B6BFF803
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 16:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645372943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=W2dB5yHgvgPj2x/VBDi6+BlylFKMbiYV6rhkp5v1+10=;
 b=WAay53Jn66tdQaW4e88/0v7J6C/ol1HpOIfTP+mLjOHHnKOnRoVPnkELsL+zjhRqyqGu7m
 QLW61/19R++XRQ8/qRv+UfseKVU4/PnJVIRE0KTtOnssccVnexagd4ogeqD1RvTPZPac6Z
 91MoWrY7PDjsvUSRf/Rkc294yRrG3pBg5ClnyMxQlVJTEMxm2mGKossf/gcaorTi+UofBy
 TmflibU0AA/x9uipgl8PmPxY+r5Gkepnc2froxq8UEV2Vl9j2kF/1DrLaJz8q6RKJMb6Y6
 4qJwkx7M8qd0bwdKGzSo3l3jfm7HOjT7HYDaojaLnHzlH10TVNk8543AFQodXw==
Date: Sun, 20 Feb 2022 17:02:22 +0100
To: buildroot@buildroot.org
Message-ID: <20220220170222.06d88b45@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: [Buildroot] Analysis of runtime test failures
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Six of our runtime tests are failing, so I went ahead and quickly look
at the error messages. Here is my summary:

=== tests.package.test_ipython.TestIPythonPy3 ===

https://gitlab.com/buildroot.org/buildroot/-/jobs/2088684091

Error is:

# ipython -c 'import math; math.floor(12.3)'
-sh: ipython: not found

=== tests.package.test_python_pyyaml.TestPythonPy3Pyyaml ===

https://gitlab.com/buildroot.org/buildroot/-/jobs/2088684091

Error is:

# python sample_python_pyyaml_dec.py
Traceback (most recent call last):
  File "/root/sample_python_pyyaml_dec.py", line 5, in <module>
    data = yaml.load(serialized)
TypeError: load() missing 1 required positional argument: 'Loader'

=== tests.package.test_luasyslog.TestLuaLuasyslog ===

https://gitlab.com/buildroot.org/buildroot/-/jobs/2088683903

Error is:

>>> luasyslog 2.2.0 Building
PATH="/builds/buildroot.org/buildroot/test-output/TestLuaLuasyslog/host/bin:/builds/buildroot.org/buildroot/test-output/TestLuaLuasyslog/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"  /usr/bin/make -j33  -C /builds/buildroot.org/buildroot/test-output/TestLuaLuasyslog/build/luasyslog-2.2.0/
/usr/bin/make  all-am
  CC       lsyslog.lo
  CC       compat-5.3.lo
In file included from lsyslog.c:11:
compat-5.3.h:402:4: error: #error "unsupported Lua version (i.e. not Lua 5.1, 5.2, or 5.3)"
 #  error "unsupported Lua version (i.e. not Lua 5.1, 5.2, or 5.3)"
    ^~~~~
In file included from compat-5.3.c:7:
compat-5.3.h:402:4: error: #error "unsupported Lua version (i.e. not Lua 5.1, 5.2, or 5.3)"
 #  error "unsupported Lua version (i.e. not Lua 5.1, 5.2, or 5.3)"
    ^~~~~
make[3]: *** [Makefile:710: lsyslog.lo] Error 1

=== tests.package.test_lxc.TestLxc ===

https://gitlab.com/buildroot.org/buildroot/-/jobs/2088683908

Error is:

# lxc-start -l trace -n lxc_iperf3 -o /tmp/lxc.log -L /tmp/lxc.console.log
lxc-start: lxc_iperf3: lxccontainer.c: wait_on_daemonized_start: 868 Received container state "ABORTING" instead of "RUNNING"
lxc-start: lxc_iperf3: tools/lxc_start.c: main: 306 The container failed to start
lxc-start: lxc_iperf3: tools/lxc_start.c: main: 309 To get more details, run the container in foreground mode
lxc-start: lxc_iperf3: tools/lxc_start.c: main: 312 Additional information can be obtained by setting the --logfile and --logpriority options
# echo $?

=== tests.package.test_rust.TestRustBin ===

https://gitlab.com/buildroot.org/buildroot/-/pipelines/470182758/failures

Build issue while building the example Rust application:

          /usr/bin/ld: /tmp/tmpdggplkto-br2-testing-rust/hello-world/target/armv7-unknown-linux-gnueabihf/debug/deps/hello_world-e03f93fef10567c3.1ajq7aud2z9fxhe5.rcgu.o: error adding symbols: file in wrong format
          collect2: error: ld returned 1 exit status

Could
https://patchwork.ozlabs.org/project/buildroot/patch/20220217230638.98748-1-moritz@h6t.eu/
be related ?

=== tests.package.test_rust.TestRust ===

Same error as above.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
