Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27C9CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 704EB40F51;
	Sat,  3 Oct 2026 08:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0hHA6IlxCzDl; Sat,  3 Oct 2026 08:45:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8DDAD40F4B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017100;
	b=jqWEShoAvyrvEpMO4LJcOkdvW7iFYN3j6i2dptJFRbb5FAkRK3/kmciLGDzlV5IZWr0D
	 bRWK2vWPVEuD22X46NC7L8YqrkaOptlrPtrTyR3VtnpVkKI9lRrT/HRRPt0gcxucJFtOa
	 vamtHzKIaSTMHNH5IDA1BTI6FZVfcKmNnFYq31p7duf8hId678UawT2Wzw0S2VpUauMh5
	 FyTRfFy6L1gEvIuCGoyaE6t2vcIZMY7G7ANNeUlkLCzUCoaWXflLiQBayJ5Dy2UUmkMLH
	 eWPqxZyfctaOCAu9yQEu5Ui5YVgMM0sB8oPqVXl0iIE7ToeXGwIXuNvVDCJ1ZpHN+nA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017100;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IdcNtjp6g1x4EDafNvOWoojkpjghH7tJilhDXnblUfk=;
	b=VRrEUy9W4kjkTgdjQw6cUoplvRz89yFHULtPW7B11FBMYpn2c2WCEeZiQzYCsWFnVNAC
	 q6jAiJNMCZxNfEYJT4WPUt8fLwTDBIHPtDErEAJOj5d4hBuweXdoxBHr+jBr3XV15b3vz
	 sISbI/STReIKLSzKBaf2OTtkMKfxaV9S8P69G8Kr9XooKqXpeYw2W0yFfNer8sOooOvO9
	 YQ4oquXb/vkK461Qxu8mVyoSvoNMhgHg3Xo+vQPcV50ZLpVLlayBqZPUfvupyFjG27wTt
	 uSt2IA/zASVfbk1MVdo+5PG6mehE1S8xMLAw7W+HxIoXCrKbQp25zBV/1WzR1cCYDRg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017100;
	bh=IdcNtjp6g1x4EDafNvOWoojkpjghH7tJilhDXnblUfk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=OUew3TAUsWySidZSiJJwdrcGQr8umKe3EmeAK2xFjaCfYYLS8OIdSZAFMoxq7cRnf
	 5BwXpkuzQCglu+kKIg5lKgxdjDr2puGxO2/C1vhCCUkPg97BLKm6qfSDr0K9kKwgkZ
	 p2JXoXsBwQ/ejo7XnK5+SeVWni6wmgiEuYNRDN/EzS/Ao1C/IgjKhiFDX3GVXgOjoB
	 AuX/L3LdpnHJ24G0C/8ZQno0VYlw1aeEz9i5jTOsJSYNjbKvNw077EjX1421I6rN7y
	 YOJ50RVrllaDxxOT5jJVfAPGS817Rc4KM3MB9wGK0ISHQj1Sn9AgY5dI7ScaS/2Grw
	 6ipZFrlQWRPEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DDAD40F4B;
	Sat,  3 Oct 2026 08:45:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B49C2E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CBBD400F6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o2vJpJgINr4Z for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:44:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 66F9340059
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017097;
 b=IgEnhcF5mauz+avXAtxssw6ip6URvYprjiAcpp+vjrHIfGuZSNh2yJaZ+7RWSsfThyM2
 NOBqTtNjN1pR/U4mbctYNp0PrMgJXqDHw70kUYxbZsVCW6Pfo4sISkeeDkbkJ8ojgsryK
 Ba3KnhnlyXFsrDYz8aiDwmwXjR4VG2FPo3ZVwOm61bGxor/9hUKAaKVzws49yKVI13y7K
 GBDTijcnjSheGPv521pYIBYqcYH+lQEILwWx0dtpuhKhVQGGVA8ISdkKguCGsFHa1sVe+
 2zQ662svZb+bsb1qW/moJsu6ncwTpWNjv41/ig/UskX+42nWB2ffViG3PcLwP3YsofQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017097;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=613ExoHxjqtIVQFHoGuTWCqDSrIzHw0FKMYLXPkt9Lc=;
 b=YfbARJEHi9/n1dh+EUzz+v9IIo6TzlP1iYP7/+y+XE1h8GVsx/Hi851OwyxDLp/Hncuy
 PdWuEzHACFxQ6lOznWgjWFofAxQqMGzqC1vQgE+hrsL9GnONb2cGN7fXIl8q0ElFeIcO6
 v6sngwa2uWthwJE3/uVHFeexMVD/LP2/jz5FnI4rhrBYwNMLBId6my3hczat9uJcfN4st
 4zYjMZYy9qnxlN0samgOffWvJcGbWKLY5u3/Nny+gQjnvt9mP3t+Wv0hiu3gKMW/9VSUd
 5cHcE++MLlH79RkRfgtz+P5tOexnPDbFIRl8iV8CTdAiizgapXBcOSLZXUM/e/nuktA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=inuDbG9u; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::c;
 helo=mail-oo2-x0c.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=inuDbG9u
