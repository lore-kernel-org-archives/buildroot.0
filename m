Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D08CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2189605F3;
	Sat, 10 Oct 2026 20:23:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gSJb2WhofKhg; Sat, 10 Oct 2026 20:23:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C9F866061D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791663836;
	b=DFsm+0OEIaYKv+Jr+8unOZQrj9+UrUioqI6lUDE8+p8AoOmobxxTyFTLnx/kBwHxTJpt
	 PT89/+kBSF5PYYpyOmzCca7ndiqBGHiLOcK1zGybRrU+UmO5Nu6Ko1zbuIP/rzK+ImR6u
	 OagazxGCZmU4mJOmkBELbXO6Zkb/ju+WxwQ0FFpp88vS38v72LudBBw+5VyjSgy8t7bnd
	 xfAJ3wMxYimf2S4IP/HRwRp1GIDNl3pJlgbvggErYZJjBUjLI8Np2Gwk3vXDokRAZtFmf
	 i1itIw3lBmCJINRY72avsWPRuyyAlqnEIGQTTQ9MHxQyTIjmrywGZQm8/6hF9ETTKqQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791663836;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+s2o6zdTde2VbUQIDDsNcrxMqsf4m+J2JLYicRaSHmw=;
	b=dZ+2hjqFS4sa8QkM0WYtnYSFbpeAxruYkvt0hEfGerwF+RzD8rulM2741FPy38gsqdtx
	 ZxTVuEr6lB6Koq9YdrN9K3GEUjKJNBuU75b9OTUL84ZqM0++4K2KT1kIJcwK4lAVMA5MG
	 jhgeXzn47fJ9++XSBlXsTod/mO5gIQkN63fRJIznzXRLV5q/Qr4bTBHa5xQzwbRJA+djk
	 L1PcDjKHMzl9dRe9MOx6xx4czGKlGvYX97Gusvk/X/vfroN/5qOUcQZInTWL27ZaYmojV
	 YIPRSnXxb4k3CpuFu7012MfLgmytaE3J0RcjnUOPJgV0dB6+eXZkD6h9R1bY1WaCO2w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791663836;
	bh=+s2o6zdTde2VbUQIDDsNcrxMqsf4m+J2JLYicRaSHmw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a7vWn5N5+Cl++Q4V7LBRK6lWBNYgutAUFV+JQtdlzGpi71YnFNnjbsA09U9yP7BpL
	 YyTDGGjQFwGXdVMe/B6vTkPpbuOia1EwMZsS33dhguWh8aiJ590w8RU7fnZgWmjLeB
	 Xty+XmfRJNnz//3zeAa7UFQDB7wZkHFQmLvNqUnt0vA2N5IgN4fr1H4zO41fKj+H3G
	 4/odcZf4ZcA3M87TZAyDsNFZhCXM7gmNaMDUe3bN1SfLGzBmWFlrQwM21kk+00OmEy
	 2Gyo/6cYRadS8H0vlHzQwCG9aWQkKiPBU2VLU8P2EOj4rlqT9Y2p7CyDt6n6q50p9c
	 btVLf3t/Wjagw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9F866061D;
	Sat, 10 Oct 2026 20:23:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C4EC922B
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5E25407D8
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:23:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5A8_vqI79eJK for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:23:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B7E79406BF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791663834;
 b=HtqUP9YZn5KrhFtApiBKR2yTodro1I3upLvDaZR1Bd1qUk2dsTqsnn1lw6Gs6yVnt+Wu
 /ZlNIwZudYwCLkwAZTXBYbglUqrtFoP+3//P1cipVHtOxMDYAR7kdIc+QS7JWVsdAwTMv
 DT75fKZPlDSih0DHYBmV1Z0ElSS/LHrs8BZKh1v0Qm53BNR0G1QBz0MTmL38VSXdcRiLk
 EtQAf1WGhEjMQtNhvazab5XDl1egPvPduYhDywP7jwbjToTXzCIvwPWfHFs/tUq3dIC9F
 3i7MV9pjQ2flRQo5E5g5CFvtm/R1QkZosO4PUgsP4BF3i3xU/Nb+pXAgqeGecX3Ue4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791663834;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=a2/VvjDvR9vd7A9ZSCYvx8QhsZ0bTKpFwHyRt7PKQnA=;
 b=B5IJaSlLnOVNg7YluZEEQaNqb+Mc/ecGwpsGvRifEkHt06ccAppz7pKnP9msOVH77SyT
 yDWGB42OxiJX3NLtBIw56+xtUxLX3YvXbJUgT6cIxv3ezPjvCD336NTRzbYyYdn0mJUHZ
 haJtKldwg/fCG5DnjKmRPjpuSTrE08dnebN+MLO07lyeXVF7++Vln9irfp5J2Bm4TWcRs
 K0JIWk3wZ9LRrobin23EZmLkSmWkpSLyBcB4gjNI5feBXG54Miv4W35XPNFDaQAELE4WW
 A7e8kt5ajS4XfVJK958kN13gvzVWNiofcuc1svxb/OC9lIrLgoJWnqI7nZhWEfAigag==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7E79406BF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:23:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BCB7934CF; Sat, 10 Oct 2026 20:22:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 22:23:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab50df3c1fe2ee011dd11cfe1126ea2923ccf3c3
