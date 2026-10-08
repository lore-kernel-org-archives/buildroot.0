Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BACCA9EC0
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAE3960ED0;
	Sat, 10 Oct 2026 09:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ovkX6NTeDKa6; Sat, 10 Oct 2026 09:27:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D25AE60EBF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624469;
	b=MV+0XG3bHevthyHkYWzX7cJj8doXsPX+u5QA4/+6TOUV2L2zcU5wAY3xXynCddRy+mkC
	 asFIAuFtMJgDQ0W//nQ0KaGeB0jOkbO2ImYQJj+6mNZcnw5o/AdUBc/34KKmzZ9U+5wAd
	 xsYU/pG55GDo3Kxd+45zqR9NOO1T12+IHIyzCSK9DOD3cdgJ139qdKYLbjuKI+akr2h2s
	 i8mNRo3JKSu8no5p8sgTC3quPg5xwuPnalIuqUonuhNGJrYMx1o/C6WyZlbAf8LJEr8D1
	 6FZ24HMUDnPf1UzGweE4uVp7hrMzVdqG56lM4pLknZjm5Gvi4WyVCX9h5YkrsvVcKSQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624469;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=YxTicpuNYPJuHXtZq7HNxM+QSRynb+JqtdDKB6ALLgE=;
	b=ZlGlgEgGPJ0lL3J+XGXDxci1eQHFze/BOfCKaad5SThJfyvxhlrQB8VC+TpW4dguziQE
	 HS+PL7AD7CU1ESmtTXB2h98Ml1TpjVWCWkhXe9BJmUVbP/aHMm7ZGc6l1XZvHg5lDzcWa
	 Bgf5zuui2fdpwQJ6Nnkt1mwpTUaN7az+wtUNaoONebh1wC4GBkGyofyd72nbrQ55KPSda
	 j5NvXGHnZG0+PcCUK48s1N8l2WVwQMa6od3L5JLgmA5br/aQpLQwTQ2TmpPy0h4hSNBAo
	 TFJi+9EHugO7jj9UmjzQecg6ecAKw9VH33XZY5i6bZWJXzzt9G82qUNuaOPCE9RYSkg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624468;
	bh=YxTicpuNYPJuHXtZq7HNxM+QSRynb+JqtdDKB6ALLgE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i1EjahgNVFfK4CjKa+CKJbhUtt2RMljIECW4HKroBFH8uoIB+Z/D2a5m7ZmCEt5Ix
	 9gJ2v33uOkMusVCt/l0pAJnP/df9URC0RpcR10KdQxqeV1YXtalLfITIVmDlkChgI+
	 qJ6BywR3wXwGqyxGR+cuyfD66aplpzVKssxVhEXD5BPI170vyD+6JpJUpMo7hCUW1R
	 tNUiOC9bUQllBRq3jVlhzn3FAznlR3eha1/AZ3W3jlyLPRXD82b73gZH6Qig9pxdFg
	 eDDvC/PMmWT9QSkUPGMyekxT0oLE/UDY+JMzU1+40K1Gxnyvfguqw3CoUS6yX3mt3h
	 kk7HLrnQFxwyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D25AE60EBF;
	Sat, 10 Oct 2026 09:27:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AABBA64
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E080940345
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UktYodBIfo4X for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 49FEF4028C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624442;
 b=TlwLX2bXOz0j3fJc/v3MoIU9thqaksXjttAADIhBkZ9/GbM90KFdcO+zpmmkb8AoI33E
 4e+rOaCTdA+lPo/GtHoXKU7RSmbYf22ouNsAnlAqlBOQGYYhywxotjVVdl7tA2KRAPQqn
 V7r/81L9EZ5xGwyL33305Fb2g7mGW0KZnyN/fWA7n8c2ULi8Ps4GnsPWHBLBpKR5ttIqJ
 FWWTgwJCRULyn59a/gDLPPbwX7GfHYhos/se3HMwhWXe5MMucYfDzgjTu0AmEUUt08Q/k
 +8gb9YFC2lpbgcRUWblH3UYkTCAjjfzSvdRurzEvJIeKjRrfZ77xTT1mKZx0mYjyT/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624442;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=mCGp6ch6aIVMM4vmgoZRF6hrn9WPfvDJvDaT/kJ0INM=;
 b=It9pEvGxQi097tdAhdPBkG8KFDdmNT59GKriLnCbfAWRQPXbI/2d7ynnAg3N4oEc/Qv2
 H2AbRNtogCM40iZj6+NpeOX1Sjs3O/5ASQcwveS5E/OeSRabQi2Su8YeCOsE5+xaqb98q
 h1XriQ2ltbZ1nYccxiAzAs2xMDTx4aJHqqqjDRP+mUxAQUtUpnouq1dLIHgiwlL2qRWLZ
 oopt4hGJy4UzPB+Mu7PBYNJUupTJ9Zd4ERrjh14+9n/u2GGmnMYlPhuFU5B6malREGoPi
 vFHjANVp2gmHAZkES6oVpYJZltKvvPUfuRW7j1KsFQBOniD0uVIh+z+8eRqgEPN5A4Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49FEF4028C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3304E8F1BF; Sat, 10 Oct 2026 09:26:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:26:27 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b42cc0e89e909f4356368bd6df6df9715eb5c0e2
X-Git-Newrev: b2e19f2d75d96e5da1425ea0bf7d95a622fb98f2
X-Patchwork-Hint: ignore
Message-Id: <20261010092604.3304E8F1BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/e2fsprogs: enable
 libarchive for host package
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7214705817514425230=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7214705817514425230==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b2e19f2d75d96e5da1425ea0bf7d95a622fb98f2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

mke2fs need libarchive to populate a newly created filesystem from a
tarball with "-d tarball|-". Enable it in HOST_E2FSPROGS_CONF_OPTS,
and add a dependency on host-libarchive.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b1990243cad222ec438fe14ac26976b85981e08a)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/e2fsprogs/e2fsprogs.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 7f33b256c2..5d6e45ec35 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -16,7 +16,7 @@ E2FSPROGS_INSTALL_STAGING = YES
 # This prevents overriding them with e2fsprogs' ones, which may cause
 # problems for other packages.
 E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
-HOST_E2FSPROGS_DEPENDENCIES = host-pkgconf host-util-linux
+HOST_E2FSPROGS_DEPENDENCIES = host-libarchive host-pkgconf host-util-linux
 
 E2FSPROGS_SELINUX_MODULES = fstools
 
@@ -34,6 +34,7 @@ HOST_E2FSPROGS_CONF_OPTS = \
 	--enable-symlink-install \
 	--enable-elf-shlibs \
 	--with-crond-dir=no \
+	--with-libarchive=yes \
 	--with-udev-rules-dir=no \
 	--with-systemd-unit-dir=no
 

--===============7214705817514425230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7214705817514425230==--
