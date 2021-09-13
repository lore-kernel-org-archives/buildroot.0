Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C2BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:06:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8B7A60200
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D8B7A60200
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADCBF40252;
	Mon, 13 Sep 2021 21:06:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IWN9KCgRo1UP; Mon, 13 Sep 2021 21:06:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA52740299;
	Mon, 13 Sep 2021 21:06:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9ED861BF318
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20482402B4
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tdyd3S9cqBXa for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 21:04:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F31D402BD
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 21:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631567053;
 bh=x46llw+zK+3ZA4Cq57ztbLl+GOAxhJSNj50k802vrgA=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=QTZEsqp+/nt0YaKfidh3ih6PX29I5BUqHg7NHwoS7ReSj8RRtiJ4NhCIVAq/e4cFy
 RRHFBb7zl60lfOMCdTvEkBPlOkA9Ge6Y2QEc5gmFi4kMEV2Ej6xYtlfAbTHccWpi01
 SYsZRzkM2gtDLxkER7jIzM/R2rARwLVDvByIG3OM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.240]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M1HZo-1mN8ER1Luk-002lgB for <buildroot@buildroot.org>; Mon, 13 Sep 2021
 23:04:13 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 23:04:04 +0200
Message-Id: <20210913210412.24042-6-ps.report@gmx.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210913210412.24042-1-ps.report@gmx.net>
References: <20210913210412.24042-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:8TE/QGqhNPsX1P17L5HVQDd+OIgzwVTqDiXxGqMOZNUkjadezr9
 TkCxJQY8srheEzkbleAldfeuPPoY8464j48V1flpA26ipHCX/oJbMPw0k/TuweWT2JBrZAC
 08A8X/BUxsJXXMHgMpK87X/kEis+9q9QQ0AIIRLPatjSNIpM/2pH3Wr68ozcyXFWQ7VvbxC
 umUsesuUnWngbEWoeORDA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HKaNhhjpmpw=:sE3DkK7ymAhOh+J6D9LYXG
 ATXZAdfkMIQe0bMHTg+OFXHCjtATTGvI+zOP55kyAn4KcBavYeZzx0gttZAtBMSetHFxRpKa5
 l/rj9QAGCAs+S0Apk912XnElosUbjvCUUsvEU2n8X+6b7gVXQuuQMJqMXIAjrLqtFw5cTzXYf
 X/diCHGvrrwJeAm6+opziK9zZxuCF9bSgvUHTVuzTtxaQ4i+7I65r+ox68g/ykSj6vuHISyo8
 VWw8p1GgeIYdRo0PXbJM6Gub4IzzwnWrKhXJR09++asapthLmQMa0SPcEibEEPvKPG43iXTy7
 jy77LWe6q99urGXR6hJKZDgwkvs+60FU/vtaW2w3HHXEivMt3a6UqzEz14FRO6c4Yc86+cVrT
 MfU7g5lOG08xC+y0dXnIdyV2/3WE9fsj/bj5ZDruJ+ijaT+lyEibW8ek2BRV7O7gXBvuyRRNt
 L71b6O3zMVkHJbz9pIR87Moq8pmMQZ9c/rBWFKu1I1shWhKyN2Ax9Gtxdj+0Qk5ppAjERdXcz
 Ms/IfuMut7kDlJ6apsNR5rkGRz/blNc7yFqULav2tDsf9a2N44katEiyZ8Mv7VQahJBuFffG4
 TBU7Mt5IWHlu0g2LsOzG8kYqyCjbrcfI3rxRpPYFULmRlYaomTOvzjvoz1DmizxavkqEh2wuS
 d4gs0HkqEF71jQsvSc74LBuI90O6tzKd5wDjuzKBHlnE7kBZdnTH1XsDAWRK1/KK6pjr3jclZ
 HVhClYrdC6xY9UCr2oRVTqG0knTy0ulJeI5uStnukpXBiKlz2j2GbH90J++wsCqFZ7ZvkVEoQ
 lPHtqdLGckO3fWhZc6suDuq2w+fnliDRDqOmUwhyMKLXUDZ59nC0DdjpLXrN1hj3Z52EBFu8j
 kbgvfrZhUsr7OlqDks8QKy7GshKXnnNZYn4x6VIN7kD6G62ZQrTG9GdCqbtrTqBEGVjJqFxqL
 vc9EL47BkwVf6CadilsnYB66hUYN9KCSK6pdhGx0VEBSirYBWi127noEVqE2bE5icjREBtU/8
 767IqubofWer1EwqgOYcSNG12ng/fs+sbypGJPozi5Al1DDmevR25jcLGgEhO1iZVArszevt6
 sK5yoMfciZCjR8=
Subject: [Buildroot] [PATCH v1 05/13] package/gst1-plugins-ugly: bump
 version to 1.18.5
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash | 4 ++--
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index 3ca78ed1bc..93945cdecd 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.18.4.tar.xz.sha256sum
-sha256  218df0ce0d31e8ca9cdeb01a3b0c573172cc9c21bb3d41811c7820145623d13c  gst-plugins-ugly-1.18.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.18.5.tar.xz.sha256sum
+sha256  df32803e98f8a9979373fa2ca7e05e62f977b1097576d3a80619d9f5c69f66d9  gst-plugins-ugly-1.18.5.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index b596a0bcaf..b3dc765d07 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.18.4
+GST1_PLUGINS_UGLY_VERSION = 1.18.5
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
