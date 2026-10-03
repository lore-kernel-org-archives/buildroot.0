Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087A3CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABA4B40E3B;
	Sat,  3 Oct 2026 01:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tEe1imK8IbGP; Sat,  3 Oct 2026 01:33:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BB23340E30
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991222;
	b=jBVlsMo3TTRjPRHJ85yOmbeM9aqYsCHESZ+Fk6zqJhChYx+6GkB5r6Cxd0kOd6lkrd2L
	 Z9mfUPFMwD26GWIk1lEgkZnUvyASd/V8IcBfPN03htOMryYgdrcmaDnSiizEFKyEqlpCu
	 dWqVljxUUFTpQ5TbgUaVrMISDlmT0CFRglz16fM9H6Ga4y1TzUzEr/GhN5VKeHZXIcqVG
	 +n5+57mTUC95fJ0mWWuELO/fNBIbX8302YLwUM7gsEaYFmPX5Z/LW3gs79j+a85l5TqJK
	 u+CNmjvPy1ypDEv2405cE8l2ZXzR2u5e2oMnjyrzQP7ZrTGtRGpx9dnboajQzE11Ssg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991222;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=idl4xb2bA2RbcAH6HXlErCNizKXnhe0RbLZN2a3T7EY=;
	b=bN8ZkLD8i+aDBkk7XMwIA4sx2Ii97JSfOxehLbuLOkaYlndVQjdz3AdPtO9JH3RRESxf
	 MZAOZ6Em+zjR7OetS/eJGJAd9feHfFiFH+O1FlTcXNaBoUdE/mXryheRah+n1sC+G7qSL
	 yjWKcMcceyTYnz+BQ3wHBeGlkBbd1/WtFCVQQ+2e4td9EBJauFJneZ/Gp+SEToNi2M1pT
	 fbKRCBVJlv4Cb/bH8B7AipufCONSz2EcyQOJiFb9wFwgtGUUSQhjc5J2jAUbxqIXF7waJ
	 VmhhelH7wuQp8Ul61Uwte/4FUwoN4JH/UIN6Ploe9uCYULMUvJeupmTdBBKwHP6CiNw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GBW5WrC0;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991222;
	bh=idl4xb2bA2RbcAH6HXlErCNizKXnhe0RbLZN2a3T7EY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=rx1k09usZ4AUqrCz7Z3M/tOAXRKGFVlWIiWVbREBe9x/KXQ7ANEIuPlMhxF5LMXzD
	 akaXQNXToaFss/QkrRwVvIn79KBue6XBo6wCLO0AKC/tlgdTJ+VUgXVKCnELcpdGQ+
	 ifraA9GYVhQnGPH6UqJtp8Ygy9LFfcCmLQuY+1kgWsSkBved5RaL3xxQXhGT0TFhb8
	 lyeVaOPkljuSdtMw7QXneUFXK5LYKqurv8OHjf9Od6tqmPA8r3w+8UjbuHPWCh851G
	 vc8bu6Vm3F7ZdUMKwNveRQX8yFBkp/JaqQHOj8CO9HBF1/OJlR4ILarCaAMT2RtyxS
	 sGLHeeLKtR8nA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB23340E30;
	Sat,  3 Oct 2026 01:33:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B76EB435
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B21340E36
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MVSzYkmVJG9H for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6388540E26
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991220;
 b=MOPK5c9vxU6dM9tF8Z+aVRQw3U3W+NGKlwwabYtmisLhKtDsavUy58Fr8m/bUNP/0Des
 i2y/bh31Bc8s+EKXWU9W7EvuAtFAliVV6FlUPH/rqtrkCZrFo/qRKAiZd77NtOHCg4i4T
 nH4ki7qJyWgSBF8wB5uB65KkQKVnkdSus/KKslp0Q4wqTBuK/4m64IDeuWwmxxVrdegEk
 g/mFeY/1zr9FZc25juYRJIFxzeYqeeo3I0OWIj37K4vrYmOrdb73Tr7RVFhDm0C34OiT2
 iOcvlL+mnjvZeZJo0jgDy09foV4GFOYB0CvivHZXVq3+tvV51yXqIbo+g2uNwI0R7/A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991220;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=hPPmTAxCDe24rfK59TKnDjBdtCY9FXCanfc6FX8iNMA=;
 b=j8mdD14mfpnwuC3/OzU480oGaoSUjOaiU/qEaVw0FmdsbFfQoDFo0NdtLOakKg6lVV/g
 jG7xoH5PZiZOZdU6z5bo2YDiAhaBiHzHu8TZKCPTfMCaAY+ALXanIowwfhGmEXEIT66bb
 coZANkKLppuq2TDftQPr7YjflSeZEOoILMfwuQHpvSEgAf9XtgNpM55ROF05TWMy0gkoG
 s65QbuDEL4xsxxRdJkoM0DQwQmqA/GBAPxsbmm7nKcUr7VvufQ19TvaotO6JQZtLtmB+B
 cd+uQi3s3ooNG6vrgG0528UkftNRlZ4SZTbWMDMsLK8LpjppQttAdAiQ0zXkxFiJfjQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=GBW5WrC0; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::f;
 helo=mail-oo2-x0f.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=GBW5WrC0
