Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2200C624A4
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 15:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7080780D0F;
	Mon, 31 Aug 2026 15:50:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2iVYdEtDDF0C; Mon, 31 Aug 2026 15:50:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788191424;
	bh=+qo0xk7p7ACo7WeZIw4MM9+ioPdBPa4P7qUb3fcQdBI=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=AJpwOYXT/lBVRU2RUfnjtu9hBw9XKfjKPNmFPmh9EpBHuy8+CoTi9eR9lwWrxNf1i
	 Rm1ytY4uSx5rgWgD2CjDZCwsxra40AxNmChmY3/mf5J4hBTspQvyDls1GY5r0izcI5
	 +7MaTTVJ8PI5i+Uzfocz0fJ6TfzvwSFoKl2brMAroYOsA7ri99fXfynInyEYf3gbNJ
	 EwQB/JnkA4Piz/7gCmrEDnGytFjIiRL97ngmYf5ZWpZ9zVNtIYfx7ULHyYJjh7qlA4
	 2U20wz7AWR8zbk/fK76ts6dIMEvmfunKgrrEB34chVuY5XoBSmTHMmBbEkm6JMVw+p
	 xKX+BLAb8h1kQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8EA980BF1;
	Mon, 31 Aug 2026 15:50:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CAC2265
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 15:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2B63400F8
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 15:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s0g1m1u2QPN4 for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 15:50:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=chris.obbard@oss.qualcomm.com;
 receiver=<UNKNOWN> 
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05B2040074
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 15:50:21 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67VETQuD3341564
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 15:50:20 GMT
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd556t226-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 15:50:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92e52306621so475644785a.1
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 08:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788191419; x=1788796219;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=kgFFwzaEg9II+dieRIP3kbk4CGE9Kc2/lhT7hbfTYqY=;
 b=sc0sdXM1XMvpVdHW1PVbCMslDCKsuCxujewH22OUQDs0yqWTtfn0sitGe2XVcxhI4P
 ICrFScBLIfeEb1ePlB5Tw8dm0MEzxMjyzkbvyFCm9dkwTmQ+aoRvdPRyThdE2E/mkLX3
 5Oa6ZFHy7jkIdr2CkxK3BwMySNS7X0sd7h6LRvpvSUp9mgsKCf2Zpa2XTgcsd+dMIO+1
 EtHuwPUZW/fVbc9i6eTD4ek4DCk99r3X5cwBjnK5gf/Tv0bX5Pb+acKpivAa3pHtUum7
 iQH3FrsC3czaXfQRfXZeUqhmP7PPWHo7KUoDACs7VJVnRri1jI06Tby1XsSK/8zGzjaL
 VDLQ==
X-Gm-Message-State: AFuF++kABeNWh0jta1TNEB34so5cggal75kXqy/2auO//P0fMiT1u0EO
 hunYgVrXpAxzU4owo/5SS3Ax+sdnGJLDvtfTR2SivvhuJ0EbfVs9dDCynf5eR7IPgycqnZIU2NR
 tCi5sfF0lCPnPgAC6ot7PFSvAPR9C0i5dBZ/YzyAD35DoyAGai7vmOs3YzJN61Ynrc2A0
X-Gm-Gg: AR+sD10l5+EfGhTMcePc18MenIvZFOaNWMcH+GJwSWWo6Ta1hlXnWnTc872eZ1yEFFX
 B2ha06D4X8hquhxB/RoQr6uCiRNfeJRfzhzpJZkUKbLUzJVEIHPYCvtUqgd07rxJ0OAKTjqgcMp
 kx6twoHU5paARmpo0EQB8W/DyCpNBpFu2NhgaCf9KbqSApHjtvUqk3vyOjyCzk7R8Nw8Q4pjV+9
 vtGo1vJjnCEV8Ac6YBLvniVnwl4hEqirazZGWc5uCzrLB0sKRCoiamBtNpN+A/EGlaJqmohjICA
 aHQG7iPPGFN9CuXdiSh6BH+Lfi772yZ5rUnkE0xd3Nu4dRlJR8X7+XVEl4CT0sqMTLWlmrYTkhR
 QvW/3p0dwow==
