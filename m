Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA64FCA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E9106068D;
	Sat,  3 Oct 2026 15:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8BOZ4BrEjh6H; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B7CEC6064E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042850;
	b=nB+2eEs81lpPBWoP4esViOdPt9m13tYcB+mMFLEvHIr8B1MPx5uIcGhHr6P2cNtGVKzC
	 KYDmWPEfV9/odkdvW5IOVkyVGzNXtJvurjDUXhyzeiJHbpQBgJ6r+uc69M0lCXVZqquDn
	 PqSWaRP8xHEAkyQ4NYd/073lSlZIOZJNF8+DFpzUEbiLFyAUOH15M2AVXW4TDJtTvsETY
	 af+lWXwXgTLZUrc2ieCUWWDjFDz2ayF6Ltrf3Lo2Xty4rYs03SLWq558dxRcU4u2VE6o1
	 cz60tjHTFXjgsOmwbVkUbQLDwuoxXtrvis9yirP3igtNipr8E+T3ylQQqRLRCHRuZWg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042850;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=g2RDFtrktwEuNPdUPEUY07ksc7Fspq+Udwz8kWBQ9yc=;
	b=tJAUl2+1ZOh5PpQTeCGiaAuEWfHd4K3tPmxOlHiEel7a3U5M96kN0CGViN36eOz0jWPJ
	 48FLCsjTUSNt7z5ELVEP1zktoV2XPByQ7FXy6GZRbn3sNex8wqQUOqEOcLECLSfIaM9Fk
	 e4fnr+NL0xHqYODrq0+iZtt3nyLM1nl5PDqjHAaC2XHhpJIMC8+aqdBYIsFykm4J9OdVU
	 aRXiNMJi1gShToV4ZvuUV51fkyxS3Quwbp6oeti28IJBx1j/1JQZxyohRweRMO+L1IyAC
	 BnSk8jZ/RwHgJcYDCnXwByregyLbpXisCHWceRntqhVJqYUYPLSaGKGelvBL9veHTug==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042850;
	bh=g2RDFtrktwEuNPdUPEUY07ksc7Fspq+Udwz8kWBQ9yc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ms+FIUA9vbdDynO6QUAStapScOMTg0BJM29Lwlv4zdpUmwH7kdQi/GtAOOkJMkO9M
	 KxECFUAefWBXHjtDMtNJ3mRsgRV/6LuQ61QibxznPo+vwZ0jzUY/nDdZ0vObhuLbEo
	 d3ltgl7oU9wiLp4m3pHqiJ2IktFPOHF9xE8O/g7uBQcm6CaBZ6RO2k3+zEz+RkEGY0
	 3pD70wc846eofcwKrmHpx2D9UQZSfrzlEyo4VW4eL5M8bu/KGk/8FkM2spnUsh0MMX
	 FFCGJmv8qOAmGSzm/67JGiDJTSYpXaBQXo9OO7hwZSDfPDRl4qedt1bLLhXKUG+u+W
	 8LMvStZL7mQAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7CEC6064E;
	Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2684E476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2456760683
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PLK59ar1zYvx for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6E89360603
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042843;
 b=bbQ23CKTVCAaz4Zw2cJIHTHsroiIffBiHxWO7U6lxDrK+qjGMsxqhaYmlsO9Q8Juiule
 U9ybLxoncUUcKGZthbvy0EuHqpF2T97LOkQgpkBrZee7KBbDfZ7UEU5w14+XNU/pyoN+K
 anqxiFGkwxvmQynk1lYDk9c3OUDMBeQ+wgW2mVxpQRjinkEnScUM68FHQg8b3/9BUlxrY
 lyCpoLxkMLdCj9TbW9Ay/LHB8p9rIGLDyV0l67HL+i/g317HcQxquRApd78+Jrn3CGy0J
 ODeBSFoIYsM9R7Boy2DX6SX1OtNZW597OeQcMRwh7YQGyRqN0dgL/kLJttK36s/Fc9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042843;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=P2V1e0BQT3J9s7eVKIR/4s06xhajvIApl3KYlshdgOI=;
 b=oJJUy/Sttz19VuAm7vBmw8QKO5kuNZnDBlRh6reShboGAO0SWR6DQBnrTsOLWYLfB8Y5
 fZxxLzzoGKOCbPxQvmCMr+9niIttuew/5LuIn8/b8Hb6UNeymkFuO4u3DMcvg8C01Cmb5
 DATqhueK77AzZ3JZ1FHQvpMAW2iCgIhtyCLjCa9dV8N/muIoBIvajDwCWCzKDv/NbWj0d
 x9aNlrOf7rdktJP2VE+aoT7t1Vi5GYr+SqtewXvemmrT8p5zdSyxZhwEMuhX67hA729sf
 tr88dn56ifjoSs01fUmGnS/sEMNzpAGFqgVeCjppBgOzd8F3sr8YCtLJnL7YVTpoToQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E89360603
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AFE308A31E; Sat,  3 Oct 2026 15:52:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 16:10:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69f0e36ee04488fe165009f5db4b426663b85495
X-Git-Newrev: e69bcaed4b4ff00154b85f1e34728ad9a558b722
X-Patchwork-Hint: ignore
Message-Id: <20261003155248.AFE308A31E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-weasyprint: bump version to
 70.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e69bcaed4b4ff00154b85f1e34728ad9a558b722
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-weasyprint/python-weasyprint.hash | 4 ++--
 package/python-weasyprint/python-weasyprint.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-weasyprint/python-weasyprint.hash b/package/python-weasyprint/python-weasyprint.hash
index 6c482e0445..a2120c93af 100644
--- a/package/python-weasyprint/python-weasyprint.hash
+++ b/package/python-weasyprint/python-weasyprint.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/weasyprint/json
-md5  be6662c500fe803df4f2d1bf512671af  weasyprint-68.1.tar.gz
-sha256  d3b752049b453a5c95edb27ce78d69e9319af5a34f257fa0f4c738c701b4184e  weasyprint-68.1.tar.gz
+md5  bc6f55c033f3013f418f672991f4d754  weasyprint-70.0.tar.gz
+sha256  c263abf0e86c747b12af678b67f85f4abbfb97d18a20503031e7ba94e4b8cf8c  weasyprint-70.0.tar.gz
 # Locally computed sha256 checksums
 sha256  bfd14eccfa6100575460e685556b183399d4bd335904e3c9521b0116d21c54da  LICENSE
diff --git a/package/python-weasyprint/python-weasyprint.mk b/package/python-weasyprint/python-weasyprint.mk
index b36d96fd1d..c965348b94 100644
--- a/package/python-weasyprint/python-weasyprint.mk
+++ b/package/python-weasyprint/python-weasyprint.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEASYPRINT_VERSION = 68.1
+PYTHON_WEASYPRINT_VERSION = 70.0
 PYTHON_WEASYPRINT_SOURCE = weasyprint-$(PYTHON_WEASYPRINT_VERSION).tar.gz
-PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/db/3e/65c0f176e6fb5c2b0a1ac13185b366f727d9723541babfa7fa4309998169
+PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/8d/0e/461aeb736762862b511034933d5b98d68f812431b7393b026d9ace5f6b42
 PYTHON_WEASYPRINT_SETUP_TYPE = flit
 PYTHON_WEASYPRINT_LICENSE = BSD-3-Clause
 PYTHON_WEASYPRINT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
