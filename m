Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0131CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89B6F606A2;
	Sat,  3 Oct 2026 15:54:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WR11FcU1lWiH; Sat,  3 Oct 2026 15:54:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AF32A606C4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042872;
	b=mL8QJUIzqwBTyR97ldeokRCHrfE+v/+kj2aVNXIHVWDH0Y5tgRwPLlA3SmPSQw70mIVO
	 P+XY1ZvAdLaXQnEapuEyY+VIgZFmDO5iox8XNUN9OAM+5u2905bTf6whskcWsg+FqgMWq
	 v4gSH6IRzMEXAp+8BRcDIkgasMpl7yYt6jyirBa18Kf+KuRQM0xi6asPfZLd86XdOL8hu
	 hCR83ElFUiR4zUcjH8LLupGjYfTDd3W+mM1JhnM5eLRr3XtgGoTkIIhx5gfnFB3cRkVAp
	 vM2SCTTqZP+r8D99GNzaIKoFseKUSjmgVjDKT9iLNnbdbOvqPGYR2lgGdU80teRiIHQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042872;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XkUBQQsRM8cR4LItSEidRGtqjnk0cnkrtV/XToQjwTU=;
	b=sHo9qt5r/TWhHytA7evSJ1MszrenGTiNvBdSvL9Wj2shD9eue3SurJ9OddOtQGKsAjh+
	 7jN0Qm4falc1ip2bH74CZHBI4g81oHJxAFynUx2tgSL0///7cD9JgpPyz+JpNJBdGslnX
	 z7Y7hr0Yhkaq0EDAJKepBJLOqzuYSh3Z3Fb7pENmM1ZVU+Uxc7d74HyWTD58znNkAdD38
	 XJFzMmfb1OkCwHRUeMKayxdIzMiYpTrYl7O0t1YAo4pVM/ysYEsIjsTZytHoImsOAQO9l
	 M6KpDwqPA6v65lsWOFn80Xc+eQEI+wV4DeD0I2yNO/9/nBRSVm42PMq27yNBvOfGGbg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042872;
	bh=XkUBQQsRM8cR4LItSEidRGtqjnk0cnkrtV/XToQjwTU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hvmmQsDbjvsElVvtiHOS/smTuCHYUBZHF0X3L0HCeVJBLStuRpYcmlKyjhenZGb57
	 x95R7dKGM4lQ/GzmhKbVlqP93iIlnN2ItX3DSHjoz+ScYw9YgI/RlFjnP1h1O/0XIB
	 pWvoQPpr8+0shfbqM6MqWu30tQH/rgjwT687dKHCcI9BkTeP0Y2d0FusqOpjqCuOHq
	 dldIIJagTHQLTSmMAQu/Kq2I/hFqJWTqugkPdkQCHhsCXLh66Phbrced6hZ3RFf9hh
	 tUT7/S+WZVLApuIeYrdkEJ1+0PQF28rjVGRZSO86fDsVDgnthlTmId0cO4tE5VL7ew
	 ySXAdjTzbHV8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF32A606C4;
	Sat,  3 Oct 2026 15:54:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2037C9DF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FC0D6069F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gurv5wqN_cCl for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B9E3560662
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042843;
 b=mvPOK/sKgNm2Qn2qYd4UunX8G/5AuMILQAzaW+C7fElQ6vvhDCPfh1wVluEvenEViZgg
 sHIapdTrtoxHl1pjgH+w8traHhYVvb2FMQrG0Pm5lkfsMm4rZ4I+si3SIwRKHZEJ5QisD
 bKnHizHM8vjMTZvl0eOkUa3C9kXcIV7RRzemSAUQxrCcnLVsmUmavSHoW4zY1DwUXs3mV
 wfrko1GRUJq150TLMAX7eFnxam/f13hAoqGqu0oiXTlbW8rOPjcE4eVqiOMnfxuImYkG7
 2beN01gv4q4D7gkHa1161UJczU+Lp7X9ij0CEgBGoeFq76if7H+wXqKLs74g1HfQCnw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042843;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=is4oPgjR86/WtGu1Cxd6o8ZV3UoCC6b1NI4ytknl/Xo=;
 b=HIvtF6E92LVsIKLXXRocrz8hEFu0jJGtoqljbpQSOlJo5FXrPTvPRkXzMFiqIE9KvNUd
 bealH48fPEdX/f1bvgFMrela1ATythkv/z6D5TsMUxgQkJoSGqNAfgErCuoUjbZmGq1kx
 vgWJLDw+lx5wGCmbKte9bTAyb/YWl457OZZCW84vh2JhaZ70sQq0ckUkF5fkSUinrZuCN
 C/DuX3WIHZ1ucotyM4OghjDkdeWWVUtyyBI5jfDOuW9N5INuAvVrmNfGS8HCmXCzaDefP
 ze3nZcjC2C7xgjq4/1OxuZlswTKIkGLYDr9Ovrxlta+5Jj2gHBO4NrKs3Ac0lFMTehQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9E3560662
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 075628A309; Sat,  3 Oct 2026 15:52:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9bc8ecdb710307a5ad6f2c98596b8029aece5fa
X-Git-Newrev: b5f11cd82dd0c599dab859f01dd73219f954ca00
X-Patchwork-Hint: ignore
Message-Id: <20261003155249.075628A309@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-zopfli: bump version to
 0.4.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b5f11cd82dd0c599dab859f01dd73219f954ca00
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-zopfli/python-zopfli.hash | 4 ++--
 package/python-zopfli/python-zopfli.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zopfli/python-zopfli.hash b/package/python-zopfli/python-zopfli.hash
index 6cbde60ae8..2512d2ea10 100644
--- a/package/python-zopfli/python-zopfli.hash
+++ b/package/python-zopfli/python-zopfli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zopfli/json
-md5  ea5d84d9e8c5d02e7835691667e0890d  zopfli-0.4.1.tar.gz
-sha256  07a5cdc5d1aaa6c288c5d9f5a5383042ba743641abf8e2fd898dcad622d8a38e  zopfli-0.4.1.tar.gz
+md5  8978ce1fd86d28d2bd65ccbbcb2423c6  zopfli-0.4.3.tar.gz
+sha256  d3a50f91a13cea9bafe025de8fd87a005eb26de02a4f0c193127ddbf23ac8ebe  zopfli-0.4.3.tar.gz
 # Locally computed sha256 checksums
 sha256  018b1cb87efdf7a04c2fcc13d57ed63f62149113fb207b27ea13430d64f13513  COPYING
diff --git a/package/python-zopfli/python-zopfli.mk b/package/python-zopfli/python-zopfli.mk
index e914e1dae9..6999c34206 100644
--- a/package/python-zopfli/python-zopfli.mk
+++ b/package/python-zopfli/python-zopfli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPFLI_VERSION = 0.4.1
+PYTHON_ZOPFLI_VERSION = 0.4.3
 PYTHON_ZOPFLI_SOURCE = zopfli-$(PYTHON_ZOPFLI_VERSION).tar.gz
-PYTHON_ZOPFLI_SITE = https://files.pythonhosted.org/packages/0a/4d/a8cc1768b2eda3c0c7470bf8059dcb94ef96d45dd91fc6edd29430d44072
+PYTHON_ZOPFLI_SITE = https://files.pythonhosted.org/packages/74/21/3b6af43a663b22b00e738bb0642931a2579e15da6852613d56c6aa535d28
 PYTHON_ZOPFLI_SETUP_TYPE = setuptools
 PYTHON_ZOPFLI_LICENSE = Apache-2.0
 PYTHON_ZOPFLI_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
