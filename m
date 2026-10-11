Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E62CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD6FC40581;
	Sun, 11 Oct 2026 13:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fdz-V1-wFrfS; Sun, 11 Oct 2026 13:01:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 81DDC40585
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791723668;
	b=IjecwQfVrIK2cwsRfWkO9gCquRoBxrXC20WirATzUn6cYXn0FnLgP0Yd4lozo2X+S8w5
	 bcuImMdw1Lat2WmCElel16uHJD9fdmw38OhhjB95rYWucNE/4iboBebLBHgPsczjRsV/a
	 ayFIZCmBC+qe9E+sKgZZ/wRZxopKyHUVwCMW8DgRCCz9esKBuBZPAT0DqxZWg67WevVUT
	 bkzN844my6e8AGOSpoKFZn+2ZKcIb9lMO7Ym/bGuj3HVYATDmmxtliizsEN4707D3meTF
	 86tAILFIeaqDIIMqSTfkQUngJn21nOjxfpd3IhMovRWJqNTzq1CCJewcU5rRFsaskgQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791723668;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=diiygodyNMo6vdLYGb8SyYS/DO9sI+YGZcSioooNRUc=;
	b=JAXwxz7TjBARSlGxTkyFfuH0r4TVVg9vYC0FH9YPGktWXeETPEn2IzUpmV00wExHWUwB
	 +VHa2pUkP5FgOxuv6bgpQJOPde/QdstiAF9p2A0ppzbDwVkl8jJRluLl+JZekliVhMSAZ
	 nvcWZgNcfZuFVTW7xBO578n3iPKAVBRDGMAddT4KLIE05zBh17sJGTtOLdDHQEzw9Gt8c
	 c5UBEKkc7Y8Rfr68KDC7xVCSJwka9e9SCxTQA8+QggFWbBZKU++vTtvywiDFrZ39rOosF
	 NM5VnwahTmZbJ/ZMbqDg7DbOSMAScjnDBYmxkDg8b7pvHfzkpV6mfFh0k4jbvDLmC0A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791723668;
	bh=diiygodyNMo6vdLYGb8SyYS/DO9sI+YGZcSioooNRUc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MfJIaOyI12+u/pCQypkbLEIPsX1YPpir1o1v5KcKpl8wC0OenjTvnyb5QWMiVrOne
	 i3JybndTH+NBPLuSr+dp7jx9Ze0iNRlKNJVBOidpWi6Y0xnItBuGl3uEmfOssGFdBl
	 y4QUXtDPG8sn3lxK01SJzaJp8rQW6WNRdGgII6klSxdapJdh+DzPg11jAKVpw67VtS
	 HW5HkoDkm9z9WKXNP0w/5Il8cpNcrwvTK6LJbzYn7fqxpgtTEXZ2OmLH7TNdYdhhJs
	 Xgcz4Tbu1J0XXnRQk4tjF8k/O4/hiLjQU/EciHwrojirZwsWqCuuAt0xuDVoEOObCB
	 yVMf/DmyPizPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81DDC40585;
	Sun, 11 Oct 2026 13:01:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A6508111
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A26C880C84
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Od_OocIZwEov for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:01:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 76EE680C7E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791723665;
 b=cuvPYsUaS3WL8hJ/laiOdyRmHbgtelETzqbcvnHAsoE8O7rpYl0H8i5C7/d7dbnyhi50
 /GYwzKLUSF5e5MFAleATOJ9RrBcmBJE57J44nPkprykUHpX4HOjeHgOCACUzv/QskSczI
 g5sAzzscsYX5yFYrGk5iy5cbrMzJjzH847VQYNtWfBYabijv6ubNWDEi+h3aAsRKgjNOY
 KWmXHJpjCM8RyrJrMpPkZad5AizHp0rkRQC7g2IXf+6liRsw2umjkp2baOQhBr/BU+oSm
 KME/93st0tWCrthq0LhFPKkPhGa2U6o7Z+k4WLO1WhXDA26FAH8GNp5vhMWLkm/tXNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791723665;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=pfKC3P6dhjfTdzV0U7y9rHX3s0IqcxB4YEZf0SZvGks=;
 b=f8DteN8pBQdSjF5+KdDA4ZFxaGnUT/i3fJwUf0nOxRsdUjjiJEHGRlo9//Tb+U9RBZJX
 aYRyeGLvxaXrck2dU8HWWZvUjchAGnTgzhwAUlqkA/3ZhdLbv1aK99VtHXPKZbJUe3qkY
 5+vaawtvKeqVwWFax9Ade+Wm4aZX+dcFgvAAxd37obSAHgBN8L/mFDmWUQkeALzQUgVPN
 i7LDENvhHKWroFd+iUckVb60uBPq+FQHxM2jU0EENKK0V9O+lYJWYdASeICdDS58XO8tC
 SYLId+hiqaOgvaZG2eh9f5OxDOxPgaGcG5xPDKGrUqiMQk6QzR6/buMkhG+2J/9Gx9Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=txS7RGyC; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=txS7RGyC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76EE680C7E
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723659;
 bh=pfKC3P6dhjfTdzV0U7y9rHX3s0IqcxB4YEZf0SZvGks=;
 h=From:To:Subject:Date:From;
 b=txS7RGyCWa6yDYiKBd+UrK1JjUrtFADo/1dFgVTKRpV9VeL4qdnhzPazAJtLVE81p
 HfFjB5f3K2Uv64HmBCxipIEhst2Z/cIXx5Ojn/9kPLCrwHqQB1yONgQ3xMBMqvUssn
 tALEb9TYGMQ/eVoN5dbNl2RqOJKpZASnWCxRNdi0sGxXcQ487ViIqUq1LiRf1XXMmc
 Yo5tnIKtt1um2FyhjIyLA1CX/KGeOHeriRAe7+KgX6Vn6xHMFW2vJg7T1IFzZ/6+Rm
 E5qS1ncR+e6xE+C7E7rBSAvvxILL3og+2W2vb5MjhXVQmWBgP0HpGycC7gDoO19Cl5
 6vatMseOVD+wQ==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 dtABNsTZKpDN3H8e3ZDBMpmOlqViRUohDljHEYLOIfaWzjRG1cDNQTufvq8CFNc0wWL/lCoK9CO
 EirIwn+yXIx6gJddH+xystRUPbweOdx+GhBfX44OA8zQDp+N2+aL5Xpyk0N9/uJkpUo5P1bE8HM
 QQamBTFKG43ZzzFuG2tqdCPAWLCRYbG5POmd3QYq9ucdsP7C6LIbMZPxrBeFq5ZxOibadKHGBEm
 VXalUBCsrGONf3zaofXczQhITgZhJNT1S8fhuONTq+MofMTPUYgrYywcbuah+V6GX1GpCt/FM0+
 YN0noI4knLOiZ5thb7v+PlWEJuWb/qazn32Auew5Ijqr+4GfhPe/oXGa9Wa44fq1fZcPZutWWRK
 A5OEC77T4VvjTyyY7CPDzp99IdPSJ10lUvVdUAxqUxe97oRjJik21LpPJhHrUuXvRBG7TMfYTTt
 k3LQwb5liVFEdZMrfcFS/mw3Z/1/hwL0iXUcVkINK8/XSp/JqdU5Tfdm3snK7OPOBth6I+DRESX
 /HfhqATlwnhNnND2VlwgbMH5PPmuGAd9Utq4OducR25aAJUviM=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7844BA4C5328
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:00:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAg-000000007Fz-43ml
 for buildroot@buildroot.org; Sun, 11 Oct 2026 13:00:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:05 +0200
