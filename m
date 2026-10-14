Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E85CC6B2D
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 21:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF29B6089D;
	Wed, 14 Oct 2026 21:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b44OlENpgl4r; Wed, 14 Oct 2026 21:10:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EC2EF608B0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792012256;
	b=PaN2xED9Pw2trhbuhpKhoQ+w1wXf2l77z87H0naSfL7KWUuwcW5NgOvUxLfKdYsAEg1H
	 Hzf5XoILcHTuMn+vsHRyyZbDg/NyFGn86+S6Cpt8m75vTELOyZf0uvtGxg/2FCKAzM6Qi
	 o6cHR11cRYLl9NI8Jz2adaSDlmXVQp5X7gJYzuu4ZrEycH2vmAQx09Ss56x4KUk4Mi9BO
	 TzCJbndccqidPc4LgUyEUJNn0CT58e23dwucpXOMrV0ydsjcXu3cTLn1CfLmJq1zIgGyY
	 dRKyeG/jZs0g7Hhvo+YcTT0Eja8EKqfo515fzBMepCTsvii+Ytq9zBod7jEnNEWlHUg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792012256;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:X-Google-Original-From:To:Date:Message-Id:
	 X-Mailer:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=PBhxvbNZUptjgNyU7sD2pK/mGWfIuWPeZLHVHpN9lv0=;
	b=j5ke8R2+l+a1ORdlYRzznC2YDMx4YJS6b4xfrdkDGfxXrqe0438rnXtm0uzjq56ZxL+d
	 gyf/zAECvius2Pci9cYtYDsJAC+tgSmAqaDED0JRsSJ7zyZk3e6PjMYjwuc7iCDJ9o9WY
	 jcSV5IcAFrfm9ILuGDlh7r2SFg49hyUB+IthzH1XqaqwoJRDvkx/mBH2W/3vi9Vpub4aN
	 f1luVFColn7dCqOYwgfhD7unt9rvG3k28lfzuZJuzQdoG4MvfQNERtU3xPal8B2EP5NRw
	 AHofteZybgjEHe4T2l1MOa/zH/9x2oMT2ya9whaBzgGjt44Mvj5O8kvsKjHtiTq7CsA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792012256;
	bh=PBhxvbNZUptjgNyU7sD2pK/mGWfIuWPeZLHVHpN9lv0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=i5+7PJ0NmWnLutJKZMARNnUYDr6VbeZ4PffjZE5WHO6fXcOHR73seIsLnJgzfRXFT
	 OuPn5vUZ8YesURkY30gXIZJ2RnO1q6gBoN7S6xve9jLAJPpqEvGcWTHbO48cLU7s3Y
	 xlNs8iqaRyJ7UsJQwsaMcyeJUXEfq61teOUlTKBA+e6Kn1NuQJRon5ivGvgR64dv5d
	 6W/o8J1N3WM3NuoT/ZSgp2mZ2Y7DwKZxz5AuCrgsDpPNNAtuS9RmztmSpBrwsq5c/W
	 LEVIOz55wjHpS8i0YZ/hu61yZ0iGlxwil+57jqot1SmbfJqETR02VOfQFyLxmnJcaG
	 4iM3ttq2y+ySg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC2EF608B0;
	Wed, 14 Oct 2026 21:10:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 54524A58
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45CCB80772
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZS0lAwVwjINy for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 21:10:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6128880741
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792012253;
 b=OyXD537qT4vz4mcp6yadVdi8oFdNttcYH1PgD0j/WbXpSTLqWRQRq2qLYNViHrf9QHsj
 TFcTYq0wlJFec4rXP6lT7xGYIKI2GOIE3YR6/Jwc7HTgQjVuMqxZp7UwAkRwYCPnZskwj
 t7YFSWHCu+bbRRqF1+Xy65YWf+5MUZYyN+uCDq1NRg1RBVMFL8fj+s6783se1ow5+nsFo
 REl728X4pjayBZIp/kwy0t3wfpCwJG8tIH1bUbQJYSzfsqijonujtziyMX5ewdBz1CYqe
 DFlMYdgSJWs+hx7zGQCyNHHlyycYg6M3NX5EyJcXLMjmp45u8BcFo03FowqtxGFCtgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792012253;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=U1gCJoom8jzIq8CSsi/aySw+89Vl38dHEK+Huwr4jeQ=;
 b=ljDvR9FksF02QZ+5xBuzqXr3fgrb6PrqJYfYILMhY2BRJOOmsZLg2nbP1pYtKNUvJFQ5
 6bC+4mDJBGa2PPVr3EI1lu+x2723QQgGRnPybj2HxLXO/Huy4o7dcjCTiYB7ybCJ8h7x+
 lwfss1p69UD6AJbUuAE3/zRPOh+sphHV0rWroKllNHdF83T5voCdw6btRU/dojg67FbxZ
 tirFtwwLnd3NYOdqHrP/FgCK2zl9UHtRRpybRnSEALOJ09W1O7QI5lFoEfPMFRUEUjA1l
 Zk6TEQeuwfDJ6n2C60RaEp+Br00PgjGyhAacb1oO3d7YWRQHFKYR5O5k7usEmROHJXw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=Z0rI814m; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Z0rI814m
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6128880741
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:10:52 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-c3156e7705cso250760666b.1
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 14:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1792012251; x=1792617051; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=U1gCJoom8jzIq8CSsi/aySw+89Vl38dHEK+Huwr4jeQ=;
 b=Z0rI814mpS0vfp6YBt581SXCUKWka9HdFSv5B68JG8fvxm9NUyppq/DnDuuEWynCgD
 YRsBlFpqfXnvg+02YU93DiVijZnaumFrazd6mk6A96xtdlTTHKTw9FmmE7Se27pKvQdP
 BrZUzfTXsLgBWBLNcBo6sUksca0gcQIi53F+GcpqnzckuASCiWVq1mADQe6xShll2S5V
 aYqer5NEQv2WwwiYBzeh9evDBS/PuzBXCMohnvqmIGAKUHjHh4tSwHkMgSLGx1yFayZi
 d0TnTUziSLh5P84DfPIL5aotJcQy2TNG3Fp4xABRt0tVeycmpF1g0VgY41dwn1qEtqN7
 iRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792012251; x=1792617051;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=U1gCJoom8jzIq8CSsi/aySw+89Vl38dHEK+Huwr4jeQ=;
 b=T7sd5q76v3GxpiwqkFAxeQBw55kejpYCSQ5GKzao0lsq+vAoVEEHSHoYfVlXd2xvr8
 JUxzcFvGR0uTKdanTF5dSCDKEfMnaQlEiUpc7oOcKU0+VwLxe5zhFabfrZIQoh7oi6uM
 EW+qryYrzr+75MpGYfcCWJrNDV9s/7zB/v8DgxhzA19wc3OuqQw4uW0yvZyKDq3W2f4S
 b4TDM7ogSzHE4bo9iTARPlJHQizYt0DtoDlh4a28QL+U4+E+a1Gi33LlEuCi+Bx26aYY
 kc6eEG21hlE7aAKN8Hm2un/RM51FnsZ6hv9CBqjkqDyW6ZHAXGxWgblnR90A1nzAbyPI
 +biw==
