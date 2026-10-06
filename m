Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F4ECA5FFC
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFA0A60784;
	Tue,  6 Oct 2026 16:25:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B6QRLREJTVrl; Tue,  6 Oct 2026 16:25:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 18F5E606C0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791303910;
	b=noaZQynsPFbp3RYBOSd0su2qfE5LyWhZGzfxIFNkUzZmwHTmFcAhnfE5RDMwLlKs5kUq
	 ZOOwAZijz/wYile3B10z+mBWZ0p4JRdue0S6nvgVclP/Ln5YQxTEuIwGzWsgcAae6uhqp
	 cQfa7xpYrRIVGSTyo5HyLpYWOAmJjVUkjGm4ZSyKu6ADkvHlPPMvRJx+m8gg+X++FJO0X
	 9L4FRCrZOipPw7Ux1fyXXsOZ3B4CnX7z54JOSYyVmU0jEbeZyBx8jVtqlLqWoDRJCTax3
	 PNtfnK2xlKGJqTxsZUQ7W4VQ2DKCI3CfXx3iOKFGtijxPRL3r7X0xoUEm4/sKr2NIDg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791303910;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WXUB0cH+hUrsAbXc/i6iYeiz3/YpWkz49hZwmoq7E7Q=;
	b=eDHH3VPc6SIzzi62LIorm7RshZhaCC2l0Dx9ZyN7BpT3ZwxVZC5ajiWRxZafkWuwLf3r
	 Fp99aJNI32PrI+DAnah3KpSY44hCuyMXbxUadl7QXS+hTRjUHWUIE4J0z4wPTU4tReOZ6
	 Vn6xRTHwfSGb82ln8M8l3NZd+KWFkeTg1OR9mcXeqKTXiRr0x6Eo4VR7ZHJM6lI1++nCK
	 IL8p7p+7Jo/PZpMfTtPxzJ8Z1UU4lksezt2WeD1Hp1mGwre4AUQ5WY5IT8Nv6hNjqPyNv
	 sEMoFvJFDoC35dNBZ1B9B8iK/+FfvIp4daodUB4R2I/+2ITZ1cOc+WsiLaiQ6hvpjRg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791303910;
	bh=WXUB0cH+hUrsAbXc/i6iYeiz3/YpWkz49hZwmoq7E7Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=phq99AgVZM/uli6DU1TswlAG0I96YMQkAJZEDMfi1KpAL3ULVt9JWsbYggxgbsrS1
	 brUy5mS2+eaM+ctVfB9FpzvSwQZlNyuDQJ4zDH8PdW2nfbgIk6bU4Ilv8/eEcUI4ev
	 vyDT5JuqSVnSd8BkdVLdELgm+eweLwcb9yNCtGp066O9Xuy5qzNcPKQcOlvMjaRPb0
	 i37orq6+nrJRZewkP3aum3ZD8bgHzBOE/WM9x7Re/njKO9Sa/wuMMwIlb+zfXDueYJ
	 4iOgKKs/AtTweOGH/jOEusX3nhHIGf4gogtrVSCMaKrp5mJj6s361qqDlurTVhyyjd
	 oWf8gZFpIexvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18F5E606C0;
	Tue,  6 Oct 2026 16:25:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 96A6434E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CBF3405AB
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:21:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6wj2VK8ryUUg for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:21:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DBE70405A7
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791303673;
 b=RAc+Nbk1xCtukkafxuxO5icyYJ0IpfDe+qpmCV7VGBPkbvPaIjgKNk1z+IrB9ad7ewDM
 zb6W7m2USTtE9e8XZ/LhciCN6Dq7o7LXRXbtgIWCA+NBMwKdc2vTouTCzeOVhC0jO+Ukj
 hV+lOVkLTOurIW0O6aDsp+x7AO9ig6MjVvQeFrLjpPcM+i3kb4LkymVPUU3pr3ZUdOQwd
 HYzXMwJJhuRG6Ast2JlZvpCJGo2Wt3pegyaMxIct8RCx+QqQIvyl9a/RbW0tnZkqAYqBC
 o6i3n4RKxsU4gMwsK2uaHmcnSrsP1g1nraWc3W9fChybi1NB08gBpo/7NgAIY0rIK0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791303673;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=OpWqJJJ1v39242HLRQHNv9coUbtKNr+DnQ5MJFRkoyU=;
 b=gh0Zoyl2WYPGl9uIUTe1tipFbLBVWFRyVO++6GY/jFqLCb/LApVydA24f5RvKIisIhqp
 60blta5sKMU7rTq5tZfme/nSuvgBPf8WYWXytt/sqbn+JK3l8E+DpNQ59ptlra1ew3N/H
 wtsZE6Ej49nDY/thJmlbrjDf+oLvwtsTzOLKYA25GIi5y4MpNHUE09y9tBB4pI2e41lIE
 GMLp2aa5urHHEx6LlWJJhuXBqyMgDSNDpmIShzu8YkrJt3SJudeDaCajBDM+wtxpSyweG
 7p5h1wwT+FDG7lZZ0rbX9AzXBe4Z7rNqq9LnXbwmimL47l0dqHBXJzFOoFbuf+osRag==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=qrSdaNSD; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=qrSdaNSD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBE70405A7
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303667;
 bh=OpWqJJJ1v39242HLRQHNv9coUbtKNr+DnQ5MJFRkoyU=;
 h=From:To:Subject:Date:From;
 b=qrSdaNSDGwws34JhYHTJj1CvOUUaLmNLC8JNx6sFg7Golf3TyQrG5hrV2gWzXyUkf
 dOoFvH4wNtMUxdofQJwiHDUol0JA1WtJaFHXUkVGF36tqzLK0elBjEMmSb27/BnWFV
 KTv/mkxqN1ylPDjgeuHQY0PkOmW/xpH/x7hRtTmUXrOIxhLkIiZDTHkLNnbX8P4d7A
 eXpBS8kPjr2Ifkq0ZKsE5q2VAWSS49lTnOyywmN+PRqx3dup6emJ+mLhj9sfCAsZAB
 aa1zUO/l1uY6CbKQOrHS2T1vq++BX+GnYRLuvIDD/VbLrOf6Knqlx1mL+8yIdwud8d
 kFm8CqAyqypsw==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 s0BPlr+1SaCIC8xyC6++wegnqbMOVnOU85EIus2gtHSwoMN9mZo7yiPm9RBGjJ/stLxUN9iSzrs
 24bdQXr5nbpnltlWO2X1fXJWQ35h/PK1tgSR/ZtAWCRbd1LD2/sHgsVQDOKnCfu8Vx+8q0iphw8
 9aIZBHfjCylvOabMX17FofYPXlqLKJgr/LzvoFpLhlcX/JseRjZnJsEabKTn0qV2vsxa84TgQRz
 A4I4pUzlO54HD3tE5TLlvJC4qxIvaLdSUeLCvn/cOPg4OYR4s1v12xowwONqbM1ACwrgIwzMWqQ
 Cmtnv+frLEeqgQQuyNSvXtPwLaxzejag8aIZUr+k5ZHH92L2q/sMK38Udkp6MzcCTf3khUG3blj
 /vfHdu4rgyBZhUjbJrP0M5HkJIFYGd0mzYghpYv5Q7PRON4pCQNZ1QAV+TB704q18cytd7DQQ7T
 +Nzt/TOfBecRmOgAb/vuO40XmteDSxdXEjDXbomCnoMbP9ymJBW2w0oBRpdUBwhZA0OeOcd4Dlg
 b3NE6zZxNFAdiDBcC1guS0Qx45sZcpXGxUmEvdmY84Sj2gtnzw=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 64302A4C432D
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uc-000000000ir-3dl8
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:19:41 +0200
Message-ID: <20261006162106.3439373-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ---
Subject: [Buildroot] [PATCH v8 00/84] Bump libopenssl, python3, kodi, ffmpeg
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

