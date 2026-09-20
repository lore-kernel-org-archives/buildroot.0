Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E79CC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B514840D93;
	Sun, 20 Sep 2026 17:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bXn5aL4sTQzu; Sun, 20 Sep 2026 17:08:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3EE4640D7D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924106;
	b=UKAKpxul1jzAleVxhwh/bFALCYpfnFWBf7fZLdF0TqhQnx/C1CR4xhaEm1H8Q1NE5YZW
	 aSFsie21pnXxtEyo3CjJExcV1Bq/eDIXPGNOGMoGJfxApW797Ij2CkMqNEnJ0e4/PB6nC
	 74b2XtsJM6H3Csj1KSE4jfy0YmYSvwb/l2HawP1LQS4j9CRvxD5Njzl43XLxsQcexhznN
	 /zgAVi74IYfBrsvpd1aTiSxvQiMK3Osd1r2R7PlFwTE06QXcr9H3BJzLHNE2qpO4sfneU
	 oDGg0oL1p/PaaSLyV+i+nkJhtK52+m1hmIscj/xiQ9TWgEmLiDewmKn4aAKRwl9/eeg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924106;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DfUEMUcRGTkD0p9h5oHdMNLg52g2j+f+HzAo/nDBwps=;
	b=DtPp9n2H/aXPoUSs4xJWgVhnu95SaTtf8pltjFpevQ9Yq4DqBTXLifsaJsZHeNfcF3XJ
	 b8cX2eXaLTGIV1rWlJ+xrnj5vfp2iMbn0RsCqeFJeGm37lxxUxoWGNGLUjtUQC34MQyLn
	 pW5fn/c9VitA1Oro6ncY3LIAfWfFTHVM8paq5ZHbj/uEoSI2yJEEGXouaapSQH1Gsk8Yh
	 lsSXvKJOtPG6ryW31DiA0s2JthWOSnG6qFgeTLYSb27mFT7TZ0whmboqxLKD/0P8qbw3V
	 MqlQ1jx5IuM45FJmCnXOkb+ADyIbQOTp0rgQu3RxMhqbpk9TSBXRONtpeRPGlkGP7xg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924106;
	bh=DfUEMUcRGTkD0p9h5oHdMNLg52g2j+f+HzAo/nDBwps=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Hv1f5OrwvhqfUzDMob+ZYFKEWhp3rUXRkRLOLOwBiI5c/iHSnJBrh0JTibVapT591
	 g2VqU0YtxEsiZUsrMCdcdlQb/5dns/iiLCeezWD0UoiBQnbtdqhdRJkBmeT3cgXPWt
	 79gJ+o0RgG8Y5OV5JHztSHVF8RR0Si0H9BwX130USFpL2JheELlvmOOzvuPSpCpfZm
	 /PZKz4eCIkCqrotkOPCwA9cdWKsUSOCEXs0R8GVa2nDrSQQV8myWIyAnV4dZIO76Kv
	 xhBsWjCmlg7RJiJcIuetgmmAP2WGQp1finS39gC+9IZwV1Y0hhcrKvsFejrpfnWphq
	 PQv6NL/vzCBYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EE4640D7D;
	Sun, 20 Sep 2026 17:08:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A3203DD
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0034140099
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TaHVMJaWeeRz for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:08:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 8F5AF40022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924102;
 b=WsyS7F6d805T9emWau0s3v4oTyEkZWKeHs6Nkx0PBaEUjeAD4CZatDvc5Zkc3NDkCu1y
 kw5SqhGVH4FFnzsMhaDWZ/rVReVMFy6ytsXoGXHKLzG48hjA96kyU+GtT7aeVN2GcQ0Dg
 z1XS05MOYtMwQYm0HD8zsFqxQZYNQbJyG4hLrxZsvaGbuQ1l04caXGR+Nj5M4KmPCb44E
 jDXYJtG7XNYU0HIwA2+nmm/Z5APsWjwx7fBnuTdLxD9DsttPwX4Ny5BGnCKDwOI02HdlC
 /lSXYcxNM/idTLnzBnS0bDsJ+wgi/XdX50NtBcHM0sg63TDqRsO3xE4NjRfF2uShs4Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924102;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=SLEALPjsBnrihywnzDHYM1ScbuRPTZB1HDLYzKdzmHo=;
 b=iZAUeiqWPlXSur2xEhVzsAyXLm9QZITUTdStSCBEf/jnFG3Z0UIstyix+Zl1x72SzoHb
 4j2fvS7rsaZdyK/B/4goQ/cAn0cK5le2kU+CHMPMMdRxtZ1puhU0ROWznuEDU38O0LO90
 SFM9IV3FYSdeY6mAaBiL6rNNy+kCngRti9s/a3wOyFbKlcMj0g3eaf8k1dcPl+k5Hsb/+
 2tHiueFjkpjAhGg9by1g+FIU+AnnkrGw/8k8NuEtYgegXfMEpS0srcBqTfqgilK64KYA7
 D6vgdcdMHrbybQ0jwVqWorYGqJgiLllIX4MX2ZCkJQoIG2dW2mtPxjWHKHegAktAejw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cwp8cjoY; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cwp8cjoY
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F5AF40022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924096;
 bh=SLEALPjsBnrihywnzDHYM1ScbuRPTZB1HDLYzKdzmHo=;
 h=From:To:Cc:Subject:Date:From;
 b=cwp8cjoYHE9q1vHCfF5L+qT5y6hqwRzMJG8tnE1WoXKA4wASOVyKGUX7ORYxX26n6
 sHOpdq+fjhNoDsS80puKPs1egs3pK5MaQ8zFP/pXc2lnV/ljE/nY7vCBtcBJ7Uz2b5
 wxIjdxXupwfxd2o4nGjFtpsvYQmoMytNM10XhoKpeF8JVCwcF9q1KsMnvh4mKN+bsr
 Nx4Or3Tl3kmElk2JU1Lti9c84wbBKS0MTZVtu1Uw19ugSle49neaudMa9LRimWsRUk
 vriQxoumgb2QObAia1Aoo6PJGEyo8cLt910CFqaEmeDzaG7T3rTm0Ept3siYuqxbAJ
 SVdTzKns1Rwiw==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:y99kiwVBjBRPNGID9s3pqIJeV7W+wFntutT6Nk6Csphjo5gy7SJnf9w1oaGIqj9xcD2NzYlRDp1mzRTTIzvJn5Yo5viSlzTf8HG/naF+uXMPp3swW8PuIfFrYA0DlxhRsV6wHQ6RC+L2AjrqyWc3WYVLpn/QU+BXOckp4hoILGsBiUyY+8LTWgnkYtsNilNDSzK/Ojie8P0QwvPQFPQ8+ao+qWVNPYcmOxvBPeUCA2e7EmumBIhxKKYVsv0rj5IJeZxgx8VYhPq7ROjnFzzPAXwQ/hGf8VBv+aouMuaF6EgC9ovreGd8tYcL3mMrFz+c2qqZP449r3PIEus7ahTIFyPGwiJPklLO3ErwF1EfgnWyimz3Lvj+d6KnhFToxdkQZrBgX7OpxydEpSW+u4c9g99heXqbxFOh7mvK6WFEMp2uvSnPbU7nbTuf8XUY06BblA9jDR6rIdds58CKZDle0rRSSAuwBtumQmT5KEyJSD/2V0ZTZwn4RItMijQiR3HurizKbjVhrpmVQafcNzpz666Zha9FYNh+TuXInciUUbKiQkPJiNGfKXO80UTZ2I03WA7OpZHBzB3ICRY/TGqzGoXbaQJjvbYJkqlJVE7wn4V0/K
 YtaBB5uoLCgoiky7JXX7Soq0WFDPH2t1eA2Hhewg==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6E1CAA4C479E;
 Sun, 20 Sep 2026 19:08:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1T-000000000o7-2Z8W;
 Sun, 20 Sep 2026 17:08:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:07 +0200
