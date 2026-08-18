Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE401C5DF7D
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 20:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A13E540806;
	Tue, 18 Aug 2026 20:56:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ogpJFYSxAOj; Tue, 18 Aug 2026 20:56:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787086596;
	bh=0nZyxqiXmbnbBOdLJD/JXPB3wK0lepz2JaTFce/cPOw=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PIojstAw3py03ODdOUCdQFBFD8Yb2RDCK+QYKaEMFD5YziP6ThI+xsrEa5Rys4gMX
	 ZNJblUto0LSGY5vssuV4AQFlcQya+H2TQ5JT3F1Q0bKgSdeq4HZjtoK37ZSHG2kzjD
	 erQ5I7vvEQiENqtgmMkVfGRo9nvrzd64n8o5VRjfutWfBNfZTrXpVWegxk9P13owTd
	 6CblSZ6OuAByjzmRJbGGQiV0iR55wy3qOH/+9Wm7U6eIzPLvK5VYbnqTAQTJTE2VCj
	 wZs87GhsAIoR+VedlE2yp1A6OaVn9jQm1d2XuNSSIZnOzZ1sCJh4QyswVVyvb6V49a
	 CTG5gNaHEJJnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0ABA40613;
	Tue, 18 Aug 2026 20:56:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 57463333
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 20:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D8A260675
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 20:56:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W4hKKP7fRaO4 for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 20:56:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=joseph@anodize.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=anodize.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=anodize.com header.i=@anodize.com header.a=rsa-sha256
 header.s=google header.b=ihftm4hF
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E4A06065A
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 20:56:34 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2d0407aedd6so2873475ad.0
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 13:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anodize.com; s=google; t=1787086593; x=1787691393; darn=buildroot.org;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=X+NYhqjcB1QCoW6vMVvgriqiOxbYaIzzTVi7aIO0Dyc=;
 b=ihftm4hFHsa5fx2CqmdA+68zu6hVCFnwOnjFy/a9TlSt+9Y8Y2+8/nz8VUQEX0UbAS
 X1uJcD9Akm1grlNQVml5Z5CNHTtFiFnUNMn26kRLdyUlu22XaRcYi1EJjeON17rsEtTP
 ElbjoUcH0ViqXRA6AIHtoFMTZ+lZQM/XrK/lkBBfGMOnvUjLgtmiDC+oVuvpeDg5RYAA
 i3CDY/SOuEKvnz5ICh4ji2k6Zo24WhTCdJW42YhCKGmRSUrR/iUVmsoSS9hXjMJ8xgFh
 JqDF7DcpLxJdHh0jnlO9dEkzGl/BckDCOQh8tpwnxoalISHRiXsFabjNv3qG/wSTwrQM
 DJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787086593; x=1787691393;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=X+NYhqjcB1QCoW6vMVvgriqiOxbYaIzzTVi7aIO0Dyc=;
 b=bRJmPxNa3lfXAg4rqXDSFvq+dIod0Mo31SHFToURGobZNKmrOD8FX3e9c8XkRJcP7b
 iaLD65+fCxEXvVNjyv9jqizVzSTgsFRmi+zCP4sgqDTN4DJ3iNpxGa5Aupsv7dWyqzSI
 0QVHiv0ojMWOhdijYHY+pEhS305qYlEPHWZMcuBbcC22UYjPb8i3DMg5cZE4Ae4f7WH7
 cKYUoS5XKIJie4ARNau3YMW0MJ9e5jGUZHZueEtPLlQAn2mm2OaYL6e7PW1uiZYYv/Qf
 TOEakbGTeMTYcHNgoq6gMVOUxAVegETJmfS4yKanPRnSxPbZdmVNW6VmaOyvbsHepofl
 ns7A==
X-Gm-Message-State: AOJu0Yz45xRq3XZF5bqMTShsmsJ/GaUN11qDRXKWmVOOe65veQTvoqqZ
 7wxc0PGTui4K5jaE4JLstGY1YKMcKyb7Gj9F3589WNpArCoD/YAJQhgaWCCz8c/mG97vPWnLY4Z
 th2sYIzo=
