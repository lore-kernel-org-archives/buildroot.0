Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4CDE6FE29
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 19:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 292A360E77;
	Tue, 23 Dec 2025 19:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jEOWDejbYdeL; Tue, 23 Dec 2025 19:54:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C508F60E63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766519643;
	bh=AaMfVcSTGtdZaOti60PHycDPIdbqNUm6FlMxPujkDhg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gfMStgYUnKyfvjH1izZWX3GGoVLQBnIyrPNJ5qvWb+0uLqqjgmi3JnZoILGtHmAAw
	 0meoMCLBUj0fTUxnWVuWffPWlP5yYDNGWDY6QA0MxVKuDpEeRfZnSzvGizfGqhDpjW
	 5eEBaZPI9JCYbUhAHsj+U6ftOecM+1B46eYyT+xP3d917JSmUvCkkjlBsBws7fFZBf
	 kerKu3Ty7keviRAL4wt3PSgCsuoSLo2cDFt1UbarVT47s0Wh6sMt+Zql0VCo57h2CK
	 /JNoW4oWcmmOeZfgug1E8SGSODzrjLcdAUkjkTBL4x+DAYiYmRURVQf9ur6v1e4Obx
	 YS3/nwDjZ9EVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C508F60E63;
	Tue, 23 Dec 2025 19:54:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 26E73119
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 19:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D6B840144
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 19:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WQy95fX_UvVK for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 19:54:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.117;
 helo=smtpcmd11117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6188140787
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6188140787
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6188140787
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 19:53:58 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id Y8SCvuOLgfibdY8SCvUD8L; Tue, 23 Dec 2025 20:53:56 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 23 Dec 2025 20:46:53 +0100
Message-ID: <20251223194653.3036119-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251223194653.3036119-1-giulio.benetti@benettiengineering.com>
References: <20251223194653.3036119-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKqseIsc0zMvW7qehblANvBFe4nOtl1o51mcGrzsl2XvZr680Fs/dNAmH1VN4MMPtwIVWYRoUxD0HL1fHINqSd5ivHphuom+YMUrKXioM9K1bCBGqWLp
 k71F2oYxuFiwbNjCP1b/yPRlDPBmCOBesOtrqfXESRZIMdg4VMXOBk61ZLw4JASKYAohfdm9LWi7BtU/PHTKvMoI+mfExxqI/z2EJYZySqgWUH1cfi6a9krQ
 2rBJh+OSkj8cqibxgxkMh5VOtQPQu4Noc/dh16qWAss=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1766519636; bh=bGbNPHJwtZ+AuyIGGa3VgGqsGGSFFUpbiTMNK0cN+us=;
 h=From:To:Subject:Date:MIME-Version;
 b=exG1yD77MLog6Pg7n4YfEzV8OzFqaEdO0uTNFpKlT/lJCAURsgoQEi1imdBAt7ZGa
 GLO1auYcOY42+CPUCXuiPvyi5xnSfYqwchNiPL9YjsyeknUone2/ByHe6f/ZaqzEe9
 F2TmiepDIoULy30oKONIv3MKWOlSMRyDyJ8QzFjJsUDWvzGX42k6OaQYUu4aFy+GJt
 MPINvzcKC6nFrJo4PfOUwbB3KG0d/Md4OLzdof+jOOTsnLeBASNNDfVlDVAN8FbEYE
 LU31hBqbjkEwCf7W/bmeYWnHHOiJ8OnTfYcojyJ8W/HCfDsIpcYdZXSoReNxO0rq72
 wK7CPWmtoGWRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=exG1yD77
Subject: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to package dash
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

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ac7813fc35..f289f81229 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1292,6 +1292,7 @@ F:	configs/rockpro64_defconfig
 F:	package/at/
 F:	package/binutils/
 F:	package/cryptsetup/
+F:	package/dash/
 F:	package/dotnet-runtime-prebuilt/
 F:	package/dotnet6-runtime/
 F:	package/erlang-jiffy/
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
