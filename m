Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67238C624CF
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 11:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFD7760749;
	Tue,  1 Sep 2026 11:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mkDThBfQUQbw; Tue,  1 Sep 2026 11:49:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788263399;
	bh=zhWmrdTye0HTK1o0+aDG/lgBtDzJ5I3LeAJgqoDoLBc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=DvjQgGog0SWtDS8Cb1vVUlGZDoN60mrBQ/cSrLcVgkuEFP+bMai7VYV7yzDNB7yA/
	 oCKau59H4i+MBYAb0XHW4pxIj/D6T9j5RJmUErRoboPJYXCa1D6O2KExvpZ9GvQvDB
	 ih90J3/Jci9Ni5H23HkTP4rOd7PSCMN/1k6v8LB218hMXre6WQQvqjQcCgwxPQ+DGF
	 J79MUlHHxmE6o2WRExfgUezXSMGUFuCkuI97N0sus8bbcm75RSGFR+d+awtUNzKZFY
	 xFVQ3RDZzJhTHsY87VCN/1HXUuGlpX7sgCOUfHhSWeHd4/JgnwXHxL+cE1OUxP5WWH
	 bGnPlG+IboH3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 962D560740;
	Tue,  1 Sep 2026 11:49:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 60C08105
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 11:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52858406AB
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 11:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C9QXMfgjuuH1 for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 11:49:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 63EA2406CD
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 11:49:56 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6a5ebf75d62so1602472a12.1
 for <buildroot@buildroot.org>; Tue, 01 Sep 2026 04:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788263395; x=1788868195;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EWuDL0dbcXKR3MI3z4FrQDkKQJpK9KLH3Qj8NSBRNx8=;
 b=MiQOB+MwiRz8zIFVMegF2bedEW3E5TCWQir9XjAEQz8/JZseJ5AsxoG9SEQdem7vD3
 S7a9/ugu9NQpGMGFoo4hVhBxwPgvNGinTX8tim2en+3ipDIOmu1n9iTAeI66xg71T9Bc
 VEvHNN/SuHZrwDxCT/IdGfwzUDdHdSmlDyNOYGHIf5TFPNazF5xidEnnvboK0TRcZxiP
 TuD+JkHwD1BCBXqzO6C0JvE1/YEdDDNiMwwfOwt0Z5Fy+xn2szQQgpO0hdnIDosjz1Kb
 ygnJzClz1Zw0n1BIXZXoNLRPvuwk5hz7hTu6PMmyHLcI6mreEOhpWtDakOaTM0APs1mY
 2zCw==
X-Gm-Message-State: AFuF++lV3yczptXyrBLRB1O2HvtlfbN4wf6V5+i6cALBIBSnFpu56fSV
 psM/FER5Y0s2UUXvG9iwSoGo5sDGvngt9SvTIVNc2R34Y1Le2jWb3mLVb/Yskg==
X-Gm-Gg: AYBFou2334wBYLBtrXdTP0i0GfLmPSlRDw5nvqpSkpYVaTxlqmlh06ivxKWo8b+R3+H
 SEnSDHPCbX6GXtaw6yk1rh1Hj03GC2G55wAAqMJ+koyBxtoGMux6ZNhKYcFrDUL45cjmyAWvMIJ
 jzKO06G1S9Xx3ijO7Up3TcysRDsroXxXEXY+XBC1gHrsqwuDFgSYeygiAgHWfMj2ubdKYi+M7Oh
 bCKh8+yJCOO82OJNSptniNFDZKVcKnqhvliZ28OjGUfWSz11tWIDv2wKjjn0b+rWe5O4ygV6YuD
 ehPpXX0Yu2tvrKyZvo/Kq9XqiJqjy6351QrUeyDoTJocjbNWthNvQvv5J9TYFxakSHCUjSRYyva
 anXkJFy82yOLZzsUzqWn8s7jVrthQlo+5fObiTpGN/e0KilSnY+zU78tDO0iUMiOERWOW5535aR
 xm4EvVK4aqNjNUiPuy3CCmZnMVi+MwfDvtIwGLYyJwYc1TOby7KONefk5AGow6t0XxrJtSG4Rv7
 yH7/0Mm8MKqzdqpXhi4BaO+8ztltRnZIurBnSaDAWg=
X-Received: by 2002:a05:6402:3888:b0:6a5:f4dd:9ee3 with SMTP id
 4fb4d7f45d1cf-6a66a75b745mr3611962a12.8.1788263394604; 
 Tue, 01 Sep 2026 04:49:54 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a66ccdf77bsm694228a12.12.2026.09.01.04.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 04:49:54 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  1 Sep 2026 13:49:51 +0200
Message-Id: <20260901114951.2675876-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/libmicrohttpd: ignore CVE-2025-59777
 and CVE-2025-62689
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Bernd Kuhls <bernd@kuhls.net>, Will Newton <will.newton@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Both CVEs affect the experimental WebSocket helper library
(src/microhttpd_ws, installed as libmicrohttpd_ws.so), as stated in the
originating JPCERT/CC advisory JVN76719218:

  "The vulnerability exists in libmicrohttpd_ws.so, which is generated
   when building with the --enable-experimental option."

That directory is guarded by AM_CONDITIONAL([HAVE_EXPERIMENTAL]) in
src/Makefile.am, and --enable-experimental defaults to "no". Buildroot
never passes it, so no Buildroot version has ever built the vulnerable
code. Upstream removed the module outright in commit
ff13abc1c1d7d2b30d69d5c0bd4a237e1801c50b ("remove broken experimental
code", 13651 deletions), first released in 1.0.3.

An ignore is needed rather than a version bump, because the NVD entries
for both CVEs share a single CPE match criteria that encodes the affected
range as

  cpe:2.3:a:gnu:libmicrohttpd:*:*:*:*:*:*:*:*, versionEndExcluding 2025-09-16

i.e. the author date of the fix commit instead of a version number. Since
support/scripts/cve.py compares versions using LooseVersion, every 1.0.x
version evaluates as smaller than "2025-09-16" and is reported as
affected, no matter how far the package gets bumped.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
  - describe why Buildroot was never affected by these CVEs

 package/libmicrohttpd/libmicrohttpd.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 8756adb4c6..43e9766106 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -10,6 +10,14 @@ LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_CPE_ID_VENDOR = gnu
 LIBMICROHTTPD_INSTALL_STAGING = YES
 LIBMICROHTTPD_DEPENDENCIES = host-pkgconf
+
+# Both affect the experimental WebSocket library (src/microhttpd_ws,
+# libmicrohttpd_ws.so), which is only built with --enable-experimental.
+# That option defaults to "no" and we never pass it, so no Buildroot
+# version has ever been affected. Upstream removed the code outright in
+# commit ff13abc1c1d7d2b30d69d5c0bd4a237e1801c50b, released in 1.0.3.
+LIBMICROHTTPD_IGNORE_CVES += CVE-2025-59777 CVE-2025-62689
+
 LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-examples
 LIBMICROHTTPD_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
