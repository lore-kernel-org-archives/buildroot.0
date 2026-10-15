Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49358CCA464
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 19:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5ABD60A3E;
	Thu, 15 Oct 2026 19:32:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wTnkB8hm6ehN; Thu, 15 Oct 2026 19:32:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1B9F5608F2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792092779;
	b=dQHfB196wTJdE7eEcDHc0+RmH+aRptgQYKd6Po13sbL541FjUUCLcIJqY+nbcTJlfP+7
	 8VfXW2FTZCFtb2Teou0cwWDyvZPDY5VsV6H3YLd+yB5prl2/qe35YCjiUMY06JlZBrDHG
	 lOpMTqp/AVZOxPw4MbSTzBc8ZwjLz9SER7U4UUGnJ/ssDPIkjarJ4Uz0Yv81Fo9tbT1bC
	 iiwXaVqiQsfceoa4Mx5ff1n9sxrePbfcN861OoAYdDG+VFu4DmuU8+JKNcrVRBDQOMKTe
	 hOEGBWGKyvszJy28MB96kwU2LC7cYeigHYGRPQmJeMIp2/Mz8KVgsig+LxJ7OjODsuQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792092779;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=8CvPIlF41E1x4kPS9e/Q6GT0sB64Eal20Zug2iZzhVw=;
	b=UWKL3TfpGsAq8aQkjosHECPI69aD5e6oPLHo+1ZI2gG1da6/5Q8xJZl1RxYzDI2L3Xtt
	 6P/oPr3taHOo82Rbh3MeshDV9Voii4gqgIRI8BMDZCnmTNDjtxRTePIAFEd+WJjYqccRX
	 r84DyoXIywzo6Y4nR42GorpFgs/s56Gtp0v1AkQcdVUykTNCgoQt2a/3J6hh5ImI5ImSg
	 jy+EZpXI2+1RkNUtPHJMfLR4egpoRiJJSFv9thS2KDpjHRe7i06j936h/QohociP4hi2K
	 QzCJVlAu0P82tpE5gmjZY2PzmGtu4f/McHx/UI/VyflBRoqdWL2b9wjJBLwFuyr5XfA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792092779;
	bh=8CvPIlF41E1x4kPS9e/Q6GT0sB64Eal20Zug2iZzhVw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hBQDakXY+/WO2B1gfV1tvNtUnTjRSmspx+nV13yWcQ4lQzfx3vCtge4KYhNQZsQq+
	 7TIaxqfdCDEI7iZwsxZP0ts+/7OJkG+Tub2f3RNQiq3yRCMwY8KpnRLntZ+mbqfe7w
	 nYLzTptyZzAtrTQZRrZJxhuK7vX+MSkhI//O2HJhu/24DMRGn8X4fOcSfw+Y5kKdYL
	 bUvUG6FQlfrejfxzhNIEn+okhSata99qLD8+w4qvrgsrRUySoOGIbFpP08QeZ3IJ8w
	 HQIhhxzswCCdc1m1G2EbUHNNIvty9oqgSL+wbxd7qZyt6sn2e/Rg4tWPo0tnX7Zj30
	 EIGBQOEmpWXMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B9F5608F2;
	Thu, 15 Oct 2026 19:32:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EED8362
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34782811E7
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:32:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yWuhWBwyUuP6 for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 19:32:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 36A45810F5
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c31"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792092776;
 b=OIVZ+sxRMiR8yx3KiJ+FFXMVVtjhIvvYXi+0Vy7v9jmN7NFzTNRlfvhchsA3kyML0vHw
 DQ6X5ZXQEeN8/NqPnwf0I5EUrSShy2nQ9X9z1OvJtyJMPyADzrhkIsndxJFp12Iy5MxlY
 3OANgNATRCsOYfH01w2Ef4ssEPbeVfAKuaMNdV2rjnjYUzJlWrVt7V9AnqxCKUwo8jlyK
 CMU0SctOg3ondxylwVfXTiK1pPdvk67FNjQLoFzSapqbtSQ0UymHKdlmMhZa224pGwXFe
 9NcahAXo9Na3Qz3YkyIVhHvfTMW5YtjtBQTMRpIDLi73Elr7PhCwVcz4bByS8IpEWMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792092776;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=swM6DUeuvJlfu7Zk4RM0LaVdKDGcX3HjM3kcqFV/OHQ=;
 b=dNcG+/0zh1UzeVDSfRBSJs9w7t2DeE/Oqfd9aUitgaD6ikae8wJ0bGlV5mk5J2VKzvGu
 c/b0+nI6M8lZctwBVl5zoU4wstkeZPCHryLyRW7/EqZKf0nkuRquQZ3rIGw380RZSN8FD
 gxFq8MudOSvt3/x4tKx89EPsUGH148cJuL0zGYCvdIn4GnzXWs0DvywCU5I9eYWUA/JOO
 1CbnSs7co+qIqA3oHn003s+PrnuOGV04j71WrO1bss7auFxF9NvH7BEt+AOwMbIyT/rlX
 FMB+C45uCb13o4lQzBcBC2tXGHBP4PsSDUS1NwFilGUsYxyZW3kjbeIgDAeMqGCRx3w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=WPBi6HEw; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c31"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c31; helo=mail-oo1-xc31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=WPBi6HEw
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36A45810F5
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:32:55 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-6dd7070699eso1717709eaf.3
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 12:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792092775; x=1792697575; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=swM6DUeuvJlfu7Zk4RM0LaVdKDGcX3HjM3kcqFV/OHQ=;
 b=WPBi6HEwJ9/KIpygHGAPL73THvhnKzPKqQ13GUwETBFKZ0cWgoA5J+W34mvjJshqPk
 WnJYbdhfCHep+ffDcZFFwOdiN3X0MLL4EkIYSEhOMsAE46zsHV5sTYbL/j/Lyd4qymQ+
 OHybdTfSVAhavlgujFT37MEMfU7IygAka7xJ1NbSI6WRm2gw1reriMnpFGl66D1VOSdz
 pqOvMAf3cM/jEg+H4f7FUZ7EZx6MgWj0Xq8UwynID/qp5X58mv+E5W2mfe1dreoIqEr+
 rBe1u2W7k2HtZ3XB2e84zeSY+BUSsPKNIYL+NlwnfRsmUXCPaAbUWXKsgoeyA6trjlGH
 NZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792092775; x=1792697575;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=swM6DUeuvJlfu7Zk4RM0LaVdKDGcX3HjM3kcqFV/OHQ=;
 b=eRXCjVM+Zx+BVgiZik0VXRbyT2ws9vEtPPvLs3OxqVe8s23SAeyCAHBqchsdliA45J
 v49kEzalpC3QYOftkyJ/oQTNJEQjxGuojKe5mkbF5bpbxvvmh2KhkFW6l6BkdbXF5CzZ
 TesKLbX6uUAPscQ7UeXzpVi11gdU0kj7a2rJrdB9/6aBTwV+bZ6FKMugoblEjkh51gYE
 muLSHYMdCOsIVDaesFTWvLNucdkgOi+jsSyZMjm9hA2D3MI98pokO1FuhK5q5sKtDamK
 3Puox8vPogdl+HwbStuO33Sj7eKhvwoAi6I1QyQ1pfnMEuKxuvzm5EEYZOT6iBGwwyLc
 83lg==
