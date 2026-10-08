Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489D0CA6007
	for <buildroot@archiver.kernel.org>; Thu,  8 Oct 2026 11:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 038138122B;
	Thu,  8 Oct 2026 11:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZD7567Fn3UHb; Thu,  8 Oct 2026 11:14:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B7F07811FB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791458067;
	b=GLg+nISu0Iaet9Cr1rV8kxvPpTrSjCP3SfdgNZfD2OkW2Lp6C/N2zeA/jdumzAC3Otk1
	 78ZjC+Lrs7bwjjU8y52th0dpBV5SLUpUx6AcEDP1fLsaarsuZ+QeJ1rz/9pGkfg6If26z
	 Z4ixO9Pd3t063e4MnXbAoKfsztBYdpiRbr4gl2gpU5SK0xsJVHnNmpNClrWGP29VHlrSh
	 CVrKNw8QGqQdT92PMWqcZFNHKgiGu1kWZLDyZdU2vqaMFah+E4rshf1Z6SygbYViAvALs
	 +RLkIRmykvwmjtdOLGJcO1h8x1KPQEJSLJLQHTnckFdg9g9HkGafJk+LB82dkI67TdQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791458067;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CrGkw3FWkNPUKn1+/1KxKrOdTFjSZBzQdx7YUSPg62g=;
	b=bEMpp+Ro/GeolxoN2KYcYU9aoa9+8Z95JQ/zR/Hx06ZYJK2uvkE0FRacTlI/uNqKj5Ze
	 WwaownmaOrkWiYZHcbZyO7NrhU7rb1f8ztJDBW/B6G2eIrdzplS4Nn1oqtF/ocgQRDaie
	 FzN42ba7X4Q6rpP4qDqU9H6zrgUEyS5XY/GSinhTRWFG9Cq3+RW4LBmCVO1VTanJYnp+T
	 LU0mG0eb4ZkTyUZrtguZFVtC33Ae3FXs2Tc94rJpTYH+KiqWQUZWVkWHyPM0y0qesFjbQ
	 r7vEMFdyJKUSYwwclY4KXpPnzwMIx10RaRXSup7f9HOmoAB3lw+kctPOYNJ7hDz4ykw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="c/YayLVW";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791458067;
	bh=CrGkw3FWkNPUKn1+/1KxKrOdTFjSZBzQdx7YUSPg62g=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M6W3mXqKztI3PzOe+m0Zj5BCX3og/naCP0El2fALfxkqsozCVAo8xi3wvCsAcjGfh
	 ce1xe3YCVpblVUHYOs2oZA8J2CDV+vBsD+mKGg0NALHV3KVnXLKHJSwe2uknUq8lyW
	 nC8qIOb3WyUXxnji4foOJnObGqGQbs8WRy1WNaBHjX3zIh386eYQgE50ap2+cwhvD9
	 f2Uha2ccpbvUi9cWz5MfBIVdMtkXdgRixZPnHIyBOT6PX1ff73DmrHIWAKZ0Ir58cx
	 ZMNu80J3irLAkEv4js24pyKf5+0uf2tuvvd5cvil+/4ytCA5vKDFyZ0Te4JBamibLL
	 hpEab0GgN/FEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7F07811FB;
	Thu,  8 Oct 2026 11:14:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EA4282B2
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 11:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBF12811FB
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 11:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vbxoTYKraIVR for <buildroot@buildroot.org>;
 Thu,  8 Oct 2026 11:14:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CC49F811FA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791458066;
 b=YDEPyQ0dHWqDHjztiiomNbQ0NsZJgLm1BH4qJNxGzMTBhhmdY/jQknL0a7zYKbr+GmKv
 l9DJXG/SvXjX5EPNWEgng871xIbY47+e/LzYK69gB2PoQBl2ojaQbZOsm1V/P9kELF7XX
 ZntpUjYWKELwxqPzvSbwuB618yatW+9yIqU+ujgCu6Jui/90xcxrwbE7sOrnu2mFyA82o
 4DloCt/CHMFA4LNxNw93Qve4dErB+cUDlEQu5K5VogANBtoz+mMwFsiKpzxKFb0GaYzTQ
 CSErNwxV7UdcgzcsLopkFqoNfgw/91X3LL0gsVB85Yick0pqy8YkBwFKDQS2aCdOjoA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791458066;
 h=Received-SPF:DKIM-Signature:Received:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
 bh=jQ7vjbnYD0z0Ceu/TdnNhYyO+LZSNLDp1HoOVIxWNas=;
 b=exeCPar1Sg3v4MDlENLn1ZxGg7zVN4tTfP2458i9iWvFBwKFeyrSCL86EGbIqs6v2CP5
 kPUfehGRdrjiGoKzN5D5OoODe2LbCXtccooJRbtsXAORPSWFKoh81VcaGhPdlY53+x4Y3
 sJOjHJzMrXagzu9DTsqLKZdlWkSEnXtOxfy1gQrgeoM3UVuAYwVglUSx7i3kStaBvMMLi
 +PIrXsxB8V6BsY/xA8PIvXT7FJ8MbwpUKDJRZhwsS/rwaChv9cCUK2x47Sq4JhiH35pe7
 rUzSoRYSxaIMO6jvDyrgC3QX78WimCxGpUORvwK7Tl+q3bLZjCrxSO7YCYgimkTim3A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=163.com; 
 dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b="c/YayLVW"; 
 arc=none smtp.remote-ip=220.197.31.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.5;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=c/YayLVW
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC49F811FA
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 11:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=jQ
 7vjbnYD0z0Ceu/TdnNhYyO+LZSNLDp1HoOVIxWNas=; b=c/YayLVWDU6TkQhO9I
 7frhBQg2wpVEMP7bWvAD4ksc8+eiTu82RfptPE7A+eE10UKbguvaFQnn27czI4Uj
 Yy5zvq3zPYs9ENkdfX/UkoWQtgL/UVnUopCKHlJWKGGWXRL/4i40TwgqjCgdxN64
 Lz7RY6U36zT5rPOsKdJUk+odg=
