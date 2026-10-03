Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDA0CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97DC760FA9;
	Sat,  3 Oct 2026 15:56:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S7sA_eqKwELk; Sat,  3 Oct 2026 15:56:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BB58160E16
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042982;
	b=LEQO/LxcvTTmDOeF81S6meBnF/D0se5lKFAgFH/PleX6njULBLVpno7+6sk6071KhX95
	 0Iv1QFg8avkhqJgnhCSCQUDs0FZt2PpTNOKzvE+F/FSW3w9sQlsey/seOgEPmiBtLhc+P
	 NaZ13sdQs9266zInbUYBHlnCcguO1JYGaKyMo7uNkIa3UJYxNB1lo3Z8mhJZnRLLewPtL
	 nIgXzhuoaqQk7Nz0bIuGdw53oHBOa1KgvC7PcA2PGoOQkNgdiqxGHlKyuFttEkG5oYq1Y
	 4H5n8R2ITWnMXG/6FZO52RWszs5dVVpiiXFCuDx37fkumIyIgGWWPMdUd96o6cfQv2w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042982;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=eeNEVaq4A/OiCGDeU7nTr7cUNN2kS6jZurS/wjUYHCg=;
	b=ZSNBay/gyDKAGNA4sveCORBuUPTjWr/uIUsBUf5OkrtzgUklNCAkaEirToJgZr0AKe8h
	 efff+YFhzvccMijNABfGNgmiWMZHiUUXPbJPZxXFQY7JzP6o2Hf/WL17yWiCB+K8gZ6pH
	 cmixUIT0hSLv1LAx+x/IwdOWTF6yxYiZ5GBhyQUcHSeUsbXxK6+xMwbU1lMAtLVdJ2vjY
	 2LOK6WTJ+3wpeu54RkOROwd+fw7qYmJZSU0zX0eKlN4c+Dy2nTpl7yDjm0rItSffjjI1p
	 8LIwo1uK43CNj5cNevb1ZTbmiNHjUtsU2qwtRg7eEp92xpWd0MwiiI2bR1DobTd6rNg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042982;
	bh=eeNEVaq4A/OiCGDeU7nTr7cUNN2kS6jZurS/wjUYHCg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ehv02lCkkjq24OPClKaVSdXPoiq1q9jAfAFOHI6jVMSprtHHCMZdh4O1V0z1B212D
	 /LC1aMCmOimT5UOhBwZpcqtx6nP/lEAFcsd74c5Ya4JcCt//A/1F2OvAdjWXXgWV+n
	 4mL2siIp2rlsAS6tRJyf4QcWL3RSq2At3ZjtXG07riNWQzI0jQJBNV0vLVdYZt+0L9
	 +8dj59yx14qqPGIm0Fy8N07G+++u/7WDd9zzjkq7XoyTI+6cUSLNy1ORQyE8A+SfUs
	 4DfckTa4Qm2ACQauV/ulHV7UwRYCwTlpfQCFxSZVgWasINPD0Awg71vV87/nzfl7FT
	 4SUXidnB8sl4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB58160E16;
	Sat,  3 Oct 2026 15:56:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B35D14B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F7366063A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O9DXFOV1USd9 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9F05D60680
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042846;
 b=f1n+euWdqGzpJI+YlUM+0WnCRQ+6iaGk0bTl2wUahEVtrEAw642WDloZ2Sv4PSV3urNH
 gXhUV3kKEoaoLPXu77dws7h0uvd2U08rK923wEfu1hVQ/0abQCZxBkJZSOSjFDJKq3VaO
 N4q88VfLlxCEUj+SYw05INhCaYCb+qEDzMFxUNwzyV8yRDvzoD3xeUGSDdGR5fWKvoPz0
 gibxs33CrpmprbA8AntFrQGlIGtEQrnSley94l6jt2tdKHvdi4f/oKFbwezSD3wQs2WW1
 dGM7c4zdOKQOerCNSYNASZCCM4EFGN343WgwtoZ2nYfq5HlDmJhkgXW9xQWeMJHbRjQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042846;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=eM6g/f6D6SnvCv9KX4EvAESTl81yMb/FE2wO1swjWAA=;
 b=Goc9G3eB2znPKQxhHH5U2IT7CxfzdGd7oBXZtIV82XZ2NMpgrdQcanM6o41NJtlsyzmt
 Jionq1jZFAT1925kNXhtrSfnO352grCYE3LMX64UuSBjyZBAU+xnUUIrgCYfC8oU5e8rT
 C05Cyv5J3td6/HGE76Z2qI8uT/pQ8gZATFpK9nMF1nColZUZIFciUjF+YcM8Mqp9PO0FM
 8DKOsnrl3lGoAHHp5EBq6srDp3ShyNJ7HskMAusXxrLjGDO9qgH1TexSk0quxgRGm273O
 DgmbC/mhwoar7T09KPq5alUHgseTB6ly3Fo6RfuNlTPfIHIdINdnAPJa5Huy+H+iwmQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F05D60680
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFA768A30A; Sat,  3 Oct 2026 15:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c79f971fe3989c90dbd3631f19ddba955e822fba
X-Git-Newrev: 05b806c6ab12b9bf46cbc6dead4eabe09a4dff8b
X-Patchwork-Hint: ignore
Message-Id: <20261003155251.DFA768A30A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dataproperty: bump version
 to 1.1.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/05b806c6ab12b9bf46cbc6dead4eabe09a4dff8b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/thombashi/DataProperty/releases/tag/v1.1.1

