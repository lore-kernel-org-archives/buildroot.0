Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0246FCA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2F8560EF6;
	Sat,  3 Oct 2026 15:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vgzWf3BFbcpI; Sat,  3 Oct 2026 15:55:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CA59C60F02
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042953;
	b=tKdv2bJse0GGzN1QeBIfhcdgXl6HgDLDCEO+8b8IzVxAP8pGHW4HZeaBz48VJFEsVnx0
	 djQmUybi8HEwuWsNXrv/GrNoUeGWS+6JY8hwYuOxAAfPwQTBwB0Z3pZszvXFqMSfYOkgp
	 TCX7V+UJmheGCQzo6ht8cAUx3wsG0Y5yklRbkUCoBxYKA1j++O2d0xpgTU6RFUHXwA1Bt
	 IACIh743zpfRm7X5LV8yo+VUsOsXbKrf1AQpjLzMi7Umt4C4kPqYY0ntFBhyZ4YHYRrXM
	 F7IMCb0TAG7t/s/+idZOW4sV7jILcjEuc+6tupf2w6V/jT3ShwOlWl1LYPNv/EsuL2Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042953;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=G+7f4eDDOti7l6j4DxKalN81tJ6bpN5qbgDS8RvWSTE=;
	b=bXm5IOW4i8jklEfwUg3YFTKW8zUPozTcAXZYF55bQsvelM7GwzBqdsRzyqJDSPKIrXzi
	 rBBWEhOCEq8WKb7xRzxFKurKwu2um4nQAmyf8uotN9UIiHV19XkiNmH2DC3sZawAFyx2Z
	 aYEmF6RhlOHpJuB/z99S1V7Ej17cFp5qXr+hHUyE9B7olDa27DTcGaYtCHF3d251fOWY0
	 pYiwnMIZkz3vPSX5Dd2TlNHCB28faAXa5S2Bl648nh0nLD8BqP8JBOJZYVA+SQGNlitym
	 wWWEfZPtST7krHUqAubChvT/5pgZxSma81iNmcanTvew7T4fte8ahx946XMp3sfBfsw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042953;
	bh=G+7f4eDDOti7l6j4DxKalN81tJ6bpN5qbgDS8RvWSTE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=n3WAGOAQEUvp/VgtncYA9KdZR3bn2cWdnztRpWDxewqdPEn5Www5MA8fRDQvg3zsw
	 YYonhcdBhIxClLbhJyvit1z+8f4MyLYsH/juXpmCV/XkAreZDp2D+jM9YHZttJFsrM
	 LQ8gXXYOUcjigtiN9pbr5SteL82E3GgTuRVkGZFmkvd1/YABvAINL8jr2aZmlV8KY2
	 aJvjXIAQcXCYRRwUkpFUgmNKYDGiYsRWFneKp2lrgqGnnTAGgQ5fQr+fecquSlZZRo
	 ReYiltF1rLa8bSNTZrAEIFq9tz5ukRA0ecVFpDpLYhv0ByMIcAht4c7R+lvXccAIzG
	 AgL3ZkusghX5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA59C60F02;
	Sat,  3 Oct 2026 15:55:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 00778476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D21EE6069F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pBTuhBmm_Woe for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4AD3C60652
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042845;
 b=pCT1YgI9032lyxIo4p7TlD3U9F79RoEZ3LXp2eWAClzPSoO2HbXnUUy+3y1uGWLJ786I
 1BYKx6pinplIQ5AxxIrP8vk+girttSQbl6UZZLvHmD+VzwM1WeHttcvfhHg7XMKr+kqAH
 PbwQluGgRLgBoykgKCNksyW6GwCxR8dAGbtl25gdi0MBbk0slJ6vq6It6eo1yT9MT3M21
 S2R6lq4Fu7xwy4J4vSGOtHxl8MYFofyjrKDryia9JND3rlQf8IMhDnj3LF7r5A/aLTyBx
 6lYrdJ//MGjEsMG5CnB/jUxiCXCloII/3weVNz3ArdzqGgG8642T7z9oX7Qy82hKqGw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042845;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=bODWv5+tc5EZtabL6zVEt0M8pidIrwqTCfd95M7XA6k=;
 b=izq9XphRRgc2gy3BFjs3i9dRh8konTWIo39eg1UrLv0q/VWXzDEIKQ/zWBbbY+IGiI/Q
 QVPxI4JjCTqjef78Q29iz7UFWzqlO8Sz0LY/4TPwRwVNH7hN4ETIpWM3dTz5lNlEmPsjP
 ZIZNDo4zPB79YYv3eToUCWGyaDmFshhv58j/rXtXafGbVGpwTjTuP+J2+52Q+Sz+2fcpD
 P+eVjy8Ip5O06hpluq2H1JoY4IxC5jcIPDg3gSimxWMnYplzmsRDXMEUPXUadnkwQh+7Q
 4Yj3Kw2MSZpCbDIDBokkoqUKLbekA0vsEIWE/Ydi/VC18vzHfLHuZQl+Vl8zH9Zmmfw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AD3C60652
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 853F68A309; Sat,  3 Oct 2026 15:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1fe5daf68ef4b4f5091e3cb6ff813bade3db4eef
X-Git-Newrev: 3af07e4e0f0881bdb5571ee4d34d801d1d49a48f
X-Patchwork-Hint: ignore
Message-Id: <20261003155250.853F68A309@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-smbprotocol: bump version
 to 1.17.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3af07e4e0f0881bdb5571ee4d34d801d1d49a48f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-smbprotocol/python-smbprotocol.hash | 4 ++--
 package/python-smbprotocol/python-smbprotocol.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-smbprotocol/python-smbprotocol.hash b/package/python-smbprotocol/python-smbprotocol.hash
