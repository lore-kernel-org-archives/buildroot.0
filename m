Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E443CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 21:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A2A661039;
	Wed, 15 Jun 2022 21:29:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YWYOIWw4Ki0k; Wed, 15 Jun 2022 21:29:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0FA560F6B;
	Wed, 15 Jun 2022 21:29:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 77D1F1BF3DC
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 21:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65FF24048F
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 21:29:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QnRsSHQxAcEL for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 21:29:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62EE04010C
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 21:29:38 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id s1so16970007wra.9
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 14:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OnaOXQGKm17p+I3uA7ebrkGTUoZF18WsxxN4wVSq7pE=;
 b=VXsCI6Y5gFaAGqKQeFo4N5aoJjUazvZOYmnySdMxl5Lhj/jtXoVr9rTwiAYk1hoLUT
 k7wFk5z/sfVBVtSrSRJ5nyjFGc69Kq4wGNJv2ITSLdepJMf5NHGIxQdNPwORXcWK7BwO
 Vmv/9+cDY2M3V3aEZ3jh/2JrBLzxufl4vCedgntdPYhhvVrhhLaP0L+yj8IOOC4Mh2rH
 VW4Gy5qS86QaCa+UJzECTCDRoMPD8B1nK8qLE71O1/L9mWEIvxEvzT+2b92MTbqd4gnB
 c5i3cCCCVBkaI2eshZM2Sxgj8ZW1PXvIDF5LIqRXho1IKa3Ev6zXU2DIjBrxm5qzU022
 ktVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OnaOXQGKm17p+I3uA7ebrkGTUoZF18WsxxN4wVSq7pE=;
 b=zacgv7pb9iJxbPkY6EzUSZouzjN5zWU9Q2bGzNHDUitapq4cTzFA7B/GsY/feXovHY
 1XNrJ3vt3JO6GfKCBzgLRpIZTf695SZmrIGAh47c8Dd3t3GuXTtQ4B7tikUXScdU1dop
 mN6xKPtbXKoyBq6iAQ/2gonOuX3R6+sF1tpXb7OL3cZC45Kb2fE1VPUOtcvoyea+xXlL
 Sz1+SggJIja5l8dfPGyzd74rlzxWuUxLf2fb0uchWonKeUi2MZRKnIokQbYvNIkWo5/y
 Ex8KMOt+8sJErEmu9ofxhgLrmv9btmlViyLL1mMtS8QHDCj+vHIXMODdrJBvXgcPjGrn
 sAWw==
X-Gm-Message-State: AJIora/2W/asLDvmgvT1UU2mpXhHu+VwKpb5z+jRpdHp2I8VjJxnJWSm
 OGRRP9nsI/f7WuVDVLspYdMXu5aguWo=
X-Google-Smtp-Source: AGRyM1sG3OJXuhn5ibmySPfEYqBnKtAHQjMrymox2luvMz7prGUDxHCmsKlKPcLgXIZ/alHZ9p93Ew==
X-Received: by 2002:a5d:6d09:0:b0:21a:1321:55b6 with SMTP id
 e9-20020a5d6d09000000b0021a132155b6mr1567847wrq.117.1655328576301; 
 Wed, 15 Jun 2022 14:29:36 -0700 (PDT)
Received: from atlas.home (amontpellier-658-1-206-168.w92-145.abo.wanadoo.fr.
 [92.145.215.168]) by smtp.gmail.com with ESMTPSA id
 l9-20020a1c7909000000b0039c96b97359sm76772wme.37.2022.06.15.14.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 14:29:35 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Jun 2022 23:29:31 +0200
Message-Id: <20220615212931.1082542-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] Revert "package/python-flask-expects-json: bump
 to version 1.7.0"
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
Cc: Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit 16bfb1a3c45656da85aca892125b032befbbdbe4 since
python-flask-expects-json >= 1.6.0 requires at least
python-jsonschema 3.0.0 (v3.0.0a1) to be able to use the following
import introcuded by commit [1]:

  from jsonschema.validators import _LATEST_VERSION as LATEST_VALIDATOR

Indeed, python-jsonschema package still at 2.5.1 version.

Revert this commit instead of trying updating python-jsonschema
and introduce other runtime issue.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2580341645

[1] https://github.com/Fischerfredl/flask-expects-json/commit/e1d2898ab1ca7bf02ae60885f9be92b31fa8a62a

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-flask-expects-json/python-flask-expects-json.hash  | 4 ++--
 .../python-flask-expects-json/python-flask-expects-json.mk    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-expects-json/python-flask-expects-json.hash b/package/python-flask-expects-json/python-flask-expects-json.hash
index e465bcb56a..c023222fd7 100644
--- a/package/python-flask-expects-json/python-flask-expects-json.hash
+++ b/package/python-flask-expects-json/python-flask-expects-json.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-expects-json/json
-md5  3a77c4059f21e6e37e652c9dbbdc2e7c  flask-expects-json-1.7.0.tar.gz
-sha256  4ef186a86f10572a21af82e549546deda024326628b4a96cd14d3a0f71754d62  flask-expects-json-1.7.0.tar.gz
+md5  c1fb8ede58db312d7923212dc97b8ab4  flask-expects-json-1.5.0.tar.gz
+sha256  0087dc3d089f1ac75a1fc0f259f4dbd02bbb9c356e92e1a080f2309e2f75d053  flask-expects-json-1.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  06154a99fdc664107294a0a5e7e68f776078d075408dd32bbeaa7340fdd39e73  LICENSE.txt
diff --git a/package/python-flask-expects-json/python-flask-expects-json.mk b/package/python-flask-expects-json/python-flask-expects-json.mk
index 55c9bc9571..487f15d4e5 100644
--- a/package/python-flask-expects-json/python-flask-expects-json.mk
+++ b/package/python-flask-expects-json/python-flask-expects-json.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_EXPECTS_JSON_VERSION = 1.7.0
+PYTHON_FLASK_EXPECTS_JSON_VERSION = 1.5.0
 PYTHON_FLASK_EXPECTS_JSON_SOURCE = flask-expects-json-$(PYTHON_FLASK_EXPECTS_JSON_VERSION).tar.gz
-PYTHON_FLASK_EXPECTS_JSON_SITE = https://files.pythonhosted.org/packages/12/a5/b27cf21d62c2b5a0a32e2f92bde9658e74c34fcc2e004bb0d591f1bf7627
+PYTHON_FLASK_EXPECTS_JSON_SITE = https://files.pythonhosted.org/packages/4c/4a/9d9d050af700fb3feebd1f8466e73d65ce8b4709f27773e07100b0993451
 PYTHON_FLASK_EXPECTS_JSON_SETUP_TYPE = setuptools
 PYTHON_FLASK_EXPECTS_JSON_LICENSE = MIT
 PYTHON_FLASK_EXPECTS_JSON_LICENSE_FILES = LICENSE.txt
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