X-Received: by 2002:a05:620a:6302:20b0:937:5aaf:8c7b with SMTP id
 af79cd13be357-93947fccb9cmr218385085a.14.1788191419350; 
 Mon, 31 Aug 2026 08:50:19 -0700 (PDT)
X-Received: by 2002:a05:620a:6302:20b0:937:5aaf:8c7b with SMTP id
 af79cd13be357-93947fccb9cmr218378185a.14.1788191418745; 
 Mon, 31 Aug 2026 08:50:18 -0700 (PDT)
Received: from localhost ([86.149.41.185]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce1a3fesm1162535e9.12.2026.08.31.08.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2026 08:50:17 -0700 (PDT)
Date: Mon, 31 Aug 2026 16:49:56 +0100
Message-Id: <20260831-wip-obbardc-package-dtui-fix-armv5-v2-0-42eceaa12f55@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42Oyw6CMBBFf8V07RAotlZX/odh0RcyKhRbqBrCv
 1sw7s0kk9zMyT0zkWA92kCOm4l4GzGg61Kg2w3RjewuFtCkTGhOeS4ohSf24JSS3mjopb7JhJh
 hRKjxBdK3kYEoKWes3gmeK5KKem/TcZWcq28Oo7paPSzNC9FgGJx/r1/EYuF+wsM/wlhAGlMbX
 ex5KZg5uRCyxyjv2rVtlhap5nn+AAI0yHDtAAAA
X-Change-ID: 20260822-wip-obbardc-package-dtui-fix-armv5-832655f4860b
To: buildroot@buildroot.org
Cc: Christopher Obbard <obbardc@gmail.com>,
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1786;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=O/hR0w2VjDRNOzK9L/RAAVXDdeE4U3T6f6I0rn/EJiI=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBqlaKyNOAAOetBXmG/Ym3fzspTiLaCMhkZl5BMo
 mrG6V71lteJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCapWisgAKCRBjTcTwaHBG
 +Ju5D/45yKiEmDmaOtcnN/vyS2Ra8MwJYye1AD97T91Wsh88Dk7LTxl8OUKF5+d2tjfiI6o95y3
 AHFkGllgIhtKiVoTmO9zjvTS5bTopclMGPWgrueChC2nOKeXTmTPYZCJhqfutNCAn0BEoLZiMEk
 Wke5CxKUL5Ez3qPH5Kx0wmMiLUBDT5GUg9F4YJojxzCdIcxkzG+gRSxIfIAF8St1yQNxZnKMhZ8
 ZG678sNKxnXmV1nT3bxOG31WmhOwwOBDlMqp30RCdKtzzyK4srRO8o5aABlDdguXs1go/XZ8cla
 vxWS5QAizZtbGveAm0YDGLFTUf6+p6xZFX7gXBjnY2Z6KSFFZzTMYuTpVSS/s2QTivvHuSXI7u6
 tgRulxTJez0KU3LQBq0LEcY58FfOhgB2k5yovCZTWrhCK79vBySZUjGskwPVOcvdlVUHyR4EJum
 2jsj9FvbVb6nuKQYHCicXtuofwrXyD4sNxWvU9lEh3GFMTXxwikNvmQ3z9yvO6jMKvk7OMIfnsF
 SY+PEpA6PIQGkMPLEvx0IIsJO4gZxda7rrUrg3PrMtTHxMaBvCjGFo0TF1bmuFCgq3l++I3VaoI
 bWS4V8KMHAXgFqcKJ3WdznzdBAUDRi5mluDQ5R9yc35961xQ1FTITW3urP6ayOGUDfPbYAHODGf
 8DK95ThRgZlgMiw==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEzNSBTYWx0ZWRfX+NFJlFGzRmaV
 CbACdD3vA+8A3KqCy57hg0crSTA8GtzjGqOimi5khEUvL4V1Iv1slWfQ6qPT8Jk5ZWfUnba7ueq
 pZCVd6Z75WvwwZUzW7AufaWB/rR0QDg=
X-Authority-Analysis: v=2.4 cv=O7sJeh9W c=1 sm=1 tr=0 ts=6a95a2bc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=1ZqYAqmp+mGnO5v9BrvPnw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=YRHvXXt1AAAA:8 a=b52pUOSRFamCUX0svmkA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=9bw_jnHfPby8klRCszyn:22
X-Proofpoint-ORIG-GUID: tvG_9MpknqfUeBiNOywwV7wlnre-PoRu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEzNSBTYWx0ZWRfX1w3ZRe3dwNx5
 1af88Dyo9Cq+bF05tzZxkYaXT3/Y/7w4oYrpIxXn6phc5+w/UrKqFWUztlMLAfYM16ASveOAhNJ
 dQ5kHpQ15v/Lq5WE/PZLRDxQSQnt98BcoTgUndBtPX8gZhAMGW6533GPHNVY1oDQlszwYTNl6Ac
 ukc4H4Zl5KltVA6febugQL3CjLI1/LLlg4LNa4ixX4iKhD1eQz4puKduVgR3klUitHuy6PKeSTb
 JeejkaqvNe1QlBIGPJkMAj1InvaeERpCDKGZjzFsAmS6IIreHYBpAk4tC45zrW4y8hKS0dvowLb
 +P57UzlihDflelh299tO+AMhh05RP+GEkVW6nMy+Xxv6xxou9OJi9SUh3+EA0iTIjDs1K59wcip
 CV2sSebnvlFLZIVK2DVGzXpAeLSE7Ba4mwBz1JGIu3OchwVxXI4xPgGvrT60Z692fiMxtJAgWkr
 zq0nJsPslIUIguPZnuw==
X-Proofpoint-GUID: tvG_9MpknqfUeBiNOywwV7wlnre-PoRu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310135
Subject: [Buildroot] [PATCH v2 0/2] package/dtui: fix build failure on
 targets without 64-bit atomics
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
From: Christopher Obbard via buildroot <buildroot@buildroot.org>
Reply-To: Christopher Obbard <chris.obbard@oss.qualcomm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dtui fails to build on armv5te and 32-bit powerpc: it depends on
tui-textarea which imports std::sync::atomic::AtomicU64 without a
cfg(target_has_atomic = "64") guard. Rustc does not provide 64-bit
atomics on those targets. Upstream seems unmaintained and 0.7.0 is the
latest release, so the package has to be disabled there instead.

v1 open-coded BR2_ARM_CPU_ARMV5 and BR2_powerpc in package/dtui/Config.in.
Following the review feedback, patch 1 adds a hidden
BR2_PACKAGE_HOST_RUSTC_TARGET_HAS_ATOMIC_64 symbol to
package/rustc/Config.in.host and patch 2 makes dtui depend on it so the
constraint is expressed once and stays correct as rust gains or changes
targets.

Signed-off-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
---
Changes in v2:
- Add a hidden BR2_PACKAGE_HOST_RUSTC_TARGET_HAS_ATOMIC_64 symbol to
  package/rustc/Config.in.host, instead of open-coding BR2_ARM_CPU_ARMV5
  and BR2_powerpc in package/dtui/Config.in.
- dtui now depends on that symbol; no functional change from v1, the
  symbol is defined as !BR2_ARM_CPU_ARMV5 && !BR2_powerpc.
- Link to v1: https://patch.msgid.link/20260829-wip-obbardc-package-dtui-fix-armv5-v1-1-1dfdc176385d@oss.qualcomm.com

To: buildroot@buildroot.org
Cc: Christopher Obbard <chris.obbard@oss.qualcomm.com>

---
Christopher Obbard (2):
      package/rustc: add BR2_PACKAGE_HOST_RUSTC_TARGET_HAS_ATOMIC_64
      package/dtui: require 64-bit atomic support

 package/dtui/Config.in       |  2 ++
 package/rustc/Config.in.host | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)
---
base-commit: cb18f3a74a49a62119857ce1ab712ff4528a1d3d
change-id: 20260822-wip-obbardc-package-dtui-fix-armv5-832655f4860b

Best regards,
--  
Cheers!

Christopher Obbard, MSc BEng (Hons) MIET

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
