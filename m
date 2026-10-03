Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8904FCA5FF0
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 21:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E60860E8E;
	Sat,  3 Oct 2026 21:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pCVQSJMfeF48; Sat,  3 Oct 2026 21:09:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 33D83606E6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791061738;
	b=lD9tfgfK3qTsetO1q8geCP/EIW8Th+k0jEgD7IQISeAXMHx/LmgbyaS1DaHy/7dCVA/J
	 5ynS6gaQ1vgUlXwjHRCATxSYyuZw+/x8E11MuqJ0xJtb+iK+V9JycVUpyWKUZBgEnq8tV
	 MvZ3FzENGMP+WAEq9ZIu+BGHMTt7xivt6cBjISZ5P96/DDGpruqd0xO0z6gmyh2zfO4go
	 mH4yT3EQdGDSrLW24jc0vFDnazT1qY11BehMlyuZcXlVaKsevyghYE7COCAt6Jfc8MEEW
	 wP5Ndh+TJUWYTRaq+UytPkTPYe2Cbu12a3FxaYvOFG+4XcIGGl6m4BVk50oRI3oEEQA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791061738;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=RHGOkvUGU98cIBgHQlKY29zdMWZC9SXyUIp2Jf6FYEU=;
	b=nLefOhWBq8xCdpizxffgaD8/xmIEt7o/5Ws2ENGN6CTbTlw0BPz+Bpb7FNkck6W7yIy1
	 zwzwMS0apgQOczJjvpEby1g1U6SrFK5VemohGLbHX/LMzRgpDmzkbAGrqV4E60Mt/I8dd
	 yHFViOtfYBwJvevcP7aR41P9b1bHPl7cOKrIW8Zq8TG2K1Vv9K9Ak9ruSwLXhAHyZ7sBE
	 2Uok/qfHsf4v7ymUbPXu8u6KEwqEfHPmsVWr5fNdAuAVrUNxf7O0X+URyzppies7Nzq2c
	 8CMONLFUVxfaG/0WQhfcggbc0Nsqzz+VRDxdZdPVbiGlBwWfqzkOSxMF6Vok5xFvVFQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791061738;
	bh=RHGOkvUGU98cIBgHQlKY29zdMWZC9SXyUIp2Jf6FYEU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=bCQSyO/0E16imhmIv0H+8SxPBak/sy/mQRXwXe5ONxlZSi+9ZWU5AV8MbTX57Rn6g
	 7bEz84SKjZaeUQqwK22NZXpX/rqJ9/Mn4yO+wIHOrrFZEctQrIvGpe3gTEYCE+Imbt
	 qmfrSIKYxqc6T70742f3dlrMtopUInaYg85Xh7Tk3jSsrA18De7dDwPrgXm4M1tgJQ
	 P9XUTPS9GFj99k/OeLcsdV3sZUJ5bFLFqKzHGjEx9pStKvXfzPBNuxey+HKhA+qrP+
	 Ivpv+9uIey6dQ5qb85O9ejWhXy0KbggMYEfZtMqvg+dXXqfhcWxd0KLNds6Zbagncv
	 5SvtukLB4XyAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33D83606E6;
	Sat,  3 Oct 2026 21:08:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C859F1A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE41D40ABB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qD0JUC69l24y for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 21:08:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A4E0140A99
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791061735;
 b=E7KFs+fK1iSkne86CfWq7occ6gArD8TB3mA0oJ5C+MJCGSHzv9YzucbqqvbgcRJiBjjb
 6mQdOBoIxGfFtGjUD6RTo+aii0ASUgroWBgpzjKocJxmfNlrndX3ZkWjOFB8x66EeeEFV
 hToPowgwon/ZK8Ssr/J5P1RhsaPapIKUXfecQQgX5agdujQSb8g4MByjQ5rno0Gq2Ken2
 9WnO9aBxt5exmflRWda7g65l0hNqpvZ6EY0i61eDpJMiqY1C1G4HCfWPL2qIrKlVcfeNk
 uPeS7vTWd/CSMsg/SPvdAWTEQq4FsQaQH7epCMCAGP6Jg2CU6SCbKZISRt17uB+A9hw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791061735;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=VdKbufoHJ4lakYoNaByE1drz2AusSuctqZGV3B5pR8U=;
 b=G+Wc4yA+vGRHLxUr300D3fY6S70buMNUWPPft1B9D3D1namQBIwiISKCNBbTbpahP2eD
 IuThg56kXEW2+nykiGSs6a/qoDqNLTROcuavmN3vWjoX5D+miN8WYf2tUKuSllbnEMHro
 6BV5FkIbZYLPgAHuosTJPrjYU7qecDOe0Wg7AT/rtYOFgtYKKA20UDAf1OpM1jxQiKBPT
 Vvn/RScGndYZQVTyT9dc9+SuGUmk/jY7brmEmhCm76TBLlM0VoR75WiOKOkBWbD9KxD13
 FCscrrROWxR2XeHYQb7LRGPVWQSr798NaWRAE6vhOHytabqLu7ojFrIMvIc1fLyislQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=U6rsocGY; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::d"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::d;
 helo=mail-oo2-x0d.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=U6rsocGY
