Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96359C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D11340D90;
	Sun, 20 Sep 2026 17:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yW4qog3WoZyT; Sun, 20 Sep 2026 17:20:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6D60D40ED7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924812;
	b=T91100VqDlCMtyTR8SSjRSj2f9Y+jOUIQeKSWfnauY46307aUtpGTHLxhfiqPssYEpDY
	 4nADvtJxP9GmNlY1Q/M9WPJfhv+oWrnPdRW7qvd5cl0wH2hZmGsZVTaXPTs/vFVhHcH7f
	 Umpqy5o+7HW6e/xMLUjAy6qToaqyo7m1pUDrrvb5retgf0EXLkL7CLU3qqJS0qp6A7HNx
	 oNWjcIlS58wI2nmlj9tEAKs+p5tQlQyln0x5FpO5pRhGwtt6kU4ilIDkgTw+G9/aqTqxJ
	 ZNc+gf0wXKc95N5mPFufYZRbxV7p5+oqXOCqtb6+R6yJ+KlVb/7a7m2aeAU2Bo/CiAw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924812;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=guRaCbPWBF0MBPBHpqYbP9VcShwEfgdgODXqZv7pj+A=;
	b=Fow7laI9WBQzG6DK0blpGw/xA/1zs0hXtf3vi2DtFwYnOjX3KAsPLsZ8I5pZeVvlhkHY
	 zKd8SViBJ3aweUDhvK3qzon+Fz0gGYTQhrbYGR/KLkbEwlmqWDF8vQ+X0/ZA7+/7lF9WA
	 9LFmt9lyOq1K138LX34/m+AQ0hOOoSkngJdiepGhsPugxVVyt4Hp8DBAQZ9MUUF3hGK4y
	 qPYlsFjr/Kg0hYsZHuNnmbOuLsJ5bOAC+VA4AZ7HXpo86gOPviEhlNJk8609sLZCDR2wR
	 Mio1E361BXkiI0IR1qFeBPwkUOSSfUe4WlKyNsy9WKwXrV65R2du4pP7LqdF2ghgLVg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b="hXYYm/d5";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924812;
	bh=guRaCbPWBF0MBPBHpqYbP9VcShwEfgdgODXqZv7pj+A=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JsZRKFReriqCeVclrPfrgye35TacVw5h+qfJAJt/X2tgMGNOrvEDZtpQa4ZOBBVwl
	 YCV0Bp5wCkNMIm5an6+BPYMEesvfJ1bW3ok9oMkeKQxUSqLYg8NoDWJxtAUnUWW3Nz
	 dPS06rrhpD3gYSssrUuXkIdMqRBK3KxAd5zF5b0i0l2tuuJNWY+IXsFl/w0pqIoVBr
	 Ky5lsFRiiB1qvQtYVJLx7URRvlFmf/o2guPVPCgLkMnn6cw4K+TiX/xo9JAlt8jtbC
	 nQA7zNLlpen6i5Mj1XAmETHAZaxNZp/ew4cAqCd/O15NxSmMnZsQIZXazH8tVj3Ny8
	 zMQeb7YsPqkMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D60D40ED7;
	Sun, 20 Sep 2026 17:20:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A63025B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3071540FBC
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:20:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q64m9VM6R8h4 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:20:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2EA0540ED7
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924810;
 b=KU1pd9KgC4/VyIZZLfU5sWeeeF/PtdQvCuRPF5zk+4Z3iYBYuVaNGX9IR4wnYFXOYPRe
 L2ydgwR6sr6l6HSVNWZXI/dKr8Ziil3JnX1l1vFkluDhLMIzP3Xynw0u4KORNGTfx34TR
 IOKl15bq4kWTg2TyTepEt3sRmQlwvK1joMw/0d3fhkNxybNRiftS/QTaI3vYUDiswT35M
 c6HT60XvYdfMlsKFKkZkD0fyn8OJK0mC1hy4vT+L4RyHt2tmv2WMiwC2Eakog+DvN4KT/
 KY5ub5asz24nwDXX21Sz1/4ydgB3JBnPXHjhe2e35MFxbP19d272fwPrQPyTS31p3Hg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924810;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=XhK/dpvVkxLyk/wa3SfzqUeYSLuuQjJ1v8ZuNGsD38c=;
 b=KWaexeV6/DN/DxOkpLe0InGtkMwhjRGRxlzrFcmzKWAIF4EqoRbh17mAvj+HR1znTHrd
 vPjBJLFvxIR7Jajw39vRz/jQmc+ttX8qjL/MOT+oZNE6UsL6QXbZAClqtz/PAjgWX2eq4
 L0WJg69AGQ0/NRpr7arB44g2+xHfnHwCvAssjsTYfXFbs1fybrJ4/SEoK+bBsPFdcF7+g
 hOkk8v1/XMVUM7VXSGwBocCFYAubbuTw3YVniNKOCMhTmTS0ChNQ75AriJ3Nsok+PxrzM
 5O3hycj8/tQubmdhjdPZGYAXWysL02L+Hdcmg02s6u3iZJN48pHY2YKullVW+a9IZ0g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="hXYYm/d5"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=hXYYm/d5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2EA0540ED7
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924164;
 bh=XhK/dpvVkxLyk/wa3SfzqUeYSLuuQjJ1v8ZuNGsD38c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hXYYm/d5RsWuvliTPNGft3J3fBWnDTOezjDz8gi+ehAKaEo8eILHHWD6Xh2nzmeaj
 A4FNnuC2nU47rIYVBDQT0l9gEdQpt4TVYS8MT6v+8FgFgWGJjtAaD5Tn1skoOcyPKG
 cSEQzLLVof6KdxsGalwWysOl8Ow/PkOlju3Ln1kD8P/rNSucG3DHjZmFowtkFXydSw
 Z7csz2gIXh66uuUegEhq9Q1N1hmHxcIigCAteXi5QovrF9eWj05P41Sb5WtYVn1cVL
 +MoGWfyl5vtiKmiRHfk8y3ung+72NTqhdbRq5MWzbJxP4a7RxJjZKHZl70NzgQMk1s
 hZRI7YzuyhvPQ==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:OQUFZk5Di639zTVbkbP3E13he5Fh/eUI5ajnC+0S3za8QvRBR/9wbk7Y/b7toyreMwutawhS1nWowFdgZ9enEiIwRI763OB72a7ClGPmv5+y5f5cNjWvrcQDnSHESiMzo3oKGLaiCyis1WqlloSZvvnrgwtL4SRT7h/Bf7osCOvT6ofFH1/AmkgTuAYOm7W9qQ1r3fJJfvgCF07ynJYScZY3OAuYgzKoK9e9cB79tD+DQAHSEIHSuFqto9IaLvAlXwtmDn6MULrPQwg61pO969ooonTqRuY0WI+ALaDhQjMYNgV+bXtOemu2O8zKRa4RyiF++F/Mm9gHTm38AQPUsQSt+Ah0x4HGoM/R+XLSR3kCUZkRZanA/474nG/dc3ltCu+zqgpRdyWlvC58ixNKmYudXfLC75D1lhnnwJGvjPkFhkjyJ+Vgs/rMpSC3bEvLxjiIo5cn2EIxN56KSlAftkFLt1UzEv7o2haX6vXe82iLsjAo1mwm8R5eBooITlFe4LjOK+BtNi7CN/ollVHOhRt8qVmwAdCEPrYHpQP7hhVxJHfQmLrv1xQjfpI0/xBkVKF37neLBoK3pO0hlSa3KzSCfWJETqbBvv+QFvGYQ8JnAD
 PwfhqNkL3iuSJKF9N7anK7KUNL/SbgJB4EP6axO/D3aa2y6rw0epozTq4td6ZwoiPfAjw3OPeqt67n0N8zoNBOR6v7NqP8kNL3FkO+tURnGKymNE58
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2D191A4C489D;
 Sun, 20 Sep 2026 19:09:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1c-000000000o7-3wU3;
 Sun, 20 Sep 2026 17:08:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:52 +0200
