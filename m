Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D4BC61DC4
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 11:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DBE160628;
	Sat, 29 Aug 2026 11:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8azflH9ohowe; Sat, 29 Aug 2026 11:01:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788001278;
	bh=UymURn24CGNsZYHZJ5PGfZDnbOsyTLAe3c1CuE5f/aY=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=ZONLsejyQaSLeq9bnQRs48nrSH2xi3CS63+JrJsgWagHmK69CuQYlHVj1vWaqTMyZ
	 2nUholS8Q//LdrdJZHlxe7fuMn2YibiizdrLFTrTfQPyb4SRjx/UnbOrmJWMEfb2/t
	 hBP4B9Ar4Za+TihvHbSFdcYfgKD3pzpgEgLULjvlB4CUoAVFlV+nqDVxNGWmdhvFzM
	 Rpdz+mzYpeLI/Sx+4mZdeB3I2ahKr36N5gYuzjLmjm2N5irue0sFhdSYDlycd604/x
	 oU2nhwKKw3r0Sw1gcLeeczuqrHrfhUmWHzrXvHyhCszpbdFrHRN1Xj+T5LZndxjBGk
	 B9fbXpXXGPJsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E4A66061A;
	Sat, 29 Aug 2026 11:01:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 73CD8336
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 11:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 607C0406E7
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 11:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dMa05RewS1L0 for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 11:01:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=chris.obbard@oss.qualcomm.com;
 receiver=<UNKNOWN> 
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11B3840669
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 11:01:14 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67TAhWwl2685876
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 11:01:13 GMT
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhmrs23-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 11:01:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-52fc0097865so43000191cf.2
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 04:01:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788001272; x=1788606072;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=9RaEtpXPNtujdPDRDZ45ZePHvIDLSQuxT/tJx//DMq0=;
 b=itFTOUBAscLuY0fkqv2AUMxQJ/EzGEypwQjxeStVGnnjWW4KBXYCVCfSEchvyOGfmZ
 SgCx6ehyOy3jvWCeRRykj+h+07wpw8A9cbkDye1pe4p3ut6FTCrMzHWD5WBz0sZxryar
 i1vQ+6IAAA6XL5pDIG0mh2StdXt4UJTi8YEWtP47BRBcz2JLmibyH4nfek/MU1Kn1ATc
 KrPQjg3dSijLrzw1zzrGicQdQydPVLGyCEnEsvhh3MYCoJTxw61wEWQ6AF071aEdO4OB
 Kcn5g649L5N185x8HjrHQ6JxrF8iI8Pqsmdg3rij9ampBjSVgso/JMVznlsa7oS1OW5q
 7cyw==
X-Gm-Message-State: AFuF++mp9Lfg1fI9UgKT2uoh/D+xlvukWjUOkKtMA9BEj+oDTRZA7ddd
 nQQI/vM0EjWdzDmyhuOA9m0uOP26vJWUo37CXTUbat9GxpxBgmfrbSEHLOa5VcfUt+lyz3nmpH9
 SJ7LC4HBt5FjbkY1XyFqnct/UAfkFhPVqELMnCVUD38nWwpeOL10fbbdeOVbj
X-Gm-Gg: AR+sD11gXafkTlgQbF/G3uKsvD7Ij+e45YKWjhDagxbuL6hW7okEcxdy1C536vTYrlq
 LrZQyfjXupi+feyTPL3L1RN4qSdOiYrGFjjUPBB+R4AWv9aKbaBkplekPlounDyYlu79o1AUEkN
 rsfwA+X3QSFEq0/f0G6tHA0yVVtXJluZKQUbdiOUX7oDykHPSyzBoupwddWnAFtxzTu/h+xi/kC
 l5d27UGLmCSTFtbbbARzy+24/czR/R+frXW+NAYUaE2z2m0mSGz2CqwAb8JT5F0jn8944Kl+Ut0
 Vl+YjjFURqOgM88r9y+llpfdN1Hg2GZBT7m0atIvQUuLpYOUkluIMtULj1n0MSiNP4DCr95PW6V
 OnbdXj7udLQ==
X-Received: by 2002:a05:622a:1a82:b0:517:8d24:64d8 with SMTP id
 d75a77b69052e-52fb9429b1cmr142374631cf.13.1788001271690; 
 Sat, 29 Aug 2026 04:01:11 -0700 (PDT)
