Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1419C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C52F605EE;
	Sun, 20 Sep 2026 14:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0Q2RirAopT0; Sun, 20 Sep 2026 14:44:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C2117606E7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915474;
	b=KZoZ495EjhZy0CSnlcV/5RCG+OPeD//z+xDgzmPjitGBNa+sOdcBBu0hTPt2voAbytNh
	 iD806zk/63pJCxLNi1xrWfTGl2E2YgiLzd3Gee4ibZ7FXIu6H6Q6YfQnui0bp3ai4GDGo
	 YnMyghSBSVXYbkFSPQKA5TywNQLkd13X5QxBGPwr1v1GoVws9jCCv0cgv46CgxqnRbqhI
	 drACRWmRBXxQ7FEfFCRVDTlswDZ+fXb5zVewsRAB20+7JOIh+5W0qksEIug8VXGtNwood
	 sb7ixiCsLKQWL1oXn0zx3B9bNS5SRm0gstAacndsyl8GVXlL6qnk28AbpHkeGACbnIA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915474;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UCOnwUajaYx3P4zHe/6iNMgKYkdFMmDK360/W9NslFE=;
	b=NLRtyNCM0OUnaflpBfJWcE+y9FIYpTK485fp2IcznuyXaYr9bKPWgbBVR8j8HF3js3pv
	 BmtpBS8wL5oaBcJds/1xI1IwEI025bQQr3ND6mewB9YXKsodKn/kY8SN9dJxewlVLhAj3
	 nAPhAKfszM0fUURibYcekJGh7TZHUGBBVsPDnxuxzBA/jlq5Smu0phqTX9bSKxORaLfEx
	 pWXOZJAd6/oLvVJt691VWI7HdDKeTU8F21uEgR4jeJB/mHmhADHhRS9yWhxUZbsT3UNDW
	 qf/ndOQQzXlLAEUvgVYmlvWKVbPjbkRQUa5xm++QnVZ8B5S8dSNnoNpJSS7B2mLW7oA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915474;
	bh=UCOnwUajaYx3P4zHe/6iNMgKYkdFMmDK360/W9NslFE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SK2MliZ14xrVEjUYae2L64BF3JwodFpm1G2eQD5ndORVH5LxlNHaYtr5Ab4F+LDuE
	 Sy//zyMRXN3r8d4DAJfuYL7fkm7sX+/A6RbPnze/Wfq+NoHEEAv3izA5Co3Jk5P04h
	 fpS9dMADlaWFKlfE87I7lj6crwnqi1f7FK5e3XkYm3ZpCeA+TbfnO0ZoNpTwSLZRxP
	 /t8kVnNM7H788IDTs6s8I/PYtW+ayZeIkvqRSKJ7qeDR+e5WzhimMQBQhYM6+zRfkW
	 eocPeZKOdH7Npl8TSDSt8M3/Gt8DrMfKzm8SP45D7AyggAD+douL2bvtuRrRiaNb3N
	 ccWbUYERkAlhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2117606E7;
	Sun, 20 Sep 2026 14:44:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E061224D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D23DA80EDD
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:44:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BpiR-OGbPUwo for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:44:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0210E80EC5
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915472;
 b=WgBGyexCTeCxHnpinR4gZ1ndKOIhR5sCJaYUPssoXvH7STfdx2VHM6OJ8FLbk+nZQ9x3
 aeuI7bc1bwI5Jr8sMbo2Afz+Q1QQFpDteiBDatMerce3F1B8B0nC+gkcyCZyy2DezJeeF
 xGdxQ6jBlTS86truojTWCf4juayJEAE8oTJL9F0JxkzrLKNsyYLl3OtvuTdFzRnGrfd2O
 OMLssOs54B4p8H5XQd4o90gD4Q3MF5i47xn8T/3harL2DV0N2agqeikjNO8I5lPPSAIIr
 BeApi+jL1pI0D/UZ9neC982KJijGe7EcW+Bcf3ChzNqCinl9Yf+974udzGMWhOmNOWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915472;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=tiGYiaD1RopmGdAod8tRP1dsx5iq7QlSLjuC7JeDVXs=;
 b=CpoRm23v4XA4kWLOM72faSVngbYWzancFBF+/UiF69udjEetKhzkSR31LEg3e2fbI9OX
 /3nGFejd5JZS1RjgvDe9pbI9e++r6lgmtaNf88YHyHG979K2+isT9aB19L9M01zFnLzN2
 lBTKkznCiYr3HjmRd7D7UD6RiJ7/ioyNNYlb9AtgPCt1DpUEcQI1JLgYDZmzcb8F1UTbv
 fjHcy6NCEQRZRnursXwyNWw9+ZksbfTUZqVSsGQ5drcfzkKojpz0cQCfrvb+NCOBLmiFD
 eNGhcMBjoLPQFZEqoty08BC4rP3PvnaCUaeOD7kqm39zEyb+MmiypJEXuabnLkWXTOQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=KLuUEmb8; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=KLuUEmb8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0210E80EC5
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915469;
 bh=tiGYiaD1RopmGdAod8tRP1dsx5iq7QlSLjuC7JeDVXs=;
 h=From:To:Subject:Date:From;
 b=KLuUEmb814M0zKUXTUkol2daqpcQ/oBwp5B6uiGP9/iIbSuyEZJJWxR40nE+yzyEy
 JYfn2HsZLv2WKqsyFjqIP7GXe5lhquCnX27eYt+VjNFv9vup8NYKvGTVN88sxM9XUo
 TE+yhOYTzrx7o3UKnnNZc0xIs41mOsWOdWwQJaX0B0Q0klJaNlykVNFJOICJuhUbOf
 trzfAwX2IT9hVWqtbcurC8R/5mPTlzKvVDSuZqpXNm/ArHokYVTMXu6VAF2lMcMwpJ
 j3Td31+opWv6w6BXrOJ50IBHEIL9ry85uDj3fVBFlZdIqOp9eqyVd8bYnah1uZ/xHd
 3z/4bUFe3nFSQ==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:zsStSPreE9ywW+c2FO6GRMl3psU/e7AKv23LSP6hxMexmtHOdcYcYnK725mSHTck7XSlTFuk7N5LbWc1dRAgZMtZg4bk/dwy4i77q9UeceGYxjx0Ith88rTQkkqghmk2xJlCJe6Z0rSM5/N9/0OLpjDeScLzpEWIQVBCnx3qSYhDevTNCeydervnZjP9nhNscqmqEzTr2JNvh3gQg1rZINZ0g7i/XD1Ha4BAS1e7jHXrzT0NJxo3gzjNdS9YJasrX0m+l0S4k+EtVzT802MnDzqxU6yuaDr2jriPXshdF1NMpMcaifZ2omyGCc+QgX/MXOCO1bQeLYuAmihuBTcIo//7gHmcL7rU/q0f5sIJQ6MjPUTrZZ/7R2mnlMOVjsBFMe4PNIJV/9aId8yJzmCfbCkscZYa5Z34AltdsD0T74b1v/0LFL2HTEGWHFgugcyCJgQgxKFyca1846ycBXrHwQi3j1bHFr2MyZpqJjWBYhGvHzZeQeWGb1iiqeytOiuS8qP33uzmqEo5Aj0DwWQ27qMUDj1+JHJgVRKGM1lUncIYOdTvmNo2W6tjhOC6N4Q=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 760A6A4C47BF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:44:29 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8ImK-000000000hB-3jeC
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:43:21 +0200
Message-ID: <20260920144428.3009612-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ---
Subject: [Buildroot] [PATCH v4 00/66] package/libopenssl: bump version to
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
0024-0065: upstream fixes for packages without a released version that
           provides compatibility with OpenSSL 4.x
           The luvi package needed to be bumped first so the upstream
           fix for OpenSSL 4.x could be applied
           The poco package needed the CMake patch from Yegor
0066:      bump libopenssl to 4.0.2

None of the patches 0001-0065 depend on the libopenssl bump, they all
build fine with libopenssl 3.6.2.

Regards, Bernd


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

Bernd Kuhls (65):
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
 176 files changed, 16973 insertions(+), 2187 deletions(-)
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
