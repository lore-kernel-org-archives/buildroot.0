Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34513CC6B0F
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 09:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA568606CF;
	Tue, 13 Oct 2026 09:43:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rLtRsZviyiHI; Tue, 13 Oct 2026 09:43:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F06406075D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791884601;
	b=eBmU28Zu9wayuiNa8vOwrBHu75qzxS7hVO4ZdGWq6uUMH1TicBhLaY9UZjruYpTgtl/j
	 io+imNmprZ6fwpkSkbHpHzKu+ZpkpToSzyB3Kw0kGWkl9IPvpypH6nJYgyeHiQ+vmnR6U
	 v/ApDBsdUmjNzPEgV6Ohl07TrW/Ye58jB2GGWbZzpnR2fvzHzVAC0pan54rBE1/F5yHvR
	 RxQswwzBPndYmIYcW9Uj2Vgwr8aHQOex2UFHlVGEb/uNu+W90vElSzg7SJrZOw/tyZ3mY
	 lOkGU7auKxazeT3qv8NgOaxnOHbb0rWOqq+FvCnEqEWmGqITGR3ZODH586BAuA4R9SQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791884601;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ozIls+H5GqQ25NBvKP2FecTMiO52VEbh24WiClpkXlo=;
	b=D7YHrSSRIssjSs3ZxHWK+aUnGJp/urhlHZbgUX5OgZKUYn7hjEqtPJcEKkD6R4vka+m3
	 FvFwaPsdOBCq5vnSzpYDCQvMXN/SiKwnF/193gGyMjraOKwXicrhzSwo2h6Xo4yn0MmgI
	 Of/XTbhK3aIPghWLAFequDoptJ+6l3/MuAQjkCa+4W7DrMbtTKdz5RKXbNbEqGjbHIe0i
	 IlSlLc/RlktHskGN17OKojrQLiMiIgGVRDnpPb78q6aDBYDrv58U8a2XdOACl0e/XFFha
	 DbbzvW5itGxyHwlbAwzYAQz/DhGy9htSlelLswtTVmELoPfceO7Mj153ISTyzTcnccw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791884601;
	bh=ozIls+H5GqQ25NBvKP2FecTMiO52VEbh24WiClpkXlo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JeU52DcLKfhZjS/RnFBBuaGZHjHFbLexCB5QMHfx5NQqh/c5HMIvmumSpWLjN2Mla
	 HNRMsXTegYwOFjPnFxpplRzL7CBBK5zHznZANjBv1vgnemPZnfHDeGVT0w9AfkOiFz
	 ouEmf76tFnVuavHCUETJNd3zW++Z/cYltOkVGURi/LBy6BeRjtMm7hL9jueyVTrL24
	 V335I2ox2bbWdr6LdQHvZ+Jjwjc3A3V04xdk9Y1oWxYF19QuuqmaR/iNakffhLhysf
	 S4Xb+I5BdONBExV3EBz4oJXST1hl7QcltEy/0DNIu64O2sOOM8/xJadjVSHqdKLu/g
	 /Imng7A+2eSRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F06406075D;
	Tue, 13 Oct 2026 09:43:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AB4FB362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A761980BB8
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 55p0xFYa89w3 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 09:43:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 877CD80C8F
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791884585;
 b=HRk14pUM7BH1V25hpyIzf5jLZYzWxv6VN9TCaj96nipMaknib2PUh8/etzU9j0kwcg4b
 FQHeSYe3h6llbeSJ9euKs+jkrKJzEeBEYpzm5Twl5vztRMg5bYgxs0EGg8hIG8IZgBHWv
 sXlSVDjjd1k8SojwcihV1gWKSdrKq/WXYakhnZyG+0OVwd+kz6IoHSszn8/uDh/biAWCg
 ZPdPktr8+pE+c7bpHjxFnfGLQXBNyOfRamUVjjQ7ESwvaCEb2/4yKVRJtaXwzrkbrIWIl
 4WLKdIHkWIurfBNKN9dgijQ4E+xVXyq2ojknXsRGGA8JGK716Cdr+aSAV1t6dM1/MQA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791884585;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=oNKB/Rg3jTKc9P7FePOx80G6jdFBC375GGoeapJnkeY=;
 b=R1tjW6q0tNkxs3tRnRpzqVvkZDgIk3QPGrA35sWecSIzQNlZsAX6DHo1in89zJA79KL0
 PdMGwEAB5LgKPXmPQSYLqkaiGiw1bQFq2uAcP1SGEJEJFadf0TIbqJikDAhTqvq3hXQyH
 /Odidbbeb454VfgFYCtp/Y4kvcubVh0NvEFxibu5RqPkKVaeQfR0BLGfZfoo08p+FJWAM
 SNnj//m9W1K5ftE0b/imLK6SQ+jyrRpyL6FSNNpLPuQdYw0x7WnQiKtOOdxVI4bfP55BW
 8uq7L2Qduyo/D+t0OLAYIbZva9A2zHavkKkNpnQEu653/RoTXE630l+QCUIbXWjGUCg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=O5NLymSc; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=O5NLymSc
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 877CD80C8F
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 09:43:05 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a022fee0caso24849385e9.1
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 02:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791884583; x=1792489383; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oNKB/Rg3jTKc9P7FePOx80G6jdFBC375GGoeapJnkeY=;
 b=O5NLymScG5YjXK0ePISETv++4z7famGFD+s2+jnW8fs1gOi/nXQ+R3DlfiJ8XVHhvY
 kTG+vwPsdhJjmLkEp2LS1GmM2uDVz03xFmUF4BUrYke41RIxm6tFiJoAX6OPO4nCAvHF
 71QYULSfe9VMOTtUwpM/b6U5zSNmlC4i92z+4qP6jn/BKBChkLkIYUesUNy7ttd42qLC
 xooxyMZBswWJUvV7h9/qnGzaRIwlUDrxWa/y1/kSHI9+J1roRDqmCDxxeS5Mf+7DeoOl
 35nnn19foSPIxjI4G/Vac74nAzLInSYGeiaCv21F7SXFyLXUp2mB8OEqTs/FYy6XxdVc
 7Yog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791884583; x=1792489383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=oNKB/Rg3jTKc9P7FePOx80G6jdFBC375GGoeapJnkeY=;
 b=E0tplMe+0LlhUDINPoetW3nFSasW6cz3Ee7i871Q8nOmVCK93sgP6EBsf92r++G9vN
 hYRtATGUUF8lIDFAL/xponkGTwaAuaVqEslP1Shx25HX0gD6331NCW7QJxQYAn5TctOL
 qQEXiP17t6d+olfUdgXFgCxYEUTo6EvBvxnJevp6FRXWqFA6NU+fgbLl4tk58j8cRWa+
 zOlrLPMdpkPXWgUcMG+L6tJvBJL158q69trtFZAgNoavOq/tjS1wuReaqvzVz4K0nmOj
 +Gk0W+UkM34lNbrTzSd5lrkRqhAVWEtzuhQ+7yYYDJBeGi214aG9HfAq3uwpUtB+rayD
 vJgw==
