Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331A1CA5FEA
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDE4E60D93;
	Sat,  3 Oct 2026 01:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rk3yAte8Q-Cc; Sat,  3 Oct 2026 01:33:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BA19F60B2B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991196;
	b=jP6CIsLV1pnVIaiRhikeMknYY1RUb+8Z2SbEiFQ2FsiICs7b6DZDp0682kxmOq8hrerJ
	 z84tN8rPVuvfHzvJL9x9WKGKCAHwTt0VIxFwe/YtVkw5hu7NkzNmjIia6BR5l0KHfgXe0
	 RdjkgWAR/XlEanDHuWqiL5B7tIX4VcOx8Fjwuv3DHpzUpJrAjfYsq3Y+S+Ri2c1zMcRcj
	 U50ZRDQiWxWtF0iXFj0vZohHQwP+L/oBpjJ6RK9iAY+q2znmiA+cddiWpttzOwgwnhpm3
	 IdcFyXEVhQHV6q9MXXoxRgclFZYc4zQ29HSEm2Xysry7Gq1GdEVhgNyXV6KX0pOJJww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991196;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lKiK7aaLde7J8shkMmgN1ymkV+iwwqbzUpNwfhSLqEY=;
	b=Fze/5N98F2FNUQNxV1CdgIIqjEX9ieMGL/N7VfzQEUAIlvqJugtUMx2uoE4mx/QEulCL
	 dvhAzn005lXG11/9aOy4Mzo8zyf188T4autx6ntMgowiHkJd05FSCps8e1cANja7MwwzI
	 t67xK8DphFj8Kclm5W3DK6eTm4WQm+Ond1xpjP1EzO09kKsXzDGl9Er7d6fDB6y+F7WHN
	 63u4uvHUTes+h3jabLg7RtZ3L2umQZ+ftlm1XcG1LV7R9lVHJ5Qw4pPbRjrKC6ieg00PF
	 kW12tVyW40Vbrcpy4UeVu5/w3ok8L9xNmn82HbuShp8/SIVo+nIQtYuTJXGdYGAyvtQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OSnbzyNf;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991196;
	bh=lKiK7aaLde7J8shkMmgN1ymkV+iwwqbzUpNwfhSLqEY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=TUQdytWmJWG9Sf7aKyriTlwJyprTvGHIkzhGF74wYoIlahEOZbfdsMP6LpAl1/Pjt
	 mHDX7/gS/k2o54W+xlUhdFGMHb65nI1uoG/V6M/7PJti2CjXzkcotQv8PLPbf/NT21
	 cDpM2Nz3RozhCsldX5Y/tRu5VuiXRMcwE/2gX0ffgZK+dgiHbhVmZXzrUbPWTzHF8j
	 SDbfciI+aiFQ0e8SLKkfWxlT7fEzKo/P0Pa2lQVQ7Hcd5+TO4QwR9zbgTpx4uMqSwR
	 J7wsWouIjJBWPz5SUjlqG8bzePSifSWLZkTY+ZWHPR0Tb0sEiLFtmG9+/mYUB+86nq
	 TjzOS3Vme3S6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA19F60B2B;
	Sat,  3 Oct 2026 01:33:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F36F1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F315D6061D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PM5THsKPCrAB for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 17C7E60671
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c29"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991194;
 b=n0SIIMHBw9MwwX0677a5z+k7zROA7aD3x532746Wjjgzi35Uv4gkgk4aW2u8JzmvH0H2
 m00HCRT//VXNFsrwPK0EgxPVhln2xXS6Gmfnr8CDoB22viRRCmDp/5oUvDlz2RWrwv+CG
 0GzC/5g5RouoxDc6kcD2JRiTL2tzGAo+rIr24j3QI6tkhECeNGUv11S817NOJIY0xvsgi
 xZX8JnhHc1O4Lc+f6EPFg4ZCQB+XXK6LPD+SQqZJQ6PWwPaXIwMnBgwk4FvMjN33+NPjj
 F6n10jM97TiXJqgGIng6rFVRoTdoMB9hB5bH6ZawaoDo2tiYkt9GrMR8c1Hf3+ZUHHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991194;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=bNdyQLHB+HRY7O7os2/U+CrhfY6Csjhu3TTPqSXbumA=;
 b=rIIdomhNOMX6AcqkHsJNNkq45LpeVkGoytaRK03x/ilHRb9o2biwNqqNGi6tsOppuwV3
 /QV0tzo4TzKePHGxIGM8Te5bk134k74VA0m8yNwN3HinCj83y9Gg4AAvghDBg5fala4DF
 lgT+LXwbSoapOlsHnK9K4GqlAWz+Z/UsZCUETIi7EVaTCa5mjEPwvLXu3l9oEYjTcvFSl
 GfBSTeZuWEWl4mvrTduSXlxsbK+CiedXitdw/FkG6OkewRJRpSjaVGuWrXlOt2To9n9Km
 C8ptCnOI3rvmCA0uyAPXwMc3Qz5VZrs4LZ3I0NgP6P05X6MEovhHnSzp/PQYMGcdxmg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=OSnbzyNf; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c29"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c29; helo=mail-oo1-xc29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=OSnbzyNf
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17C7E60671
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:12 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-6deb848ddd7so249996eaf.0
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991191; x=1791595991; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=bNdyQLHB+HRY7O7os2/U+CrhfY6Csjhu3TTPqSXbumA=;
 b=OSnbzyNfH1hiMqHw8QcIAhg6xe/yAGvHP9eOfa6KufNKnwJgtJn3/42hgNb500JcFo
 ZxmJM0znaAwHJzaHL6NNfqNbxzxWsGXcjG6MyH9im/m3lPb+zK1DWyyuJr7KtoN0GDjt
 kHK/B4jDPDfPzuW/5FCATjlubWeBLvGc+NJHPhwlLFffIyOsSSyxOUuwwgPkGxdFQ+Gz
 yvvBgtZT2oiFdIlPvrrHtdzHGeBB/NwusP5XC4E58/s7/jtDi1xG/56DZLStL4NGs/RN
 1MEP6RMeTxt+oADu4m7JcyEM6nzLkVbpEe59gVvibCbM/oswUl1G7gWLk7HDR7gYfeMY
 fIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991191; x=1791595991;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bNdyQLHB+HRY7O7os2/U+CrhfY6Csjhu3TTPqSXbumA=;
 b=1amkv6mEdewzBT1q52ZUylgbJddnujdva6Codf7SSo5bDOmiG0JuxhUZN6eSlbEjxR
 18TUk0/YJLU+ALX/fLzt5CAIXtMrsVj9rVgazhkW9J/l13tUA/ABrqUREfGymjk3HKBq
 LLl8SBzKANqvacyUwc/lOdTetns+pjMHSGElcyytM/nprWiebh5RaAYjimGis9Zut+XX
 KfGaxhT5Ffvsy/GdaboxAONzAOCry9nMm+kbi3faXrUUbgNTYAsskXbVB8kbx2NvBXWB
 3Hjbk8hhEenOPRHvNddm0YjHSAi7rUExy6TO9rV6pg/Sh74aRpYV7czNYxTq3r1FeP6R
 rvVw==
