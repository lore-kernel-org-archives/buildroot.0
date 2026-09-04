Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313DEC79F80
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B0D040AFA;
	Fri,  4 Sep 2026 16:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iSCJ74sYaN0R; Fri,  4 Sep 2026 16:25:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F0BDA40822
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788539130;
	b=Esi03OOlYshlDrq/8iCiRSU2WcmucMhyerOSHgPKO7A6pQrgxzO/3CxN36EjJk4u52+r
	 gTlKyUCGbDsXYUeQ41qnLmFWoguEYXtx7DBv4xvRpizbJ0bNweyKMg+6U/A2+jQFHQzi8
	 Wcgf0z4OHcgiB8s5Y5SZ2CtUjFCmaD6WEYh6lvNBF6lgrG2ppYP16TmZ+HNJatWngAQ4q
	 43Czmmjj+gqygWy6jsq4ZZZ18ZpJouDmHWIESLDYiFXKMgd5+jeQqy57Ff2Nb6RNfchG8
	 NHki2XPhJjLdiMNMkNDYSmYXx8iH+pbFnjJWFOpFwMKyYirUWUWYcheAD6DOjJ8ijlA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788539130;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=OCX5jA47TJegb8IgVdky/h4ERc2AKlgafTPx80UMtqw=;
	b=jucwwVQTti1VQs7ZtYyeEmzbTZYBB4e7xf9/lXrg6CzRH0znLOshAIS/l99L8AsDhR6P
	 FXok7eqsOygEbM46DjI+gprVpsI+tvL+wrZNwHPV8llZYbWEHftagfZH6TIR+OeK1kjDB
	 FXeGooIp/szJsbMeFIbI88bRakMbKZbTgIOiMu6NeVfNHQ1D9bTnNWC31FmUw9LgIODaj
	 q4uWrXhUuTgKVJ9VaM+uE/qBKhqaf+LuvDLKXdD+TPRnEbN9gnl9tKF3XMFMwcJ5hdgqv
	 FLihCJ7xoxytxQV5HynU97Wa6d0F+ZYeSWGfgKSMnU2AG0CLGuhUoj7M2DVuZcWxUTQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788539130;
	bh=OCX5jA47TJegb8IgVdky/h4ERc2AKlgafTPx80UMtqw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MiukykknL8FSWlusEwf+JFpUYBFLQO4SdXoLJsx00+rN/YkEKwFsRjK5wsqdFNEWf
	 fFuUaiZY5JzEKFdGBu+5a8S9rUS407pYWK5QBkYNexXY1GaP8QYzBgfJn+S9fYZfCQ
	 td8CzyaCHgim0u0pFhX4kkYBzvb6UcMxvVOnnqZ4UN5vp2lljFfddfJGkLAKxsLhrR
	 m+hTa919zDejxmtBqb4gkVP8opclWDT3odSSMfUaCqMUY4FuKuxhlBbndmazfs6J+c
	 1IPnNbm6USfvZeyxTe3/E5Ns+fSuS+5wCWhRrypFnfdKk8LMVkIgLXkEzQM8uBgcK8
	 C2NduuMwjyE3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0BDA40822;
	Fri,  4 Sep 2026 16:25:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4066E3DA
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2602B80DFD
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:25:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gtKFUwgkUoo8 for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:25:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1BEAE80CCE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788539127;
 b=cw1neVt3dov7+VTYdy0x3CFr5h/nlytmYuBB0/lJfJJymVzde+F3zFx5tk1OvEm/EYVM
 aUKp/9n0bdM6crIs8puLh051RZJ3XG57LA/QmA1xtD92txwkUgKNCp+VQ6YyFdPIuuaFK
 d6K8BoCG6rehtxVYy+yWq1v2aVYPfTjM2LfpwsJs8MRurGeuCVr+LW51E1b5hOwGcHovM
 EMwm933WLqdD2NnuRmzZ/5CepqqLgL78icrhOqSyaSxETOPCPzCX4rejxxo15E1ODIedW
 NMep15BTSTjzlLYKpTK2I+XE5pLCoXiyeyRRROqpo74br0KIA+AtV7jhkxPbB8/qeig==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788539127;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=cwSeuot+Ay6+Ejfh8mY5wRqOFplLGP9eJ3RGfMApPYs=;
 b=E+PZ3e7YcozKVmMuKfwGOmi4EKnVYfKuWqWjlOQy2FxxmaYHrGidcykXFlukPH66Vru5
 3Rb0QCxyZUXF6QZNuu27YFufv9GxT7XR9VQejmhvUjasw5PTzkhLa4wghhuG2CAoG60O7
 QFzD0M9ibPio9OjwsrTckV2dcqYsF3mmWgTw6PP4PDuCSQBKtszjA5iSPQWzcyjHkVnnb
 yFDQXYTxiyIcCrgV1wfAH026nzxILamQbYz4v17838UVZO9Zr8SmkMB4Z7shYyqnxWUPP
 PVhsq9nkCCPWotwnV5yJ9uryzz0wuhj83C3g3lkzxczVKhbm5D+zCK9kzb/a4Y9ogaQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="s/xITJEX"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=s/xITJEX
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BEAE80CCE
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788539124;
 bh=cwSeuot+Ay6+Ejfh8mY5wRqOFplLGP9eJ3RGfMApPYs=;
 h=From:To:Cc:Subject:Date:From;
 b=s/xITJEXBqFRZ8JBQAa/JrQ4ikXPJO31v2lN1Pyvzc+qpPMonlyUIy4fSTPwYf1vk
 +Km16Mkd71o8zHs7Dko+zvfyNqQVHZ8xXNvmUgU6BrvPfF26mOaZUOuBoMIJMAvdWu
 sUaxGA08dD/whepV3U+eY5uo45mfW+OzDaEUApEVBb58z59z6wAPaQhL066PocDu0/
 l7I/nftkNv2/h+zY2/EBtVdRL+e7uWeLnclJpFsG77kUBxpCdE9X5LTzSJLqfVh6iM
 9MGdHSChXRpPUkYrd6i+2WbEjiQYFlap9bkGybNG6yl5hk3C4ZPKSRUidt8dEEbJCo
 DyuxhwNYRMKXw==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AE2F6A4C2EC8;
 Fri,  4 Sep 2026 18:25:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43240)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2WjE-000000004zZ-1qQ7;
 Fri, 04 Sep 2026 16:25:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  4 Sep 2026 18:25:24 +0200
Message-ID: <20260904162524.118377-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/cmake: bump version to 4.4.3
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

https://cmake.org/cmake/help/latest/release/4.4.html#id2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 8a2942493d..5f151221a4 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v4.4/cmake-4.4.0-SHA-256.txt
-sha256  65757f442fdd242e27f1728fc26dc0cba4164f7a0791a5c788631c00080369bc  cmake-4.4.0.tar.gz
+# From https://cmake.org/files/v4.4/cmake-4.4.3-SHA-256.txt
+sha256  c46400618b4f1f2b43507f24fb22f3ae830c3416cf23b776e16e1d413aa892f0  cmake-4.4.3.tar.gz
 
 # Locally calculated
 sha256  4382e7c1879ac90e3f101a395d23846fa4dbcaa1eed7265b43681e348754825d  LICENSE.rst
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 007a1efa0b..098f6e9158 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 4.4
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).0
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = LICENSE.rst
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
