Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C4CCCA490
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 18:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 402D3406E7;
	Sun, 18 Oct 2026 18:25:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2vk9FAHsUfE9; Sun, 18 Oct 2026 18:25:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 54BDD40705
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792347923;
	b=f+mrCDQHCwEWQLLbakKwCnPoocy1WtRf9yqhCojcweZdk/DgkwCoQkUvnLaFaJxQplYb
	 XSrtGQu/fjoj1PosUaJkEmU6vqoBugR9MqMmoKxB+uAIpXdRvI9UD6Rj92IYX8iZoPXbm
	 Zy6jXKJym3eT+jQW77rtlCGPabEhLg9kmTLvXDQqr1IFvcDDPPR5shtiFUN5JEvE5alG8
	 eF/lwmimNxBvfFRQLK4L5GBreWOMhCzNQUVr3is4N2g1B9V6J0LltFYUvtoF9vnY4U7nO
	 6xpBVEVxRle3oagP2uge850F9jQGUeU4YdCOnfcXiNeBjUhVJab2F3Q7CM9Tme2YMBQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792347923;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/yX1VIk968wfHBDcxVCX+AGAaFZiMcK11z8Pis3Ht/c=;
	b=q0OVD6whxHehVDUHSmfRDZ5xmSETPtxDGC2TOrVE7+jXAqxQUYXHOiSRNmKX9Hl6ls74
	 KvBsG1i894mdlqQgFWLBX4QawNQQE0Aau7oFutnL9K7xe99sWKfk7Srsorukr5PvHF/KM
	 +gm+tHoSN+Qe9Cskcj0WcZ8gIUHUl3olCoN4pxtvaLaufzZWRRMqLZ08D/m2bAMgKhj9l
	 UYHMFEmt6+r7mp7L4jkaMlhF1gmeK3dg4W46waUEHXoDvlWebhXNIu6Ytpwmkjkog3/4b
	 QqHKj0PWsHnDpwreaPgZh1C314wuQzPbknGzbJ8j7gSu6VDt50WsnyYR0cYUoxTBUfA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792347923;
	bh=/yX1VIk968wfHBDcxVCX+AGAaFZiMcK11z8Pis3Ht/c=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Juunrj2Hp1GdPaEOot+2HlYyMCaHZcDXAkpvppgdZYmrk9I0TZZ54s2Y98h/WvLro
	 U2esAh0hU2jy7dWA0T0xjNJScuiGZ901m0sn/G4OxpUaY+/V6YmuuwINrYVWH9C84z
	 eXcDESM6+xTGv1X1cd88BkW/9Vw2n47VC0qshzNR4OBvpFg/jNOiQfrbO5Kj121Pak
	 QDhYbG7QaC2I8hDCYzB33a4WcFGGGW7Yc0MEY/EsJ3A6FSdbh5Y4v1c9vQ7IO3h6rb
	 9qXt9QTjoaHSkGmgYR5bQ6+dbTEi423o91K8YeEaAXN2NCvCVfRgLFE9JK3c+gLGaA
	 3C5FbqU0WehJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54BDD40705;
	Sun, 18 Oct 2026 18:25:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 44E5361
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 296CB4009E
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FxFXkDmIgXAL for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 18:25:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 47C654008E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::334"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792347920;
 b=hi5beha44FdwlHT2d0JcoptmDMlg2+ICGaOeU+NdXwPFcrM/yK34wtbDVhlN1FdvwNUh
 8wquwQV4qynn/5HcfOUTcADFDjHS5m+Rc0RzsZBqEGEw1gNCzb5DYCft1DHOauLBB7Ujx
 5Agy3FrxZSRAXYijjP+Tx5CaLgoDorZ40t0ac13OXdJGtzCQNFc1ejfWm5a0fGvtUxx7m
 sBFtalMQCJZat3kgEkptD6J/W3onwgaltj06gkupYc1dswW37aI5DN0EM5nUtUhgqwCne
 D6ujGW7hFm4aeQ4J9xRDbSHVX6Q/8nFZXeL/xEgjx+fwj8NgQeDtndeDg1mhClP4www==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792347920;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=qZ4LWDRsX1mYSHB/JqsA60RuupK+07p1DDxOHKV5KyA=;
 b=Sz8Q3ONQRpIth9X+4ePMQld5UN6BjGQAn5wtzZ9B4EuF6UQlQjAdu34z5Ai3OhrQFyA8
 GdeY6KR/sAFLrWQWS1+CIs9NnHp0dH2/aUmZfpSTU20DgcBvB+3angCw/pdmL3b7PgdhI
 ymKyrLYRrjuaavj6XH1LGuPTAIS4NM9FnKl+iCgdDhNpsTVpZEL3wW8UMPNdLvUgqp/vQ
 oTISy18aPtD8PFpaVcXYiSIhnKt6nhEAf+GesQ7i1xFKWYQwOLCjLSpYA8rSe5o0o2XV0
 7DuRa3FQ7FF3bhDMUaKo789r8ZFJX+95d12o715ut+9mm6125VxTskYHdkbEbkeGDmg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=SBdTd9Mx; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=SBdTd9Mx
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47C654008E
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:19 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-843b6f8e2c7so1241816a34.1
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 11:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792347919; x=1792952719; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=qZ4LWDRsX1mYSHB/JqsA60RuupK+07p1DDxOHKV5KyA=;
 b=SBdTd9MxwMjkokszyOn2wqZgfpotwuhYyfd4ENMaHAEFHT846iYtiyjpmts50QtYZ2
 5MOyRJrKUKVwgQflVmhWJD2/WapVj4pnevtx9lNSEO8xrGRPRTGX8R8jTuE54eF91Gnb
 foTUkmTEF9u/0zKKDnqfvq+YPuxzApnMH3Ky7uoj+DAfiC0cUKW7bGFKi4p0m5pXkyfU
 fKcmZ2mXnzHb9LrYv9d0gH+I2M8cMKZcKulDBduJx24QjGMsq9bg7SglwVKz7/I4N+/p
 g1JrCqggBZgczCTF29OWCRr2sWeaJd7oJDap834w08AiWquHrDkY2sCWhJrxE2vn5d9u
 4stA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792347919; x=1792952719;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qZ4LWDRsX1mYSHB/JqsA60RuupK+07p1DDxOHKV5KyA=;
 b=dmAEC8M+YnaPcbArrJiBWd7rlWLE0r0O3GV7L7P30ygZr3wfskOeIO75zXXJv0/6UU
 zfBDtd9ZNQIC4lswQ7vqHgoNOZKF3FwvU8IIuUxmtCEc8Ylq0VPphwIU22Xg2ej2+1LR
 RMVfoSBPgE5Jn0N6QlzlsTv6zhBKt8vIPfufHneuBnT8xeCcVAStyPNcSVcXGB4t5IL1
 /Ut52bmYVVPYelw2eyoCFKdoP91vUb5GzTZGiifIYEP/yWccCYaO8+lQ+ju8xj918WZy
 gOkU5hxsIP41nBwJVN73TzmHnWU9mDQbys9JoIpU3I/tsR9kpXhVl5c0fZY8QlS+dn3H
 zvbA==