Message-ID: <20261011130058.3443432-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ---
Subject: [Buildroot] [PATCH v9 00/52] Bump libopenssl, python3, kodi, ffmpeg
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
updates to this kodi version are expected, kodi tagged 22.0rc1 which
adds compatibility with python 3.15 but also needs ffmpeg >= 7.0 which
in turn needs some fixes for current packages.

This series consists of the following parts:

0001-0003: package removals

0004-0026: - version bumps that provide compatibility with OpenSSL 4.x
           - upstream fixes for packages without a released version that
             provides compatibility with OpenSSL 4.x
           0005-0020 belong to the boost patch series

Until here this is the latest version of the libopenssl bump series.
None of the patches 0001-0026 depend on the libopenssl bump, they all
build fine with libopenssl 3.6.x.

0027-0030: build fixes for ffmpeg 7.0.3
0031:      bump ffmpeg to 7.0.3

0032-0049: bump kodi to 22.0rc1

0050-0051: bump python3 to 3.15.0
           This bump depends on the ncurses fix

0052:      bump libopenssl to 4.0.3

Regards, Bernd


v9:
- rebased
- bumped python3 to 3.15.0 release version
- bumped ffmpeg to 7.0.3 as common version for kodi 21.3 and the
  upcoming kodi bump to 22.0 to maintain bisectability, removed
  ffmpeg bump 9.x from series

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
  https://patchwork.buildroot.org/project/buildroot/patch/20260929175300.1838821-1-bernd-NSqj7jyE675eoWH0uzbU5w-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org/

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


