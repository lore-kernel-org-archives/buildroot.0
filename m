Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FC5CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8D90411BC;
	Sat,  3 Oct 2026 10:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-778cMm1bq1; Sat,  3 Oct 2026 10:07:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D90E5411B8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022060;
	b=QVOkvaq6tdCeejCFnj93lI4FywUWkCw1jGjkj+hO3wYksJO2VrTHoztf5u5Rrigvsv/t
	 vrwLH2T4oG5g65Sv8R4AMbkHGGn/gMrC3xRdjqiL8JSR3vnAYkKOrAOYRK3e/anP4KFz6
	 VB9xtAWSe1Sm1q86TDYEaUhN/tp+4RfgI4XR69YiWnGHJXWV7xNf98w1bTzqlVoogW+y7
	 1gxlu7bUBZGAA2nD9HmdTCg9odoEMblsdby1mhUbBPm3nG/uvCZoXI+ZzE35dslPvG8sY
	 gZVTNyrE+TD+xrp4hXHod5APAMH4wuy5lS+Io1B0cLJaOAnlkH0IAcjU9Dwdji3+Wbw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022060;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wMfQjc7MX1BLZMhpCiiyn4Dp/bs0swmT5NetKUq7lFQ=;
	b=HcjBRVhm2MKPBBr84ABFZaig3sM4XXdM1bREV0Widj9zKUh8mN8fGQFu6CEMqXHbKk9m
	 IkN+bJi3Fx/XwY2/a5ueCRLPxARqmxD6P1BnCpnsG62trELTy2q0u86gtmCeFpyavwd9m
	 CqCTIhPEK4K9aS27h++WEasrDQkpDQXSufoPMrluganhpSXhoJS7/YLiQjF4IYqnkYDy+
	 N1ge8YIxQ2BTaivrVuTGBSlSWPP1jXn65Z565O7mt4WexxJPO56VII+Dlo85iSCifir+L
	 DLjq3QHeJKBoPXMRTcQ0jRWeoAaLuug63cIK7D6Sbfo/iVItU7FK9FZIcY5I/AvTSbg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022059;
	bh=wMfQjc7MX1BLZMhpCiiyn4Dp/bs0swmT5NetKUq7lFQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HjZNzRZvnoi8E3pQS8jAbhYxeuSEXx31hD6GMldhjs3U2CdAEwzAj1aRlnqj9MKZA
	 IUd+e9Oet5PaSX06aC9UfRF0RF6vdkH4d5nXiQcl2O3OdntdZt3Bl3ZeHDEUzzKR/M
	 WT7wEeK/XX1n4GE3vjhBjk0v2GgVFjS+ywDa8CF5ZV8Apttl3BIdz6+dtbdZFqqWrs
	 0WEam90/HSVzLmlw+7keQ7VO+FW7K1BwqXKGNagtaWvTr+yBpICD6OlhawVd2xmyTp
	 Jei7oC+gWFB1QtThBj11Kf5ISuP+6FNrkRJzfXtNnkbckKVy1fm4K9Rvq3E5NGYFk/
	 yQhpjAf0UMB+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D90E5411B8;
	Sat,  3 Oct 2026 10:07:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DE808179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC1AC60E7E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8gKayTzuRHEi for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9CDB360E82
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022028;
 b=OfdaR+aAkyh2zckqKwWVJLmbOGQtrRPZK+zk60t3AaIVrSMzcgOBqYTeR4cQHVyrHFBp
 c90LE055xqLBfqpFK33vstPw6E6KBvjSR1+oewG3bNQN4gcrVYb9HzN2UKGdLopn7Hc5m
 McfyoV4SuZdQ3E7/KZZl9ihwz097C3SnM8/aGUokb75fcyEQHnuAkVfvHQCw0S/m8NXgo
 on5/my0xjdJdY/Q+nRvm2OggWh2bcMUm9R2jCmodQQFkEZIlcmaZyC9zTJnTxd2Z3QCTA
 Sv+pQxIkNABE3YVxbG4taVjs+X6X1QHZKwQ8GTYF3cbuhJWJjjmWc2S9R/ovfvsoihw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022028;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=c1yiTqRNMjNYxyRebSbPEEn/XWSMbs+GoZ5uKhiyhok=;
 b=TC9+6ccjWPHLGLB3BmJk9xaqhc6hPhlSU6qSJpD6ty5/V96Hqh5S10FlycjoiuSb/flE
 vo7IMKhAom84YjPgr6GTcZuMQBOgJbWllw8hZMMAPaf/JkI1uBsBpCkWWahWZbIGSXNhm
 W2iecS+SdkE8Wc2JK39Shvr4zfj+nG7bs4ne/RQPFy1b/A8iXRfFGvy7O2JJz4VO9EJuR
 glVMe2sX959kaNlWJtI0mwfdqiSfuYuKrpb4F2eQduVjJD2M+p1uZ0n8feM/OM+XDXO+q
 GJ45AhFY4qIwMHMbEdtEoP53v7XXTST1h+zry2egAdWTWzKrXxUfzB+6kWDtpepT1gA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CDB360E82
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07CA488762; Sat,  3 Oct 2026 10:05:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca05d08240534037abae328ed33256a394304997
X-Git-Newrev: 9f8f9092b0d9fd813fec3310e6eb01fa2575ce8b
X-Patchwork-Hint: ignore
Message-Id: <20261003100554.07CA488762@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flask-cors: bump to version
 6.0.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9f8f9092b0d9fd813fec3310e6eb01fa2575ce8b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add the host-python-setuptools-scm build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-flask-cors/python-flask-cors.hash | 4 ++--
 package/python-flask-cors/python-flask-cors.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-cors/python-flask-cors.hash b/package/python-flask-cors/python-flask-cors.hash
index 399cfb707b..f9508c7826 100644
--- a/package/python-flask-cors/python-flask-cors.hash
+++ b/package/python-flask-cors/python-flask-cors.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/flask-cors/json
-md5  3900828750db0cd4aa93fd9964d533a0  flask_cors-6.0.2.tar.gz
-sha256  6e118f3698249ae33e429760db98ce032a8bf9913638d085ca0f4c5534ad2423  flask_cors-6.0.2.tar.gz
+md5  2dad2b346839f6a55e92c7fe4c24aba3  flask_cors-6.0.5.tar.gz
+sha256  30c5031552cd59f620ac0c8211dac45b345d3b2df310e7721879e4f46ef9c601  flask_cors-6.0.5.tar.gz
diff --git a/package/python-flask-cors/python-flask-cors.mk b/package/python-flask-cors/python-flask-cors.mk
index 5049371956..4f16ed0dfa 100644
--- a/package/python-flask-cors/python-flask-cors.mk
+++ b/package/python-flask-cors/python-flask-cors.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-PYTHON_FLASK_CORS_VERSION = 6.0.2
+PYTHON_FLASK_CORS_VERSION = 6.0.5
 PYTHON_FLASK_CORS_SOURCE = flask_cors-$(PYTHON_FLASK_CORS_VERSION).tar.gz
-PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/70/74/0fc0fa68d62f21daef41017dafab19ef4b36551521260987eb3a5394c7ba
+PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/47/03/4e464a50860f9adf08b5c1d3479cb8ea1f12af2aa69535c7042c6e628135
 PYTHON_FLASK_CORS_SETUP_TYPE = setuptools
 PYTHON_FLASK_CORS_LICENSE = MIT
 PYTHON_FLASK_CORS_CPE_ID_VENDOR = flask-cors_project
 PYTHON_FLASK_CORS_CPE_ID_PRODUCT = flask-cors
+PYTHON_FLASK_CORS_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
