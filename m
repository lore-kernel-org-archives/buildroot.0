Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D8DC02183
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 18:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2615606D6;
	Mon, 13 Jan 2025 18:41:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uYQy41-2tw66; Mon, 13 Jan 2025 18:41:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1629607CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1629607CF;
	Mon, 13 Jan 2025 18:41:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 80403942
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 18:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6116140507
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 18:41:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bkXvSmwacteV for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 18:41:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 34611404F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34611404F5
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34611404F5
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 18:41:50 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3a813899384so14145075ab.1
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 10:41:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736793709; x=1737398509;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CkyI+peg5Y/AY4Fl0ozYW546WwRFiV9vmWYQCHsy/WY=;
 b=SEUw0LRMy9753preUX8bHQlfmkkeVKcTvqGUZLVR7HtcDO4kRw8CR9GVD6uqXlW7k4
 f7i+ePay6R6SbB24RVz3rsKqpeMVlzwXMJeJVX++0oPwnhWjtDwkM1NpzohKilnVOVSI
 8eGzNsMzPiX/bc76gCBhE+u6Pe4RZrOcyK7WekNKWtC2gL7Im2VDDxb7jO5PhJATNZJ4
 aJPyFX8fZwx41PvzOHLupyih/i8h5hRCqaA71LHs+akkQo+Ost7vHSh9jkdly/yAZfeG
 ctiISxmHdNCoqzw1ZdUWQ5eaFmKty5OjygbFRcWdMkp1bKLitXsxUymUHefAj5DWwV6S
 3J/A==
X-Gm-Message-State: AOJu0YzUVga9yIfZg6LAFw4PG82oN3NejAGnyhdnzYTHyDs/vCoWtrdJ
 Rr5IP0wyjpf1J7+xrUCv52w/lF//MG/tju2hAsmkhRMut72GkfsUAassSWRZYUA=
X-Gm-Gg: ASbGnctTiizmucktwohb6wl9BD0Dw1mzMuAncJ6tEvfROy/IqHPBpIkH9FoBxqP9hE7
 Br0EDWio0lLTaUo9bFg5KL5MCOywHNVqVsJKovZIRGtVxrFZDAzBFVFNkK3hqpKDWifdJDP78O4
 WFyHf8XDzv2CnetSQpCjeSuGT2fqUXqh1YjUtjcDz+VYUrzdYWk3T5ss7zYquzz7QasrErKpz9b
 BokJjVKidHDoijpfVbB6vnAJGjLjs3RA8kenySKTkQQY+N076P/cNRY2Yy9PSm/2yBIZ+06HVtd
 cpAoMJBLt0HkFhNpmB+RkNNnB8/XpBg=
X-Google-Smtp-Source: AGHT+IHptkSATJGgYdzOVoJL7lRCx3G4wV5Ni3kjOaAvQckyUZDSNT1LA3Mt0y+DmW2gWsyhL/XfmA==
X-Received: by 2002:a05:6e02:1a89:b0:3ce:64a4:4c34 with SMTP id
 e9e14a558f8ab-3ce64a44d5amr61632955ab.3.1736793709003; 
 Mon, 13 Jan 2025 10:41:49 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3ce4afc3dd0sm27995125ab.67.2025.01.13.10.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 10:41:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Jan 2025 11:41:46 -0700
Message-Id: <20250113184146.3015828-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736793709; x=1737398509; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CkyI+peg5Y/AY4Fl0ozYW546WwRFiV9vmWYQCHsy/WY=;
 b=JoKrA3/GfbTG/r/Q/cDXg9+sThTRZzLaO0v+Ero/WGc9AFKKdz0if+z2M16Ghz0HHX
 hZubNgTrozMyHesDtyYlyFcUJpxvU5q4rO5Hw+Rc3FxQqKGFMebpA87RrPgpXiqBysFy
 +cecaa9do5MTnNui2OA4yb9MzXdugcDY3w3em6rU6mlM70927gqadSEFHDlvGeif3ux2
 +563VwP2Zua4saSSDQ2XpKBkUC4K3N1QSdnlERkWimqxDmeV3PsgjOYfcZakFywbSmk9
 Qxkh/g4zxeuBOzi2Pul4LgSWsETMkOESLRzuBYlBr+Dsiya8oMiEIoz4/cgit41JDMW2
 Ri+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JoKrA3/G
Subject: [Buildroot] [PATCH 1/1] package/python-marshmallow-sqlalchemy: bump
 to version 1.3.0
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-marshmallow-sqlalchemy.hash                        | 4 ++--
 .../python-marshmallow-sqlalchemy.mk                          | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
index 20714feb4b..1fa5cee0c8 100644
--- a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow-sqlalchemy/json
-md5  da3500ba7a5c4eb499c3564748d76ccf  marshmallow_sqlalchemy-1.2.0.tar.gz
-sha256  9787e95d52dc39f351db1ca47a7ca30b593e4f02b5c54592680bc03ce8ce0e79  marshmallow_sqlalchemy-1.2.0.tar.gz
+md5  355535b775773755337059a1a990a0dc  marshmallow_sqlalchemy-1.3.0.tar.gz
+sha256  5ddf583dd75fdf5ab31df76987cda2ba91942996ba5d577e92d6748fa93a5f52  marshmallow_sqlalchemy-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  906b5d9051e426144cb173ad911667b8ebd05a9c584c2c26c135b32a3ed12001  LICENSE
diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
index a1ca926b10..50bf77af85 100644
--- a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION = 1.2.0
+PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION = 1.3.0
 PYTHON_MARSHMALLOW_SQLALCHEMY_SOURCE = marshmallow_sqlalchemy-$(PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/9f/a7/5ee9c0073c34a2141d4ae5e90a6c131bc859c6f7b3367ba55c6910d48f3b
+PYTHON_MARSHMALLOW_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/2c/6f/38843dc27666b2c802edc256c1981a34d1c28e898f3503ab5ea89c10f138
 PYTHON_MARSHMALLOW_SQLALCHEMY_SETUP_TYPE = flit
 PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE = MIT
 PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