Bernd Kuhls (37):
  package/qt5/qt5knx: remove package
  package/qt5/qt5opcua: remove package
  package/qt6/qt6opcua: remove package
  package/domoticz: bump version to 2026.3
  package/boost: bump version to 1.92.0
  package/xtables-addons: use kernel-module infra
  package/xtables-addons: bump version to 3.31
  package/redis: Fix build with OpenSSL 4.0.0
  package/uboot-tools: Fix build with OpenSSL 4.0.0
  package/xmrig: Add support for OpenSSL 4.0.0
  package/znc: Fix build with OpenSSL 4.0.0
  package/gerbera: fix build with ffmpeg 7.0
  package/libcamera-apps: fix build with ffmpeg 7.0
  package/kodi: support ffmpeg 7.0
  package/kodi-inputstream-ffmpegdirect: Fix build with ffmpeg-7.0
  package/ffmpeg: bump version to 7.0.3
  package/bento4: bump version to 1.6.0-641-6-Piers
  package/kodi: bump to 22.0rc1-Piers
  package/kodi-audiodecoder-*: mass version bump to Piers
  package/kodi-audioencoder-*: mass version bump to Piers
  package/kodi-imagedecoder-*: mass version bump to Piers
  package/kodi-inputstream-ffmpegdirect: bump version to 22.2.10-Piers
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
  package/ncurses: install wide-char headers in usr/include/ncursesw/
  package/python3: bump version to 3.15.0
  package/libopenssl: bump version to 4.0.3

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

 Config.in.legacy                              |  57 ++
 DEVELOPERS                                    |   3 -
 package/apr-util/Config.in                    |   1 -
 package/bento4/bento4.hash                    |   2 +-
 package/bento4/bento4.mk                      |   4 +-
 ...xit_code-guard-static_asserts-on-MIP.patch |  59 +++
 .../0001-unordered-fix-copy-assign.patch      |  22 -
 ...-for-duplicate-definition-of-SIGLOST.patch |  30 ++
 package/boost/0003-Fix-build.patch            |  39 ++
 package/boost/0004-Fix-build.patch            |  40 ++
 package/boost/0005-Fix-build.patch            |  64 +++
 package/boost/Config.in                       | 190 ++++++-
 package/boost/boost.hash                      |   4 +-
 package/boost/boost.mk                        |  10 +-
 package/domoticz/Config.in                    |   7 +-
 package/domoticz/domoticz.hash                |   3 +-
 package/domoticz/domoticz.mk                  |  27 +-
 package/dovecot/Config.in                     |   1 -
 ...0005-avcodec-mmaldec-Fix-build-error.patch |  32 --
 ...ay-dvd-Use-correct-pointer-types-on-.patch |  52 --
 ...hwcontext-vaapi-use-the-correct-type.patch |  28 -
 package/ffmpeg/ffmpeg.hash                    |   2 +-
 package/ffmpeg/ffmpeg.mk                      |   3 +-
 package/fluent-bit/Config.in                  |   1 -
 ...-transcode-fix-build-with-ffmpeg-7.0.patch |  60 +++
 .../kodi-audiodecoder-modplug.hash            |   2 +-
 .../kodi-audiodecoder-modplug.mk              |   2 +-
 .../kodi-audiodecoder-nosefart.hash           |   2 +-
 .../kodi-audiodecoder-nosefart.mk             |   2 +-
 .../kodi-audiodecoder-sidplay.hash            |   2 +-
 .../kodi-audiodecoder-sidplay.mk              |   2 +-
 .../kodi-audiodecoder-snesapu.hash            |   2 +-
 .../kodi-audiodecoder-snesapu.mk              |   2 +-
 .../kodi-audiodecoder-stsound.hash            |   2 +-
 .../kodi-audiodecoder-stsound.mk              |   2 +-
 .../kodi-audiodecoder-timidity.hash           |   2 +-
 .../kodi-audiodecoder-timidity.mk             |   2 +-
 .../kodi-audiodecoder-vgmstream.hash          |   2 +-
 .../kodi-audiodecoder-vgmstream.mk            |   2 +-
 .../kodi-audioencoder-flac.hash               |   2 +-
 .../kodi-audioencoder-flac.mk                 |   2 +-
 .../kodi-audioencoder-lame.hash               |   2 +-
 .../kodi-audioencoder-lame.mk                 |   2 +-
 .../kodi-audioencoder-vorbis.hash             |   2 +-
 .../kodi-audioencoder-vorbis.mk               |   2 +-
 .../kodi-audioencoder-wav.hash                |   2 +-
 .../kodi-audioencoder-wav.mk                  |   2 +-
 .../kodi-imagedecoder-heif.hash               |   2 +-
 .../kodi-imagedecoder-heif.mk                 |   2 +-
 .../kodi-imagedecoder-raw.hash                |   2 +-
 .../kodi-imagedecoder-raw.mk                  |   2 +-
 .../kodi-inputstream-adaptive.hash            |   2 +-
 .../kodi-inputstream-adaptive.mk              |   2 +-
 .../kodi-inputstream-ffmpegdirect.hash        |   2 +-
 .../kodi-inputstream-ffmpegdirect.mk          |   2 +-
 .../kodi-inputstream-rtmp.hash                |   2 +-
 .../kodi-inputstream-rtmp.mk                  |   2 +-
 .../kodi-jsonschemabuilder.mk                 |   2 +-
 .../kodi-peripheral-joystick.hash             |   2 +-
 .../kodi-peripheral-joystick.mk               |   2 +-
 .../kodi-peripheral-xarcade.hash              |   2 +-
 .../kodi-peripheral-xarcade.mk                |   2 +-
 .../kodi-pvr-argustv/kodi-pvr-argustv.hash    |   2 +-
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk  |   2 +-
 .../kodi-pvr-dvblink/kodi-pvr-dvblink.hash    |   2 +-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk  |   2 +-
 .../kodi-pvr-dvbviewer.hash                   |   2 +-
 .../kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk  |   2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.hash  |   2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk    |   2 +-
 package/kodi-pvr-hts/0001-gcc15.patch         |  26 -
 package/kodi-pvr-hts/kodi-pvr-hts.hash        |   2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk          |   2 +-
 .../kodi-pvr-iptvsimple.hash                  |   2 +-
 .../kodi-pvr-iptvsimple.mk                    |   2 +-
 .../kodi-pvr-mediaportal-tvserver.hash        |   2 +-
 .../kodi-pvr-mediaportal-tvserver.mk          |   2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash  |   2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk    |   2 +-
 .../kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash    |   2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk  |   2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.hash      |   2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.mk        |   2 +-
 .../kodi-pvr-octonet/kodi-pvr-octonet.hash    |   2 +-
 package/kodi-pvr-octonet/kodi-pvr-octonet.mk  |   2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.hash      |   2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk        |   2 +-
 package/kodi-pvr-plutotv/Config.in            |   2 +-
 .../kodi-pvr-plutotv/kodi-pvr-plutotv.hash    |   2 +-
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk  |   4 +-
 .../kodi-pvr-stalker/kodi-pvr-stalker.hash    |   2 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk  |   2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.hash      |   2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk        |   2 +-
 .../kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash  |   2 +-
 .../kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk    |   2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash  |   2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk    |   2 +-
 package/kodi-pvr-waipu/Config.in              |   2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash    |   2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk      |   4 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.hash        |   2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk          |   2 +-
 package/kodi-pvr-zattoo/Config.in             |   2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash  |   2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk    |   4 +-
 .../kodi-screensaver-asteroids.hash           |   2 +-
 .../kodi-screensaver-asteroids.mk             |   2 +-
 .../kodi-screensaver-asterwave.hash           |   2 +-
 .../kodi-screensaver-asterwave.mk             |   2 +-
 .../kodi-screensaver-biogenesis.hash          |   2 +-
 .../kodi-screensaver-biogenesis.mk            |   2 +-
 .../kodi-screensaver-cpblobs.hash             |   2 +-
 .../kodi-screensaver-cpblobs.mk               |   2 +-
 .../kodi-screensaver-greynetic.hash           |   2 +-
 .../kodi-screensaver-greynetic.mk             |   2 +-
 .../kodi-screensaver-matrixtrails.hash        |   2 +-
 .../kodi-screensaver-matrixtrails.mk          |   2 +-
 .../kodi-screensaver-pingpong.hash            |   2 +-
 .../kodi-screensaver-pingpong.mk              |   2 +-
 .../kodi-screensaver-pyro.hash                |   2 +-
 .../kodi-screensaver-pyro.mk                  |   2 +-
 .../0001-Fix-build-with-CMake-4.x.patch       | 346 -------------
 .../kodi-screensaver-rsxs.hash                |   2 +-
 .../kodi-screensaver-rsxs.mk                  |   2 +-
 .../kodi-screensaver-stars.hash               |   2 +-
 .../kodi-screensaver-stars.mk                 |   2 +-
 .../kodi-skin-confluence.hash                 |   2 +-
 .../kodi-skin-confluence.mk                   |   2 +-
 ...rePacker-allow-build-with-giflib-6.x.patch |  71 ---
 .../kodi-texturepacker/kodi-texturepacker.mk  |   3 +-
 .../kodi-vfs-libarchive.hash                  |   2 +-
 .../kodi-vfs-libarchive.mk                    |   2 +-
 package/kodi-vfs-rar/kodi-vfs-rar.hash        |   2 +-
 package/kodi-vfs-rar/kodi-vfs-rar.mk          |   2 +-
 package/kodi-vfs-sftp/kodi-vfs-sftp.hash      |   2 +-
 package/kodi-vfs-sftp/kodi-vfs-sftp.mk        |   2 +-
 .../kodi-visualisation-fishbmc.hash           |   2 +-
 .../kodi-visualisation-fishbmc.mk             |   2 +-
 .../kodi-visualisation-goom.hash              |   2 +-
 .../kodi-visualisation-goom.mk                |   2 +-
 .../kodi-visualisation-matrix.hash            |   2 +-
 .../kodi-visualisation-matrix.mk              |   2 +-
 .../kodi-visualisation-shadertoy.hash         |   2 +-
 .../kodi-visualisation-shadertoy.mk           |   2 +-
 .../kodi-visualisation-spectrum.hash          |   2 +-
 .../kodi-visualisation-spectrum.mk            |   2 +-
 .../kodi-visualisation-starburst.hash         |   2 +-
 .../kodi-visualisation-starburst.mk           |   2 +-
 .../kodi-visualisation-waveform.hash          |   2 +-
 .../kodi-visualisation-waveform.mk            |   2 +-
 ...rePacker-allow-build-with-giflib-6.x.patch |  71 ---
 ...02-VAAPI-fix-build-with-ffmpeg-7.1.5.patch | 117 +++++
 ...erFFmpeg-fix-build-with-ffmpeg-7.0.3.patch |  67 +++
 .../0003-RegExp-remove-unused-methods.patch   | 127 -----
 ...eamAddon-fix-build-with-ffmpeg-7.0.3.patch |  49 ++
 .../0004-Introduce-PCRE2-dependency.patch     | 192 -------
 ...igrate-PCRE-to-PCRE2-and-remove-PCRE.patch | 486 ------------------
 ...006-cmake-Set-ARCH-to-CPU-by-default.patch |  41 --
 package/kodi/Config.in                        |   8 +-
 package/kodi/kodi.hash                        |  15 +-
 package/kodi/kodi.mk                          |  52 +-
 ...ncoder-libav-Updates-for-ffmpeg-v7.1.patch |  48 ++
 ...oder-libav-fix-build-with-ffmpeg-7.0.patch |  37 ++
 package/libcoap/Config.in                     |   1 -
 package/libks/Config.in                       |   1 -
 package/libldns/libldns.mk                    |   8 +-
 package/libopenssl/Config.in                  |  34 --
 package/libopenssl/libopenssl.hash            |   4 +-
 package/libopenssl/libopenssl.mk              |  18 +-
 package/libp11/Config.in                      |   1 -
 package/libp11/libp11.mk                      |   3 +-
 package/librelp/Config.in                     |   1 -
 package/libssh/Config.in                      |   1 -
 package/log4cxx/Config.in                     |   5 +
 package/luvi/Config.in                        |   1 -
 package/mender/Config.in                      |   1 -
 package/mtd/Config.in                         |   1 -
 package/ncurses/ncurses.mk                    |   7 +
 package/openssh/openssh.mk                    |   8 +-
 package/python-libconfig/Config.in            |   5 +-
 ...e-the-build-of-pyc-files-conditional.patch |  14 +-
 .../0002-Add-an-option-to-disable-pydoc.patch |  24 +-
 .../0003-Add-an-option-to-disable-IDLE.patch  |  18 +-
 ...move-PY_STDLIB_MOD_SET_NA-further-up.patch |   8 +-
 ...option-to-disable-the-sqlite3-module.patch |  16 +-
 ...d-an-option-to-disable-the-tk-module.patch |  18 +-
 ...-option-to-disable-the-curses-module.patch |  14 +-
 .../0008-Add-an-option-to-disable-expat.patch |  14 +-
 ...ac-detect-unusable-termio-operations.patch |  16 +-
 ...mpilation-of-Modules-_remote_debuggi.patch |  55 --
 package/python3/python3.hash                  |   4 +-
 package/python3/python3.mk                    |   4 +-
 package/qt5/Config.in                         |   2 -
 package/qt5/qt5knx/Config.in                  |  12 -
 package/qt5/qt5knx/qt5knx.hash                |   6 -
 package/qt5/qt5knx/qt5knx.mk                  |  15 -
 package/qt5/qt5opcua/Config.in                |   9 -
 package/qt5/qt5opcua/qt5opcua.hash            |  10 -
 package/qt5/qt5opcua/qt5opcua.mk              |  19 -
 package/qt6/Config.in                         |   1 -
 package/qt6/qt6opcua/Config.in                |  14 -
 package/qt6/qt6opcua/qt6opcua.hash            |  10 -
 package/qt6/qt6opcua/qt6opcua.mk              |  40 --
 package/rauc/Config.in                        |   2 -
 package/rauc/rauc.mk                          |   3 +-
 ...ecated-X509_NAME_get_text_by_NID-API.patch | 101 ++++
 package/resiprocate/Config.in                 |   4 +
 package/softhsm2/Config.in                    |   1 -
 ...Add-support-for-OpenSSL-Provider-API.patch | 304 +++++++++++
 package/unbound/Config.in                     |   1 -
 package/unbound/unbound.mk                    |   1 +
 .../0001-Fix-build-with-OpenSSL-4.0.0.patch   |  40 ++
 package/xtables-addons/Config.in              |   2 +-
 package/xtables-addons/xtables-addons.hash    |   2 +-
 package/xtables-addons/xtables-addons.mk      |   9 +-
 package/zmqpp/Config.in                       |   5 +-
 ...-Fix-build-error-with-OpenSSL-4-2024.patch |  57 ++
 218 files changed, 1654 insertions(+), 2068 deletions(-)
 create mode 100644 package/boost/0001-fix-process-v2-exit_code-guard-static_asserts-on-MIP.patch
 delete mode 100644 package/boost/0001-unordered-fix-copy-assign.patch
 create mode 100644 package/boost/0002-Add-check-for-duplicate-definition-of-SIGLOST.patch
 create mode 100644 package/boost/0003-Fix-build.patch
 create mode 100644 package/boost/0004-Fix-build.patch
 create mode 100644 package/boost/0005-Fix-build.patch
 delete mode 100644 package/ffmpeg/0005-avcodec-mmaldec-Fix-build-error.patch
 delete mode 100644 package/ffmpeg/0006-avcodec-pcm-bluray-dvd-Use-correct-pointer-types-on-.patch
 delete mode 100644 package/ffmpeg/0007-avutil-hwcontext-vaapi-use-the-correct-type.patch
 create mode 100644 package/gerbera/0001-transcode-fix-build-with-ffmpeg-7.0.patch
 delete mode 100644 package/kodi-pvr-hts/0001-gcc15.patch
 delete mode 100644 package/kodi-screensaver-rsxs/0001-Fix-build-with-CMake-4.x.patch
 delete mode 100644 package/kodi-texturepacker/0001-TexturePacker-allow-build-with-giflib-6.x.patch
 delete mode 100644 package/kodi/0002-TexturePacker-allow-build-with-giflib-6.x.patch
 create mode 100644 package/kodi/0002-VAAPI-fix-build-with-ffmpeg-7.1.5.patch
 create mode 100644 package/kodi/0003-AEEncoderFFmpeg-fix-build-with-ffmpeg-7.0.3.patch
 delete mode 100644 package/kodi/0003-RegExp-remove-unused-methods.patch
 create mode 100644 package/kodi/0004-InputStreamAddon-fix-build-with-ffmpeg-7.0.3.patch
 delete mode 100644 package/kodi/0004-Introduce-PCRE2-dependency.patch
 delete mode 100644 package/kodi/0005-Migrate-PCRE-to-PCRE2-and-remove-PCRE.patch
 delete mode 100644 package/kodi/0006-cmake-Set-ARCH-to-CPU-by-default.patch
 create mode 100644 package/libcamera-apps/0003-encoder-libav-Updates-for-ffmpeg-v7.1.patch
 create mode 100644 package/libcamera-apps/0004-encoder-libav-fix-build-with-ffmpeg-7.0.patch
 delete mode 100644 package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
 delete mode 100644 package/qt5/qt5knx/Config.in
 delete mode 100644 package/qt5/qt5knx/qt5knx.hash
 delete mode 100644 package/qt5/qt5knx/qt5knx.mk
 delete mode 100644 package/qt5/qt5opcua/Config.in
 delete mode 100644 package/qt5/qt5opcua/qt5opcua.hash
 delete mode 100644 package/qt5/qt5opcua/qt5opcua.mk
 delete mode 100644 package/qt6/qt6opcua/Config.in
 delete mode 100644 package/qt6/qt6opcua/qt6opcua.hash
 delete mode 100644 package/qt6/qt6opcua/qt6opcua.mk
 create mode 100644 package/redis/0004-tls-replace-deprecated-X509_NAME_get_text_by_NID-API.patch
 create mode 100644 package/uboot-tools/0003-Add-support-for-OpenSSL-Provider-API.patch
 create mode 100644 package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch
 create mode 100644 package/znc/0001-Fix-build-error-with-OpenSSL-4-2024.patch

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
