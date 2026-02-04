Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441D6E83F1C
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 13:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EED32406FC;
	Wed,  4 Feb 2026 13:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6WMeTX_SIDvI; Wed,  4 Feb 2026 13:56:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F01DE406E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770213408;
	bh=surUOEjqrZ7dVbhA63k2mEdi0Kn7C3E464FQiImHDGg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CAftIdZMN+Lk/4jEY50GZpKzF/jkPy3WAUtAAwdfquqR12PE/jc9Mo7TWwHUcbtZX
	 FA9xsWX3cFkGpMUNfKyOwy56ZQPD1CDndVACZicD/d9Jmuoi9W3Z4eoQZcxtUNa0CO
	 l66Hk8oQQX9zLtuz8dlc/hzjC++n9oZoQwZe2zMeIjPUIx96o43CIPVpt6Da9Mx+ZZ
	 A8DXDd1+uDJ2TFUOB88sKVvea0gzZud2UzTSrX8krJxe4Xh4h1QoVa7Xd34X6eZtYj
	 lLAVfPF0zw518frwIfuREUPqIyylg89WJIcfR5ZMgGVrYFntEJoDupCcUGzOR84A+K
	 KlDo+WMO6kwEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F01DE406E9;
	Wed,  4 Feb 2026 13:56:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7ACC2F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74656406E9
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EmkIrJdVHQLa for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 13:56:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1BB5040585
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BB5040585
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BB5040585
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:56:44 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1808265016; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 04 Feb 2026 13:56:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1vndN3-0000000AvMv-3uIo;
 Wed, 04 Feb 2026 14:56:41 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 14:56:37 +0100
Message-ID: <20260204135639.2603782-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260204135639.2603782-1-peter@korsgaard.com>
References: <20260204135639.2603782-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=XGm/RqsFfub4Bm3YE9iR6OVRmk723u9nUpDQWEIyPn3PDZRj3/l9mhXFiBoOYqOX8MVO9MM4Pp3VGkcjgxa0OeAY2bZYa58Jkc9ztUOgzAgNjHXiUlCwRDy+HzS9EZBGNOR8Ur73NsFjMvNop0iFzSocfLVBmHMBIChgdhdyWn/LynpHVi8eeC8HesrgKSpQgNqbt0rsyNwcQvJqT+q0og+himsrnpOcdT5nBJLZ6TL4fxoQ+ltMbL+AgnVoXpBX2fU82+zThvISC7OOO64mGLp1+6Sib+9Pn+biRAWpQeqShIW1ASJuJnZOecykgfHanbpBw/zPdO6vfFs8TtB6Mg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=xP6Ma1TMAjMrq81Jo3Wxsh881P8c63POmW/4XnAKp9I=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=XGm/RqsF
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 2/2] package/shadow: ensure that SHA support is
 enabled when requested
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
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ensure that the SHA_CRYPT option is enabled when the system configuration is
set to SHA256/512, as otherwise passwd complains when a password is changed:

passwd
...
Invalid ENCRYPT_METHOD value: 'SHA512'.
Defaulting to DES.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/shadow/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/shadow/Config.in b/package/shadow/Config.in
index bbbea811ce..93216bd14c 100644
--- a/package/shadow/Config.in
+++ b/package/shadow/Config.in
@@ -3,6 +3,9 @@ menuconfig BR2_PACKAGE_SHADOW
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_SHADOW_SHA_CRYPT if \
+	       (BR2_TARGET_GENERIC_PASSWD_SHA256 || \
+	        BR2_TARGET_GENERIC_PASSWD_SHA512)
 	help
 	  Utilities to deal with user accounts.
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