X-Gm-Message-State: AFuF++lFn1qoP/L7ZBsVr6htrJXAQGWTDHmTr7J2y63r23xIQK208Hc6
 /EudJx70Swsjkj4AI1CPiVIeJ5Ia9doKkd2hIm3Xgv1F09SRY2QOteYWbpkfnA==
X-Gm-Gg: AYBFou2Kn4oahYO5rCGw0uiJ/vpX5INdUP0t/Hu7vYhZ/9mOeLec8PwEpfNhwl2TS8L
 QCVrsixyPEGv2Fg6FVOGZSWJ/54zJjB+Io0UNcMlqTdFwwcoA+Us99W3idUltcCOpdfUTzCj6BU
 CLwl2OgIGaJqoOLanB7s+MdfyqqDwc9b5KSqYpaAjdlnXhvmnA5JY0PokG4Fc/7R9CqX4cdyM0E
 SxewrMVVP8kWUvyoWAZmZRls5neFyYUrSWSLhYGY/G4pfpHtpVemWK+8APzfDRH/z6UrEnVV1dR
 s/o2EMi2uiz7pbFmjt6G8w2+Y0aGt7LG42ucnmsl43DgOMc0Vh8fHwqeyTf+TIGdybqwFt6T+3K
 cvrVl32LeGws0vnu6bCYxCU9yxNChf3OHYPQXxrsQtY9GrbIKP3ZvVM2KugL/htU4emqJDgQ9xh
 LjWXIxnDdWAqKVn8eaTTztlQ967LOsvQNUke5SX5RNb3WYd5oLL/vb/PIJ7F1vRr9PIQ6ANrG12
 PxJ0/hg9mofbYg2h8smSTuWuNJG3Vv8LEp9qF0enUx8giRaPp/22mCUPTOFHx7YgAjLWHl6wwMU
 ZZjAW89d1ez0tApBfq4TuU4dD61VL35ur/EBB+0/hbuhg6og/ddR+oUnIgplcDX8CajF7bymdf+
 djPHCJmsYEX7SCnQfGkw3hPSViSHQeq3hb6xLWtrSAw==
