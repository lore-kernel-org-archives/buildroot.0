Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DF7CA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 21:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6107C814C0;
	Sat,  3 Oct 2026 21:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dCiXrQowfVh8; Sat,  3 Oct 2026 21:08:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7280E81493
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791061739;
	b=jrcD0ZCj9tA3qkEj0eREN6eKXM1c0sNl2kpgocPdyjEjJ897I0AXjaVfYuHI6u/5CfxN
	 g8684mb3CZ9SOAIh/uBaPKOuovuHcT/M6kOcPt0irlR98yG2V7Ni60ZUtIXskJbc0cCe2
	 aCyJ2dynQufuRciTQu6nkY7P5UAdQlI4Fimr2aIFG1db3yGmq6+x7p+zTQqMDKdXeUpk+
	 DwsL8KE+MzZFGSeIwHZV8YlX7ZtNuaLSqQn8Ns8TcKQY/b5WDx5cE1/x5zu39NdMG08Sp
	 IfNXPjl5oq360kk1whDNQdZRIQ2bTrHT6u4eKqj3I9dxhinS7R2kXb5S7lHbXbZdQYw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791061739;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Bn/I8HoJme02XRrPwYq/ZieXQnXm+sxxuIBORKeaj08=;
	b=PnyuJJlHDRMuiryfM552WnGjlHqIj14DRfcd3gE3fujPWau1LBaaRXPOvHReOKJY11lP
	 +BNnFsVtTxdoeRUVXgFx84M2r10CpsUqneaymi4CsgwzyD+W0Vs7ZfrJ/HpWiTXElhdb8
	 ENpBgIJ8QFfI1uL6pvsinqioDIotd/Z9+qkrZAb6N3JwDd6O5dywuJfPTIQkoiGzz7Bfl
	 ooAbYrfIvtfomIPjflmq6UNHwRkYkC5Rc31rvN7ixTdSu6F8d6CbgunbDELBUR7Q1OBKW
	 BumE5Ta2Bfpq8ig+8pkwwIaMkGlNBsVFb8/PaRJQ82DFAPMIZcLGUcwFF1N1STHhokA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791061739;
	bh=Bn/I8HoJme02XRrPwYq/ZieXQnXm+sxxuIBORKeaj08=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Yl6vCseH3UZGli3iD7jYND1owmXCDE+WM220kRLTM9Ksb4a7pmoDTqGAGKRuf7wbN
	 05RoIwVGiInv2FKpjYD7c6f1VQNc7ZCLBZVdF/3MZeJzd+CnJG/JBPPTNZz3eCOCJI
	 kk7WT0JJU3kSOEJnrlwGKHT4fsHQeD3eLLh4AePl6a7PleFmIjXRrcnl7RUn83+zre
	 xj1e07a1KibK2R/tLGWeR80OkDTKkxg/ty4f2Dw4+9NqFIktrzcJvcyPybYicJSNOm
	 7lfPhWcgDHaWP8jgq/F6fPG8gRAUo8stQGTnRR7QG9LMQwzhH0sp4czrvp3dYfUS0y
	 2byVc0sYhNgOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7280E81493;
	Sat,  3 Oct 2026 21:08:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 91FB5476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83A6640ABB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFTN3IWXbA-I for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 21:08:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 96FAB40A99
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791061737;
 b=bO+rim4N1vbtQZJ7ozNPn86IfA7l2AcJCjpep+qV8tWLYvMuyPRzWEQyXiP2/BD4cHc2
 Jx4r3A+xEtQzHTeOHesbRUgI2lo4eY5hsheMyTI/4oqiiFIU55bMOJZq5koIoh80Wc+Ll
 BDlmoWVK7J0yFKHCcrIcgS9MNIKtZL+QEb1FR0JD5ft7RKUARAtuW2gv2exEpMJRYifPX
 zOm7ZZGtr+f0+CMggSMN79Is/4JiTd0SDfftqPciI350i+mmFd4qIWiVBVTEDfE8LteOg
 8PjPUaLMNkOxNfNja1/+UpPJHr4KbjMeoTI9hyHrD+qRoFN/XrNwRFDZC3aqyzpaOww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791061737;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=ftx/vvpyv9ygnIeya8CZUDIutjTr+RKekoJP8RF/WmI=;
 b=qBEsQNPgIMAFYrZDB60i2InvdnqhpKZ2Uol/Fyatp3ll1osKGv7omWOYv+M+tC9uW+5E
 VRm6EY5TmiwxS7xSiTuoqahMigKvh7DtxKJjXpqPZUnXzOOOGnAchr1f1bWc2ybpJ9guU
 Tbkb9wRt4bp8OtyRL6pwE8gEXPQnREiaSAzSgf9Qz1ep/SCKLurANSnLt4yaNSNOUgcT6
 z6y7sozIEK4KXss64jU+DYsblPrlIvKyA1PKUB/px0Cmd7a5wp8HgFUB9V/2W4VeypoAK
 kkWVCM9LDV9vRcba4s9zuJlWxSamN4r0ag9KH2oWzVJoC8r1eNkHV5ITfUvYUATvNFA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Ytyd2P+R; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::c;
 helo=mail-oo2-x0c.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Ytyd2P+R
