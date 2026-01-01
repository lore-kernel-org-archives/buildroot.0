Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9D5EED631
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 18:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 637BC4049F;
	Thu,  1 Jan 2026 18:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a1KRpY-8hQwJ; Thu,  1 Jan 2026 18:08:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68817404A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767290928;
	bh=5KCUkEcHIA0ptVeWXJHSVSi9i4y/5UIWHqUgZYGJgM0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=GNeMGNAeIe88r3pcv3NortyCLwHaYrYE+o9hELQ/lCfAHJ/8xe8mJ4gYYIQSlgJ5U
	 7ySnaLqsatE6r+65ek7JxZx0l/aF0d7+NC+5omL8Ef6NwQ8WSaxt5zkamf1AgTK8Ck
	 d+Cp1MrxcDb3ZPmw1/lEn2ulAFlimx7irAPB6+WfXZVqGvOTw6ycOOsZ2VtIGsaMup
	 OcjAwGoAphqAWcHO1d8xQG4nSOCBtOaiPBtdcMHb7TryyzEj1DA6xcTSS+I7dPHyPO
	 rreT7I516JrS3DwUK+nUD++lr6pmYo3MwrFDEHeCXDTwwnferpIXPij8zpV7jtaidP
	 HhXMF+VIPnBZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68817404A0;
	Thu,  1 Jan 2026 18:08:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EA55319D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 18:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCD59404A0
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 18:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VybJejZsDsLO for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 18:08:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2D02A4049F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D02A4049F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D02A4049F
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 18:08:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 445FCA4C2992;
 Thu,  1 Jan 2026 19:08:44 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41084)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbN6J-000000006l7-2bLa;
 Thu, 01 Jan 2026 18:08:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  1 Jan 2026 19:08:36 +0100
Message-ID: <20260101180843.247730-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767290924;
 bh=J77GdireJTUi/ZPTxNFeCs9NvNnbOw2ABBrpnoL0Oj0=;
 h=From:To:Cc:Subject:Date:From;
 b=F8Y8AXPci6RArmxPlC7t+Swr1TOdHS8LE32hMKH3rNoEAcnEg44bvDGV4HQWe0LH0
 SqKUthWMlRUS9jJcw2VHfUu4+XHdasB7YaprvNXsSB172NL5u7KvdIZOirkLPDJlU+
 qYOjPvNFLOKaoU8ZslMxry3K8+WXOSNN/GQb4gN+/d6I4anwrYXDJY68qBvkGhi2iX
 c/sPXq93pWDJrYM5frvRjK+Mc4a6bsIUfxumE+2GbP+MHVILvxlrVixYjABdjwHdJ7
 gGJVk6CJZX34YDKXIw4IcOQkNY/It24GBUUc2emOXGw8RfxVXqj/GqANcEdPN6xUym
 1IKwxahx2CExw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=F8Y8AXPc
Subject: [Buildroot] [PATCH 0/6] package/python3: bump version to 3.14.2
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
 .../0001-MNT-do-not-use-long-type.patch       | 34 --------
 package/python-numpy/Config.in                |  6 ++
 package/python-numpy/python-numpy.hash        | 13 ++--
 package/python-numpy/python-numpy.mk          | 78 ++++++++++++++++---
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
 21 files changed, 250 insertions(+), 128 deletions(-)
 create mode 100644 package/python-aiohttp-sse/0001-Fix-build-with-python-3.14.patch
 create mode 100644 package/python-html5lib/0001-setup.py-fix-version-parsing-on-Python-3.14.patch
 delete mode 100644 package/python-numpy/0001-MNT-do-not-use-long-type.patch

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
