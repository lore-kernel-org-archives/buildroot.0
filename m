Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CE2CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D47264094D;
	Sat, 10 Oct 2026 12:10:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sXva70SQIE9H; Sat, 10 Oct 2026 12:10:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DDEF240945
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791634258;
	b=WUlEBoQzfaAzzpidHT+VkQezpS+YHKVuo+2PyhqxuB31DMmirBHy/39Os/+4haqinRAU
	 rx998rDCIlKS1Pzbq8MHDzUvBJG2YDumTa2Z8YHF0XLpIzNVLdqYpBN574xDZ9Ej/lbtm
	 7Hu++gBN4pRq8POVoacKdun7jy0asI4jngo4GzW1P345kHVBTe7grh90jsV6J9jB2CuQI
	 p6vRZ53lleubACOZ29EnFSv5KZpS1gfHgxFHMXHOdFMAHpHYKt+a+fsCmeir4RpG8CBZy
	 iUfvrRZjtaDOjKcbUL6StOvniBesrlW7Qwe5OsVEN76s3LWRlAPDQNpINq63gGytpGA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791634258;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ywUsdK5+Sav59awItM4Ua69oCJuX/E+TrLYyod3qYMI=;
	b=rwCpUOdHAQCJrI+5Ext8QjdPwP4sNprnaAYiNwn9zTwgQBOdXgqzUaRCzbakOBu8NWVc
	 qoTKXzsKHXjfCBaFAQV200NJSdkFSIlwnO1+C+vIyjuBLWImJIg/zL4nsPe+SI7R9e+5O
	 GQlJ74a35FS/JpKy99EBQfxLTYRpA42yd4M1sZz0tDDBEVObl57Kc+NTDdnwsGrVAvpwi
	 /55tsshRzUMCDeo3O3RtG1zLFa/zLNinYh2O6E0HdrvHo75AwF2BrMthBCcY9jk0SFb2G
	 3vg4xNx3wjYvU6w0Co7GeowPFHQU8+bGfDzsecXnZ5DGRpWycU3ZcNOuV/bWjA5q/Kw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791634258;
	bh=ywUsdK5+Sav59awItM4Ua69oCJuX/E+TrLYyod3qYMI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CvTxPsyKtw7xFzip4U5h5ovGH4KaJGTQOjoPbpRH6PIWXXGxuLdbNpwvJZYcluoUo
	 rwuncAGuFPM37CXAdA8ZRq6iTa693eo2IF94Vj2A7C9JyK97Jc+9r0jOdsaSpun5xd
	 hqO09oCj3ARe4xROuQPRQziTD2EEnvid+WqJyKcjD0ANc72Y/TnqRu+zLQaT/v09jM
	 tNrSFZ18DK3n6ecp0PZnyUkYCcUF7wU8z+0vqhxyDEgc3HpcNgsyVSf0m9szFTwiBw
	 2LKG+3mQ+ZwO3/sNz6BEFL4IhB86vtt6b0ply8PWNBKJ/fx+h5JtvZaoM0iY5E6OWF
	 zoExndkrGeSVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDEF240945;
	Sat, 10 Oct 2026 12:10:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE78D317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3D3440176
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gKXjvNBXVUw9 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:10:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D16BB40061
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791634253;
 b=UZq40jqUMY8wtnOs0JVDanxmU/hn/0qc4ijiZYTfAdryWysy1Mba86ITMHVYAEyiaQfi
 cyblVqNO13HLUn/5HKSmE1u1N05qExAogY8EN5pFWXE3nwm/waVnudZnsKR2Vyq4tnpC7
 IqaqZc86ZA6GwDO/PHViFn1n70cF3mRQfzovjTBBw1eOJoPzJCjeIqnLOfGXM90gQKDi/
 TI48qNGNHahnaX3Q7Y16HsHuM0F14sAVQYtoIjfZEZmzONtqAhWh58KGToR6YTfpt8Ep4
 55osvGj2AOuAi+a2dHOZAYqRuJfbIPC0hdztwD06jlgrc73aEDNnOUhXJNprsA/fDzw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791634253;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=h1lJAk7m5JFRHsxhZ6kV7RO59dLnLeYTNltlHgZpx4k=;
 b=kEMGbuS8wVkvm/4Ph/jo8tlyYiROX56/828p+nT1jWxGlYa5yBtj/Nh4zqF/h1sk7sOJ
 ot+uFHRV1POW1Gw7qeMyjqdlDNtxUuO5r+F/wiGwAtN+hJyzko8uSkO3mjXVbmbRl5DD8
 bMtzjMif2THj9qSDrj6N9VZivfJt15wUxyQ6ct0yoAUR7DEou4MU70+YjzG8sF6affAIX
 F90SwK+IMlyWdD/Jhrbt1bcX28cW/vBDutsNTjm1Esr/wvqvruMXZ4kiFarDbPbgYj5r2
 /C5PYdafq7K9cCHrRaUMW2Pl9MKjSaJGe2y3w3S31wOZhyXG593uAlZZkceSytDOIbQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D16BB40061
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E6EB91A3E; Sat, 10 Oct 2026 12:09:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 14:08:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 920c2b8326d22425015c84c917b8ab513b90a9d8
X-Git-Newrev: 061af7e44741d13c54b4022c4261e90737a37f04
X-Patchwork-Hint: ignore
Message-Id: <20261010120935.9E6EB91A3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-scapy: bump to version 2.8.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/061af7e44741d13c54b4022c4261e90737a37f04
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license hash for CRLF line endings in the PyPI source archive:
https://files.pythonhosted.org/packages/80/06/f7e09b3240196326fb343d6bd931cafedd26ae1dfdbd7cd0183cae3029d3/scapy-2.8.0.tar.gz

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-scapy/python-scapy.hash | 6 +++---
 package/python-scapy/python-scapy.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-scapy/python-scapy.hash b/package/python-scapy/python-scapy.hash
