Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D521ECA5FF1
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 08:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83D9880F44;
	Wed,  7 Oct 2026 08:04:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gG7zCm0dwvCN; Wed,  7 Oct 2026 08:04:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AE41180F4E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791360288;
	b=iYt/1HfVtcEeHVPW1niQGBCHvXAoC5q6aH3CmyKyuM/dOo+WCQr+fj+Jd79ySwyaRWF2
	 +wSdkn0rALHo8+W5pj1MBQNgymFpwwoHfzLlbb2watGOqwMEwWQAEhBqmUzRiKMPuoatO
	 FCz4B7yhFSz7QMhxMXssRSPOgr0tWbtpnaeg4VwGMo+Q6yRYpqABnDOVXiljyu/dCkXdn
	 ERmAtDVXlYwpyu1bti5sI3u5BVpFyl63/3UF2dAFO9nTkvbh3pPsPSkAL6xibNgpC4gKg
	 httt4FLDZ30nP4SF+mzdSVyMUUYcbX/P5lq21rdr9O0S/kf5gBsii27r1247MKDsVEw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791360288;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WcYsM5sT1sSkY4baoz+rhaz4jbDC2GhvJvrgexBuKzw=;
	b=eXsxmokzKFP7aUAlsfi7/FDW6/dqDIY4xDoICEc4NtjAj3+4zB5WGC9Xj/wIKf3pwVg5
	 isHMx5IRL2R8yZua/fGg86lvr4B5gt876exA0Hqv3UXBeBt+z6Lwd00fSl068gD+Qyha5
	 kIiyrQ4X2VQCcd9i0GwAyV5OzDHAhGpftAajZxwm5vr78qcn2k4YrvNjcjboWHuJ9bgYX
	 1ZtbNp6eBMU0fQwSscLhyBFRjlQs7u2m7Yq9qcJMOXMncQVgeVM5FjdNseTAlbJiKu426
	 Y2yXj3dQosHstQdOXtJKJ6oQaGU2pTini+g0m8oL2ePkqo7NHnyodLwzpYI06C0Cp5A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791360288;
	bh=WcYsM5sT1sSkY4baoz+rhaz4jbDC2GhvJvrgexBuKzw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Qun9NZHOnG8k3XAW1KeY/NVXpagkxF3GV8mIOy20RuXJDo+Oj3EBDz6OZgOjT1EVz
	 1QMARVbHBHzf2i24GH/NO/aJuhQeoiUZWDlIKTtOO2g6c+SLXRYtzPDD2Op6tBkPLO
	 P/G9mZiBjnb5cMC8+db0WsLpOlyxFFw7i8qin4M5v+s6KV34riaS5JxAI6vG/0P5Ky
	 dyX1/tWHQY9icmw7Tqw2neqzlIT5O+ohoS1aHZ4lt3CqYhhTStLymWwtz4cq5JFVlu
	 mfYC1VTXVcSWNkw5TyxXgZTMcegX0PfM0ovLmmsuj35oRf2Rg6GgioNJEj9SP4hggR
	 IKlksCBqiI2cQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE41180F4E;
	Wed,  7 Oct 2026 08:04:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F079341
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 07:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C1A4606C0
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 07:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1F2FM9SKikCI for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 07:55:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CC6DB606B0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791359732;
 b=KT6nTMp3NkY7ipVvUDe0Q7pTsELx0muN9Cy2sX97v4VeygaXx3dZMr7Nl+UHPzZpffBQ
 J0xoLr7imZmVjueU4txzgJtE9/RWdFBlRj0FAAIdB/m/HEuZXFnZZnhqREoy8ADYGF0xN
 hG9Yk8zTgcrLGtHz4SY6FA+t5KhD7HID1G5xTuLEeDBonLrgBugjKMfnK2ja/Jhp8wRWI
 +HMb6qMYVMHzbl92ZKQbjkTpgmRqpn5XYoObn1rMJAqLVQUvkf/q76l/z3zdenk50qizI
 4n9B8pQc2Djw8SOawgfeZgGrt99oNhVO7Na1aSIzfDwydFNavkhwV2XhkKmJdPsWrMQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791359732;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xBQ4AA1inCKYqq17QByPuQVyH4zbJ69fyt1hZTiZHSs=;
 b=XBHaOuWOmCFVA6JDh+F9/Xfc+fDd2csQo0ZGA4BphUY3ASAPkm6wX/NiNF/w8MXl1wNy
 VG1wgz9uPaARlr0snIT+a9ZOIyP8uKXPwfXdcW4Lh/4wBNqD2Tm1AU8xx52FJQv3Ih/Mq
 AYmuBgXN0Ew+q8BtocMvt0QqjMrRx4gcJijEX5u08ulqrswHiRb47G+Zna7WYhM3yxbx0
 Hn7ALMJRsSkurJ1QIZxrjWIdNYkgFUGVOtGtdmP9MItA/LiHdaqHPf9DoWUwrc3FJUGuU
 U/gXtociFHH5gDOjb1Re1wlkRqjn7eg/z6QHxYJulEmt3S7M8ly3WuSW7T3Vsc6ZrKg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC6DB606B0
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 07:55:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 330B18DAD0; Wed,  7 Oct 2026 07:54:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Oct 2026 09:55:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0710da403def5df6219c2b6a3f4cdfa5930b2a89
X-Git-Newrev: 0594de6b1c1341d28e5e1b781f44d8f3757e5c4f
X-Patchwork-Hint: ignore
Message-Id: <20261007075416.330B18DAD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kmsxx: add kmsprint and kmstest to
 extra utils
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0594de6b1c1341d28e5e1b781f44d8f3757e5c4f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add kmsprint and kmstest to the extra utils that are built with the
extra utils option, as they are useful for testing and development.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kmsxx/kmsxx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
index 10cae65779..0678b50540 100644
--- a/package/kmsxx/kmsxx.mk
+++ b/package/kmsxx/kmsxx.mk
@@ -27,7 +27,7 @@ endif
 ifeq ($(BR2_PACKAGE_KMSXX_INSTALL_TESTS),y)
 KMSXX_CONF_OPTS += -Dutils=true
 # extra handling for some utils not installed by default
-KMSXX_EXTRA_UTILS = kmsview kmscapture
+KMSXX_EXTRA_UTILS = kmsview kmscapture kmsprint kmstest
 ifeq ($(BR2_PACKAGE_LIBEVDEV),y)
 KMSXX_DEPENDENCIES += libevdev
 KMSXX_EXTRA_UTILS += kmstouch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
