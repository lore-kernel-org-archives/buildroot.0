Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D259EE784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 23:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2090F81514;
	Sun, 28 Dec 2025 23:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id weL_4kbXr4Re; Sun, 28 Dec 2025 23:43:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B288B81491
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766965436;
	bh=MoE33DNlLdvB3Nf1Cv8uuK8/0cI3h/0sqD7+QJr0rnQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=XkJkO2GZ65nIdw1KsmXZTa9Yvt3hrujnv56FunpHo+4q7+6CyY82b0i5foTbbqW98
	 sXXbHah0ZZ9GL/kNKYYO4owPhlB2v6EFtJEz8mX3N12CQdljR7381nRcKgsWQ7WBoE
	 0OyZuckz+vxoTgHNScTv/FuYY0B6R+7TQl+Dn0C/204FGywMCjo4lycFdod9YF14+N
	 FevrV6B5I+3sy/9tEBErBWJ5g90vK4GDsqw7XGvQdX9BGzM2uEL9mQqe5Ka06JJ7C3
	 2DXh9cMAQ71huK5kKEM1mX9pbAc+ql+OOvDDanFyQ90JIgxOnIv3QX9/1TMu3ZX4rs
	 BhAkaBzjWEVHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B288B81491;
	Sun, 28 Dec 2025 23:43:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EA0DF1E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 23:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB79840756
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 23:43:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RxcgzkwjTRLs for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 23:43:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5EB6740754
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EB6740754
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5EB6740754
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 23:43:54 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-7c6dbdaced8so7019294a34.1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 15:43:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766965433; x=1767570233;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8uPBunMlHF6SHyoveJCbVHANIMPDh05/1dvXfPeerM4=;
 b=X91xkCnJC0wUkyO9b5GizNzfcUL4X6wZ0ThlC+J0Iv3e5XtImDiARL+yxryUwOlHS/
 /fqpBaRxt7KcJnWd9ZKIyd2O7BznWC5mvkGsKYfbqWCppwrrCg1cEBW32gJEhBoAVVoU
 BlX+q2UpTIIN8xlZPVNw6MAnym+hAAkPI0PeLGFwbcTkS3LRyXKJUTUxivZw+CMtDSi0
 J6D3qGt2UmeH3lHhfCOA30CreZOSh3z3qOdoOTqVaaB1daGrjR8H4x5b9e1JbaBaPgO4
 +lXyhmH2aGgoceQi6e4zuQ/nOngSq8uyktg/AuSb3nYZ5HqUwh3eJvpcMgi4G1eTn1kF
 Lk5w==
X-Gm-Message-State: AOJu0YymYwmiuiNC6ya6SPlT24uwVvjI8XIF2ExF2Kgi+OYp5h/S2fEu
 AvrEtNJsUbA+fprvCypMR2OJCR8/FEk3tpCOmM4W9+TPczPuuJZYGhrUQNorLsTZINc=
X-Gm-Gg: AY/fxX4hiPOQiwXKbIWb7o9H3YDNwWfKayIarAk5uvQwyaShAbuJipBAD2rHvDzlEGH
 f40H2yplPsWSTW0S0HSMbfihc0hydRvKbTF1n1ticgDlBNfgcnpyw/AOSxbP3+G6iwZN7wNRSRh
 9nADYwmIbYy1YE9JWkWsbrzZ0cfmKvMVMSHEx2OXrl5kC+EyCFbZurSyI6Q80VqM1xsTiIpWJAz
 bjmcwVzD9lu+27YZriUcrfwX56KWeLYGnZMjg25N+S076PeIAveW7pAzmyih+UCSB3s66o2dFC+
 LGTOX424v0f8MfVSelvi9lREgtYoz3uoV5sVBIKi10JK1xqNMhmoLXGpzAB0cZGUBSw/K/lpEvI
 H0mHVEtr3RVDRP6+rGygAZhCFst/+9aYIPUFXzP2RF/SSBe/SZsT03ZUx3zxJH1w2CJep5Rbw48
 /zYtq3czj/n/YlH1iMaZQ9fOybn00Gj6aFx1224roIG8RYVtT9v0iXi25ceuAofUGb+o5/Uoqhl
 lyO5RCW077/yyz3/3hVB6m66gBS8Ul6aKSQ/cZTv3kW5Sul1ulrXnw=
