Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B06C98306
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 06:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3CA5607E4;
	Fri, 25 Sep 2026 06:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u8MoJiNueoG1; Fri, 25 Sep 2026 06:43:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9F78960868
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790318593;
	b=XFsGdty9Lo7ustIrraHO5xzP8XzM230PZY+5dlDzzbdl50pbHzLbEn7bOfy8et6cHlLP
	 hL01AE1mPb3mg2V3jo7sXEfYm1xOD9PjdsnDg5CGJaAt4U8yZXKpT9KNSA5uVC3BZZX9H
	 8el+cMBbHyMyNqa3GOPBSVY3g9kS9HXQV7gTuvUUQbwWcsk9rXaV1nO4868+aqyOKvCTi
	 ICwQpjkGo+eC6N1W7EZMOK0or/FQhMh2BVL8II2ZlWDzZOVK6UVBmXZHcUu6vDrr+3Iak
	 HoBnEkSdtm3oXJQzfBbHdfHC6UNgEQMItFLuzRk8L06cLrBb9oe4DKoy5nSTt9prZmQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790318593;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=8dWSps6V60DK7yaiDWLw9SsYbQ+MLbOKqEzauo82Kog=;
	b=ietQcfvEIEoaN4Ow80zjAOnZOrzvhohvMRhkvtv01wiJZ3nvh7SiIPR76hvnancD+dDy
	 82QAI+erF6EIjl6iJFJ3SkoqhHs5b3Hc0K0mG0RI+SKP7TFu/unjo3n6E/p+aMaCHlONV
	 yKSzJzrbQNQOItS1XwKXxYYrwHhXEuMOsMU0iKTxoZkBue114cE4/PuD+sAdnlzjzwRaj
	 AGUok8K1k/vbAxid2fJ8TVxborjO4Ayje/crfEk27yR+tAA6B/bbCr3J4OW+r66ITGSe2
	 66LOeNZskk5vCHN4Fy6g1P2B6HCM/U6XBzGYEsglwTavMVW5vV1ztDmv4nhzixItcxw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790318593;
	bh=8dWSps6V60DK7yaiDWLw9SsYbQ+MLbOKqEzauo82Kog=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=WmYn4lSn+fA5ixGakNg+NAMPLEr0BDPQJcLaaEgAsHX1JhWQc0P4fPT0P01O8+T0u
	 Y9I+uA1K5x2qI9j1Q68Pt7Dw8sk8ohgC5EiJHJ2Gjxw0t/0U+zp8LUNtnmkNKv7lyb
	 gNPq8Lt/OenHs0+ERNq3soJ/P4FTfhnj38cvu1eJuu321DM/hPpauiW+Z0gvcOeuIq
	 Jqt0LzWlIzVCrs3rT7Yblm6IGBWWIzd+1PkKiBNiQHbyr3coWOxBT1JJwm7A0boiBg
	 1zqurYpc1wNBMrfNxLd9vDJPbsxLRFbnS4RptkAu6sFOt1hxHGqvVwdYK5UoEQ7Rs2
	 5NOQe8ZGwRKaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F78960868;
	Fri, 25 Sep 2026 06:43:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 77B1435A
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 06:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DB67401E3
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 06:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q7q85ho2J1E8 for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 06:43:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E47B340079
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790318591;
 b=qDDE8i0lECU7a+lW8qOL/CACvPsCVGEVVGw4oak3ADefxWm/EWUkX6ImIBaDbmy9eLfw
 /G9ckZNhbwXLHBiwAoSbDbCo6uLD/3isEz/km8qzFVph3si0Kq9YMmn2BjbY530O+TLXE
 Ci6fj989xTrhJ1pVB6FANiAMf9Pp3cC4BrPq3xDu4h36KH7GQFrCIlSEkE8XBWZh1fFR6
 kR7fOE3rDSZtiGIbng1CCkQ1GuPCNMKnTQIFXz7SSSfyfdrGOKgclKbSBi4B/tut5oIz0
 FJ+BELaEKgslrLduUGuMZMWn6A/LqMtPKpb68ACOlStLvDAHWDTkFvNSEYDWh6EIywA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790318591;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=ZsnrZjs/EyD66pQsO3kruM8YCiVDKMH5rykPR+nzrgk=;
 b=PK93JCyeoS1THhQlNde+C/FyTMy1Hjct9ze8QK1v0ySGLKVBW3ZjYPtB8yAwl2wEdY16
 6bvw3hLLM1naEfOb9hoHzbHmhX/EyPTfDGLnOAoKBhqjv6pmJxd15onzceRw1+OwXG+No
 3hV2G6Yth6KDgqCAaeaL4HDMPtgoo9rWm5PEIvT+M6h0Dun/3byM6uwoaashp3E/OO+Xo
 ojURuO/GjjYzI6f5cphrYnKKMAM9d2k6wtWi8lf7YS42t8wSTAZEZ9qP7JlrU+jk71Vel
 1K4mYhdu5PWqDtooiQ66hDg9eBEmvLVsX8UmQZcp2Yfcx4ie2zckZ5povicd4rz/QrQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=amarulasolutions.com; 
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Iu1V2LVc; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Iu1V2LVc
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E47B340079
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 06:43:10 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b912e64ccso3328295e9.0
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 23:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1790318588; x=1790923388;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZsnrZjs/EyD66pQsO3kruM8YCiVDKMH5rykPR+nzrgk=;
 b=Iu1V2LVckF7r5GhlaoKcIovKAmo4lFITz6gnGOL47yVa9arstDl7fTLt+Q2qk/2xn+
 OQ23yAQLVyyzHNx7h+nzX/8kFcWsJ/63ZgmBJSNCJcNP6ynVQZflCPtbjUfBPnhhdhpp
 x8jbjkXEAwZiAwvRs50lilXzzhc1UmgIa8nhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790318588; x=1790923388;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZsnrZjs/EyD66pQsO3kruM8YCiVDKMH5rykPR+nzrgk=;
 b=d0xAzaV9yAJhJwN7WVHnUb+dQtS+9fBgfMsHt8IFum2sJ5LHl3RxJhqSkMHbzZhBP7
 2EKBqRwVqydenR4nLP0MO/uYuyp/69kV1Iuvb8wBkwvsQ7PW1DNcWl4cCjWo/ftoeMFl
 IlvIVxs5CchGD4BB8nQ2rh/GbWKxp99ITIouxgjM/Er7F1kv3qg55/x+8YKahDqUeP9a
 S/Np77Agf8liPgW44ePLW7AxzIJDh4yRK4eyPMB7gQJFlXFhurH9Zi7wDJE0vwBImvvy
 KsT6tsHmblQtEAWV97ytboppieKCKQ31ToA/kEJf7m7mX1SEBnogKMscaNTZYxWr8fCK
 4bOA==
