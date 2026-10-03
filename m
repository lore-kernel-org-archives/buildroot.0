Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C793CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43EBD606BF;
	Sat,  3 Oct 2026 15:54:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VaM7BT00gKnz; Sat,  3 Oct 2026 15:54:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F0E8A6068A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042887;
	b=Xdk/HxiQ/zar0WDZAvYbNnB1lGeAdReSgKIr0swcf8le/xARd0CKiG2chQ0ifVUq1i5x
	 SwjaXdOfR2NoZMge0Z/wr3wivAEBKfbJzipJECWAVuHpwn6dAlrNj17SlVPkbeX3OTqnf
	 9dtqTViTi/eqbkBVAV+ZGwazxEXtCQOuJcDlLSxr22aGWSruIOJIrirGyK1MViVSoQ5VT
	 H28kBOOTtnmjuDJAZv4gpfL0gaTohXDFgoieHawv2zFwPvCK/MnEVHHk6N48GAH+qAiCc
	 AxVXGqPgJOjF/LVP4n9eOkNwbQcHgpDBvPMq84qo3qt99Cul6diEnJ45RhvT+SaC9Ng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042887;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EsUmvoiN1HfbcHwyJv10wzQrLsGWVRIod7LOO0lA2vY=;
	b=rD3lF3RqpJtEZy/f/DVQebHLW4cObMcyh1L+PSvlnATz04TivUIEkz2vW+va2XnJtsn4
	 hqsG4dHRWSWrpwY2ZIfQYvVQtFEl3BMudclNH6/VeiMATTvK/0gc92A6Tuy8/7YFGr40A
	 iX61yuZTbYKeprf0TSigElfh8Hr089JRkEmKCDK8xDmN1OLmgokhgXOVozuwJPGQDAHkg
	 MP+wFR+UPjMG/syv6286g9gfkrJr82A5fByL3HZYA6R88XwsACjsGtOAOCCQ9qfBe4sFq
	 NZwFF6GKbzv6kwybKey/YFp3fBOrL9DrtMbFDL4vt2BLysLK0puJALjvy1iG0bs5Xug==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042887;
	bh=EsUmvoiN1HfbcHwyJv10wzQrLsGWVRIod7LOO0lA2vY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a9NBIDBw+YY+wMUySTY/geCPyqgcRMUOvSuiqsdyQRnpC14zIy2cX0EV6etfTWXBz
	 BrVFZOIgdGFaSyXjHKKsAhrsvsQP2roS09s3dYyv79ri+rWdBEmcj1qHfbzzMYIlyJ
	 MeayPd++lZWDsAdx5quBb40BqjKfiBRd4rDoDYlViCWx/15VXs8tzf41KEiayWDfJy
	 xwHXYgJ0Mmd9K6HeL73nBi4ElbRw8QGXjqI2/n5Q3cHlRQVlF6bK3jSPM6hu8lv1/p
	 wFg0ahGnJe0jg1H9VSQilY3GmQusx2Ka640Fu6Ip66YB/zC9i8rmylVVmno8bzhPsY
	 kwZxR2Dp0M2sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0E8A6068A;
	Sat,  3 Oct 2026 15:54:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 138F9335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDC66606B9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZDRj0HD9RaLj for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1D9436067E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042844;
 b=GbUgprXW+0SHZjI1pnNKs5jU54LPmS2Y9mbIUgl6F5KHwjXNOJtCYsg++srknW16U3ao
 yqdtjYqn4tSI5+lGg4Kp2dwK/OJ9DpGWvnQKaUAs3APfdMiy96f4jIv+CMld3OgYP1+Hq
 tOQ0B8XzKk8jnif1Qo5TerF/95SmS0H6SBbA9orcszctCePwP5EUyVTyfIUj4GlpbmYJi
 niX/DenG59G9c7bjcgU4JcHS2ZYdt6ovAUN2ipmgyf+a4pAptPMz7TqmZXofndkQdo9Q5
 efF3HR5hucHXtLgpaQJX7c4daqbWrz8wXwQhmjbdjiKKeR0IVoWkgs3CLYeyZBcHrYw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042844;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=yW28CwD0c2VojfN9j1KkQ4yylk1Mn4hDwXhAkhbHXVE=;
 b=iy7WFVV86nNz2JuihIA2ZmKVmyrmrvlZTmQmuxxRheqc11tnBTMNN1tjx0L8Brehjjyd
 d0Nu1urVME4CNneV6T8gHq6Lv3BSgi672zvwrG9lwY2ENx12yrVFZ0tIvYNPNBJxSE9K3
 yyJyIk/n5TcI2K4bxRIB8aBQOGc0VVsF8ZxApPdyre/QvZgQgGA+amDaiAZYdnpRGdRBY
 C+IcXko43tDyyZnFlUbE1Dv2nTIm7+MSjj+6BdFOzNmKTNOz2HZdebLXkEKJK4v/TJUgZ
 9oDApUbSAkDx0PwNOB4euMe7AxoHYirPjOnfZY7DUC9KcCV9G2GCPY3QnNtDCnW2bOg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D9436067E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E8878A309; Sat,  3 Oct 2026 15:52:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b02143f39b92bc636179374e287b482016de221
X-Git-Newrev: eba383f8865feb10cab10bb6b3ca4019ae19cc99
X-Patchwork-Hint: ignore
Message-Id: <20261003155249.5E8878A309@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pycrate: bump version to
 0.8.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eba383f8865feb10cab10bb6b3ca4019ae19cc99
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Nasser Afshin <afshin.nasser@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pycrate/python-pycrate.hash | 4 ++--
 package/python-pycrate/python-pycrate.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycrate/python-pycrate.hash b/package/python-pycrate/python-pycrate.hash
index 85ec6c6588..2b45b33c97 100644
--- a/package/python-pycrate/python-pycrate.hash
+++ b/package/python-pycrate/python-pycrate.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycrate/json
-md5  7227ba1e2124dc84818adee804de42fe  pycrate-0.7.11.tar.gz
-sha256  23dc1c19b148a17637fea73166b801c767ae738cc4cb3d8b1f74a29e469d7c02  pycrate-0.7.11.tar.gz
+md5  094c4f8b45ce478dfa6efa2c52d42139  pycrate-0.8.1.tar.gz
+sha256  a408c942d219c646a5a81073b8036f48a81c4540dd1f25fda2f8bbde0607db98  pycrate-0.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  license.txt
diff --git a/package/python-pycrate/python-pycrate.mk b/package/python-pycrate/python-pycrate.mk
index ac0e5e1cca..e2e964f4af 100644
--- a/package/python-pycrate/python-pycrate.mk
+++ b/package/python-pycrate/python-pycrate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCRATE_VERSION = 0.7.11
+PYTHON_PYCRATE_VERSION = 0.8.1
 PYTHON_PYCRATE_SOURCE = pycrate-$(PYTHON_PYCRATE_VERSION).tar.gz
-PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/42/70/64a5b11e831dab532b4b61e684c5807a68daeb93b2bd4853975acaaf968e
+PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/5a/c0/5645340d67be6dce6270418986699f14e24d563865077975b0c2262ebc1a
 PYTHON_PYCRATE_SETUP_TYPE = setuptools
 PYTHON_PYCRATE_LICENSE = LGPL-2.1+
 PYTHON_PYCRATE_LICENSE_FILES = license.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
