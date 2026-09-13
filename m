Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC64C88E40
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 08:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C41E80E55;
	Sun, 13 Sep 2026 08:51:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HdQc71vGxv8F; Sun, 13 Sep 2026 08:51:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4026D80E50
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789289476;
	b=ClsL7IKh44K84552aZmXNnkF10TfMxF8wzt5loeqzx/x3NctaKfLjTXDS/YcTLeZlhaG
	 qTVmnJrD5JteC5YCQB2KKf66V9/gXq0pu1QcbkMioVflVQOYksfOiySG0+GiYOQbvaSAO
	 PtN54+fKnBx34qlxuu+BymQ+DNdvJuAUnqwS5HOQnoRiSnB//zc5xjdNmrI8rAWj3cGoS
	 lHfa7lx4/At4w2pCA9PtQEOAeX6jQ6hKVBUhWt8kv53Tx0VB4fOoi8fGM/D2pEQj9bgg8
	 hdN1xUPwPEMycDzO2PjIwIsgvO5D6Z4cswoVxBpR5LcNm9iE8KM0Rb+nAYBr38cB1lA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789289476;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=x2he734QOAOKwXthUeK22tlXDDB9A8tBkyrdMXbQogg=;
	b=Efckp2jtzyzLIFMbUfOJk9WIvJystgwmmdVHRJQ9FVFGRkpaTdRhj3Mw7Koozd3Ky3Wb
	 /X2e6FLCdhU4rOqcBCrkLc9+gbK4HMuQ4VYN0D3hDyVWZWFaciHKIVVir0XNWFCEPHW9U
	 gvU54xHmP6IuRtwfbySwTZhukrSpacjlyQU2XzhTjFv1Hq8BmBSC2eCJQXg1rqLTGHzOo
	 zjO4FEmtXoDIkBZLxB/OrwumrCeEe5lKyy/fBSqaniquoGV2FOgTghb3S8Z8pmYrMXHAV
	 iLL3dzQIF55DvZM8t2fFiPs1IgwyrIvEOWbb4FJVcpFS+lkun5CiJBsKUhaPWSBN0dg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789289476;
	bh=x2he734QOAOKwXthUeK22tlXDDB9A8tBkyrdMXbQogg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XbF9/QWlasg38/X4Z2sYgz8GB/X4galw+WrWLciBkUu9AA3m8SKmyEB9CIkmtn+Lo
	 HdjZQCBjtDZ9WXpjJGtReRWMvyO+ghSjkHp+JmzwaN2ps11eDR4Shdgx1zCYhuZZS3
	 /9hoP32mjR83ldHubyUEmCCvleRP/8xFkUXdTbA01g/GIQ424dl3ZT/fGAKUonN0NQ
	 PflIw19Sp25jreQOkEtAjga6CkBdM/vpCJC/U8R1F2O/QHH15ErhvDVAdO3ctInQkE
	 ayxL5v88ECHxOlD+4RCbgJ9B2kNL1apPs4kj9OjScQjpZcj/i1hudEAP+s15AT/i+z
	 mOMJ5fSIWbyjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4026D80E50;
	Sun, 13 Sep 2026 08:51:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FE4EEB
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 360DA400BA
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id czf4uMJGnpsB for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 08:51:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6F96B40049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789289473;
 b=HY/2jWl0L9oV8GX4vejTa1TQDvQWwblGKgustkbZGWrxuMS8vSQd60AwdPKFcVNAFAFE
 WE6MAEUN+zHQfmahQ3AFPOti3H1M2ruu4IoK/UoGZWBB2pVSB06gWVEkgph0uU7pWSnuo
 XVWlStabuugBoWGU/xoCPA3N3aDZ1tRLIQ5F9v3Rf4zFXLl9PVSKaMdT3FJGGysd09tG1
 s93Qz4ctAPn0RuIIwdW5XaU8hi2xVu5IyG+yT0W4ME6t2ETeNTI64cmT6ihxJI5inw01s
 7cP5yujUIenlWAF5dUfHf+fPQFI0vcJCn4mfs8kMLmfo7E6LqYnjU3Q+40Wd4121M8g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789289473;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=L8kg0ckZ2idn+0+DRaGjCqnV6gHOr7+MuAj1uehqZJc=;
 b=P4ZnREtm+l3B4SRVWRwlkkB4tCwaAzWiqFszKB99zSkRdm4B8EuR1u06+HuFM/fd+ztI
 mqArYTOEcufV18/h0NiaC0MNg7Kts7XFuR2rw+MTp6NdmtPJpbc+8GTwHgEL08moWYJlu
 vaQdR4bAeQZ6C/1YO7HQ6NdXf7IFUNhnXB1P/pfNaiSnisGn9ejpFh7K92YVm7MkVlq15
 +90PHUNJDrGeZ7xwyApEsUhqXzNFUBZK1A1VYSEPsXARWCMXWOGL9pHgPR6kL74ZX7/yR
 yRsyWX8ulqise2jA+xHV4/oVTYnItNG19tWOTis5+0mgM/np/4yUNi9SuN3S39iT5Rw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F96B40049
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:51:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9716B95B23; Sun, 13 Sep 2026 08:50:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 10:47:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74dab034953e4546b63c9c280428e59fb144488b
X-Git-Newrev: e36370624d761579b38df95c93adf3fa8addb67e
X-Patchwork-Hint: ignore
Message-Id: <20260913085008.9716B95B23@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-memray: add missing
 dependency on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e36370624d761579b38df95c93adf3fa8addb67e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_PACKAGE_PYTHON_MEMRAY selects BR2_PACKAGE_LIBUNWIND but forgot to
propagate "depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9".

Fixes: c2df8bab97d7f7b8b61ce055b4820ceb1bd34a48 ("package/python-memray: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-memray/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/python-memray/Config.in b/package/python-memray/Config.in
index 1c5b286a8d..16b661f8b8 100644
--- a/package/python-memray/Config.in
+++ b/package/python-memray/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_PYTHON_MEMRAY
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # elfutils/libdebuginfod
 	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libunwind
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_ELFUTILS_LIBDEBUGINFOD
 	select BR2_PACKAGE_LIBUNWIND
@@ -19,8 +20,9 @@ config BR2_PACKAGE_PYTHON_MEMRAY
 
 	  https://github.com/bloomberg/memray
 
-comment "python-memray needs a toolchain w/ C++, dynamic library, threads, wchar"
+comment "python-memray needs a toolchain w/ C++, dynamic library, threads, wchar, gcc >= 4.9"
 	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