X-Gm-Message-State: AFuF++nWykep6kb67UHrzK25thB8kCcRRv73Yly8c4r6eXZGouSpA4y1
 wCze0P1gCPAdYUxDHTyMfa54LyJwRn1D8uIBsVsIN+drvxN+1SygkS4ywG/YFLggb9gMSJDM/BR
 K9h9R1Wo=
X-Gm-Gg: AYBFou2P1OS9H9Mcr0KiS4Gzz+zqICnSbRuo0yH496UUGMO1nh0FBbb9p4syNxzyN41
 zpCbkbP3/yg0xI4+oz3Rhq5b9wPAnkw/9e3fuBz+jTeULT3fpfzA1RDSReXHKYPn9RdV7dmgPJJ
 uO3WMWhIvFUh2VZoaHyWnLnh3jsoywj3ZmMS1GP1uvuC/T5OZd2oHnN3wlG3AEySVnmBuwlgvG8
 x+qxMx5IPSs3oASFbHlFQJl8a4Tjih6Oq2AcwXe+nky0dYX9+Y79YDzi7yqeUYAE3a4+Y2IKniI
 ztli1AcINTgB90Fyypi96mASZmpLpSkScsbzLvvSXlGrkX3h4Hh6vYxcuJUx15GRJnVCjKIW3WN
 JEep+5/c+QGed6dAD91MHwpKyBOKwAMcylp+KvcSreoQi4tyvyjXuFMKCPJpRs9L3Xhxl0AsJ3J
 /EmId7r235ePxdn8ekzMdzZ0Y+lUNoeP721RwwFbZMDBcQpxpFc0wpDgVRTwSXriYqkTIfUFerI
 cHFM3EWXy8M+U5yVP2gpq53NKXPLhBKhHL2t3LNyRAuXL8Ib1gtU3j5piLaT43IILxFDav2S+jk
 4N78rNhfgJK6rc/pdb1ljkjqItIVYqeOMs1L2xJklO08U5yFYs54PHWe6eVYfAzxhYU36IQ=
