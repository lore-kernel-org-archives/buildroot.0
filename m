Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BA0CA5FEC
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 21:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1099406C4;
	Sun,  4 Oct 2026 21:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UGTIquMTI5kT; Sun,  4 Oct 2026 21:20:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 14CE440687
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791148855;
	b=VcYkks3Mu3Q7e6u57xYnly7Z4m0V12v0eMMpMJmXEa53uCbWzH5g5NgwsnlQsA8jaTm3
	 k4m3wZigRbgYzKuJPM6zDMYw4V2Cp3CMwFKoXOxAovD2C6xWdsmm8PRStx/BFMVW51K1c
	 Po08NebIG/XgMtLQEPUDQfNsP7/Y7vBun5osILo+QOpuAaIKTXM2Vv1vVUo4Zm71RTHGY
	 DwD79OvR38oOwG9tV7QMuuQc6syFEMoJ9njYPYyutumfi4Gr3d/kV4Woao0qoj9sZet8a
	 232dhrX+rvJq9HoL00Ndb0m+37ow6SKEyfKWaRL169mNFGEYYVl/TpOmb9xtROvFfNA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791148855;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=G23adzO61j3qm5QchnqaVNqmuAB1AvHuK7rVxnWB5h4=;
	b=qRZEUCh3Q/4yAGJ+zfk2mQP6Vik6ryc8zBUxt2Ei7mmIqeUU2DvkvoVsKLypdZsoT0TL
	 ZJzKCtfpIyTE9kWPgi/MDZ6kAEir4YQVZ6rXrn8GfH4i/QGChdQzNanGcT6NcJE6gxAH5
	 Jg5KBrzrNM1gHlaGbYZnHsQSQu4/bLCrqbTJydefXlOcFo6IoUTIs0mcq4DNx0kkmEg27
	 huGkgPdpDUC5cBd1mE2FLV6uhoonkyaIQ01r94VfEZdbhMQHPZxqoYRzBjxu6HJT78KKi
	 hY7PqH/PH0mfS6jYZ/hrs/qFdckfzrvuihN2vpw1y2inQVNdbbcFPmvAdOytC4iAHAA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791148855;
	bh=G23adzO61j3qm5QchnqaVNqmuAB1AvHuK7rVxnWB5h4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pbwjVRfo377bn3srUc0LNk0vd/Gj72q/I+xtw4lcPcZ4ZG6qk9MTbQPpWzXcn5tQn
	 tkaX/2kli2jFt043iAaqyPCK9fxFXeUNDyA3fpQdPE3Gs0foTwkQ22u8jNvtgJbWF3
	 lXhpI2J1DLOVI4btTWBP8WuzZ51EEzAS1Br76dMrDaIWo0dQq53LHRD1AyLTis0LNs
	 zMBjq+MzVDGUEpG7SE0kIb6amSX4fh+5gyINIlSRT6Hxrz0SVqMglOAJxSIkH4Fa4i
	 EmKzFvP1tFjLa4qM/PbVdh0vUv+gDNbwl2L3SM3q9mfcB5+qdcvGZK5JcZ8BfBH/v5
	 Il041UEjmHcyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14CE440687;
	Sun,  4 Oct 2026 21:20:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D3A932F
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 21:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F1CC40049
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 21:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EUC04ejNGbor for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 21:20:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 5E53140004
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791148852;
 b=LutzWaI1xdXU1v+BftsN4MzuCtT3vDvRnSgkzDGkpkII0My1NFHSpQuGTMs58p1KnXPo
 cVJK/yCp6I4FntrC+AsjKldZ/ag9okSEnxDmmtmp8y5NKm5zHFt1i5v4tBD6b6zjZQ0UC
 Jf/ZIJHNRERyv+hxAztlCRafJHN2nMffuzrLo/U1EgTKM4r+rEcWdwdGB0tCiWogu9gL8
 2R6xtmEDZeI11Kg62O2ZRVN9F6NZZJypF9EBgPFOqJSXfOjaHopR0QDVGn+gwELM6pL0v
 NtodVwJnXIFK7nfU5Btpbs9GGMHciY5oXJo9GsxZrv0SLfQk7l7uha2pGzLzhV9YG0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791148852;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=OMRJrklEHHJhM6GpTZ5/IeYecmFz9o8nynLFBv+BhJ4=;
 b=nWEZAQIYE+JFUsEpiYrldxtPRYtRZpGgifLX2Yg+C+KsUu6OPeuaEANgqraQqxDdg1/I
 QMoelkdnkBksWrJhttDddMOX6GxWcHuj5qmZ+OhF6aohWM6OMdjMhb9Xa0HZiQd8h9xAF
 LI8qSilHWbjpipnDrrBDp0BJc8b9FJ+Rkluu1QUR1A3H8x9J77Mh312tn+sb8HeL4MNFi
 3AXI3IBAbjIP8GAESU2HgrlxEu/6n/Kz9rGw8kfSMgQKz5n3h6d4jiEwPhWZiFYYr4C68
 vVQvx2uTkBZ6l7cUfQZXSOrN2uzWgvMMFlvdCDX/+HJz+eAsrzHZ0VaBUE6Ox+KbLNA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=j7kYodau; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::c;
 helo=mail-oo2-x0c.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=j7kYodau
