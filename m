Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF1CC624C6
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 15:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95E0440545;
	Mon, 31 Aug 2026 15:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bnnWRCf0dpKh; Mon, 31 Aug 2026 15:50:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788191427;
	bh=XMSidM16YPerUbMt/EtkHJEQcEMq4Y01wiyVlRjmtP0=;
	h=Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iNHM1546miRxtqLK00lxvJ2R5GytK19jZjqqqxL8byzvzpxsIseiQZM4ZwPVzPz8m
	 sT4MMISL1CGuJzmM9dB8k4Re4jBEUDH71pOAt4N/FLrtsVw0u7ybLxAqEkHcdLrTZa
	 LORSbbVayuyZ7MavjRe5MQgTAARt9p55t/k9Q0yP3GXpCuvPa8x6zpqzgTH/v0kUbF
	 VSrqaWygcH+ydO83dKVgWTJKjUsZihgpkcsYQrcLuMZArLQRIoGr4ni7pf0ec9gRml
	 QITRvWJ9cmWy7zSWL7JW49IuiwVuOWlPmf6pS436tZaaj/tiJsk2Vy2ETnchgJ2r74
	 r24DCI+OINQVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA7174054C;
	Mon, 31 Aug 2026 15:50:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 900242FC
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 15:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8199A4054C
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 15:50:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fBGDaexei6Vg for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 15:50:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.180.131;
 helo=mx0b-0031df01.pphosted.com; envelope-from=chris.obbard@oss.qualcomm.com;
 receiver=<UNKNOWN> 
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9ED3F40545
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 15:50:25 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67VETPHo3703670
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 15:50:23 GMT
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6yasj83-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 15:50:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-934963b2bc0so537914485a.3
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 08:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788191423; x=1788796223;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=gYQ7jDEti0QKGh7BFxk1HoS/Fwy2uwrN6B3bm4s2VzA=;
 b=Cp0lHIEunTP6bsbp1lcNmIxc+tuwDygT4LG0PiUInT9skj3P12m4XhXbvyuUtEb90p
 AHmL8W63LpU6I0olW36s6iFre6W7cw5nC2Wkkk2zty/dmxPhjLrDl+6Vuv1LrPNGpy+J
 CCa57wZBXtk0ZV1xXpYAVhLvjbd1s9+qZU+i/Xrb0MBcQWnTCbBx7aW0hytZQi9ytDN+
 S1Ak40SramkZFmnOT5kXw6HsifGGlo8sOLCbMjWEy0wSyOCkELJMtg6QAEiGF8cudYpi
 vMEkkJ6u/kT+v5z9B8bJo+QeNgUvqyrknzBysIxdJLMsBcMTZ3/KSynIQB9oTBzUR150
 RPYQ==
X-Gm-Message-State: AFuF++n12BNaUHf5ZzXzQLTjwypHCj65wdSad6JyQosCXr5GTWn2IGMH
 fTTfMuCQpOpO55aIsGhQEBJZWevenmNeYQCkhhev2AMjOdre0LQZpjogojgMPxZzXDKESDmyJHC
 TOed4fvgqcsgR9GalBFPlG8zCGnOcIzlwe0vXdtdWlVbjCt6Pl9XLUSF6/iINQyI4MY4Q
X-Gm-Gg: AR+sD12xdowNxPcmg7wqedmW1Uqok6sO42RXhlAyYeYOtOxEje/nt+UadJFdfDtRHhP
 W5QT5nFqWNGsVVDtTzmzMJDWet8ej2VBTISJlZ/SOY9iwpvazqMJ2unhiXFh6yRuUzIkH3zr+sN
 E016dXcJVT/nU2W+/W1btVpcaLxk4b1z2x1z/uWWvOJ0PQnx8QbUVaNL0gGZfyoM6nA3otXylLv
 TvW1EdywrLqfpYKfcyg3//WUISQps7RJ2EKoxFtC1LzK1HYyHA8GvfSl2qqju32OMyOVXcMtB/w
 IdU/BgR5wKpUDVbUnSQShhALiHizD+3HWwkFXqLxIYLfzOotSHPEzRU/cn6bt6YdUV5N5UV7iec
 TUAen+SdlaQ==
