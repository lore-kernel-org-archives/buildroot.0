Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED48C982DF
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64C9C60E16;
	Fri, 18 Sep 2026 19:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3WxJzj8iFUfQ; Fri, 18 Sep 2026 19:35:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9891E60E03
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789760135;
	b=nYK98rq/X1YBWZIbcHhhRjQWhCuXCwPfv1tqzPa1fe356D4gweyMdXleIynhwAyY8v8B
	 bgAortAo5Ju2wrJzBHCx3gKJFNIH05zIlZXLM47rEHP3yePHdyLzOU3ovUPBzIvqv+3xX
	 H8IG5js4Y02N6y6c/GnqJbUmLheKVpD/6d3S9Eid3NzJ877NoJWzpOZD/kWKNuhAy2+97
	 XiCJGuLvc9uJzi5PCZq0gy74b5TYZhdVwjRhiKfadkc+xln+R8lQa6ZsIqVswuUCmGa0f
	 O2qyAN5C4X5CTLeMdTIJaO7uuV/lHVqm8zLo6WD2wGIVD5L5alSCKmC9AZ5byBgZmCg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789760135;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PaD7S3wfeQEYrQfNDBkIGqF7Di553sASp0UZVTNeCWw=;
	b=gDk86SBLFz2JzOZBrgyNgGSNvhY2aGycnwyT4K5T1bv2a1g8uInp6+1N+p7BB8iq1BXm
	 vn6OL8SrgV1zg1oTgIXPXVhVz+ujuvDKfNHS6YYi8+UfJmMBMqVrUOZMxigvbRz9Aq29M
	 JXDH4j2r9AedrvALmIDfvcywV2h/uB+032IxUNQBQbGRwRMr9tNWYmyIXCnwrmPpF/ibf
	 jD/fi9zO5ewsdEWPW8d2/YX0OrrLDB7BYdRM2bTMWAYNwZnyLKtVizBnnq/qaPbkFKFhb
	 HlafHWHp1fvxBNaZ7r52bowmqCjm3dYBswjB8H7fwZrO5io6WXgDb6vgtYTjw/wrXBA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789760135;
	bh=PaD7S3wfeQEYrQfNDBkIGqF7Di553sASp0UZVTNeCWw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NTBZOXwSW9ybpiWS0npkhmuhDVm7xCYib2MaMcdyUY92xkjlM2qkxuj7JucTgXd14
	 m9lWiCPIvxZ/F1k/8qJzsZ+CxISOGI/w0L7tFG4REzf27fDsw/XJxnJfQeLXIomKp+
	 sVJbliJPu52UZLd9anNpjf81qRcdF4VfCLFTV3OVUDAzGrTqVn1T6zNpyM3iEoCUT2
	 vBin9pd8VyTVT04bpYsAgEPWjOLrihVmV8TuHe1mrjpFDlMNXrz2/7wpdJ8UmmoKe4
	 Ujdq8Ab3nQRJkjtZsXCla4Tsb1jxIaxbz7ygK17yNvR1/A3mYvZVKg1dNIFraVnizU
	 T73I7OWlaFeYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9891E60E03;
	Fri, 18 Sep 2026 19:35:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EBE942D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C4A160E32
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g-ujoy-gdkTj for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:35:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BD2CD60E1F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789760132;
 b=JTQaTKne6bg80FaEwrSjFGfdmsliZg1cmgOZxCe6sWdCsfxm9USWoAlDl8BvKY57eEyd
 cqZnwbnsyTopWz1Y6gVXe+ctF1GjP4PCpm2XikVPXKGx5VbRopNVu6SRnChZe9DtOciF4
 SjoOU50eE8nJOe6av3Eb1olCbntwFw9sSm+lT98CFC28CV/goroLU+IVRvWewsxVkTPyY
 EiAmsAL+LDD+zmo0YB5Ec7gUcT5BHyqXDZjJcRBGgz1N2svjv1GEdXKrJyxbm4GQVShuX
 au62bC+Bagi2JBMQ2/pEHxINuI4xLdZ5WGVpY8C0qJlNyOISZkgkMWmZQMiMmis53Rw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789760132;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=sfzc/lCUFbKRQ0Zk1cSdKA/5avXNAaLQaBMknP4hVSE=;
 b=m1uMMHRS+3eTR7yzPMWd2m+8mMnXTP6orr6nmb6ZcifWJXgfRahABzRRU+34FcedpKTn
 tbOLOeMSggFmcg+wfGRYKTToW5ra6bJC42u7KRA1XN9YpHh4ZNqXEBwc5fTr2WNOOCuZt
 thBYZN+J9lBVpd6erofIP/Q6+5N2bz5nqFUHYe/1V3bMrTfFITYPJv85m8grtdlmo0iV5
 2QEpH//xBYLvFUQQ4jVTPkTktZnWxTXzc0K8FsdIIiDu8bE9Ie8FpZOXPNmAW3y8/hzql
 ctxLqQ3QNxNcHJJ12u/kTFbt59Q7NHV0SQ0Me/A9Yc9cX95imCZHdDLh3J2/CjLwV7A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD2CD60E1F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:35:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 552CF976A8; Fri, 18 Sep 2026 19:34:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 21:25:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fbb9739dd8012bbd33098a05b6eae91ff13ce71f
X-Git-Newrev: 318d4ce4e55e862f61f5c79b877d228e9a264da2
X-Patchwork-Hint: ignore
Message-Id: <20260918193425.552CF976A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/screen: install screenrc without
 executable rights
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/318d4ce4e55e862f61f5c79b877d228e9a264da2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

There is no reason to install a configuration file in /etc with
executable rights.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/work_items/174
Fixes: 98873717c2654e27ce069c44e9b5dbe3383c0f97 ("screen: enable terminfo and install screenrc")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/screen/screen.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index c279fed8bc..ed225d1983 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -28,7 +28,7 @@ SCREEN_CONF_OPTS += --disable-pam
 endif
 
 define SCREEN_INSTALL_SCREENRC
-	$(INSTALL) -m 0755 -D $(@D)/etc/screenrc $(TARGET_DIR)/etc/screenrc
+	$(INSTALL) -m 0644 -D $(@D)/etc/screenrc $(TARGET_DIR)/etc/screenrc
 endef
 SCREEN_POST_INSTALL_TARGET_HOOKS += SCREEN_INSTALL_SCREENRC
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
