Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4443BEDEBEC
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 20:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0017880E27;
	Tue,  3 Mar 2026 20:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AbhXJcjMAdfC; Tue,  3 Mar 2026 20:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 217DB80E55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772568102;
	bh=ngIW8yIaloWkt/+CGQmZG3DYo4zb639HDJsGWQSGa2Y=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=N02hZeOjMshiMHmzv0WvooGcmW5x5wHhHrbx4xhS2yfraFAW3/3pb7A7xDlwNXWxz
	 DVSBv9tbh6dKaAoaxVvX9jxXmHXI29aAolyvLPjYL1kc5nDXsjMrkO5NZ/rnyKH5Qd
	 2aSsak2YIPv5fZroJJPqpItXtnsFEcZTJADgVFq0rmU0mweExhEQ/igTizEYvyeybK
	 yxZlJIwlm65Zzv1naqI9kS0s0NP7QVt721qr3XawqmlCpbxg8JpIrFB5rs9yA6iSMF
	 5qf2EEfkXijYTVJfruGj+HK+Hu8eivdW9wG1pdgqzZj9+9l9iZGu9FmDwQTVtSwyzU
	 6i//k/NqgniCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 217DB80E55;
	Tue,  3 Mar 2026 20:01:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 00A8625B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAAB4400DC
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WQl8W5BgNR3i for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 20:01:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7E20B4002D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E20B4002D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E20B4002D
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:01:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04ca.dip0.t-ipconnect.de [91.58.4.202])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BB4E9A4C3288;
 Tue,  3 Mar 2026 21:01:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53148)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vxVvM-000000003gI-03zP;
 Tue, 03 Mar 2026 20:00:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 21:00:47 +0100
Message-ID: <20260303200054.784253-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260303200054.784253-1-bernd@kuhls.net>
References: <20260303200054.784253-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772568061;
 bh=MoaXdbIsryjtZpBrH5ktbHK7U3qkPNRUAsMrxJAcYWY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=cnZprMdsxUoYJlGWC4vnix5ZLefmQ8ozAMYXwQI4XrPahOwChvK3ZsSnNAwft/IjO
 RXM/E82X/tkaIsDkcpMXxZHE6DQAceVkZ8hrjM5dJK2NiiETH7L/vVxzujb7GLH0Y9
 B5oRtFALrH1RBz1FxpOIJXvShiPa9BjLsbfa8j9iQf4sAszwRQqZ2eoBrj+jp0/45o
 o2mXnojKDDpeFkggl/qLedViefQLvvtu290nOp/lFhJ6iNdqBLey7tojeyY8+JbEsX
 2APeEVLis4EUoTu+GR6oOaLX864NLVe/ANEhtNyiAA5ZrnEeRw9yI3soCURY4a47BK
 ExVjmDxXQ/hEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=cnZprMds
Subject: [Buildroot] [PATCH/next 08/14] package/links: Fix build with glibc
 2.43
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Pieter De Gendt <pieter.degendt@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/links/0001-glibc-2.43.patch | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/links/0001-glibc-2.43.patch

diff --git a/package/links/0001-glibc-2.43.patch b/package/links/0001-glibc-2.43.patch
new file mode 100644
index 0000000000..73bd330c7a
--- /dev/null
+++ b/package/links/0001-glibc-2.43.patch
@@ -0,0 +1,27 @@
+Fix build with glibc 2.43
+
+https://bugs.gentoo.org/969617
+https://gitlab.exherbo.org/exherbo/arbor/-/raw/45d1f0e764ad1fcb8d776534d0925fe074d04d61/packages/net-www/links/files/links-2.30-glibc-2.43.patch
+
+Source: https://www.linuxfromscratch.org/blfs/view/svn/basicnet/links.html
+Reason: Fix build with glibc 2.43
+
+Downloaded from
+https://gitweb.gentoo.org/repo/gentoo.git/tree/www-client/links/files/links-2.30-glibc-2.43-const.patch?id=ad9dd078c5473b947f237136746cd1c3933ae494
+
+Upstream: Sent via email to project maintainers
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- a/ftp.c
++++ b/ftp.c
+@@ -768,7 +768,7 @@
+ } while (0)
+ 		A(ftp_head);
+ 		ud = stracpy(get_url_data(c->url));
+-		if (strchr(cast_const_char ud, POST_CHAR)) *strchr(cast_const_char ud, POST_CHAR) = 0;
++		if (strchr(cast_char ud, POST_CHAR)) *strchr(cast_char ud, POST_CHAR) = 0;
+ 		s0 = init_str();
+ 		s0l = 0;
+ 		add_conv_str(&s0, &s0l, ud, (int)strlen(cast_const_char ud), -1);
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
