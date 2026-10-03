Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C778DCA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D1FE60F80;
	Sat,  3 Oct 2026 15:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RXwejmgrSGqo; Sat,  3 Oct 2026 15:56:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8752260F86
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042974;
	b=c042wxRo/aPv/nmubtgzteTj1ZQZdqbUbdQKceBbhtWU5Jjr/DvuiNKCkm5rZ/fFWe6F
	 kVghngM1gi1Z/Cji+OINCMHJ5TL3yVI9newzfGBLZ0mTj1l43AFH14qdUJsUS2FKZBj+8
	 /CjT7ZL/tSHcy0M1PGbfjQ25gxNDYn5ZjO89GYr7qttPUvGK9pP1+dlRdYHGxxFPtDyyM
	 3957Er+gkU7J+3OeK0oAXY87vSHKdh1KKutwNTUfu/7FgazQMz13xhhCCpRoqNsGqfOGy
	 Tu4UkYL8XPlsSAP134tfAZk84J6jz0RcwIbtFA1n2ooYSgy+7pRrgckNIf4HSjqB99Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042974;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4x9JONF6IeW+IVQiGbxcwGF4pxSnBk+QMiO8WkXJwVw=;
	b=Nkg8XblWhkPR/SEhO/jmsjVu79Y7OmHFpC0ngki+Qyt2N4rcY25I7//hZxUUagH1tJLB
	 dQZCFpCutaIOpIgcsIz/VRGAdgD6IQpM5yVeyFAU5nOE4JMscXYpm1RQRftnT8KJvLSsG
	 Cs0BXuuTiK265UcWGM7HcdaeIBffwSdkOyduuCULy2Mc5UVgPm9zqfa7ilrlliKyI/pyA
	 Lb0V1BSYmM6wKT9zBS7b+XhBYSVJ6+KLzYWnWNMYOe9ZrD3290w+cscDa78TELJXN1m2J
	 C+y0VmO6R/mJSBMcTsUZQwD2dtRsuz3StEoB5ovbVhrSTX1YFyM39DV192fvqQyswgg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042974;
	bh=4x9JONF6IeW+IVQiGbxcwGF4pxSnBk+QMiO8WkXJwVw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hmZ5CTxX2tCGZEIoLRiDaKfQvygo45+Z3OKcsXkrmJPJ2ayBRM3PG2aB17UtXyNpB
	 DLeJaLjDGz2QboeEsoYH9Zal3fiqjLy0ARan/itqL0s9mgq+q2Q++yIoeZubilcZ+S
	 Dhg+Z/zTYIdwJmprB6bk0xYVYPgK4tyxUbZ7+0qAPom4sN4QtaspQM2YKLsu1L9RjA
	 5snbWo8Z9AF6o8KoACCt9s+BwROkW3ERvu4d14AVwAM40fKlTIDJM4vV4Nu8WScaI8
	 2oOER9QycobRf6JqU9RReQrBM5jpF45BBY0re4sFPfDWQMFQyx71C/AxldyWSGnrhl
	 Dja0nRE2uMxYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8752260F86;
	Sat,  3 Oct 2026 15:56:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 71EDF4B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EFE960697
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K35r-2pLF81N for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0592A6067E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042846;
 b=V1uHb/z9e2SoJa75vnf/P6jUJgvOtlImxX0Fw67FQSyPc6ppEzbzhPGH+b9nqrgC764c
 AOBhBohMwqFv7GUf+N8PCBFVYpOQsTyW2PpZQCt99BAb30f2brROpYLyl5r+i9JZjEc2P
 LVBF432lYaopda/Ror1WRDQR3h2xWgyiSoW09obJIvGL9AuZ5uMKiHYc5WmIFuFwTd61z
 qkcLUF4s6qft/cyroMwAV0yd50XO6fYWkGQdQfjr04rR/9dHIx+nlxVkXRn7bajSBTD/B
 sr2WwJiSbpaZVwVA/qOAL3Cb99aKXB1fsBZuC1an5GPQtUAixtNfoZNgL7Qd1peQyEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042846;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/MZu8JPCVCVNkMKOvRnVnZaV5YpCw29C4uRakPgudGI=;
 b=h+BfQo2pz/XZftDijPQKpOCRDTOIsXSHuJHMB5jrg1pFbWqF68wOkxXoRQkuI30grS5Z
 4HxXFeQ/tCXL51U53cHstE1fe2Q1CuvguHKeGkOFFeR5P9SBuetnII0phhdc8/Hci2BX2
 qUtZRthi+/jdi8I9YJNpiYKWU4zmDOMDUvEfq8uvZTHbRPyI9lOsuevV7unD0Tq6gbhy4
 GsPATeiwBYS48Kt4qZKZGmLged+3u6nM3zIMBxS78NugozOMv8fIlbeigtmZ6qVOlbqIa
 ishFKnUBr+brMiVaXsuPQBdQ60XISStiTjluYhp0fT/FscKi9KD9K/G2E1jQeGuXKbQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0592A6067E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4744688806; Sat,  3 Oct 2026 15:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12e3d4bf5be8bed7299c2e6183ed9020bbbf5652
X-Git-Newrev: 3cd7abff1c43f7a3c880702d8d571606b754e99f
X-Patchwork-Hint: ignore
Message-Id: <20261003155251.4744688806@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-typepy: bump version to
 2.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3cd7abff1c43f7a3c880702d8d571606b754e99f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-typepy/python-typepy.hash | 4 ++--
 package/python-typepy/python-typepy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typepy/python-typepy.hash b/package/python-typepy/python-typepy.hash
index 5cf3daded9..c82ecff02f 100644
--- a/package/python-typepy/python-typepy.hash
+++ b/package/python-typepy/python-typepy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typepy/json
-md5  f7ba433b3ea79aa36699be634b36aef1  typepy-1.3.4.tar.gz
-sha256  89c1f66de6c6133209c43a94d23431d320ba03ef5db18f241091ea594035d9de  typepy-1.3.4.tar.gz
+md5  f8b931aa306831b6291380fab863656f  typepy-2.0.0.tar.gz
+sha256  413fec52a54a010e2e20d6e18eef68840ebf13b95b719e17b5e2e81c6e85e4a6  typepy-2.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4434f353a12dd0236a99e5d3fd07fe3b3a453f9164fe10c57a11d6ca86b50c08  LICENSE
diff --git a/package/python-typepy/python-typepy.mk b/package/python-typepy/python-typepy.mk
index 03760f1d5f..d80cf2f0c1 100644
--- a/package/python-typepy/python-typepy.mk
+++ b/package/python-typepy/python-typepy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPEPY_VERSION = 1.3.4
+PYTHON_TYPEPY_VERSION = 2.0.0
 PYTHON_TYPEPY_SOURCE = typepy-$(PYTHON_TYPEPY_VERSION).tar.gz
-PYTHON_TYPEPY_SITE = https://files.pythonhosted.org/packages/79/59/4c39942077d7de285f762a91024dbda731be693591732977358f77d120fb
+PYTHON_TYPEPY_SITE = https://files.pythonhosted.org/packages/28/c3/0c4382a6c70d0aa119bbf45c56340609c3f206b68756e7ff6b91abf83cd9
 PYTHON_TYPEPY_SETUP_TYPE = setuptools
 PYTHON_TYPEPY_LICENSE = MIT
 PYTHON_TYPEPY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