this series bumps libopenssl to version 4.0.3 and ffmpeg to 9.0.2.
It also includes as RFC the bumps of python3 to 3.15.0rc3 and kodi to
22.0rc1.

The decision to remove the 9000+ lines long patch to build python3
3.14.8 with libopenssl 4.0.3 was made due to the many bumps to python
packages in preparation for the upcoming release of python 3.15.0.
The series was tested with all patches James sent but were not yet
applied to buildroot.

Please be aware of the following depencies:
The current kodi version 21.3 is incompatible with python 3.15 and no
updates to this kodi version are expected, kodi tagged 22.0rc1 last week
which adds compatibility with python 3.15 but also needs a newer ffmpeg
version which in turn needs some fixes for current packages.

This series consists of the following parts:

0001-0003: package removals
0004-0056: - version bumps that provide compatibility with OpenSSL 4.x
           - upstream fixes for packages without a released version that
             provides compatibility with OpenSSL 4.x
           0006-0021 belong to the boost patch series
           The luvi package needs to be bumped first so the upstream fix
           for OpenSSL 4.x can be applied

Until here this is the latest version of the libopenssl bump series.
None of the patches 0001-0056 depend on the libopenssl bump, they all
build fine with libopenssl 3.6.x.

0057-0060: build fixes for ffmpeg 9.0.2

None of the patches 0057-0060 depend on the ffmpeg bump.

The following changes will break bisectability...

0061-0062: bump python3 to 3.15.0rc3 (RFC)
           This bump depends on the ncurses fix
           This bump will break kodi 21.3

0063:      bump libopenssl to 4.0.3
           Due to the python3 bump no new breakages are expected