X-Gm-Message-State: AFq9FYJvOXI32H9dF4bqrxotRmA0B7iPE8AnYHfLHy2PPQt6OTd98wLh
 +/F5t5xVxJcx7X6jBo6itNNT5CbW57l700oBuBpTtqdxF/KWdd/UuDXf7TBuyA==
X-Gm-Gg: AYBFou2gPQ6qVDloaZLCEZPEnPnmEParqOYYkkhbqPOJ+UgMnZXJcJ5vq55qNDtcQJu
 HetFSU+QybtZ3/WmU7MFwVo79mSp5qzUmQbuGZk3LukzMnkeME9Kq4ifM0h+bYItJf9cTPpvp1R
 0RwBW0gMh2LJNdLB+mE0ka1QhYScoy7MHoE8Xr6WfqX/dLsatFOZ8T+epdKqnSRpT1NSg5KmokF
 iSVK3AHE7ppLzAWpFilBTBxXt0kiybXwRFYr3uYG9E/dWZplkbAoQw1tWtiXqAql6UdTZa2Hy7L
 pr99GWmUEoiQ57hs9xJo2VWXzW4XNVPI/e4Pu4S4buLCu/cj3YOvtKjKssZQp4xcxlOXbh6kseI
 YrfY85q65eAv9FOrD4lyltaNDqG94uYkBAcvW0OxzY35adUf2S1sUgM3YNKma1//XyXZEIerYZE
 Zh/Z6P/ACp9y+Ptk+VY5VuuCHD8xUnK8apP+grV0mpp4Z/EKGK5qLNfM5kNODHPwModw67+IT3d
 S7gJfIWzAZyruo1CqP4QlScTI1NDkxXiinpyDUR9gb/vMM=
X-Received: by 2002:a17:906:794c:b0:c26:19de:913a with SMTP id
 a640c23a62f3a-c31aa0d1ee7mr1590386366b.45.1792012250577; 
 Wed, 14 Oct 2026 14:10:50 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c3ed9f479b7sm31857166b.46.2026.10.14.14.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 14:10:50 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 14 Oct 2026 23:10:47 +0200
Message-Id: <20261014211049.490297-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/3] package/python-zlmdb: select python3
 zlib support
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

zlmdb/_pmap.py unconditionally imports the zlib module, so importing
zlmdb fails without it:

  ModuleNotFoundError: No module named 'zlib'

Select BR2_PACKAGE_PYTHON3_ZLIB.

The zlib import has been there since the package was added (22.3.1).

Fixes: acf68180de66 ("package/python-zlmdb: new package")

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
---
Changes v1 -> v2:
  - add Fixes: tag pointing to the commit adding the package (suggested
    by Thomas)

 package/python-zlmdb/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-zlmdb/Config.in b/package/python-zlmdb/Config.in
index 884cfff182..1edf993ecd 100644
--- a/package/python-zlmdb/Config.in
+++ b/package/python-zlmdb/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_PYTHON_ZLMDB
 	depends on BR2_INSTALL_LIBSTDCPP # python-numpy
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	select BR2_PACKAGE_PYTHON_CBOR2 # runtime
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_CLICK # runtime
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
