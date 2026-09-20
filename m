Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8B1C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3039940E49;
	Sun, 20 Sep 2026 17:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id foUhRfKzXjGa; Sun, 20 Sep 2026 17:12:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 339B4405AE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924355;
	b=WzwJjEskcSQlDlmDEH3igks9B4yfQVYzqrjZ6Iw5jP99nKXkpmBNQHWplgg1QsQkhiU0
	 WNvmaVQtIM5h+HTM46+chXiRMwC8alTTmCm5PspXW/VpWyXXmqcaZ+UL0OJZkd2GiyBBd
	 j4WCL8NFfXWywV3Z+TiyygJX2nEUV1EuHFth0ANZu+RCeb+bn01Z3qaMdIkv2l4YJUq+x
	 WzRrQGUddODXkxBEgijs40bvcTYsBT+icMtn2xx+sGJu1sawcN0zKZEfkCp08SCRTiJ6N
	 CXE7Ag/jIIgk8u+jIbcMVBuOu6/ox+3CQsUXK5Ktu/5lIkTyMp90mnYhdFmMKCGWa7Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924355;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UMJcrvTcN86svfYJNMil5uYZm+iawxHmXT9VvGfdMy8=;
	b=VSuNxKi6to3QQ8sWN6BsSfO7zCna5yORFWpiT08+Ck3CFKkmKoloQtvOL6M47H+c2qkY
	 qSuAKVQtpB33wmyHgq/ql13MjBe6d5fwLpk0vkDCW+IIrmM4PnjGmocCbHHkJX3fX40/d
	 HyzfIkWkwT3+OEyq7BPAZN17bQzo11EbqA0quWunGiHnKaShV7q9qG+GgHCAK7fAFHK67
	 QyasGz8h0CIfwMvGBvPld3Glqk1kOOfHoO/Fb8NSwFycTzaYhVYJaQ/cW31QUjitnCxXb
	 gQq0o0teLsd/5hm7aAiOH7FVaUD6x6UdFiMyFknYb1HhjlzHICwOeVcamsFrbRazAOA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=rbV90RQh;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924355;
	bh=UMJcrvTcN86svfYJNMil5uYZm+iawxHmXT9VvGfdMy8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IE6sEW9Ve3nEqYVks4LQFqT5yt/v9+5s4+sJngR+/UapWzeY/uQbONG56HihS4xpf
	 Sg5iQIdJD83q8zlD0EERdjHUUzI1MFtmQ6nHXxpOJPzOaMjrX35xsrcEE5CiOgtTnR
	 4OH2+Hqoyz224FtvR33ZLhmjzBhTEuL8VG/an6h7054LRmbOvyPDuP4F5YcBcoJ1Z5
	 W52GO5n8FnQQ9yzpKma4PA7tQkdUZgXbDHBMYGtgai6W1BmaOlgt16pj/nRC6zFm0i
	 b2qroBKn5MO5PN0YP7MS6v6xCoM6Pl5TG/+VBgciDpsaNRmiRT7YqYq1Fu0tE+wyd0
	 o67qfY+U4OcnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 339B4405AE;
	Sun, 20 Sep 2026 17:12:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A754837A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A53304081E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F5cFCtN_gURS for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:12:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 98E4F40655
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924352;
 b=hNKgzm3VTF/gXZnB4zGE4BmXt59sB2A++b//zr73rrH2fqH7P7fXuqJtUAShodpuJZhf
 8bV0inM7n/ME+iVt88GAK1lwDMzAJiiiU63VMxpkknYsQ9UpmVV9xNxIGQJ9Sr+hhG8Tv
 d9Kd8hxDccfRdGzC5+5w6huC/+xvbshXOB75MYGXcUYXkPMMSVWyxlcNMRmyerPvvTW6p
 3Wyux2atmk9DT6mweWT7Yhkj8Sn1nT/yeQhiKPHvn77kmTDCuqb919xfqsh640Jej9hiI
 MA9td20WI18wqcjTIBoPeo+p6fAjxJ7DMj4P646+0CLBFeArAXn4PlSC55jBx7ZStQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924352;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=vZn9hPsBCHRuBBBMJ7wuGI0B+mLeqK649HYKD6Df6AQ=;
 b=RvOcONacuh51bg8gu6HtXjErvip1XpqclWRMFBDuF9ba9NtbmB6whWSDaAn8p/I5zPk2
 qDyukcuOizqtU9G6yntpwFq5rTl8JbSC9gJKFDDnNpnClk/qozO/rEMFPgeFk8G+rvHky
 nX9keQAG2DJaRrWym8hCXDGdeGBFT6MZtKzgnZ1kClR+ifjhqR33u+DiSGYBmlTrmMMFT
 iFOpuE5q6RT9vw0OiZeBhMd/pltJpi6ve639rhvzA7zjkSWOUKT3y/PdChB3rf1p6ZSsN
 8EybD85DCsH5RQJiispeuruVGE8yBgepuG9tXoZ7tdr3Sft55bu0G9SMaij7VkDOn7A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rbV90RQh; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=rbV90RQh
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98E4F40655
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924339;
 bh=vZn9hPsBCHRuBBBMJ7wuGI0B+mLeqK649HYKD6Df6AQ=;
 h=From:To:Cc:Subject:Date:From;
 b=rbV90RQhqXGU78BVKC2ZWqj3P2+vG8bTVxJMwsnuxNq+1rkJVBsJSGE6lp2fwRYhQ
 jS4p5lP0CqutQOvyz0HmUs08YgXqKZZieyP4htT8u9gxURRd02ZrcnOX4TleFF2WKV
 5ai0B0vPS3MSiqB/4XIVdN7iukyZFHYz3+Xsc4uI6V5efqalhgmzWnUZ2wAB3Bj7ZL
 ECgyIaGqxJB3+5VHdJR9FNpG0pLQED/jv/u4Z6T4oOVyj89b9HmKv/ZI8mWCvp07v0
 XOrw8Y/uSRn8Dv35rqWA4FHsh8uosWw78gRdC7KqvHLL/V/Tlc/vixJetvOKoP/oM0
 SAPVkNwHGTzgQ==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:HVDCLV3xlpNVSgRpYjlVBlc67d2sYT8HrKb5kLsyex/n7SeEPqpT49tUzTPAKZV22q13BX/mZQWE5NHZiIMuEPRXjc2JOJWYx37y69zAMFZjCUg4A2+oQYXiV62ZXMK4E1FcTiBBDM6/r5x91CxJ5q6eVOuhAYqczx7YYO9Z0W1QViDBOo20omgKx5Auf2Tvssn6I2GGRZAvYik0pwHteHLYucAkajgCMMgVpNtDksJHpLjSDpvl8obsHAm4wln63UG7XEeD7UN/MyJy6MaFTSAQOk7UnVGR+0nBSop2T9XhuEhsTCn1LK/wQXG3/HjnhFod4SHf+daa5KaD0Xa+Wv4LxfJ0JbaGcj0gTGOMiPeaT9dAPHQhQuGfLvLFDrzhhyEbDZnx5SvzCRB0d/tytXRxdiDQ/Lh2l25ctx/6ZVagqhnBmmIv1SiGrX0Bi6FDApGUjVNqdcf/HhyNkZ5sQyvytXjB74XLU6IqpRvHD2l2YPLS5EzViSm+SfJ70AZAHDkeIiOd2fpNuFBYB5zDDbugBT302VgGglCU9/rp6jsUIY6FaH4V6RyWVsCplfwI+Fonx57OgPNOPlqFOQM/qXGlpAx8DT80TvCqxATKGDCz4h
 Ie6nHGu2PXUEJtI2WgQZcaXWpg4huYEbIGzmjJMpwWHihjDFXnsimKn1x5cdA=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 20C06A4C45CD;
 Sun, 20 Sep 2026 19:12:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39008)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L5O-000000001Z6-3a69;
 Sun, 20 Sep 2026 17:12:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>
Date: Sun, 20 Sep 2026 19:12:18 +0200
Message-ID: <20260920171218.242013-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/llvm-project: bump version to 23.1.1
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

https://discourse.llvm.org/t/llvm-23-1-1-released/91760
https://discourse.llvm.org/t/llvm-23-1-0-released/91654

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/llvm-project/llvm-project.hash | 4 ++--
 package/llvm-project/llvm-project.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
index 35aa544014..c7e1a8bff4 100644
--- a/package/llvm-project/llvm-project.hash
+++ b/package/llvm-project/llvm-project.hash
@@ -1,4 +1,4 @@
-# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-23.1.0
-sha256  ab1f0e3ec52448c33e8782eaf0422504b87c7b016b22514653ee0d8fcee479ff  llvm-project-23.1.0.src.tar.xz
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-23.1.1
+sha256  ebe9be46fe8756d58c5b198ffad0fa2a766257add81a4dc52179bfacc7888ee6  llvm-project-23.1.1.src.tar.xz
 # locally calculated
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 31b2a4dae7..850bd78720 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 23
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.0
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.1
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
