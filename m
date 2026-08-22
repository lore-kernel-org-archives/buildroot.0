Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91439C5DF97
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 16:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9986580EBE;
	Sat, 22 Aug 2026 16:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KMSx0rOsfRSg; Sat, 22 Aug 2026 16:43:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787416994;
	bh=mspQF007qJPNTzuDOgqioDVFaTGre5Kupj6EEE2sY/k=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=mrfzmXnznrop0Et5/QTsr4VXjPqGxuzzYOptmhegNQTofs32GuP+02+KUZB4xgO4F
	 ouyi4HXSzY6H5xKC7u2Z2aUy8UhWgEKjtujP3oU7jgcBrNp3yIyW7PsKZRVPggeXYc
	 bLF+UkFMIizYGRoG03oaNwBiagbU93o+H+1CHT1d7UUyNf2qBlpfKgHEBz6hjrAHpt
	 nfU0lQcuvLQYMuDAbCfS4pBPIYp8mMyr5PXkFa2iR4TzTbhJGWYdyyJZ58lzoSV4lX
	 dydhVA3hO+A1RD0EZKydoQGqZsICrAa/ZtVFYxWqs5yJxyltIekGYRZA68xR5AxZqY
	 hkPOApEJztQkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A22880BA3;
	Sat, 22 Aug 2026 16:43:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E3C129B
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 16:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8003480B93
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 16:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PfofzYOfGmAi for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 16:43:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=chris.obbard@oss.qualcomm.com;
 receiver=<UNKNOWN> 
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A380680BA3
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 16:43:11 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67MEMVOQ2017955
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 16:43:09 GMT
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744wskhg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 16:43:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-90c8da50fcfso8139386d6.1
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 09:43:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787416988; x=1788021788;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=XYUPTbgurpT2OIWDeqJpEUrhS7rG6BYdnovmv951C08=;
 b=TdSso30nYh9ieuvnQYADMFtw7G4fLVPCFxh/o9Eu8yFba3rlhkxmsMkWdeU0l6Mf3q
 KBJR6QtqMNCak3yhFYxsI/RxYS22Z6SsPg6erDaBRX0ksTG0a1B4Drglmb6JjBDmnAPE
 /HFpm9wNXe96hXRoPjU1O6gheEjVme9sBkKZDiGNZBJHDbf3Fy52nfoZ3I5sOxTQxLSN
 4bBP1LznTxg7JILQhzaHuGut3u10SimBeSgSCUXaS7vbJbx1fVvXIfZggHL+PTAAFojs
 CyqZBkeOXp4So9TOj0pUGZGmPtiaWe4PeCefMIszsZhEmJg4SzgsXj1jx/rMMBMjZUbI
 o/mA==
X-Gm-Message-State: AFuF++lgKCBsWc2zqeV8Aw4Jogz7Xe7YNol1gLSghkvVoZm4JATRTg5T
 IGRoyMW7n02BNkD6+6GsSSFhg+Y6fptU0CB9Utjve38W+y8/o1DO9kUrZphcFkUpalu+9JUv+Gs
 YkSBuNwBPYIikOFv8OvXzKKhE7ax+sNR+ONjSxcAyYrO4radDSgLgD3ES1FYPQ/UxMaDq
X-Gm-Gg: AR+sD12ddLA99QU6V2OACxB3Thnex6OI/ax7Ew3IqIIPh6OoA0iZAgtZDoEv5l7AsVv
 Y+pamdzbCvH5zLHgfRTmdylOkbzRl5l3PvKG3XAMlY4hAPsrBdemYI1steKSu5W4QEIeXt4ltfC
 YUCurjcgdGNMJzUviBH4q+iGFXHW4ZHumsDreJgQqVz0dlxmWm8qBIt3IrERZ7fwWGHKmz9I3Hn
 KL1L08gm0hI/LkOgTe1pSmJ+ACzMYt5i7sqdBTnSJk9lJjf1n0rWN1Q29KIgTGhUqPWctsGJnUK
 EBCPH2SYG5Qm13YrUa3MEFBUthOX1w1m5TFJC2bdZ/45Uc1FoFO/1zgsDtDqbaxfOwa2PxlirR9
 f2DfU4a4CJ0F6qmGYbBladQrd1XtwhXTbOhiwKXg/BD8cQH2BoFKwkntNNwWVJw==
X-Received: by 2002:a05:622a:1f1a:b0:51c:167d:b328 with SMTP id
 d75a77b69052e-52e09ce8996mr61266641cf.40.1787416988544; 
 Sat, 22 Aug 2026 09:43:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1f1a:b0:51c:167d:b328 with SMTP id
 d75a77b69052e-52e09ce8996mr61266271cf.40.1787416988170; 
 Sat, 22 Aug 2026 09:43:08 -0700 (PDT)
