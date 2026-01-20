Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EFED2ED0F
	for <buildroot@archiver.kernel.org>; Tue, 20 Jan 2026 08:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFB254EE1E;
	Tue, 20 Jan 2026 08:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3gd7U83jhA67; Tue, 20 Jan 2026 08:24:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75C504EE2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768897458;
	bh=cMZcTUTNL8TEyNFzrAwV6HsJQNGieJG3X7HuDQi3zug=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K0P0J3c1aTcMj30h0DYJILCliJkjebUDSEJeYTumOs5N0skKoIc0icMgh+FT8aRyc
	 hsXQUlcOXQ7HGEEY4oCZG889/4/WSTVAQE2+u9YyMtFWqLAbB8zzmTCEeHsG+6LPTx
	 ZWZ+R4yWSVtbEblQQReUTfFSyjZ50JoSWZIf8Ky2AGbBAQQJQOWMTbjxkuk0urdEbX
	 FvvYtpAuEa4ZYaUOHiUA6T3Kusoc8+XmpYNeSLng85Nv9RQvMRGbU/atSGtT3/dFp/
	 ESN3AAHdM4ubHgXzC1+YiMYb3gTQ2/zDMnQ4ZDYPTD/xQW+AS5D868Gv3857oHkfi2
	 NsaP5lfyIHqrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75C504EE2B;
	Tue, 20 Jan 2026 08:24:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 460002A8
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 08:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36EA86FC03
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 08:24:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L_llktR6faut for <buildroot@buildroot.org>;
 Tue, 20 Jan 2026 08:24:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3E5AF6FC05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E5AF6FC05
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E5AF6FC05
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 08:24:12 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b876798b97eso805116166b.1
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 00:24:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768897450; x=1769502250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZDNOeUUQ1E0ho94sAOGcR9gIOcXDd80Ckh5wdjpkNIw=;
 b=gP0iOCJk+WAVCQwC/aD8BCkMpLS1yZVjbmTifYj9UCWdiVbalEyfB1zFBLPphXe7Wr
 9pKx+BuQXi4uR0OksnaOR7J5yMG/3z1o9J5FyllJV1GDJm6NCZVCCdTUBwnzEaG9YxOw
 l9aXYCn5ykVJDJ8dIRdaW0XFYA9dprsY/zw0zqvY+k6KWAFiMuXHi7j6/sG03LVlaSeG
 OekARHmeJ4Pdm3SjluOyktRrA75uW/9t9LwRRI6EeklwqDAxwTWDcwsJXeMwCxL5JGoN
 di+L0lncO0Ufh0OsvmIh8fUv3yjOpXRKGXUH//HBlds9Eq8xWgi23q527fCdeXAoXT43
 nSSA==
X-Gm-Message-State: AOJu0YwNBR/kn1uxxXV3GsQMGrupTX+472rPqXNVJz5r4W8GKKNhRMVW
 HTebPgCkkNQV0gMeSZ3dRF1OmoA+5qFoMO1Rcm45z2QMbcd5Wibrui75YKMpxAVz6f8kbvEoME0
 TohbE
X-Gm-Gg: AY/fxX6rEehXyjCoqOGQznzLnMO48ImsK2NGd6cRYj3bgm+JpKNwqsdVc6y59NPolcR
 5Rkk24wrq7oYYngaqNGSZd5zTV+0fmn7CJN4ZrX52R8U555WvXvWX402OT0mw5LeaugwEMBGrbK
 82YhuM3GEpBAH+Ub1KUi7g5qFCmsnwHGC32uG44YjMakd+cpzwdXDkkCwuJ+MkLpMB5ZO08aaaX
 nFhv1Kr8g7l97LxG+rHy/ejHWgyIfVfiFGQ9aU0iwGDCnFlLcRHpeb6ZMuBsVvOiHdw26W5mP7O
 TWcd4zDNzK7c9A8imqDe9UQothdP+eq6lEd1wXdLs8m/FU+uGF2/coGp8XDdBUG5pMMj/z+fZFL
 CKgYeqLH2FSdCS5Aarnxbfjob01lQpLueOtSk6zvfMBvz7sUPPbZtcNzwf0jwg+el/LiheyMGit
 gl8g3A07pO/a2Y1WgWzG+DFZpeO6XFb60HckgqyFWP+xHaRQ==
X-Received: by 2002:a17:906:fe0a:b0:b87:1d79:bef4 with SMTP id
 a640c23a62f3a-b88003e0b85mr88617266b.9.1768897449740; 
 Tue, 20 Jan 2026 00:24:09 -0800 (PST)
Received: from arch (94.105.116.200.dyn.edpnet.net. [94.105.116.200])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b87959fbefdsm1307568566b.55.2026.01.20.00.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 00:24:09 -0800 (PST)
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Julien Viard de Galbert <julien@vdg.name>, Nimai Mahajan <nimaim@gmail.com>
Date: Tue, 20 Jan 2026 09:24:04 +0100
Message-ID: <20260120082405.46683-5-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120082405.46683-1-thomas.perale@mind.be>
References: <20260120082405.46683-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1768897450; x=1769502250; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZDNOeUUQ1E0ho94sAOGcR9gIOcXDd80Ckh5wdjpkNIw=;
 b=PUyfWz3E2HrjWCSb5Cwa4HIylKUL5aj12/RHqS3xcpVwqnXML777tbtTHgWR52z8NS
 b6ezF+ol+PtvFL74kjbY9oC1ACsePD0FZnkm+9TQh7aNYiMOS92kTC934XIYIqvZLRju
 G66xkTDytMJmPDMrxWbdXabAXJbA9VPu+IYWu6SJ9SUU6xEh9f9sksh3WUUTzyYxk6WQ
 wOzYcxIj6fNTETgfWehccJadWQ2LwsZ0wBe43cwMqu2a1WEPNFVRJm+ocB0qlGwE6KG1
 8zZ8NCvSvmVj9Hjj5v/+a85pXJvN7bckjA6R5/DykNIyQyRcZlKLaL8/0iQH13m98XFz
 PoRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PUyfWz3E
Subject: [Buildroot] [PATCH 5/6] package/igmpproxy: add CPE
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

The CPE `pali:igmpproxy` is a valid CPE for the package igmpproxy.

See the latest CVE: CVE-2025-50681 [1] that reference the upstream
repository.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-50681

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/igmpproxy/igmpproxy.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/igmpproxy/igmpproxy.mk b/package/igmpproxy/igmpproxy.mk
index 357c9087e0..f2c32939ff 100644
--- a/package/igmpproxy/igmpproxy.mk
+++ b/package/igmpproxy/igmpproxy.mk
@@ -11,4 +11,6 @@ IGMPPROXY_AUTORECONF = YES
 IGMPPROXY_LICENSE = GPL-2.0+, BSD-3-Clause (mrouted)
 IGMPPROXY_LICENSE_FILES = COPYING GPL.txt Stanford.txt
 
+IGMPPROXY_CPE_ID_VENDOR = pali
+
 $(eval $(autotools-package))
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
