Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A01DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Dec 2021 17:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34824409FE;
	Wed, 15 Dec 2021 17:34:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D3QHPUcvW-K5; Wed, 15 Dec 2021 17:34:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60005409FA;
	Wed, 15 Dec 2021 17:34:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11E0A1BF2CF
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 17:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F32E4409FA
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 17:34:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nydQBzavWkRn for <buildroot@lists.busybox.net>;
 Wed, 15 Dec 2021 17:34:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB0A1409ED
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 17:34:39 +0000 (UTC)
Received: from mail.qult.net (unknown [78.193.33.39])
 by smtp6-g21.free.fr (Postfix) with ESMTPS id 3102C780375
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 18:34:36 +0100 (CET)
Received: from zenon.in.qult.net ([192.168.64.1])
 by mail.qult.net with esmtp (Exim 4.90_1)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1mxYAl-0000kH-VV
 for buildroot@buildroot.org; Wed, 15 Dec 2021 18:34:36 +0100
Received: from ig by zenon.in.qult.net with local (Exim 4.94.2)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1mxYAi-000qLL-Ss
 for buildroot@buildroot.org; Wed, 15 Dec 2021 18:34:32 +0100
Date: Wed, 15 Dec 2021 18:34:32 +0100
From: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
To: buildroot@buildroot.org
Message-ID: <20211215173432.r75invoe3ff6mthg@zenon.in.qult.net>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [PATCH] package/fakedate: fix finding the right date
 executable
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If the PATH initially contains host/bin, then the right date
executable is to be found after the *first* occurrence of fakedate in
normal (forward) PATH order.  Fix the wrapper so that that first
occurrence is found indeed.

Signed-off-by: Ignacy Gaw=EAdzki <ignacy.gawedzki@green-communications.fr>
---
 package/fakedate/fakedate | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/fakedate/fakedate b/package/fakedate/fakedate
index 9bef113357..03a4f04079 100755
--- a/package/fakedate/fakedate
+++ b/package/fakedate/fakedate
@@ -21,13 +21,18 @@
 DATE_BIN=3Dfalse
 # Do not call any 'date' before us in the PATH, or that would create
 # an infinite recursion.
+last_date=3Dfalse
 for date in $(which -a date |tac); do
     if [ "${date}" -ef "$0" ]; then
-        break
+	DATE_BIN=3D$last_date
     fi
-    DATE_BIN=3D"${date}"
+    last_date=3D"${date}"
 done
 =

+if [ "$DATE_BIN" =3D false ]; then
+    DATE_BIN=3D$last_date
+fi
+
 if [ -n "$SOURCE_DATE_EPOCH" ]; then
     FORCE_EPOCH=3D1
     for i in "$@"; do
-- =

2.32.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
