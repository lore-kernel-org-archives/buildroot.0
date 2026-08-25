Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CBAC61DB6
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 07:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBBDB60672;
	Tue, 25 Aug 2026 07:22:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wa73PPE6HhuW; Tue, 25 Aug 2026 07:22:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787642552;
	bh=bxU5of4EAUSHV0UH6TuHb3MKxbHh/xy1cd2tuacv1e0=;
	h=Date:Cc:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PjBR20NBtf0cdp3sJimeP6bCft8tnXOOJAX1FIsiI78pfvheOJf0mez8hhtj3GRg5
	 aIvT2lssxytOHRqQltKS+ddsltV2AwZ9NefKBMNIAsWMPmVEwsK/atztmooOxuBabn
	 qOAOnjO/TUjNEaUZ1iHm1faQMwOuKragHhdhkHTgcWbh2N4t2D+bUz98VTlxzJk7Ep
	 VoxtbdO+eZcFCoTIuh15cELEIbICnOBKn0UyLepKw3qNUu3d+4NaRsrikQU0h+DIQE
	 APsB/xMPPwvWIciFDI+9unpnQKWQ/Pwr624XoNSnI3cQiCnw6oKmIf4CKysgbmsvkt
	 yjLq5/WF6CoHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0506760614;
	Tue, 25 Aug 2026 07:22:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53A21396;
 Tue, 25 Aug 2026 07:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4599A80C7E;
 Tue, 25 Aug 2026 07:22:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6dsCmvGoSoLx; Tue, 25 Aug 2026 07:22:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE1CD80C74;
 Tue, 25 Aug 2026 07:22:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 35BF11A1812;
 Tue, 25 Aug 2026 07:22:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F0E42604C4;
 Tue, 25 Aug 2026 07:22:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E802C11C79F8D; 
 Tue, 25 Aug 2026 09:22:16 +0200 (CEST)
Mime-Version: 1.0
Date: Tue, 25 Aug 2026 09:22:16 +0200
Message-Id: <DKXUE40FIWE4.3S7E1S63AIK6N@bootlin.com>
Cc: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>, "Yann E.
 MORIN" <yann.morin.1998@free.fr>, "David Laight" <David.Laight@ACULAB.COM>,
 "buildroot" <buildroot-bounces@buildroot.org>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <buildroot@buildroot.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260824213435.3324692-1-thomas.petazzoni@bootlin.com>
In-Reply-To: <20260824213435.3324692-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] support/scripts/check-host-libs: add new
 check on host binaries/libs
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Mon Aug 24, 2026 at 11:34 PM CEST, Thomas Petazzoni via buildroot wrote:
> One frequent issue in Buildroot is that when building host libraries
> or applications, the build system of the package detects some
> libraries provided by the system, and happily links to them, without
> Buildroot knowing. Sometimes this doesn't cause any problem, but
> sometimes this causes issues, and we're regularly eliminating such
> mis-detection by forcing those packages to not detect the system
> libraries that have not been built by Buildroot.
>
> The new script check-host-libs added in this commit, which is executed
> during the host-finalize step at the end of the build is an attempt at
> detecting at least some of these situations.
>
> What it does is that at the end of the build, it verifies that all
> binaries and libraries in $(HOST_DIR) only have shared library
> dependencies on libraries that are in Buildroot $(HOST_DIR), to the
> exception of the C library, for which we of course use the system C
> library.
>
> For example, if the binary output/host/bin/plop is linked against
> libpng, but libpng was not built and installed by Buildroot, the build
> will now fail with:
>
> ERROR: in /home/thomas/projets/buildroot/output/host/bin/plop, libpng16.so.16 unknown
> make: *** [Makefile:715: host-finalize] Error 1
>
> The script includes an allowlist of libraries provided by the C
> library. It is potentially possible that this list might need to be
> extended to cover all systems/distributions/C libraries, but only
> wider testing of this script will help detect such cases.
>
> It is worth mentioning that for now this script is executed only once
> at the end of the build. This means that if a package A gets built,
> detects and uses a system library libfoo and uses it, and then by
> chance later Buildroot package B builds and installs libfoo into
> HOST_DIR/lib, this script will believe that package A is correct, as
> it finds libfoo in HOST_DIR/lib, even though while package A was being
> built, the libfoo being detected was the system one. Detecting this
> would require running check-host-libs at the end of each package
> build, but that would imply re-checking over and over again all host
> binaries/libraries, which could have a noticeable impact on the build
> time. So for now, we simply check at the end of the build, which
> should already help to detect a lot of interesting bogus situations.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> It would be very useful if a few people could apply this patch to
> their local tree, run their usual build, and see how it behaves. This
> way, I can get some feedback to address the most obvious issues before
> it gets merged and starts causing build failures in the autobuilders.

