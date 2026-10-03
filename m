Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFFBCA5FE8
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41F2F40DC6;
	Sat,  3 Oct 2026 01:33:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 00KLXUgL_S8n; Sat,  3 Oct 2026 01:33:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7A69840DEA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991208;
	b=runF02x8o90TPYowxzXyjhV+mUM2iJDbcje/tvdI2k49EqdXGf109oM1e+EM6tWBx7Ui
	 pkIj0ZGm7FH0Jsl+5fY3AEHVIspThLn2NM5pV+W80GeYbIUMASMBT9iTw4TBow6oVDwP6
	 tXxyO6/7eVCsoJE1cVwrHsnjNUNuwjM4L9MZSa3hlF42oo2yhK0xg+5QlDqfgO4dk/98O
	 miOto4T4dqDMB5qXwGzrzc0kU0tQgCp64rlz7pvAdxIKLG1kVJ6Ax2mdj9DyKtMs8JHiR
	 0xQ888YS1YdMxUxWZQ9HSPpxZaxSmSz1N6dnltUC3xZdq7zxlBqJO9OVxtnuJUOipMQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991208;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=duJkg8NVd/wPh59/d0OCe534T89UNA4K2YsMfJJYyVw=;
	b=niSvwXK/VYcJE8hJEvKe78LWn+kUmh+T/aID0QvQeTdH5P/ucTuMkp0hMDLs0bdOtX4g
	 viJc1kSgmgjyHhs5uoMHQyW1WIC/upuJ4nCUn59uqvidReuKDW9tYS2ayPhQr5OEsu7mU
	 p9hx3xd5ryxQ+tSr8+B0qG2j/Ub/Pq9WhFVkr+z8IwqymPEl1tkXw9cW4XxQD7fs+bB69
	 olICkiXm23Ek22eqA9qayzCaohYH/L8jUhT4RScjVT91sRTxGqVjRCv0Rak9KuP1aibXL
	 yFaQaKPQ+1bptB89q0+cZT4vholKSl0HhY/Z7tbizNHEfi8623YlIbOeuFry7XV9VOw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991208;
	bh=duJkg8NVd/wPh59/d0OCe534T89UNA4K2YsMfJJYyVw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F56Cf6oWz5QhV8t6QLmNlNHqVqTongEDczH6thjVv/FMK0HZwUkEZIJAscO4qZUvF
	 cVsWe4D244wW6eczZkkKW6VLwE8QqOhzvu42/B1nnrFmf+nTF13D/SVVHmaW9zeXwg
	 zT/bUgJ16TaSCFr4JSGbfNI0YC1IZp82AJlo0v7qEYTgpy3bbNag0tsUv29TIZAS66
	 lYBxiEDI0rN5Mm59+F5WdO1SjQzIOKaDwVWRRcYEPpL2b62uMffidIi9rDiCzYkaDm
	 QCv5bRikXVnh0WWsrXdN1yU44rRxXf/tjI8t3Br26RaQDwEVhyzi5ufUtDhQhB07Vr
	 dNpIukeQQXDgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A69840DEA;
	Sat,  3 Oct 2026 01:33:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CB073179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF39A400F1
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nsm3JB5s5TA0 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org CFB1D400C8
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991206;
 b=PEVg/3BOpT3pCRUR+01eSAaYdN20keIwjGgyRBv/tnZjCZ+0ZT+ea+fJuZObICIseOp5
 HJIKpmqJd9AQQ1gN/4PKhw9ZJ3SjZfIZofdSXsCQ6aLEtU2uWtCqSNgHXZbncoaLcdNRy
 MFBcNfR+i1jPG2FubRITBfEkPeBRaskzkOjv72uPO7QwKc+xaOTTxeH7zy7oW5WTySwjb
 GT8hVyjyaiPWT7jAxormkDfnDjSFnf9WV039SXfklJT1LKmOH8XQOstGvpBVHn0/qwnIb
 KVUCc5lAb9MtSzzU5z/RPm9DaCN1BqcX8OyL/7zhlkpm3+wqEwqRVXgYgOcnwi3Jmlg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991206;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=tuvClprXvVY69bRnSqGZ6DIM7Veap8LBzVSZ33/Nw0I=;
 b=Fh4av/xq0YtpMFbkwKuKa2v6ZXe6OJ9hAGJPat15o7heb5QJksV7DJI/IHs4Z5PGFao3
 oDwOqKAcbN+epBfpYxA5XqSIzdnGUsTtDPIW5iaSYXRlxGywhOxaJvdeO/CccEXjxPhPg
 eCPiS9GJz6K8r5qHd0SPXKvUGah9CbIFj+FLtlGeA5rywC6keBxBFhhnl0QjKbvMpq5At
 F3SS/62mTgsxeG1V8S01zXyjvOsiJYE/6dGv3BqN/8IptpiBAgk2IATEc03VVOPoVnR7Z
 O7JqFMz4VU+dVBFgjqkmuvN7qOi6IQj8yTjRPBCeXe9+TiPfkMnu7HHqmqrf4E+O+sg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=jDCNR5xQ; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=jDCNR5xQ
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CFB1D400C8
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:25 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-82395ae2ea8so354916a34.1
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991204; x=1791596004; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=tuvClprXvVY69bRnSqGZ6DIM7Veap8LBzVSZ33/Nw0I=;
 b=jDCNR5xQF9who2Tvx4O12EB8tITjwq9SIjX3ZZKsIw70C8eOvCffUAT39lJCu48FVC
 X7O4M5tWtGx/SuGyMoPLx5GyH9ak95WbtGYx471lvQBbSKdlgYjZMYf6luvqJiW/uKkL
 pZQZgjf2tM2daaSl6hnGjNLpSZkOWJhRFWZsI+hZImwBUwcnbCOzDjcGOE3XqcrD23Hg
 v1rjf0YUSAu/2tvCDAfHEpRRx4AAd1eGliKrV8hSDQT4mPCDkHejf39eHZSZYT6NniR+
 WzAY8VbJ8ZHdm532iC3sjw/GOTYshsFMho10iEZ33owsnWX192rD5KOrV09SBINuZqr3
 3kHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991204; x=1791596004;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tuvClprXvVY69bRnSqGZ6DIM7Veap8LBzVSZ33/Nw0I=;
 b=rhkEksTIXeBr276m6HDY1Ejdm1YJ8DukwToIpadYnvuL+aBlkMHRvaiegg0/C1R2ap
 9+kPPXNvzE4iJkhhBtw6h3Fw3HU/O/mJx96aUFtBmoN6DbsXf6/H60b3d+qoy3MJuwac
 KADGDYVrbcKhfm5CvkiKvd2mKoMhs0PNtVx+C35e1eS7JAKzhrXNS1XrsBi6qPwtKUk8
 LW2ppdpD7DLp43rutmhImCDOB9oJOs4o/L71P03bXVBlDwjaBHkoiQDMJMT/wVthDp6T
 n7dDt1z5G33Ff4PuwUDA/sGN7/Lbv9f8R/NtNu4nfZVRF/N4rpkHbdM+fyQl/fwlNzf3
 92lA==
