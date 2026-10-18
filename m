Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5318CCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2F92606C6;
	Sun, 18 Oct 2026 14:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KTf9qq72ZFwl; Sun, 18 Oct 2026 14:24:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9DD9160679
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333481;
	b=EM7fj2EnePblDFSB5qhZYMbHAGDyZpw1/jO6QvASDxg8/iCCbGTGiJ0dQhhgCaNO6KjQ
	 bxU2Hhw/TqW9VgZD8XHcrM8UOK6jwjI57e/7dv2m69gJwK+bPgofyuuKGNeCCmtcMe0Tb
	 2HxFRptZftiovFOMnQ6TruD+L834u9Dk5DCZzIaGPjbZD+00FcFcvVBddmmQbEfg6r8aQ
	 owMJ1jG08YYkEauwpqrLvYLkiIAcWKlUw0V+Ttdxt1NGC13UjWCrbV0dPjeSgavlb1JZK
	 kNz8lkFmxCxQGfQEC05Js/xekekG+mSMqY/dJSuebI4tpJV6VID4R1AO/FAkMRLvRNA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333481;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=M3g7wmVQgj+2wJOQFgumC+6lhmmYUkVX6E0hsmopEak=;
	b=czZipL3cgVQoyfjJHhFpDQhA72R/QkmIyQGeQdRBAQnZ2H51M+nQzN0aEJuHlx+cXQy0
	 8nXx6/CJxxPFKp/HdNiGg6oseekRa9MtJZd3iNdN/P8PF8gOtYLyr9Hfr10REytYlMI7i
	 sQ0GiJ/+phJ2+zZtXpUpEPXSHX/2iRye6VRzSHKLyC8PAJCvmu7CybU1zpsG+qEVr96UW
	 i2K/+h6EziiODXN/ESkvGlfZDCTIsBsRbL07zLdW8SXrG9IkzaOO67uHretiNPDu6lrJb
	 2iTGMz2Uh+jHoUdB7vb73lOcptxjgtgR54Cvz1cyLdObNx/QFJH2LA8FE6+/m5p/tQQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333481;
	bh=M3g7wmVQgj+2wJOQFgumC+6lhmmYUkVX6E0hsmopEak=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sgCA4I+6ZQxKrXanSnqCuob6dn+t4f6BxEqhr2dwrcP423G/HUjTTC69Qwcgz4A1H
	 SXSTR23TtoUXoURPkOAU7ijrobWiOolBu7zhqXP0OGPj0eFOcNcK9ZL6jbBzZyG0Uf
	 9d4eAuJPmLG1L1lpJL7U3+wREHhrjLU45Op5bMRInaNYb+Y2D2T2GAJzQzz1eBCEkK
	 wxCXp2L4Iibj/icpzehI+AHPS+nVtU6hSmjLhlLacZHGU9Vs27Le9oRLHE/TFf4k5+
	 KvWp9/QXBgAFYgwDAdd0XVqOxqq4ok8Wm6AT6eZ27n/GaocM9XR3H2F2WCg/fxJKN8
	 Q1j08NocwxAPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DD9160679;
	Sun, 18 Oct 2026 14:24:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 87541255
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79981400BE
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KkIboYaqEsun for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5B3E4401F0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333466;
 b=BWsIdvKMj5FepCsuIkR8HjUi5rHA5jCkdqati8p/jz7L22lwcgxOqmK1a/rslufOIklv
 4298wn3HpjicgLObOLy5Wxndf7NpkAChcKqomBAR0maB1mBeVDSAmKraJ5ELv8/yd7vli
 XhKF6nwf/lM/c9GZybcbAJl2sFw9SDmQ1hIFfzmYHaJb9Va1tQwM6cXMpP0yw2etS0HBE
 Vc8jE3yIJIzejVYhxJlW/imUWH0DD/HeYdRO23lQD2NexagVHUG4Nxcjg02S6Jjk7Uu+U
 lhe9KA9RfrzxXNNzLxHXVYfCfXZjQOHR3CG51P2VOFQ9yzVy76YHFkK3Cex1x9FcAkw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333466;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=BXpko0yfalB6HfAlsSh1sRi1TvQV8YAR3Au8QiW3IhA=;
 b=Wrv2GFrN5zZ0E9NsoNiW3AdZM1Kjv23JLyJkky+cjUeSDZFiEZ8jvBty2BBwlGxzUaVy
 AHxjaztlCBrY90xYpi35LKRv0PeXda6gV0K52kF1oxV/qZFdf3kqhJ7SOlbLKoYzlpeSd
 Ei6t+p5BozgS2xtd1W0fGMIpw7R7FOWpLNGODSgbrvMG9eZueMVgW2L7IqDAEf7xm0VXD
 xHJgSDIw5KjmG1E11p3mOG1Vi6LuKnPLKGciFlsxx1pO2/Eutb0Qg5S+Cl6ulb/fk4o3L
 PFqSGi+4WHYy2nGDjtvAvIarg1M86CEIbIZVJ5McRLgwq7TcR/OsHZ4VglHI+tUuPyA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B3E4401F0
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A73098283; Sun, 18 Oct 2026 14:23:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 15:57:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94e49af88213d1eabca8a5772a1c2bcbf12eb6f8
X-Git-Newrev: 1f4d6e52effadc77a7791625b6e32ee8cf0647fe
X-Patchwork-Hint: ignore
Message-Id: <20261018142304.4A73098283@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydyf: bump to version
 0.13.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1f4d6e52effadc77a7791625b6e32ee8cf0647fe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pydyf/python-pydyf.hash | 4 ++--
 package/python-pydyf/python-pydyf.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydyf/python-pydyf.hash b/package/python-pydyf/python-pydyf.hash
index d2f3f4ed66..f9101db409 100644
--- a/package/python-pydyf/python-pydyf.hash
+++ b/package/python-pydyf/python-pydyf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydyf/json
-md5  d840ef400aec3a6c8018eb76f361a251  pydyf-0.12.1.tar.gz
-sha256  fbd7e759541ac725c29c506612003de393249b94310ea78ae44cb1d04b220095  pydyf-0.12.1.tar.gz
+md5  dc4d366f8847273460318019483373ea  pydyf-0.13.0.tar.gz
+sha256  3c1bd536c7161d9f472b82a8aaa27d3359a9058ec12de15302d92b3690dae7f5  pydyf-0.13.0.tar.gz
 # Locally computed sha256 checksums
 sha256  75461e438973e1ba0f93a7de9e3fe5b2f49e1ab49251d392878a9cdae8ce7e47  LICENSE
diff --git a/package/python-pydyf/python-pydyf.mk b/package/python-pydyf/python-pydyf.mk
index 8a22aebe22..dd5f987919 100644
--- a/package/python-pydyf/python-pydyf.mk
+++ b/package/python-pydyf/python-pydyf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDYF_VERSION = 0.12.1
+PYTHON_PYDYF_VERSION = 0.13.0
 PYTHON_PYDYF_SOURCE = pydyf-$(PYTHON_PYDYF_VERSION).tar.gz
-PYTHON_PYDYF_SITE = https://files.pythonhosted.org/packages/36/ee/fb410c5c854b6a081a49077912a9765aeffd8e07cbb0663cfda310b01fb4
+PYTHON_PYDYF_SITE = https://files.pythonhosted.org/packages/67/1f/3a10f8d2d106bb68330c43a5cd0faf922d1816f65a1581f35015ac654a79
 PYTHON_PYDYF_SETUP_TYPE = flit
 PYTHON_PYDYF_LICENSE = BSD-3-Clause
 PYTHON_PYDYF_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