Message-ID: <20260920170815.240247-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v5 00/67] package/libopenssl: bump version to
 4.0.2
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

Hi,

this series bumps libopenssl to version 4.0.2.

It consists of the following parts:

0001-0002: package removals
0003-0023: version bumps that provide compatibility with OpenSSL 4.x
           0003-0005 belong to the boost patch series
           0018-0021 belong to the snort3 patch series
           The poco package needed the CMake patch from Yegor
0024-0066: upstream fixes for packages without a released version that
           provides compatibility with OpenSSL 4.x
           The luvi package needs to be bumped first so the upstream fix
           for OpenSSL 4.x can be applied
0067:      bump libopenssl to 4.0.2

None of the patches 0001-0066 depend on the libopenssl bump, they all
build fine with libopenssl 3.6.2.

Regards, Bernd

v5:
- rebased
- fixed mender build by using an Ubuntu patch

v4, only minor changes, not sent CC to all maintainers:
- renumbered patches in cover letter
- added Upstream: tag to patch package/resiprocate/0001
- mentioned resiprocate changes in v3

v3:
- rebased
  the current tree, also containing unrelated build fixes, can be found
  here:
  https://gitlab.com/bkuhls/buildroot/-/commits/c60dc5542041aef205b874e875a3da582ebb6811
