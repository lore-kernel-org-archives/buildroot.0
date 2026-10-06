Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B35CA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC5FE80DB5;
	Tue,  6 Oct 2026 16:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L6qTF4DWNNKT; Tue,  6 Oct 2026 16:30:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CC0F880DC5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304231;
	b=soCPhgFlwPYzggHHttIhrWey/yNnmm+L/Fx/DFOLRozxyOVOVB7krykj80MfAANr0rwG
	 QWZdz8lSz0/PPnrQzmjzek6pOjEw2oZt5ykmZb8ATt/SvRQgr2kuEtEcqz3HrDo5oew34
	 drSL1KULwA5HzNJ5jiMv2jR47eoxFVKRD/opWIl3cTUrld/XTF+RBqn1/zW4FvRp8Aq0i
	 urUO23wX/ABxatSJh/YRcF5ZzkGez2Md5eZaYWeZUsg0uTu/PLuwi0KDt0zRKiYLKF8Fw
	 w2mQmgQisfewt39RHGdxhoagPp/51yCkAyU0Kkn7jvggl2BJ98U5u7wjOt5Bxiw5vZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304231;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7l9UWnOXbpTcFpcT9oyVkUi3CQJswHf0VBpWF1k2Jno=;
	b=gBwq72Bij2RwZRmPly1QsjIXDQOEN6BxGCJkvqeXrEJucvT1Dmxly/SuTwB1AmNWWluC
	 gV5brP3I5SC/EfTv+nqMkFOy+4yokpgMaeRowPx/l6uRmduRQW2an/yej7t/AJ3HypFH0
	 k29j5FnPdTcSebJTrG0lrm2ivVFQfZWzPpUpNo59nWxJPBIuIutqFCNaBnUvIsZrU6yge
	 99VX2n7zqYPmnpf5mXSeZvMwICd+YMSVM1mfVfEOOyi3ZqIZitxKv6uT/5dQZedB05wy1
	 lVicL/osWVlKA20atsSHgyjKQDxOELzVWKiXVGDITIxBs/VpNcprRlOvoK7yP8PjiaA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=U2a6EyMP;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304231;
	bh=7l9UWnOXbpTcFpcT9oyVkUi3CQJswHf0VBpWF1k2Jno=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bgCWBEBsGCzPlG1g+8LNuuVZpA8LiuMsZ/CQKdnfClAWt5Jnx051DuZVhy4XtGiT9
	 jkEW3N6x+D3JvNbd0HRL6AXf8ccEyBk9iaWoRN3MyiowWp2UQSqTB0CgzpV6Ko8DfI
	 bD4PsHncIg6OjpVfCITkIEa+9R5zbnBUJRi9DZCZK/b9I2peH/XSxzcCWJNKoD7z/n
	 r+jQxbuYVwyp47TsEd9tUBbzYSLEjYQCX4y54CIEwxNSzcJNHVIopL8+owx/MhyxDN
	 PHF5XYlrbs/HYP3zaUmyhHEZLWdWsbbmoyFPx6AU7uGGAj6opBRL54guASSgmbf+XG
	 JyIlhR1Ng9/yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC0F880DC5;
	Tue,  6 Oct 2026 16:30:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 072F3356
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1F7280D8C
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0rrx8QxI1zfy for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:26:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 998A8809B1
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791303959;
 b=PCL2yXLyLIpCQm0h7ufz4/ZEZnC+IF4InEyI9JL2iqITGYKBvuBOcoU9hAXaSBUjH2+W
 LAl1p7KdpAbkPJZeNXeP6/Q89e530k1spESpDgjjNtJ0m4hdwaaqYmnZ1uqFW7ySRQ0md
 1MZE4KMce6XwhKnUKASWUpeKz5IK8AuDRebF4AvRkRujg4oH0UXmO1R2HlRlXQxvAMuKw
 ngsitgbxXmcn6V/glinioh2v11mNEjyCnKnKqjdw7Ijhy+J9Wccpi1/jeJGUjC1nIz6NZ
 IU2yPxz3TmV5jJQk8jQSEdUKeRfnzVk0jlWs+oH23c66IRHymZMJMV9l+D/zClCA6lQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791303959;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=UOpsnj157ropW5BGZmwwcIJqJjF3MMwYl97kPgnjNrc=;
 b=Ho6+UQPxaFrHz1y2N49KxWpkln8bcElRxBUKvtBzIemoqFI8jdiXz9T9Z9b1AkGZarYP
 hMUrz0SMVsDRy6P5HPtqDY11AlgsDzxPXR1GM0PeA65zq4xIbk6hIMjZupn5T0Rbh8UoH
 4PasA5ljGUQcHL2/cKzuPpGfhsMfsM1dIM0ckmKt2yZ4HBYvwwwTKHZnncLtWLVY1/Wfi
 M68HMIVbV17Bs59VO6WyjJJna2/aH3B8S1nNFSy27/BMNEIhNogTAM9kFHW4WN2ziBD2G
 RnGWoU6s9ECN7GJlJTwtWe2CGI2qU3JvYOLXrHfpAyiQTefd8yFpS8orN+EFVrAknxg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=U2a6EyMP; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=U2a6EyMP
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 998A8809B1
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303705;
 bh=UOpsnj157ropW5BGZmwwcIJqJjF3MMwYl97kPgnjNrc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=U2a6EyMPXt/lPUoEmm61sX5UgSyQqzc+2LQkkyLvmoOu7HzgSGrAhiuPEE/ATlBuB
 9iOArJlu24gVYbHLic9zHu/dkkq8+Vg0BTMJ/caKcNgvUcEW4vJa9GZUNLQq0NO8jv
 kv8HO9Uzag/ZZuLs8m2mX53i4lPyY5wdB0Sz1A2VkRs3q1+ix/XVUpL+cnafsoSOmw
 Vt91qbVFefJvUBSSztTD05Co8NHKjGvl5T3LX9RpllKylrkdgO71REU/cltpnmd3Ww
 IT5ByTZwlomvKdvZJOHfTc4p88QoS+oTF2cY1J0kGvDxPlhqoZoL4OVttY6JR3eU/C
 Wa23OdSKPe/ng==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 sI9YJgSMz1gTaH7hE1dw49mlyWhOnsUpDac+emUjtnG2vQN+aGxlKHvbLx0pETHbdzbea0Ntv9Y
 o7BT+T0G8wGh2z+POwHsLA4xmYBZ1eaVbTQCNFXHqgjgcLEDoyXN82rG/+fOYe69tHzcKC5UJyH
 JHSWHYuSxx4G/oGa+PEr/wYL8xggZAPEietQjWT21LhSY90ZJHseJRxtYmlQ1k+fDTxbw5W+EiS
 sCNKGVnNirjQL8fNvEtLnCbwxMEW9A/ZFgERqZG908toJp7dNNvE+XKU/10IXlhs+QIHJz7w+3i
 7tu9evxoHzlAwEJLlWBapFwZ1pPrlXbw9KPzXMBDey8tu2UQq6mUoyJ7z+hiMCPc1dLQkmdaqhh
 e/Rrb9WkgKf+HpZ6kac8rczwzQBR89RFIL9CXs3jRse5fbOcRy7Jvsq4COPQocKICP9hsIPtAxD
 S871oChesZjVkwo6MxCqMYdNaUvA2GujCO4snHHA9BFpfR308gwSEYLTKMHF/1lSJ2SEQUD1H/H
 3Y02RV5BYlKkcdfoXnZLXG45FmIH9gFmcNAfYc2cgGvH3RQPlcTumQVa8p5SZfxFau2Ct92zfvj
 Yy4xCUU=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0F3CBA4C526C
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:45 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7us-000000000ir-0quT
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:53 +0200
Message-ID: <20261006162106.3439373-73-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v8 72/84] package/kodi-imagedecoder-*: mass
 version bump to Piers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash | 2 +-
 package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk   | 2 +-
 package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash   | 2 +-
 package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
