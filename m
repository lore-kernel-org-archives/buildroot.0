Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8D4CA5FD4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 05:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E21580FF9;
	Fri,  2 Oct 2026 05:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nr-YRVvU8E44; Fri,  2 Oct 2026 05:43:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6D9D4810D6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790919783;
	b=MkUn1+weaQb5U4J8vVB9d2+8VFPM0ysv+qpI7rjPzzEvilG7BWzOw9R35qyjOLGmh36E
	 NiQ2CFMarYs/pPVeRoA0hKu51+CAczemopvIWI/+vMIQCP0K+l7pFZ5wwpFXoGGEqUVlg
	 16MM6q3s98DysYy36jSBBPmwfY7bSNmYC/7nkQlx54Vuee5msCMZf0eA++4sAbzuU7kwJ
	 rZ8R5uGrtAuF/S2ntCRlxCZsMsV8U50qTV+E9Am/jhBF5O7PygYozGYOqT+dc6ldFOYaO
	 MKvZ5CwYRshm2m4ZzzpQvjLuBJ9WG4y/gF/YmNvJhPlCYkqak/45JbmEE+1NY1V+s6w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790919783;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=s7gL8O5tZSqZH73Dunjjc2PL3QtvCdXW7MAMihbYVGo=;
	b=CwXKP99U3rIplEMgNWNGU3gBlj4zild/4dl9NSbgC9UZDbTcoRjbHMW1SHBZIfyDz8/O
	 M2UiQXOiHMKLIkQOLLQ9rXWc7so1baGTDfdH4EJWG4iWXxSusbDFdyeWG3lh337ZXICxe
	 Ef9tA1TGy0zQTvrUNrhLnrjVEhLf+lsmKXPv2h/noX+1QhnRmIhOcJ86A8poDP3JGp9p7
	 ReOb2bvQSHQgZKMq7yPMr5TNhCeSLHJIszoRI7T5NfAIAiHYbgm9d+EsHrVIDp6oWXBQU
	 oEXf1VGyJXzr6ZPq2T7dyiDzIEt8Qds3g4YMBkjnGg2/QCHBWsAwAa0Fa82imduY4jw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qSokyqBy;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790919783;
	bh=s7gL8O5tZSqZH73Dunjjc2PL3QtvCdXW7MAMihbYVGo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=frIonmOiGzFr0n+Og9YdnpR+6w2et7Kk70TpgWQvJOVraJND5aTGA4GPZIweUcNm/
	 SiC6igQL87FqS59V8hZZ62ah5xyZ/lMKyAt6nDb1DR0lGjimkRcd/wm77eIAO30efE
	 gfY2hIToyIEgCAOUHEHA47Hav19FnzXyOlO2D8sPbluH20ObinWaHKK759uB8B5yOy
	 sGkzwXvjFLhJanz8d6uflFpLRURhfgJ5d2tReA8pYDdIfT6rzmLTrYmWitT2ifqmdn
	 rqztxB0udznJ3rPHBMCekGbe4p9YZlZyy4DugtpcyDrHKjdu32wWM/1xB5yLedywbP
	 kuavfm7ehJExw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D9D4810D6;
	Fri,  2 Oct 2026 05:43:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BDED4D9F
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 05:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1223A80FF9
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 05:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NNb7tfQOPemC for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 05:43:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C40FF80EE3
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790919780;
 b=Sl1Y5Z/+MObMjziUokkW7B/5K/VYhq/JB7ItEm4ZkFzGqzJNekNgqr9GEB7btvowJRV+
 2VlI+EQTWLbJ5EiDhvgmgld0H64TX4dmEhY6Vesd+I+L96VJnemMyfvJMFffNkhZSITgS
 nceZWr9v7A272K6w6W3sedOVh/YWGVbdUpJFEwpJkOJEkqtnkvu/6U6DUDm5jbQ/s5aUr
 kooIwwh8fzod0SeISMOW50gOJcQXK95mbeACw6ZHNAV/GXfywSZ1mKg8h+GVljTak2hh6
 VbcifXGA3AA+DWO08cdH87EhE15wIgxEqF7m3agSSh4GT6/fGsWModOE/VQSRx68dsA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790919780;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=pnxOXzC6CJJ6SGLU5sZ2a7oyOG6h1habXR/2QWeMXdo=;
 b=OkNHvns9fsk9n1UakdPMBtfdvhOK1QmILDZsIgAi9iKtvJUN2XSt3iVfkNFYqtlEAuOb
 WJgCCmEmHQgl5qCzANAencXxzk55oFx6Cq+MlPsA37SGMlpuvWf0xpM8AnpXSgvsDKXa9
 is5YsLzaRGt5Nvjsxjh8Qpq/xsmIy5ZT97urp41vydDCqXcye91dzXb51Qy1J8lQeTYkd
 XYJ9fwwUmPA9/QsEY6kBPwU/nheSwSCNhiQtjtiwSf626As8ki7fKwMg6NftFvkT8ZFM8
 ZzVh3LPr66qX9exncrnx3fzk1NfJPse6xiEw5Cwbc9Sj0ixG+0KlGtVonABnY53OO0w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=qSokyqBy; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=qSokyqBy
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C40FF80EE3
 for <buildroot@busybox.net>; Fri,  2 Oct 2026 05:42:59 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e7d2bb404so14940145e9.1
 for <buildroot@busybox.net>; Thu, 01 Oct 2026 22:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790919777; x=1791524577; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=pnxOXzC6CJJ6SGLU5sZ2a7oyOG6h1habXR/2QWeMXdo=;
 b=qSokyqByKzZjuokoycdz8gIm1ty6u0AC5zK/Hz7OGrIzj6ISVQzpUxvLmWCGWhRvk4
 CiaNFZ5qY6GaJOL2vNU4MB45FXDy/IqnBqfq0C6Zeg2JCDX+VNYyke1uB7cE8SI1uwg6
 CL5jv14pEriUsvDilMkOztHV2mVaXan+LF8AWkyJ3U3Mg/oKh8C2HqQCMqBy0nTZIr0Z
 54g94M5BOGEvpv9GVOKJ2b5GlWWdd13N54Q4wMSI4XY1sHmFT6c1WDKBYROtU9oJCXRQ
 cKWLaOyowqjbQW13r+u3Xks2srYLPMLF5bgvOxunFyIrU0BDgE7THD7+73j4MHKPi/rn
 l5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790919777; x=1791524577;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pnxOXzC6CJJ6SGLU5sZ2a7oyOG6h1habXR/2QWeMXdo=;
 b=CFbP6ReGuglU0g/8VpiUl/kExBXvGjmNb5eURl1BAKqnx+gfFld94lhcKv6eYXHXVs
 BdB2X6cnQiljIMKJaokvs+7s0XyBnBmBkY6ZICCLGwSJVINPwfjsuzGew3UtT9XN0U0e
 bKr9Ffwt4QyBqEtoJOKlZfZw6WSbOO6GOFblRMqf7PWhqnybEsaIUiiskQ2GWCUwGklY
 IUa1kxa5fjWXBvXI6vOWS1wjNPSUY1bUFOa8tsMAc5gcG4JTmUptT9zyo4PaNudO+KiQ
 k1qzHhoHSa4u13/DCt5OKtxme8vUKWMCEOGwa9FBgaEkvs2WLn/QNLnz7HZlrc3POho5
 VFCQ==