Received: from mail-oo2-x0c.google.com (mail-oo2-x0c.google.com
 [IPv6:2607:f8b0:4864:31::c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 66F9340059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:44:56 +0000 (UTC)
Received: by mail-oo2-x0c.google.com with SMTP id
 46e09a7af769-8235a9b8505so267165a34.3
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017095; x=1791621895; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=613ExoHxjqtIVQFHoGuTWCqDSrIzHw0FKMYLXPkt9Lc=;
 b=inuDbG9uY3/fnb92KcN1hHMTvjMBvUZU4N3hvNwa2r/7okbNLW0QN+JaaaI5lPnktK
 yNqfxFNObHe5V4kmchWQ+77tVn8UdOOPKnn0qiZe/e6eA3wNV0H1ardYLqSZBpVSdVwx
 1pryH95ODuubZKQgm64dgjmYLqpPjE0iagkE6kvMNgUHwlflnkchndUTyVQrbvSnq9dg
 fFs2XEIyafJ00uaiT68EztKOeUHb2didef4JUYCzk1iljKF9SoPNmuTHkBPyQ8Grg9oA
 BQZVtPc2H8c3jPBo/v1YdlfLiL6pfd+uYsTuCbN0NyEtnbyDNeUGrzls0EJSPjYlvuVZ
 ES+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017095; x=1791621895;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=613ExoHxjqtIVQFHoGuTWCqDSrIzHw0FKMYLXPkt9Lc=;
 b=GfIBRow4uJUDQq1tIZkjggq4SEqjYfuOa2DdplpjIj0Fz7IVl3hZw37kTnlFrDAKc/
 Hmwi0PD0Zpo4ecCQUIrqw6Y/4aqZ93sBgKtHlncnDKgIovgRn0syyH1PZmVLDFXxn1Jl
 bIAx0ZVhKhmvDw6s3yRIprOpKCIS1GnsiPuJ7K4nf4lZyz21l3hQf0a3TRmnu9jROhEz
 GVTIUJQNf+fh3Tx3Co+n/iCgLKHDuBLIqfbmiL+lxL1Z9hEluCQwIEgOykQhGAkja5Ch
 gHuK4sG/TTeZHltmrzfmMi0z5klZ0Un2xVXrIjHhxXaMj3HP95XX3foPj2E7iOLYk6PI
 SWEA==
X-Gm-Message-State: AFuF++n8qHjapQ2XEU7nYE9uWdPj2p+Yozr6iUzvISfA6+sFlS6tWq+c
 OrbYiQ3A7yBQ5uSO8xbo2kDKoIrj8djkVWz8lkipOgYzvVGmHdw2/aMPU+Byqw==
X-Gm-Gg: AYBFou2ou0owuQhrEe20yM+z2lQSOxUCsIXO+ES7pk+X/pHgr5PxA3zEr/Na4lwS3PC
 GO8hbpRVJulfMij3C83k5I0X5yQ75X9BpEe30rmXFWiegiFnw9Aju4+CV3ANPA3TQXhoiQej+LV
 /Ms+6vjsnDpUdjL4eS9xkpBz4JmNr2IQE/vRvPn1zMBG2vEnQ8Hj8Rf9nUdLG0MZCGQdGP9zJGI
 hL3LwC05zsu50S9r430yLU0fVUfw39HXtQPzRb8+okHE/YeA69VDREHXLq13XiSV7nxkyFa2lnC
 F5du9QmMHj4qCl2AqtgmgmNUI3d3Md9nTPmtu4Il1SUQne1OQpz+g+YMS4QDlpZr2ayMRH+Us4e
 q+JLugJKqiQ3QXIITVC7ims8wGHqD6kiNbHdALhBC/VDmIH+jJVBykIDR1oVwFEZexIOzzChNn4
 W5ySDkKUT3QqFIED6jEVJGhE4aaZxqVv6TeloJc6muY50D3EeF+2D8pKgkn6p0ye6zlUpRp8Npt
 MSpaWZ2pTl0mf/ynEkot+ySoznrael7C8HrDfeeKPa0iMzU9RceWXQCgesmSqdCYf5BMSvWeaAj
 SJVWT+GMOq3hzHTKiXyPFMXlu6+XXd8vZLX8H5JKxTOrOnZQcrgYYiHhykFURdECrVD1PkUf+O/
 e/57Y/nqqkrJsH3a1drN4SI0uwDgstHMkevszxRCoNg==
X-Received: by 2002:a05:6830:4890:b0:7fa:ab72:9e01 with SMTP id
 46e09a7af769-822860500c8mr4955371a34.25.1791017095290; 
 Sat, 03 Oct 2026 01:44:55 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:44:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:43:46 -0600
Message-ID: <20261003084453.545653-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-alembic: bump to version
 1.20.0
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

Update license hash due to copyright year update:
https://github.com/sqlalchemy/alembic/commit/9400ec85a13a9330509e67445b939d79662cc6cb

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-alembic/python-alembic.hash | 6 +++---
 package/python-alembic/python-alembic.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-alembic/python-alembic.hash b/package/python-alembic/python-alembic.hash
index 7729f97a64..2f886103c1 100644
--- a/package/python-alembic/python-alembic.hash
+++ b/package/python-alembic/python-alembic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/alembic/json
-md5  747400a534b73635c91d3b4bb71445c8  alembic-1.17.2.tar.gz
-sha256  bbe9751705c5e0f14877f02d46c53d10885e377e3d90eda810a016f9baa19e8e  alembic-1.17.2.tar.gz
+md5  d221e130339edc326f8333cc315e8c32  alembic-1.20.0.tar.gz
+sha256  db505480647bc60386c5369402f4a57a506b7539c9e9ef5e270d45cbbe4939bf  alembic-1.20.0.tar.gz
 # Locally computed sha256 checksums
-sha256  35ea9c3419b261faf1be448c4f47d9255281bf6b36b5ffea55052227d4ba54de  LICENSE
+sha256  6e68d94a03a0e3e327ddf3e86d1ebedc14eece3922022618fc246a36296fd0cc  LICENSE
diff --git a/package/python-alembic/python-alembic.mk b/package/python-alembic/python-alembic.mk
index 530b31246f..a940e14eeb 100644
--- a/package/python-alembic/python-alembic.mk
+++ b/package/python-alembic/python-alembic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ALEMBIC_VERSION = 1.17.2
+PYTHON_ALEMBIC_VERSION = 1.20.0
 PYTHON_ALEMBIC_SOURCE = alembic-$(PYTHON_ALEMBIC_VERSION).tar.gz
-PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/02/a6/74c8cadc2882977d80ad756a13857857dbcf9bd405bc80b662eb10651282
+PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/ed/aa/02910bdb8e2f1444f6654d5b296cd827d126f82209050ee7b1000f92ac4b
 PYTHON_ALEMBIC_SETUP_TYPE = setuptools
 PYTHON_ALEMBIC_LICENSE = MIT
 PYTHON_ALEMBIC_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