index f8bd74d0b2..9c821cd331 100644
--- a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
+++ b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4502522c6e71439114a57cf51f444e38b32c7f786636ca6c361c94aaf5ffe066  kodi-imagedecoder-heif-21.0.3-Omega.tar.gz
+sha256  186539681e6067fa24ed3c0f526301224de30edbbda24e347af3d79569603cdd  kodi-imagedecoder-heif-22.1.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk
index 5114dad72b..66bbdb832b 100644
--- a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk
+++ b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_IMAGEDECODER_HEIF_VERSION = 21.0.3-Omega
+KODI_IMAGEDECODER_HEIF_VERSION = 22.1.3-Piers
 KODI_IMAGEDECODER_HEIF_SITE = $(call github,xbmc,imagedecoder.heif,$(KODI_IMAGEDECODER_HEIF_VERSION))
 KODI_IMAGEDECODER_HEIF_LICENSE = GPL-2.0+
 KODI_IMAGEDECODER_HEIF_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
index 98adf46a9b..0b724e9383 100644
--- a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
+++ b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  421812f6ca8d70e6736c920935461b43f1338ee04a919dcf7e5f7ce1879b54e2  kodi-imagedecoder-raw-21.0.2-Omega.tar.gz
+sha256  ee4692563acff8fce4d77ffd629778d9df3cb516825b7a74ffc80f25d902f419  kodi-imagedecoder-raw-22.1.1-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk
index 989742a901..ce5514cfcd 100644
--- a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk
+++ b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_IMAGEDECODER_RAW_VERSION = 21.0.2-Omega
+KODI_IMAGEDECODER_RAW_VERSION = 22.1.1-Piers
 KODI_IMAGEDECODER_RAW_SITE = $(call github,xbmc,imagedecoder.raw,$(KODI_IMAGEDECODER_RAW_VERSION))
 KODI_IMAGEDECODER_RAW_LICENSE = GPL-2.0+
 KODI_IMAGEDECODER_RAW_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
