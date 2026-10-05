Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6366CA5FCE
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 07:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5E9A4065E;
	Mon,  5 Oct 2026 07:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v-r-ikULr5uy; Mon,  5 Oct 2026 07:01:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C804A40659
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791183662;
	b=JWdrgdYxPhg37L3koeyh91fLAJ4ZIwJGLk2Qd/eti5NCl1N2Vw5hrJ60MBJBVVuvdZCm
	 yIlHPz5yh4z3yD/E3e1m0YR1g37zZPJciqB3ICpoERTZSXQPOSQ+u5A4FTymOK1oJhnSX
	 /Xw54M6+9Jqp9w/AfpSCTPpEk4x/easUETo+GAfywL3F2qIof7lNoJgfkTjbeZjclYFGE
	 wxFlOmHns8/VC+GLXOJxuiDALVxyscAYut63X9Bm4zVRbAOaJN47dySS6CmRk73OBghe5
	 1sITSEsdTna1TVaO2PfDVPvv0TDhweDGVn/6HDqzDtJPwhdbk29wbqUG3e7IrzFluDw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791183662;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=BQr5B8KM27htjAmTROeFa4f99gtzzIt+XxtJG1C19w8=;
	b=KuGGhBcPDV4s90ES84QAZHBkzJBrDAGRzhwTjbs6DgNECxZFrpkNDCJz+cNDQvf3j2Q0
	 Ut/1N7PeEXav2Hfqe2DokmKxT4NDIVSxjz/vi5SaOpv/+REEKOthlAP2LMbM389/ZoO5M
	 u4yDhJLuaxRpRtdQluPTrDGKeWBkvuyqrm+sa6G2nlWLqYVGV16jSvle/fV6J351HR6RV
	 UYRgeE4aMDVTlE8SMqy89RY4jaBwc7sk4iQiXG6eRGkYASOOUtOdEBjEImIfvkbqNcYRj
	 9MTlT6+Q3ZJeIIr13lzX28M4NZBi1Bwhw+UoKv8U/SAxrnSE0rEobJAgN68O/pqhkFg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791183662;
	bh=BQr5B8KM27htjAmTROeFa4f99gtzzIt+XxtJG1C19w8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TO+xfn2S5mwLWGD/HCAXvNoZ8V4EXUUdGJo+tHrm36y01P4Lt1pFS/PeqZch/bOrz
	 nASwivQuP/6ngY3iP91lfi6kOTKTGeH8vyxEAH5tp4cIyP/R9+cwvgY8GWHK9ZSgmU
	 WwLhB1dgKBnSMD8lAgcbj0l/3c+jNAxUXk0fZtKsW3Bs+YYqfSsmyuFBiTdQzskDQg
	 FOmduM5cS+10ZWUCUafcVDfNCgT2R1jIJ24T6hDDcQWxOpMVsZ8oa1MFaUXc/WDPje
	 maS7UAnEuqfLrOoCeV2st9G5C6bvkwtj+K1pNOeD9J+HCxmvzEx57dsicvwmfkZgq2
	 VGj8Feb4KaJng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C804A40659;
	Mon,  5 Oct 2026 07:01:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 58B9A1A6
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 06:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 565D6400AF
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 06:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id in8nUWxVjqBp for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 06:58:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 8653F400AE
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791183515;
 b=tclBYjaoixIf/dl/Qw+Cn3BF1sJzyDNCzycCI8/gpnN8HXfTEG9vQdQRCk0mGxLadguR
 IZklmp+YgO6giOH2OPc+F6FC/LipDtB33RoaAbcLETbN+D6nr0XgoiogsFGe5/mkdCk0E
 68NQfJnGEFSV6UnEU9ePFMWowqVtymorgxoFpVJ0MqLJTnVEmE/xdZ1hCezARxzj/A0iQ
 +oxjEHvNsj2q3c4saXh38FVHU9XgDN5hduQC/dIqooisXWh0woCVAmVhW4PJ3EyvFsY2+
 2E00Z90YeoanlqLTFudAI6e+Kqzsf8zJN181K2jWTYYmpRAsGDPqwEx7G8oQ/XW1JUw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791183515;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=7N+U7dadL1eYiFl4iKyU4G2UWF1bPHyeZAvnrQDiDoQ=;
 b=byYfWY+t4K6cYS+2/VatXaqoPDF/7dgFgtgIe3JNu+2Dw3z+xpXzb8kipFoZf4USSUPn
 WVxKfulqGB7bjGDmM+S4KvXJUaIkRUodQc1V7e/207yDKZhspSpSi87NCRN4rX4xUkd8F
 gIH8VuPiFy5OTt2hN0ovgsUg/iGQJkJb4RoguuG6yW0gx/SsNGBGntVheJMuBXtrD7bQX
 2iKlyNg5A14cZwtfLOe7eVzMhiKtIkUtPrmKBa0QhO93+zlg3vhn52XOlhndDvr9wWoTN
 FfWONhEzLo06kVeKNJsRuk8JMBG7SPo8SpDFnt8sCt6GuuDyezTFrwK0yHcKtfFS1ZA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=ideasonboard.com; 
 dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=OHFQ4LaH; 
 arc=none smtp.remote-ip=213.167.242.64
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.167.242.64;
 helo=perceval.ideasonboard.com; envelope-from=paul.elder@ideasonboard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=ideasonboard.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=OHFQ4LaH
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8653F400AE
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 06:58:34 +0000 (UTC)
Received: from neptunite.hamster-moth.ts.net (unknown
 [IPv6:2400:2411:160:2f00:2485:b713:3a55:e2db])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE0C412B2;
 Mon,  5 Oct 2026 08:56:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1791183396;
 bh=qU1bWb7Om7mK1zIxVVMWzP3MuHtI6e3YJzjBsO8CuN4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OHFQ4LaHrjaviFknXfmshWKulm+U428OL6g8fyxtL4hgzAB+t66kWrG2H4Wc9WqGV
 6IYbjDK0lpXFQjOH70HNq8IZPxvgzkh03FP7Vzq6rlfrnPrI4o4zHyDKUiJfmwnwGW
 gw0G3WCwHFkBkxC1U6cYxZO8vqWPAgHuJT4hTYGo=
