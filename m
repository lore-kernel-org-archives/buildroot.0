Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F8CE8538E
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 19:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25213611C4;
	Fri,  3 Apr 2026 19:12:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id quxVgUc23ovi; Fri,  3 Apr 2026 19:12:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8F7C611CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775243537;
	bh=Dqaf1MguD/S2K/3cPB1v6MAASBMCbS4G/sBhebelWXA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rmLDg3tGb7JbAtE9xRQJqb7peAWdDg8GhSGSoP4JnfiaLWlynTu8MB5GwfAddXIqa
	 POsibZvsRU7J7Yyv9V6CCZAgbg2acac8Rg7VyLzgBr1/MMKKGoC4DxVC0DADDu8nHT
	 vKV4YadzzMa9QYYZJU1qi2nvfdzMeTM1Wxv/F1AEg9IQqeKjvmdoFZIu2b7r6O54lq
	 2oQdyqO1B2610W8oqM2IOR6Qd5r23bqbtRpfBIb8hFKL8kGDm2ywnhyK6fx/uLVLMg
	 vG8uZGjU9OQRujEnQhAxWGO0+LKNEbFHprJjgTfuKrVuuRtfVX4SsBgs8jxnL3dFF9
	 Tj/GNwZI9aIYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8F7C611CA;
	Fri,  3 Apr 2026 19:12:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CC2DB75A
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 19:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B235940297
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 19:12:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qrld9ZGaxJRf for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 19:12:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3E0FA40202
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E0FA40202
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E0FA40202
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 19:12:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cb24.dip0.t-ipconnect.de [79.214.203.36])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 920C4A4C358F;
 Fri,  3 Apr 2026 21:12:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38780)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w8jwC-000000000if-0FSH;
 Fri, 03 Apr 2026 19:12:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  3 Apr 2026 21:12:11 +0200
Message-ID: <20260403191212.41297-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775243532;
 bh=FDpSc/Z3mhxkaWQUDgs5aDU/qkkgzDxYJDzZy7UfnEI=;
 h=From:To:Cc:Subject:Date:From;
 b=M6ow0Vm0+GFI5DsYArTPjYSNF3tJ8YzfP81BXNPwTvBiuL/r2Q/5QBoFh5/vT9T9a
 1HBcVAnBM8DniBC6M2qvbLpV26anPmRumxeKKzZzLvcKe46Buw7AKXP7VUDs5taybI
 x2TBY9zS2K1JIYeVLNxU8AotvUcXJ2+VFubpPgTZrRNjmyfQyufjTkpP+rTJpsdaTg
 V3IAhSYw2QIaW2SyekUZGxTB6PgHNyLkci1DoBXkJFfmHyyhXGHxt8yaw9bg4Xbv9M
 hfFJwoPQQaTOO+vnO4S4eo4rt+pPZn5w+2uQxT1nn9Xfo729BzV3DrKduH4wAaVZhw
 Aitgvh+Dgkwtg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=M6ow0Vm0
Subject: [Buildroot] [PATCH 1/1] package/suricata: bump version to 8.0.4
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

Rebased patches.

Upstream switched from pcre to pcre2 in version 7.0.0:
https://github.com/OISF/suricata/commit/bce3c46874cfad9228d2f32b01c9aa5b9091fee6

Updated project URL, the old URL is not reachable anymore.

Added a cargo variable to _MAKE_ENV to fix build error introduced by the
bump to 8.x:
https://lists.buildroot.org/pipermail/buildroot/2025-September/786602.html
"The library suricata-htp appeared in suricata 8."