X-Google-Smtp-Source: AGHT+IEVlHSxGbaGYOrU+jR+rkaC7Kheo/Yr0iy+BofZb7RM0ORNeDahGuzRFhrGZxVkFkOlBPYNwg==
X-Received: by 2002:a05:6808:6146:b0:459:ae3b:e81e with SMTP id
 5614622812f47-459ae3bf096mr3832703b6e.40.1766965432900; 
 Sun, 28 Dec 2025 15:43:52 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc66645494sm19818454a34.0.2025.12.28.15.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 15:43:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 16:43:49 -0700
Message-ID: <20251228234350.2887246-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766965433; x=1767570233; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8uPBunMlHF6SHyoveJCbVHANIMPDh05/1dvXfPeerM4=;
 b=OzxVtKXvwrGpz+fB57aVYEciR39XXQJG06XlUqKs8DSbt03/Vm3xGSZbkomFZT3E69
 1tAknFnBF7jV8/bweFb5bYcy/lGKhUF+UEp7Y/RPrCdKgEp/eUYmCD/350NKKaHY6Epq
 ggebFgfShqakj4cHrXLZfwEGXgQNDd/EXIt4cj9m7erWNa7zkHjycXoOh9WbXNZ3sYnc
 AY5H1PCqiQoB+//SKETZIlRJ1VBvhbjBWLefSjEP5Jzyfc+aF5cHo7wtAuPD9Ktx97yw
 0lNcctAaKU8Kt3u6BZY33hsHBkMjTtezbcJ9tPXYhiP1vDPdoUawcVzruqAFY9QnaDUd
 R5HA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OzxVtKXv
Subject: [Buildroot] [PATCH 1/2] package/python-base58: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                        |  1 +
 package/python-base58/Config.in          |  6 ++++++
 package/python-base58/python-base58.hash |  5 +++++
 package/python-base58/python-base58.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-base58/Config.in
 create mode 100644 package/python-base58/python-base58.hash
 create mode 100644 package/python-base58/python-base58.mk

diff --git a/package/Config.in b/package/Config.in
index cd8765bbcf..2af6940dd3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1021,6 +1021,7 @@ menu "External python modules"
 	source "package/python-avro/Config.in"
 	source "package/python-babel/Config.in"
 	source "package/python-backcall/Config.in"
+	source "package/python-base58/Config.in"
 	source "package/python-bcrypt/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
 	source "package/python-betterproto/Config.in"
diff --git a/package/python-base58/Config.in b/package/python-base58/Config.in
new file mode 100644
index 0000000000..27eff77c44
--- /dev/null
+++ b/package/python-base58/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_BASE58
+	bool "python-base58"
+	help
+	  Base58 and Base58Check implementation.
+
+	  https://github.com/keis/base58
diff --git a/package/python-base58/python-base58.hash b/package/python-base58/python-base58.hash
new file mode 100644
index 0000000000..fa24123851
--- /dev/null
+++ b/package/python-base58/python-base58.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/base58/json
+md5  3595b886f6d57b947fa8d38d4c92e5b3  base58-2.1.1.tar.gz
+sha256  c5d0cb3f5b6e81e8e35da5754388ddcc6d0d14b6c6a132cb93d69ed580a7278c  base58-2.1.1.tar.gz
+# Locally computed sha256 checksums
+sha256  cf4694f040b7a31cd8ec3dbcd0b583a601c0d4c37de016be7aa0a06e3a6a3a54  COPYING
diff --git a/package/python-base58/python-base58.mk b/package/python-base58/python-base58.mk
new file mode 100644
index 0000000000..59822c62d7
--- /dev/null
+++ b/package/python-base58/python-base58.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-base58
+#
+################################################################################
+
+PYTHON_BASE58_VERSION = 2.1.1
+PYTHON_BASE58_SOURCE = base58-$(PYTHON_BASE58_VERSION).tar.gz
+PYTHON_BASE58_SITE = https://files.pythonhosted.org/packages/7f/45/8ae61209bb9015f516102fa559a2914178da1d5868428bd86a1b4421141d
+PYTHON_BASE58_SETUP_TYPE = setuptools
+PYTHON_BASE58_LICENSE = MIT
+PYTHON_BASE58_LICENSE_FILES = COPYING
+
+$(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
