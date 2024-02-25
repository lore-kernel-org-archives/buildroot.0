Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5B5C54E49
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 22:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3304819C8;
	Sun, 25 Feb 2024 22:57:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DpKtWPiPIZ3W; Sun, 25 Feb 2024 22:57:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00C5F81959
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00C5F81959;
	Sun, 25 Feb 2024 22:57:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A92F61BF40F
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 22:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 961B981959
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 22:57:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vgePEBdLzWw3 for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 22:57:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DEC6181919
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEC6181919
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DEC6181919
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 22:57:32 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-412a5ef09d3so725635e9.0
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 14:57:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708901850; x=1709506650;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o3FNkktj8C0o0rxyf7XfZ+mPPeOQ34z0/L7Ejiu1nEo=;
 b=u9M/51ArzikJ79YeERkKvC5HHX9DUMuem6/D2bbab6J54UbvH7uiwYVRL61xQMsost
 YaSBM50+1OOKeokOynYqL/Z9BDZq7TS/SBAG/DfJLl5mvOgjS8d4QbjM9Ow27KWAtprY
 3r/zGGohyrw6ILKI3BrX4OJxhplw27+3FUwaiQyHXYTatgwZAE2bSpw1xGi9nKzD9Ywy
 9oUTnEuZrfyxLUbXxwhfo81Ca0uBhCKJNoKTC5J3KO0vk7/LuTpSCR6UYEUCc4rsiao3
 BS1q7qiScS85CNXbLj40iTrP7swypKfWAoM4AvAQoG2sX+ZqsvJ/LieG8hhM4Z/w0vdK
 eVHQ==
X-Gm-Message-State: AOJu0Yzldr9snDVk9rSf2DQXmHhFnSwHBQbeZTXlUoNfZo+FP1MjDOtR
 pwLKgDPx8fIcFhVaVYjvPD1MchQ18YBpwy/WygEXCV0cKADv+SflifJjGxYfwpgTmrGAti/utVx
 Y
X-Google-Smtp-Source: AGHT+IHphmLw/yVDZtSLIF8dhVZfMTk2UCB+86cjri5ZUlC5GUQzE9JUZWv7UEWBp6wpy4VOH1lj3g==
X-Received: by 2002:a05:600c:19d3:b0:412:a291:af80 with SMTP id
 u19-20020a05600c19d300b00412a291af80mr1652212wmq.8.1708901850436; 
 Sun, 25 Feb 2024 14:57:30 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 ay14-20020a05600c1e0e00b00412a589d446sm681774wmb.5.2024.02.25.14.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 14:57:30 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sun, 25 Feb 2024 23:57:28 +0100
Message-ID: <20240225225728.2949216-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708901850; x=1709506650;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o3FNkktj8C0o0rxyf7XfZ+mPPeOQ34z0/L7Ejiu1nEo=;
 b=BCxtM8BFxMhm4Bj+wF0Lo1EC+UdbbBncXDAPnRSHA+WhfjBB0dA19k+DWyRA7wz5GU
 ayL07yIIBx0XCJqu7Hl9aqTlSHDn0/8pMc/AVbAZnDZUqFNoOipCoPzQf4ietJo7M6hQ
 eMj1GPi61USDlC3gCPCT0OJPMLjrz+A4NterPNGddWIikD/GukUTZSD4tRdTZeVZ5yHD
 k2OgB/sULCdDFcV8l9DUGzuTJyBZVLfvRifsE4T06DiRBmArf1Hx/FgNHR6kFk69Ve64
 Le3LiFk3tKDjkoOIzANkBwrgbtK522XG/Cqdj9vJ4EvYcpRMASTzdjucHsMY9TQTKfQy
 s/cA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=BCxtM8BF
Subject: [Buildroot] [PATCH] package/dracut: fix dracut_wrapper
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Thierry Bultel <thierry.bultel@linatsea.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As reported by Thierry Bultel [1], dracut doesn't work since the
version bump to version 059.

Further investigation by Andreas Naumann [2] reported that the issue
come from this commit d010fa0 refactor(dracut-install): fork() instead
of popen(), sanitise line reading [3].

The issue come from our dracut_wrapper and how DRACUT_LDD is defined.
Indeed dracut expect DRACUT_LDD=ldd or a single binary (without
arguments) but we are using "prelink-rtld --root='${sysroot}'".

With the change introduced by [3], our DRACUT_LDD is used
directly by execlp() leading to an error:

  execlp(ldd, ldd, fullsrcpath, (char *)NULL);

Use mktemp to generate a temporary dracut-ldd script using
prelink-rtld --root='${sysroot}' ${1}

execute dracut.real in a subshell to cleanup the temporary file
at the end of the dracut wrapper script.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6224243423 [tests.fs.test_cpio.TestCpioDracutGlibcMergedUsr]
https://gitlab.com/buildroot.org/buildroot/-/jobs/6224243434 [tests.fs.test_cpio.TestCpioDracutMuslMergedUsr]
https://gitlab.com/buildroot.org/buildroot/-/jobs/6224243567 [tests.fs.test_cpio.TestCpioDracutUclibcMergedUsr]
https://gitlab.com/buildroot.org/buildroot/-/jobs/6224243559 [tests.fs.test_cpio.TestCpioDracutGlibc]
https://gitlab.com/buildroot.org/buildroot/-/jobs/6224243504 [tests.fs.test_cpio.TestCpioDracutUclibc]
https://gitlab.com/buildroot.org/buildroot/-/jobs/6224243498 [tests.fs.test_cpio.TestCpioDracutMusl]

[1] http://lists.busybox.net/pipermail/buildroot/2024-February/684145.html
[2] http://lists.busybox.net/pipermail/buildroot/2024-February/684503.html
[3] https://github.com/dracutdevs/dracut/commit/d010fa0d7f8ef42ad31729d027d2e4be6dd6e588

Fixes: 145f01ded5 ("package/dracut: bump to version 059")
Reported-by: Thierry Bultel <thierry.bultel@linatsea.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/dracut/dracut_wrapper | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/dracut/dracut_wrapper b/package/dracut/dracut_wrapper
index 0464db17fe..889322d1c6 100644
--- a/package/dracut/dracut_wrapper
+++ b/package/dracut/dracut_wrapper
@@ -31,8 +31,18 @@ if [ -z "${sysroot}" ]; then
 fi
 
 topdir="$(dirname "$(realpath "$(dirname "${0}")")")"
-export DRACUT_LDD="${topdir}/sbin/prelink-rtld --root='${sysroot}'"
+DRACUT_LDD="$(mktemp /tmp/dracut-ldd.XXXXXX)"
+cat >"${DRACUT_LDD}" <<EOL
+#!/bin/bash
+${topdir}/sbin/prelink-rtld --root='${sysroot}' \${1}
+EOL
+chmod +x ${DRACUT_LDD}
+export DRACUT_LDD
 export DRACUT_INSTALL="${topdir}/lib/dracut/dracut-install"
 export DRACUT_LDCONFIG=/bin/true
 export dracutbasedir="${topdir}/lib/dracut"
-exec "${topdir}/bin/dracut.real" "${@}"
+(exec "${topdir}/bin/dracut.real" "${@}")
+
+if [ -n "${DRACUT_LDD}" ]; then
+	rm -f "${DRACUT_LDD}"
+fi
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