X-Gm-Gg: AR+sD11UR4B4UdSWMT3Xj9vc6IJ3Qa+VAaVyGW/qmhSYCahMPGW8xQDVeK+prVuLX1l
 W49gxzrnGpB60+CxxhHpR150fflyWms2UK2Igh/pR3MxQRP5QDDNB9pYINI+kJpk0wH9SyhYiN6
 fOixt0EJ2oxooKhe4UkKAnFn6IDZjpkMQjUB7lk8XET1mmI0YpUK9xnkkxwOzwoGLqwLyVrSztn
 7jjC0lkrwc+8HNQXODKzu6zQOOvKxyMmQWCUqEK43y0wdoKElu+54LydnwFvf5St1s+3s14j87i
 nNkJ3Uytukw0ZL8TXyIYm1RfaOhD+c09L47et0kSr6A/RkKxjgGtJs9HRpxbfpem0G0AtM6sy2H
 q3LwAYbF7f+vTvLL2HQCS6BFIqWTvLz8pB0+tdpMX3uj/sKfGC67Ma11uQs9Svc062BRrQrQOky
 dhbqHrW7KIA6KnTyCs++VJorfVMIwN91LTcsIf7lpPLBWPkxqvXnmI6ATgf9M=
X-Received: by 2002:a17:902:f684:b0:2d5:cb05:49d9 with SMTP id
 d9443c01a7336-2d5f6cd92admr7549555ad.5.1787086589713; 
 Tue, 18 Aug 2026 13:56:29 -0700 (PDT)
Received: from wash-4.local ([50.47.124.161]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d5bb51e0e5sm21159135ad.32.2026.08.18.13.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2026 13:56:28 -0700 (PDT)
From: Joseph Kogut <joseph@anodize.com>
Date: Tue, 18 Aug 2026 13:55:32 -0700
Message-Id: <20260818-passt-20260728-v1-0-aa8bc1ce2c5a@anodize.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMBAE0F8pe3ahCZIGf0U8bNbVRjCW3ShC6
 b+b1OMbZmYFE81icBpWUPlky6/S4A4D8EzlLpivzeBHH8boIi5kVnHn5CP6o2MOaXIcBNpoUbn
 l7354vvxt7/QQrv2lNxKZYFIqPPfoSVZFYdt+Ec3TGIsAAAA=
X-Change-ID: 20260818-passt-20260728-241cc6b71c6e
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph@anodize.com>, joseph.kogut@gmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787086588; l=844;
 i=joseph@anodize.com; s=20251022; h=from:subject:message-id;
 bh=q9BrsKNcARL6Ln0CQFGlRbdl+mR4jllEkJmx7ap39jY=;
 b=Gzi6VaVcYbz/PxyMatcoT8Q9QJJzeo9OLfs/ASQUOG0gQGPDtGFK2uzgd00qwy8yu/jrmCZNQ
 Xh9RCcHOoCeAkjKeVPHrYhB7BtrscSW6iuPuNECbSYplPLsP06OX7HY
X-Developer-Key: i=joseph@anodize.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
Subject: [Buildroot] [PATCH 0/2] package/passt: dependency fixes and version
 bump
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

Hello all,

This series has a few small improvements for passt.

Patch 1/2 resolves some unexpressed dependencies that preexist this
version bump. Passt doesn't currently support uclibc, and it's tracked
as an upstream issue.

Patch 2/2 bumps passt to version 2026_07_28.

Best regards,
Joseph

Signed-off-by: Joseph Kogut <joseph@anodize.com>
---
Joseph Kogut (2):
      package/passt: disable on uclibc
      package/passt: bump to version 2026_07_28.f8df3f1

 package/passt/Config.in  | 6 ++++--
 package/passt/passt.hash | 2 +-
 package/passt/passt.mk   | 2 +-
 package/podman/Config.in | 6 ++++--
 4 files changed, 10 insertions(+), 6 deletions(-)
---
base-commit: 2d40ae9f2c6026fe201c894c79b2fc844e953465
change-id: 20260818-passt-20260728-241cc6b71c6e

Best regards,
--  
Joseph Kogut <joseph@anodize.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
