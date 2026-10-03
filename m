Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5112CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A89826103F;
	Sat,  3 Oct 2026 15:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5m7gmWIoUE3P; Sat,  3 Oct 2026 15:56:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org ACCB461042
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043018;
	b=eTGS0sX25K+rn5TweCxKeouTIm5Y3J9JeAGtuNIEHkNbEDTb+0ryQgwXrKLSDSM6Zwy9
	 e4FkrFBg47UlQZhvxB3cE8vxiu2RBowi6R2ec85h+fmT5ygi2loESAsJSO+5hv/O88QQV
	 iLrNq00+UKgoe0kOSLQw0PMvKLdu4A9dOFAgoduZdhW4+1Oas0uFXcPTyBcf5hHMD2Maj
	 D1IdrDw8jp06y2NFbo7X2GYyLfYwPFl61gajU2Vx8f2vCs/5t9bRK/O/gihyRW1e0TVBM
	 I5J+AuX+ReWwtW4J/pV1KRiSJSspDHOb690IHApPEOHuRYce01sByH8n/oZYux9oFQA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043018;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PIsqKSrgKkqgxi7ZQwIEfbLIYf6Yo8ECh/ELf2/ieGQ=;
	b=KSW8eQ9OBNvPbtjU6t01/480PM91nvz650w/rgm/WkhxvtVtBdmGcjOiMeOYtV5LC0fy
	 hBbE+fRHdo68StUfEZZ1YNDymHXuZGg3/cvs9ojCjpofDfGTeNnKZJE+8HjzzMF4TEDkw
	 PEKQWmSBoxIfOogyWvoRq4bbN0e1wGE7VIG5fmtp8Gf1GKgP7BE2eyzKpuac8QebxCq2b
	 tSTFUp66fEdeYHw/Z2CGALap1QzlwdMD5xt/8YLrlZ6s4ArYMe/N5aus9kMEK0BMpSXyT
	 ti/iHshucff9+RAZkntDm/TKRz9tw/zzU9pxo9VZpNlEQojlhdz8XACOtfkIbf+VINA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043018;
	bh=PIsqKSrgKkqgxi7ZQwIEfbLIYf6Yo8ECh/ELf2/ieGQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iFrDLSvSb1b1KsRHTYvYQVWzm96Cm1BMjMtgyziuqoagfLV5rj5bqNqgaXztA+5bw
	 52XTWupOZgi3t00bJXl1RIA7VSTkAkFwoSIup4DQeKd/IXS6LNOu9IESfysNHVMNxg
	 H9f/MuLd4YZi4JPRUf9gc9aSJ9GGDmX26zZ29iCz+598FltUS911i2hs5XVil3mHLW
	 pbd7mhOyUTys004tS93YgPSdTY0O+wfsQ5NepRZXWB/edjMiz81ZeRKl3yfDYvinRz
	 VRiB9EMrtG3Mq3crXy9uWBGm3JJz0cSa29ZGm+dmjW6m2L54qiUvxsDE6tPcuWgut4
	 ysaZQwH496Ywg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACCB461042;
	Sat,  3 Oct 2026 15:56:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C767476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A1C06067E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NN9VZNxfLq-5 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0F421606DA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042848;
 b=fV3WJgkikrMaH4ok+IXPxnykynh61Q66l5maZARlYYO8NhNn+iJ/3PP0F/RvaH2vyqFO
 NImOfIWuzMS0hwNoPwUZIek4z9F3CJeolwUX9FIpudFpzIoEyeesDFCg1NoelNOxr8668
 gEiADUYj5btO0BP8nGt6oCSHQPgT+v9HHPdy74/s6NfMRz3s4V9IviQIjNgm7OE50cWPo
 /Knbx3xnGV8VKu6mZaGQoA+9E6Qwjiw1/NRAxtBl5AWhuXb6svZAtWR/oP02KOYzJ6peA
 pMeSY4G0oDSRN+ZRIbdYi9UkCPo8FuppeX2WE+BxxCeOfWIuUACmQ6XPvErxcqksfvw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042848;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1jXhdLiQ5mhoYTcddoX03avO8T4dx5xjsrICbjPYhEU=;
 b=Ek20GV/Nus8+IagSHF7sPQPun6nZDwNkLZaSbN+8ExhZZVkAYNs/OE2G0tkh193uv41H
 RZDQo9c8LoB1JqEwnLSq5vwG/sUS8Mt45Jy4r2gPh0bXfhtG/bUAZvTZtWLGZj8IEqRSt
 zmp9SeOYaA+u/6IjgkkZSGWEf3BCm2eubTKGqDfLP8BIGU0pQslXllw2g0QZQmeiSBFYJ
 82lLD+OBCNyDOQQ8v6OvkO/G+Vm+Vqx9cp1hUoAWXp8WFD42FB0oaaoui8KTLj0750GCE
 qyHJucrkmULq9/W2TRoYUQpdQwCgpjpPMM4wiy2TVW+53WMUwyWZj42Az+PN04IwOkA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F421606DA
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5154C8A31E; Sat,  3 Oct 2026 15:52:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e57b7dd39386bc0bba70460d3e97cb86a85c069
X-Git-Newrev: d2b49a43a8194a3b352c6de5820519c8edde06d2
X-Patchwork-Hint: ignore
Message-Id: <20261003155253.5154C8A31E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jedi: bump version to 0.20.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d2b49a43a8194a3b352c6de5820519c8edde06d2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/davidhalter/jedi/releases/tag/v0.20.0

