Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B39CFEFB6D
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 17:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CDEA8284B;
	Fri, 27 Feb 2026 17:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id abNy1D9hLpv7; Fri, 27 Feb 2026 17:00:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 762C58281A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772211622;
	bh=Sm/7Bnbo+87iobnRz5G7MY1RDXwGW7vg+eZd1ua1vw8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=cs8obiX6xTW0Al+zriLfDH2htz71wLG6gwb3QLWpabxw2pogbHs7R+YNud9tXrLlV
	 K5B7ai39tppGTTA5228KuqHedv7TrZchyofLq0G54luWP4Abez0D+RNOAxJu34sdES
	 ow22g/7uRcEnhdDx1gdboV81rSmvtY0KrKxn4KacxOcnKGwhgmV+5sjOQYjSpOwrOU
	 Vacl5PwwevbyxL0ZHx3RBV6Z6/vztcBfggp5MsWxEAUfSUXszEHAMjep4srbi8p87V
	 XMPFUmZ5Nru1vam0Lkpr9muIgV3pBIf2tjBTOjjLrX4pOA/V4fyMnRsYfkKDp0R7fZ
	 Kgp0Z1M1GQPdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 762C58281A;
	Fri, 27 Feb 2026 17:00:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0509A1F3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 17:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEA158281A
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 17:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xjus0GEnFdQH for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 17:00:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E292582813
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E292582813
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E292582813
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 17:00:19 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-65f9a875eabso4266722a12.0
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 09:00:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772211617; x=1772816417;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5d+E4E4CUmF17wDFtQVjixL9ec/V6NDHLJ9nYUzbQMQ=;
 b=j15ip8kShuHmdEQG4p4etzzwD0KQdGh++T+gf0XLdltIm0fBDNJz4d0wBTPHrCDzTH
 k2tH/XeFCOgoqO3F1etv0kjWF6kqyqs8lwxjnYXdWmrwSfkAI/drTjNHGkfB5A5MwmwO
 9oKliWHQ0eoGJ05zhuxmsp416n8pgit+w2DcsVVHc5AG1WeMz0IOKjsgcoOnbfq+8VJG
 RRufYXOmySY5ifN6NNLn9+K5PepYseQyRb/sRHsh9lPiAmh9eivc8/DGs74EEk4yg/7F
 UOpV/Xa9tNRK8CEluG0wzJTaI0ct0H9jFqENz+KVrj17hptKPLaJ1j8ScWRTamiozm5v
 ImjA==
X-Gm-Message-State: AOJu0YxZI3u+sxznJtSPIAa1xvJARt+Rkd69RsBp8OoOnzVhOvHJkDAi
 uZe0Vm/sMUvXijIVPgaTCIZ0dkh9iUqBo4cjF45SrtuFAzCYRkffN82sbmVtDyeIOP4Deg2oDd6
 +1yWW
X-Gm-Gg: ATEYQzyZsO0PYX4WepNhxYYX7m2kjIyFsMzJg0EmY51He2wgWkDB9SjLZtzBKfAe12E
 JZptr9iTKNH2D3fH0BNaDKami6KgQ6Rh7QD/SYBBk8H3C2WzN5I+gZGTayeqfjiD648Bt9mxJRo
 39NaEPte/SJaX8A3PCmOVsjLWyEP2c1AMKJ+21Xq8Hu0EP9d7pVkA7cDdLxGA1YEmBHsvkCFl5k
 zrqhUUrg/+b6xBIVEbbNMMNOuQ+2sBzehmkQ2P/9b/SwbO/tDWX/E/x0CDsq/vpQRiY/5sy+ktV
 LIBSEwmJg535O5Qc0900lk2Wcx6FKZTIEK5K5jtK+uEw3LbLhePcDWw0nzzoY2zidwTcebZMk5q
 05PhbqgoMJ9lHhOlTQ7jDt1LUeoeaD4O7pNrq391VATwuDqOECOUMsMMVKCvAUcFBpjqmqarJ2/
 j7cuCRkgmQxkFWBXA=
X-Received: by 2002:a17:906:f59a:b0:b87:6953:9d5e with SMTP id
 a640c23a62f3a-b93764f8694mr205423966b.33.1772211616593; 
 Fri, 27 Feb 2026 09:00:16 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935ac74adasm162641166b.27.2026.02.27.09.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 09:00:15 -0800 (PST)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E . MORIN" <yann.morin@orange.com>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Fri, 27 Feb 2026 18:00:13 +0100