X-Gm-Message-State: AFq9FYIkftdYvXqwVDvQisb1+PcZsrDzOsjtB9/zmAsP+H0e6pJkkhvh
 gQmPlO1mjR/ohStNzatFPO68RhWoi0AGmf1jGq+xWPpoNvZYGhxf+lCHSvFbjA==
X-Gm-Gg: AYBFou18z6+ChPasjD5OgD8dVN6f++BcSyHyf2kA+X5kUdVMr1d4chf7TMK7Nrkenb+
 fKhyjiv6tjMr1Vm6uZfiTH2WHxxsGVL9s9SepoyoghTNC30POnWm1jY//uDfSJPpUpLfDuI75fT
 47Qu9Q6YWzzoveR49P8gSZrgESxdYPPD2i7PJ7MwVLJXMR5nZLD5WVHlLPeeH5623F0QvuQ6sVL
 +SuEZMnDCAB89UxbNYpS6Lfuh1VSojicWqZgVRmVbJOyX/r3ld1CezymjH4i/oOOzaHWdXHb8S7
 VHeBvNzmjnE3QZB1/8EmMajnkP7artCNy5lGlGNYZfeQSczFpHDkC4GhhJRaEn/h2JNRHyhASLB
 nlOei/IBCUrFKdyeTQymKk1eF6ZKDd9ugsr1DwtUWfLqX5hdNOEd8uoyf+rUuaVTpqiUw/yOsjn
 20Io7IkwQ0SY1QP2mN2YG3EfxXLQQTrj6t2Wt43GFhz0Er+oujqNOklr7cdpu1T84DkWj+xnmL2
 yEPiqSup6jydgSx9qCQf1ZWF+eIpL1zUn79vZC7
X-Received: by 2002:a05:600c:c104:b0:4a1:96cd:2f67 with SMTP id
 5b1f17b1804b1-4a196cd3240mr114014195e9.4.1791884582996; 
 Tue, 13 Oct 2026 02:43:02 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1972eaed8sm238665595e9.1.2026.10.13.02.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 02:43:02 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue, 13 Oct 2026 11:42:48 +0200
Message-ID: <20261013094252.96761-10-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013094252.96761-1-francois.perrad.86@gmail.com>
References: <20261013094252.96761-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 10/14] package/perl-role-tiny: bump to version
 2.002005
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

diff LICENSE:
see https://metacpan.org/release/HAARG/Role-Tiny-2.002005/diff/HAARG/Role-Tiny-2.002004#LICENSE

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/perl-role-tiny/perl-role-tiny.hash | 8 ++++----
 package/perl-role-tiny/perl-role-tiny.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-role-tiny/perl-role-tiny.hash b/package/perl-role-tiny/perl-role-tiny.hash
index 33de6a53f..a7ed8863c 100644
--- a/package/perl-role-tiny/perl-role-tiny.hash
+++ b/package/perl-role-tiny/perl-role-tiny.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  9ee45591befa3d0b1094ac75d282b6ba  Role-Tiny-2.002004.tar.gz
-sha256  d7bdee9e138a4f83aa52d0a981625644bda87ff16642dfa845dcb44d9a242b45  Role-Tiny-2.002004.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  b3d6525e0c802aeff6b26ef5a928a6b1  Role-Tiny-2.002005.tar.gz
+sha256  4618ec524618c104dc28a8cc86af129a00cad282aea7f4c75060ba05d4c8f4d7  Role-Tiny-2.002005.tar.gz
 
 # computed by scancpan
-sha256  a8a1595c2347f7d10e896809d4f3dea85ccc10ac5644b8073111233cd120b14a  LICENSE
+sha256  ffea2963f1483cccd3b52fa6f1f137bc093715c64c8d97a01b31da411d43bc25  LICENSE
diff --git a/package/perl-role-tiny/perl-role-tiny.mk b/package/perl-role-tiny/perl-role-tiny.mk
index 64d5085fa..3377f685e 100644
--- a/package/perl-role-tiny/perl-role-tiny.mk
+++ b/package/perl-role-tiny/perl-role-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_ROLE_TINY_VERSION = 2.002004
+PERL_ROLE_TINY_VERSION = 2.002005
 PERL_ROLE_TINY_SOURCE = Role-Tiny-$(PERL_ROLE_TINY_VERSION).tar.gz
 PERL_ROLE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_ROLE_TINY_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