Received: from mail-oo2-x0f.google.com (mail-oo2-x0f.google.com
 [IPv6:2607:f8b0:4864:31::f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6388540E26
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:39 +0000 (UTC)
Received: by mail-oo2-x0f.google.com with SMTP id
 46e09a7af769-821ff9f018bso372831a34.1
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991219; x=1791596019; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hPPmTAxCDe24rfK59TKnDjBdtCY9FXCanfc6FX8iNMA=;
 b=GBW5WrC0pPs1XVUJl/OYaO04J5HqYR030tGSL9ZLTulELVgxIrFllWcq4EFHDbJBBg
 nJwSEvsJ0KLOlh9FGidFb5NkURBX0oWiHOhBdBJiTKNO4F/SE+FG0LltutVXvqHopJHh
 0tEy3f84PWT43IPRRdZNH6fuZGg24fPBOPG8iWYBBU/ZTi4vS8wQWe64T9Fhof6juniN
 RQgSZdBgnJg+xN7uq61CzOu0b2C3I/daRddUgsIHTxo4zY8pVAhD2TPf5OmTmJ88ozGG
 FflsHm7Ut/D+9eIU9lFUFjrVBlZ5TFMfGhnDMkUvd8oJm/kH7Y6ZMzah19d5+gonN3Ck
 h8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991219; x=1791596019;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hPPmTAxCDe24rfK59TKnDjBdtCY9FXCanfc6FX8iNMA=;
 b=gV4fa3Kn51k8lwCRcWKwYlE3bMxeWjabn7jWMBiGeBZfYxcvUa0fc61H+aF8omEz1y
 QLcPldqhlZrI8AcYOD0vQQxYI7EMLXrKRFu6DWzrGWBnaE9do13Oqoj9KJlhM+LP16Cu
 ftdr6W0pjvPzmZs4xAnYITrrA81CxmsmpQokI/DFLhIuaO3P3IMPjnaxphnqU6KlxYyb
 sWJMQQiq84q+yyHGOoOW5PKSAGRJKr5YXduUwNBoLG1G8k3zHM0Cvij9ix9xdoiiTfRj
 XgI9P1L72OVBg5xLsz6UMJm0qAUe/2Vp+6Da4xqAbJ17HSyKVSzpSoEeF2efXATb4z1D
 3tgA==
X-Gm-Message-State: AFuF++l47EVBk8vTL734bf91Ak3mpYBAgugeyNy7kedxtkyGXkfyidtb
 m2Yrowc3kFCK6ZbkV/wL5j6YIStGazo94g3pbQ+jqUqyBdwYcJ12eRZfdZQatQ==
X-Gm-Gg: AYBFou0XkE3/0Zs136ytNettn+rtOyRO8gWwv/NvigupVhT33d4dyeTRhFa5rpxwOQP
 jOm60BpkXox/X2xS0sJlEshlFr9p3i657RX1rFO6xfjIRvx6N5TRqZyWWyUEdAJu70ITMtRkKa0
 GjPpVNCizdHERMtQCpxHO/7myBZkbbUvQsl7lzUlMfF9VFtZHPNErOpwT9G+XxO7aejV4qZFSjr
 GoR3+NT6Y86EPamWlILUspBOsCCvt9MNb3X2r+o58dICPugrS0TFHUEvT/aqwfc51k5zLzxDwZ+
 GThb76MVIvL4F88F8V8XbtfjLv52Rg+JeESe5q53YlrLJhhabT0FXZ1eA9u6NupkfbdR2LVsYWA
 Vl1lcLkbBj+8M5jSHyOlrTaF3AneLhAxyzpmxixdElrF71AvUQBDHsDJ6u+CeyrQTBW6CsRSTDu
 01w4CPW4TUX6ok4HrG8m2hdr4aAgt91dSnMxOAfiahU7Tqv6p98835mh7LLcRjAt5DhCXAVaPwA
 NgiZP/VBD+nkp+hBOWKUpNQ5y6nRQAcbAADlMdm8lv7usLnumHTl/6AUukld+fcBxrMwpuiW0oJ
 u8MUlvnapKVK0nvlvMlz/dupMY3Gk2oUg+uP9vtvL+TWty/rbyMFtebHCkvgcUPuBwziUaht/CT
 /VCG7T9XU7PhhIqWUOXKANkII69n6FTLlnOmP4yT+dQ==
X-Received: by 2002:a05:6830:f81:b0:7f6:705b:ffe7 with SMTP id
 46e09a7af769-822825801cemr4458842a34.14.1790991218902; 
 Fri, 02 Oct 2026 18:33:38 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:20 -0600
Message-ID: <20261003013304.400979-20-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pyjwt: bump to version 2.15.1
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
 Grzegorz Blach <grzegorz@blach.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyjwt/python-pyjwt.hash | 4 ++--
 package/python-pyjwt/python-pyjwt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyjwt/python-pyjwt.hash b/package/python-pyjwt/python-pyjwt.hash
index 92de436de8..2974775eb1 100644
--- a/package/python-pyjwt/python-pyjwt.hash
+++ b/package/python-pyjwt/python-pyjwt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyjwt/json
-md5  12623a5898f60c4c86ad4ad8d92da216  pyjwt-2.12.1.tar.gz
-sha256  c74a7a2adf861c04d002db713dd85f84beb242228e671280bf709d765b03672b  pyjwt-2.12.1.tar.gz
+md5  c095da5019479aa8153266b1adc09d3c  pyjwt-2.15.1.tar.gz
+sha256  4f259e80cdfb6b3fc18a7de51fd1ef9ec79652f25019bae68975ca2468a34df8  pyjwt-2.15.1.tar.gz
 # Locally computed sha256 checksums
 sha256  797a7a20231d4c433e9f1911db1731d06b5828b98f499819a034f7c0f56f5ce5  LICENSE
diff --git a/package/python-pyjwt/python-pyjwt.mk b/package/python-pyjwt/python-pyjwt.mk
index 268d83a487..6524369c71 100644
--- a/package/python-pyjwt/python-pyjwt.mk
+++ b/package/python-pyjwt/python-pyjwt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYJWT_VERSION = 2.12.1
+PYTHON_PYJWT_VERSION = 2.15.1
 PYTHON_PYJWT_SOURCE = pyjwt-$(PYTHON_PYJWT_VERSION).tar.gz
-PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/c2/27/a3b6e5bf6ff856d2509292e95c8f57f0df7017cf5394921fc4e4ef40308a
+PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/43/ea/5194e52748b0da83d71e082d75496eaec6e58f419f5e184786ded517e6a9
 PYTHON_PYJWT_SETUP_TYPE = setuptools
 PYTHON_PYJWT_LICENSE = MIT
 PYTHON_PYJWT_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