Received: from mail-oo2-x0c.google.com (mail-oo2-x0c.google.com
 [IPv6:2607:f8b0:4864:31::c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E53140004
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 21:20:51 +0000 (UTC)
Received: by mail-oo2-x0c.google.com with SMTP id
 46e09a7af769-822ab75c8f7so967101a34.0
 for <buildroot@buildroot.org>; Sun, 04 Oct 2026 14:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791148850; x=1791753650; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OMRJrklEHHJhM6GpTZ5/IeYecmFz9o8nynLFBv+BhJ4=;
 b=j7kYodau5u68whNOGD4fIewlt5jLihRvbdSVD7CyKFn0f3hz4FYIbC9saaYD03lsFf
 VvbPhWI2HilcoAQF+YrooveMUxnhrjlaqvheF/dpBnf1Snwp0nhApuV7DATl7Q2aR9po
 HRnyi5Rz9arTGCSWyZFoK3287EVlPbprPf7kperBmGSdN+b8TgeLqoB8WAQsBVDM2Xc1
 HGISBefZd9qXxIqwe9nqguBz+H3hlN91vV7NbPgomCqAt9pdMuH7SBxH5n6YxrlaMqm9
 5PBJC8x9PcrLkB3kXh4E3fBm7FXHI/YD6LCI3xhBCLz1WX041Q6ya7y3cGFwG8WKlbVa
 wX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791148850; x=1791753650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=OMRJrklEHHJhM6GpTZ5/IeYecmFz9o8nynLFBv+BhJ4=;
 b=qA4B3bOr101JAt8nrlpqTbtjaw3YBplJkee+Y0En8bIGkY5XFWZxnIVKeeHu7GURq7
 VWCXHWqyyHEqf/I3bbsemFLxd897gh1/B1K6INOKaFMviSZ3dudV6io7Zzn/q6hAAxFw
 t8KVKe3lxFh+U4Yt0dOrWsvSjz1JdAUoNn1nhMYFlMzH9Io6hwAuUJjaI9U7g4XnM7s2
 Fa8IsPeKQn6DsszPBZ5inUaCTQP8W1rA7jmDmOUVDbsSRumzudGQ/c0dZUlxW1Aps6e+
 /Aq0oWXf/0QRguQ774byWzomhzF7hf/dXjI9Rb3Nrr2BmpPE6l+lsbBr0yysMWWU24p6
 Sckg==
X-Gm-Message-State: AFuF++na/KfBwEiDEe172hGQht1vZV+k18u2aLkoF6ZKh+DxxkHh+HEv
 t3lW9tGtK4ZuSUJ6g+uMoR4bf8cYf9ibvt3jNbZdXyuCEwPr0pmO/SB5EY+DQQ==
X-Gm-Gg: AYBFou3Z1bF/x96OJHUE7HMCqnFPSV5yQfSf2o+vAl5EC9ZegKVvzAQ5ovqkVOzyDD9
 OKsmxPZTZlfnIzdrGhhtbvF0qKmWwAzLoxP7Yk5CH0shuqdaS/TbvWf+56tKExlk003orOzJR+u
 Szqk8SkaBFV0uCiCSD/3vumXCSCjwLtYJZzfPXtOivjBPz4B4YuL6ek41Pb9aD7CJAjooAYFMgQ
 Js89fPStuOzWL+jAFxcSvNvwxUuw6UygTbSqUzZhtfB2c6KcmhoXQaIfUdLh/jrbTp0ldTkCsmJ
 OBKF7GFQIQ2fUcfGMUHb6RL4bu0LrO1dWaEZTRTYFq1hhsIzT4DkQqMCH7epw5WDzqWIPQ18N2S
 V5gCFcijMg/dvh+/wADrUB9HknIEbDddaY2W/+aoIojGuEB87Nhm/aYUlKtEnMrjFk0rIMEML2i
 iHR/RYSvzvanVIS1JyfdxlPRGy8MaqnjhfAo1TmJikRB2Cr4/OHP4eI3ogcuIZq5Chw0xrTEeIH
 oy+qsgFME3KbOPtK4Ce0eDVl927KQQGBl2C+BcBbq8RQF/SkBAX6wnbhJnCjdQ5/aV84kYHZI8P
 gvyIwUiBLUBtfjG7nPbqyoixZjT4tUFh0IY8rduf5uvWM8uHH4T3EJ3hp+6tQhlJJu0oarBrB7W
 trbX/smVgWzgiUCBQJZeOHMTd1KuAEeqAfReBnmREGLY=
X-Received: by 2002:a05:6820:4b13:b0:6b7:46fa:16a2 with SMTP id
 006d021491bc7-6df350651c9mr7960895eaf.55.1791148850589; 
 Sun, 04 Oct 2026 14:20:50 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227aa72075sm10602691a34.27.2026.10.04.14.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 14:20:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Oct 2026 15:20:45 -0600
Message-ID: <20261004212047.1047271-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004212047.1047271-1-james.hilliard1@gmail.com>
References: <20261004212047.1047271-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/python-bidict: bump to version
 0.24.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to the uv-build build backend.

Skip dependency checks to ignore the upper version bound on uv-build.

Update license hash due to copyright year update:
https://github.com/jab/bidict/commit/02408d0024696156568c9ede7f587e97090ac752

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bidict/python-bidict.hash | 8 ++++----
 package/python-bidict/python-bidict.mk   | 8 +++++---
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/python-bidict/python-bidict.hash b/package/python-bidict/python-bidict.hash
index 5fe425c3aa..48f4919cda 100644
--- a/package/python-bidict/python-bidict.hash
+++ b/package/python-bidict/python-bidict.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/bidict/json
-md5  561cd7fd5c3036bbfa2c5185531e7b19  bidict-0.23.1.tar.gz
-sha256  03069d763bc387bbd20e7d49914e75fc4132a41937fa3405417e1a5a2d006d71  bidict-0.23.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/bidict/0.24.1/json
+md5  e7cf785588cc0e90422def264ee195a6  bidict-0.24.1.tar.gz
+sha256  4dca6c17f0b01700e9f24359daa5ebabf7be022d99f4cb2a257b6af2a5076c88  bidict-0.24.1.tar.gz
 # Locally computed sha256 checksums
-sha256  f3f53adcecaa48d73a66e238fa5ba906cb41876783b45d28a1346b3142eebd9a  LICENSE
+sha256  099b9dcb04485b32cf93aba82b303e099bcf98ab2476fae716d22c930fd6b915  LICENSE
diff --git a/package/python-bidict/python-bidict.mk b/package/python-bidict/python-bidict.mk
index 9181195d23..aa5441564a 100644
--- a/package/python-bidict/python-bidict.mk
+++ b/package/python-bidict/python-bidict.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-PYTHON_BIDICT_VERSION = 0.23.1
+PYTHON_BIDICT_VERSION = 0.24.1
 PYTHON_BIDICT_SOURCE = bidict-$(PYTHON_BIDICT_VERSION).tar.gz
-PYTHON_BIDICT_SITE = https://files.pythonhosted.org/packages/9a/6e/026678aa5a830e07cd9498a05d3e7e650a4f56a42f267a53d22bcda1bdc9
-PYTHON_BIDICT_SETUP_TYPE = setuptools
+PYTHON_BIDICT_SITE = https://files.pythonhosted.org/packages/a8/f2/8d2dd8276ca05e1f5157b6a0d34efb2f585f47a0fbed61e8aad04b221f0b
+PYTHON_BIDICT_SETUP_TYPE = pep517
 PYTHON_BIDICT_LICENSE = MPL-2.0
 PYTHON_BIDICT_LICENSE_FILES = LICENSE
+PYTHON_BIDICT_DEPENDENCIES = host-python-uv-build
+PYTHON_BIDICT_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
