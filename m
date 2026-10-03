Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E0ACA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B315E80E80;
	Sat,  3 Oct 2026 08:33:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5HplgcrhsSi9; Sat,  3 Oct 2026 08:33:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org ABD5580F00
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791016404;
	b=KpMVF3zsc2OWC/ZpMTKjFs/M7ARsfmG91crV9CoZcL3PCXwJ/DWoxfTsOCjkFMB6NquA
	 KaPHEkvWmVMDiOHR8ZMjbi/Bz7061vAEN2n1aOD3RRwCFg9YVIutCezLu91KsiF/VBLLJ
	 AjY3Zm9aYyIw6N5sHz1/M2RtGUuLEuxCCoq/KiBog96mhWr4gN7maT+kg+bjH8YYA85RW
	 4cXKcXk1/H1lPooZu5FaRJLjMFz9q7DVTZ0orPbYQ+aWA9hvbZdldEQfqI4uLF4kzKjHe
	 tXwikPWV4/ug/XrVV1WoPcFlfOVw8ZDj+NcT/4orGYxw1F94hjAcUtPPPilMERqCBGg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791016404;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3R1BDd2bmsa187Jwf26Ri/BUU8Z+L9YQVIHrLH25Ty4=;
	b=SHJb4VhYR4vOOao5kdzq0ilDot/2ZCioxqJjjldo/ZvAILgtQJAJWPwVK9O2LgUKwMWa
	 UgijNCDNxQGunhR9vwaZB2FTJn6bymHwX4Q2orQpZmnl1MUjF9trwKvKHtpcp5AXvKrS3
	 Ek3tn2pwo+2UyBs35wJzEPo7v5ipynA7/wb+yhn16eGXs39M3rH9xZfBRQVPw9A/7t/fY
	 vddeCyGkz3QbKRB9IDi2hC6aDVc9b2ugi2JOSl6Ng8gqzyNb9fzRr1WZ0k6BALjbO/uEw
	 S6vxUs8N7fIaYCOwG7c1ix+WHBlCTRk9iHx/0gPhIkEeBAQ1zhFh4Nfc50DCwClm96A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=hBUQ5Efd;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791016404;
	bh=3R1BDd2bmsa187Jwf26Ri/BUU8Z+L9YQVIHrLH25Ty4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Lgu0RgwkFAIc8lEc2NCNRjtbAojfScKRmjPra+FrPqjU/V2iyIjfcg7OLpHGdobKv
	 mjWWAZMxR2Sb9YJpRBbWluu76v4GX/1BGlbRuUOOH7cT0dCe/4E94TUyL13xqP0ou5
	 rim0xJeuQGdvNA0B8mvuSxv6Gh8oB3oziZOeQtsSt3nj4C2HnCkN5UfLy1IX8RuP9m
	 afgW98sQ812RqbCR9DZHZ/HLyRJAHNYohtz+a5WhEMIt2bhq0wJ65gZ9LnprQ3DACv
	 Xl/DbSKxuXFuIfwTOwG3h9dwB9sSDssuUp1RZ09s8fu34xQWsHYf7EshRxWhzqP6WF
	 KdIi9uFUaBtww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABD5580F00;
	Sat,  3 Oct 2026 08:33:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 485692E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E11080F00
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b7zMZvv95wT9 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:33:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9CD7380E80
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791016403;
 b=porXwznzSniAcPpX4kM9XCo+qqzqKCTPQHtd1c22seUz8J26wYoLFk3GuKayyKq4DU9A
 W+mAvLdPDwkxZ1wCNj6Q0Qu78i8V/477jnKNjtTlMbHgTtz8csaTOP4seKl+vk5j4MvoZ
 ksvAQ08oDirYyeN5qx1SGcUJ+dCIT55nQuaPakq5RpOn6cKxxYW/E9a6ZWpqQjAf1TCaO
 LXG1RoZ5G4ktur/IlLL6SkY9nNNgW4KR5N+OZIWsZpyQlcd6J//TuKItpRqtYKf4wZL5o
 6yVoGqApV9TbgCa2H6KHDaBJKkOOxr8zv+H97ZGCdJVaF89Mwln1alCZbOS7YuplEIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791016403;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=zTjuxpjLttxxviWe5DoTMLCfhd+qh/LMjDUbOFf4bNg=;
 b=FXB36DZpGLHefKnWF+k7hd/RZEoiywkoQY4rMJ5JZdg4jqD7aXCGFouZ3h4/rIgMXr/O
 QWa+1VpOrBEVRg/92ofOojA3LbkGOUqmqxERdUoJ96UZPEfHE/Dig1uYSgS9YjfpuUtzF
 t3FF5PRSrKhQ7uaV0/Vd4OTbZs/dmMWgNvHwL+UongFLyFp3TBTxPVO/slzmDaqzX1Ob9
 BGTH7J6QnmXpbAfUzA3IHPCLk7v4vCIJ4YPuy79DH26wwweAKFsIiIn49C4AJ07MYtzry
 OBQgaoKq5CMRL2pn1ObOLEsjnz90RqPmANzobc0gvUHAtR2VzpUqzWHPhmcDO73fSpg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=hBUQ5Efd; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=hBUQ5Efd
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CD7380E80
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791016398;
 bh=zTjuxpjLttxxviWe5DoTMLCfhd+qh/LMjDUbOFf4bNg=;
 h=From:To:Cc:Subject:Date:From;
 b=hBUQ5EfdsofEdZWAZSecTq7aibnRjx+6ZY18DO97ix86MaV8JDygxxkq2gOB4u9zE
 +00wKymsxSGIdHX3UHYPHRm3a/JcGhSZ34DGcZKgH3FBJePfW37SFMrjryRgOnOR4E
 wlIO1mXgFL+ZN2341bRleOrgQUjD7qF5NUSOcvWkufJ9jGaFI7cSBPaJPFN3CpFMEV
 Hl/gfLOjqgcAf1xQE9mOqBlalgeFgXiq/n7gdVGN7P9lbQmFJFGcJQ0wM7qEvQRayJ
 kTYA3CmtwYfEkxCzU74laQVEJ/MEpsruwzhXEsjLY7S9Mm+mN2ax8piQ3ZRXTooSRM
 ES+FbB4Ltwknw==