X-Gm-Message-State: AFq9FYI1ILc/hHp8ZLWD2sjo1OwULkl+KAa0sWGaUForURwMvVy6D8Ix
 XqU91I++7WZ2VWh5BM5+AkOiL0k+svWHODJd8pk2iQu5iM5VJPTfQSt983dDHQ==
X-Gm-Gg: AYBFou0wzTazZUjgnQ0mtqQ91JoqgudWtWzr0FI8vmvXhe6yX0ieDTJKWx8G38AolsV
 qe/wLBMpQsALs8WQ60NBgzKXetVVIGnf0zV4TjeY3oFnPCJ7ej8BYknkljnWpVGoWK1yRNy8qQO
 wGyLA8ZuW65L22TGTLnwb72pKdyUW+KkGDUxUO4wYDQ/e/gTqlh//9bG4vazFbwHAh49bvJxXJJ
 CwW/57HooLWbxo+4KfdefZMM3+U4vmHLa5DtmDMtxlzFJjW14L5u1wwCW1mZbgQbRWXj2Xef3W1
 te1f2laQIz4V3oagjxUfA2I0Chlz+fx5c+ssUAirCg27glKlcuxgO6caztx+CU2Ecpj9L2ndlha
 iu6mfTGCICR7U3a6IeZ0/bA2k18cmppBnTRiME3eigpckunNmC7HzhEDGbH+8JfpLypdRBLAogp
 9J8kufeiAvGBzPnkkfVpS/7kL/9WiLOcdDUxcmKo1RUH/qVNh+o9CSa417Xj9uv5J1RMfPPKUGZ
 UJkImSrrY2Tp7SZ2FGVGqwpY8F0JiLpR7Fj5Gy4XR/xsurIIJXCzmyJwPQF1ng1MOqE8l8eatUM
 UZ9wgHA+XHqhBRJOC7gwmJpJ77kUWeMRi/XcmuP1CoAfR0hKrOmHDWr6sf+boOzWYtoIJDo2O88
 B9HUbycnjsNJ9JCBaLk5J1nAoKjjm4/X7crf4DfbzvsIt0obHrL/p
X-Received: by 2002:a05:6820:200b:b0:6dc:4fc2:bb2 with SMTP id
 006d021491bc7-6ef0eec6e2fmr14944893eaf.17.1792092774892; 
 Thu, 15 Oct 2026 12:32:54 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-7018f2df328sm180045eaf.7.2026.10.15.12.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 12:32:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 13:32:36 -0600
Message-ID: <20261015193243.3299884-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015193243.3299884-1-james.hilliard1@gmail.com>
References: <20261015193243.3299884-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/9] package/python-autocommand: add host
 variant
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable a host variant for host-python-jaraco-text, which is needed by
the standalone pkg_resources package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-autocommand/python-autocommand.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-autocommand/python-autocommand.mk b/package/python-autocommand/python-autocommand.mk
index 37b421e418..1eab76123d 100644
--- a/package/python-autocommand/python-autocommand.mk
+++ b/package/python-autocommand/python-autocommand.mk
@@ -12,3 +12,4 @@ PYTHON_AUTOCOMMAND_LICENSE = LGPL-3.0+
 PYTHON_AUTOCOMMAND_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
