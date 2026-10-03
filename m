Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3ACCA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F32080D4B;
	Sat,  3 Oct 2026 13:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id soC2dm5pwlF8; Sat,  3 Oct 2026 13:57:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 65FBE809B3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035835;
	b=FS0pSWkSYuqu+QLiWDNb5AurO6OtLrgNgQxTB+tzGvV0woA9AVMH4Gx57vdONzrRGrWt
	 GzzdqGxmndL8y7SjCgBdIEkKFZSnHc+2A6rWdYxRUC2RN8s21aaDOIOSXbzqFuDxBQb47
	 FqXRpOGaM23848Q2OLR3Ee7exMk26tX3L064NReRTx1WgT91vwVHbrbNxpUtN04IRU4qK
	 BvwirymQFSE6ipZyAExWpl9Yj3nEaYd0F+jCgcyOQtvBr3EwLozjkAb6EvwNBOjBm5h7s
	 P6otOzicoxsWjHDKRQNCmXXvqa/q4iSPPerdfwD7OIAFzw70aNthxUJ5h0KF8rgZ2fg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035835;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/WLubi1JiLE1WVgjj8zay1gmR8AXxqPXUrf1xaufya0=;
	b=k0LDmZmg39Det2ew+Xn/510n322BSt/gCxwXH6ZTFa3rGM1ZzT4qIxFQbT2ZWUN446UI
	 OBh3IzsR3ZsuAsxMhZA42N79yaqie7Y8KaVNAppzlM8s2RDZThmJy5iGdc2XPoJdOnaS+
	 RBHAmidShsO6KvVmV0VIoYUfHW3Qln8DGVXdwG7jxa057PRst555Ix1YEx8jfy5HhmjPS
	 yaS5zX+MnCXCJtKMySOprN3J6Tx/8na2sjVS7z70GC+kIDcsHlmgvSe4MFbH7AwEvMmea
	 j2bzATeu3kUlpj694CXF+NqXnJLZzS7t008BuPz3O4A60aIr/YdqmB6sodkm+Flr9Qg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035835;
	bh=/WLubi1JiLE1WVgjj8zay1gmR8AXxqPXUrf1xaufya0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O70Ox+HfzDZqMs+mqp0lsmap43PMncGxX9BgHXzIz14Q/q24t22nlqZNM6yahjpPZ
	 jlbUnrsazejFPlz+8uLupRjv+BIPMEFc+vuFtwIq8ePwpBjbIvubV8cCa6iGvlYhXW
	 e+aZBV9O9lxaqbNOTfy+Bh15aBJW5oiULJcmax8S+TZwZkZSWm1QRlYQzMSfcnYIvk
	 Jg2gIvGe1RuCkXee8rmokDfd9LfdkAb5FjuL1VEh6QcWTJKKHJfr61d0uTTltpOZYI
	 2koEb9k8DP6sSdZLELmns9+gPbKhWS0GgC1qxvkviuKU4Q8sHB8cQa5tQK3lBf6zmZ
	 dpWM0UjBhMQZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65FBE809B3;
	Sat,  3 Oct 2026 13:57:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9850A9DF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89CB1414F9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HU4OVeyH1oKh for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 65FCC414E2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035815;
 b=U3At75tVT0+Q3EtOBuFJ/SHyprmkn97Do/kvf0H3ZMYlL925E94DVUBOqnqvBnxSYvjY
 WtV7QGQ+Q/8eCfzYT+FrRrR5mTPf9IaEC3+4GWe/fZYip//TwbrPYjGSjB1QhCEpCg4yh
 9wQ50ytrPe8xSoQv6Ln0XYdxbGB1bv+CG8y+FdsUz7uiujyPVXxsfdXRx0i0xi/OVwjKv
 0eqNuuOK4+rDVuKzDverH+dZp8ypX9WkfxzGNi1AepkFzzCYknzJggPPfrGUbGksTTku+
 hXmBpfnquW/kTUsbFJ0p0Gtf3zzXbWZ3d7RH/KjUMG/wY/EoDzAhgryNVCCneigzmVA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035815;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=vplefe1svKgoPLyf5rvifLXEAWG/zcooqAUUai6aScw=;
 b=bzwOL59auycA8GSOKZNph/nH4nb+JjC+yEQ0BE3wlKLLOQUKpUiz2UxR2Ay4WGE6HOf1
 wCoO9b0qOIgckRiOXIww88zrQEV4q1+fDn6D80JKT0sy5KaMLEhu8aA0h5MTStlsIR91D
 6OqMzSOwgxQen+x0Qxc+OKrr4Z/ZlEUeUka7iSJsxC1SqXWSOgTc+y/YFh/lagy3XV4PG
 flscRnDUfbfn6br8uw4f3rF+9yUVot2nM2sUhgpNjxVUBfVi6pXRLJiY6nOH339JigTbR
 yE5HYrmBIvAS8ClicJLWwtblXZgKcxVW1G8xqAKrwSSZDVuZbjcoZX7KpepEBcJMkFg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65FCC414E2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0E0A8A31D; Sat,  3 Oct 2026 13:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d64414c712dc6f871441fcfbdc51eb2662918fc0
X-Git-Newrev: d57d31302d1bc20ec88aef0cead79eec3e8bff07
X-Patchwork-Hint: ignore
Message-Id: <20261003135540.B0E0A8A31D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-packaging: bump to version
 26.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d57d31302d1bc20ec88aef0cead79eec3e8bff07
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-packaging/python-packaging.hash | 4 ++--
 package/python-packaging/python-packaging.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-packaging/python-packaging.hash b/package/python-packaging/python-packaging.hash
index a5183b1422..9c5280617d 100644
--- a/package/python-packaging/python-packaging.hash
+++ b/package/python-packaging/python-packaging.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/packaging/json
-md5  edae3d061c39a2ff713a97e133dbc50c  packaging-26.2.tar.gz
-sha256  ff452ff5a3e828ce110190feff1178bb1f2ea2281fa2075aadb987c2fb221661  packaging-26.2.tar.gz
+md5  c6809ec56986682ceffe573b8778a1ce  packaging-26.3.tar.gz
+sha256  94edc256424af38762eb31306eed28beb9f0efc50a8837492c9d6fd6004aed79  packaging-26.3.tar.gz
 # Locally computed sha256 checksums
 sha256  cad1ef5bd340d73e074ba614d26f7deaca5c7940c3d8c34852e65c4909686c48  LICENSE
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.APACHE
diff --git a/package/python-packaging/python-packaging.mk b/package/python-packaging/python-packaging.mk
index 41f8fef6a2..0f63da0411 100644
--- a/package/python-packaging/python-packaging.mk
+++ b/package/python-packaging/python-packaging.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PACKAGING_VERSION = 26.2
+PYTHON_PACKAGING_VERSION = 26.3
 PYTHON_PACKAGING_SOURCE = packaging-$(PYTHON_PACKAGING_VERSION).tar.gz
-PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/d7/f1/e7a6dd94a8d4a5626c03e4e99c87f241ba9e350cd9e6d75123f992427270
+PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/7d/fa/3944b40b07da9ce895c0e6303a5ab7d53da063554f534556b134a54d6093
 PYTHON_PACKAGING_SETUP_TYPE = flit
 PYTHON_PACKAGING_LICENSE = Apache-2.0 or BSD-2-Clause
 PYTHON_PACKAGING_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