I gave a try to your checker on some personal project, and I get plenty
of warnings:

  >>>   Finalizing host directory
  ./support/scripts/check-host-libs /home/alexis/src/neon-beat/neon-beat-controller/output/host
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/systemd-cgtop, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/systemd-creds, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/systemd-cgls, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/systemd-escape, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/systemd-stdio-bridge, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/systemd-tty-ask-password-agent, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/cpack, libidn2.so.0 unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/cpack, libmd.so.0 unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/systemd-cat, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/systemd-detect-virt, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/systemd-hwdb, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/systemd-mount, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/systemd-vpick, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/systemd-run, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/varlinkctl, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/systemd-socket-activate, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/floppyd, libX11.so.6 unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/systemd-ac-power, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/systemd-path, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/systemctl, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/cmake, libidn2.so.0 unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/cmake, libmd.so.0 unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/systemd-delta, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/busctl, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/systemd-id128, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/udevadm, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/systemd-notify, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/systemd-machine-id-setup, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/systemd-ask-password, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/systemd-nspawn, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/journalctl, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/ctest, libidn2.so.0 unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/ctest, libmd.so.0 unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/systemd-tmpfiles, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/sbin/sfdisk, libreadline.so.8 unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/sbin/fdisk, libreadline.so.8 unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/udev/iocost, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/udev/mtd_probe, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/udev/dmi_memory_id, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/udev/v4l_id, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/udev/cdrom_id, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/udev/ata_id, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/udev/fido_id, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/udev/scsi_id, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/system-generators/systemd-run-generator, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/system-generators/systemd-debug-generator, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/system-generators/systemd-ssh-generator, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/system-generators/systemd-getty-generator, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/system-generators/systemd-fstab-generator, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/system-generators/systemd-system-update-generator, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/system-generators/systemd-tpm2-generator, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/systemd-network-generator, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/systemd-socket-proxyd, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/systemd-ssh-proxy, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/systemd-sleep, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/systemd-executor, libsystemd-core-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/systemd-executor, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/systemd-reply-password, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/systemd-cgroups-agent, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/systemd-fsck, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/systemd-battery-check, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/systemd, libsystemd-core-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/systemd, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/libsystemd-core-256.so, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/systemd-shutdown, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/systemd-sysctl, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/systemd-sulogin-shell, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/systemd-makefs, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/systemd-remount-fs, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/systemd-growfs, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/systemd-update-done, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/systemd-boot-check-no-failures, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/systemd/systemd-journald, libsystemd-shared-256.so unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/erlang/lib/wx-2.4.1/priv/wxe_driver.so, libwx_gtk3u_stc-3.2.so.0 unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/erlang/lib/wx-2.4.1/priv/wxe_driver.so, libwx_gtk3u_xrc-3.2.so.0 unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/erlang/lib/wx-2.4.1/priv/wxe_driver.so, libwx_gtk3u_html-3.2.so.0 unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/erlang/lib/wx-2.4.1/priv/wxe_driver.so, libwx_baseu_xml-3.2.so.0 unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/erlang/lib/wx-2.4.1/priv/wxe_driver.so, libwx_gtk3u_core-3.2.so.0 unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/erlang/lib/wx-2.4.1/priv/wxe_driver.so, libwx_baseu-3.2.so.0 unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/erlang/lib/wx-2.4.1/priv/wxe_driver.so, libwx_gtk3u_gl-3.2.so.0 unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/erlang/lib/wx-2.4.1/priv/wxe_driver.so, libwx_gtk3u_aui-3.2.so.0 unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/erlang/lib/wx-2.4.1/priv/wxe_driver.so, libwx_gtk3u_webview-3.2.so.0 unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/erlang/lib/wx-2.4.1/priv/erl_gl.so, libGL.so.1 unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/erlang/lib/wx-2.4.1/priv/erl_gl.so, libGLU.so.1 unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/erlang/lib/odbc-2.14.2/priv/bin/odbcserver, libodbc.so.2 unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/python3.12/lib-dynload/_gdbm.cpython-312-x86_64-linux-gnu.so, libgdbm.so.6 unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/python3.12/lib-dynload/readline.cpython-312-x86_64-linux-gnu.so, libreadline.so.8 unknown
  ERROR: in /home/alexis/src/neon-beat/neon-beat-controller/output/host/lib/python3.12/lib-dynload/_dbm.cpython-312-x86_64-linux-gnu.so, libgdbm_compat.so.4 unknown
  make[2]: *** [Makefile:747: host-finalize] Error 1
  make[1]: *** [Makefile:23: _all] Error 2
  make: *** [Makefile:24: neon-beat-controller] Error 2