Message-ID: <20260920170815.240247-46-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v5 45/67] package/omniorb: Fix build with
 OpenSSL 4.0.0
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/omniorb/0001-openssl4.patch | 63 +++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 package/omniorb/0001-openssl4.patch

diff --git a/package/omniorb/0001-openssl4.patch b/package/omniorb/0001-openssl4.patch
new file mode 100644
index 0000000000..984d5dab25
--- /dev/null
+++ b/package/omniorb/0001-openssl4.patch
@@ -0,0 +1,63 @@
+From: Colin Watson <cjwatson@debian.org>
+Date: Mon, 1 Jun 2026 11:07:35 +0100
+Subject: OpenSSL 4.0.0 returns const pointers from X509 functions
+
+Origin: upstream, https://sourceforge.net/p/omniorb/svn/6818/
+Bug-Debian: https://bugs.debian.org/1138480
+Last-Update: 2026-06-01
+
+Downloaded from Debian:
+https://sources.debian.org/src/omniorb-dfsg/4.3.4%2Bds1-1/debian/patches/openssl-4.patch
+
+Upstream: https://sourceforge.net/p/omniorb/svn/6818/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/lib/omniORB/orbcore/http/httpConnection.cc | 6 +++---
+ src/lib/omniORB/orbcore/ssl/sslConnection.cc   | 6 +++---
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/lib/omniORB/orbcore/http/httpConnection.cc b/src/lib/omniORB/orbcore/http/httpConnection.cc
+index 1e70f93..9da18cd 100644
+--- a/src/lib/omniORB/orbcore/http/httpConnection.cc
++++ b/src/lib/omniORB/orbcore/http/httpConnection.cc
+@@ -2554,14 +2554,14 @@ httpConnection::setPeerDetails() {
+ 
+     int lastpos = -1;
+ 
+-    X509_NAME* name = X509_get_subject_name(peer_cert);
++    const X509_NAME* name = X509_get_subject_name(peer_cert);
+     lastpos = X509_NAME_get_index_by_NID(name, NID_commonName, lastpos);
+ 
+     if (lastpos == -1)
+       return;
+ 
+-    X509_NAME_ENTRY* ne       = X509_NAME_get_entry(name, lastpos);
+-    ASN1_STRING*     asn1_str = X509_NAME_ENTRY_get_data(ne);
++    const X509_NAME_ENTRY* ne       = X509_NAME_get_entry(name, lastpos);
++    const ASN1_STRING*     asn1_str = X509_NAME_ENTRY_get_data(ne);
+ 
+     // Convert to native code set
+     cdrMemoryStream stream;
+diff --git a/src/lib/omniORB/orbcore/ssl/sslConnection.cc b/src/lib/omniORB/orbcore/ssl/sslConnection.cc
+index f02f3f0..d29d2b8 100644
+--- a/src/lib/omniORB/orbcore/ssl/sslConnection.cc
++++ b/src/lib/omniORB/orbcore/ssl/sslConnection.cc
+@@ -548,14 +548,14 @@ sslConnection::setPeerDetails() {
+ 
+     int lastpos = -1;
+ 
+-    X509_NAME* name = X509_get_subject_name(peer_cert);
++    const X509_NAME* name = X509_get_subject_name(peer_cert);
+     lastpos = X509_NAME_get_index_by_NID(name, NID_commonName, lastpos);
+ 
+     if (lastpos == -1)
+       return;
+ 
+-    X509_NAME_ENTRY* ne       = X509_NAME_get_entry(name, lastpos);
+-    ASN1_STRING*     asn1_str = X509_NAME_ENTRY_get_data(ne);
++    const X509_NAME_ENTRY* ne       = X509_NAME_get_entry(name, lastpos);
++    const ASN1_STRING*     asn1_str = X509_NAME_ENTRY_get_data(ne);
+ 
+     // Convert to native code set
+     cdrMemoryStream stream;
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
