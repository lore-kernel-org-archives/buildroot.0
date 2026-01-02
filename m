Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A77FA374B
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA20480B17;
	Fri,  2 Jan 2026 15:26:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZRucZdj32E2F; Fri,  2 Jan 2026 15:26:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFAE280B44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767367601;
	bh=NqFDhO0h8QWa4I2Q7iJQ9DyG7sZfwdrr683aJBi4Vxk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=SSshwn6Do6B9znZC/o88AYBKJ1O0GhHjArlL7Filbw39y+4+w5BfAvv5n7zB8xAyA
	 ecBqZgJ6SPKFmrMcqaLtIpvkAttF9+ZvqmO2vc22MJKV06kFfczE5T5RteeCXPet4X
	 J0fgy45cki0opYc0zxBC9/sIxmec3Dx9s3XoIsLO479sl77RsG9xI9SqRulQlktEVq
	 G0DqqH3eFATu6tLsudWcYL/u3X1oXXuoPQyH0a6ZnXAA7k13/ARQx1Lrks6yUCHB/C
	 jrRDQisuxohl4ujBUQEVWnHSIZ4lhH4NJHid4z1IXAsd99F8nLCx64OnOf3IlaXohZ
	 JEqYJpCmt8J1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFAE280B44;
	Fri,  2 Jan 2026 15:26:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E2C8ED7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4ECA40186
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mZ-nN5qaJA-0 for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:26:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F38DC400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F38DC400C1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F38DC400C1
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:26:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4F1CEA4C2CA3;
 Fri,  2 Jan 2026 16:26:36 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37006)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbh2x-000000004IY-3gqT;
 Fri, 02 Jan 2026 15:26:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 16:26:29 +0100
Message-ID: <20260102152635.924052-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767367596;
 bh=oWbEIcMpVKkrr94fmjljBV0ugmORJ9gScmFbgef3w7A=;
 h=From:To:Cc:Subject:Date:From;
 b=Y6lzyyew41DEb5ETqfPXiR98KsM8c/wJIop2EsNsWKjB3eNsnPJIyP188FL+0ePhz
 svrYpKiUjq09CSER8d2fIJe2YzgC/BHiiOYuIHPisqfyO5wJmBXJShIzsWWPaOrpZD
 IvVVhFpsbscHKh1tyE5BZ2pvMzMSFD4wYvG7U92RXCGeguFm7CGLkyyMHY6zYU+QPa
 XLqsJu6ZAoLUQcTehAoIs9QLP1eXjQRSGcfNI5EUo2c24hM8gF2FpAOba0ZXWFfn7r
 11oJwoZolC7Gn15N4vwTaWHcIY+XMKcW4pbhr+tvgCIf8KNunXglwmPtQYN6Gx52Vy
 RPYO1iQgjeEMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Y6lzyyew
Subject: [Buildroot] [PATCH v3 0/6] package/python3: bump version to 3.14.2
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

Please note that no changes were made to the runtime test infrastructure
as suggested by Julien:
https://lists.buildroot.org/pipermail/buildroot/2026-January/793621.html

Regards, Bernd

v2: removed BR2_arceb from numpy bump (Julien)
v3: added changelog and patch to python3 (Julien)

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
 ...ac-detect-unusable-termio-operations.patch |  8 +-
 ...mpilation-of-Modules-_remote_debuggi.patch | 55 ++++++++++++++
 package/python3/python3.hash                  |  8 +-
 package/python3/python3.mk                    |  4 +-
 23 files changed, 308 insertions(+), 131 deletions(-)
 create mode 100644 package/python-aiohttp-sse/0001-Fix-build-with-python-3.14.patch
 create mode 100644 package/python-html5lib/0001-setup.py-fix-version-parsing-on-Python-3.14.patch
 delete mode 100644 package/python-numpy/0001-MNT-do-not-use-long-type.patch
 create mode 100644 package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