X-Gm-Message-State: AFuF++li3X1HjDKXCoilRNwgmyTGqpMCr2Y9lKIDyk4nELCX63JMt1fq
 ZFnBcaviOyvusOHIQM5AGR5jcS7XaIxahSW/N4/Qw3iWuP33RU0yGO4yhCC/OQ==
X-Gm-Gg: AYBFou3rFTL/phguHg67HvxHhAbB4N/qnbxIzBxG/k/1EnJv6//Kt3U4eOGQ6IaTrAn
 3YsR37Wqx29HpSeprxO72i/C1vN9kVDDtajRLOMQuz1cvKN0/2L05vO5MdTFvxEaMt5r4u5uGdK
 GSHr0HdQWD1LWL+FWPa+YPb5ndlAm2bnimcQHCUztHS+P+kXqPrMOnfZi/3VJCg3tHtuIbs6/zv
 OVDgPzGiOIQVlOVwi7RokowvAL3EWD9e4Zts5eSIZJiGDrYLDJxZRr10WdSl51HG1gMolOVwvlH
 UDyigbmzPBOwDgpWCwoCohq3wyHPnKIHNZY+d3FPArJPo+lpZ5p5pbxfMb4ZNUIVtKxH3F8BWZC
 o+wQX9zJi3iHt7mY/Y8ss4uCiTN1nWYIQdac3Ga9YOWOdFEl9R0fK8VOy0Q/7QBestuS4VsA+5i
 ADUGcyMdguN0CJnQcy1EZI2LCQvwv+E6UC8Bb89wi0CeKbTYaareUjpSXmMWhDSpEJYzeSqAA4J
 RhpjJFieKINhHWL2U/IBMaO4Aop6CSMfLT5ZBbm++RXh2X5nae/f7nM3qn6zt++0R8YqWBNFFz5
 6l8h3D/3CgSFf7YxFaneK3VyO6xpsbfGn2p9+xtI7J0zwRUh0vimObpJcrjrnXNHWjBIUyX6T7q
 3TXAGLomtKSoQLcc/GV1Tz3p4A9OgjVWzvxClyJEi7w==
X-Received: by 2002:a05:6830:67fd:b0:81e:bb3a:7ebc with SMTP id
 46e09a7af769-823fdbfad54mr1085167a34.26.1790991204582; 
 Fri, 02 Oct 2026 18:33:24 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri,  2 Oct 2026 19:32:12 -0600
Message-ID: <20261003013304.400979-12-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 1.12.1
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 9c36164589..da1eaa15d0 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
-# From https://github.com/mesonbuild/meson/releases/tag/1.12.0
-sha256  88afe0c20e52030218924ac37d0c81c59b4b5f3ae3752c8c6d7470c7d365886c  meson-1.12.0.tar.gz
+# From https://github.com/mesonbuild/meson/releases/tag/1.12.1
+sha256  ab0a6ca09f8ef70c564c8241fb5a23957886a0b53fb58412b5e07eaf07dba743  meson-1.12.1.tar.gz
 # Locally computed
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index cafbff4578..ebb2adf3f2 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 1.12.0
+MESON_VERSION = 1.12.1
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
