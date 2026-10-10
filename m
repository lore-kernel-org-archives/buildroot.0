Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6366DCA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 07:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1076F605D0;
	Sat, 10 Oct 2026 07:57:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rbJwJKRlQf-M; Sat, 10 Oct 2026 07:57:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3B1DF605ED
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791619047;
	b=MENnbELQ+uK3inqLmOGJydpLYmg1fjiMHoU1BWYCGgUacwuhyiFCs7FQ25XoQ1F4Pgvc
	 lvcXXhDNTudXydhRsLOTYhms0WVHA8jXMHUMTaFc/yh0UKAEmFABK9FS4nM5/CU9jrGzS
	 iGTTSCzrp+mHVLkzvSSBEEAepK2eI7EDj/bNgzdG14YkmW/cu0S0+bOQLL5oTUoWsgNl2
	 AEONdvuC2AIJztuxa5Q30s6ub0+sJv2UiWQ+3UeqTdg4fePdYsol7zO1XCUrYe2vsUkyW
	 lW59yfelQhPvsg7laWP6fm97rcODuoL7LDFvddiS8kVlzBldbZdVYv9s23tyZO41CNA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791619047;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wcPUdENqHajYAhTqJA862og6i5v0FZcjIWKB6MHrTW0=;
	b=UPmB3606ANYD1fkFdnTOVNzylp1TRc43kbEpFKzc+gzBuvmhzdaOGdIdz32rFhnCrOty
	 JfDAlauIwkVthap0Iy5+EAcEjxw0otLDuPG5uQqtiKh0kePNqTtFfHUN6jRCn0rqu747W
	 vqxEVbwsYe5wF3iDhobhTBGRPfDoawhotBMTK6tYKj3viajmi7MjghzCAxpTPfXuKVFFI
	 jcq0CmHaPwCXZ6wgEa6Eld5JyhmSJk0oIsgJLuOizR22qli1DQ8n6miumI1RkaAPMCVBH
	 yEqHmjKrB58tFdlDEXkhdhDLw9lxzDzW89H9NDOUTZO/LXsl+trwJiiEBy8b3RSZBvg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791619047;
	bh=wcPUdENqHajYAhTqJA862og6i5v0FZcjIWKB6MHrTW0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HXrHiDJKhoQI3BaWpUQfi0KyFwgC477c78TgVq2OtnGUxzNz29LyDUlV1PAZQ/unT
	 W7TYqgU0XwM96qh2fzitypR8CfJKdPcAy40wmQkK4QstTLL5DEdVBvE2qitjqx/q4i
	 E7BQ9TXHftMozGHi9N+FMrUgcSqFZ4BSXv8sr4g9pHRfBDURM6b+V43ysj+HcCkSRw
	 64VLqRP8qdDhb4gZ9MGPPfSM1XL0/s/QDPQmbsAzc0iX9Bx/9+2ngF8E1l8UzzKxsE
	 W8LtHPZDsVsWiZE5clMteBiBWjYZwhBjpjDx1lG2mfTS2QSIRtkA5RSLEbS4pcIOv5
	 wipIL9Lnxf3YA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B1DF605ED;
	Sat, 10 Oct 2026 07:57:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D3A9F9D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5616400CC
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PycwhV9ImLcx for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 07:57:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C9D3B4006F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791619044;
 b=XMwD+M3ZfkvxJLMdQQw2Pnrrs/GlHq8isxV5u5dgznom/raOLannD5F9alHMhVvoyVM+
 2yt4HokYCioCaT14KTW3isf8PuSOZpJLwaWFrOsYJIN7OA80P2nWH2ci1298vkXo1Hf3W
 i44a/nTPzXYXx8Ko0MCBqu2ZewzKPgBq65SValYbkU5POyBG3hcCy6S7Dd/8gXgqRdCIl
 uGPBvJDT+IKIMGwLIzqDLZ/ZA0+6OCATM3L7VCHaWnVNMi0gNJiAhK0dqG+FyMh3SRhmI
 fzOBPvq47FXxOUIAhVs828fdJviYPFDswVSXTruEGnSmQV538XBQ0zyXUwTIZQXGQvw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791619044;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Xz/CeParD91vvK1rJWbmsUawYZvq+RvDovN2eJgPfwM=;
 b=jrumjHf88r7wAk1oQrcIPJKQIZIHY2se5BdDBKcGjS4xd4Vd3Ja2kttvyYnileEEMg1I
 wA439U1pf+lI3pSrx15MfjrFO7saIesnEgM5gia0MPwZSVN5rL/wZeJ2Qfab3XOYxYwod
 HwttDE9iB8e+/Xd6/7Wyk2avO2XZ8fixwedDruKRHBsLLOvfHbgVByoCzYmzIHlBxe+e4
 jBetwZbUnO8dvm9/FPpK6SiHtOUOJbhViRZlJ5hMF7pDGgdrxyWkQ61bTdBfOvHCFQLBl
 2qivNjkQJ4WdKI9NNcQq2wa1D8v+Aru6d/hQM+R7HuLhvpfnw3K2uQ77binRnwdhZHA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9D3B4006F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:57:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2C6B8ED84; Sat, 10 Oct 2026 07:56:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 09:56:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 213ee34f03d70e0e31c93f29aed0bfe0648c63ed
X-Git-Newrev: 6f1faa2095853a05a877b1246b60b899029e5197
X-Patchwork-Hint: ignore
Message-Id: <20261010075606.A2C6B8ED84@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-engineio: bump to version
 4.14.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6f1faa2095853a05a877b1246b60b899029e5197
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-engineio/python-engineio.hash | 4 ++--
 package/python-engineio/python-engineio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index 05e222dc4f..9057981efc 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-engineio/json
-md5  724a0e786c6eb7ba9c1a03fd58b719ec  python_engineio-4.13.0.tar.gz
-sha256  f9c51a8754d2742ba832c24b46ed425fdd3064356914edd5a1e8ffde76ab7709  python_engineio-4.13.0.tar.gz
+md5  0fd780d7f07b5007be10e3687ff8d7b4  python_engineio-4.14.0.tar.gz
+sha256  eaa1e386baf9c2c7959eef7f9d9165c5ea910c5b392f5316e78d29ed073cb43d  python_engineio-4.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index 76ae166970..68604bff45 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 4.13.0
+PYTHON_ENGINEIO_VERSION = 4.14.0
 PYTHON_ENGINEIO_SOURCE = python_engineio-$(PYTHON_ENGINEIO_VERSION).tar.gz
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/42/5a/349caac055e03ef9e56ed29fa304846063b1771ee54ab8132bf98b29491e
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/fc/65/f8bae11b228647e2e2f45b63dec7448efaddb7cb51f529de1fdba69e63b5
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