X-Git-Newrev: f257f27aeca27c85bca662ac179db335ab5b43b4
X-Patchwork-Hint: ignore
Message-Id: <20261010202236.5BCB7934CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-zeroconf: bump to version
 0.151.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f257f27aeca27c85bca662ac179db335ab5b43b4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license hash due to restored historical copyright notices:
https://github.com/python-zeroconf/python-zeroconf/commit/cb189247ad5c1b0bb1f4d8c562365b6b22c2e85a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-zeroconf/python-zeroconf.hash | 6 +++---
 package/python-zeroconf/python-zeroconf.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-zeroconf/python-zeroconf.hash b/package/python-zeroconf/python-zeroconf.hash
index 3e9a2c06ec..9f7d232430 100644
--- a/package/python-zeroconf/python-zeroconf.hash
+++ b/package/python-zeroconf/python-zeroconf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zeroconf/json
-md5  adda1c72099e20b2968ff7f22d9f6f36  zeroconf-0.148.0.tar.gz
-sha256  03fcca123df3652e23d945112d683d2f605f313637611b7d4adf31056f681702  zeroconf-0.148.0.tar.gz
+md5  0dadd9b0d4d47b072ee3a7e43e3a0a6a  zeroconf-0.151.5.tar.gz
+sha256  28c2ec9d772007eedf11b41a9c9fd3d5c684c17b00721ff8f1ee31b20ad286a1  zeroconf-0.151.5.tar.gz
 # Locally computed sha256 checksums
-sha256  4d1d974999ae8655ee47afb47ac3b327cd1baeea3509aecb35341ba1a1a53c94  COPYING
+sha256  73b9e1d4dc992630bbc22b4519f437020446bc8e913d0ad81a3292a79275a251  COPYING
diff --git a/package/python-zeroconf/python-zeroconf.mk b/package/python-zeroconf/python-zeroconf.mk
index fe7676e2ee..ae666058d5 100644
--- a/package/python-zeroconf/python-zeroconf.mk
+++ b/package/python-zeroconf/python-zeroconf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZEROCONF_VERSION = 0.148.0
+PYTHON_ZEROCONF_VERSION = 0.151.5
 PYTHON_ZEROCONF_SOURCE = zeroconf-$(PYTHON_ZEROCONF_VERSION).tar.gz
-PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/67/46/10db987799629d01930176ae523f70879b63577060d63e05ebf9214aba4b
+PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/93/20/69744d9de9d375dae2639dda9add7dae85d52d690b68c61b23b8a6468434
 PYTHON_ZEROCONF_SETUP_TYPE = poetry
 PYTHON_ZEROCONF_LICENSE = LGPL-2.1+
 PYTHON_ZEROCONF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
