Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B86EC7115C
	for <buildroot@archiver.kernel.org>; Sun, 22 Jun 2025 10:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58E6641C8C;
	Sun, 22 Jun 2025 10:29:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gi9RXinSxEaM; Sun, 22 Jun 2025 10:29:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95F0E41C9B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95F0E41C9B;
	Sun, 22 Jun 2025 10:29:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BC9612C
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 394CA40406
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pri3-5iTgKy2 for <buildroot@buildroot.org>;
 Sun, 22 Jun 2025 10:29:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6122D4026E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6122D4026E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6122D4026E
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:29:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bd3.dip0.t-ipconnect.de [91.58.11.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4C3E3A4C2A6E
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 12:29:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52188)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uTHww-0000000013Z-1xDU
 for buildroot@buildroot.org; Sun, 22 Jun 2025 10:29:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 22 Jun 2025 12:29:22 +0200
Message-Id: <20250622102922.3847947-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250622102922.3847947-1-bernd@kuhls.net>
References: <20250622102922.3847947-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750588163;
 bh=eMhht8as3Yp9OzypHWYFYlmISUWrV3Ejnrl5cosaIOA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=nHOWhGuBXQLSiht/0D3iHdkisUzt881mVgybJ/Q5tOlYdDLCBWsSoa6wq7RtjJaVF
 hWeA2NVYncrudDiP0gALBmnFJvofKg2fco35xQZhIGek6CkKZKT9Md8NtLhWvU49Qc
 cse7PYlChTS7dA4y9R7gTsU43DIsMvMItHaynjuA0ukxCDAjChqgDO/++utARFVyCd
 ile7QkJjDtObNaP2CKsJ8DJq0OaWIRjL34yHXABN3EJ11XGr20qFkUqJ/SSuIKQzkU
 4f8mgJR5GMLUI/0Xus1TkYPfsamhyHJVFY1z9t0zLoAL6wD5GtE6Q+SsKCkQ9uytCC
 x6YMpuUciB7Hw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=nHOWhGuB
Subject: [Buildroot] [PATCH v2 3/3] package/ntp: add Upstream tag to patch
 0001
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: fixed typo in subject

 .checkpackageignore                          | 1 -
 package/ntp/0001-ntp-syscalls-fallback.patch | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 237ce45b24..55d84f9d44 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -866,7 +866,6 @@ package/norm/0001-protolib-drop-linux-version-check.patch lib_patch.Upstream
 package/norm/0002-Use-print-as-function-call-for-Python3-compatibility.patch lib_patch.Upstream
 package/norm/0003-Fix-mixed-tabs-spaces-in-protolib-wscript.patch lib_patch.Upstream
 package/nss-pam-ldapd/S45nslcd Shellcheck lib_sysv.EmptyLastLine lib_sysv.Indent lib_sysv.Variables
-package/ntp/0001-ntp-syscalls-fallback.patch lib_patch.Upstream
 package/ntp/S49ntp.in lib_sysv.Variables
 package/ntpsec/0001-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch lib_patch.Upstream
 package/nuttcp/0001-susv3-legacy.patch lib_patch.Upstream
diff --git a/package/ntp/0001-ntp-syscalls-fallback.patch b/package/ntp/0001-ntp-syscalls-fallback.patch
index 46704b9d3f..445efd95e5 100644
--- a/package/ntp/0001-ntp-syscalls-fallback.patch
+++ b/package/ntp/0001-ntp-syscalls-fallback.patch
@@ -1,7 +1,6 @@
 inline ntp syscalls fallback
 
-Reference:
- https://bugs.ntp.org/show_bug.cgi?id=769
+Upstream: https://bugs.ntp.org/show_bug.cgi?id=769
 
 Signed-off-by: James Knight <james.knight@rockwellcollins.com>
 ---
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