Message-ID: <20260227170013.159176-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772211617; x=1772816417; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5d+E4E4CUmF17wDFtQVjixL9ec/V6NDHLJ9nYUzbQMQ=;
 b=YuRnmH9kpAMR4dNYi56B3DWVg3Di0ffDy6hdQBXpGhjt5J0ddDXpYLaOwDc3pFe5DD
 YuYjEGT0tnKJgwtHwXRg+dex/xJFdLgtQfZm4Ow+j3OBRCfcbt26naqWyR82uGcFc6hW
 Iu1XXJQ6vKc/ccK1JH6yHw9dGNyTPTo5a8+ekhBjLZXlh6mToWFcTBBJ1WFa+NQ8W07P
 RHHZ3Ubx1itpD5+RTk9B/vBhMkv6uY1SqRsreBXxJfZiocVaxRpJgu08xI4Z8P8/Mxha
 vuL1uUWS4g2Q5N6a4ajuHcVHb3ghGYrsccr16iunoy73f6I4ZVvNspo+lPnH4rcOU8KF
 NPPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=YuRnmH9k
Subject: [Buildroot] [2025.02.x,
 PATCH 1/1] package/gpsd: add patches for CVE-2025-67268 &
 CVE-2025-67269
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The `0002-gpsd-packet.c-Fix-integer-underflow-is-malicious-Nav.patch`
patch remove a hunk added in [1], not present in version 3.25. present
in 2025.02.x.

Fixes the following vulnerabilities:

- CVE-2025-67268:
    gpsd before commit dc966aa contains a heap-based out-of-bounds write
    vulnerability in the drivers/driver_nmea2000.c file. The hnd_129540
    function, which handles NMEA2000 PGN 129540 (GNSS Satellites in View)
    packets, fails to validate the user-supplied satellite count against
    the size of the skyview array (184 elements). This allows an attacker
    to write beyond the bounds of the array by providing a satellite count
    up to 255, leading to memory corruption, Denial of Service (DoS), and
    potentially arbitrary code execution.

For more information, see:
  - https://gitlab.com/gpsd/gpsd/-/commit/dc966aa74c075d0a6535811d98628625cbfbe3f4
  - https://www.cve.org/CVERecord?id=CVE-2025-67268

- CVE-2025-67269:
    An integer underflow vulnerability exists in the `nextstate()`
    function in `gpsd/packet.c` of gpsd versions prior to commit
    `ffa1d6f40bca0b035fc7f5e563160ebb67199da7`. When parsing a NAVCOM
    packet, the payload length is calculated using `lexer->length =
    (size_t)c - 4` without checking if the input byte `c` is less than 4.
    This results in an unsigned integer underflow, setting `lexer->length`
    to a very large value (near `SIZE_MAX`). The parser then enters a loop
    attempting to consume this massive number of bytes, causing 100% CPU
    utilization and a Denial of Service (DoS) condition.

For more information, see:
  - https://gitlab.com/gpsd/gpsd/-/commit/ffa1d6f40bca0b035fc7f5e563160ebb67199da7
  - https://www.cve.org/CVERecord?id=CVE-2025-67269

[1] https://gitlab.com/gpsd/gpsd/-/commit/247a89136cce6bfada24d811271defb0f0dbc89d

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---

Buildroot commit d41ed2ea5420c65fef009f87c17b2095e0be35c3 did not apply
on version present on 2025.02.x this commit backport the patches.

 ...mea2000.c-Fix-issue-356-skyview-buff.patch | 378 ++++++++++++++++++
 ...x-integer-underflow-is-malicious-Nav.patch | 153 +++++++
 package/gpsd/gpsd.mk                          |   6 +
 3 files changed, 537 insertions(+)
 create mode 100644 package/gpsd/0001-drivers-driver_nmea2000.c-Fix-issue-356-skyview-buff.patch
 create mode 100644 package/gpsd/0002-gpsd-packet.c-Fix-integer-underflow-is-malicious-Nav.patch

