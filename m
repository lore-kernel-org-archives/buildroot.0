Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6DCE77188
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 16:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F5EC401CF;
	Tue, 31 Dec 2024 16:12:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y7jnDltTJZU0; Tue, 31 Dec 2024 16:12:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 393DA4019E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 393DA4019E;
	Tue, 31 Dec 2024 16:12:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB583968
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 16:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C91BC40062
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 16:12:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1hLrChhwHt0 for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 16:12:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3EC9E400E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EC9E400E5
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3EC9E400E5
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 16:12:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30B131BF203;
 Tue, 31 Dec 2024 16:12:51 +0000 (UTC)
Date: Tue, 31 Dec 2024 17:12:49 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241231171249.0bf50c4c@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735661571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Fsf05f0ulgNyWHv+HnY+BBiGgaqdKHnd0xDW9gziuoA=;
 b=UfqiGV/aWUGC3XDGaQ2/O7TvOVIwB6IMmfrZ6zzkvWBCrFseCXUUhG8+NlvNk6ANd93Alt
 7IHz2qvgYoLKiCrC97d0ckRfwcuceL6vSTWItA9zuM9RmP7/rFLaeinP1bHnPuOTTgZLXh
 +Q8YRHWllJawTSTRFS+Ca7T+ZtGLVyfIFyIxjI0p1Kx0YRFLSBjd1mI7Jdph2a5pY1zwH/
 F8o9xBuGbuisn7DmaP6Ek6pECdUu9Y+gI88O7UZx88IqMqANPfA81ejvLJ2/cpIEa+cTQD
 M1CtXiCiacDTGyZNwHtsfaP7nl+bq+osEJwpyoiSSNTAmrQU6x6VjIZ2CwcW8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UfqiGV/a
Subject: [Buildroot] Analysis of host-libxcrypt build failures
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

For quite a while, host-libxcrypt has been failing to build in the
autobuilders:

  http://autobuild.buildroot.net/?reason=host-libxcrypt-%

We've had over 440 build failures already, and they all look like this:

*** ERROR: package host-libxcrypt installs executables without proper RPATH:
***   /home/autobuild/autobuild/instance-14/output-1/host/bin/perl5.38.2
***   /home/autobuild/autobuild/instance-14/output-1/host/bin/perl

which of course looks surprising as host-libxcrypt is not the package
installing perl. I finally took the time to investigate this, and I
understand what happens, but I'm not fully sure what it is the correct
fix. So let's dive down into what happens:

- host-perl gets built, and installs host/bin/perl and
  host/bin/perl5.38.2. At this time, perl is linked with libc.so,
  libm.so, libcrypt.so, using the libcrypt.so from the host system.

  The perl executable does not have a proper RPATH, but
  check-host-rpath does not complain because none of the libraries that
  perl is linked against (libc, libm, libcrypt) are in HOST_DIR/lib
  (see function elf_needs_rpath() in support/scripts/check-host-rpath)

- host-libxcrypt then builds, and installs host/lib/libcrypt.so. Then,
  the support/scripts/check-host-rpath runs after the installation of
  host-libxcrypt. This script checks all executables, not just the ones
  that have just been installed by the current package, so it does
  check perl and perl5.38.2 again.

  The perl executable still does not have a proper RPATH, and it is
  still linked against libcrypt.so, which this time around is in
  HOST_DIR/lib, which from check-host-rpath point of view is wrong: the
  executable depends on a library provided by Buildroot's HOST_DIR, so
  the executable should have a RPATH that ensures the library in
  HOST_DIR/lib gets used.

The obvious thing to fix is to get the perl executable to have a proper
RPATH of course.

However, this means in the scenario above that perl will be
built/linked against the system libcrypt.so, and then after
host-libxcrypt is built/installed, host/bin/perl will from this point
on run with libcrypt.so in host/lib, which isn't really ideal. Should
we make host-libxcrypt a mandatory dependency of host-perl? How do we
detect this situation in other packages? Should check-host-rpath have
instead a allow-list of libraries (libc, libm) for which we accept to
use the system-provided ones, and for everything else (including
libcrypt), we expect HOST_DIR/lib to provide them?

For the record, we have host-libxcrypt because host-systemd was failing
to build on systems that have a recent glibc installed, but don't have
libxcrypt installed system-wide.

Thoughts?

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
