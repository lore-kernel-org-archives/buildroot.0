Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC84C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 19:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8187360B36;
	Thu, 10 Feb 2022 19:32:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lG9Yu1VEghQo; Thu, 10 Feb 2022 19:32:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98EA360EAE;
	Thu, 10 Feb 2022 19:32:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 961D11BF3BB
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E681818C0
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:29:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iE7ONPVrJLs2 for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 19:29:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EFBB81990
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 19:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644521348;
 bh=l7Qqo/UI3Ee0cH8B8/TAY5aRhe4KB/i1Q9P9N38xuXY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=GdtEjO45hc1X2zlL47hy9hDOj1gUDsl+UebQSOA3XiLjzAQIe7egpR2UWR3JsNC69
 FUrWzWd9iewhQNltBwFMc+TBqYfhkbUGr86OEQgGHqatX54SPK0XyLuDqyXYREKXBq
 Z7sxR8T4sKkjzs5VnTxMozSheHe3tdBsLCBp/e/E=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.34]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MwfWa-1oGHVO0PMY-00y9Rb; Thu, 10
 Feb 2022 20:29:08 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 20:29:02 +0100
Message-Id: <20220210192905.4500-11-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210192905.4500-1-ps.report@gmx.net>
References: <20220210192905.4500-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:J7TcJC5UtanAAZOQFOjmeOir7To2ldGLmPwm9KFWVfgjXTtYZuf
 AoPsgZiKe2AuayC2xwVsghQha6dbWkNpgSl1EWnWTurNo3MLJ7dIW4cVyQ/GVr9BFlDyhJE
 NnBlvtmCI175oAGmlyEFg9G/IXQ8KdYi5KqsQGF0YqdZKwuqxmO5gNBVN3cJXAWZWZmSU5q
 3U9ZTevCsTBIYZDIyfvsg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zrj9lWRBlug=:OPKzOY2ixuzlP9ePASpg6w
 hz55otxllea/pBmRUeEXxkMuaNQpI9bG3Ae1z5MKb74RqUTH9Iipq4Xsasg6954+HCmG8kRel
 dfaZh7f8q+CBi7bNoh/iMAOid85wZHgNBtp1NnMVI/UGxJigDFwHglGcLll2u10eLEKDxO+X9
 DblPF/OEZbHu2tR3NsnU97BRechcbAbDmzY/PxxnmozxkjlpCbwJ273M2TDbUgYJhnjD84CjB
 SCYQqQKvAOst/+B6oD7rCflISWKqvHE8qWJIV1aHqK5MiU/FAVI5aKCJZhRG1/DnKZrqW9lKU
 EhzOqLpQoYwSsdmEkTvIbWTz+eFC0Kjln+/WdZwRhxulmBCBZ7FTm6GjsFb698flXJZdArU2W
 mh2TbWAIfiEmZMsXYrUJ1590jicWqQnrSWiE6jboJuYmsjN4Be17AlRtaRM7rmuFvWtHrpuA5
 jE5bcruYPU2vJnF1hhVXwlgK1BnxKiRy6aR5hEcwMy1xq99WMmQUurB7NumSuTMBwwyu/W9WF
 8/ZUtsMXfQyQxeHvjPiUM59Me/gqeCYzizMzrWcfly9CNTBAsmhXm+N6EF0TL9gK/z8K95MBh
 dL1CSLQBsj7OZMubVWuXHi4dhTqIIHdWAVOVjvXOJSOrE/jTlV/9Z5/sVFsrf+uQ5QAgRfmfq
 SSebtGu/Ofe5GEYRMYSiNf8jrko6e1erDUTUCKf9TN3VUMVihzLfRoBOC5kH2jEhqjoYDK1eQ
 T1Z31sDWkTfnCXONY3HIQc4gJu3Idd/V6XdF/MRc8XcGWNRclbwrHAzUT25LMUdLw2DA778D6
 XSySxXYA2frKOGh9QYVv0UVcApMRYbRyJT981jsmUrNxr/GgTNnno3S0rU/JOXT/O2wwlIyce
 f/yLakSXcKbnStq5VrPPNZpnJ3OEyTTtvOldzHW/QxD77wonn6pVFHfvFovHH98dK17iFMgmS
 xYwJf0E20du6fuyOuKg+dkMFETeJ3Uwhg/UhImfNoebQsRjqembidGDNNUPe2a+p5MQ926idR
 ZT2xKlneb8vVdfYwedu7wOr7h1+fiY8ZXV9mGALV5kaDuS3Q94oRztOUN6CSobS+I4SmX9rRi
 liuVghTnqsTB88=
Subject: [Buildroot] [PATCH v2 10/13] package/gstreamer1-editing-services:
 bump version to 1.20.0
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
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../gstreamer1-editing-services.hash                          | 4 ++--
 .../gstreamer1-editing-services.mk                            | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
index e29dc112ce..9662e6b8fb 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
@@ -1,5 +1,5 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.18.6.tar.xz.sha256sum
-sha256  fe10d14ef896aa21038317f6f81e1158ccc6caaed9b0d5a29ae5bdd63074582c  gst-editing-services-1.18.6.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.20.0.tar.xz.sha256sum
+sha256  f837adcf4073d19a5908984e879cd039f4192ca368e71d39e8ccd8a56b9feedf  gst-editing-services-1.20.0.tar.xz
 
 # Hashes for license files:
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
index a3722cbbca..5e03c08ae7 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_EDITING_SERVICES_VERSION = 1.18.6
+GSTREAMER1_EDITING_SERVICES_VERSION = 1.20.0
 GSTREAMER1_EDITING_SERVICES_SOURCE = gst-editing-services-$(GSTREAMER1_EDITING_SERVICES_VERSION).tar.xz
 GSTREAMER1_EDITING_SERVICES_SITE = https://gstreamer.freedesktop.org/src/gstreamer-editing-services
 GSTREAMER1_EDITING_SERVICES_LICENSE = LGPL-2.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