Received: from ubuntu.localdomain (unknown [])
 by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id
 _____wDn7937esdqNn+HDA--.1907S2; 
 Thu, 08 Oct 2026 19:14:04 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Cc: TIAN Yuanhao <tianyuanhao3@163.com>
Date: Thu,  8 Oct 2026 04:13:07 -0700
Message-ID: <20261008111307.4307-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-CM-TRANSID: _____wDn7937esdqNn+HDA--.1907S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGF1kWrW3Ww1UCFWfAF1rtFb_yoW7JFWUpF
 1rGa15tr4qqr97GF12k3Z7Xw15ZFs3GF48Zw1fXFZxZw45Kr13JrZIy34FqF1UWF4fAayU
 XFs2v34rCwsrGaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR_HUhUUUUU=
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbC4R1q92rHev3z1QAA3t
Subject: [Buildroot] [PATCH 1/1] package/fakeroot: add patch to fix build
 hang in Docker
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

When faked forks itself into the background to daemonize, it closes
its inherited file descriptors via close_range(2), falling back to
an explicit close() loop only when that fails with ENOSYS. Under a
seccomp profile that does not allow close_range() (e.g. Docker
before 20.10.4), the call instead fails with EPERM, so the fallback
never runs, a pipe fd stays open, and host-fakeroot hangs forever
instead of returning.

Fall back to the close() loop on any close_range() failure, not just
ENOSYS.

See:
https://salsa.debian.org/clint/fakeroot/-/merge_requests/36

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
---
 ...-back-to-close-loop-on-any-close_ran.patch | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 package/fakeroot/0001-PATCH-faked-fall-back-to-close-loop-on-any-close_ran.patch

