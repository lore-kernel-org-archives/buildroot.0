Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6F8C98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38A9C60640;
	Sun, 27 Sep 2026 10:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NAI3zjGy1QbQ; Sun, 27 Sep 2026 10:47:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 44473605E6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506041;
	b=A1squ9dg5bd4AnVv1yJsKda8mLKEYqqgQi3K93Pzg02MZCYQ4al5CgRvBFlPCFXDy1RV
	 HJKpwYKV+dW8mWCzvUd30QOJiHKxLcnk+DNs5TFvNyxhxjoOApiIr5srx4JqiRAJMpx9/
	 FFq/j2YUjytbiMklVYRh3G31HFRBCvgIwjwVhVBgbUhe1y8TfWexg1ejBCm4fr2B/OjtE
	 w8uAWyRJAVxjSrhPJ4PoIRNhPAab2cfcq8c/FDbIm24fvJqDR48myVHtihgC6UMLqStbb
	 iRwvJVqlYIeZvMGed9TyIGkNld4xanfSwabvZ9U+TTs/GcZDTy5KE0QpzIBK/lcCY9A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506041;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+ad4XvIk8KRN3crymuuUiV/3f/jcXmWAX8WkfdtfKG0=;
	b=sw2ILKYN0vh1uigZiAuhmcuO/C3HqF9S7qIkPtB172pUnXWkq2qeKdNSUnWKSAm92lLC
	 LVbbrFhdyI1CNASu13MBuGImcuYHc/jWce5Cfvwo0tTUg99sftM4RoccFrk2Cp44QAjoA
	 s+YJD5J7TfGGM4JOnrlX26tF0f63bJDh3kh3HY5Ffnui5dLyEKIsOoInK0/dJsWbLXb5r
	 Ah0UpdrOu8s7AFpcYMp+sE6ihJCtZz5P5/olbVh66I/vfc9/UF8FBDzEEikSf0MXNCZZt
	 ZbgVghJuXXgtksORn/dBLWeH3eEOvb8H3XGVcC8pZdg9PEIGT3+F6TXIuWM0C4xj2pA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=PUDujz0K;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506041;
	bh=+ad4XvIk8KRN3crymuuUiV/3f/jcXmWAX8WkfdtfKG0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=J8+T60Oea9VQ7P+FtjU9PRNrFBUL/EYQVYbKQ4oAhUnv5Dd3uC4hwU//0C+eUQT/9
	 3Zjh5xABHJPt25rMhdZ/tul8zx2TLoaHFmdFnqL9oZC3BR0L9gbb0s48x6bsm+sRW1
	 bdamgR2DMu1XD5asaHMcoTsaoLwWE3m69RXaFpBXvQpjBtIbXhUHLvm9Bc17X1ISk+
	 C3DpkEf7SwQqoWucCwGgxO+wvsEN3nUSy4cKHqSg0iEyVcqTPkMToannjrfG+2LF5H
	 6r87NVGVztPhG44+uiGAV4yg9uuLlwFEci+9N1Vwk/8MPFNEvI0nExdPa4RXBa+hPr
	 0wfMdnKu4lNgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44473605E6;
	Sun, 27 Sep 2026 10:47:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BCA25334
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2C6D605E6
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4fHZcz8pYap for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:47:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B30BD605D9
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506039;
 b=c7sWKXCYaqhX87/Qc2n97kxRxbiktVM4hR5EqXn6ECcHUVVbQi7TAdFaYVfdqkN9pv2n
 tzLcoYjno2hpNloxqHuLbTykrxoOQ98io2wXUyNY10YT5cwGaADX/odbredzjW/otw7mU
 t1ACtok2CipZwamOR85z6P+UAYCS9xOt5d61ZXAVoJedB5TNai9aIk5s9e3bCQx5UDHxu
 KuNYG5mW3MxiMmyfQEBAkD0RBVclGpfMRJRhPRAuGs1TzpddDSmSbcmqgzbQlK+Ruzmfj
 dnIoP9JLa8xBhlUOdKd2GfHe0opCEaKNrsxSvojsPFABynkxdmCd49l5xBFfhGdxDWg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506039;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5gDvCJ+UXhkxW77CQFBghKeHwlvChzvv2/WWLjOyl5E=;
 b=RN+0igsWj49tbMcVK1i9ULjEN1Bb0/YzhjopiPrNwmQ/BIAqDPZNE4bfb5TkOjF41ZoW
 q5CqHo2vv0Yi4izrcaxw6lznTwkxkRbNuWHtWlZRLPcd6kShIckxtm81pvnvynEZqTb6k
 efRXy7DH0W8bVUY9hPFLIaD0xYhCJc41QQuVikpgVzON6sJbhButP8Aqq1NGHPhILz0bJ
 sl6jnC6RcTIJI9igv3kqL2giUxM/49G2pUsnHsuAyYLuy+nmkUzh7baaM1zcQgtUt0uUJ
 JSQ5JI+b2ngmhWNmBiNDhOf3MS4FNqPydkRm4Oqt1ihpGYMcN+8TFFrECSHQIj2Qcfw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=PUDujz0K; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=PUDujz0K
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B30BD605D9
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505832;
 bh=5gDvCJ+UXhkxW77CQFBghKeHwlvChzvv2/WWLjOyl5E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=PUDujz0KiW8JzDQoRb851wukphPsbHnOfKFzfFw7Ts5GFbPmivSLCmcr6sF1mxmcz
 DHsZX73WBKxTkF8pz/epJV2tZ+DoposOLvoU5LCi/W9LOnjLj16pfruDzjScRklhXm
 bIUWE4RhX8KhcwZEzI5haWtOS1nY1l7WiMsq/pkJ7WBJECCrlZqiuecNVWO6hVPB+/
 EQfGwvUDUHjstllJo04EdTN46nwqG4YAIQTsXg+MyfaWIYz0vCo0Jc+7Qh2vhCe1/9
 dRbBcBAVdFeVZMNx4W7lG7cZpEGYPEh9o2+a6oVZ4sPcPn36HCUK9oXro+cesRzPAv
 I+s8GmVFsvDcw==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 HtD4D9I08bRI2PStMf5DTMPwaogh0Wj9wLLRfdwycZOSHVw2/hXkzXDPQfs9qXyUXwNn6n2f2zL
 EsahpGWXXbPWnMUbVd9Ab2oTnptpAlWtLqnsWrvEr3Lq8n/ZEod8I/lCQ2/T0fsmEkhdBoAC7P4
 haTMf84WmJKWb3SwaJyh5/c/OP/FRHrWo6aDxeQP0r5fCqEI1afsKAD2eUT4myk8u138veRrdh0
 2tlF3ZLZYGZaiVGuXhxz/NTjtLnEi089P1yX0kUYcIhpLO2bT8ZZqqkFkRNsKBWWykbJ1KnctXi
 MyOS2/qTKytYoRA19/0wcTBSpoWom+HK/YfXlK/8031SxqG6dBcAh27h9PGszvTe13i/4AgFK2J
 ePwIHScP9JyAiOjqN9ZqNsp9qVmF5xbztOGXskrFyH1MuyideiCmZYR75Bp4+IHYIOykp/vem1M
 ihHxDYqNhKx+cWs0l2NQkBoHMKgLIpiyyYZwZLFUzyq510zk2J+Ymf64pldsKrJq1IYYaab1XHO
 1vDNnjQHVZLREGb7mkUEeQoHhO8UfIvLXM6lvl96lM3v2MtPLU0g3K/TnmErS1Q+eii1zA8ErUy
 T8ymGzoSzHuGs8lsfjvYz/czoMQeFcPN7F4uYJhU21gnGnMMCAAvMA7bRMQuhpWb1/u33EQm/Ai
 m8k8IrcQSR0rckduCTFs3
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2E958A4C4F7A;
 Sun, 27 Sep 2026 12:43:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLi-0000000007a-1akD;
 Sun, 27 Sep 2026 10:43:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:46 +0200