error: linking with `cc` failed: exit status: 1
  |
  = note: LC_ALL="C" PATH="/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/bin:/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/bin:/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/bin:/home/adymov/build_fw/binaries/vpnfw/host/bin:/home/adymov/build_fw/binaries/vpnfw/host/sbin:/home/adymov/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin" VSLANG="1033" "cc" "-Wl,--version-script=/tmp/rustcQjKpH4/list" "-Wl,--no-undefined-version" "-m64" "/tmp/rustcQjKpH4/symbols.o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.00.rcgu.o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.01.rcgu.o" "/home/adymov/build_fw/binaries/vpnf
 w/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.02.rcgu.o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.03.rcgu.o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.04.rcgu.o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.05.rcgu.o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.06.rcgu.o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.07.rcgu.o" "/home/adymov/build_fw/binaries
 /vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.08.rcgu.o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.09.rcgu.o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.10.rcgu.o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.11.rcgu.o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.12.rcgu.o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.13.rcgu.o" "/home/adymov/build_fw/bin
 aries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.14.rcgu.o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.15.rcgu.o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.9o2zvkk1iz7v62w1p151csbmg.rcgu.o" "-Wl,--as-needed" "-Wl,-Bstatic" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libflate2-c96dc52b792974fc.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libminiz_oxide-9a5e6c87bd0989fa.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libadler2-15e2a2214e20491a.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/targe
 t/x86_64-unknown-linux-gnu/release/deps/liblibz_sys-b9befbb3035c2fca.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libcrc32fast-0a43d2846a4a9b36.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libcfg_if-360ab3241b788fcb.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/liblzma_rs-9f468070623da4fd.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libcrc-bf45046f4b8356ef.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libbyteorder-dfc24cad053c0b20.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/liblibc-ed317864a666eb97.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/targ
 et/x86_64-unknown-linux-gnu/release/deps/libbase64-a4f094197250161c.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/liblazy_static-5ba27f73220e0e24.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libnom-4108c1713f94c8d7.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libbrotli-98d4b766d2a5f84b.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libbrotli_decompressor-59c8bf34b757d6b2.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/liballoc_stdlib-703a31eff75062d1.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/liballoc_no_stdlib-5d20fd5d2a496308.rlib" "/home/adymov/build_fw/binaries/vpnfw/bui
 ld/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libtime-44b9873eb3882e39.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libitoa-416b9fe21b8f56dc.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libtime_core-eab4204f5d5ed516.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libnum_conv-f033d8bf2b8b56f6.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libderanged-bdda0d83f774c73b.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libpowerfmt-3c6a581bbf7aead2.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libbstr-346bfb9c2bf6a77a.rlib" "/home/adymov/build_fw/binaries/vpnfw/bui
 ld/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libregex_automata-b93a7f9635e4dd42.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libmemchr-a87a7ebd56a50ef2.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/libstd-22be60875a4ac8d7.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/libpanic_unwind-4b832a03827ff95e.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/libobject-a25e7f31e2204719.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/libmemchr-1f1858edbb50ccb5.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/libaddr2line-1319b75889377807.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/libgimli-c9972d847170eb93.rlib" "/home/adymov/build_fw/bina
 ries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/librustc_demangle-0868a75d0b80f801.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/libstd_detect-f4254a923640cbea.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/libhashbrown-f21de9b2e2c92770.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/librustc_std_workspace_alloc-cf868f78468d45dd.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/libminiz_oxide-cce9a55233783113.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/libadler-6ef1f692f91f321e.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/libunwind-d2b4a3bc57672e2c.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/libcfg_if-9d8e4e6f4cb45592.rlib" "/home/adymov/build_fw/binaries/vp
 nfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/liblibc-858b7338441a56b6.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/liballoc-d182631d04e1eed2.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/librustc_std_workspace_core-7874c355ab5ed077.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/libcore-46b25da62cc69443.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/libcompiler_builtins-c71612932829263c.rlib" "-Wl,-Bdynamic" "-lz" "-lgcc_s" "-lutil" "-lrt" "-lpthread" "-lm" "-ldl" "-lc" "-Wl,--eh-frame-hdr" "-Wl,-z,noexecstack" "-L" "/home/adymov/build_fw/binaries/vpnfw/host/bin/../x86_64-tss-linux-gnu/sysroot/usr/lib" "-L" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib" "-o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/relea
 se/deps/libsuricata_htp.so" "-Wl,--gc-sections" "-shared" "-Wl,-z,relro,-z,now" "-Wl,-O1" "-nodefaultlibs"
  = note: /usr/bin/ld: cannot find /lib64/libc.so.6: No such file or directory
          collect2: error: ld returned 1 exit status

error: could not compile `suricata-htp` (lib) due to 1 previous error

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...allow-the-user-to-override-RUST_TARGET.patch |  4 +++-
 .../0002-configure.ac-fix-static-build.patch    | 17 +++++++++--------
 package/suricata/Config.in                      |  4 ++--
 package/suricata/suricata.hash                  |  2 +-
 package/suricata/suricata.mk                    |  7 +++++--
 5 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/package/suricata/0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch b/package/suricata/0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
index ec876a6852..9c8123f3f1 100644
--- a/package/suricata/0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
+++ b/package/suricata/0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
@@ -8,6 +8,8 @@ When cross-compiling, RUST_TARGET is not always equal to host_triplet
 through RUST_TARGET environment variable
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Bernd: rebased for version 8.0.4]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  configure.ac | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
@@ -16,7 +18,7 @@ diff --git a/configure.ac b/configure.ac
 index 32c230209..7d7c9373f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2489,7 +2489,12 @@ fi
+@@ -2146,7 +2146,12 @@ fi
      have_rust_vendor="no"
  
      if test "x$cross_compiling" = "xyes"; then