index b4b7dd2850..0d00188672 100644
--- a/package/python-scapy/python-scapy.hash
+++ b/package/python-scapy/python-scapy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/scapy/json
-md5  dc3b089110a1fc1ef1d3679c0076ea24  scapy-2.7.0.tar.gz
-sha256  bfc1ef1b93280aea1ddee53be7f74232aa28ac3d891244d41ee85200d24aa446  scapy-2.7.0.tar.gz
+md5  507c96897f13d1861a430304ac4cde3f  scapy-2.8.0.tar.gz
+sha256  0eacd1f940d115611c1b8a4696f315b4b80caf2951e546893a3d0cd7f6bfd6fd  scapy-2.8.0.tar.gz
 # Locally computed sha256 checksums
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
+sha256  189b1af95d661151e054cea10c91b3d754e4de4d3fecfb074c1fb29476f7167b  LICENSE
diff --git a/package/python-scapy/python-scapy.mk b/package/python-scapy/python-scapy.mk
index 9df4614b9c..4c477ca829 100644
--- a/package/python-scapy/python-scapy.mk
+++ b/package/python-scapy/python-scapy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCAPY_VERSION = 2.7.0
+PYTHON_SCAPY_VERSION = 2.8.0
 PYTHON_SCAPY_SOURCE = scapy-$(PYTHON_SCAPY_VERSION).tar.gz
-PYTHON_SCAPY_SITE = https://files.pythonhosted.org/packages/82/97/7caec64f05eae3d305d83e7cce1ef2f337710513b89efb334f7278202e79
+PYTHON_SCAPY_SITE = https://files.pythonhosted.org/packages/80/06/f7e09b3240196326fb343d6bd931cafedd26ae1dfdbd7cd0183cae3029d3
 PYTHON_SCAPY_SETUP_TYPE = setuptools
 PYTHON_SCAPY_LICENSE = GPL-2.0
 PYTHON_SCAPY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