0064-0065: bump ffmpeg to 9.0.2
           libcamera-apps 1.10.1 is incompatible with our current ffmpeg
           version, to reduce the impact on bisectability we bump it
           right before the ffmpeg bump
           This bump will add a further breakage to kodi 21.3

0066-0068: version bumps to prepare the kodi bump
           These bump are incompatible with our current kodi version

0069-0084: bump kodi to 22.0rc1-Piers (RFC)

Regards, Bernd


v8:
- rebased
- changed libopenssl fix for freeswitch to upstream patches instead of
  tweaking autoconf variables
- replaced libopenssl fix for python 3.14.8 with bump to 3.15.0rc3
- added kodi & ffmpeg bumps to series

v7:
- rebased
- added output of 'utils/get-developers --cc' to individual patches to
  avoid sending the whole series to all devs (Thomas)
- bumped libopenssl to 4.0.3
- removed qt6/qt6opcua as well (to-do from v3)
- please note that this series depends on the security bump of
  libopenssl to 3.6.5:
  https://patchwork.buildroot.org/project/buildroot/patch/20260929175300.1838821-1-bernd-NSqj7jyE675eoWH0uzbU5w@public.gmane.org/

v6:
- rebased
- created PR for package/squid/0001*.patch
- added OpenSSL fix for mender-artifact
- added Michael's boost series:
  https://lists.buildroot.org/pipermail/buildroot/2026-September/810503.html

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

v2:
- squashed BR2_TOOLCHAIN_HAS_GCC_BUG_101916 removal into
  heirloom-mailx removal patch
- added qt6 bump which also fixes build with OpenSSL 4.0


Bernd Kuhls (69):
  package/qt5/qt5knx: remove package
  package/qt5/qt5opcua: remove package
  package/qt6/qt6opcua: remove package
  package/domoticz: bump version to 2026.3
  package/libtorrent-rasterbar: bump version to 2.1.1
  package/boost: bump version to 1.92.0
  package/openvmtools: bump version to 13.1.0
  package/poco: bump version to 1.15.3
  package/snort3: fix build error with numa support
  package/snort3: Fix build with OpenSSL 4.0.0
  package/xtables-addons: use kernel-module infra
  package/xtables-addons: bump version to 3.31
  package/boinc: Fix build with OpenSSL 4.0.0
  package/clamav: Fix build with OpenSSL 4.0.0
  package/freeradius-server: Add support for OpenSSL 4.0.0
  package/freeswitch: Add support for OpenSSL 4.0.0
  package/ibm-sw-tpm2: Fix build with OpenSSL 4.{0, 1}
  package/ibrdtnd: Fix build with OpenSSL 4.0.0
  package/lftp: Add support for OpenSSL 4.0.0
  package/libesmtp: Fix build with OpenSSL 4.0.0
  package/libkrb5: Add support for OpenSSL 4.0.0
  package/luvi: fix build without c++
  package/luvi: bump version to 102-g9fa6c141a
  package/luvi: Fix build with OpenSSL 4.0.0
  package/mender-artifact: Fix build with OpenSSL 4.0.0
  package/perl-net-ssleay: Add support for OpenSSL 4.0.0
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
  package/tpm2-openssl: Fix build with OpenSSL 4.0.0
  package/trousers: Fix build with OpenSSL 4.0.0
  package/uboot-tools: Fix build with OpenSSL 4.0.0
  package/xmrig: Add support for OpenSSL 4.0.0
  package/znc: Fix build with OpenSSL 4.0.0
  package/freeswitch: fix build with ffmpeg 8.x
  package/gstreamer1/gst1-libav: fix build with ffmpeg 9.x
  package/opencv4: fix build with ffmpeg 9.x
  package/shairport-sync: fix build with ffmpeg 9.x
  package/ncurses: install wide-char headers in usr/include/ncursesw/
  package/python3: bump version to 3.15.0rc3
  package/libopenssl: bump version to 4.0.3
  package/libcamera-apps: bump version to 1.10.1
  package/ffmpeg: bump version to 9.0.2
  package/libcec: bump version to 8.1.7
  package/libplatform: remove package
  package/bento4: bump version to 1.6.0-641-6-Piers
  package/kodi: bump to 22.0rc1-Piers
  package/kodi-audiodecoder-*: mass version bump to Piers
  package/kodi-audioencoder-*: mass version bump to Piers
  package/kodi-imagedecoder-*: mass version bump to Piers
  package/kodi-inputstream-*: mass version bump to Piers
  package/kodi-peripheral-*: mass version bump to Piers
  package/kodi-pvr-hts: bump version to 22.9.2-Piers
  package/kodi-pvr-plutotv: bump version to 22.3.1-Piers
  package/kodi-pvr-waipu: bump version to 22.10.0-Piers
  package/kodi-pvr-zattoo: bump version to 22.2.3-Piers
  package/kodi-pvr-*: mass version bump to Piers
  package/kodi-screensaver-rsxs: bump version to 22.0.5-Piers
  package/kodi-screensaver-*: mass version bump to Piers
  package/kodi-skin-confluence: bump version
  package/kodi-vfs-*: mass version bump to Piers
  package/kodi-visualisation-*: mass version bump to Piers