X-Gm-Message-State: AFq9FYIqNF9WNYFJzfRq6StIZKHW/MYLGKFcQRtDHNORSYsy3Wrkg0/O
 K+d04MBaHWexnlGU/TCLY3FRdqBrgIULb32GCY/Tze9vEzhzX9Gkp9PniAJPQg==
X-Gm-Gg: AYBFou2vY3N674fj2Lkldj/7HjOn6xGmvbeGipF/VCEv4wgemYB5A3/jV7TiikX/e2v
 BL9TAGOOF1PlD7iAisX1h4fKqIiEfgD6WNJhpNGR2a6CIymrWGk1fqDTSB0j07jrJhYavBQyR/5
 EwjPzGfOMrB2E7dEOOJa9xK4v9hCnhjVnD8U4c4lsB4wr4U2/8zJt0G8FBbEqhyh+lcIkD4yyDm
 HoSTge5V3IUwEJAAi34AjyJW7MtHka4gwzOk49ZVohSGcnbAWLlZccAJfCJabUGzY/Ou21OkxP4
 7SP4dhtUB+ISCa72c71frJgmuOvny2bhgC1+h6IsVBYmZ+irNfsWptGa/lVr7Hpbk3qE0Q0+YSE
 QpDLmw+ehDdCWmJ0T/vqeNc0dt11lo6/IEcjQpUlIZgP7wy+6RBML2NcEASRb9BvFOylv6sM5Bn
 CvHE9P34PoTASlaOjLz/Mx6y32EIiSgnrJsBkzA9tEu7PCdNl6EezF2a6c/RxNbKxZuHH87S4Qb
 +qLC2vSDFrF1OKXiDfnIzMQClJY5uz5goI5MdSw+ZIjc0da7v9KYZiw0va0asJ3ghbKRPenaxRw
 UAvGeXfirrphDr4gtEhzVjxSWqFtXJTfqkEBG35y98pedkAO9FoID1I2jP+EYjBp0ELAKVOhrWQ
 zLAw3i06HDKAoyoj2ypgHMAKYtpsXKR9Mb3R5GFOawKc=
X-Received: by 2002:a05:6808:3010:b0:4d6:93e2:5bc1 with SMTP id
 5614622812f47-53cd2a5cfe9mr3907956b6e.66.1792347918996; 
 Sun, 18 Oct 2026 11:25:18 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5388a5572b4sm5715659b6e.6.2026.10.18.11.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2026 11:25:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 12:24:46 -0600
Message-ID: <20261018182507.536698-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-filelock: bump to version 4.2.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index d4d1d652ca..63921db286 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  888c3cddadef907007cfc425640cddf5  filelock-4.2.0.tar.gz
-sha256  7a60906c75227cf04d0c273afadc8219400f11aeb13cc69591d4f6cdc6c8036e  filelock-4.2.0.tar.gz
+md5  151e8b4a847a4098be9b1827c58de4be  filelock-4.2.2.tar.gz
+sha256  b29ff2ae9140bb17b3bc77c648dc4f010d9ac0955eccabff4f2b01dde859f787  filelock-4.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  608c89d5060ae9921adccf3236695bc654a9946e12323ef6c021dfa04e294d48  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index 7c9494f8c3..8a7b59d93c 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 4.2.0
+PYTHON_FILELOCK_VERSION = 4.2.2
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/f4/a9/1af41b37c3279712b22cdc63aac78a52432202b6fe1f9666a2a3d2831fb4
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/d4/08/d8f81287742010e38daf3632380c8d80ede7b4df2716f8ca3d0a2b087d44
 PYTHON_FILELOCK_SETUP_TYPE = hatch
 PYTHON_FILELOCK_LICENSE = MIT
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
