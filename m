Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F91CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 794C060FA4;
	Sat,  3 Oct 2026 15:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xuWWb5gLdadl; Sat,  3 Oct 2026 15:56:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4BEA060F74
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042979;
	b=OzNe09ffzEpt/EUQLp4WzbQ0msPfH2Q16A7CQlQFbq+vf9s6peXIznOX8QpZPO/yjfY/
	 OEiWBJBPL5vI6gEcL6J9WMo6jYypAAJxKhefRVGRFZiyS4oCTXRqclaMMuszpPPJC26Q1
	 lQtEPFHBkpZp2biBsh8KDysjP6rA/+fsLnYL8FjtrJnWfersFPgROywxXMn49/2gaTwLG
	 6r94Fdq2g09PCwl2RKjRs+gcQdWWwkcbZ7u7cJBPcxSOs1stnOt36/917sbxg5SJok3zn
	 AuGAxSnaS9kOwzb6sIJ6DEMYkCMkK4kc4V+3FMudaKc+3bLjeeyoUYwXau9SNF75ezA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042979;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=OVKCyq1jrSgRlmCjq7dCiEBHdWTEXjHxIWnMfjHbf0Y=;
	b=BPnd8PPX1QfHvOYEqYO2NZmGfOD+4Kp50iXvEk6OhHDO/HW90E49QeW1uUJ/T2PYF7S0
	 5eZo+ELaI39MLFXnaYm2bp6pATU12C0Rs6UA/SKhgmUZOyEAB2LgHicPx6pi4GsqfFQIP
	 KLm07eChf9eQUWqpZa/rb8Qy6sDSL9ZQLikn6K99lJH7vWOiP2/Dh2//mcq75i6bAynWG
	 N6IpC26Fzy9zxujSZW1rdtjNInKeXr4pse1+wd4sJkc6YvTLHczq4pMIKVuqKaWXKK9bm
	 d2e3dNPYAQFoGQBB+jKC5g7Wklclk6Ke1+fxRWT1++ydFVHdEg4bICdPi86idZz8gjg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042979;
	bh=OVKCyq1jrSgRlmCjq7dCiEBHdWTEXjHxIWnMfjHbf0Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eFUkGDyOoTEKQD59rntS0gAE64JBvBO301ONRK2pGjfHtAMNstxRKaDodHVbkIccj
	 s9GQgIqUYVDzSguh5YzYSTMBe+s5br+mMPuYQTH5/fUgmbxLPIXlxz61aVF80rnzu/
	 yaQs3sgsi4s1JA6LNXbXBG0PrMfBP8uwolQWsBbSSMmG+/mOsBK/OtE6fIhaGHGoh1
	 pXrT7aU8MwX/GPxnqGZJhmRbpNvt9PZfGuev4E6PAVy8c6Yb+d4Mz8OkH0Kb6e+JkN
	 lEv2CNhNY3kuCHHkkd4VIf8rbUBqVhDNjNFCos4x/DHFYYtiAtlpZN1JuHWp+Q6/5q
	 cERn8PAcOKj6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BEA060F74;
	Sat,  3 Oct 2026 15:56:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F5DE1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80DE36068A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4kj1WDEX6SQH for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6307E6063A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042846;
 b=YcVhezd7tprcp+I5nupdCrBYFSjXRnEP7ojzuAcrmDb9fiAsD73N08yDy0s+Pzxxat+k
 gsVnfyuPPKOkfCGURI8iieEtooBOKlTpsrAcz8i3JBNOyYIr/SlM70lgWaEE9HrYcYPGi
 IneT+W86KywoKAxWx6hRhICVeKvaFwFsoc/+9cZAl1ptf0SLJgUkjXdZIFwnrZBXH6Xyg
 m9eEanCm7x3UAe+UaDX+QOpJaRnj9/uW+Lnj1fEzYn4o+oxvfC30Vxy3AiCDWY1KOZmCV
 NPnFUCoJjMCtulpF4qO3hXc8Q/GrvtJNzbpXMxCzogckoL2vwPIBXCgQaPmBxBpG1bA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042846;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=YuVfNWaENBcZQ2N4ZckcvV+iJfYxO4aLENowUlxKRpQ=;
 b=XhnL8SB0I1tqkYABEHP5+eCUycd2o0kC4YrCTsoR+wBGIyr69Yq7RibvjXsqKiI2Uzgo
 T5X9WZghSs60+1HdSXfOS44m7yodgbrmx7pG2cQnSnI9WA0KhlyZ4oEaAaLeQM7kn5VgU
 HF7eYRx1cGOwGg/GwMf1f0huwlV+iaFZ1/uXnJv0ZO2PCEvN8t7mK6BwiATK0z1bAl6AB
 tuPTP85q+Y7TaEkWXUH2QKwgNg16F+OX4cW3RjnVcDJAVxrb3cgYk3SA1WtOYL1UwOPuM
 ojenHKerPQ66yTgy20mxSGQkxjz2uW2CVQgj1lg5Dlmv7vVaxIscpc0FsD7GRGw/0/Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6307E6063A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3FAC8A58C; Sat,  3 Oct 2026 15:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f9e7d67ad7d962502facf60afeed2a937efe220
X-Git-Newrev: 612d7ae0a356a8f531cb877451a52c3ca2617d40
X-Patchwork-Hint: ignore
Message-Id: <20261003155251.A3FAC8A58C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-charset-normalizer: bump
 version to 3.5.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/612d7ae0a356a8f531cb877451a52c3ca2617d40
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-charset-normalizer/python-charset-normalizer.hash | 4 ++--
 package/python-charset-normalizer/python-charset-normalizer.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-charset-normalizer/python-charset-normalizer.hash b/package/python-charset-normalizer/python-charset-normalizer.hash
index 1094f419a3..6a15683e1c 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.hash
+++ b/package/python-charset-normalizer/python-charset-normalizer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/charset-normalizer/json
-md5  cde800b3dada84f6041196f40f4b2ad1  charset_normalizer-3.4.5.tar.gz
-sha256  95adae7b6c42a6c5b5b559b1a99149f090a57128155daeea91732c8d970d8644  charset_normalizer-3.4.5.tar.gz
+md5  45256d816357f60e3e1880c5aa54a8fd  charset_normalizer-3.5.1.tar.gz
+sha256  6117b84ea48435e5356dc737f5121485c30920ba43375fa7b434fd753df0eac3  charset_normalizer-3.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6d0d41bfe170ac6c7dc248c9a63e254d0fb45a60d50a8257d0af92c6e249b887  LICENSE
diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index ce91028b31..c2bfcc9e71 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHARSET_NORMALIZER_VERSION = 3.4.5
+PYTHON_CHARSET_NORMALIZER_VERSION = 3.5.1
 PYTHON_CHARSET_NORMALIZER_SOURCE = charset_normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
-PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/1d/35/02daf95b9cd686320bb622eb148792655c9412dbb9b67abb5694e5910a24
+PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/e5/3f/143b048436775b0f76ac3eec145c019e8173ccc2885c8f20319b996d5e83
 PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
 PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