diff --git a/package/suricata/0002-configure.ac-fix-static-build.patch b/package/suricata/0002-configure.ac-fix-static-build.patch
index fc5384a114..9e09aa3005 100644
--- a/package/suricata/0002-configure.ac-fix-static-build.patch
+++ b/package/suricata/0002-configure.ac-fix-static-build.patch
@@ -21,6 +21,8 @@ Fixes:
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Upstream: https://redmine.openinfosecfoundation.org/issues/7008
+[Bernd: rebased for version 8.0.4]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  configure.ac | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -29,24 +31,23 @@ diff --git a/configure.ac b/configure.ac
 index 232ee9bed..6277cb9b6 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1219,6 +1219,8 @@
+@ -1263,6 +1263,8 @@
          fi
      fi
  
-+    PKG_CHECK_MODULES([PCAP],libpcap,[CPPFLAGS="${CPPFLAGS} ${PCAP_CFLAGS}" LIBS="${LIBS} ${PCAP_LIBS}"],[:])
++    PKG_CHECK_MODULES([PCAP],libpcap,[CPPFLAGS="${CPPFLAGS} ${PCAP_CFLAGS}" LIBS="${LIBS} ${PCAP_LIBS}" with_pkgconfig_pcap=yes],[with_pkgconfig_pcap=no])
 +
      if test "$have_wpcap" != "yes"; then
          AC_CHECK_LIB(pcap, pcap_open_dead, [], [
              echo
-@@ -1234,8 +1236,6 @@
+@@ -1278,7 +1280,6 @@
          PCAP_LIB_NAME="pcap"
      fi
  
--    PKG_CHECK_MODULES([PCAP],libpcap,[CPPFLAGS="${CPPFLAGS} ${PCAP_CFLAGS}" LIBS="${LIBS} ${PCAP_LIBS}"],[:])
--
-     AC_PATH_PROG(HAVE_PCAP_CONFIG, pcap-config, "no")
-     if test "$HAVE_PCAP_CONFIG" = "no" -o "$cross_compiling" = "yes"; then
-         AC_MSG_RESULT(no pcap-config is use)
+-    PKG_CHECK_MODULES([PCAP],libpcap,[CPPFLAGS="${CPPFLAGS} ${PCAP_CFLAGS}" LIBS="${LIBS} ${PCAP_LIBS}" with_pkgconfig_pcap=yes],[with_pkgconfig_pcap=no])
+     if test "$with_pkgconfig_pcap" != "yes"; then
+         AC_PATH_PROG(HAVE_PCAP_CONFIG, pcap-config, "no")
+         if test "$HAVE_PCAP_CONFIG" = "no" -o "x$cross_compiling" = "xyes"; then
 -- 
 2.43.0
 
diff --git a/package/suricata/Config.in b/package/suricata/Config.in
index 5f7eb21da0..64069888d8 100644
--- a/package/suricata/Config.in
+++ b/package/suricata/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_SURICATA
 	select BR2_PACKAGE_LIBHTP
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBYAML
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2
 	help
 	  Suricata is a free and open source, mature, fast and robust
 	  network threat detection engine.
@@ -18,7 +18,7 @@ config BR2_PACKAGE_SURICATA
 	  detection (IDS), inline intrusion prevention (IPS), network
 	  security monitoring (NSM) and offline pcap processing.
 
-	  https://suricata-ids.org
+	  https://suricata.io
 
 comment "suricata needs a toolchain w/ wchar, threads"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
index ea5ba01dc0..15f7e666b3 100644
--- a/package/suricata/suricata.hash
+++ b/package/suricata/suricata.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  c1515754924b618914fcb3cb98873af49996b920f2389a1998f89604f227a807  suricata-6.0.20.tar.gz
+sha256  81cee7bae69848a9751b2ce0867620eefa52b192e79c20b5eac897600b28b191  suricata-8.0.4.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index 8840853054..0ee3752a21 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SURICATA_VERSION = 6.0.20
+SURICATA_VERSION = 8.0.4
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
@@ -24,7 +24,7 @@ SURICATA_DEPENDENCIES = \
 	libpcap \
 	libyaml \
 	$(if $(BR2_PACKAGE_LZ4),lz4) \
-	pcre \
+	pcre2 \
 	$(if $(BR2_PACKAGE_XZ),xz)
 
 SURICATA_CONF_ENV = \
@@ -32,6 +32,9 @@ SURICATA_CONF_ENV = \
 	CARGO_HOME=$(BR_CARGO_HOME) \
 	RUST_TARGET=$(RUSTC_TARGET_NAME)
 
+SURICATA_MAKE_ENV = \
+	CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_LINKER=$(TARGET_CROSS)gcc
+
 SURICATA_CONF_OPTS = \
 	--disable-gccprotect \
 	--disable-pie \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
