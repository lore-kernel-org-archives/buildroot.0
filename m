Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093C9C77B73
	for <buildroot@archiver.kernel.org>; Sat,  3 Jun 2023 21:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45F4B83EE1;
	Sat,  3 Jun 2023 21:06:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45F4B83EE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nsEhdMJmZ-vM; Sat,  3 Jun 2023 21:06:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4307983EB3;
	Sat,  3 Jun 2023 21:06:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4307983EB3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 861691BF309
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 21:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FB8B60F93
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 21:06:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FB8B60F93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5wL5O6DOnZop for <buildroot@lists.busybox.net>;
 Sat,  3 Jun 2023 21:06:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3137760F0F
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3137760F0F
 for <buildroot@buildroot.org>; Sat,  3 Jun 2023 21:06:48 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f7353993cbso3203075e9.0
 for <buildroot@buildroot.org>; Sat, 03 Jun 2023 14:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685826406; x=1688418406;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3Xr94jBI431THhbTY/GGH6ULSPPNaeS923Rb6A/4uJM=;
 b=cJMSi0ootFv1ZkV8fX5rNLFDGPLF92OsVoVwzAE5ik/GD573J75oRk4CiCxohPujHO
 DiKoM3nOwyYc31GNz6vmxyIUyH41iETV6RMhb4Oi2asSFeqeWnF9hg0i+/o3OOCm4AcO
 Wg7zT0XqugjDQoH01oqL9afKqPF9byOW4atELp0Tcm4hldpBPcqEcJgAhIYVM3QFEo8D
 W8B80+BoVjvyNNjbCf/KVEDESgwRys9yBHIOoJTaCMmY8tWJrtrumSuWWnqqyqQj94Qm
 4e/SIK4Xt+Bc8FozpNXVVcr23MYIyMmjVEHKZEFd8cNKKIR3uUxcrIjAlJ34/t0U7/A0
 aocg==
X-Gm-Message-State: AC+VfDxqc5PyGj0RgSIoXmSoUwZceUmM6xCu4dR+R+gbJ6e3qJEHmcpG
 TsecFoSh9i48TMlmmkCDk+yOUIU7Pew=
X-Google-Smtp-Source: ACHHUZ6bzGkr27yjzdrgbVHJhGBqN8G5jSa15jndF3frlrOOnVQcBcJpC3YJJq8Mr8uzC+eYxy9okw==
X-Received: by 2002:a1c:e901:0:b0:3f1:731e:cdb1 with SMTP id
 q1-20020a1ce901000000b003f1731ecdb1mr5036852wmc.6.1685826405978; 
 Sat, 03 Jun 2023 14:06:45 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a7bcbcb000000b003f60d0eef36sm9600699wmi.48.2023.06.03.14.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jun 2023 14:06:45 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Jun 2023 23:06:42 +0200
Message-Id: <20230603210642.264930-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685826406; x=1688418406;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3Xr94jBI431THhbTY/GGH6ULSPPNaeS923Rb6A/4uJM=;
 b=JSzYlm1fKU+o1TRUWznmVizTMsl84/1wZfdHeBlEf7NpL/qkyQfR5iNfA9Vu8tS/NF
 JMiR1zBEJ/AmB60gYXR26d4z13Ivpk1bk1au3xMP0ZKhWf9aXf4F4wHcQRJZlHmw6qoq
 nRFYUWGqVY34dLo7T0rjuipdf6NkncHVVl6TDvpYrP3TRWvaK9vjDNv5NXB3ArxYu8RM
 nZno3GMifbJCOyejKU2HH3pkdhkAkIGU8UByn4E+vCiw7khy49sZuH3dsyvb5IpFW1je
 e4ghGvu3Lln4tRsY3WV45xh+VHmOYRTPJHyq4gForXe30JanLsOE/FQDI5Q++PspAno8
 Q8/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=JSzYlm1f
Subject: [Buildroot] [PATCH] package/perl-http-message: add missing reverse
 dependency on perl-clone
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit [1] added dependency on perl-clone but forgot to propagate
the reverse dependency on !BR2_STATIC_LIBS.

Fixes:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PERL_CLONE
  Depends on [n]: BR2_PACKAGE_PERL [=y] && !BR2_STATIC_LIBS [=y]
  Selected by [y]:
  - BR2_PACKAGE_PERL_HTTP_MESSAGE [=y] && BR2_PACKAGE_PERL [=y]

http://autobuild.buildroot.org/results/5d5/5d503aaa94b56523c684be7946123921747ebf52

