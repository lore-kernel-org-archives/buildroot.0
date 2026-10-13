Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F5ECC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90DF980A8C;
	Tue, 13 Oct 2026 20:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kY2e5YiY7Iiy; Tue, 13 Oct 2026 20:53:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A908880BE7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924782;
	b=PVRkZdwAvIiVFjOX97Maf4thwWFGx6XeEiII1C9EZuprxDZgTtGJYnAvLYoMJtW2skpU
	 b4Qbpx3c2MwlGT+PMPWKPopvwXJGUvcfT0GF4zKYTgIS/isPNNQhecilR7n2qWMTwL6H2
	 nn+nzFh+7T1ikbtOb9a5g2XZd0w9jCKCRGbkmiBc/yk4RR/U8TOrKEQYJUbUeMTXaRyKz
	 TqYB02T3gX50bgzcJrFTKFtnp5jFX1pqmHP0pyw4h6d1FfVuPAZKIScAx8dsB1CRo6Xlr
	 rkdFZBlbUb6rAlZGtTnUgRX/mSlsVQWZYNPTlHRM50B6JOAmEPgWiB3YfWt2YKJT3Ig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924782;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5hQOS20kus89f3v025xdcZiHHwnHoPorQ887qMZaphk=;
	b=Liqes+kIk4m2pZgLnGHp9+KhIyR8lpN2XTOQFz6zWnv9NlphZEaZp6Ups+yPqdFYLg+8
	 mfdGPat1A30ynFm/2C4aZQfsrrQpRs2H6qeZAKjfy0WD/74AqzSCtcqz1kxumcTeBxCcu
	 /clIjTR7EGzQtbgMuNC6z2miDYyOehEewMkv7HBBSPIeLqgmw/8HhuOmvdPEMpPTa8sQa
	 CJLLFQEnPM+WHNihcW+QLiQT8Q2lGarMg3nOoZeFd08AYay4VMao+5TjPt86bdT6Z4wzW
	 PeA29effwS79F5VVYBIV7cLhGl3p8iYOm+vrsh3YIeugxzUFBmBS+qHSDELdt2WmLZA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924782;
	bh=5hQOS20kus89f3v025xdcZiHHwnHoPorQ887qMZaphk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bb4lIJ9T7QuNIYOkqe7nSKAp6DwLbaRqYzdxMOL17vPsGHMudEA3B3lzmbx5URVAI
	 C45H4Jbqmn/uY7TLsbknxjv7tkCnmcdFDBSuLHlPUwJFyg7Dugz9lPhInyDjilzvoh
	 duwnhrulL8ok9FDl6RoXqj2nsXRHpTYmkiWEZEGDaczNctCbPfHlvLrNXQOn/qCzX8
	 39GwWUMj5EWEq/7WwNFcJUecIXXhKOFEGE31tSFkpfGcd5uVjFCihYsj8RXVI0Cofc
	 ojsbHL4cDvaHX1fxbYsHgnHmvNhBIq1/5uWS+7Y9tihGwMm6QxLmRWWX0jsMvzXZF5
	 h3Y/hA75EhcYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A908880BE7;
	Tue, 13 Oct 2026 20:53:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CC7643F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EAA14062B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ciQ02SE38GT8 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9A226405DD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924746;
 b=Nslp+spBWnrA9KJX8PEYdhxeK5HqBNplUdQ/DgQ7BU3KLVR/D8WHg3aNOTpwOKbNP0CL
 wj9176JdVEBUPA43kecj1gq/7ryBGTZCnw85uujRMctmgVMAWZ4w3JXPINxRcZxTOMO0l
 U/pK2BNMDy907e6Vo8XQnrLnd1cdlVjaZBNEnr6sOA6AQrxLqbnNSajf+GaBbOxOChUlq
 CjiNhUYyBkyYT3q59oWxuZEn4yHJlByincnXAaaJYAlGtJ8ZJ//yA1gixDY/LV23ean6t
 85GgZfLNVZqo39LKerW6gbirmrzZJaNLMRY3wDG8U6oXl4Kl/zfjJVAszcLiRbTtTkQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924746;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Pf5vK0E/o7AWYUBCx6155NOeSC5Ol3YdVDvCGnjUTpI=;
 b=GLrNcHsy+4ebPFwvP/D40khESexZhlm6XMkllqQGPAfe9zodYa0/13amoPYAXNffNnGX
 R+w2dmWYOQBtrCjTSLmgTds9ZgaT3ubOfUEa675v4dcaIinLbjOsuHgTwsiyXsA6dpM4o
 qUVROpeaTdEzJUzXNOoMnXRvtRjIWuUuBryiKxzbd+h46t2cLsGlxmunAHWdpn5sui20o
 LmQhnc0+NaL4KPuiqb+L4JHMyZw0Dtd1Hi3nxn+JajmfvChuN1omI5pAQSkBdwK9zO/Ij
 OmX2OqXOVw7vYe+o6WZhv+caC2gUftvzEQJvmG1BkDZRDWsZdzFX8CsZugvowgQhonw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A226405DD
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4179956D0; Tue, 13 Oct 2026 20:51:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:43:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b2cadc26be6259b0c874446290544da76d9a683e
X-Git-Newrev: a22a140461b1c72695847be61308d67a4ebcfe61
X-Patchwork-Hint: ignore
Message-Id: <20261013205106.D4179956D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyspnego: bump to version
 0.12.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a22a140461b1c72695847be61308d67a4ebcfe61
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyspnego/python-pyspnego.hash | 4 ++--
 package/python-pyspnego/python-pyspnego.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyspnego/python-pyspnego.hash b/package/python-pyspnego/python-pyspnego.hash
index bec18ee01f..59eefc5d28 100644
--- a/package/python-pyspnego/python-pyspnego.hash
+++ b/package/python-pyspnego/python-pyspnego.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyspnego/json
-md5  5e85a37c48b666c15928e9102dc1803a  pyspnego-0.12.3.tar.gz
-sha256  c4982c9f92e6aa5979c9d9a142a21339ff82ebcfbdb4e0649320cb050961a3cd  pyspnego-0.12.3.tar.gz
+md5  119c0aed13eeeeba75debc0e1d54929e  pyspnego-0.12.4.tar.gz
+sha256  acb314d6ca5c9ce87994b1eebbe2d8b687e0d564f9d650b306afb4c8f9c2ffd5  pyspnego-0.12.4.tar.gz
 # Locally computed sha256 checksums
 sha256  286517c93031c343f809f64b38563a783614b762e1367242af6cdd4107335471  LICENSE
diff --git a/package/python-pyspnego/python-pyspnego.mk b/package/python-pyspnego/python-pyspnego.mk
index 312eadd9e9..3264eb26d9 100644
--- a/package/python-pyspnego/python-pyspnego.mk
+++ b/package/python-pyspnego/python-pyspnego.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSPNEGO_VERSION = 0.12.3
+PYTHON_PYSPNEGO_VERSION = 0.12.4
 PYTHON_PYSPNEGO_SOURCE = pyspnego-$(PYTHON_PYSPNEGO_VERSION).tar.gz
-PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/fd/8f/30bb9568554899a6147bed657762a3c707e2d3dcaabf3492161cc9550bb4
+PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/4b/58/d7c9cfdf1394a8b4d85ac488888814b28d26c4bd732191bd4169687cbfdd
 PYTHON_PYSPNEGO_SETUP_TYPE = setuptools
 PYTHON_PYSPNEGO_LICENSE = MIT
 PYTHON_PYSPNEGO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