- added systemd fix
- removed resiprocate removal, bumped to 1.14.0 and added OpenSSL fixes
- removed mender removal for the time being from the series
  the tree mentioned above still contains the removal, then the revert
  of the removal and Adam's bump to 5.1.0 which is broken with the bump
  to OpenSSL 4.0.2:
  https://lists.buildroot.org/pipermail/buildroot/2026-September/810147.html
- to-do:
  package/qt6/qt6opcua needs to be removed as well

v2:
- squashed BR2_TOOLCHAIN_HAS_GCC_BUG_101916 removal into
  heirloom-mailx removal patch
- added qt6 bump which also fixes build with OpenSSL 4.0

Bernd Kuhls (66):
  package/qt5/qt5opcua: remove package
  package/qt5/qt5knx: remove package
  package/domoticz: bump version to 2026.3
  package/libtorrent-rasterbar: bump version to 2.1.1
  package/boost: bump version to 1.92.0
  package/asterisk: bump bundled pjsip to 2.17
  package/asterisk: bump version to 22.11.0
  package/asterisk: Fix build with OpenSSL 4.0.0
  package/dovecot{-pigeonhole}: security bump version to 2.4.5
  package/libp11: bump version to 0.4.20
  package/nmap: bump version to 7.991
  package/openvmtools: bump version to 13.1.0
  package/poco: bump version to 1.15.3
  package/qt6: security bump version to 6.11.2
  package/resiprocate: security bump version to 1.14.0
  package/resiprocate: Fix build with OpenSSL 4.0.0
  package/daq3: bump version to 3.0.27
  package/snort3: fix build error with numa support
  package/snort3: bump version to 3.12.2.0
  package/snort3: Fix build with OpenSSL 4.0.0
  package/xtables-addons: use kernel-module infra
  package/xtables-addons: bump version to 3.31
  package/apache: Add support for OpenSSL 4.0.0
  package/boinc: Fix build with OpenSSL 4.0.0
  package/ca-certificates: Replace c_rehash with openssl rehash
  package/clamav: Fix build with OpenSSL 4.0.0
  package/ecryptfs-utils: remove OpenSSL support
  package/freeradius-server: Add support for OpenSSL 4.0.0
  package/freeswitch: Add support for OpenSSL 4.0.0
  package/gloox: Fix build with OpenSSL 4.0.0
  package/grpc: Fix build with OpenSSL 4.0.0
  package/ibm-sw-tpm2: Fix build with OpenSSL 4.{0, 1}
  package/ibrdtnd: Fix build with OpenSSL 4.0.0
  package/lftp: Add support for OpenSSL 4.0.0
  package/libesmtp: Fix build with OpenSSL 4.0.0
  package/libkrb5: Add support for OpenSSL 4.0.0
  package/luvi: fix build without c++
  package/luvi: bump version to 102-g9fa6c141a
  package/luvi: Fix build with OpenSSL 4.0.0
  package/mender: Fix build with OpenSSL 4.0.0
  package/mtd: Fix build with OpenSSL 4.0.0
  package/netsnmp: Fix build with OpenSSL 4.0.0
  package/ntp: Add support for OpenSSL 4.0.0
  package/omniorb: Fix build with OpenSSL 4.0.0
  package/opensc: Add support for OpenSSL 4.0.0
  package/perl-net-ssleay: Add support for OpenSSL 4.0.0
  package/pkcs11-helper: Add support for OpenSSL 4.0.0
  package/python3: Add support for OpenSSL 4.0.0
  package/qpid-proton: Fix build with OpenSSL 4.0.0
  package/qt5/qt5base: Add support for OpenSSL 4.0.0
  package/rauc: Fix build with OpenSSL 4.0.0
  package/redis: Fix build with OpenSSL 4.0.0
  package/socat: Add support for OpenSSL 4.0.0
  package/sofia-sip: Fix build with OpenSSL 4.0.0
  package/softhsm2: Fix build with OpenSSL 4.0.0
  package/squid: Fix build with OpenSSL 4.0.0
  package/sudo: Add support for OpenSSL 4.0.0
  package/systemd: Fix build with OpenSSL 4.0.0
  package/thrift: Fix build with LibreSSL and OpenSSL 4.x
  package/thrift: Fix build with OpenSSL 4.0.0
  package/tpm2-openssl: Fix build with OpenSSL 4.0.0
  package/trousers: Fix build with OpenSSL 4.0.0
  package/uboot-tools: Fix build with OpenSSL 4.0.0
  package/xmrig: Add support for OpenSSL 4.0.0
  package/znc: Fix build with OpenSSL 4.0.0
  package/libopenssl: bump version to 4.0.2