X-Received: by 2002:a05:6820:2913:b0:6d8:edd2:2afc with SMTP id
 006d021491bc7-6e09db97feamr898358eaf.36.1790991191040; 
 Fri, 02 Oct 2026 18:33:11 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:04 -0600
Message-ID: <20261003013304.400979-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-asyncclick: bump to version
 8.4.2.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-asyncclick/python-asyncclick.hash | 4 ++--
 package/python-asyncclick/python-asyncclick.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asyncclick/python-asyncclick.hash b/package/python-asyncclick/python-asyncclick.hash
index 15e8b1fb02..a161f38d86 100644
--- a/package/python-asyncclick/python-asyncclick.hash
+++ b/package/python-asyncclick/python-asyncclick.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asyncclick/json
-md5  9087d387a981ed313cbea4a4b54a13f3  asyncclick-8.3.0.7.tar.gz
-sha256  8a80d8ac613098ee6a9a8f0248f60c66c273e22402cf3f115ed7f071acfc71d3  asyncclick-8.3.0.7.tar.gz
+md5  d952fbc29b67314d31651cf10a3c01af  asyncclick-8.4.2.1.tar.gz
+sha256  8f259376ae8d4fcd91961c8ad3e85e9b63c9cf181a122201c7dfed3d7f6024b8  asyncclick-8.4.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.txt
diff --git a/package/python-asyncclick/python-asyncclick.mk b/package/python-asyncclick/python-asyncclick.mk
index 32d1eedfa2..deb4b431bc 100644
--- a/package/python-asyncclick/python-asyncclick.mk
+++ b/package/python-asyncclick/python-asyncclick.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNCCLICK_VERSION = 8.3.0.7
+PYTHON_ASYNCCLICK_VERSION = 8.4.2.1
 PYTHON_ASYNCCLICK_SOURCE = asyncclick-$(PYTHON_ASYNCCLICK_VERSION).tar.gz
-PYTHON_ASYNCCLICK_SITE = https://files.pythonhosted.org/packages/f9/ca/25e426d16bd0e91c1c9259112cecd17b2c2c239bdd8e5dba430f3bd5e3ef
+PYTHON_ASYNCCLICK_SITE = https://files.pythonhosted.org/packages/fd/b2/2c90a32d9b9cf1a4a90ed39cc1177890d146f3f89ae375b061d72110659a
 PYTHON_ASYNCCLICK_SETUP_TYPE = flit
 PYTHON_ASYNCCLICK_LICENSE = BSD-3-Clause
 PYTHON_ASYNCCLICK_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
