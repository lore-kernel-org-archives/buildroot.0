Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349F4CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE8FC811CE;
	Sat,  3 Oct 2026 08:45:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dGcpsiGNP0Px; Sat,  3 Oct 2026 08:45:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 12168810D6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017129;
	b=Rv/XbLM+oUWMAGGPQemAtK85sExlVkVxwUSMD9JdPHjrayx1DdEbYIeLLjdWpq0p5P1j
	 kMRz+7eXWX7WtTt6qu0ei2+611fhgmmo1m74yuVMblDH3weozUAmj58Pu1INgS9NuwsZc
	 FM/d7EzlAbO7i+AmQoWhFgfPPsb9Z0iihk/iPwz6x6ajeGV0ajKUtiDkQF+aR+sDT4sXa
	 5mKgJ5gRBJ1YXraH39O1w84vLS71sZ0FkQrlUvTukdqlO3KxkHsbFghNvAIH+JTtjW+uV
	 9MKBH6lX+E4GB+4LPgbFqJFms5zQyeAOADH52LE0S1+Yae1qBZ2mJIKyKr36jpq+I7Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017129;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0/ePMolrnA8bOj9nh3Sm39GRAZ5JT9BD841ibdwyi08=;
	b=eib10fzx1/TD1plnlLeczsCCzZo9UAk3WSiIpANCE4etI+R2A+KluOIm32C+lElogfpl
	 tCEGNxdknwf/YvNIGT+nZR7SLUL7N4aNhafNc0vTYBCxL5aarPqMuTj0OWN6hCPEFQrYn
	 hkOJJ5Q2cdU3Ru6J5eg/wKCj2BdJyMvc1+Qi5shGKcygyt8jVI1IGg9wobR8pnZMe0l2V
	 ZMw8QO8IUA9mDjaNBW07/yMvnBvf/9Vg0CJ7J7Qrg3Jw24aVinc/MpAnFmX9PGEF9HkRO
	 Q3gr0cJMVgoysYGSwT2PWGUXqctg6GMocIgDKIV6+SndU7hbwwjfUNXL98uYWGuvXrQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017129;
	bh=0/ePMolrnA8bOj9nh3Sm39GRAZ5JT9BD841ibdwyi08=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=dsNso8GLCnK4HNsxA3Nkzfd1e+DOZt4mTu8hLh6/TR8Kz3uRFnQ9Vy1q2NyAYwNSD
	 hkNgEnSqXx6bkf7qwe4cpY0fFBRCOsCvYvqQn6GJU+Lomb+yo2czsinILwHjxrTqh7
	 Bj/p2nGd8xrGNILSvy5ZMgA9uAJUyBuSj0qCjugS1LrWx4z16YPQB/VsyPMBf+F9Sh
	 Oq6NBOdj7MZ5vPgetgn54CGBdgREAi/Du/e4anjGh9jePezYe7CTET+C4JG+SIGVpe
	 KRuDrZSodW7tU+p1p39wmbchPN/xDPWFxUrklM0ioQN38Fhl4iRW5EiQAJ9zEXb0Ti
	 K02cV9DW+Ws+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12168810D6;
	Sat,  3 Oct 2026 08:45:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12D4D2E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECB8340FE2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OzZ1nSoQbFli for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0CEA640FE9
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017126;
 b=Pq0+P6wsuA0nZhKmsfQ+JcXzOtL3QAO2HkCiWLvFo6YU/pHNpFMlgvnN+T6ECv/nIDqr
 fvx+F4ngkIXVLzbknwQST+wNudZHHbxeTZA/uJ21NxW4TkJ7+a4IIuXOwaoxnMnR0INpm
 lGppNrDAh6Xd2FNqs5lJ2tA1s9gEoBNn9zGg8owKX//5UHAH6r3p5bhTgwnA+NDV4TgyZ
 eWSQ4IWI4pc181DB7RPB/D61yGPSvn0TcJfn7Dp6vrDiJxletPTFPzWKDM7QlkfK75uMd
 ouO0WKrDJepHo10oeL5GfLjXwExjmHYjySspABNJTu+O/6PzVYFRbd6RlkscKUXF0Xw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017126;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=BkJwzoscLS+xYvH1FPZbum+DQQX8oMelzmBSY7tLl7o=;
 b=seYdxYZHrD7mrrTUBFDdX1+siTQp2lU5Hif0NEHAefpHFujhIlN212qf03yD7ydSNPnN
 XiPeQP+qA6N4hTHCgQ/qPob4n2vpP5U75VxDwaRkh7DjCnO2GP/Etb03mgbXjqMl3UVra
 NpUDmrrr8X9eEEoDsUxiE2yQ3zV5ZsEzjO+3rLKMJ8Rff3u0pWT0eRDLpVIHULe9n8k3H
 MSelKqMSr9Mv+XzBSK9rf5PLmX0T+PVvcNPdE2LUISN7ItkLJyMmqa6etHf31xguISQGd
 Jp3u6yiOJK0M3GIvjrK699s4hXkHp9uw96d+Zelq0ZJvMr0Po/AShdrX5bjeDbqgd8Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=e0NeNrES; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::f;
 helo=mail-oo2-x0f.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=e0NeNrES