License hash changed due to year update:
https://github.com/thombashi/DataProperty/commit/da381f606e06572d990cd22f69fb02ae6a7c1892

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-dataproperty/python-dataproperty.hash | 6 +++---
 package/python-dataproperty/python-dataproperty.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-dataproperty/python-dataproperty.hash b/package/python-dataproperty/python-dataproperty.hash
index 49ce188898..bf5127e816 100644
--- a/package/python-dataproperty/python-dataproperty.hash
+++ b/package/python-dataproperty/python-dataproperty.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dataproperty/json
-md5  b10a82d8c35a1e69f58b921aa7d7f063  dataproperty-1.1.0.tar.gz
-sha256  b038437a4097d1a1c497695c3586ea34bea67fdd35372b9a50f30bf044d77d04  dataproperty-1.1.0.tar.gz
+md5  d5381879e224554ea0e3b8cc46f60f19  dataproperty-1.1.1.tar.gz
+sha256  a83af82a234edda5378a36fb092bc90dd554646c5e58202a310acf468ae81bc8  dataproperty-1.1.1.tar.gz
 # Locally computed sha256 checksums
-sha256  36289157e371aaae5b5d3ba4be87359ed07548cdc7a9f19ff61dc67cfc536a9c  LICENSE
+sha256  72418b897d8a5817d1c858112e42e71b77cb251948c3753be5e15b59c20dc8d6  LICENSE
diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
index 060de7cab5..191cf02b1c 100644
--- a/package/python-dataproperty/python-dataproperty.mk
+++ b/package/python-dataproperty/python-dataproperty.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DATAPROPERTY_VERSION = 1.1.0
+PYTHON_DATAPROPERTY_VERSION = 1.1.1
 PYTHON_DATAPROPERTY_SOURCE = dataproperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
-PYTHON_DATAPROPERTY_SITE = https://files.pythonhosted.org/packages/0b/81/8c8b64ae873cb9014815214c07b63b12e3b18835780fb342223cfe3fe7d8
+PYTHON_DATAPROPERTY_SITE = https://files.pythonhosted.org/packages/f1/6f/a801320bb388d965be9c370ec753cc33120e6cbe0069fa05644f05821975
 PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
 PYTHON_DATAPROPERTY_LICENSE = MIT
 PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