Received: from mail-oo2-x0c.google.com (mail-oo2-x0c.google.com
 [IPv6:2607:f8b0:4864:31::c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96FAB40A99
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:57 +0000 (UTC)
Received: by mail-oo2-x0c.google.com with SMTP id
 46e09a7af769-822f7e70796so811579a34.3
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 14:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791061736; x=1791666536; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ftx/vvpyv9ygnIeya8CZUDIutjTr+RKekoJP8RF/WmI=;
 b=Ytyd2P+RwOZUBnhGArmtx2nZ+DhZtHW7Tsgnt2UF8dQwx9C7ySbl/6mNGjq6+QgZFT
 QfAXWXzkOycfovh7Nes0hKctx9lqxttRH8JCsypDPU48jdOXmVFUzWN6fo8jh6MkQq8x
 ZE1RyLzTvWbo/S+ocXswOVS8DICQCaJt1Oo83UTD061uUyVkuj24M/l4IRr9+vSABdpM
 +68YmHh9mH12z9KmCvsfSTUqjKYP0K6E+/ZhhHhn2tUXXZrrBwwK3fuCjxE6ZkX7cB1H
 PvP2Xq9y1vmjKw0IpiAkCb9GApSlc+hQy0iOPJ0suH8SoxFSjPk7qGtDUy6bLi9Jjjew
 Mbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791061736; x=1791666536;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ftx/vvpyv9ygnIeya8CZUDIutjTr+RKekoJP8RF/WmI=;
 b=CMb7MS7+IghY0OqiJXf73luvAI9TQWYorFXpZyv71+Sj1yNJ915kT56mE8AVZ1FP2z
 es1AWhJb81EEd6j/3UGqP/6R1n+CQAiP5lwBl/sP/d3ieQ052dkwUMBR5wKPiepvqHzv
 MC6zZQqSMm3SQvMzlL05ciacUbAh55+qFI3pPz0bFu++Sp8k1XqaCJLG57XPO1MRIN8V
 DlgKyOH9xnEMiOSkkp6xdcP1L6J5fc4Me29NK1vsPB+UR0f/mA5H2oKPDEj9IuW0A831
 QADMj5F2qQZsVKtDDRlVFUSl2rSJgX9zF1z1kNoY114JBOCFfFdZYeHIPzReLooxBC/F
 WJgw==
X-Gm-Message-State: AFuF++nk1GRxVvKrXQWHmIHWGk3r7fZdW/Ozy9ccj2QbVIVFZ2qxBaMr
 gxxdDtNTI/dk4kxOEfsvU1aD8XH8F4tk/L4Vwpb5oXVndW0BkismtmOzlm6NVw==
X-Gm-Gg: AYBFou3+VZ3CQhtKZKbWi8tJrmyOH96WmOuyLnC97a9ChRv9s+S4PGBvlmwobHWlsU6
 M4AsLsV7mwJUjFDQwDSYJr5hUxhoifXAE7WE5RNb+Wikw6c1SDC8jWD0IB6G0w02lcXXfP75Wtf
 RnMrtIktTUIG+4ybD8QyP5c7nsUtJgloCUx+GunRKbUFt3iypwYOZsT9xiZR9F7Iz8ygfii7/cF
 5D8oltSFSpDRDfCS1mgvG3pR6bXiaB/BgiQKFj96TD+7CAgWG2G6TJ8403qBht8htVy/FIPAVcd
 3MOhSTcLWd8PB1A+yKdtY56ZwvwXPPwmbMtkYyMkmc9G7Fd0dV6w0W6aE1BNCDeOupd0wn18g4L
 NTa3iK225HFk4m6sTyeiJrBoqdpRqLeFmnIyyQa7ncd3lR28WbuEA/eo6kIgk+TO4xWOy3gfg+9
 3SXfs4OgxEquXwxU2EvpPn76HprV0KEHIUGih0o4fJ9Ej048QVa9cuWdQmbn4qyX/Mb5Ne062Uj
 fjYmCmdYODENwwUR/00+Sw/6uDxVe/+vX8+Yzn1RyQuwSjLawr3kMKRrgJuOerr+xQ8iPYY3sHo
 wWIDGgAcBmeHmQHXj/5UD9U4KEb5wDNcAcEGduFA4SypsQXiVXcRhJWQT8zmBPAoloEDAGuKfrk
 Gbs53BqR+09nxbr2pDXpwVaufniF2lFG+vakiJKYgrw==
X-Received: by 2002:a05:6830:374c:b0:80c:d34f:5f66 with SMTP id
 46e09a7af769-82283a6a621mr7381953a34.31.1791061736455; 
 Sat, 03 Oct 2026 14:08:56 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82409c586d3sm3119917a34.11.2026.10.03.14.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 14:08:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 15:08:01 -0600
Message-ID: <20261003210833.735937-11-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-meson-python: bump to
 version 0.22.1
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
 package/python-meson-python/python-meson-python.hash | 4 ++--
 package/python-meson-python/python-meson-python.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-meson-python/python-meson-python.hash b/package/python-meson-python/python-meson-python.hash
index 2f84b61808..b39edeecbe 100644
--- a/package/python-meson-python/python-meson-python.hash
+++ b/package/python-meson-python/python-meson-python.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/meson-python/json
-md5  eb572c5384b20e0c3bfad88fb66ae0b3  meson_python-0.22.0.tar.gz
-sha256  9c819d0d4efa746edadfaae4663c0e9c75659186ef7e5bab12330bfe22964dfc  meson_python-0.22.0.tar.gz
+md5  afd1035a4c4116bead1338a15e3516f1  meson_python-0.22.1.tar.gz
+sha256  52c88628b0e5671592dc2306613fb5f6f3615fd24def059b9894f143b7f9a139  meson_python-0.22.1.tar.gz
 # Locally computed sha256 checksums
 sha256  8f82ea9ef9a55b47f4170536d02e48b5bc33fc5135e5b4a1b5f8d6404833ec9b  LICENSE
diff --git a/package/python-meson-python/python-meson-python.mk b/package/python-meson-python/python-meson-python.mk
index be9b1fefb0..ca49f05e4a 100644
--- a/package/python-meson-python/python-meson-python.mk
+++ b/package/python-meson-python/python-meson-python.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MESON_PYTHON_VERSION = 0.22.0
+PYTHON_MESON_PYTHON_VERSION = 0.22.1
 PYTHON_MESON_PYTHON_SOURCE = meson_python-$(PYTHON_MESON_PYTHON_VERSION).tar.gz
-PYTHON_MESON_PYTHON_SITE = https://files.pythonhosted.org/packages/82/14/1bafca9db7691ff05767570686cd775bddec57c7358e78504cbfd35ec996
+PYTHON_MESON_PYTHON_SITE = https://files.pythonhosted.org/packages/b4/40/343ae23722d5d66a7b94b752d1b194202640995296379333b274b1860871
 PYTHON_MESON_PYTHON_SETUP_TYPE = pep517
 PYTHON_MESON_PYTHON_LICENSE = MIT
 PYTHON_MESON_PYTHON_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