Received: from mail-oo2-x0f.google.com (mail-oo2-x0f.google.com
 [IPv6:2607:f8b0:4864:31::f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CEA640FE9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:22 +0000 (UTC)
Received: by mail-oo2-x0f.google.com with SMTP id
 46e09a7af769-821ff9f018bso509393a34.1
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017122; x=1791621922; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=BkJwzoscLS+xYvH1FPZbum+DQQX8oMelzmBSY7tLl7o=;
 b=e0NeNrES7fgAE+tsYg9MFnmGEir9x8okSKUyUPvxt9vOrJrZVnkPX6Lo/qocsaLexR
 KqMK229kXB+bFFYTviFicgePJGxfkvn8/P8JZfXbjcpGUvQw/rXSs0qlnqijqyBjYeR9
 touTxW+Lphga+jTW51lu9WLDyZsOQXI8g6wB1SPtidQjyPFmAx+L12n1ENNP+89QXud8
 tjcM6iru6yT78gI9ZEeQ40dlG6mKbtpW7wPnf7Oy8g20+CqgJ6tEPpMgSws+IbBdVut7
 xn+6HVllGc/4emUhAvJuOJVLlSjcUzwbWQtba4vNxGvuOsavmnv8rsaeLKMBPaTrLdDy
 OKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017122; x=1791621922;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BkJwzoscLS+xYvH1FPZbum+DQQX8oMelzmBSY7tLl7o=;
 b=UAsKqtuRZnbvVbtSGCywiLYpSWYqwSwKrZS1Uah/3eQVitgdy5H0S0kRuG2ZN+4qcJ
 /wijtKS7DPxyoWp226cgm1fp4cKLElHnNBcClmEXhYlIGkU/ZvslBRzqickVBDQRLGp1
 c2onB3Ii2HebvajcNuYiq7Yb2xCWCOSx0vsX4AvdFURphJwTJWIpPytv/8eewy/GNKvn
 up9mGtei7Aqtsxahh5C0fqzxd90Rk3FPI1WRdch1eSoww8/Jzfu5R5vCzYV0GJX39XDh
 O1ZRrFIoKufmpZbepHvEfKtU+3XfX/eSvmt7hOz04gWM3YEwVLil69uU7G1gEM2t++IC
 Lu8A==
X-Gm-Message-State: AFuF++mV0Pr2HUucCI5DmrSef3B9AdRH9jziPqw21/Y4v6O9gfhrxett
 EI5TVwzt+g0GzMOlMlfZaED2Q2b3ByI2cO3n9GbxPH4xKLPVQE6PcrbDpNWOsg==
X-Gm-Gg: AYBFou0JReop0vv3+ebdog8FHaoD0H7JTWJXr9CqsJxI4my5V+2z8wDIOlke6IbVPsE
 emujCowMptguGXrE9KQWbkY+/bpt/UwlLwFfQFUfwouIGpwrH/1KVhlXYrI/v+YyfS1MTta2OMg
 XBKz5ciG9f9WJDSb+FmidAA0M78CYQgwoMz9MZ1/vnRa8QzqK0a9OeHCBubk9MtIuH1eG+g0nOM
 SPhV0csPZcl+HPFdI8hwzbM4GeLG5RqsLMf9a9+Dk8oFBUMS6D8CW7eUxHiOvc4N+DdXysU4fMW
 BgsdUiVeEqRj5Nyf65om9cZZDa8ZqIw2W02ySX5Fmi1643mBbFNCTzAD1zKzdOp8PiNnS+L1jAQ
 cMBf5ZYLNLM1CK0Qa7KRDTaMMJwuEi6SmawtdxlUP/XaXk7fwu8pOeVgN2N9jMuJ2zdtO8Ixc2y
 jBP0/HGRuiSmzxqc9CBkFXkmsz5l640vS3lJvCZzRT6mpe6kV4T8yAY+h9uArBXSTf1RYkrxzZU
 3ARX1o0gcMc9c3dqA374osUs0/2emOm+mR3G9qesGNOKpP0x4cFPm1kCL3gqXk1moyXywUzQQpu
 CoBsFLxIwMvmnA5T3+mQPSeAu/Vbb0IDV4BISN0UXDLhJydCCyx2URT6e8V39CK+tP1Cp/ivxiK
 1JawJMxRPQYxgPDOFWFTGZyK6w9f5iS5/1WgDclxxcBgjmuewpH45
X-Received: by 2002:a05:6830:6ae7:b0:814:57a9:4243 with SMTP id
 46e09a7af769-82282a8057amr5166836a34.17.1791017121867; 
 Sat, 03 Oct 2026 01:45:21 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:43:59 -0600
Message-ID: <20261003084453.545653-14-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-kiwisolver: bump to version
 1.5.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Esben Haabendal <esben@haabendal.dk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update license hash due to copyright year update:
https://github.com/nucleic/kiwi/commit/d28b726aa2e7eb4e0b2ce58e55c651855053f45f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-kiwisolver/python-kiwisolver.hash | 6 +++---
 package/python-kiwisolver/python-kiwisolver.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-kiwisolver/python-kiwisolver.hash b/package/python-kiwisolver/python-kiwisolver.hash
index 636d339739..ee63ad058f 100644
--- a/package/python-kiwisolver/python-kiwisolver.hash
+++ b/package/python-kiwisolver/python-kiwisolver.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/kiwisolver/json
-md5  63d13da80a2420278c695d5784dc0b78  kiwisolver-1.4.9.tar.gz
-sha256  c3b22c26c6fd6811b0ae8363b95ca8ce4ea3c202d3d0975b2914310ceb1bcc4d  kiwisolver-1.4.9.tar.gz
+md5  d36514b0cd15dbbe94576202afe7a5cb  kiwisolver-1.5.1.tar.gz
+sha256  f1303ef2eec81262a4b708c3e858afe58d7c75ad91c1c05266eda7673369859a  kiwisolver-1.5.1.tar.gz
 # Locally computed sha256 checksums
-sha256  cf20799d32de0eefa2ea904e3ac5122f47aed5d352930751eb61724762c49d90  LICENSE
+sha256  529c40e5f67f2f88904657a9f7879ae2f8dc76bc9bfef9cb10d988b48804ed61  LICENSE
diff --git a/package/python-kiwisolver/python-kiwisolver.mk b/package/python-kiwisolver/python-kiwisolver.mk
index 2b81c60688..3f005f5a32 100644
--- a/package/python-kiwisolver/python-kiwisolver.mk
+++ b/package/python-kiwisolver/python-kiwisolver.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_KIWISOLVER_VERSION = 1.4.9
+PYTHON_KIWISOLVER_VERSION = 1.5.1
 PYTHON_KIWISOLVER_SOURCE = kiwisolver-$(PYTHON_KIWISOLVER_VERSION).tar.gz
-PYTHON_KIWISOLVER_SITE = https://files.pythonhosted.org/packages/5c/3c/85844f1b0feb11ee581ac23fe5fce65cd049a200c1446708cc1b7f922875
+PYTHON_KIWISOLVER_SITE = https://files.pythonhosted.org/packages/ba/07/bd78e6a8fae171ea041ef5bba3ed21a003522fa088834b069b1909981f30
 PYTHON_KIWISOLVER_LICENSE = BSD-3-Clause
 PYTHON_KIWISOLVER_LICENSE_FILES = LICENSE
 PYTHON_KIWISOLVER_SETUP_TYPE = setuptools
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