X-KAS-Sym: v3:f51bdf72230551df:ovjtVWi/4YQWIzAORb+3fcoyG8FQpBhWNV7oAw9NtEbMd
 wg35e3TSUqmSXtrtB2Nug8L3nK3h+2wDnWaGdT3QdcvZmsHSa/Sh+dXK5qu9I+1sdE1HLrIwdMc
 DX2wOZdLu+yfWxEOnB/kZNFBGLZoNAX+5qRbTUeyyMsAtJ7phNaj+bNW3Ulm+eI3B6a6wBle6oH
 TFJjWZRzAdUCyOzofK8mBuHorvC6HjesIVO8n6v5aQA7kX/k0hmkIGOnebyxiUuM9BDCyIKYTov
 1SBvVPWLMepqgaxQUXcX/PBn7fV6l2PRGMIzVG+bDqusGGWwckWNt2Pcw+8HSMJY+RRu5apw==:
 aXgwU2gvg/Lw4QgzRYxCBqpqq6vmvkDwKKlx6eR7rIBDM6PBEHRsor3ehkBSpkdrc3eXF9ePfYX
 c5DUHM9GE1SDvuu3PTgVJiJ+6Rg9TpiA7LnhxryUz4KpBsiPGKB9dQ6rXXPz/2mxrFaysu2iLfA
 y2+GOJnccwfbY30skVkBUfnGstoQvXRcr49mqLwDkRjrDBOTOwW9U1GBFLzjgWx9LwCmkvrsOJP
 p+16cKoJvD1G5BKd7LGFiGyiuG3yN0SpVakyCqzONYWlMWD3urFCH6CyPUkYilTK3Xv2gx8yIND
 Xp4U0NU6nK9MIJ5uBubowZz9XkZGJvWIUSExwtDpxaDss+NWJFfXCJY3VPAUORzuDgrb1GhFKLo
 nWt6dp9yiLOnqPZH3A9rN+MC6iYVw2urNt3BHwOlyH+mgz5gohujaNskTyxeJ/3uuQL6fJM4tJW
 g+BhiZZzzCaEE3y6H+WCjiGhhZta4UtxYATzxysaLCw7XM7u3LZ7ZLgxDIjVEjA+PnaoIDLiZ7R
 AcCv7LyYz6QJp9OZ7mUIglx7T8dapzqt4k0OUAyhC9tQ0m3tqo2FD/Kfg8tYNfqa5Qm/zMrDjK6
 Xv4Q+YgNNs2UD47pzMb/js+hJ1GT8sWpvT6PoYBWM4IOSH3WBpiBfXsLLDMG5A==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B84C7A4C4DD5;
 Sat,  3 Oct 2026 10:33:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54976)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCvBG-000000006xb-2kxv;
 Sat, 03 Oct 2026 08:33:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 10:33:18 +0200
Message-ID: <20261003083318.2449496-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/python-rpds-py: bump version to
 2026.6.3
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

https://github.com/crate-py/rpds/releases/tag/v2026.6.3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-rpds-py/python-rpds-py.hash | 2 +-
 package/python-rpds-py/python-rpds-py.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
index 32593a1f7c..6da82fab0f 100644
--- a/package/python-rpds-py/python-rpds-py.hash
+++ b/package/python-rpds-py/python-rpds-py.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  9a3d3078a2fc34efd16e22b73c61f6a25ae61e26d5b3dc84d656cc0b716de4b1  python-rpds-py-0.30.0-cargo6.tar.gz
+sha256  0bcddb46502750f8e9547ab666db13115d798364b6a21a59c6474a3fa157a522  python-rpds-py-2026.6.3-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
index 12ff7e1fb9..40a0080a00 100644
--- a/package/python-rpds-py/python-rpds-py.mk
+++ b/package/python-rpds-py/python-rpds-py.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RPDS_PY_VERSION = 0.30.0
+PYTHON_RPDS_PY_VERSION = 2026.6.3
 PYTHON_RPDS_PY_SOURCE_PYPI = rpds_py-$(PYTHON_RPDS_PY_VERSION).tar.gz
-PYTHON_RPDS_PY_SITE_PYPI = https://files.pythonhosted.org/packages/20/af/3f2f423103f1113b36230496629986e0ef7e199d2aa8392452b484b38ced
+PYTHON_RPDS_PY_SITE_PYPI = https://files.pythonhosted.org/packages/aa/2a/9618a122aeb2a169a28b03889a2995fe297588964333d4a7d67bdf46e147
 PYTHON_RPDS_PY_SITE = $(PYTHON_RPDS_PY_SITE_PYPI)/$(PYTHON_RPDS_PY_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_RPDS_PY_SETUP_TYPE = maturin
 PYTHON_RPDS_PY_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
