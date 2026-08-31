Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E0DC624A5
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 15:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EE898096D;
	Mon, 31 Aug 2026 15:50:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BexRWns59JYk; Mon, 31 Aug 2026 15:50:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788191431;
	bh=aklN2OW7FTS5rUdJvLzCKOCAwBvy8yDQP1Gmxas//pY=;
	h=Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oJcInDGvZFnQYYA4L0mfTPnXVaEOL0EmRx64RRidB5AiTth6SpzUt/12Qf1cO8Mko
	 81ZnSRigj1QQOOIQj5CyMtlQXgAHSTc6COCZVuyO3bd+Nm+2oAKikCIA1clsSB0Hk4
	 M4xDMoIfb5MowbiBayVSV37Xy7xJmdcOQGlAskIu3R7O0i6yv+6Bb1EIM7Mi0E0JH8
	 21ox53YXTx8e9VcLbK1DasLGclpTsrkx/g0vmVP9Rm8C0Yl2S71M/44lGZ9Bz6hjvr
	 2G6ORc4Jd0PlfZpkejtixv5xVZAIwyzUDZoqIDfh1rIsChT8p/YwXicJ8w880QlacG
	 2mhszS8UUIXQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEA7A80D17;
	Mon, 31 Aug 2026 15:50:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E466E265
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 15:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CADEF80D36
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 15:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EBJ3qbflud45 for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 15:50:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.180.131;
 helo=mx0b-0031df01.pphosted.com; envelope-from=chris.obbard@oss.qualcomm.com;
 receiver=<UNKNOWN> 
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8F2C80D05
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 15:50:29 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67VETVgr3969310
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 15:50:28 GMT
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6h91pjj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 15:50:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-92e5e38fbc5so530135885a.2
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 08:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788191427; x=1788796227;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=bbZPsdo9dv0fiofrJEFCB3lLMtouwlkcScN2PMuZaBM=;
 b=FuVISLbUc7fxL5ge6lOG+dk5K4c3SzQtu3Y0TjFAfG4bQeqzoPBY/n/y4Z7nomlGco
 v6sZUR7/T6H28I+In36fFPi6mYvnsVMSI5NM7wqtS77hbOQ6SOjKlV7HLmd4D8FEP6nL
 4OlccTb+wX2dGOEEENdoRiCYKuVFqEJQ9lBbYUrBHe5PGBiuD42eudu31+2QzVZz9Re4
 aRV2gXKvuM7/Zm1/JaJ6CXZ5plGiexvf6M9Z7VZaw2PK+xAwqHxEHGf72WkUwYfdMzSW
 FDm3p5boi8HK83mtO7dIrJlictflNxa4kgLXS28Fv8TcJhtfQVnBx2EwksmPaWpR3g2m
 4LSQ==
X-Gm-Message-State: AFuF++kpnGWiTBTi+XhMCkYtBKc6BDpim/p7cMQRWaQXeq9vWlvSExtc
 csK9xjEzcPwaNRKcePkhmCGlUMoySvRhLpVM0lpecVu2cJXivFUIHYV8zNX218O+qYEPzwGW0xx
 S7VCOGmVaiUzRtpEaCDX/H0Osot50BS3/+AAH505T27Ox2BJcWWjadPE+aJLepgGYeVyl
X-Gm-Gg: AR+sD118NsKeJbNYZVMc+vV9l28uISvylPfSuy6Eh9+M5t7Q7OMBapqD0DkTirZREYA
 LVRrK7jtUhF3HNEip+T/VAvVbAJF6/3YVSB5/CmdogJpfZ9ulK2FtRRm8f+rsAtbbQ91mcktQ2l
 Aqp77QgKyd3UZ5iXZdf0NZuc/iZeXiOMl1aWDcDxlcV2r0cqLrbsnOF9HnjQD/qWumf/VbrWg2s
 MHISTM08MwxZbUd7yVvyr04u7fsAgexClZv2ZC+sn5MsR3MUVDyZAtdN9VtsMmFDI5/rINhJgk3
 SvypPx7tIuVpX704UylUSCHXsTXyfTsLMk16kHpdT6nFoKoO8+RUtkMAoDBRkymytxZmJNJCPH7
 7BflJ+58VTQ==