X-Received: by 2002:a05:622a:1a82:b0:517:8d24:64d8 with SMTP id
 d75a77b69052e-52fb9429b1cmr142373721cf.13.1788001271108; 
 Sat, 29 Aug 2026 04:01:11 -0700 (PDT)
Received: from localhost ([86.149.41.185]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b494228bfsm202136755e9.2.2026.08.29.04.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Aug 2026 04:01:10 -0700 (PDT)
Date: Sat, 29 Aug 2026 12:01:02 +0100
MIME-Version: 1.0
Message-Id: <20260829-wip-obbardc-package-dtui-fix-armv5-v1-1-1dfdc176385d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNywrCMBBFf6XM2oE4mhD8FXGRx1RHsQ2Ttgql/
 27U5eFczl2hsgpXOHUrKC9SZRwa7HcdpFsYroySGwMZcsYT4UsKjjEGzQlLSI/QJnmaBXt5Y9D
 nYtEfyFnbH70zEVqoKDf5Ozlf/lzneOc0fcuwbR8f5ySkhgAAAA==
X-Change-ID: 20260822-wip-obbardc-package-dtui-fix-armv5-832655f4860b
To: buildroot@buildroot.org
Cc: Christopher Obbard <obbardc@gmail.com>,
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4133;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y/Pixvm97MkJ3myRMyphAOHT5kZgBdjlAz7on2PbL6E=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBqkrvweI5nzCJ8/HrCqQ18ducDXr2siWBASAd+3
 zT03ObHAXuJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCapK78AAKCRBjTcTwaHBG
 +FWgD/9h1yR5kiUG2ZvBKzhkbIO8/Xq60eAasVNSfF/jSOw39M0w7JtsGqF+uqVMLlbsww82Gms
 Ya0y4DSnCZyYm7UBIXsvBmXblfFORK1qZys3htD4sGibIT8/Y3+715ppQ6qTmDAQqrVmSuEpL0j
 Vzes4HnARLKq6RAhqPmk/55BtTeXaw1UpdEsejV4pnLzlhyWS4jw+It4NrpEA6qEiUhdZyXVopn
 EExtjjrT/M0kEZPnj8sBmIFiZW5i/0r6SwqW021bq1891QWc+6+XIee3lBtXNQIILpXhhzYP/JP
 8CdWEqK3VGm1s7RLvOPkqPcFV8hnlRXJKINclbt1ZZklYgsKy3YeFKS9lg9Z5DnBgE2hxTl98+c
 S0PfcMAwmLlJzi+3C4OGalV8fNdloZ2BhE0i5rXSYonx2o9PCVtX3OAs4J4EE08V1+TdzIRYTQV
 LhHgL1QH2B6qkKhKVl6Z/fHvNRq4pyip7USDEsJwDEeEa2zZm2diMRZcgdmhYE+Yj/IJ0ucxgED
 ub9yEBAx02oOmWn53xUnepHYuOUVJS/o8LCnQkjs4omIkVSIasTrr9SKxj8gcArXB9Xo3KH+zmN
 uLe9dhLLZz5vLlA4qF2H2QpWMNvgQ6nnbA8cNAtWMC5QnfUe2aCQYVir9eu+/trYqQTTYb6VLB6
 nAwplqewsNQMfng==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDA5NCBTYWx0ZWRfX7IaHn9NMoF8V
 4yyt7YXESa1C8AYJZcLLaKsCaYAvME4rGHNCNrO3me3/3MmpPFQ1e07ugfRhl4EqcaxRm2np3rM
 mfn/ya9KbRwCzkaTYV1Pp9vxEEhI0uxD0nabkdrQ29cTqDGuX8EGICwiB8EelY4PP0CWsl1sXSx
 PLR2ywrJ/XaIwj605YJ1nZ3GS275HJpt+aQUGa4yeZ2QxEXLt6QRHPojk2WY/PIJzzRQVzlA639
 x1omz835K9YI2sFJcQVaLKrkjVa4bTbDw2njfcHukmAXRXUEV49YnX9MrkJ289bKsc22XSHzkF6
 fzX8Qd1gmTD2NTBz0opV1og2rBy4n0Sz0j2PeEA3WNLN2eYrX2MQ26HqCvRwRthv0fLoxe/lHK/
 7pL2IVqjJXG/vnesTDIVTYE5YNJ9KuUNDFYC5rw7i3LYeGJJxTR+MRzf+lnqE2wZ95xep2dLA/2
 xAdQTTYbcbRzXXStLVQ==
X-Proofpoint-ORIG-GUID: BRAo0cQMyzViyfTf-yk5zeqTKzWBepSC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDA5NCBTYWx0ZWRfX+juwijO5rG7D
 WJNuLO6RrShsBU/mGJcXviT7uWhAH2Jl3PVUUnpDRkig6DIR+ytC1MEH33qZa+mIdZbRdGQxoSD
 IJlRABzpawUyb7+GSNNjemHSNERXDRM=
X-Proofpoint-GUID: BRAo0cQMyzViyfTf-yk5zeqTKzWBepSC
X-Authority-Analysis: v=2.4 cv=bpl8wkai c=1 sm=1 tr=0 ts=6a92bbf9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=1ZqYAqmp+mGnO5v9BrvPnw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=NEAV23lmAAAA:8 a=YRHvXXt1AAAA:8 a=EUspDBNiAAAA:8 a=XaVQPWPRMGlc14lBer8A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=9bw_jnHfPby8klRCszyn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290094
Subject: [Buildroot] [PATCH] package/dtui: require 64-bit atomic support
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
is to disable the package on targets which lack 64-bit atomic support.

Of all the rust targets buildroot can generate (see RUST_TARGETS in
utils/update-rust), three lack 64-bit atomic support:

  $ rustc --print cfg --target <target> | grep target_has_atomic
    armv5te-unknown-linux-gnueabi     "16" "32" "8" "ptr"
    armv5te-unknown-linux-musleabi    "16" "32" "8" "ptr"
    powerpc-unknown-linux-gnu         "16" "32" "8" "ptr"

The armv6 and armv7 targets, for comparison, are fine:

    arm-unknown-linux-gnueabi         "16" "32" "64" "8" "ptr"
    armv7-unknown-linux-gnueabihf     "16" "32" "64" "8" "ptr"

The armv5te targets come from BR2_ARM_CPU_ARMV5 and the powerpc target
from BR2_powerpc, which is 32-bit only. Disable the package for both.

The uclibc variants of these architectures are already excluded as
BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS only covers armv5te and
32-bit powerpc for glibc and musl.

Build tested with utils/test-pkg against:
- BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE
- BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE
- BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE

all three fail with the above error before this change and are skipped
after it, while armv7 (glibc and musl), aarch64, powerpc64le and x86-64
still select and build the package.

The same problem was hit by package/dust and worked around in commit
3abc3b97bad9 ("package/dust: bump to version 1.1.2") by bumping to a
version in which upstream had added the missing guard. That is not an
option here as tui-textarea 0.7.0 is the latest release.

As a follow-up it could be worth adding a
BR2_PACKAGE_HOST_RUSTC_TARGET_HAS_ATOMIC_64 symbol to
package/rustc/Config.in.host, defaulting to y everywhere except the three
target combinations listed above. Packages could then express this
constraint as a single dependency and it would stay correct as rust
gains new targets.

Link: https://github.com/rhysd/tui-textarea/issues/66
Fixes: https://autobuild.buildroot.org/results/188f6442371500731453f75983590c922eab6d57
Fixes: https://autobuild.buildroot.org/results/e254db2654f18f1d2110eb8b1a32b43ad0f2a3d6
Signed-off-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
---
 package/dtui/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/dtui/Config.in b/package/dtui/Config.in
index 65d51df7d5..31e337a5e0 100644
--- a/package/dtui/Config.in
+++ b/package/dtui/Config.in
@@ -3,6 +3,10 @@ config BR2_PACKAGE_DTUI
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
+	# tui-textarea unconditionally uses AtomicU64, which rustc does
+	# not provide on armv5te or 32-bit powerpc.
+	depends on !BR2_ARM_CPU_ARMV5
+	depends on !BR2_powerpc
 	select BR2_PACKAGE_DBUS # runtime
 	select BR2_PACKAGE_HOST_RUSTC
 	help

---
base-commit: e991fa071605a78c17adba2ed26e07c3b8c95583
change-id: 20260822-wip-obbardc-package-dtui-fix-armv5-832655f4860b

Best regards,
--  
Christopher Obbard <chris.obbard@oss.qualcomm.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