X-Gm-Message-State: AFuF++kwXZG3Is2WgrcMrV387uxp1GUJVgBL00VRpwkXgFfVvtzYi6gW
 nU2ecoRkoDx5XQ+jXVDWbCiKaHwUMZZNvv1T85+VQQpi5dGWwCwW9I1wJUQDiA==
X-Gm-Gg: AYBFou3SOfu6BwpInG2GmqNeoaA4HCxK52rrALTST+UiPmnadP0DyCwqWDmhZF8MlZv
 f6TH9R6ganSmBegvRyKM2LyjTM9Qzz3P+pdbElOdsqE0byTuCEK1GmmZUYR0omlFS9nlB7v/jpG
 O6Im9WB+acIgLaxsUXGDjP0+D+F/QLGZUtYPaujn7wIYy6e2tMXfIKQw1oiasHpKWyc1hQ00oYi
 KGZ6TsWsFgTpfaS3EArymVm7HOPGWujSTtQwsPHQnq9kEEUZJJ+fTa/no9HIJkRXKfw2GvKZYQk
 ZQJbuxvw4pyyBnkYH2Hr+MFibgTb1FFeqnK8kRb3IVP61bmKr2zhDLk3AOB3Y1VkAljEER2D7ax
 rU/wf+YVh/7ycoBy2Al+UrHGdDUm4qc2IxL3xIHJjYzchkZwgvWOjdIrteKGVMBrpSWuBmyWjnL
 c83YfFhf+cpOXZWUbv5d2+HVnbsajL3QmH4w25SJF975h29iJIZaTHA5wKUw2HrxS9jxOWdj+GJ
 uSBdTdHEQs5SbRnJpavKqbCqAFwEypotkRRfZP7uo8Omm5VRMs=
X-Received: by 2002:a05:600c:548c:b0:49e:65f2:db64 with SMTP id
 5b1f17b1804b1-4a027534bd7mr25908685e9.5.1790919776989; 
 Thu, 01 Oct 2026 22:42:56 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a03048abc9sm17254775e9.0.2026.10.01.22.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2026 22:42:56 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Fri,  2 Oct 2026 07:42:53 +0200
Message-ID: <20261002054253.51517-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/janet: bump to version 1.42.1
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

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/janet/janet.hash | 2 +-
 package/janet/janet.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/janet/janet.hash b/package/janet/janet.hash
index 0ddc8ced7..cde34582b 100644
--- a/package/janet/janet.hash
+++ b/package/janet/janet.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  168e97e1b790f6e9d1e43685019efecc4ee473d6b9f8c421b49c195336c0b725  janet-1.41.2.tar.gz
+sha256  2391f8c6565742dad1c5e8872ad1d570b64a239d5d1ef11a188fc6b400457a04  janet-1.42.1.tar.gz
 
 # Locally calculated
 sha256  16e31703a3ab5c4d3e35aa8bd607551911a9d981fbf0b5fbd832fe6eed4b70ca  LICENSE
diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index a7ea27c2b..bd274f28f 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANET_VERSION = 1.41.2
+JANET_VERSION = 1.42.1
 JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
 JANET_LICENSE = MIT
 JANET_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