index 3a73e17723..799106067b 100644
--- a/package/python-smbprotocol/python-smbprotocol.hash
+++ b/package/python-smbprotocol/python-smbprotocol.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/smbprotocol/json
-md5  fc4879f8472ffd714d6aaa986ad2dce2  smbprotocol-1.16.1.tar.gz
-sha256  ad7a31662792817c6da3629a3cfb96a51d8213e993ebd0c0a7ee750d2b1f8ec8  smbprotocol-1.16.1.tar.gz
+md5  15ead75bda29a05576b1a8d2390a7eea  smbprotocol-1.17.0.tar.gz
+sha256  bcc27edfff7d727a7eb30424138766e1ee216ae2ffc1af03dab0448f29c4731c  smbprotocol-1.17.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4c3c550abc2b04c507ed0d641dd7e524eaff5bd06c7862af957301836d496d15  LICENSE
diff --git a/package/python-smbprotocol/python-smbprotocol.mk b/package/python-smbprotocol/python-smbprotocol.mk
index 3efe8818f9..815e444841 100644
--- a/package/python-smbprotocol/python-smbprotocol.mk
+++ b/package/python-smbprotocol/python-smbprotocol.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SMBPROTOCOL_VERSION = 1.16.1
+PYTHON_SMBPROTOCOL_VERSION = 1.17.0
 PYTHON_SMBPROTOCOL_SOURCE = smbprotocol-$(PYTHON_SMBPROTOCOL_VERSION).tar.gz
-PYTHON_SMBPROTOCOL_SITE = https://files.pythonhosted.org/packages/33/76/c32681e925fc859578d4e41e4bd3ef7e2b9e7d06141f703eec032875b28a
+PYTHON_SMBPROTOCOL_SITE = https://files.pythonhosted.org/packages/0e/ff/1a86a76423210bc9558e6ea978c576b13da448644401f16ee2260d4d3316
 PYTHON_SMBPROTOCOL_SETUP_TYPE = setuptools
 PYTHON_SMBPROTOCOL_LICENSE = MIT
 PYTHON_SMBPROTOCOL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