X-Received: by 2002:a05:620a:26a2:b0:92e:cf8e:67b9 with SMTP id
 af79cd13be357-939480b0dcemr327030285a.21.1788191426683; 
 Mon, 31 Aug 2026 08:50:26 -0700 (PDT)
X-Received: by 2002:a05:620a:26a2:b0:92e:cf8e:67b9 with SMTP id
 af79cd13be357-939480b0dcemr327020885a.21.1788191426150; 
 Mon, 31 Aug 2026 08:50:26 -0700 (PDT)
Received: from localhost ([86.149.41.185]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce44ea9sm451215e9.14.2026.08.31.08.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2026 08:50:25 -0700 (PDT)
Date: Mon, 31 Aug 2026 16:49:58 +0100
MIME-Version: 1.0
Message-Id: <20260831-wip-obbardc-package-dtui-fix-armv5-v2-2-42eceaa12f55@oss.qualcomm.com>
References: <20260831-wip-obbardc-package-dtui-fix-armv5-v2-0-42eceaa12f55@oss.qualcomm.com>
In-Reply-To: <20260831-wip-obbardc-package-dtui-fix-armv5-v2-0-42eceaa12f55@oss.qualcomm.com>
To: buildroot@buildroot.org
Cc: Christopher Obbard <obbardc@gmail.com>,
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3188;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=SixQPKI8AAjrXKiPzdbPITiyuUD4ZJvRvUq49/Xmoso=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBqlaK3bAezUfcKcR2PvYyX+wkEkFkzCvc9p+7ML
 +7+VOOIPgaJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCapWitwAKCRBjTcTwaHBG
 +CR8EACgEaX09VazBMgRqlM3CvgxAT4DtIPZDeJ2gjd3f0/uTImk/OgYH5QBIsBuC9CbC9YGZ0g
 Z+s4vmbyC1xOSiBlzrX31FJPXkaBh8areyIGgmXj7ZPYy330TrdYmDJk1JPWGoDjUkG8KevNxYq
 TRlCR699niPP99u+QjxQAZ5aXAPlitRZNof6jRhHuQPqyGzlQPKmHVhOV5A6Y6nnpO+m0/xHqr2
 dmGDq6PQsH89IC2CAYRg2QA6JSyrrCSbS5STliYQgeWXTTTRpPgXrwhF9rMp34IWfTgmxR4VHJe
 aPL6ScGdtAG34+0OjU3fT+Yf4/CgrtJHfJOhFpTkHZ0O4Bh8rjXv9XzpSN9g5lJzcrrK7gyAmJs
 AB6qcR2dCa0cNlMNNTKt+nl52oltxp3eD4M1mb99CFpD0ivXZfu9DsHZ7ByVrFdk5RF3Qdi0xeO
 GTW6VIOen0iFcoIqs1cDjoa/hoAlGYH2NX3BzoRfNKob6BC8ZhMbth+o2XkQ2hHHE3JRCCxsJr4
 /VoW/H1nTV7eq1m9kSc812f3c65Q7qNu47UfHIhDL3vFA78EoR9Hkf0BmoYL/k9f/JCro/AXVak
 UhLFWMnI317/DF4YRiLIcMOS6gLSYuZEaVCd8PHrQbzcVf+UKivKZOkV8CKjTYtf/+jQrh7IPUw
 IylZVbO9rsMYKlw==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Authority-Analysis: v=2.4 cv=W6UIkxWk c=1 sm=1 tr=0 ts=6a95a2c3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=1ZqYAqmp+mGnO5v9BrvPnw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=NEAV23lmAAAA:8 a=YRHvXXt1AAAA:8 a=EUspDBNiAAAA:8 a=Hc2F3cCm6-YXLDUxWrsA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=9bw_jnHfPby8klRCszyn:22
X-Proofpoint-ORIG-GUID: EOAxZ-8ROntFd_MJz_vV82V2j_ZpbiKt
X-Proofpoint-GUID: EOAxZ-8ROntFd_MJz_vV82V2j_ZpbiKt
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEzNSBTYWx0ZWRfX+8tMyP/mPsoZ
 Q7GNZvZUxBfdDaDgZ7XfghdxzLgMhHYtKSzZUbuLzwkR2ydSTKuLYluKGpfyZ/HUaK938+2S/Y6
 2NFDLDeymIBgz5y6uzwUI8rgMAdYRwI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEzNSBTYWx0ZWRfX66XRSkiocEtN
 LU8Liy/Kslh1Nf6uXwA3rEV1nZc9fMozwdAE6jmsUz0uSnXqwtwR2mDx5j4eqadK2QSYE3RqT/3
 YmUjSNDM7Te5v8CMnM2xqb8CYHPW4rPzHaVe6+B1FtqWgqK+DYMdpsHKrobMw8K8fUAIkAL2S2q
 lGCZ7F7h6YanWZL6FlkPKkaS9XWC48WJgmt80E+2cmt3O17t+urxreHiWawr/T9AxcJrgrOl/PK
 GUht6z9IM3X80F4L3gtJbZud9h1Mr4v7+kl23WWdNxOkw0fUKITbpahErdRNUOQ9P7nhwUmcF4S
 dv99tIbqp1gDI4tyeuaoztPFYkkUJ1fcuy2hvCOb4Xu6N4jtZNHZ3Koe9gz8UBsBbEuC9k7hJsV
 jijFiaQte8PlrrDcYBxWZNnzmX5WfKUaTYUTgvafOo2e8GDHyvtmjaWIQReJr0k1pH9Sn3M3Kkl
 BlD4bp6CdGSIFRfwx1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310135
Subject: [Buildroot] [PATCH v2 2/2] package/dtui: require 64-bit atomic
 support
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

dtui depends on tui-textarea which unconditionally imports AtomicU64 in
src/widget.rs to pack a viewport rectangle into a single atomic word:

  use std::sync::atomic::{AtomicU64, Ordering};
  pub struct Viewport(AtomicU64);

As there is no cfg(target_has_atomic) guard in tui-textarea, its
build fails on any target for which rustc does not provide 64-bit
atomics with:

  Compiling tui-textarea v0.7.0
  error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
    --> .../dtui-3.0.0/VENDOR/tui-textarea/src/widget.rs:10:25
     |
  10 | use std::sync::atomic::{AtomicU64, Ordering};
     |                         ^^^^^^^^^ no `AtomicU64` in `sync::atomic`
     |
  help: a similar name exists in the module
     |
  10 - use std::sync::atomic::{AtomicU64, Ordering};
  10 + use std::sync::atomic::{AtomicU32, Ordering};

This has been reported to tui-textarea upstream, but unfortunately the
project seems to be unmaintained (issue linked below). A sane workaround
is to disable the package on targets which lack 64-bit atomic support,
which is exactly what BR2_PACKAGE_HOST_RUSTC_TARGET_HAS_ATOMIC_64
describes: it is n for armv5te-unknown-linux-{gnu,musl}eabi and
powerpc-unknown-linux-gnu, the only rust targets Buildroot can generate
which lack 64-bit atomics, and y everywhere else.

The same problem was hit by package/dust and worked around in commit
3abc3b97bad9 ("package/dust: bump to version 1.1.2") by bumping to a
version in which upstream had added the missing guard. That is not an
option here as tui-textarea 0.7.0 is the latest release.

Note that a runtime test for dtui cannot use the default
infra.basetest.BASIC_TOOLCHAIN_CONFIG, since that builds with
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE, where dtui is now
disabled; such a test would need an armv7 or aarch64 toolchain instead.

Build tested with utils/test-pkg against:
- BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE
- BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE
- BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE

all three fail with the above error before this change and are skipped
after it, while armv7 (glibc and musl), aarch64, powerpc64le and x86-64
still select and build the package.

Link: https://github.com/rhysd/tui-textarea/issues/66
Fixes: https://autobuild.buildroot.org/results/188f6442371500731453f75983590c922eab6d57
Fixes: https://autobuild.buildroot.org/results/e254db2654f18f1d2110eb8b1a32b43ad0f2a3d6
Signed-off-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
---
 package/dtui/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dtui/Config.in b/package/dtui/Config.in
index 65d51df7d5..aee719a63f 100644
--- a/package/dtui/Config.in
+++ b/package/dtui/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_DTUI
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
+	# tui-textarea unconditionally uses AtomicU64
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_HAS_ATOMIC_64
 	select BR2_PACKAGE_DBUS # runtime
 	select BR2_PACKAGE_HOST_RUSTC
 	help

-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
