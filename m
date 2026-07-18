Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A95CC44528
	for <buildroot@archiver.kernel.org>; Sat, 18 Jul 2026 08:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3852607CB;
	Sat, 18 Jul 2026 08:58:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UAig6GBFQgAB; Sat, 18 Jul 2026 08:58:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0E6B606E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784365093;
	bh=hbqCnzY2fnL7Pc9agFqUNwBCuQQb1ontsvE619+j56Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NDV+ySEWvb8qcalgxiKPYhsZkzoV8HhMC6CyiwMaof0BVoxtLkTMTGLtl2vzRIdRK
	 JVkOlqcqg+hAERirA5NgpjgY1farRxp16qxSn4BldiC+FqR4H6nmJGB1+2CTwzx+vl
	 SmwuGdDfF0BhLS94p3hvvwr4NSmgWWiQUFb1XQbhCLLwZwYfYkqQltnEedCSRIc7RX
	 3i7/i1hVOYJltxksi1ixXCAYp26muN7h6iiBtitS3HY1MFDuFdBvdVsB/PhTnJdBZC
	 2mmgZzKsblmYf8ut+zDl35JlgJ1Qsob9WoLtWh0MyoKYqLfYsiCMBVWBPUk2kgyKpb
	 zfEQ+Zv62l4tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0E6B606E9;
	Sat, 18 Jul 2026 08:58:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EABA71F6
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 08:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB60F40058
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 08:58:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SatprUw9499R for <buildroot@buildroot.org>;
 Sat, 18 Jul 2026 08:58:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0D0CD40054
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D0CD40054
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D0CD40054
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 08:58:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b33e.dip0.t-ipconnect.de [84.161.179.62])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 50470A4C20D6
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 10:58:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wl0s3-0000000066M-1HwC
 for buildroot@buildroot.org; Sat, 18 Jul 2026 08:58:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 18 Jul 2026 10:58:06 +0200
Message-ID: <20260718085806.1047751-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784365087;
 bh=QBrwnNWeuRGie8oIGFPz3+FtjibYb1+VAlG6vdwTRWA=;
 h=From:To:Subject:Date:From;
 b=XUETXQ5lxQ9l+FimOLNkyLeQKltfV225OSEV73oL5FFiYQ06/Em9zupV19vTlQhO/
 rWsuaT2HtUTZtPtKQUaYDO50wjbyCUQMC/VH9cvdETcLp9wQotIsrvuj+td/8DShS8
 p/F/QtppZ7Rz+X2TxRbjMzp4Hfw1Lb6mggYqcyMVQWbMrOmtPN3ILqTcH9qdWVkFMM
 7iK0o3cWbS0+NgEW/Ooc+V4K7Pr2MX/d+Iag74B+bBDC0G77nhaI5Fo+dOMv1j8HAH
 ZZ7BkVD05Ef6DXbBN8rfmNtUKrOeLroplr2Bj21SofG8l6lhD7kQJ2esDl+kZW5owh
 KxlG6zhvUkwRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=XUETXQ5l
Subject: [Buildroot] [PATCH 1/1] package/openssh: fix build for powerpc64le
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

Fixes:
https://autobuild.buildroot.net/results/40a/40a26d9831667233944e6aabf2388f02a8cf30ac/
https://gitlab.com/buildroot.org/buildroot/-/work_items/79

packet.c: In function 'ssh_packet_log_type':
packet.c:1219:1: sorry, unimplemented: argument 'used' is not supported
 for '-fzero-call-used-regs' on this target

Upstream bug report: https://bugzilla.mindrot.org/show_bug.cgi?id=3673

Upstream commit
https://github.com/openssh/openssh-portable/commit/29cf521486bf97ab9de5b9b356f812107e0671bc
which was first released with version 10.1 and was added to buildroot
with commit b52b3fd59dc6c86ef51b6cad5b76017f90c83beb introduced cache
variables to disable zero-call-used-regs when needed.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/3f6778e8438e1e6c172fdc60f1185aab8afb7443

 package/openssh/openssh.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 2f3088defe..5575ba4f97 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -36,6 +36,10 @@ define OPENSSH_PERMISSIONS
 	/var/empty d 755 root root - - - - -
 endef
 
+ifeq ($(BR2_powerpc64le),y)
+OPENSSH_CONF_ENV += ossh_cv_cflag__fzero_call_used_regs_used=no
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_110934),y)
 OPENSSH_CONF_OPTS += --without-hardening
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