diff --git a/package/gpsd/0001-drivers-driver_nmea2000.c-Fix-issue-356-skyview-buff.patch b/package/gpsd/0001-drivers-driver_nmea2000.c-Fix-issue-356-skyview-buff.patch
new file mode 100644
index 0000000000..c81945e00e
--- /dev/null
+++ b/package/gpsd/0001-drivers-driver_nmea2000.c-Fix-issue-356-skyview-buff.patch
@@ -0,0 +1,378 @@
+From dc966aa74c075d0a6535811d98628625cbfbe3f4 Mon Sep 17 00:00:00 2001
+From: "Gary E. Miller" <gem@rellim.com>
+Date: Tue, 2 Dec 2025 19:36:04 -0800
+Subject: [PATCH] drivers/driver_nmea2000.c: Fix issue 356, skyview buffer
+ overrun.
+
+CVE: CVE-2025-67268
+Upstream: https://gitlab.com/gpsd/gpsd/-/commit/dc966aa74c075d0a6535811d98628625cbfbe3f4
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ drivers/driver_nmea2000.c | 123 ++++++++++++++++++++++----------------
+ 1 file changed, 71 insertions(+), 52 deletions(-)
+
+diff --git a/drivers/driver_nmea2000.c b/drivers/driver_nmea2000.c
+index 71e04e134..3e40dc768 100644
+--- a/drivers/driver_nmea2000.c
++++ b/drivers/driver_nmea2000.c
+@@ -12,11 +12,11 @@
+  * Message contents can be had from canboat/analyzer:
+  *     analyzer -explain
+  *
+- * This file is Copyright 2012 by the GPSD project
++ * This file is Copyright by the GPSD project
+  * SPDX-License-Identifier: BSD-2-clause
+  */
+ 
+-#include "../include/gpsd_config.h"  /* must be before all includes */
++#include "../include/gpsd_config.h"  // must be before all includes
+ 
+ #if defined(NMEA2000_ENABLE)
+ 
+@@ -68,7 +68,7 @@ typedef struct PGN
+ 
+ #if LOG_FILE
+ FILE *logFile = NULL;
+-#endif /* of if LOG_FILE */
++#endif  // of if LOG_FILE
+ 
+ extern bool __attribute__ ((weak)) gpsd_add_device(const char *device_name,
+                                                    bool flag_nowait);
+@@ -89,14 +89,14 @@ static int scale_int(int32_t var, const int64_t factor)
+ static void print_data(struct gps_context_t *context,
+                        unsigned char *buffer, int len, PGN *pgn)
+ {
+-    if ((libgps_debuglevel >= LOG_IO) != 0) {
+-        int   l1, l2, ptr;
++    if (LOG_IO <= libgps_debuglevel) {
++        int   l1;
+         char  bu[128];
+ 
+-        ptr = 0;
+-        l2 = sprintf(&bu[ptr], "got data:%6u:%3d: ", pgn->pgn, len);
++        int ptr = 0;
++        int l2 = sprintf(&bu[ptr], "got data:%6u:%3d: ", pgn->pgn, len);
+         ptr += l2;
+-        for (l1=0;l1<len;l1++) {
++        for (l1 = 0; l1 < len; l1++) {
+             if (((l1 % 20) == 0) && (l1 != 0)) {
+                 GPSD_LOG(LOG_IO, &context->errout, "%s\n", bu);
+                 ptr = 0;
+@@ -276,7 +276,7 @@ static gps_mask_t hnd_127258(unsigned char *bu, int len, PGN *pgn,
+                              struct gps_device_t *session)
+ {
+     print_data(session->context, bu, len, pgn);
+-    /* FIXME?  Get magnetic variation */
++    // FIXME?  Get magnetic variation
+     GPSD_LOG(LOG_DATA, &session->context->errout,
+              "pgn %6d(%3d):\n", pgn->pgn, session->driver.nmea2000.unit);
+     return(0);
+@@ -358,7 +358,7 @@ static gps_mask_t hnd_126992(unsigned char *bu, int len, PGN *pgn,
+ {
+     // uint8_t        sid;
+     // uint8_t        source;
+-    uint64_t usecs;       /* time in us */
++    uint64_t usecs;       // time in us
+ 
+     print_data(session->context, bu, len, pgn);
+     GPSD_LOG(LOG_DATA, &session->context->errout,
+@@ -434,6 +434,7 @@ static gps_mask_t hnd_129540(unsigned char *bu, int len, PGN *pgn,
+                              struct gps_device_t *session)
+ {
+     int         l1;
++    int         expected_len;
+ 
+     print_data(session->context, bu, len, pgn);
+     GPSD_LOG(LOG_DATA, &session->context->errout,
+@@ -441,24 +442,39 @@ static gps_mask_t hnd_129540(unsigned char *bu, int len, PGN *pgn,
+ 
+     session->driver.nmea2000.sid[2]           = bu[0];
+     session->gpsdata.satellites_visible       = (int)bu[2];
++    if (MAXCHANNELS <= session->gpsdata.satellites_visible) {
++        // Handle a CVE for overrunning skyview[]
++        GPSD_LOG(LOG_WARN, &session->context->errout,
++                 "pgn %6d(%3d): Too many sats %d\n",
++                 pgn->pgn, session->driver.nmea2000.unit,
++                 session->gpsdata.satellites_visible);
++        session->gpsdata.satellites_visible = MAXCHANNELS;
++    }
++    expected_len = 3 + (12 * session->gpsdata.satellites_visible);
++    if (len != expected_len) {
++        GPSD_LOG(LOG_WARN, &session->context->errout,
++                 "pgn %6d(%3d): wrong  length %d s/b %d\n",
++                 pgn->pgn, session->driver.nmea2000.unit,
++                 len, expected_len);
++        return 0;
++    }
+ 
+     memset(session->gpsdata.skyview, '\0', sizeof(session->gpsdata.skyview));
+-    for (l1=0;l1<session->gpsdata.satellites_visible;l1++) {
+-        int    svt;
+-        double azi, elev, snr;
+-
+-        elev  = getles16(bu, 3+12*l1+1) * 1e-4 * RAD_2_DEG;
+-        azi   = getleu16(bu, 3+12*l1+3) * 1e-4 * RAD_2_DEG;
+-        snr   = getles16(bu, 3+12*l1+5) * 1e-2;
++    for (l1 = 0; l1 < session->gpsdata.satellites_visible; l1++) {
++        int offset = 3 + (12 * l1);
++        double elev  = getles16(bu, offset + 1) * 1e-4 * RAD_2_DEG;
++        double azi   = getleu16(bu, offset + 3) * 1e-4 * RAD_2_DEG;
++        double snr   = getles16(bu, offset + 5) * 1e-2;
+ 
+-        svt   = (int)(bu[3+12*l1+11] & 0x0f);
++        int svt   = (int)(bu[offset + 11] & 0x0f);
+ 
+-        session->gpsdata.skyview[l1].elevation  = (short) (round(elev));
+-        session->gpsdata.skyview[l1].azimuth    = (short) (round(azi));
++        session->gpsdata.skyview[l1].elevation  = elev;
++        session->gpsdata.skyview[l1].azimuth    = azi;
+         session->gpsdata.skyview[l1].ss         = snr;
+-        session->gpsdata.skyview[l1].PRN        = (short)bu[3+12*l1+0];
++        session->gpsdata.skyview[l1].PRN        = (int16_t)bu[offset];
+         session->gpsdata.skyview[l1].used = false;
+-        if ((svt == 2) || (svt == 5)) {
++        if ((2 == svt) ||
++            (5 == svt)) {
+             session->gpsdata.skyview[l1].used = true;
+         }
+     }
+@@ -588,7 +604,7 @@ static gps_mask_t hnd_129029(unsigned char *bu, int len, PGN *pgn,
+                              struct gps_device_t *session)
+ {
+     gps_mask_t mask;
+-    uint64_t usecs;    /* time in us */
++    uint64_t usecs;    // time in us
+ 
+     print_data(session->context, bu, len, pgn);
+     GPSD_LOG(LOG_DATA, &session->context->errout,
+@@ -675,7 +691,7 @@ static gps_mask_t hnd_129038(unsigned char *bu, int len, PGN *pgn,
+             (unsigned int)ais_direction((unsigned int)getleu16(bu, 21), 1.0);
+         ais->type1.turn = ais_turn_rate((int)getles16(bu, 23));
+         ais->type1.status    = (unsigned int) ((bu[25] >> 0) & 0x0f);
+-        ais->type1.maneuver  = 0; /* Not transmitted ???? */
++        ais->type1.maneuver  = 0;  // Not transmitted ????
+         decode_ais_channel_info(bu, len, 163, session);
+ 
+         return(ONLINE_SET | AIS_SET);
+@@ -730,8 +746,9 @@ static gps_mask_t hnd_129039(unsigned char *bu, int len, PGN *pgn,
+ 
+ /*
+  *   PGN 129040: AIS Class B Extended Position Report
++ *
++ *  No test case for this message at the moment
+  */
+-/* No test case for this message at the moment */
+ static gps_mask_t hnd_129040(unsigned char *bu, int len, PGN *pgn,
+                              struct gps_device_t *session)
+ {
+@@ -781,8 +798,8 @@ static gps_mask_t hnd_129040(unsigned char *bu, int len, PGN *pgn,
+         ais->type19.epfd         = (unsigned int) ((bu[23] >> 4) & 0x0f);
+         ais->type19.dte          = (unsigned int) ((bu[52] >> 0) & 0x01);
+         ais->type19.assigned     = (bool)         ((bu[52] >> 1) & 0x01);
+-        for (l=0;l<AIS_SHIPNAME_MAXLEN;l++) {
+-            ais->type19.shipname[l] = (char) bu[32+l];
++        for (l = 0; l < AIS_SHIPNAME_MAXLEN; l++) {
++            ais->type19.shipname[l] = (char)bu[32+l];
+         }
+         ais->type19.shipname[AIS_SHIPNAME_MAXLEN] = (char) 0;
+         decode_ais_channel_info(bu, len, 422, session);
+@@ -914,7 +931,7 @@ static gps_mask_t hnd_129794(unsigned char *bu, int len, PGN *pgn,
+         ais->type5.draught       = (unsigned int) (getleu16(bu, 51)/10);
+         ais->type5.dte           = (unsigned int) ((bu[73] >> 6) & 0x01);
+ 
+-        for (l=0,cpy_stop=0;l<7;l++) {
++        for (l = 0, cpy_stop = 0; l < 7; l++) {
+             char next;
+ 
+             next = (char) bu[9+l];
+@@ -929,7 +946,7 @@ static gps_mask_t hnd_129794(unsigned char *bu, int len, PGN *pgn,
+         }
+         ais->type5.callsign[7]   = (char) 0;
+ 
+-        for (l=0,cpy_stop=0;l<AIS_SHIPNAME_MAXLEN;l++) {
++        for (l = 0, cpy_stop = 0; l < AIS_SHIPNAME_MAXLEN; l++) {
+             char next;
+ 
+             next = (char) bu[16+l];
+@@ -944,7 +961,7 @@ static gps_mask_t hnd_129794(unsigned char *bu, int len, PGN *pgn,
+         }
+         ais->type5.shipname[AIS_SHIPNAME_MAXLEN] = (char) 0;
+ 
+-        for (l=0,cpy_stop=0;l<20;l++) {
++        for (l = 0, cpy_stop = 0; l < 20; l++) {
+             char next;
+ 
+             next = (char) bu[53+l];
+@@ -978,7 +995,7 @@ static gps_mask_t hnd_129794(unsigned char *bu, int len, PGN *pgn,
+                date2.tm_year+1900,
+                ais->type5.hour,
+                ais->type5.minute);
+-#endif /* of #if NMEA2000_DEBUG_AIS */
++#endif  // end of #if NMEA2000_DEBUG_AIS
+         decode_ais_channel_info(bu, len, 592, session);
+         return(ONLINE_SET | AIS_SET);
+     }
+@@ -988,8 +1005,9 @@ static gps_mask_t hnd_129794(unsigned char *bu, int len, PGN *pgn,
+ 
+ /*
+  *   PGN 129798: AIS SAR Aircraft Position Report
++ *
++ * No test case for this message at the moment
+  */
+-/* No test case for this message at the moment */
+ static gps_mask_t hnd_129798(unsigned char *bu, int len, PGN *pgn,
+                              struct gps_device_t *session)
+ {
+@@ -1016,8 +1034,8 @@ static gps_mask_t hnd_129798(unsigned char *bu, int len, PGN *pgn,
+         ais->type9.alt       = (unsigned int) (getleu64(bu, 21)/1000000);
+         ais->type9.regional  = (unsigned int) ((bu[29] >> 0) & 0xff);
+         ais->type9.dte       = (unsigned int) ((bu[30] >> 0) & 0x01);
+-/*      ais->type9.spare     = (bu[30] >> 1) & 0x7f; */
+-        ais->type9.assigned  = 0; /* Not transmitted ???? */
++//      ais->type9.spare     = (bu[30] >> 1) & 0x7f;
++        ais->type9.assigned  = 0;  // Not transmitted ????
+         decode_ais_channel_info(bu, len, 163, session);
+ 
+         return(ONLINE_SET | AIS_SET);
+@@ -1028,8 +1046,9 @@ static gps_mask_t hnd_129798(unsigned char *bu, int len, PGN *pgn,
+ 
+ /*
+  *   PGN 129802: AIS Safety Related Broadcast Message
++ *
++ * No test case for this message at the moment
+  */
+-/* No test case for this message at the moment */
+ static gps_mask_t hnd_129802(unsigned char *bu, int len, PGN *pgn,
+                              struct gps_device_t *session)
+ {
+@@ -1043,8 +1062,8 @@ static gps_mask_t hnd_129802(unsigned char *bu, int len, PGN *pgn,
+     if (decode_ais_header(session->context, bu, len, ais, 0x3fffffff) != 0) {
+         int                   l;
+ 
+-/*      ais->type14.channel = (bu[ 5] >> 0) & 0x1f; */
+-        for (l=0;l<36;l++) {
++//      ais->type14.channel = (bu[ 5] >> 0) & 0x1f;
++        for (l = 0; l < 36; l++) {
+             ais->type14.text[l] = (char) bu[6+l];
+         }
+         ais->type14.text[36] = (char) 0;
+@@ -1079,7 +1098,7 @@ static gps_mask_t hnd_129809(unsigned char *bu, int len, PGN *pgn,
+                  "NMEA2000: AIS message 24A from %09u stashed.\n",
+                  ais->mmsi);
+ 
+-        for (l=0;l<AIS_SHIPNAME_MAXLEN;l++) {
++        for (l = 0; l < AIS_SHIPNAME_MAXLEN; l++) {
+             ais->type24.shipname[l] = (char) bu[ 5+l];
+             saveptr->shipname[l] = (char) bu[ 5+l];
+         }
+@@ -1119,12 +1138,12 @@ static gps_mask_t hnd_129810(unsigned char *bu, int len, PGN *pgn,
+ 
+         ais->type24.shiptype = (unsigned int) ((bu[ 5] >> 0) & 0xff);
+ 
+-        for (l=0;l<7;l++) {
++        for (l = 0; l < 7; l++) {
+             ais->type24.vendorid[l] = (char) bu[ 6+l];
+         }
+         ais->type24.vendorid[7] = (char) 0;
+ 
+-        for (l=0;l<7;l++) {
++        for (l = 0; l < 7; l++) {
+             ais->type24.callsign[l] = (char) bu[13+l];
+         }
+         ais->type24.callsign[7] = (char )0;
+@@ -1158,7 +1177,7 @@ static gps_mask_t hnd_129810(unsigned char *bu, int len, PGN *pgn,
+         for (i = 0; i < MAX_TYPE24_INTERLEAVE; i++) {
+             if (session->driver.aivdm.context[0].type24_queue.ships[i].mmsi ==
+                 ais->mmsi) {
+-                for (l=0;l<AIS_SHIPNAME_MAXLEN;l++) {
++                for (l = 0; l < AIS_SHIPNAME_MAXLEN; l++) {
+                     ais->type24.shipname[l] =
+   (char)(session->driver.aivdm.context[0].type24_queue.ships[i].shipname[l]);
+                 }
+@@ -1566,7 +1585,7 @@ static void find_pgn(struct can_frame *frame, struct gps_device_t *session)
+                           frame->can_id & 0x1ffffff);
+             if ((frame->can_dlc & 0x0f) > 0) {
+                 int l1;
+-                for(l1=0;l1<(frame->can_dlc & 0x0f);l1++) {
++                for(l1 = 0; l1 < (frame->can_dlc & 0x0f); l1++) {
+                     (void)fprintf(logFile, "%02x", frame->data[l1]);
+                 }
+             }
+@@ -1591,8 +1610,8 @@ static void find_pgn(struct can_frame *frame, struct gps_device_t *session)
+         if (!session->driver.nmea2000.unit_valid) {
+             unsigned int l1, l2;
+ 
+-            for (l1=0;l1<NMEA2000_NETS;l1++) {
+-                for (l2=0;l2<NMEA2000_UNITS;l2++) {
++            for (l1 = 0; l1 < NMEA2000_NETS; l1++) {
++                for (l2 = 0; l2 < NMEA2000_UNITS; l2++) {
+                     if (session == nmea2000_units[l1][l2]) {
+                         session->driver.nmea2000.unit = l2;
+                         session->driver.nmea2000.unit_valid = true;
+@@ -1641,7 +1660,7 @@ static void find_pgn(struct can_frame *frame, struct gps_device_t *session)
+                              "pgn %6d:%s \n", work->pgn, work->name);
+                     session->driver.nmea2000.workpgn = (void *) work;
+                     session->lexer.outbuflen =  frame->can_dlc & 0x0f;
+-                    for (l2=0;l2<session->lexer.outbuflen;l2++) {
++                    for (l2 = 0; l2 < session->lexer.outbuflen; l2++) {
+                         session->lexer.outbuffer[l2]= frame->data[l2];
+                     }
+                 } else if ((frame->data[0] & 0x1f) == 0) {
+@@ -1659,7 +1678,7 @@ static void find_pgn(struct can_frame *frame, struct gps_device_t *session)
+ #endif /* of #if NMEA2000_FAST_DEBUG */
+                     session->lexer.inbuflen = 0;
+                     session->driver.nmea2000.idx += 1;
+-                    for (l2=2;l2<8;l2++) {
++                    for (l2 = 2; l2 < 8; l2++) {
+                         session->lexer.inbuffer[session->lexer.inbuflen++] =
+                             frame->data[l2];
+                     }
+@@ -1668,7 +1687,7 @@ static void find_pgn(struct can_frame *frame, struct gps_device_t *session)
+                 } else if (frame->data[0] == session->driver.nmea2000.idx) {
+                     unsigned int l2;
+ 
+-                    for (l2=1;l2<8;l2++) {
++                    for (l2 = 1; l2 < 8; l2++) {
+                         if (session->driver.nmea2000.fast_packet_len >
+                             session->lexer.inbuflen) {
+                             session->lexer.inbuffer[session->lexer.inbuflen++] =
+@@ -1689,7 +1708,7 @@ static void find_pgn(struct can_frame *frame, struct gps_device_t *session)
+                         session->driver.nmea2000.workpgn = (void *) work;
+                         session->lexer.outbuflen =
+                             session->driver.nmea2000.fast_packet_len;
+-                        for(l2 = 0;l2 < (unsigned int)session->lexer.outbuflen;
++                        for(l2 = 0; l2 < (unsigned int)session->lexer.outbuflen;
+                             l2++) {
+                             session->lexer.outbuffer[l2] =
+                                 session->lexer.inbuffer[l2];
+@@ -1791,7 +1810,7 @@ int nmea2000_open(struct gps_device_t *session)
+     (void)strlcpy(interface_name, session->gpsdata.dev.path + 11,
+                   sizeof(interface_name));
+     unit_ptr = NULL;
+-    for (l=0;l<strnlen(interface_name,sizeof(interface_name));l++) {
++    for (l = 0; l < strnlen(interface_name, sizeof(interface_name)); l++) {
+         if (interface_name[l] == ':') {
+             unit_ptr = &interface_name[l+1];
+             interface_name[l] = 0;
+@@ -1908,7 +1927,7 @@ int nmea2000_open(struct gps_device_t *session)
+                 interface_name,
+                 MIN(sizeof(can_interface_name[0]), sizeof(interface_name)));
+         session->driver.nmea2000.unit_valid = false;
+-        for (l=0;l<NMEA2000_UNITS;l++) {
++        for (l = 0; l < NMEA2000_UNITS; l++) {
+             nmea2000_units[can_net][l] = NULL;
+         }
+     }
+@@ -1931,8 +1950,8 @@ void nmea2000_close(struct gps_device_t *session)
+         if (session->driver.nmea2000.unit_valid) {
+             unsigned int l1, l2;
+ 
+-            for (l1=0;l1<NMEA2000_NETS;l1++) {
+-                for (l2=0;l2<NMEA2000_UNITS;l2++) {
++            for (l1 = 0; l1 < NMEA2000_NETS; l1++) {
++                for (l2 = 0; l2 < NMEA2000_UNITS; l2++) {
+                     if (session == nmea2000_units[l1][l2]) {
+                         session->driver.nmea2000.unit_valid = false;
+                         session->driver.nmea2000.unit = 0;
+-- 
+GitLab
diff --git a/package/gpsd/0002-gpsd-packet.c-Fix-integer-underflow-is-malicious-Nav.patch b/package/gpsd/0002-gpsd-packet.c-Fix-integer-underflow-is-malicious-Nav.patch
new file mode 100644
index 0000000000..8703cf5c35
--- /dev/null
+++ b/package/gpsd/0002-gpsd-packet.c-Fix-integer-underflow-is-malicious-Nav.patch
@@ -0,0 +1,153 @@
+From ffa1d6f40bca0b035fc7f5e563160ebb67199da7 Mon Sep 17 00:00:00 2001
+From: "Gary E. Miller" <gem@rellim.com>
+Date: Wed, 3 Dec 2025 19:04:03 -0800
+Subject: [PATCH] gpsd/packet.c: Fix integer underflow is malicious Navcom
+ packet
+
+Causes DoS.  Fix issue 358
+
+CVE: CVE-2025-67269
+Upstream: https://gitlab.com/gpsd/gpsd/-/commit/ffa1d6f40bca0b035fc7f5e563160ebb67199da7
+[thomas: backport remove hunk added in https://gitlab.com/gpsd/gpsd/-/commit/247a89136cce6bfada24d811271defb0f0dbc89d]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ gpsd/packet.c | 64 ++++++++++++++++++++++++++++++++++++++-------------
+ 1 file changed, 48 insertions(+), 16 deletions(-)
+
+diff --git a/gpsd/packet.c b/gpsd/packet.c
+index 368dc551d..fdb3f25d0 100644
+--- a/gpsd/packet.c
++++ b/gpsd/packet.c
+@@ -1020,18 +1020,22 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
+ #endif  // SIRF_ENABLE || SKYTRAQ_ENABLE
+ #ifdef SIRF_ENABLE
+     case SIRF_LEADER_2:
+-        // first part of length
+-        lexer->length = (size_t) (c << 8);
++        // first part of length, MSB
++        lexer->length = (c & 0x7f) << 8;
++        if (lexer->length > MAX_PACKET_LENGTH) {
++            lexer->length = 0;
++            return character_pushback(lexer, GROUND_STATE);
++        } // else
+         lexer->state = SIRF_LENGTH_1;
+         break;
+     case SIRF_LENGTH_1:
+         // second part of length
+         lexer->length += c + 2;
+-        if (lexer->length <= MAX_PACKET_LENGTH) {
+-            lexer->state = SIRF_PAYLOAD;
+-        } else {
++        if (lexer->length > MAX_PACKET_LENGTH) {
++            lexer->length = 0;
+             return character_pushback(lexer, GROUND_STATE);
+-        }
++        } // else
++        lexer->state = SIRF_PAYLOAD;
+         break;
+     case SIRF_PAYLOAD:
+         if (0 == --lexer->length) {
+@@ -1073,6 +1077,7 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
+             return character_pushback(lexer, GROUND_STATE);
+         }
+         if (MAX_PACKET_LENGTH < lexer->length) {
++            lexer->length = 0;
+             return character_pushback(lexer, GROUND_STATE);
+         }
+         lexer->state = SKY_PAYLOAD;
+@@ -1255,14 +1260,29 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
+         }
+         break;
+     case NAVCOM_LEADER_3:
++        // command ID
+         lexer->state = NAVCOM_ID;
+         break;
+     case NAVCOM_ID:
+-        lexer->length = (size_t)c - 4;
++        /* Length LSB
++         * Navcom length includes command ID, length bytes. and checksum.
++         * So for more than just the payload length.
++         * Minimum 4 bytes */
++        if (4 > c) {
++            return character_pushback(lexer, GROUND_STATE);
++        }
++        lexer->length = c;
+         lexer->state = NAVCOM_LENGTH_1;
+         break;
+     case NAVCOM_LENGTH_1:
++        // Length USB.  Navcom allows payload length up to 65,531
+         lexer->length += (c << 8);
++        // don't count ID, length and checksum  in payload length
++        lexer->length -= 4;
++        if (MAX_PACKET_LENGTH < lexer->length) {
++            lexer->length = 0;
++            return character_pushback(lexer, GROUND_STATE);
++        }  // else
+         lexer->state = NAVCOM_LENGTH_2;
+         break;
+     case NAVCOM_LENGTH_2:
+@@ -1389,11 +1409,11 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
+         lexer->length += 2;     // checksum
+         // 10 bytes is the length of the Zodiac header
+         // no idea what Zodiac max length really is
+-        if ((MAX_PACKET_LENGTH - 10) >= lexer->length) {
+-            lexer->state = ZODIAC_PAYLOAD;
+-        } else {
++        if ((MAX_PACKET_LENGTH - 10) < lexer->length) {
++            lexer->length = 0;
+             return character_pushback(lexer, GROUND_STATE);
+-        }
++        }  // else
++        lexer->state = ZODIAC_PAYLOAD;
+         break;
+     case ZODIAC_PAYLOAD:
+         if (0 == --lexer->length) {
+@@ -1429,6 +1449,7 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
+             lexer->state = UBX_LENGTH_2;
+         } else {
+             // bad length
++            lexer->length = 0;
+             return character_pushback(lexer, GROUND_STATE);
+         }
+         break;
+@@ -1575,16 +1596,16 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
+         lexer->state = GEOSTAR_MESSAGE_ID_2;
+         break;
+     case GEOSTAR_MESSAGE_ID_2:
+-        lexer->length = (size_t)c * 4;
++        lexer->length = c * 4;
+         lexer->state = GEOSTAR_LENGTH_1;
+         break;
+     case GEOSTAR_LENGTH_1:
+         lexer->length += (c << 8) * 4;
+-        if (MAX_PACKET_LENGTH >= lexer->length) {
+-            lexer->state = GEOSTAR_LENGTH_2;
+-        } else {
++        if (MAX_PACKET_LENGTH < lexer->length) {
++            lexer->length = 0;
+             return character_pushback(lexer, GROUND_STATE);
+-        }
++        }  // else
++        lexer->state = GEOSTAR_LENGTH_2;
+         break;
+     case GEOSTAR_LENGTH_2:
+         lexer->state = GEOSTAR_PAYLOAD;
+@@ -1896,6 +1917,16 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
+ #endif  // STASH_ENABLE
+     }
+ 
++    /* Catch length overflow.  Should not happen.
++     * length is size_t, so underflow looks like overflow too. */
++    if (MAX_PACKET_LENGTH <= lexer->length) {
++        GPSD_LOG(LOG_WARN, &lexer->errout,
++                 "Too long: %zu state %u %s c x%x\n",
++                 lexer->length, lexer->state, state_table[lexer->state], c);
++        // exit(255);
++        lexer->length = 0;
++        return character_pushback(lexer, GROUND_STATE);
++    }
+     return true;        // no pushback
+ }
+ 
+-- 
+GitLab
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 07d6d11f02..62144f46a7 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -12,6 +12,12 @@ GPSD_CPE_ID_VALID = YES
 GPSD_SELINUX_MODULES = gpsd
 GPSD_INSTALL_STAGING = YES
 
+# 0001-drivers-driver_nmea2000.c-Fix-issue-356-skyview-buff.patch
+GPSD_IGNORE_CVES += CVE-2025-67268
+
+# 0002-gpsd-packet.c-Fix-integer-underflow-is-malicious-Nav.patch
+GPSD_IGNORE_CVES += CVE-2025-67269
+
 GPSD_DEPENDENCIES = host-scons host-pkgconf
 
 GPSD_LDFLAGS = $(TARGET_LDFLAGS)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
