Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0FBECAAD2
	for <buildroot@archiver.kernel.org>; Thu,  1 Sep 2022 20:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BB7A60BD1;
	Thu,  1 Sep 2022 20:12:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BB7A60BD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ucOEWdb_98Fm; Thu,  1 Sep 2022 20:12:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A947860B9C;
	Thu,  1 Sep 2022 20:12:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A947860B9C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 92FFE1BF393
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 20:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DF3D404A0
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 20:12:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DF3D404A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rZ8nb-OnT-KJ for <buildroot@lists.busybox.net>;
 Thu,  1 Sep 2022 20:12:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 667AB40134
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 667AB40134
 for <buildroot@buildroot.org>; Thu,  1 Sep 2022 20:12:43 +0000 (UTC)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout01.t-online.de (Postfix) with SMTP id 8F51A84A8;
 Thu,  1 Sep 2022 22:12:06 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.182.238]) by fwd75.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oTqXl-2ucNhh0; Thu, 1 Sep 2022 22:12:05 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:36488)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oTqXk-0003gc-38;
 Thu, 01 Sep 2022 22:12:05 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  1 Sep 2022 22:12:01 +0200
Message-Id: <20220901201204.3514426-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1662063125-01453B16-33165BD1/0/0 CLEAN NORMAL
X-TOI-MSGID: 433598f4-f442-4c3d-87f9-fcfe3850f1f1
Subject: [Buildroot] [PATCH/next 0/3] Fix non-locale uClibc build of Kodi
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

this patch series fixes
https://lists.buildroot.org/pipermail/buildroot/2022-August/648240.html

Several steps are necessary:
- bump daq3/snort3 to remove flatbuffers support
  this patch needs to go in first because the current snort3 version
  is incompatible to flatbuffers 2.0.8
- bump flatbuffers, this bump includes
  https://github.com/google/flatbuffers/commit/2ee20a5f3d16bf94140466eba71d04a56c4d4fde
  which, from my pov, simplifies the if-conditions guarding locale
  support
- this simplified if-condition made it possible for me to fix a build
  error with kodi on non-locale toolchains:
  https://lists.buildroot.org/pipermail/buildroot/2022-July/648110.html

Regards, Bernd

Bernd Kuhls (3):
  package/daq3: bump version to 3.0.9
  package/snort3: bump version to 3.1.40.0
  package/flatbuffers: bump version to 2.0.8

 package/daq3/daq3.hash                        |  2 +-
 package/daq3/daq3.mk                          |  2 +-
 ...flatbuffers-base.h-fix-build-on-musl.patch | 20 +++++++++++--------
 package/flatbuffers/flatbuffers.hash          |  2 +-
 package/flatbuffers/flatbuffers.mk            |  2 +-
 package/snort3/snort3.hash                    |  2 +-
 package/snort3/snort3.mk                      |  9 +--------
 7 files changed, 18 insertions(+), 21 deletions(-)

-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