X-Received: by 2002:a05:600c:154c:b0:493:f140:c3fb with SMTP id
 5b1f17b1804b1-49fe66cab86mr81269045e9.7.1790318588083; 
 Thu, 24 Sep 2026 23:43:08 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5df44f9sm115584445e9.11.2026.09.24.23.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2026 23:43:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 25 Sep 2026 08:42:51 +0200
Message-ID: <20260925064257.1162394-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 0/6] Support qmake for Qt6
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, linux-amarula@amarulasolutions.com,
 Richard GENOUD <richard.genoud@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Qt6 is built with cmake, but qmake is still installed and supported as
a build tool for applications [1]. This series revives an older patch
exporting qmake for Qt6, extends pkg-qmake to support Qt6 and uses qwt
and cutekeyboard as test cases.

[1] https://doc.qt.io/qt-6/qt6-buildsystem.html

Changes in v6:
- rebase on master (qt6 6.11.2, cutekeyboard 1.7.0)
- package/cutekeyboard: drop the redundant select of
  BR2_PACKAGE_QT6BASE_GUI, already selected by
  BR2_PACKAGE_QT6DECLARATIVE_QUICK, as pointed out by Andrea Ricchi
- add Reviewed-by of Andrea Ricchi on patch 6

Changes in v5:
- rebase on master (qt6 6.11.1, cutekeyboard 1.6.0)
- drop the RFC tag
- pkg-qmake no longer hardcodes the Qt versions.
- package/pkg-qmake: document in the manual which Qt base package is
  added to the dependencies
- package/qt6: set ArchData, LibraryExecutables, Plugins and QmlImports
  in qt.conf.in. The host qmake defaults are relative to the host build
  layout, so qmake packages installed their plugins and QML modules in
  /usr/plugins and /usr/qml instead of /usr/lib/qt6/{plugins,qml}, where
  the target Qt6 looks for them
- package/qt6:
  - quote QT_QMAKE_DEVICE_OPTIONS, it is a cmake list and the unquoted
    ';' were split by the shell
  - Replace QT6BASE_CXX_FLAGS with TARGET_CFLAGS/TARGET_CXXFLAGS
    directly, as suggested by Thomas
  - drop the redundant mkdir
- new patch adding QT6_QT_CONF_FIXUP for the per-package directories
  case, as Qt5 does.
- package/qwt: OpenGL option depends on BR2_PACKAGE_QT6_GL_SUPPORTS,
  which is what BR2_PACKAGE_QT6BASE_OPENGL requires
- add Tested-by of Richard Genoud on patch 1


Dario Binacchi (5):
  package/qt6: add QT6_QT_CONF_FIXUP hook
  package/qwt: bump to version 6.3.0
  package/pkg-qmake: support Qt6
  package/qwt: enable build with Qt6
  package/cutekeyboard: enable build with Qt6

Jesse Van Gavere (1):
  package/qt6: Add qmake functionality

 docs/manual/adding-packages-qmake.adoc |  4 +++
 package/cutekeyboard/Config.in         | 12 +++++----
 package/cutekeyboard/cutekeyboard.mk   |  6 ++++-
 package/pkg-qmake.mk                   | 18 ++++++++++----
 package/qt6/qt6.mk                     | 18 ++++++++++++++
 package/qt6/qt6base/qmake.conf         | 34 ++++++++++++++++++++++++++
 package/qt6/qt6base/qplatformdefs.h    |  1 +
 package/qt6/qt6base/qt.conf.in         | 11 +++++++++
 package/qt6/qt6base/qt6base.mk         | 14 +++++++++++
 package/qwt/Config.in                  | 22 +++++++++++------
 package/qwt/qwt.hash                   |  8 +++---
 package/qwt/qwt.mk                     |  6 ++++-
 12 files changed, 130 insertions(+), 24 deletions(-)
 create mode 100644 package/qt6/qt6base/qmake.conf
 create mode 100644 package/qt6/qt6base/qplatformdefs.h
 create mode 100644 package/qt6/qt6base/qt.conf.in

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
