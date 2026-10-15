Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD12CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDCCE61364;
	Fri, 16 Oct 2026 13:13:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id kORi7coJXj1Y; Fri, 16 Oct 2026 13:13:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E490261383
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156410;
	b=lB54nKEn6bhAw1+avZKtU9Wzd82d+oZNx7DPOEiChu7F0rY0+9V9vSLRhOCZ6UmXi8/r
	 BQ1gbTNTsFfrmUfnxh4AxeFM1Wmb3peJhWoiKzM31gZe2GGTZRnzuusPu3fJpsfJHFHn4
	 ZXo5L04BqT+1rh00h4KPsz/S+wO/ALDrEWc8mRYdsqqBdaRW4H8tu6nGBVDwChWhU6GuQ
	 qSU4XZ7T0wR6J2KfUIqAk58Hf6ekhmQK0RGyjnaZFG3QADB0FyFnh7IMHR8vpPkAOikjn
	 xkjxLFqtRG1nqelYO1Whm14DCTc0wLPPPmab+ugz1KFaQqONlyTAzu6ECW6NmJ+tRqQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156410;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=XVWxWlEjhzc+wjEVjyHe+riIR4j1pij9HZYYHJdu6YI=;
	b=Duglt/HFbxzOYj4f+pBO15x1LeaYSH/Me59hAQGIDwcUy4ap9w+XtP26W9jphEih8+eQ
	 2LltwnEm/DlKjaQ0cFamFOcYwIYcDcuA+bSAF7LF3NKAg94UP32pDobJjN2dR0WNzQ+pz
	 DazpgFdTyPi1lvVIpywQ6Za2Yjb3ysPVZ0V8QPGqxSnlsaRD/Ozf5i+b9fdGMG3iIrvzb
	 jyFkN+fbG3XwCIzhiRrrlJ4DNMfhv62AOMpCYYLyPlPo/8tLjQwunthAYuFRv6JD5SREl
	 ZZAe5BgnDfe1smRHizVX4qLLILf7d0qVJanG/E/Jl4qX3Z9iMW6Pr5zzXfhEoCpAIkA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156410;
	bh=XVWxWlEjhzc+wjEVjyHe+riIR4j1pij9HZYYHJdu6YI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Sqo2/bfshdCg5Rqj4sABtDjBte2NNOYlhAK9Mmo0NOn+dD0H1XC/IyvqIh0WfzteO
	 j+/fx1mpSPfFJgXqL6GGlqZXZw62CtB2gc7vuuMChgPDKvxmLWo1h/qRvy13RcZIZP
	 hT1fdkr5Bgr+KMKSo/jkHIsy7cmeSsjq3g+4BGFuCm6nJOMHLtDAZPBFEObLqlicI0
	 PYgdXQqCsy+ol/EbGsl3+l9rlqI4hMkmyZ+bkVIBpf+o0622Gz85yBEjcNfUidjOMk
	 uFgLQJ5y1DyMdalIF3d+TkhaC7XJkiuLBhwK3jEk0V7woooC3f40T8YLeEaeg1YZ7x
	 hxThkKdjMvNjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E490261383;
	Fri, 16 Oct 2026 13:13:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 36168105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB01760B3C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DxmcLWHnRqQr for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2394060F3D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156193;
 b=I0LvyyvGv6c387A6rXsxDukkSB3tb1hu3+Cz/DWXJo3DvQuPX2lha0VTv0IhzRe2E95/
 r3oGoI6ZelbYzbGYGpqeVBSItMTxhY/3Ap1ch+30gsEgIytWS2LtMiZvphBhoZ2Fvvmcp
 bDjv4EqhxNgRsFp+rGAn0gR16eoI9uaExlHXofm3RQYiGukdANqVoMizAX2pBCmd6oyLv
 F+DKwPcTUwd9A50zlPfhYC0ED9kpRBW8EIQ4dP5RmjJrSexxE8AJm803Qmj7ynikMlm9k
 uM50S26wMjLQMx6MYajwy/kfBRqwQbkI3FTuXj0iLqd/BRhQB3vdlJmUnE+oSnufnRw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156193;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=0+y7Q3JXQrn4c16de/bG4KFPZa4sbJNIkUclAYEShRs=;
 b=mUgUMeWlsM+PwVuVp1DhSZM0K3tIojdQ86nJSfndwilIdSm2oI5mzrOzZ7+hTkeSIgKe
 1SZr5cjQDsAwu+kS3msmGY3Tkd+rJM17o815cWcEpC2dNTlzKpFWWozgW5n4zb/HhFiNd
 HS9GcRb1LaECir26CjvoAJR3VnctqZ/NGjCrqCbL+lsnubgofj4EvNR/8eXECn8ds4tAn
 ZHpoAAbV8agVwS9sbNQGWk+8o1n3unu23KD/2EoS4LTbqOcm6aziwUA0ExWtQPmD7v3HU
 u9g1asRYmaTraU0nV8zthz5hVw5nlkRZrPlB7pSQRNKHmuSom4oV4puDJj7zJwsFuoQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2394060F3D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1333C960DA; Fri, 16 Oct 2026 13:08:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:14:41 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: b18021117a819a445c34ce55a82816f7e607e526
X-Git-Newrev: dce16261bdc05431e3d9be75c97eb6e37cb16ae6
X-Patchwork-Hint: ignore
Message-Id: <20261016130832.1333C960DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] boot/edk2/Config.in:
 remove empty line to fix check-package error
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2083295733199701728=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2083295733199701728==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dce16261bdc05431e3d9be75c97eb6e37cb16ae6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Buildroot commit [1] introduced the check-package error:

   boot/edk2/Config.in:19: line contains trailing whitespace

This commit fixes the issue by removing those extra spaces.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/ea0f27d64f84894f53170bec827aeff4370104fe

Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9054c08eb6e9c1a5f3247b91e9cbd73153a1c490)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 boot/edk2/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
index 7d170fde3b..92dbb34a06 100644
--- a/boot/edk2/Config.in
+++ b/boot/edk2/Config.in
@@ -16,7 +16,7 @@ config BR2_TARGET_EDK2
 	  development environment for the UEFI and PI specifications.
 	  Select this to build EDK II (and OVMF) to be able to boot
 	  Buildroot in QEMU (UEFI mode).
-	  
+
 	  https://github.com/tianocore/tianocore.github.io/wiki/EDK-II
 
 if BR2_TARGET_EDK2

--===============2083295733199701728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2083295733199701728==--
