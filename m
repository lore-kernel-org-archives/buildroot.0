Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56780C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 23:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACD744056A;
	Thu, 10 Feb 2022 23:30:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 34eyJl0OZ2P8; Thu, 10 Feb 2022 23:30:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7F1F4052D;
	Thu, 10 Feb 2022 23:30:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EED9D1BF487
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 23:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFDDF82FE7
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 23:30:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=rockwellcollins.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CPUQnGP6rQdv for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 23:30:38 +0000 (UTC)
X-Greylist: delayed 00:07:08 by SQLgrey-1.8.0
Received: from da1vs04.rockwellcollins.com (da1vs04.rockwellcollins.com
 [205.175.227.52])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1320982FE4
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 23:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rockwellcollins.com; s=hrcrc2020;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4iAaOvXaAbq29YDZK/2aJC3y0avjnsOW4nl0zQLlq4g=;
 b=G3zd2Y7pY5instkDBrzR+x+bSerhFRnKZQNkGyUyeqnD2izytBk4w5jm
 AxIY6LX6GHFMZDLjLc15kXb1z9reyZKdUrpZyfgMPmnhiugm/GDacKQlW
 IvmnI3iyj9LAu8FsneOQhc/mQjHDhJpsEAzj+UzETaZ9sNZPkVyLCa9ZO
 efwX/0gsJYrgagSoPg2PbejeBcJxkZoNgiHsSiGOyv+hwEqhulUSAEBUf
 H/ITs9hlamoddCBk5wH+qyq5uVqW6WR4M+8ole6y3T26nJLrU89J7e71s
 LUhcdpFOLHdsQQIIIYjZNu88mYLTz6XbCcuG3RX2L3DhQuc3/+jqSVWVi A==;
IronPort-SDR: GYq/IWMTV3EM/vAe1bImJgu2PrBQCXjZT0l9ngyMQDlb47mGCRjjqYaeD6/ZvqM9RnDd6XjB7b
 NozYs7fC2ExfLzSGGHzM12RYbO0xeU7qJ+cd2us6zXFxRmjzzsv8LQX0HbMpdz41IpWN+tw5Ua
 68XkXqGyCM9X4NMpxS8L9XfqtzGfuNjaOlhegKTKj7s8b+qkLx31Y1h6HEFd+83UJpRxprwLVd
 EaDLTioVCOuc0yB5x6AEzcj+DZmXtGA7E2DCzzC34QZzlBUfkYpG2Nv4D/RN4BX2X2915a0TH+
 ljs=
Received: from ofwda1n02.rockwellcollins.com (HELO
 crulimr01.rockwellcollins.com) ([205.175.227.14])
 by da1vs04.rockwellcollins.com with ESMTP; 10 Feb 2022 17:23:29 -0600
X-Received: from righttwix.rockwellcollins.com (righttwix.rockwellcollins.com
 [192.168.141.218])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id B57A5605AF;
 Thu, 10 Feb 2022 17:23:28 -0600 (CST)
From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 17:23:27 -0600
Message-Id: <20220210232327.119488-1-clayton.shotwell@rockwellcollins.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/download/post-process-helpers: adjust
 for older coreutils versions
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
Cc: Clayton Shotwell <clayton.shotwell@collins.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Clayton Shotwell <clayton.shotwell@collins.com>

Ran into an issue with the post_process_unpack function using "head -z"
on a RHEL box which is using an older version or coreutils. The "-z"
flag was added in coreutils v8.25 but my IT managed RHEL box is only
using v8.22. The fix I have implemented relies on the null terminated
list and sed to remove the first null character and everthing
afterwards.

Signed-off-by: Clayton Shotwell <clayton.shotwell@collins.com>
---
 support/download/helpers | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/helpers b/support/download/helpers
index ab31e27..90a7d6c 100755
--- a/support/download/helpers
+++ b/support/download/helpers
@@ -79,7 +79,7 @@ post_process_unpack() {
 
     mkdir "${dest}"
     tar -C "${dest}" --strip-components=1 -xzf "${tarball}"
-    one_file="$(find "${dest}" -type f -print0 |LC_ALL=C sort -z |head -z -n1 |tr -d "\0")"
+    one_file="$(find "${dest}" -type f -print0 |LC_ALL=C sort -z |sed 's/\x0.*//')"
     touch -r "${one_file}" "${dest}.timestamp"
 }
 
-- 
1.8.3.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