Received: from localhost (host86-170-11-80.range86-170.btcentralplus.com.
 [86.170.11.80]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482c9a9f145sm2626953f8f.0.2026.08.22.09.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2026 09:43:06 -0700 (PDT)
Date: Sat, 22 Aug 2026 17:42:51 +0100
MIME-Version: 1.0
Message-Id: <20260822-wip-obbardc-change-email-v1-1-d78487afd04a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyMj3fLMAt38pKTEopRkXaiK1NzEzBxdU2MTUxPzVGPLxLRUJaD2gqL
 UtMwKsNHRsRB+cWlSVmpyCcg8pdpaAKnTNnJ8AAAA
X-Change-ID: 20260822-wip-obbardc-change-email-534547e39afe
To: buildroot@buildroot.org
Cc: Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=756;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=4XHlLYC8tIiBEn/6/NaOp0bwrcsTqVqfCCMpCbyaNlE=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBqidGSKrwqtf1twrDNOrHXX6ikCBYm92xOz9Yq3
 soYxnodOTqJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCaonRkgAKCRBjTcTwaHBG
 +Fg5D/oD1R+7amEGPyuvR8I9ypxeVU6937BBepy0XVsJNGjyRHljg8HRHon3dbzpNGrcb2oL0wr
 P252ayPLZZLvoLJJq/vqrv6q0b2jSsbzlURQNYLmOHdJX2UizxjNVGe9EZXutZqC/15en+CnPOw
 MAoX5JozgXQ6+tA+WjEblRjRXepebaL4mtMCFRcnoR4UzxsJFgb7Z2n+c6IKTUhF8jFoWWUSt6s
 guPQobBeLaEo/NPlpDua8XWVOPHWt8OrRgLYTITzOLh6vfYT8DJ1c9CM78cYxyodCgbB05/OeSM
 HQNpg7Ib5uVdNrqpuJZMYlXxKlT/6rhsNp+NWoE5sq2vyZdmQG9DwGjnazBMQwnBxfVL1wbLwKe
 eqLRATgbhl7pm5d1baQyFMZB2SoXAeWtI98IpOmpRGh7V0J/ITfZnHcxqescXf9oBiazSfNlnn/
 mfvwBEo1tXUnQyUZcLRM9zAu3Y4Hqd46p638LnBUOJ7o9QEpJmxxFwTKTPeoIONUkmBVifWt/kl
 I8vOi4QF+SCO52eM6muvSXHrEH9x98sLXDs838zvz21uQZLP5YtR1xRDFXOJ2NAe4dxy75YPyiu
 EM1wPfE4ZyUFxrD3v4Q5ZYtPP6IfLKYZxv77nLA64n7wJ+cAIuWzYaG5OvQN2sMGOvaCFWP4vUB
 vaUobi43etuZ8sQ==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Proofpoint-ORIG-GUID: qnEICQJMNFqYNMEhmbUbNc2ZnAHtxpAJ
X-Proofpoint-GUID: qnEICQJMNFqYNMEhmbUbNc2ZnAHtxpAJ
X-Authority-Analysis: v=2.4 cv=KuF9H2WN c=1 sm=1 tr=0 ts=6a89d19d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=m0u0x3Iavk+4c1ingEBp/w==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=jMFVoHJZAAAA:8 a=8FR8JbopmmE0k0_zLn8A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=0RheEo68HHjPa6wajfvg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIyMDEzOSBTYWx0ZWRfX/j9KYfgXI3Ja
 1dVGMtqX8QXVXN4Ldf65FkvrCO2v3yVxnB24hD+7TLBMaeWNsi1gSjiOxjdP7osF2FXU3h6OEI3
 qco6pT8yYp2s6seLWHE0l6QvqARHpDXFIk+KrrjLmFp8YhTqHIMBiujib9lXCbCNWOn0yHnYL5u
 gYy4kLz2UTR7EpdiGWGXaRtokPg6oudG+J/GXtDrEGViqFFFBsHW2l3oR0OV7WDtaAA0JX0SPZU
 ALYyoiG/hJ8J5Zz32QS81759WWraIL0e/XAD6MybJPoZ9/3t0DpYtX0hKnGEnHkMcPyJ7RhpUBe
 MjKzPO8z2M57AJeGRQm6BF21eAUUgAn5ZTAmp26AyX6HfzAGVk2kN/fGd8lD8b8/G5KlU0auh41
 gIdvQD0aSE61SdsXtX7koElcEaXo9Fhhj6jDfh/Ci6Hw7XJE0y/wshPUa3dxkB/ndemrGOvrjAa
 mOXtGsXM3yWWK/oM9ww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIyMDEzOSBTYWx0ZWRfX0h4Tl8F5PZXC
 qsS6EZ3EHro9r1eY6U9hoVE7axYkTZmGL9Iy0mLMkumomMIVPGN2rqe9qlrjwJrZjqSk9OE7ydx
 8Qsvs9OZXeRl160Qd201x8M2VPATLXY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-22_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608220139
Subject: [Buildroot] [PATCH] DEVELOPERS: update email for Christopher Obbard
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

Update my email address.

Signed-off-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index f4e296abc2..5eb438906f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -712,7 +712,7 @@ F:	package/perl-sys-mmap/
 F:	package/perl-time-parsedate/
 F:	package/perl-x10/
 
-N:	Christopher Obbard <obbardc@gmail.com>
+N:	Christopher Obbard <chris.obbard@oss.qualcomm.com>
 F:	package/dtui/
 
 N:	Colin Foster <colin.foster@in-advantage.com>

---
base-commit: e991fa071605a78c17adba2ed26e07c3b8c95583
change-id: 20260822-wip-obbardc-change-email-534547e39afe

Best regards,
--  
Christopher Obbard <chris.obbard@oss.qualcomm.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