[1] 742258fec06df18782e4bd75b00ca530120312cb

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
While looking at perl-clone build, I noticed that "-shared" is provided
to lddlflags by the Perl package infrastructure:

  --config lddlflags="-shared $$(TARGET_LDFLAGS)"

It would means that any Perl package in Buildroot requires a dependency
on !BR2_STATIC_LIBS.

Currently some Perl packages doesn't requires !BR2_STATIC_LIBS since they
simply copy some .pm files. But as soon as something is built, it break
for static only builds.
---
 package/perl-http-cookies/Config.in   | 4 ++++
 package/perl-http-daemon/Config.in    | 4 ++++
 package/perl-http-message/Config.in   | 4 ++++
 package/perl-http-negotiate/Config.in | 4 ++++
 package/perl-plack/Config.in          | 4 ++++
 5 files changed, 20 insertions(+)

diff --git a/package/perl-http-cookies/Config.in b/package/perl-http-cookies/Config.in
index 3ca461bf83..147d9521bb 100644
--- a/package/perl-http-cookies/Config.in
+++ b/package/perl-http-cookies/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_PERL_HTTP_COOKIES
 	bool "perl-http-cookies"
+	depends on !BR2_STATIC_LIBS # perl-http-message -> perl-clone
 	select BR2_PACKAGE_PERL_HTTP_DATE # runtime
 	select BR2_PACKAGE_PERL_HTTP_MESSAGE # runtime
 	help
 	  HTTP cookie jars.
 
 	  https://github.com/libwww-perl/HTTP-Cookies
+
+comment "perl-http-cookies needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-http-daemon/Config.in b/package/perl-http-daemon/Config.in
index 0c7ffe723a..4d6277a799 100644
--- a/package/perl-http-daemon/Config.in
+++ b/package/perl-http-daemon/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_HTTP_DAEMON
 	bool "perl-http-daemon"
+	depends on !BR2_STATIC_LIBS # perl-http-message -> perl-clone
 	select BR2_PACKAGE_PERL_HTTP_DATE # runtime
 	select BR2_PACKAGE_PERL_HTTP_MESSAGE # runtime
 	select BR2_PACKAGE_PERL_LWP_MEDIATYPES # runtime
@@ -7,3 +8,6 @@ config BR2_PACKAGE_PERL_HTTP_DAEMON
 	  A simple http server class.
 
 	  https://github.com/libwww-perl/HTTP-Daemon
+
+comment "perl-http-daemon needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-http-message/Config.in b/package/perl-http-message/Config.in
index 3c6849487a..e2cb42f941 100644
--- a/package/perl-http-message/Config.in
+++ b/package/perl-http-message/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_HTTP_MESSAGE
 	bool "perl-http-message"
+	depends on !BR2_STATIC_LIBS # perl-clone
 	select BR2_PACKAGE_PERL_CLONE # runtime
 	select BR2_PACKAGE_PERL_ENCODE_LOCALE # runtime
 	select BR2_PACKAGE_PERL_HTTP_DATE # runtime
@@ -10,3 +11,6 @@ config BR2_PACKAGE_PERL_HTTP_MESSAGE
 	  HTTP style message (base class).
 
 	  https://github.com/libwww-perl/HTTP-Message
+
+comment "perl-http-message needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-http-negotiate/Config.in b/package/perl-http-negotiate/Config.in
index c519ede2df..2e82ce5ad2 100644
--- a/package/perl-http-negotiate/Config.in
+++ b/package/perl-http-negotiate/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_PERL_HTTP_NEGOTIATE
 	bool "perl-http-negotiate"
+	depends on !BR2_STATIC_LIBS # perl-http-message -> perl-clone
 	select BR2_PACKAGE_PERL_HTTP_MESSAGE # runtime
 	help
 	  choose a variant to serve.
 
 	  https://metacpan.org/release/HTTP-Negotiate
+
+comment "perl-http-negotiate needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-plack/Config.in b/package/perl-plack/Config.in
index c81ac4a444..420f8257e5 100644
--- a/package/perl-plack/Config.in
+++ b/package/perl-plack/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_PLACK
 	bool "perl-plack"
+	depends on !BR2_STATIC_LIBS # perl-http-message -> perl-clone
 	select BR2_PACKAGE_PERL_APACHE_LOGFORMAT_COMPILER # runtime
 	select BR2_PACKAGE_PERL_COOKIE_BAKER # runtime
 	select BR2_PACKAGE_PERL_DEVEL_STACKTRACE # runtime
@@ -19,3 +20,6 @@ config BR2_PACKAGE_PERL_PLACK
 	  toolkit).
 
 	  https://github.com/plack/Plack
+
+comment "perl-plack needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