diff --git a/package/fakeroot/0001-PATCH-faked-fall-back-to-close-loop-on-any-close_ran.patch b/package/fakeroot/0001-PATCH-faked-fall-back-to-close-loop-on-any-close_ran.patch
new file mode 100644
index 0000000000..4d559d2b6e
--- /dev/null
+++ b/package/fakeroot/0001-PATCH-faked-fall-back-to-close-loop-on-any-close_ran.patch
@@ -0,0 +1,88 @@
+From c911a705cd16146c20b2de18a3bb6c41e3e4ab7a Mon Sep 17 00:00:00 2001
+From: Maciej Andrzejewski <maciej.andrzejewski@iceye.com>
+Date: Tue, 23 Jun 2026 12:40:47 +0200
+Subject: [PATCH] [PATCH] faked: fall back to close() loop on any close_range()
+ failure
+
+Verified-against: fakeroot 1.37.1.1 (Buildroot 2025.08), fakeroot 1.38.1
+                  (Debian sid). The daemonize block this patch touches
+                  is byte-for-byte identical between the two; the same
+                  patch applies cleanly to both.
+
+When faked forks itself into the background, the child must close all
+inherited file descriptors so that fd 1 (the pipe back to the calling
+shell's command substitution `KEY_PID=$(...)' inside the `fakeroot'
+wrapper script) is released. Without that, the wrapper hangs forever
+waiting for EOF on the pipe, even though the parent has already
+printed `KEY:PID' and exited.
+
+Originally faked closed the descriptors with an explicit close() loop.
+A later commit added a faster path using close_range(2) with a fallback
+to the loop guarded by `if (errno == ENOSYS)'. This fallback only
+triggers when the kernel does not implement the syscall.
+
+That guard is too narrow. Inside Docker (and any other sandbox using
+seccomp filters such as systemd-nspawn or Kubernetes) the default
+seccomp profile rejects close_range with EPERM, not ENOSYS. The
+fallback loop is then skipped, the daemon keeps fd 1 open, and the
+wrapper hangs:
+
+  strace: close_range(0, 1048576, 0) = -1 EPERM (Operation not permitted)
+
+Capture the return value of close_range and run the fallback loop
+whenever close_range did not return success. close() of an
+already-closed fd is harmless (returns EBADF), so this is safe even on
+hosts where close_range works (the loop simply becomes a no-op).
+
+Reproduces with fakeroot >= 1.35 inside Docker (default seccomp
+profile), e.g. when running `fakeroot true' from a `$(...)' command
+substitution: it never returns.
+Reproduces with Buildroot 2025.08 host-fakeroot 1.37.1.1 inside Docker,
+visible as the build hanging at the fakeroot rootfs assembly step
+without progress.
+Same root cause as the OpenWrt build hangs reported in [1], the fakeroot
+test-suite timeouts on Launchpad builders reported in [2].
+
+[1] https://github.com/openwrt/openwrt/issues/19294
+[2] https://bugs.launchpad.net/ubuntu/+source/fakeroot/+bug/2068702
+
+Signed-off-by: Maciej Andrzejewski ICEYE <maciej.andrzejewski@m-works.net>
+Upstream: https://salsa.debian.org/clint/fakeroot/-/commit/c911a705cd16146c20b2de18a3bb6c41e3e4ab7a
+Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
+---
+ faked.c | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/faked.c b/faked.c
+index 735e6b3..a41e754 100644
+--- a/faked.c
++++ b/faked.c
+@@ -1547,17 +1547,21 @@ int main(int argc, char **argv){
+     if ((pid=fork()) == 0){
+       int fl;
+       int num_fds = getdtablesize();
++      int cr_ret = -1;
+ 
+       fflush(stdout);
+ 
+ #ifdef HAVE_CLOSE_RANGE
+ # ifdef FAKEROOT_FAKENET
+-      close_range(0, sd-1, 0);
+-      close_range(sd+1, num_fds, 0);
++      cr_ret = close_range(0, sd-1, 0);
++      if (cr_ret == 0)
++        cr_ret = close_range(sd+1, num_fds, 0);
+ # else /* !FAKEROOT_FAKENET */
+-      close_range(0, num_fds, 0);
++      cr_ret = close_range(0, num_fds, 0);
+ # endif
+-      if (errno == ENOSYS) {
++      /* Fall back to the explicit loop on any failure (e.g. EPERM
++         from a Docker/seccomp sandbox), not just ENOSYS. */
++      if (cr_ret != 0) {
+ #endif /* HAVE_CLOSE_RANGE */
+ 
+       /* This is the child closing its file descriptors. */
+-- 
+2.53.0
+
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
