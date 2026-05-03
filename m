Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D90FF886F
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 23:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ADAF612B7;
	Sun,  3 May 2026 23:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JsojPXWU2zfr; Sun,  3 May 2026 23:25:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66630612B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777850730;
	bh=qZ5J9FXwlIlZw7ZIc3ivbOfSbyG18TOuTSIElOh7Y7c=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=mz1VCUv9JRz8O8TuVplyXs03occ+dlyOT2PQS9+m0g+vxsEbtVHDb67weGGfnoSl1
	 +miujFnzPNQeQKftiod52MDC3+8vtFH2Iu2r/mu3uWpskX+i/mjxxoruG3ATxfzTmL
	 gdXkYMZzGqhV2UBb0UftQRPvPD4966yfsqrOfmBHRYjieI5fbN0huDUAdjUQyE2/vg
	 J/AoJJRfV0eYtpvO0jl8VYFJD5mRe8YfKQQsY5glguMzaakcEWPBK1s3oGXXkxVVYZ
	 zE05gHAYmb2u4iJjnC6FFsI7/oAy+NtaDFJHQPl8AZFPKrgNeo2YG8HSK3ZILHK0wy
	 RSZdjPTNJfuVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66630612B4;
	Sun,  3 May 2026 23:25:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 35FF025D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 23:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C0FF4128B
 for <buildroot@buildroot.org>; Sun,  3 May 2026 23:25:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mVd8WbqHRj7z for <buildroot@buildroot.org>;
 Sun,  3 May 2026 23:25:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6BA1B41201
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BA1B41201
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6BA1B41201
 for <buildroot@buildroot.org>; Sun,  3 May 2026 23:25:25 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1psI-1wLs312IWG-00Ck4f; Mon, 04
 May 2026 01:25:23 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Mon,  4 May 2026 01:25:04 +0200
Message-ID: <20260503232504.3712616-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:dDB7ACFn2NGBNUU8LvL10BakDlcsoFBBT9agQxkNEnwxuD2KhKN
 kKihbDz6vZkHGywuaG8I+URYhkaO1xq73H40H1zutMNcl2sTbcxUTL5dovanxiR6OjiIq3o
 uplhgcfY5Wmef9gXkHLfh4EvgitEE2dGeld3zzjwuWiGYTgEuGbLrjxcrNAT6dymaPNAFH9
 Fg4mJgAg+PRIYGGNxlYMw==
UI-OutboundReport: notjunk:1;M01:P0:Nkkw20XZtw0=;RAMH+PDW05Lu4PfrJwQQoEJ3NJ4
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777850723; x=1778455523; i=fiona.klute@gmx.de;
 bh=BRc9LPS84tX52LO6fhzIdjZxThfuhv/H+shjDf+32MA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=HtbWcgsdwa21hd4iPMKEMKaipIvYhbzAs+9lpD1RAIOTLYkG3mgK0Ns57PjIAY63
 vA9Mxctv35Zj9vscsJGLEkysehCKwu6yLeLJLT9sMXCR0kRo1sUi1hgQZly8ASosL
 7I+dKq1hvHB/m+A1MHhWUBHieXVKEwFEqMROG9c8TLP9iropnTAUS/fy5oXvRBCql
 gjNM/RX3CDVMS+X1c9TNhT4t4Zc63GhDA9XeUp7QM78SlaKj1AkSo7A5TonR9Hw/a
 ZRhoj4rwsCkuPb3gvVOEmx+TH+au7spCIwIVtMez0qdIgwtK5SLqskIIZx49CmTwQ
 GQRiTYDRpB9pbojiXw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=HtbWcgsd
Subject: [Buildroot] [PATCH 1/1] package/openssh: explicitly configure PID
 file directory
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

OpenSSH checks during ./configure if the default location /var/run
exists on the build host, and defaults to ${sysconfdir} if not
(/etc/ssh in Buildroot), leading to confusing errors. This can break
e.g. in a sandbox with its own mount namespace where there is no
reason to create a /var.

Explicitly setting --with-pid-dir=/var/run overrides either default,
and only logs a warning if /var/run does not exist.

[1] https://github.com/openssh/openssh-portable/blob/5fa60ae0d2ed3fc441f54c9349afbd63b6301929/configure.ac#L5568-L5576

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
I'd actually prefer --with-pid-dir=/run, but /var/run is what
check-package expects in init scripts so I'm sticking to that (even if
one is a symlink to the other).

 package/openssh/openssh.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 607af7456d..8f46d886dc 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -20,6 +20,7 @@ OPENSSH_CONF_ENV = \
 OPENSSH_CPE_ID_VENDOR = openbsd
 OPENSSH_CONF_OPTS = \
 	--sysconfdir=/etc/ssh \
+	--with-pid-dir=/var/run \
 	--with-default-path=$(BR2_SYSTEM_DEFAULT_PATH) \
 	$(if $(BR2_PACKAGE_OPENSSH_SANDBOX),--with-sandbox,--without-sandbox) \
 	--disable-lastlog \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
