Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A386FFA3741
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 14:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6847140635;
	Fri,  2 Jan 2026 14:08:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rsxvp94BDbqR; Fri,  2 Jan 2026 14:08:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7917F40629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767362894;
	bh=vhvEg5/ZelYz0jfI3n4RCO7DQ3PBYDnDga8+Cm887GE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=hh23TeP5JdJMcRq+GgpQN4a9uCVcHN2s2hyD+eZ3l4vt/6HtPsMCmS1GH0dSmq5aw
	 3PwscFu+70hz2+QCkbW3QhXRuqEBbtwpdeBUZdiKVx1E2MdLKTEOaw0frH1hWGxnTp
	 wBvSfSfpkFJnlwOXxojhOC+RNSewi54r+8JRzAQZz3Rl+H9AhtKaO4G/eZ20CEDcZi
	 ddB2wV0BkKgsPY5ppa4QIyYL4oWG8d1GskNO9eARc9MeicyyuGmObhNfIXiQxDoyFi
	 ewVwosf+mmdiew6Bz5WW/InQ2PVI6BrzcdGR60zNZ6QsV1888fAX7+xmN2Yq4SGgug
	 zbKbCdtMip4xQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7917F40629;
	Fri,  2 Jan 2026 14:08:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B2940D7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 14:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9924F402F1
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 14:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2SkxINPiZ6CE for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 14:08:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 568C6402C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 568C6402C7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 568C6402C7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 14:08:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BFA27A4C2A6E;
 Fri,  2 Jan 2026 15:08:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40334)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbfoz-000000006rb-3A16;
 Fri, 02 Jan 2026 14:08:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 15:07:58 +0100
Message-ID: <20260102140805.166641-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767362887;
 bh=v+IcMlWB1p9VaPT5J8t2akiF0cK7BI3i4surheyXIp0=;
 h=From:To:Cc:Subject:Date:From;
 b=nKQ3FmKFdGx7eFba1o5xatJyS2ybwVdx19qRbU+EW2iLodfLdYJLYDSRBbxiNtP/b
 fxB9gj2XApdcQFAM5oad0KzyP+y1IaZeukUR3ENkcP9eO6pdtxxOcZAZUjyUcUwGFd
 ANF/5YQi7axe/k1xI//8ZmJLcV81aOts6k0jCko3zXvz6tcVya6AVRMNy0HXkhVpxR
 f46/3CUFUarstjwAHWFOffelam3XyvS5x+YafFs4DUQJ2i6Ouqvj083YrI2fbOZShZ
 Bis9k/b3mrjyS4mLjAAZNabPotYE1ukwsYt81UZyS3nDS6j4YkbmzPMMkPB+ftNlXP
 99sIB19V4TmvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=nKQ3FmKF
Subject: [Buildroot] [PATCH v2 0/6] package/python3: bump version to 3.14.2
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

this series includes the remaining version bumps and two build fixes to
bump python3 to 3.14.2.

Regards, Bernd

v2: removed BR2_arceb from numpy bump (Julien)

Bernd Kuhls (5):
  package/python-scipy: bump version to 1.16.3
  package/python-web2py: bump version to 3.1.1
  package/python-aiohttp-sse: fix build with python 3.14
  package/python-html5lib: fix build with python 3.14
  package/python3: bump version to 3.14.2

James Hilliard (1):
  package/python-numpy: bump version to 2.4.0

 package/opencv4/opencv4.mk                    |  2 +-
 .../0001-Fix-build-with-python-3.14.patch     | 35 +++++++++
 ...y-fix-version-parsing-on-Python-3.14.patch | 42 ++++++++++
 .../0001-MNT-do-not-use-long-type.patch       | 34 ---------
 package/python-numpy/Config.in                |  6 ++
 package/python-numpy/python-numpy.hash        | 13 ++--
 package/python-numpy/python-numpy.mk          | 76 ++++++++++++++++---
 package/python-scipy/python-scipy.hash        |  8 +-
 package/python-scipy/python-scipy.mk          |  8 +-
 package/python-web2py/python-web2py.hash      |  2 +-
 package/python-web2py/python-web2py.mk        |  2 +-
 ...e-the-build-of-pyc-files-conditional.patch | 14 ++--
 .../0002-Add-an-option-to-disable-pydoc.patch | 18 +++--
 .../0003-Add-an-option-to-disable-IDLE.patch  | 18 +++--
 ...move-PY_STDLIB_MOD_SET_NA-further-up.patch | 12 +--
 ...option-to-disable-the-sqlite3-module.patch | 16 ++--
 ...d-an-option-to-disable-the-tk-module.patch | 28 +++----
 ...-option-to-disable-the-curses-module.patch | 16 ++--
 .../0008-Add-an-option-to-disable-expat.patch | 14 ++--
 package/python3/python3.hash                  |  8 +-
 package/python3/python3.mk                    |  4 +-
 21 files changed, 248 insertions(+), 128 deletions(-)
 create mode 100644 package/python-aiohttp-sse/0001-Fix-build-with-python-3.14.patch
 create mode 100644 package/python-html5lib/0001-setup.py-fix-version-parsing-on-Python-3.14.patch
 delete mode 100644 package/python-numpy/0001-MNT-do-not-use-long-type.patch

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
