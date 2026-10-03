Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52594CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A52B60F84;
	Sat,  3 Oct 2026 15:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dJbhfT5TSeUd; Sat,  3 Oct 2026 15:56:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1366C60F80
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042973;
	b=kiHmJLuZYqnHvluZ9bSKcvt/5nfiH5AKTVuj4z5ZmonOo2oK2nDmSe0hJMArcxqPXtqr
	 NXdxxO0Ka9T/bGZvcsy3K82uJCxfQZEze3pfUaKrgo8LnkF17JVSu2nq6ykhkaemVuGgD
	 VIyrPhlPcnNR4LWjb4BtE/aklPgXvv84U7kN6du5OCXuP7I+P4hnBVKKRG4VsSbl675Y0
	 8H0YvkU7IuUraJxLGle9Ej3rVLISH/1TlSVL/wujX/osv8S5yIuOahfkx9q8MxRR642kX
	 0iRA1Q9Ef47vi39KRxYzGdRAEgZzRp80IG4zOsdD7OhzeYyie1OPpd6k44YPsFWiKvA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042973;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JS7Qc8sDmVyuu4YDZMd/y1nzKf31tUkMKd6Vwn4fENo=;
	b=pDUJmRXPexNMIG5jzWHLdFeYjsq1ZlaPubkceOZBXyALCiANZBf5nmnTsULR0QI9GJyp
	 vxqeabn2VxzkZ97P8LxdetTfaOjN/GSRL9WSnPbJ3xsyGkahZmD7481iHFypjpBdRSM4c
	 0eeDvxZ8QwbNdDvyUGDauz5s3jz7Xlogw9i6pWM4Xd1mtXvWUt2ASAVtvdM/DyX3exmsh
	 tQclTkfJtWg2DOOgsyoGMbopAvb6oHaMUbXAGmnADe2j5xx98YBX+Zp5vzgoVcy1uzTQE
	 gWTOd31mzgQyqnPgg2XtPe1XX2EWOZHeBHU3/zjX+ybThDJWD3/kOOkbKfWjbbkq8zQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042973;
	bh=JS7Qc8sDmVyuu4YDZMd/y1nzKf31tUkMKd6Vwn4fENo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PjdSayY8iklcJdpVKOU3JE4M4vYA6kx8/n69Z1qIWauEY52l3a7UmNXAczP1aL28m
	 cnAWfWbchwaOdkxWcn/6Sjm3ASsfPJezFd/4X7sCnhGiXWSyAcN/sTLOcSGh3yyZHY
	 zrELdkB9dQIBJ/Bt7xTrwBxOEhkOF9XikGpsVjok6d7mvqwWweqBiEd9ym9MqCsEpD
	 1uWAr6MO8E93aVAQgYqLTwXf0s2MnJsRyewRr6zrl1864hfMnC5URjpPsbL4gkFt1b
	 xbXC1v1sTdW3S1ZKb+/IEsEn9dN7MWuaTvk8jAYzblPS2VLZDDw/DNA9HE3zd3U5gh
	 Lyax2G++XY1yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1366C60F80;
	Sat,  3 Oct 2026 15:56:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6777A476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41685606E7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uf6jnO2lpO4f for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 373A160684
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042846;
 b=QhtZvKLYCeILoRZAggjGfAlCSXZBGw52Uwt9gmdJfxspXywfecQ1YmwnxwP1gNK4DAFt
 Yf5KIjkHkw9ezYOhAIK+HO//C1HEj2RHnhQiFL0mJZuhfqiRyJaqf78q5rqh8WnYbd9Xt
 tC6NUEyEQ6qmplmoLyOwuW6F52I0HAHtwlRg1kv3XoTrCJH4osgLUdJlTZj1mu2T04Eq+
 WUeNyvbhq95dVtvCHP77OOLHBoKYCpsAfLX5fztFWI9HQGHGYryMteO6tlh2QLwtdRXZc
 9bRG9Ro7J7LMthG9bNvkkUkDq23OfGFuK5YeQlDtjjhSlAfTl5LFzaxmdDxi+qDyq5Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042846;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ZJLQs2k6NQtdwJvs75MHi0KSaMG8vxBIfZJQNBQjDSA=;
 b=WeINFERxjaALYkY8PUnXbVsTF4sKIivfXQYCTDq8AUaIVT6sEu2i0mcOAZbIkuqW30KC
 kArwYVWtdZtb5eijqIVqwE8tXUnKlv72cqFVXWeXXa8j1DG3r/yhlyE2UIGIZDYKN+Iaj
 n1wiR1obKpozrxzQqg2M5bkA7QKc5f5HWe+ygTAnoi7OumcMdu+6wenlQyeJxhJI35CZm
 YKrgI2tx+rG88gs4rqUb4Irb1VspLSQyYi1plSu5+CzfJ8Y4/8sQ5J8wbKu2SO3+GKw6z
 +4Rpk5dFTAAp1jH43dcyA1kbhxSMrzoRz3MYbF4Hh75SUHaz4FMuZ0I3ZZAORHL/Hwg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 373A160684
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77D7F8A30A; Sat,  3 Oct 2026 15:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d5207c9fad94d2c33295ef3f50d9edaacafbc39
X-Git-Newrev: 739f1a07df46a37fcf30c43b804dc51cb0d2f0f8
X-Patchwork-Hint: ignore
Message-Id: <20261003155251.77D7F8A30A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-autobahn: bump version to
 26.7.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/739f1a07df46a37fcf30c43b804dc51cb0d2f0f8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 34d585278f..64715ff622 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  3dbc5c77f853b68a4a8c8ffcbd4eb024  autobahn-25.12.2.tar.gz
-sha256  754c06a54753aeb7e8d10c5cbf03249ad9e2a1a32bca8be02865c6f00628a98c  autobahn-25.12.2.tar.gz
+md5  d6e43b49c77a11d5b36ac8a2da415d0f  autobahn-26.7.1.tar.gz
+sha256  c6949a2c6eb95fb1c218837dbda0a59abbbebafb8b11098551c01a7061dfd245  autobahn-26.7.1.tar.gz
 # Locally computed sha256 checksums
 sha256  ff61657bfe1984c96d932fc0423268097b4b588bc57d47c26e8d680250d6c76d  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index f110276018..bb411033fe 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 25.12.2
+PYTHON_AUTOBAHN_VERSION = 26.7.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/54/d5/9adf0f5b9eb244e58e898e9f3db4b00c09835ef4b6c37d491886e0376b4f
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/de/73/f109f563c27e048e45d135d81af19e6ca391e24905550b06bd1c9d674c57
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