Message-ID: <20260927104301.1801638-69-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v6 68/82] package/redis: Fix build with OpenSSL
 4.0.0
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

tls.c:676:5: error: 'X509_NAME_get_text_by_NID' is deprecated: Since OpenSSL 4.0 [-Werror=deprecated-declarations]
  676 |     int len = X509_NAME_get_text_by_NID(subject, nid, buf, sizeof(buf));
      |     ^~~
In file included from ../../../per-package/redis/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/openssl/ssl.h:34,
                 from tls.c:22:
../../../per-package/redis/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/openssl/x509.h:1041:27: note: declared here
 1041 | OSSL_DEPRECATEDIN_4_0 int X509_NAME_get_text_by_NID(const X509_NAME *name,
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors

Upstream PR exists to fix the build problem:
https://github.com/redis/redis/pull/15227

Added buildroot-specific patch to remove -Werror=deprecated-declarations
from CFLAGS to not block the bump of OpenSSL to 4.0.2.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...emove-Werror-deprecated-declarations.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/redis/0004-Remove-Werror-deprecated-declarations.patch

diff --git a/package/redis/0004-Remove-Werror-deprecated-declarations.patch b/package/redis/0004-Remove-Werror-deprecated-declarations.patch
new file mode 100644
index 0000000000..3c33456d52
--- /dev/null
+++ b/package/redis/0004-Remove-Werror-deprecated-declarations.patch
@@ -0,0 +1,28 @@
+From b42c0326b542b0e5d29cbfef2ab08d0d36430803 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Thu, 17 Sep 2026 23:58:19 +0200
+Subject: [PATCH] Remove -Werror=deprecated-declarations
+
+Upstream: not applicable
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 205508596..4f31a3af0 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -52,7 +52,7 @@ ifneq (,$(findstring FreeBSD,$(uname_S)))
+   STD+=-Wno-c11-extensions
+ endif
+ endif
+-WARN=-Wall -W -Wno-missing-field-initializers -Werror=deprecated-declarations -Wstrict-prototypes
++WARN=-Wall -W -Wno-missing-field-initializers -Wstrict-prototypes
+ OPT=$(OPTIMIZATION)
+ 
+ SKIP_VEC_SETS?=no
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
