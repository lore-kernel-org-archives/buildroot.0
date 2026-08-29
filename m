Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA59C79F87
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA6AE40AC8;
	Fri,  4 Sep 2026 16:22:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pFWNd55PBQDj; Fri,  4 Sep 2026 16:22:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 10E9940B62
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538950;
	b=P6IqqIiTfZPXoK939kzEHFbixn1gzXncs3slHcrWEE+SYdm8lwnf4dpv7r9y9SM5TiCF
	 fwKkJhtCVkE98ZGhdaINsbjrkRqWE9cIEZqB9ojvTEGvU8xQHwzjjx2wLF2OQ7ITF+p3C
	 fnyhoxm5iUN6Sy/dDcC1nL73tXMzVDKNTXHkn3PZWQUXMtrusnUli/EHNqtauUaHnGAJt
	 6SQXGcYwrjSNlXLOtC5R28P5Rvxf4UQ2JpN+sCaWC+VGcOyy52I3I7M9lFhSIq887Ieoy
	 Yd80F6+CsSOT5VEus43MbsyUgfewmdZffhJ4o2Nui1+rLM/6mt95TpCocguCcNkg0OQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538950;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=I66HL/kc/i9JXDacS7V4ctAuhMi3uZ8u4mIj5VYgnos=;
	b=kC1/XvZ/SO15Pm08v7uI87H5NtvfBQ1PEDTdXlvbgkARSiKnz1mNtk+DE4bcxmByv9Dl
	 4LLevl/k6pMjUZBTF6deK/WUfQpLzbBPc4iBIlOI7enk6UEuLpsK2MIjMPYy1Tprj+QGr
	 UF3zjA7NBrvBO25E8g64UcgygRA9QOU1Fbs1iVZdY7ZqA6Z4fiYXpoaQT5IFeY7WKigQv
	 9ivLtrealdoLbT3kuh75s+nyQjbhX3fa4+BwiDdOQWoBd37AjXbNiYYsLbF99EnXnMeqs
	 02Ucvl1xTie6F1dNI3ae5iWdcZcwOhO6kukifcOkl8oDmin7ZpkOKk6aucDXxOjni2g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538950;
	bh=I66HL/kc/i9JXDacS7V4ctAuhMi3uZ8u4mIj5VYgnos=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RC7BErrDB/uBkJ4LGEOXffzQZWpab0rk5BV0o+3XxLa9LqHl8c+uIRHPaVSrKobZF
	 eoFZ1WzKUjI/0PYYrWXZxPdKG3iD1rTCe7sK+5e2x50eV7YOpofV8DlaCr3xU9PbH8
	 mLyWgq/B/Rg04360ZbFwK5tZCtAmC7pthmgtSvKP+lQ3Cve0BtyvznB74VJgf/fgCN
	 34llrYVYiQhgWc5vBpJKColr6oYgfhoSgLReS1lGO739/rXd5zhg9mQgdIil4oYViH
	 zQ9x72Ny4OcOQX6Qgs5dFUmRmpT636fnNlJKYviPt42qtV9UDRknnKt8/+i2EQflve
	 F+M+b2aet4nPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10E9940B62;
	Fri,  4 Sep 2026 16:22:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 78F393891
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7518240B03
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id czsir0vGDtBi for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 704EC40ABC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538927;
 b=GLUitUjqIh1nMgjaRpoUqCBfgEspbXyDR0H7UjWl9wVuJgsLZnHZoGCsT933unJ28+a8
 yBpml6nC1eZ2lB3e3ElOixDla6x4kz2Z8amoOXBsTOAps3dXQULTwJmrdq8eRpHgRHcUi
 XRywyEllV2iE3O717l7ZeIgRZFVvbVU/wdhRd6N47seeFiy+syvcA97/moebIDpo4w1oY
 EfYutb2fWICfgvOlPJ/CaIoNaqgD+XSYlPQ2K4YglY+AldtJUvHjYhtSGRgGVCAbYhZf9
 +q3gcGFDgJBBcdVUZijTKC02gtRkAbqpm4Ocw2WgxUrAqBI/gfYMngAIFhovjqxIdyg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538927;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=eXKcKhQvc8ViYOzWs2uCoHUSxoLyAr6GRkttEcbR81o=;
 b=l2/GvUcfWkRmVer6VLBnNARD3x8Y/lwNlxbrS4l5XmUkSiWqsMq3bmVDzULFkqYQz2bB
 QmnJtapp5vAVQXVb9VBmQx1MiXoqOEo5L6sXA5C27gSAzT/IJEWwaB5hCxzQzShGUYj4i
 4lu+7WXETzsXEhuDA6o/xWspY5pkAmYk/PIoCa1YbkLxtX5rE0T22a4UGB9gET1BjsVyv
 uSXmw6qyoEzDKucUXnYNCjWQhOECcq0mu14ZBqGr/UFtdNA0SvzoWzu4RfQ6A6TtSiES6
 gAMzfvsh/VTuW5hrBujVNh4eeND81dzRNB1g6SUAZjIFlXdGBEbliSOD32S/u+3l7ag==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 704EC40ABC
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2A5F94C40; Fri,  4 Sep 2026 16:21:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Aug 2026 23:05:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f48ae8880554fbd433b27dd3c585ad9585eddbfb
X-Git-Newrev: 2c36fe80fe2fc3352b0ade2fa9c19fd190bea9b9
X-Patchwork-Hint: ignore
Message-Id: <20260904162106.E2A5F94C40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5: relax openssl constraint to
 allow compatible implementations
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
Content-Type: multipart/mixed; boundary="===============9026590679485282320=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9026590679485282320==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2c36fe80fe2fc3352b0ade2fa9c19fd190bea9b9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Qt5 can be built with or without openssl support. Following some build
failures, commit a94d39d693d8 ("package/qt5: fix build failure due to
libressl use") enforced libopenssl as the only valid implementation for
Qt5 openssl support.

While this solution is fine to filter between the two openssl variants
officially supported by Buildroot, it prevents users bringing their own
OpenSSL implementations (through the virtual package mechanism) from
building Qt5 with openssl support, even if the custom implementation
matches the expected OpenSSL API.

Allow compatible external implementations to be provided for Qt5 openssl
support. Relax the constraint by partially reverting a94d39d693d8 and
checking that the selected openssl implementation isn't libressl. It
then becomes up to users to ensure that the implementation they are
providing is fully compatible with libopenssl's. Some qt5
sub-packages enforce BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL, they don't
need any update as it does not really strictly select libopenssl, it
rather prevents libressl, so it still allows custom providers.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5base/qt5base.mk | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 159d411de8..3e54465ed7 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -230,8 +230,16 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-eglfs
 endif
 
-QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_LIBOPENSSL),-openssl,-no-openssl)
-QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_LIBOPENSSL),openssl)
+# Qt5 officially only supports OpenSSL. Users can also provide their own
+# OpenSSL variant through the virtual package mechanism, but it is then up
+# to them to ensure that the provided API is exactly compatible with the
+# libopenssl one
+ifeq ($(BR2_PACKAGE_OPENSSL):$(BR2_PACKAGE_LIBRESSL),y:)
+QT5BASE_CONFIGURE_OPTS += -openssl
+QT5BASE_DEPENDENCIES   += openssl
+else
+QT5BASE_CONFIGURE_OPTS += -no-openssl
+endif
 
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),-fontconfig,-no-fontconfig)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),fontconfig)

--===============9026590679485282320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9026590679485282320==--
