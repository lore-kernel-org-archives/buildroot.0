Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C83CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43AEC60EE2;
	Fri, 16 Oct 2026 13:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y0LW0CV1SXna; Fri, 16 Oct 2026 13:12:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EF680611E2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156330;
	b=eaJbbIG5hDsC8YVnxGaTXr7TgoiUoiLNBJIViEC/MgYhhzrmIEikNIZYTI27pX1pAltv
	 rpC2e6DeUZ4yiNeJ1u5AJd/RWnjWJhGZnTNMHT7uNWdXV2SPBJl2e66bHIZq8i3zb8u10
	 583zA0vmJOfqkA7T6urR58GnJHfg7+OQa6sDJiSpPHIGTuyrRe/5H3dieq+36SxqThsR7
	 iXOFjS3oZsPtk4iSB/WhJjrOuTO2HBTBA4LTtdXiyQtiCmKMowGEe0DVKMg8/sZ/Vz01O
	 tDFmDLresrq+ETEFQT9uqqewX3H9RRhulMM+gx/GdrNSxeRiseHW/anzDg1zjwGx7Rw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156330;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ANiDPokYB6QOwT7SoRALruFJ++jIGOZDgtwVMd3Rz+E=;
	b=JgGNdkf2e39MgTYsB/AOfBc4aRjal9TYgbRa8XtZsDv+et1g+K54bA1WusqkHqjFUVqw
	 xjFw0u9Rcx5GQzNEkiY4pprbmw1PNhtC7VS32Iw9FKMsA8rZ1YjvHhd8GZKeVzqJTcfQq
	 wdumn2zAvTH8AG97adV3zURvxMUima59w4tk6coGzLUcarOQEFnkJCgFoz2FyvfKYhppu
	 SfMAHonKrtlIxxMSKrXy7lxRIAe1genTOhV6BwUNtRBPiPVsLFlbv9SAG3eZmXjwVsHWl
	 96VoQgxL9OtjKU4HV/oYpVcZkAXONOYHX/rAgmTmc4+nxa5db8V6CVTvdUp3lIFdDGg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156330;
	bh=ANiDPokYB6QOwT7SoRALruFJ++jIGOZDgtwVMd3Rz+E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KiBT+w5VYPM7n9mo884tbRst4L4QGJJL3u5GDYXo6/2fVvKiWpPpyR4y2NUelQXOX
	 L7U0sfs49dJsXA7KSa2gXeVKDKwqmDjTLs6goEgNuUiq98iaCQFGzOwqX2s8HYfqNd
	 dbh9lIdpuO+JyKeAVVVZUa+8bxxFv/y9YLfsO1LNpp4l61q6JTUxeUt2noY+aF0+02
	 /lfH9Pj80DpWcIayYNDUXSeAneQmUAXM8fM0KukIvbJvV5WR+ktkH6uGm2uiRFHbfW
	 qp2eAH5JOF/MRWQoaF8fwKstTX2I+88CEAgD3e4+Ieb6naBcqSNVp3YqRFoJHmhWJm
	 h0E24jwzjd/Bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF680611E2;
	Fri, 16 Oct 2026 13:12:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F5BB769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9051D60ED2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5RYAIXxzxK3C for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EA88660F17
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156191;
 b=jGyMgue6Y9SFJaTttBm8sTUNB53DkVf0Jy/aOr13adYBqzdb7cYNGXG1tHoEjaKdh82h
 eUD0WQ+h3toHX5utq0nBN6BTvJGXM20lK4yhfZqAIrUJJyEa8lv1pOHMZ3Ziq3Xod+rpB
 EgJFYlsZYUyGzR0mcch+gumOzLzX/d8EMDr/LvleUsA2Mip9HVQxKvySRjEUkcl5/BznB
 veFOquQjqUdlobR2xXKyJdm7/skgU08oMYYRBCLQvO7vYHGQaLzf/rKJDK8RLeM4psyEv
 oJoXu32dCGQ32UP58wOwoPYWOoLmtPp5U7/P6syr2z0N6o9bSQ51xnCnclyqW7Q1H0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156191;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Ud9zCuv59u50G4BbjLdZ8z0sJTbh9TloZD2Bs1tXEiw=;
 b=HXKxUzfY836CkVAwvW+8hP0ach8pH38R0ePRGstazoaNwkHtlqb0Yl6FZt7VCLQpi5Fa
 8pXLO4cNBBwxprdJZBHWIZ5QsPShDoJA7gYLpn7uKnBDBeXmVrIL+VoQMFZDNea6WIQ2s
 /TJcoDeGDMe3zEyAcB3K1dJlZ3sPuEraRtLt+hSpKhLxiPsy6uaSA0yyh68PYJIb9XVBf
 TlvD4+QuwnKzL5G+H7gU3W37mgjlu8PUi8ewwfjWBVF9fCXe65PUy1Zwmb2BBgUamHGdb
 lhQhXsbi+Ts6nZlSDSpM5Xpdj1Tp1BJ84mJgqrzObJrvWLsXTWRnHr12PQg5tDONHOg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA88660F17
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF17C960DA; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 13:17:46 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 08c78948dd1eafdadc02a96ce97133137f760df1
X-Git-Newrev: cd1b2818a8f2a3c0845c180fde1712273cc510bd
X-Patchwork-Hint: ignore
Message-Id: <20261016130829.CF17C960DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/python3: remove
 configure option --without-cxx-main
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
Content-Type: multipart/mixed; boundary="===============4403631259478288722=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4403631259478288722==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cd1b2818a8f2a3c0845c180fde1712273cc510bd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Upstream release 3.12.0 first included commit
https://github.com/python/cpython/commit/398ed84dc40abc58e16f5014d44c08f20cb4b5f6
which removed the configure option --with-cxx-main.

Buildroot commit 36e635d2d5c0166476858aa239ccbe78e8f2af14 bumped the
package from 3.11.6 to 3.12.1 but forgot to remove that configure
option.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 261aaa6d63c5bc717631ea0ce2917fac321ac84b)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python3/python3.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 788d993d75..67fee2d6c2 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -18,7 +18,6 @@ PYTHON3_CPE_ID_PRODUCT = python
 
 HOST_PYTHON3_CONF_OPTS += \
 	--without-ensurepip \
-	--without-cxx-main \
 	--disable-sqlite3 \
 	--disable-tk \
 	--with-expat=system \
@@ -202,7 +201,6 @@ endif
 
 PYTHON3_CONF_OPTS += \
 	--without-ensurepip \
-	--without-cxx-main \
 	--with-build-python=$(HOST_DIR)/bin/python3 \
 	--disable-pydoc \
 	--disable-test-modules \

--===============4403631259478288722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4403631259478288722==--