Received: from mail-oo2-x0d.google.com (mail-oo2-x0d.google.com
 [IPv6:2607:f8b0:4864:31::d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A4E0140A99
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:55 +0000 (UTC)
Received: by mail-oo2-x0d.google.com with SMTP id
 006d021491bc7-6d33d80855eso679191eaf.1
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 14:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791061734; x=1791666534; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=VdKbufoHJ4lakYoNaByE1drz2AusSuctqZGV3B5pR8U=;
 b=U6rsocGY83hYCkSF4cAtKbOCyR7Box+2fVCoDQ9TIbLJTNAvwa0mreS1CGaWeCYTpk
 pzIvc5/ycfE+llsLR4IE/+w4HRmd449nUizDwyHNBjaFEGVzy4hu8+vbgj4Gt7cMyWho
 Cs1S0qtoDGQYsqKgwKJb2G3FJRFW2mn1DwihcNEAnDxUmija1S6lYQ0fnlgrXcOwLOgT
 d5qkZBwLEc2DzZI3MVVG2L4+yHsgfnQhhNdJHxd8X+sIO7VznVqRdOvVDKxa2Jln6TYY
 dEZuq0VS01AdpfgUp+x/c2hOs0t+D8CMCBG1+WA+jbuetgzSYqEbLreBW7JgERcAFwsS
 nVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791061734; x=1791666534;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VdKbufoHJ4lakYoNaByE1drz2AusSuctqZGV3B5pR8U=;
 b=bb7knQgcYt6MyIBvrDORwsFs/gVVo60tqxQ/N4X8T+gaqNuv6810qE4eZ6txti4xP+
 iZ5c/obd3Cd4VNb5tkNXl76sQeyg7ellSn6NQLynUpyJ1MH/979JLjntcpF4/mMVAlCO
 Lji3QVoeqXAPSb8B0fH/U9u1BQJqYyRQWpZjcfpnCQQPTJ6IKsd0/UuTB85FVVtf/Kci
 t9QGGIaqUMTpPG+qQuTDJQVll85RR3Dx+Uyhg+rd+CWDUlrqNOIcMfaI6E9iRgBxvxyY
 i+eX8umasNFlYZBHjkXws59m83xrKUeJjKdvm4PZspk+/sSsZQJI8F7Kx/PwcYUxJUhK
 G/Ng==
X-Gm-Message-State: AFuF++m3MgM5KSs0TU71YimesQxoHaxJqsrzZHKmUrabtPZy3ok1o3pc
 Zos23oK9+o7vMDcELFebQX5WIPvQhFvPmVFfCXQPRRZBAxPMdWkj+Bj0Oy7d4Q==
X-Gm-Gg: AYBFou2DqlqIp2+D89BQx+0ssSo59YiYZR/C59TQFJnjDL/Hw+K/MvTGvJRGJZLBTcp
 OdDumyLDyrZVeptuA1x+pR30jkxhD9rmwy0r0dPf1mqXJQsDtn9slTY51E0OImmFnEo7WY6p1WV
 D5rBi+e7p+CBQfBY+84q0IKXR1fO67Q71oNzgMbngYOZuVrYuQLCt9v7OJuR7Zya+c4kIH2AH9X
 XjMhsthAIX8VGHAGlGa74lxb8nlcVmm0jQCfdQmQ6FcYIbqGweQRu5APBUUFTV/ghyHWMj601Mf
 ydpJUOWHTFleP0KwvQvOE85PHh5ozxqUo0RgVA/j5eUor7JpmvZVdJj+7v/P2DGYUmvyfvXjFDy
 sZWAyTVIzXrimyn13qrD1cU/tgcKrKkmuc5kXQYDlj+8EKFgAzCVzqxaLN+6ftDku/uKvWCIAFT
 EOai5ih1gwQloagh9PdBtLmyle6ffwcmbFveEkk7sIAkqd5UdwRX3+eGUAz5JGxNp2P78tgAL0/
 pjgzyWA/vluFTmHMIaaNkhzu2KPuWcj8LxRuzvY5GHyiB7TLF4cvivy8CVIwcc4eZyEw+6nYj6d
 YWkbnrVBOtaY61JhqtNui44c49/e+tAfr42Ub2CrIQjwYC1LiRbV+iUPlwVmUds+7pJ1smiBhn/
 MM6b+of0HQCD5abUqABAUoyTx70L/1FqWnoF3u2V1mtVnaJKSpII2
X-Received: by 2002:a05:6820:4dca:b0:6d7:5105:f6b4 with SMTP id
 006d021491bc7-6df350615fcmr5969928eaf.47.1791061734315; 
 Sat, 03 Oct 2026 14:08:54 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82409c586d3sm3119917a34.11.2026.10.03.14.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 14:08:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 15:08:00 -0600
Message-ID: <20261003210833.735937-10-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-lmdb: bump to version 3.0.0
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
 package/python-lmdb/python-lmdb.hash | 4 ++--
 package/python-lmdb/python-lmdb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-lmdb/python-lmdb.hash b/package/python-lmdb/python-lmdb.hash
index 62ffc2e446..7fa4ec63eb 100644
--- a/package/python-lmdb/python-lmdb.hash
+++ b/package/python-lmdb/python-lmdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/lmdb/json
-md5  0fb37c0c840141773ac8b4b0e9679fd9  lmdb-2.3.0.tar.gz
-sha256  260f443640ee2da3cfd059a84258659319ff39ca912c16bf9748c324076b9d09  lmdb-2.3.0.tar.gz
+md5  62c3f8e65608912c94a48299e3634fb1  lmdb-3.0.0.tar.gz
+sha256  06dda0723545e14d56ac7dcd6f582d9922c2ed5e16f1c3f8d0e670a96ec2ee65  lmdb-3.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
index b5a0db5dd6..88364b447d 100644
--- a/package/python-lmdb/python-lmdb.mk
+++ b/package/python-lmdb/python-lmdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LMDB_VERSION = 2.3.0
+PYTHON_LMDB_VERSION = 3.0.0
 PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
-PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/aa/0b/17f271b2d2d314da9c9bc7620676ede1feca5f565f3a46045319351f7bc2
+PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/1f/80/24a4064047b1c98ac73c0ad806f16bcd2d800c2eb460d6e6c2961034b8a1
 PYTHON_LMDB_LICENSE = OLDAP-2.8
 PYTHON_LMDB_LICENSE_FILES = LICENSE
 PYTHON_LMDB_DEPENDENCIES = host-python-cffi host-python-patch-ng
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