Michael Nosthoff (15):
  package/boost: add new charconv and cobalt library
  package/boost: add switch for boost-process
  package/boost: program_options needs container
  package/boost: thread needs more dependencies
  package/boost: contract needs thread
  package/boost: fix coroutine dependencies
  package/boost: fiber needs exception
  package/boost: update graph dependencies
  package/boost: math needs container
  package/boost: log needs serialization
  package/boost: test needs exception
  package/boost: wave needs thread
  package/boost: update locale dependencies
  package/boost: update C++ version dependencies
  package/boost: system: update description

 .checkpackageignore                           |   13 +-
 Config.in.legacy                              |   64 +
 DEVELOPERS                                    |    4 -
 package/Config.in                             |    1 -
 package/apr-util/Config.in                    |    1 -
 package/bento4/bento4.hash                    |    2 +-
 package/bento4/bento4.mk                      |    4 +-
 ...fix-a-build-failure-with-openssl-4.0.patch |   26 +
 ...xit_code-guard-static_asserts-on-MIP.patch |   59 +
 .../0001-unordered-fix-copy-assign.patch      |   22 -
 ...-for-duplicate-definition-of-SIGLOST.patch |   30 +
 package/boost/0003-Fix-build.patch            |   39 +
 package/boost/0004-Fix-build.patch            |   40 +
 package/boost/0005-Fix-build.patch            |   64 +
 package/boost/Config.in                       |  190 +-
 package/boost/boost.hash                      |    4 +-
 package/boost/boost.mk                        |   10 +-
 ...-crypto-Remove-cl_ASN1_GetTimeT-1731.patch |  136 +
 package/domoticz/Config.in                    |    7 +-
 package/domoticz/domoticz.hash                |    3 +-
 package/domoticz/domoticz.mk                  |   27 +-
 package/dovecot/Config.in                     |    1 -
 ...-x86-yuv2rgb-Fix-build-without-SSSE3.patch |   24 +-
 ...264-skip-decode-if-pic-has-no-slices.patch |   13 +-
 .../0003-libavutil-Fix-mips-build.patch       |   17 +-
 ...igure-add-extralibs-to-extralibs_xxx.patch |   14 +-
 ...0005-avcodec-mmaldec-Fix-build-error.patch |   32 -
 ...ay-dvd-Use-correct-pointer-types-on-.patch |   52 -
 ...hwcontext-vaapi-use-the-correct-type.patch |   28 -
 package/ffmpeg/ffmpeg.hash                    |    4 +-
 package/ffmpeg/ffmpeg.mk                      |   15 +-
 package/ffmpeg/libpostproc-0001.diff          | 9833 +++++++++++++++++
 package/fluent-bit/Config.in                  |    1 -
 ...ING-functions-for-OpenSSL-4.0-compat.patch |   80 +
 ...robe-TLS_method-to-detect-libssl-Ope.patch |   38 +
 ...tem-Fix-build-against-OpenSSL-4-3185.patch |   67 +
 ...elated-to-signalwire-freeswitch-2202.patch |  103 +
 package/freeswitch/freeswitch.mk              |    3 +
 ...av-Fix-build-failure-with-FFmpeg-9.0.patch |   72 +
 .../0002-tpm-Update-to-OpenSSL-4.1.patch      |   28 +
 ...ateManager.cpp-fix-build-with-OpenSS.patch |   41 +
 .../kodi-audiodecoder-modplug.hash            |    2 +-
 .../kodi-audiodecoder-modplug.mk              |    2 +-
 .../kodi-audiodecoder-nosefart.hash           |    2 +-
 .../kodi-audiodecoder-nosefart.mk             |    2 +-
 .../kodi-audiodecoder-sidplay.hash            |    2 +-
 .../kodi-audiodecoder-sidplay.mk              |    2 +-
 .../kodi-audiodecoder-snesapu.hash            |    2 +-
 .../kodi-audiodecoder-snesapu.mk              |    2 +-
 .../kodi-audiodecoder-stsound.hash            |    2 +-
 .../kodi-audiodecoder-stsound.mk              |    2 +-
 .../kodi-audiodecoder-timidity.hash           |    2 +-
 .../kodi-audiodecoder-timidity.mk             |    2 +-
 .../kodi-audiodecoder-vgmstream.hash          |    2 +-
 .../kodi-audiodecoder-vgmstream.mk            |    2 +-
 .../kodi-audioencoder-flac.hash               |    2 +-
 .../kodi-audioencoder-flac.mk                 |    2 +-
 .../kodi-audioencoder-lame.hash               |    2 +-
 .../kodi-audioencoder-lame.mk                 |    2 +-
 .../kodi-audioencoder-vorbis.hash             |    2 +-
 .../kodi-audioencoder-vorbis.mk               |    2 +-
 .../kodi-audioencoder-wav.hash                |    2 +-
 .../kodi-audioencoder-wav.mk                  |    2 +-
 .../kodi-imagedecoder-heif.hash               |    2 +-
 .../kodi-imagedecoder-heif.mk                 |    2 +-
 .../kodi-imagedecoder-raw.hash                |    2 +-
 .../kodi-imagedecoder-raw.mk                  |    2 +-
 .../kodi-inputstream-adaptive.hash            |    2 +-
 .../kodi-inputstream-adaptive.mk              |    2 +-
 .../kodi-inputstream-ffmpegdirect.hash        |    2 +-
 .../kodi-inputstream-ffmpegdirect.mk          |    2 +-
 .../kodi-inputstream-rtmp.hash                |    2 +-
 .../kodi-inputstream-rtmp.mk                  |    2 +-
 .../kodi-jsonschemabuilder.mk                 |    2 +-
 .../kodi-peripheral-joystick.hash             |    2 +-
 .../kodi-peripheral-joystick.mk               |    2 +-
 .../kodi-peripheral-xarcade.hash              |    2 +-
 .../kodi-peripheral-xarcade.mk                |    2 +-
 .../kodi-pvr-argustv/kodi-pvr-argustv.hash    |    2 +-
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk  |    2 +-
 .../kodi-pvr-dvblink/kodi-pvr-dvblink.hash    |    2 +-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk  |    2 +-
 .../kodi-pvr-dvbviewer.hash                   |    2 +-
 .../kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk  |    2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.hash  |    2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk    |    2 +-
 package/kodi-pvr-hts/0001-gcc15.patch         |   26 -
 package/kodi-pvr-hts/kodi-pvr-hts.hash        |    2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk          |    2 +-
 .../kodi-pvr-iptvsimple.hash                  |    2 +-
 .../kodi-pvr-iptvsimple.mk                    |    2 +-
 .../kodi-pvr-mediaportal-tvserver.hash        |    2 +-
 .../kodi-pvr-mediaportal-tvserver.mk          |    2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash  |    2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk    |    2 +-
 .../kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash    |    2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk  |    2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.hash      |    2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.mk        |    2 +-
 .../kodi-pvr-octonet/kodi-pvr-octonet.hash    |    2 +-
 package/kodi-pvr-octonet/kodi-pvr-octonet.mk  |    2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.hash      |    2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk        |    2 +-
 package/kodi-pvr-plutotv/Config.in            |    2 +-
 .../kodi-pvr-plutotv/kodi-pvr-plutotv.hash    |    2 +-
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk  |    4 +-
 .../kodi-pvr-stalker/kodi-pvr-stalker.hash    |    2 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk  |    2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.hash      |    2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk        |    2 +-
 .../kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash  |    2 +-
 .../kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk    |    2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash  |    2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk    |    2 +-
 package/kodi-pvr-waipu/Config.in              |    2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash    |    2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk      |    4 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.hash        |    2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk          |    2 +-
 package/kodi-pvr-zattoo/Config.in             |    2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash  |    2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk    |    4 +-
 .../kodi-screensaver-asteroids.hash           |    2 +-
 .../kodi-screensaver-asteroids.mk             |    2 +-
 .../kodi-screensaver-asterwave.hash           |    2 +-
 .../kodi-screensaver-asterwave.mk             |    2 +-
 .../kodi-screensaver-biogenesis.hash          |    2 +-
 .../kodi-screensaver-biogenesis.mk            |    2 +-
 .../kodi-screensaver-cpblobs.hash             |    2 +-
 .../kodi-screensaver-cpblobs.mk               |    2 +-
 .../kodi-screensaver-greynetic.hash           |    2 +-
 .../kodi-screensaver-greynetic.mk             |    2 +-
 .../kodi-screensaver-matrixtrails.hash        |    2 +-
 .../kodi-screensaver-matrixtrails.mk          |    2 +-
 .../kodi-screensaver-pingpong.hash            |    2 +-
 .../kodi-screensaver-pingpong.mk              |    2 +-
 .../kodi-screensaver-pyro.hash                |    2 +-
 .../kodi-screensaver-pyro.mk                  |    2 +-
 .../0001-Fix-build-with-CMake-4.x.patch       |  346 -
 .../kodi-screensaver-rsxs.hash                |    2 +-
 .../kodi-screensaver-rsxs.mk                  |    2 +-
 .../kodi-screensaver-stars.hash               |    2 +-
 .../kodi-screensaver-stars.mk                 |    2 +-
 .../kodi-skin-confluence.hash                 |    2 +-
 .../kodi-skin-confluence.mk                   |    2 +-
 ...rePacker-allow-build-with-giflib-6.x.patch |   71 -
 .../kodi-texturepacker/kodi-texturepacker.mk  |    3 +-
 .../kodi-vfs-libarchive.hash                  |    2 +-
 .../kodi-vfs-libarchive.mk                    |    2 +-
 package/kodi-vfs-rar/kodi-vfs-rar.hash        |    2 +-
 package/kodi-vfs-rar/kodi-vfs-rar.mk          |    2 +-
 package/kodi-vfs-sftp/kodi-vfs-sftp.hash      |    2 +-
 package/kodi-vfs-sftp/kodi-vfs-sftp.mk        |    2 +-
 .../kodi-visualisation-fishbmc.hash           |    2 +-
 .../kodi-visualisation-fishbmc.mk             |    2 +-
 .../kodi-visualisation-goom.hash              |    2 +-
 .../kodi-visualisation-goom.mk                |    2 +-
 .../kodi-visualisation-matrix.hash            |    2 +-
 .../kodi-visualisation-matrix.mk              |    2 +-
 .../kodi-visualisation-shadertoy.hash         |    2 +-
 .../kodi-visualisation-shadertoy.mk           |    2 +-
 .../kodi-visualisation-spectrum.hash          |    2 +-
 .../kodi-visualisation-spectrum.mk            |    2 +-
 .../kodi-visualisation-starburst.hash         |    2 +-
 .../kodi-visualisation-starburst.mk           |    2 +-
 .../kodi-visualisation-waveform.hash          |    2 +-
 .../kodi-visualisation-waveform.mk            |    2 +-
 ...rePacker-allow-build-with-giflib-6.x.patch |   71 -
 .../0003-RegExp-remove-unused-methods.patch   |  127 -
 .../0004-Introduce-PCRE2-dependency.patch     |  192 -
 ...igrate-PCRE-to-PCRE2-and-remove-PCRE.patch |  486 -
 ...006-cmake-Set-ARCH-to-CPU-by-default.patch |   41 -
 package/kodi/Config.in                        |    8 +-
 package/kodi/kodi.hash                        |   15 +-
 package/kodi/kodi.mk                          |   52 +-
 .../0002-allow-build-with-OpenSSL-4.x.patch   |   56 +
 ...ore-Switch-libcamera-string-controls.patch |   46 -
 package/libcamera-apps/libcamera-apps.hash    |    3 +-
 package/libcamera-apps/libcamera-apps.mk      |    5 +-
 ...DeviceLanguage-accepts-3-char-ISO-co.patch |   66 -
 ...Python-wrapper-against-SWIG-4.5-whic.patch |   78 -
 package/libcec/Config.in                      |    1 -
 package/libcec/libcec.hash                    |    4 +-
 package/libcec/libcec.mk                      |    4 +-
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
 package/libp11/libp11.mk                      |    3 +-
 package/libplatform/Config.in                 |    7 -
 package/libplatform/libplatform.hash          |    3 -
 package/libplatform/libplatform.mk            |   13 -
 package/librelp/Config.in                     |    1 -
 package/libssh/Config.in                      |    1 -
 .../0001-fix-more-c-17-that-made-it-in.patch  |   53 +
 package/libtorrent-rasterbar/Config.in        |    8 +-
 .../libtorrent-rasterbar.hash                 |    5 +-
 .../libtorrent-rasterbar.mk                   |   22 +-
 package/log4cxx/Config.in                     |    5 +
 ...eLists.txt-only-require-a-C-compiler.patch |   48 +
 ...ly-disable-GCC-diagnostics-in-ocsp.c.patch |   80 -
 ...isable-Wincompatible-pointer-types-f.patch |   54 -
 .../luvi/0002-feat-support-openssl-4.0.patch  |  403 +
 package/luvi/Config.in                        |    1 -
 package/luvi/luvi.hash                        |    2 +-
 package/luvi/luvi.mk                          |    2 +-
 .../0001-openssl-v4-update.patch              |  180 +
 package/mender/Config.in                      |    1 -
 package/mtd/Config.in                         |    1 -
 package/ncurses/ncurses.mk                    |    7 +
 ...FFmpeg-after-AVCodec-pix_fmts-remova.patch |   58 +
 ...se-avcodec_get_supported_config-for-.patch |   76 +
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
 package/poco/poco.hash                        |    2 +-
 package/poco/poco.mk                          |    2 +-
 package/python-libconfig/Config.in            |    5 +-
 ...e-the-build-of-pyc-files-conditional.patch |   14 +-
 .../0002-Add-an-option-to-disable-pydoc.patch |   24 +-
 .../0003-Add-an-option-to-disable-IDLE.patch  |   18 +-
 ...move-PY_STDLIB_MOD_SET_NA-further-up.patch |    8 +-
 ...option-to-disable-the-sqlite3-module.patch |   16 +-
 ...d-an-option-to-disable-the-tk-module.patch |   18 +-
 ...-option-to-disable-the-curses-module.patch |   14 +-
 .../0008-Add-an-option-to-disable-expat.patch |   14 +-
 ...ac-detect-unusable-termio-operations.patch |   16 +-
 ...mpilation-of-Modules-_remote_debuggi.patch |   55 -
 package/python3/python3.hash                  |    4 +-
 package/python3/python3.mk                    |    6 +-
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
 package/qt6/Config.in                         |    1 -
 package/qt6/qt6opcua/Config.in                |   14 -
 package/qt6/qt6opcua/qt6opcua.hash            |   10 -
 package/qt6/qt6opcua/qt6opcua.mk              |   40 -
 ...N1_STRING_get0_data-and-ASN1_STRING_.patch |   48 +
 package/rauc/Config.in                        |    2 -
 package/rauc/rauc.mk                          |    3 +-
 ...emove-Werror-deprecated-declarations.patch |   28 +
 package/resiprocate/Config.in                 |    4 +
 ...lution-code-1-to-be-multithreaded-2-.patch |   76 +
 .../0001-Rename-numa.h-to-numa_snort.h.patch  |   79 +
 ...fix-const-qualifiers-for-OpenSSL-4.0.patch |   63 +
 ...penSSL-4.0-use-ASN1_STRING-accessors.patch |   35 +
 ...001-Fix-build-error-with-OpenSSL-4.0.patch |   42 +
 ...mory-leak-in-OSSL-byteString2oid-863.patch |   49 +
 ...in-EdDSA-PrintableString-handling-85.patch |   98 +
 package/softhsm2/Config.in                    |    1 -
 .../0001-Fix-OpenSSL-4.0-compatibility.patch  |  368 +
 ...-for-getting-an-ASN1_STRING-s-length.patch |   46 +
 ...compilation-with-openssl-4.0.0-beta1.patch |   86 +
 ...TRING-and-X509_NAME-access-for-OpenS.patch |   87 +
 package/trousers/0004-openssl4.patch          |   26 +
 ...se-the-new-lavc-supported-config-API.patch |   99 +
 ...Add-support-for-OpenSSL-Provider-API.patch |  304 +
 package/unbound/Config.in                     |    1 -
 package/unbound/unbound.mk                    |    1 +
 .../0001-Fix-build-with-OpenSSL-4.0.0.patch   |   40 +
 package/xtables-addons/Config.in              |    2 +-
 package/xtables-addons/xtables-addons.hash    |    2 +-
 package/xtables-addons/xtables-addons.mk      |    9 +-
 package/zmqpp/Config.in                       |    5 +-
 ...-Fix-build-error-with-OpenSSL-4-2024.patch |   57 +
 304 files changed, 15996 insertions(+), 3957 deletions(-)
 create mode 100644 package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch
 create mode 100644 package/boost/0001-fix-process-v2-exit_code-guard-static_asserts-on-MIP.patch
 delete mode 100644 package/boost/0001-unordered-fix-copy-assign.patch
 create mode 100644 package/boost/0002-Add-check-for-duplicate-definition-of-SIGLOST.patch
 create mode 100644 package/boost/0003-Fix-build.patch
 create mode 100644 package/boost/0004-Fix-build.patch
 create mode 100644 package/boost/0005-Fix-build.patch
 create mode 100644 package/clamav/0001-libclamav-crypto-Remove-cl_ASN1_GetTimeT-1731.patch
 delete mode 100644 package/ffmpeg/0005-avcodec-mmaldec-Fix-build-error.patch
 delete mode 100644 package/ffmpeg/0006-avcodec-pcm-bluray-dvd-Use-correct-pointer-types-on-.patch
 delete mode 100644 package/ffmpeg/0007-avutil-hwcontext-vaapi-use-the-correct-type.patch
 create mode 100644 package/ffmpeg/libpostproc-0001.diff
 create mode 100644 package/freeradius-server/0009-Use-ASN1_STRING-functions-for-OpenSSL-4.0-compat.patch
 create mode 100644 package/freeswitch/0004-sac-openssl.m4-probe-TLS_method-to-detect-libssl-Ope.patch
 create mode 100644 package/freeswitch/0005-Build-System-Fix-build-against-OpenSSL-4-3185.patch
 create mode 100644 package/freeswitch/0006-Fixes-related-to-signalwire-freeswitch-2202.patch
 create mode 100644 package/gstreamer1/gst1-libav/0001-gst-libav-Fix-build-failure-with-FFmpeg-9.0.patch
 create mode 100644 package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch
 create mode 100644 package/ibrdtnd/0003-SecurityCertificateManager.cpp-fix-build-with-OpenSS.patch
 delete mode 100644 package/kodi-pvr-hts/0001-gcc15.patch
 delete mode 100644 package/kodi-screensaver-rsxs/0001-Fix-build-with-CMake-4.x.patch
 delete mode 100644 package/kodi-texturepacker/0001-TexturePacker-allow-build-with-giflib-6.x.patch
 delete mode 100644 package/kodi/0002-TexturePacker-allow-build-with-giflib-6.x.patch
 delete mode 100644 package/kodi/0003-RegExp-remove-unused-methods.patch
 delete mode 100644 package/kodi/0004-Introduce-PCRE2-dependency.patch
 delete mode 100644 package/kodi/0005-Migrate-PCRE-to-PCRE2-and-remove-PCRE.patch
 delete mode 100644 package/kodi/0006-cmake-Set-ARCH-to-CPU-by-default.patch
 create mode 100644 package/lftp/0002-allow-build-with-OpenSSL-4.x.patch
 delete mode 100644 package/libcamera-apps/0002-core-Switch-libcamera-string-controls.patch
 delete mode 100644 package/libcec/0001-fixed-Python-strDeviceLanguage-accepts-3-char-ISO-co.patch
 delete mode 100644 package/libcec/0002-fixed-build-the-Python-wrapper-against-SWIG-4.5-whic.patch
 create mode 100644 package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch
 create mode 100644 package/libkrb5/0002-Use-X509_check_host-to-verify-KKDCP-server-cert.patch
 create mode 100644 package/libkrb5/0003-Improve-future-OpenSSL-compatibility.patch
 delete mode 100644 package/libplatform/Config.in
 delete mode 100644 package/libplatform/libplatform.hash
 delete mode 100644 package/libplatform/libplatform.mk
 create mode 100644 package/libtorrent-rasterbar/0001-fix-more-c-17-that-made-it-in.patch
 create mode 100644 package/luvi/0001-CMakeLists.txt-only-require-a-C-compiler.patch
 delete mode 100644 package/luvi/0001-Selectively-disable-GCC-diagnostics-in-ocsp.c.patch
 delete mode 100644 package/luvi/0002-CMakeLists.txt-disable-Wincompatible-pointer-types-f.patch
 create mode 100644 package/luvi/0002-feat-support-openssl-4.0.patch
 create mode 100644 package/mender-artifact/0001-openssl-v4-update.patch
 create mode 100644 package/opencv4/0001-videoio-support-FFmpeg-after-AVCodec-pix_fmts-remova.patch
 create mode 100644 package/opencv4/0002-videoio-ffmpeg-use-avcodec_get_supported_config-for-.patch
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
 delete mode 100644 package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
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
 delete mode 100644 package/qt6/qt6opcua/Config.in
 delete mode 100644 package/qt6/qt6opcua/qt6opcua.hash
 delete mode 100644 package/qt6/qt6opcua/qt6opcua.mk
 create mode 100644 package/rauc/0001-signature-use-ASN1_STRING_get0_data-and-ASN1_STRING_.patch
 create mode 100644 package/redis/0004-Remove-Werror-deprecated-declarations.patch
 create mode 100644 package/shairport-sync/0001-Update-the-convolution-code-1-to-be-multithreaded-2-.patch
 create mode 100644 package/snort3/0001-Rename-numa.h-to-numa_snort.h.patch
 create mode 100644 package/snort3/0002-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch
 create mode 100644 package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
 create mode 100644 package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch
 create mode 100644 package/softhsm2/0001-Fix-the-memory-leak-in-OSSL-byteString2oid-863.patch
 create mode 100644 package/softhsm2/0002-Fix-memory-leak-in-EdDSA-PrintableString-handling-85.patch
 create mode 100644 package/squid/0001-Fix-OpenSSL-4.0-compatibility.patch
 create mode 100644 package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch
 create mode 100644 package/systemd/0001-various-fix-compilation-with-openssl-4.0.0-beta1.patch
 create mode 100644 package/tpm2-openssl/0001-Fix-ASN1_OCTET_STRING-and-X509_NAME-access-for-OpenS.patch
 create mode 100644 package/trousers/0004-openssl4.patch
 create mode 100644 package/tvheadend/0002-transcoding-use-the-new-lavc-supported-config-API.patch
 create mode 100644 package/uboot-tools/0003-Add-support-for-OpenSSL-Provider-API.patch
 create mode 100644 package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch
 create mode 100644 package/znc/0001-Fix-build-error-with-OpenSSL-4-2024.patch

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
