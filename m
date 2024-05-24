Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE189C25B79
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 19:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50CF841BA9;
	Fri, 24 May 2024 19:37:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8-N9KYze3gTQ; Fri, 24 May 2024 19:37:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD8E241BB3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD8E241BB3;
	Fri, 24 May 2024 19:37:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 79D001CFD34
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 19:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65E0160B24
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 19:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vqpV3U7m_xSR for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 19:36:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.145;
 helo=fout2-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AC0EA60604
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC0EA60604
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com
 [103.168.172.145])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC0EA60604
 for <buildroot@buildroot.org>; Fri, 24 May 2024 19:36:49 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailfout.nyi.internal (Postfix) with ESMTP id D28451380099;
 Fri, 24 May 2024 15:36:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 24 May 2024 15:36:48 -0400
X-ME-Sender: <xms:UOxQZuNWKxEJ4FzxcpGRwg0GXHcIB5LCV_E-xJqSloodLDScK0OU8A>
 <xme:UOxQZs8MvnqpgDduTJqrifTcBbYD5rgXCz53ksGPvu26mLh8UpekjsqYwmObpljmD
 UDpTRJov454N4H4Cgg>
X-ME-Received: <xmr:UOxQZlTGoUqbk6QHnqOl-KBPPwPGeXMkgQAPvpAK1YwilN-kuOkAPkI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeikedgudefhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhi
 rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
 enucggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefh
 ueevgeffgedukeejleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:UOxQZutVZBGiyHsfXQjiuc85gXGV-t6MtwkBdDdQLRkrDVBBwItrbw>
 <xmx:UOxQZmd70ceOHPLWg-MrziiZMTD3MyW4v5aVhbgGJiAVheRiboXtFg>
 <xmx:UOxQZi2x6t7Rmku3S1D2Lt4fbxxrHWjDLpUlWw4_JvmrIMt6sGnowQ>
 <xmx:UOxQZq9vNZPhwOOeMeeSRdPxs1Kk0GkiRIaLhI34AV8BZBp65-P1Mg>
 <xmx:UOxQZjHTAgcOCm05BEdSSmbj6OKBmYeuuLfADdf3xKlHKXh2v6PBlB36>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 May 2024 15:36:47 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 24 May 2024 20:36:39 +0100
MIME-Version: 1.0
Message-Id: <20240524-loongarch64-v1-5-d24078d79cd5@flygoat.com>
References: <20240524-loongarch64-v1-0-d24078d79cd5@flygoat.com>
In-Reply-To: <20240524-loongarch64-v1-0-d24078d79cd5@flygoat.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1847;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=YbE7/hBzb2aDYHA0pTGa/1A4mZaH9AgQE3a6WU4TUPM=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrSAN96yC9MXZ09aZuXXru+su106yeXpn++nltsZRF/5m
 XNubXhrRykLgxgXg6yYIkuIgFLfhsaLC64/yPoDM4eVCWQIAxenAExEfwUjw+p4o66Ts7ODvbsu
 2zNre+/ltt0sv+lHRqD7G4u20ud7pjAybMq7vdKqWXt2M9uUDDb/s8szrwk5cze8iP153D7hTPw
 XZgA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1716579408;
 x=1716665808; bh=f0eatfDhgrd1/wLy/x8o5oxpkOcR2LaBb1icCUPLX2c=; b=
 z8WgwSvCNsbTXX/qxASURnDCdj9md3yRwl0VxOdU2rUbnY8/H8Td19w5xLdTzW4N
 9iqmi2Bv9cvKD2wQ5it7grMmMA1qXi5w4+0S+FSoRNcRKnxNL92HZjqy41ya9sDR
 ACuEc28cA0miD8VtqLcX538dLYi02ylC9VSiCMruqKxBYbHQBpcVLpGfQWl3xic8
 KfkrWIAp/YOw0cYJimpI35SqlsDJsatODNtK2mO7XST9CZ1CIE85yMsAIVN7tfgl
 ABmcFfSmF0loE/ydQIz7aXvRCvE298mgx3TAsNIIiqJiXFwmZOnaZhOM7E5pUiMp
 SOt0P4ieaEWuaOz26bnoLw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716579408; x=
 1716665808; bh=f0eatfDhgrd1/wLy/x8o5oxpkOcR2LaBb1icCUPLX2c=; b=O
 4E/p9Q8DHnfOu6DOWBNK4cqxq6ftB6/fy7AzyTYVUDabTSrxlKTQWdW7PTfVk7WE
 a6RtUQ9L/hMMVZr1uapj/xcxMjb+JQ9YkOUMQBffFYB90GH5hqn2hKSfUzUx0wub
 Cc3ixFFqKBrnXBS2sPWBJnnEc5Xq0bcfgZIiuTdfDQSdILGo6Zg02wflcRfUZ0c3
 rV+7fszdhiIYMTX8OguB6jFXMYB2bMSiM/o1mgh0X/VDzkXsDbKR95OEPgXS+rb/
 4hg6+DCeOTmvYZnioheTAmkg3s0EUrzGUQuImBu9VodYhfbFlVoMyjgMbhkgRjH3
 7rHG6C3GTq3xvZRapJCaA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=z8WgwSvC; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=O4E/p9Q8
Subject: [Buildroot] [PATCH RESEND 5/7] linux: Introduce {vmlinux,
 vmlinuz}.efi kernel binary format
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

vmlinux.efi and vmlinuz.efi are standard file names for LoongArch
EFISTUB kernel.

Introduce them to build system.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 linux/Config.in | 8 ++++++++
 linux/linux.mk  | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index d3d4c429109c..208c0ea91929 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -285,6 +285,10 @@ config BR2_LINUX_KERNEL_VMLINUX_BIN
 	bool "vmlinux.bin"
 	depends on BR2_mips || BR2_mipsel || BR2_sh
 
+config BR2_LINUX_KERNEL_VMLINUX_EFI
+	bool "vmlinux.efi"
+	depends on BR2_loongarch64
+
 config BR2_LINUX_KERNEL_VMLINUX
 	bool "vmlinux"
 
@@ -296,6 +300,10 @@ config BR2_LINUX_KERNEL_VMLINUZ_BIN
 	bool "vmlinuz.bin"
 	depends on BR2_mips || BR2_mipsel
 
+config BR2_LINUX_KERNEL_VMLINUZ_EFI
+	bool "vmlinuz.efi"
+	depends on BR2_loongarch64
+
 config BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
 	bool "custom target"
 	help
diff --git a/linux/linux.mk b/linux/linux.mk
index 16d9f1947089..8c59521a9adf 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -233,12 +233,16 @@ else ifeq ($(BR2_LINUX_KERNEL_LINUX_BIN),y)
 LINUX_IMAGE_NAME = linux.bin
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUX_BIN),y)
 LINUX_IMAGE_NAME = vmlinux.bin
+else ifeq ($(BR2_LINUX_KERNEL_VMLINUX_EFI),y)
+LINUX_IMAGE_NAME = vmlinux.efi
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
 LINUX_IMAGE_NAME = vmlinux
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ),y)
 LINUX_IMAGE_NAME = vmlinuz
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ_BIN),y)
 LINUX_IMAGE_NAME = vmlinuz.bin
+else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ_EFI),y)
+LINUX_IMAGE_NAME = vmlinuz.efi
 endif
 # The if-else blocks above are all the image types we know of, and all
 # come from a Kconfig choice, so we know we have LINUX_IMAGE_NAME set

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