X-Received: by 2002:a05:620a:2906:b0:930:9091:f0ce with SMTP id
 af79cd13be357-939481032e1mr250178985a.22.1788191422735; 
 Mon, 31 Aug 2026 08:50:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2906:b0:930:9091:f0ce with SMTP id
 af79cd13be357-939481032e1mr250171285a.22.1788191422218; 
 Mon, 31 Aug 2026 08:50:22 -0700 (PDT)
Received: from localhost ([86.149.41.185]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4843ce8b015sm6493285f8f.13.2026.08.31.08.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2026 08:50:21 -0700 (PDT)
Date: Mon, 31 Aug 2026 16:49:57 +0100
MIME-Version: 1.0
Message-Id: <20260831-wip-obbardc-package-dtui-fix-armv5-v2-1-42eceaa12f55@oss.qualcomm.com>
References: <20260831-wip-obbardc-package-dtui-fix-armv5-v2-0-42eceaa12f55@oss.qualcomm.com>
In-Reply-To: <20260831-wip-obbardc-package-dtui-fix-armv5-v2-0-42eceaa12f55@oss.qualcomm.com>
To: buildroot@buildroot.org
Cc: Christopher Obbard <obbardc@gmail.com>,
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3656;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=DnQXPZeZS6PXLFN4TOwL5A7oxsAdvDoU2ZUwXNh3xZU=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBqlaK35Oo4CHwE5xqVMhJhSd72GYGV2gYbxmOH4
 eYEYLKcyKmJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCapWitwAKCRBjTcTwaHBG
 +FitEACLQM8jG/OeVCq3kGT5bTngyzk3Jg6AA9LdTz/TS/1umQhSVSxpWbyww6j4Ff7oX+Su65l
 /fdRSCv2yS9ZKbmg1UbyEoUqg0rKuIx3UZgQEAfKzzw2HIbIab8aooC8Yszw5qBlRdeLsMEuXRG
 tg/kEgsyT/fYUORyTV9mJ2gQNATP7wn4Y/mqMtp0dboDvTvaZMBLnE8zzdfAYj5ucwo1Zlsa8pL
 NPT1IaL1GdxChx7NkMXlZqiUWZaPoQI5nPsWD4ekXMLTb8T01vhm8doITK/Vi8zgg75K58jGJ59
 3Alg7shSmGRLT5jOia4urz/O0C8US+iuLAZs2lilh+Xp7n2chs+7n1haubF7qmhQkkLDZOXOWQm
 MCJCXyXXgkU6AA++tblMtE9AGMiP5ormLUh9kYLwztbIRsSq90HlfRFikr+49C2fU+TLnwN/50m
 /yxrvo8XQxqv7HsRAzx1BtAdqjlhrlqhzQGx1vI0Sa2LQByyDYTjgV1xe6D7qLfbBFpIGf3JZ17
 wq5jU2xfKip8TmCVde583sWdfcTVEGffVfzRTR7nxo4UpXgOC7aUexDP0DELNlSARtl6i/Ainqm
 J3VCpQre9ezPOEd710FP3mmfZ6gLbCaxa6Xku9Qc18aC4RnfBUoo32mfou2TkDSMQ5uLkBx+/RL
 SMfi0cyB2VaGbDw==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEzNSBTYWx0ZWRfX/cNlCVHYDGW+
 CQiQXcyJMYq546b5A2jcfV+8HcbrTGORlFXkaHpBIZ7sQWpESt8zMfOpQMsF4Nj7dDwkbflWilk
 ialf48ssiCx+cbrS63yShjuUPoosJMc=
X-Authority-Analysis: v=2.4 cv=CpaPtH4D c=1 sm=1 tr=0 ts=6a95a2bf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=1ZqYAqmp+mGnO5v9BrvPnw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=2oxergas8u0BcJsMNLgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEzNSBTYWx0ZWRfX2z0gGghYuwdP
 F3pdUE5i2/LWs0W7qh+wMYNIvoAgv5RYeCqUqLvc3+7YDJBbNm0N2qFwK3ivbLmgizoPKAZX/6h
 7InwqjHBuX6IrxYQAAxoMDdvP/mU6TskSPhpdRpQmGTahBwCooYGZMXKCtzg2bYWblxIkAhHDGz
 DBRbf/DAYmvzepFEuxaiSJKJqDC//IEZHSliVyp17EfPx2RqefTqcBBnf5Tzyz0FO1gQoXj9jCy
 x41RGo3AWaNaFYPLL66RiXsUJYNY/oYXVZMbMe8JumizqWTIMJqw1JmB2zkoAWs57FCsEG7h571
 jCGjcSfCBHmsIiuhXK++zX8T9rH/wlfo/3EoMrTzg7jYSf5Iyh58ShgGVjBp5P9xJnEmOzJ8RFq
 3F8XxUSEXx7sXeesN5BzjORUMnGi7zSfSxaeLpdW47qEoZTQE9+h6d0xBg2ey6UkCVlQ0O5moqq
 1OCPZP1WYNBWEGMoZZQ==
X-Proofpoint-ORIG-GUID: 3yUHkX2qihc_exZXG68aXvrTWPMiqTwp
X-Proofpoint-GUID: 3yUHkX2qihc_exZXG68aXvrTWPMiqTwp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310135
Subject: [Buildroot] [PATCH v2 1/2] package/rustc: add
 BR2_PACKAGE_HOST_RUSTC_TARGET_HAS_ATOMIC_64
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

Rust does not provide 64-bit atomics on every target Buildroot can
generate. rustc sets max_atomic_width = 32 for three of the 25 targets
listed in RUST_TARGETS in utils/update-rust, so
core::sync::atomic::AtomicU64 and AtomicI64 simply do not exist there:

  $ rustc --print cfg --target <target> | grep target_has_atomic
  armv5te-unknown-linux-gnueabi     "16" "32" "8" "ptr"
  armv5te-unknown-linux-musleabi    "16" "32" "8" "ptr"
  powerpc-unknown-linux-gnu         "16" "32" "8" "ptr"

Every other supported target, including armv6, armv7, aarch64, all the
x86 variants, riscv64, s390x, sparc64 and both 64-bit powerpcs, has
them, e.g.:

  arm-unknown-linux-gnueabi         "16" "32" "64" "8" "ptr"
  armv7-unknown-linux-gnueabihf     "16" "32" "64" "8" "ptr"

A crate that uses 64-bit atomics without a cfg(target_has_atomic = "64")
guard therefore fails to build on those three targets with:

  error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
     |
     |         atomic::{AtomicU64, AtomicU8, AtomicUsize, Ordering},
     |                  ^^^^^^^^^ no `AtomicU64` in `sync::atomic`

This has been hit at least twice already: by package/dust, worked around
in commit 3abc3b97bad9 ("package/dust: bump to version 1.1.2") by moving
to a release in which upstream had added the guard and by package/dtui,
which has no such release available and had to open-code the affected
architectures instead.

It is likely to keep recurring: infra.basetest.BASIC_TOOLCHAIN_CONFIG
builds with BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE, so
every runtime test that does not override the toolchain compiles for
armv5te, one of the three affected targets. That is exactly how the two
failures above were found.

Add a hidden symbol so packages can express this constraint once, rather
than each open-coding BR2_ARM_CPU_ARMV5 and BR2_powerpc and needing to
update whenever rust gains or changes a target.

Note that armv5te and 32-bit powerpc are only supported by rust for
glibc and musl, so the uclibc variants of those architectures are
already excluded by BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS.

Signed-off-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
---
 package/rustc/Config.in.host | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index 9cd912fc74..539926144b 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -112,6 +112,22 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 
+# Not all the targets above provide 64-bit atomics: rustc sets
+# max_atomic_width = 32 for armv5te-unknown-linux-{gnu,musl}eabi and for
+# powerpc-unknown-linux-gnu, so core::sync::atomic::{AtomicU64,AtomicI64}
+# do not exist there. This can be checked with:
+#   rustc --print cfg --target <target> | grep target_has_atomic
+# Target rust packages whose crates use 64-bit atomics unconditionally,
+# i.e. without a cfg(target_has_atomic = "64") guard, should depend on
+# this option.
+config BR2_PACKAGE_HOST_RUSTC_TARGET_HAS_ATOMIC_64
+	bool
+	# Excludes armv5te-unknown-linux-{gnu,musl}eabi and
+	# powerpc-unknown-linux-gnu. BR2_powerpc is 32-bit only:
+	# BR2_powerpc64 and BR2_powerpc64le are separate symbols, both
+	# selecting BR2_ARCH_IS_64, and are not affected.
+	default y if !BR2_ARM_CPU_ARMV5 && !BR2_powerpc
+
 config BR2_PACKAGE_HOST_RUSTC_ARCH
 	string
 	default "armv5te" if BR2_ARM_CPU_ARMV5

-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