Yegor Yefremov (1):
  package/poco: convert to CMake package

 .checkpackageignore                           |   10 +-
 Config.in.legacy                              |   50 +
 DEVELOPERS                                    |    2 -
 docs/manual/migrating.adoc                    |    6 +
 .../0004-modules-md-Merge-from-icing-md.patch |   57 +
 package/apr-util/Config.in                    |    1 -
 ...of-bundled-libpjsip-with-OpenSSL-4.x.patch |   63 +
 package/asterisk/asterisk.hash                |    6 +-
 package/asterisk/asterisk.mk                  |    8 +-
 ...fix-a-build-failure-with-openssl-4.0.patch |   26 +
 ...xit_code-guard-static_asserts-on-MIP.patch |   59 +
 .../0001-unordered-fix-copy-assign.patch      |   22 -
 ...-for-duplicate-definition-of-SIGLOST.patch |   30 +
 package/boost/0003-Fix-build.patch            |   39 +
 ...-types-between-declaration-and-defin.patch |   53 +
 package/boost/Config.in                       |   12 +-
 package/boost/boost.hash                      |    4 +-
 package/boost/boost.mk                        |    2 +-
 package/ca-certificates/ca-certificates.mk    |    4 +-
 ...-crypto-Remove-cl_ASN1_GetTimeT-1731.patch |  136 +
 package/daq3/daq3.hash                        |    2 +-
 package/daq3/daq3.mk                          |    2 +-
 package/domoticz/Config.in                    |    7 +-
 package/domoticz/domoticz.hash                |    3 +-
 package/domoticz/domoticz.mk                  |   27 +-
 .../dovecot-pigeonhole.hash                   |    4 +-
 .../dovecot-pigeonhole/dovecot-pigeonhole.mk  |   12 +-
 ...xpand-crypt-Link-test-binary-statica.patch |   32 +
 ...g-passdbs-with-identical-driver-args.patch |  137 -
 ...onfigure-Explicitly-check-for-icu-uc.patch |   28 -
 package/dovecot/Config.in                     |   21 +-
 package/dovecot/dovecot.hash                  |    4 +-
 package/dovecot/dovecot.mk                    |   68 +-
 package/ecryptfs-utils/ecryptfs-utils.mk      |    2 +-
 package/fluent-bit/Config.in                  |    1 -
 ...ING-functions-for-OpenSSL-4.0-compat.patch |   80 +
 package/freeswitch/freeswitch.mk              |    5 +
 .../0001-Fix-build-with-OpenSSL-4.x.patch     |   43 +
 .../grpc/0003-Add-support-for-OpenSSL-4.patch |  327 +
 .../0002-tpm-Update-to-OpenSSL-4.1.patch      |   28 +
 ...ateManager.cpp-fix-build-with-OpenSS.patch |   41 +
 .../0002-allow-build-with-OpenSSL-4.x.patch   |   56 +
 package/libcoap/Config.in                     |    1 -
 ...-with-OpenSSL-4.0-opaque-ASN1_STRING.patch |   36 +
 ...eck_host-to-verify-KKDCP-server-cert.patch |  252 +
 ...Improve-future-OpenSSL-compatibility.patch |  327 +
 package/libks/Config.in                       |    1 -
 package/libldns/libldns.mk                    |    8 +-
 package/libopenssl/Config.in                  |   34 -
 package/libopenssl/libopenssl.hash            |    4 +-
 package/libopenssl/libopenssl.mk              |   18 +-
 package/libp11/Config.in                      |    1 -
 package/libp11/libp11.hash                    |    4 +-
 package/libp11/libp11.mk                      |    5 +-
 package/librelp/Config.in                     |    1 -
 package/libssh/Config.in                      |    1 -
 .../0001-fix-more-c-17-that-made-it-in.patch  |   53 +
 package/libtorrent-rasterbar/Config.in        |    8 +-
 .../libtorrent-rasterbar.hash                 |    5 +-
 .../libtorrent-rasterbar.mk                   |   22 +-
 ...eLists.txt-only-require-a-C-compiler.patch |   48 +
 ...ly-disable-GCC-diagnostics-in-ocsp.c.patch |   80 -
 ...isable-Wincompatible-pointer-types-f.patch |   54 -
 .../luvi/0002-feat-support-openssl-4.0.patch  |  403 +
 package/luvi/Config.in                        |    1 -
 package/luvi/luvi.hash                        |    2 +-
 package/luvi/luvi.mk                          |    2 +-
 package/mender/0001-openssl-v4-update.patch   |  180 +
 package/mender/Config.in                      |    1 -
 ...t-compile-engine-support-if-not-avai.patch |   62 +
 package/mtd/Config.in                         |    1 -
 .../0002-libsnmp-Fix-OpenSSL-4-build.patch    |   99 +
 ...if-compiling-without-Lua-support.-Cl.patch |   29 +
 package/nmap/nmap.hash                        |    6 +-
 package/nmap/nmap.mk                          |    2 +-
 package/ntp/0008-openssl4.patch               |  100 +
 package/omniorb/0001-openssl4.patch           |   63 +
 .../0001-Changes-for-OpenSSL-4.0.0.patch      |  333 +
 package/openssh/openssh.mk                    |    8 +-
 .../0001-configure.ac-disable-Werror.patch    |   32 +
 .../openvmtools/0001-no_cflags_werror.patch   |   18 -
 .../0002-dont-force-cppflags.patch            |   21 -
 ...-not-force-I-usr-include-in-CPPFLAGS.patch |   36 +
 ..._poll-h-to-fix-build-failure-on-musl.patch |  813 --
 ...to-vm_poll.h-to-fix-build-failure-on.patch |  133 +
 ...ns-about-glibc-being-only-libc-imple.patch |   27 +-
 ...e-configure-test-for-struct-timespec.patch |   31 +-
 ...finition-of-ALLPERMS-and-ACCESSPERMS.patch |   35 +-
 ...-test-for-feature-instead-of-platfor.patch |   74 +-
 ...onfigure-test-for-sys-stat.h-include.patch |   21 +-
 ...gfs-fuse-fsutils.h-fix-build-on-mus.patch} |    8 +-
 ...FromNtTimeNsec-aware-of-64-bit-time_.patch |   51 +
 ...on-discards-const-qualifier-from-poi.patch |  148 +
 ...FromNtTimeNsec-aware-of-64-bit-time_.patch |   80 -
 ...GLib-g_free-macro-redefinition-erro.patch} |   11 +-
 ...uthorization-on-incoming-guestOps-re.patch |   41 -
 ...-2025-22247-1100-1225-VGAuth-updates.patch |  383 -
 package/openvmtools/openvmtools.hash          |    3 +-
 package/openvmtools/openvmtools.mk            |   22 +-
 .../0002-Fix-SSLv3-in-OpenSSL-4.0.0.patch     |   39 +
 ...emove-support-for-some-TLS-functions.patch |  197 +
 ...SSLeay-to-support-opaque-ASN1_STRING.patch |  179 +
 ...-removal-of-SSLv2-Client-Hello-suppo.patch |   66 +
 ...Net-SSLeay-OPENSSL_info-return-value.patch |   45 +
 ...r-OPenSSL-4-support-and-update-tests.patch |   94 +
 ...but-if-with-else-to-avoid-duplicate-.patch |   83 +
 ...1-crypto-openssl-use-ASN1_TIME_to_tm.patch |   48 +
 package/poco/Config.in                        |    1 +
 package/poco/poco.hash                        |    2 +-
 package/poco/poco.mk                          |  100 +-
 package/python3/0011-openssl4-support.patch   | 9807 +++++++++++++++++
 ...1-PROTON-2937-Add-OpenSSL-4.x-compat.patch |   80 +
 package/qt5/Config.in                         |    2 -
 package/qt5/qt5base/0009-openssl4.patch       |   52 +
 package/qt5/qt5base/0010-openssl4.patch       |  139 +
 package/qt5/qt5base/0011-openssl4.patch       |   89 +
 package/qt5/qt5knx/Config.in                  |   12 -
 package/qt5/qt5knx/qt5knx.hash                |    6 -
 package/qt5/qt5knx/qt5knx.mk                  |   15 -
 package/qt5/qt5opcua/Config.in                |    9 -
 package/qt5/qt5opcua/qt5opcua.hash            |   10 -
 package/qt5/qt5opcua/qt5opcua.mk              |   19 -
 package/qt6/qt6.mk                            |    2 +-
 ...e.cpp-remove-is_always_lock_free-sta.patch |   41 -
 package/qt6/qt6base/qt6base.hash              |    4 +-
 package/qt6/qt6charts/qt6charts.hash          |    4 +-
 .../qt6/qt6core5compat/qt6core5compat.hash    |    4 +-
 .../qt6/qt6declarative/qt6declarative.hash    |    4 +-
 package/qt6/qt6graphs/qt6graphs.hash          |    4 +-
 package/qt6/qt6grpc/qt6grpc.hash              |    4 +-
 .../qt6languageserver/qt6languageserver.hash  |    4 +-
 package/qt6/qt6mqtt/qt6mqtt.hash              |    2 +-
 package/qt6/qt6multimedia/qt6multimedia.hash  |    4 +-
 package/qt6/qt6opcua/qt6opcua.hash            |    2 +-
 .../qt6/qt6positioning/qt6positioning.hash    |    4 +-
 package/qt6/qt6quick3d/qt6quick3d.hash        |    4 +-
 .../qt6quicktimeline/qt6quicktimeline.hash    |    4 +-
 package/qt6/qt6scxml/qt6scxml.hash            |    4 +-
 package/qt6/qt6serialbus/qt6serialbus.hash    |    4 +-
 package/qt6/qt6serialport/qt6serialport.hash  |    4 +-
 .../qt6/qt6shadertools/qt6shadertools.hash    |    4 +-
 package/qt6/qt6svg/qt6svg.hash                |    4 +-
 package/qt6/qt6tools/qt6tools.hash            |    4 +-
 .../qt6virtualkeyboard.hash                   |    4 +-
 package/qt6/qt6wayland/qt6wayland.hash        |    4 +-
 package/qt6/qt6websockets/qt6websockets.hash  |    4 +-
 ...N1_STRING_get0_data-and-ASN1_STRING_.patch |   48 +
 package/rauc/Config.in                        |    2 -
 package/rauc/rauc.mk                          |    3 +-
 ...emove-Werror-deprecated-declarations.patch |   28 +
 ...precated-OpenSSL-calls-fix-upcoming-.patch |  597 +
 ...aining-build-errors-with-OpenSSL-4.x.patch |   47 +
 package/resiprocate/resiprocate.hash          |    2 +-
 package/resiprocate/resiprocate.mk            |    2 +-
 .../0001-Rename-numa.h-to-numa_snort.h.patch  |   79 +
 ...fix-const-qualifiers-for-OpenSSL-4.0.patch |   63 +
 package/snort3/snort3.hash                    |    2 +-
 package/snort3/snort3.mk                      |    2 +-
 ...penSSL-4.0-use-ASN1_STRING-accessors.patch |   35 +
 ...001-Fix-build-error-with-OpenSSL-4.0.patch |   42 +
 ...mory-leak-in-OSSL-byteString2oid-863.patch |   49 +
 ...in-EdDSA-PrintableString-handling-85.patch |   98 +
 package/softhsm2/Config.in                    |    1 -
 .../0001-Fix-OpenSSL-4.0-compatibility.patch  |  368 +
 ...-for-getting-an-ASN1_STRING-s-length.patch |   46 +
 ...compilation-with-openssl-4.0.0-beta1.patch |   86 +
 ...sport-Make-it-compatible-with-OpenSS.patch |  193 +
 ...recated-OpenSSL-API-ASN1_STRING_data.patch |   35 +
 ...TRING-and-X509_NAME-access-for-OpenS.patch |   87 +
 package/trousers/0004-openssl4.patch          |   26 +
 ...Add-support-for-OpenSSL-Provider-API.patch |  304 +
 package/unbound/Config.in                     |    1 -
 package/unbound/unbound.mk                    |    1 +
 .../0001-Fix-build-with-OpenSSL-4.0.0.patch   |   40 +
 package/xtables-addons/Config.in              |    2 +-
 package/xtables-addons/xtables-addons.hash    |    2 +-
 package/xtables-addons/xtables-addons.mk      |    9 +-
 ...-Fix-build-error-with-OpenSSL-4-2024.patch |   57 +
 178 files changed, 17153 insertions(+), 2188 deletions(-)
 create mode 100644 package/apache/0004-modules-md-Merge-from-icing-md.patch
 create mode 100644 package/asterisk/0006-Fix-build-of-bundled-libpjsip-with-OpenSSL-4.x.patch
 create mode 100644 package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch
 create mode 100644 package/boost/0001-fix-process-v2-exit_code-guard-static_asserts-on-MIP.patch
 delete mode 100644 package/boost/0001-unordered-fix-copy-assign.patch
 create mode 100644 package/boost/0002-Add-check-for-duplicate-definition-of-SIGLOST.patch
 create mode 100644 package/boost/0003-Fix-build.patch
 create mode 100644 package/boost/0004-fix-inconsistent-types-between-declaration-and-defin.patch
 create mode 100644 package/clamav/0001-libclamav-crypto-Remove-cl_ASN1_GetTimeT-1731.patch
 create mode 100644 package/dovecot/0001-Revert-lib-var-expand-crypt-Link-test-binary-statica.patch
 delete mode 100644 package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
 delete mode 100644 package/dovecot/0002-configure-Explicitly-check-for-icu-uc.patch
 create mode 100644 package/freeradius-server/0009-Use-ASN1_STRING-functions-for-OpenSSL-4.0-compat.patch
 create mode 100644 package/gloox/0001-Fix-build-with-OpenSSL-4.x.patch
 create mode 100644 package/grpc/0003-Add-support-for-OpenSSL-4.patch
 create mode 100644 package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch
 create mode 100644 package/ibrdtnd/0003-SecurityCertificateManager.cpp-fix-build-with-OpenSS.patch
 create mode 100644 package/lftp/0002-allow-build-with-OpenSSL-4.x.patch
 create mode 100644 package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch
 create mode 100644 package/libkrb5/0002-Use-X509_check_host-to-verify-KKDCP-server-cert.patch
 create mode 100644 package/libkrb5/0003-Improve-future-OpenSSL-compatibility.patch
 create mode 100644 package/libtorrent-rasterbar/0001-fix-more-c-17-that-made-it-in.patch
 create mode 100644 package/luvi/0001-CMakeLists.txt-only-require-a-C-compiler.patch
 delete mode 100644 package/luvi/0001-Selectively-disable-GCC-diagnostics-in-ocsp.c.patch
 delete mode 100644 package/luvi/0002-CMakeLists.txt-disable-Wincompatible-pointer-types-f.patch
 create mode 100644 package/luvi/0002-feat-support-openssl-4.0.patch
 create mode 100644 package/mender/0001-openssl-v4-update.patch
 create mode 100644 package/mtd/0001-ubifs-utils-Don-t-compile-engine-support-if-not-avai.patch
 create mode 100644 package/netsnmp/0002-libsnmp-Fix-OpenSSL-4-build.patch
 create mode 100644 package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch
 create mode 100644 package/ntp/0008-openssl4.patch
 create mode 100644 package/omniorb/0001-openssl4.patch
 create mode 100644 package/opensc/0001-Changes-for-OpenSSL-4.0.0.patch
 create mode 100644 package/openvmtools/0001-configure.ac-disable-Werror.patch
 delete mode 100644 package/openvmtools/0001-no_cflags_werror.patch
 delete mode 100644 package/openvmtools/0002-dont-force-cppflags.patch
 create mode 100644 package/openvmtools/0002-m4-do-not-force-I-usr-include-in-CPPFLAGS.patch
 delete mode 100644 package/openvmtools/0003-Rename-poll-h-into-vm_poll-h-to-fix-build-failure-on-musl.patch
 create mode 100644 package/openvmtools/0003-Rename-poll.h-into-vm_poll.h-to-fix-build-failure-on.patch
 rename package/openvmtools/{0011-open-vm-tools-vmhgfs-fuse-fsutils.h-fix-build-on-mus.patch => 0009-open-vm-tools-vmhgfs-fuse-fsutils.h-fix-build-on-mus.patch} (86%)
 create mode 100644 package/openvmtools/0010-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch
 create mode 100644 package/openvmtools/0011-fix-initialization-discards-const-qualifier-from-poi.patch
 delete mode 100644 package/openvmtools/0012-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch
 rename package/openvmtools/{0015-glib_stubs-avoid-GLib-g_free-macro-redefinition-error.patch => 0012-glib_stubs-avoid-GLib-g_free-macro-redefinition-erro.patch} (84%)
 delete mode 100644 package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch
 delete mode 100644 package/openvmtools/0014-CVE-2025-22247-1100-1225-VGAuth-updates.patch
 create mode 100644 package/perl-net-ssleay/0002-Fix-SSLv3-in-OpenSSL-4.0.0.patch
 create mode 100644 package/perl-net-ssleay/0003-OpenSSL-4.0.0-remove-support-for-some-TLS-functions.patch
 create mode 100644 package/perl-net-ssleay/0004-Fix-Net-SSLeay-to-support-opaque-ASN1_STRING.patch
 create mode 100644 package/perl-net-ssleay/0005-Update-tests-for-removal-of-SSLv2-Client-Hello-suppo.patch
 create mode 100644 package/perl-net-ssleay/0006-Add-default-for-Net-SSLeay-OPENSSL_info-return-value.patch
 create mode 100644 package/perl-net-ssleay/0007-Add-Changes-for-OPenSSL-4-support-and-update-tests.patch
 create mode 100644 package/perl-net-ssleay/0008-Do-not-use-elif-but-if-with-else-to-avoid-duplicate-.patch
 create mode 100644 package/pkcs11-helper/0001-crypto-openssl-use-ASN1_TIME_to_tm.patch
 create mode 100644 package/python3/0011-openssl4-support.patch
 create mode 100644 package/qpid-proton/0001-PROTON-2937-Add-OpenSSL-4.x-compat.patch
 create mode 100644 package/qt5/qt5base/0009-openssl4.patch
 create mode 100644 package/qt5/qt5base/0010-openssl4.patch
 create mode 100644 package/qt5/qt5base/0011-openssl4.patch
 delete mode 100644 package/qt5/qt5knx/Config.in
 delete mode 100644 package/qt5/qt5knx/qt5knx.hash
 delete mode 100644 package/qt5/qt5knx/qt5knx.mk
 delete mode 100644 package/qt5/qt5opcua/Config.in
 delete mode 100644 package/qt5/qt5opcua/qt5opcua.hash
 delete mode 100644 package/qt5/qt5opcua/qt5opcua.mk
 delete mode 100644 package/qt6/qt6base/0001-qtestsupport_core.cpp-remove-is_always_lock_free-sta.patch
 create mode 100644 package/rauc/0001-signature-use-ASN1_STRING_get0_data-and-ASN1_STRING_.patch
 create mode 100644 package/redis/0004-Remove-Werror-deprecated-declarations.patch
 create mode 100644 package/resiprocate/0001-ssl-modernize-deprecated-OpenSSL-calls-fix-upcoming-.patch
 create mode 100644 package/resiprocate/0002-ssl-Fix-remaining-build-errors-with-OpenSSL-4.x.patch
 create mode 100644 package/snort3/0001-Rename-numa.h-to-numa_snort.h.patch
 create mode 100644 package/snort3/0002-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch
 create mode 100644 package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
 create mode 100644 package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch
 create mode 100644 package/softhsm2/0001-Fix-the-memory-leak-in-OSSL-byteString2oid-863.patch
 create mode 100644 package/softhsm2/0002-Fix-memory-leak-in-EdDSA-PrintableString-handling-85.patch
 create mode 100644 package/squid/0001-Fix-OpenSSL-4.0-compatibility.patch
 create mode 100644 package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch
 create mode 100644 package/systemd/0001-various-fix-compilation-with-openssl-4.0.0-beta1.patch
 create mode 100644 package/thrift/0002-THRIFT-6170-transport-Make-it-compatible-with-OpenSS.patch
 create mode 100644 package/thrift/0003-Replace-deprecated-OpenSSL-API-ASN1_STRING_data.patch
 create mode 100644 package/tpm2-openssl/0001-Fix-ASN1_OCTET_STRING-and-X509_NAME-access-for-OpenS.patch
 create mode 100644 package/trousers/0004-openssl4.patch
 create mode 100644 package/uboot-tools/0003-Add-support-for-OpenSSL-Provider-API.patch
 create mode 100644 package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch
 create mode 100644 package/znc/0001-Fix-build-error-with-OpenSSL-4-2024.patch

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