I did not take a look at all of those, but the first one on
systemd-cgtop looks wrong.

  $ ldd /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/systemd-cgtop
    linux-vdso.so.1 (0x00007fe696105000)
    libsystemd-shared-256.so => /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/../lib/systemd/libsystemd-shared-256.so (0x00007fe695c00000)
    libc.so.6 => /usr/lib/libc.so.6 (0x00007fe695800000)
    libcap.so.2 => /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/../lib/systemd/../../lib/libcap.so.2 (0x00007fe69609d000)
    libcrypt.so.2 => /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/../lib/systemd/../../lib/libcrypt.so.2 (0x00007fe69605d000)
    libmount.so.1 => /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/../lib/systemd/../../lib/libmount.so.1 (0x00007fe695fe6000)
    libm.so.6 => /usr/lib/libm.so.6 (0x00007fe695ac9000)
    /lib64/ld-linux-x86-64.so.2 => /usr/lib64/ld-linux-x86-64.so.2 (0x00007fe696107000)
    libblkid.so.1 => /home/alexis/src/neon-beat/neon-beat-controller/output/host/bin/../lib/systemd/../../lib/libblkid.so.1 (0x00007fe695a65000)

  $ls -l output/host/lib/systemd/libsystemd-shared-256.so
  -rwxr-xr-x 1 alexis alexis 3713824 Aug 25 09:11 output/host/lib/systemd/libsystemd-shared-256.so

  $readelf -d output/host/bin/systemd-cgtop

  Dynamic section at offset 0x8ae0 contains 29 entries:
    Tag        Type                         Name/Value
   0x0000000000000001 (NEEDED)             Shared library: [libsystemd-shared-256.so]
   0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
   0x000000000000001d (RUNPATH)            Library runpath: [$ORIGIN/../lib:$ORIGIN/../lib/systemd]
   0x000000000000000c (INIT)               0x3000
   0x000000000000000d (FINI)               0x64a0
   0x0000000000000019 (INIT_ARRAY)         0x9910
   0x000000000000001b (INIT_ARRAYSZ)       8 (bytes)
   0x000000000000001a (FINI_ARRAY)         0x9918
   [...]

The main issue seems to be due to libsystemd-shared-256.so being in
$(HOST_DIR)/lib/systemd and not $(HOST_DIR)/lib. Shouldn't
check-host-libs also parse this RUNPATH ?

Alexis

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