From: Paul Elder <paul.elder@ideasonboard.com>
To: buildroot@buildroot.org
Cc: Paul Elder <paul.elder@ideasonboard.com>,
 laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
 thomas.petazzoni@bootlin.com
Date: Mon,  5 Oct 2026 15:58:16 +0900
Message-ID: <20261005065818.2023521-3-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005065818.2023521-1-paul.elder@ideasonboard.com>
References: <20261005065818.2023521-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] package/kmsxx: Add kmsprint and kmstest
 to extra utils
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

Add kmsprint and kmstest to the extra utils that are built with the
extra utils option, as they are useful for testing and development.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
Changes in v2:
- split from previous patch
---
 package/kmsxx/kmsxx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
index 10cae6577921..0678b505401a 100644
--- a/package/kmsxx/kmsxx.mk
+++ b/package/kmsxx/kmsxx.mk
@@ -27,7 +27,7 @@ endif
 ifeq ($(BR2_PACKAGE_KMSXX_INSTALL_TESTS),y)
 KMSXX_CONF_OPTS += -Dutils=true
 # extra handling for some utils not installed by default
-KMSXX_EXTRA_UTILS = kmsview kmscapture
+KMSXX_EXTRA_UTILS = kmsview kmscapture kmsprint kmstest
 ifeq ($(BR2_PACKAGE_LIBEVDEV),y)
 KMSXX_DEPENDENCIES += libevdev
 KMSXX_EXTRA_UTILS += kmstouch
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