Updated license hash due to upstream commit which removes an empty line:
https://github.com/davidhalter/typeshed/commit/a4e3cfefacbfa6d1b519b36fc67362cb3a199022

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-jedi/python-jedi.hash | 6 +++---
 package/python-jedi/python-jedi.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-jedi/python-jedi.hash b/package/python-jedi/python-jedi.hash
index 7ecce429aa..194f1429aa 100644
--- a/package/python-jedi/python-jedi.hash
+++ b/package/python-jedi/python-jedi.hash
@@ -1,7 +1,7 @@
 # md5, sha256 from https://pypi.org/pypi/jedi/json
-md5  bc2dfcc3fdcd7a1384867b5c6f5bf519  jedi-0.19.2.tar.gz
-sha256  4770dc3de41bde3966b02eb84fbcf557fb33cce26ad23da12c742fb50ecb11f0  jedi-0.19.2.tar.gz
+md5  6f7c8c61fff6da984d7297bb32cdd1a1  jedi-0.20.0.tar.gz
+sha256  c3f4ccbd276696f4b19c54618d4fb18f9fc24b0aef02acf704b23f487daa1011  jedi-0.20.0.tar.gz
 # Locally computed sha256 checksums
 sha256  78e60cd0b8f28694f30195482c33d76908d846b0d15278deb7332aa22ba8e412  LICENSE.txt
 sha256  235e993965d399a25e7d493d25c8622f78718510884b9c051f1f1866b6f34e9d  jedi/third_party/django-stubs/LICENSE.txt
-sha256  b41b78f562a2e65b75cab44354335f6f435d4ef73065509600ac910cf4e22fe0  jedi/third_party/typeshed/LICENSE
+sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  jedi/third_party/typeshed/LICENSE
diff --git a/package/python-jedi/python-jedi.mk b/package/python-jedi/python-jedi.mk
index 7cd69f9053..567946dcf7 100644
--- a/package/python-jedi/python-jedi.mk
+++ b/package/python-jedi/python-jedi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JEDI_VERSION = 0.19.2
+PYTHON_JEDI_VERSION = 0.20.0
 PYTHON_JEDI_SOURCE = jedi-$(PYTHON_JEDI_VERSION).tar.gz
-PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/72/3a/79a912fbd4d8dd6fbb02bf69afd3bb72cf0c729bb3063c6f4498603db17a
+PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/46/b7/a3635f6a2d7cf5b5dd98064fc1d5fbbafcb25477bcea204a3a92145d158b
 PYTHON_JEDI_SETUP_TYPE = setuptools
 PYTHON_JEDI_LICENSE = MIT, Apache-2.0 (typeshed)
 PYTHON_JEDI_LICENSE_FILES = LICENSE.txt jedi/third_party/django-stubs/LICENSE.txt jedi/third_party/typeshed/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
