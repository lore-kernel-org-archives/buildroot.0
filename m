Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48A8D5CC94
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 09:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8525460F7E;
	Tue, 16 Dec 2025 09:48:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hfsfPziu0eoK; Tue, 16 Dec 2025 09:48:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AC34608E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765878497;
	bh=/EPeAVmXMnIX6OcX+3KzynWJklUVU50UqhxPDR2YreY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jz5BegZAYtrujkGTHhDOqFTqyjcCqllOUSbp3nMPtLqPEUSL+ezxe+oH24yAEs2dj
	 VRqsLVy3TRnZHnwi9RN78tV8kJGagbfw0QtdfNpHcGSGeIQ5SJi66oPMzMLBMauxqx
	 Tevk/17YxfscVw5qxvtSpeu8rUS+Z7BC5SPf+6O2X4Mcd0EwXXlE40+9TdF6lY0jMd
	 WLYEgBvDruzRMIVUNgNciX56vx43kIFvuMqdMrflrXJl7okGJRJ9qtD59gIn7KiQpT
	 1FpP4GGa3hBBWjnxhQiQTPfbNcGRr3Kn+FiAAazJlDFTYtXTlVDUleGq4Pbn4AX/Ze
	 6l3ByRPy0e8WA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AC34608E4;
	Tue, 16 Dec 2025 09:48:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 294CC372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A08B608E4
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9TYzMhVdEst7 for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 09:48:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2D43960850
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D43960850
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D43960850
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:48:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D14D7C19D31
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:47:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4671C6071C;
 Tue, 16 Dec 2025 09:48:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4F651119432ED; Tue, 16 Dec 2025 10:48:07 +0100 (CET)
Date: Tue, 16 Dec 2025 10:48:06 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Michael Vetter <jubalh@iodoru.org>
Message-ID: <20251216104806.1342e697@windsurf>
In-Reply-To: <20251202175915.1616935-1-bernd@kuhls.net>
References: <20251202175915.1616935-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765878488; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=VGoRe9Su/dmUPSNqU4KFZ2VYROhb0nK62O7oduWDS+k=;
 b=hZ/mradxXDhmwHQEadC/sc26QiDK1mLfXGYfHq0uqtM50ku3R466GGdx/GDLh2WzvLdu7Q
 Q9lOqzQRE4i4qmWlqKbds7TbzOijWOTqZybG0YTpM4qk1D3ZhhsiWrNm2zdcNB1xhF1O4C
 v0/23e3KerfXviJ3bmEU5qOw4dDD820EUM7RuTF7/UOKdEP4usqrmrGAfMoS8EWGVn8aaN
 QSTKabhHOFlhn8G2entXk5dJLqCfH/ZPhDCM3ZD0jbEzzKvKrbQiQGP3J6Am252Yx0I5Sz
 /zeVGVjim5+mee1EplsxWQ5S5Tr9B4rPpa456z3cUUl/LefK0Bk7IcIejFa2KA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=hZ/mradx
Subject: Re: [Buildroot] [PATCH/next 1/1] package/jasper: bump version to
 4.2.8
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

Thanks for this version bump. Is this fixing the CMake 4 compatibility?

On Tue,  2 Dec 2025 18:59:15 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> -# 0002-Fixes-400.patch
> -JASPER_IGNORE_CVES += CVE-2025-8835
> +# needed for cross-compile
> +JASPER_STDC_VERSION="`echo __STDC_VERSION__ | $(TARGET_CROSS)cpp -E -P -`"
> +JASPER_CONF_OPTS += \
> +	-DJAS_STDC_VERSION=$(JASPER_STDC_VERSION)

This looks meh. Why does it need this? Why isn't the CMakeLists.txt not
detecting this?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
