Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF4CCD128A
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 21:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 694F081C38;
	Tue,  9 Apr 2024 21:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5rnyQKJ64O6x; Tue,  9 Apr 2024 21:23:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B79F81C46
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B79F81C46;
	Tue,  9 Apr 2024 21:23:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 831AB1BF299
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 21:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 294DA40279
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 21:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2KrH3NpMSjfC for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 21:23:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.163.184.44;
 helo=sonic317-33.consmr.mail.ne1.yahoo.com;
 envelope-from=dterry_engineer@yahoo.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BCA9E40123
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCA9E40123
Received: from sonic317-33.consmr.mail.ne1.yahoo.com
 (sonic317-33.consmr.mail.ne1.yahoo.com [66.163.184.44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BCA9E40123
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 21:23:32 +0000 (UTC)
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1712697811; bh=48GgkagC2OVY0LDpksLJ4rJEo/zxJcKR6UXyWg66DgO=;
 h=X-Sonic-MF:Date:To:From:Subject:From:Subject;
 b=T2hleRn9DzHQ3Oh1Ice5GpN0I3x6FzP2MZH7YHBN2U0IkuHKZoLQb+Qy/1GlOH/xN0nGgcdlgyqQXSFEShy2j9pJ0gRQGkyjutQRcx+pYrcXyKILC7wUpf7eQXlCPux0rRN3+G4OLPJuOeq7MyoyDKXCfVSB8oeeVBJTm5btlhQ3CHFCv4hSlSe8tBRsvDKfepQh/fmniCLj6JjK6FLpNBdkkHiEHOZ2yYGx0BRbSXiQkLNEkWUzveEThuZGqGzkhx8StkpM5KKG73JCF5y4AJf6JopuOEp13fkz8uOLbrSv81PXdo6CVbxBfa1NkGVOnNUzXLG3Ua/oSbCQ2qHJ8Q==
X-YMail-OSG: UMUOv30VM1ms7WA5Q2aPQCnlLppkc10IKtiOqSmircjHXQuo8WA4K_bAyAwV19i
 ckq6dPWFl2Je3fftbGTeOmPOdn.eDhDVY3yhzltsGLexNlLJMJ.KvS8XmoRWJ7XA6up9VqNxm9I_
 dGwyxIiupjMCetjgXaJQV9nNb1zwWorsL.NC76GJFcRIJbQW9e8WCqI3fIng3lVVxWVm4uHmI93f
 1L.ewDHCxboXvthBxJb0LAv7sLDTW_dw.5HepVgQMSMD6t897aELswKaKOrE3Msw1HfIZXEjJyoz
 LqE.4KcUv994IYrjAmfV6aTMDphOaXL93CiO5vMgtxs2rRveLw0RyCoN4Wf2k9zIj1emin4BsH1w
 JTxBgkKoqL8IgtLEp4OdfndQiecXeNgjkXRgJ6gGtoJuWkvzT7QyU2D7D.2ZcUHC_rdRbir.EqzC
 thAhCpndO2c975MhBO_68arP2WwKJJ42YjkHDG63K34kLdTSEHFvweB3uPMkKOiMTjW2EuLoQk6Y
 hhlysGskSSbOmlQ51VDDUoDJkyW5276d2rqLcJL8Ki6r23Zwa.rQI87zemh7iYkZL3.WvuONdkRs
 jA0da_Puk9fUeWYQE3rgXfyHJ0ILUeW.P2t8LqEjc9hDawb05Yq_qzTLllaXoOaEn4KvqHG7Youi
 PTGWzKbqIS8JnvqoUKC8BR6I1pSz6pBdGpGLsBWqhGqKUnJRhLtM4T9WRg2UjWS15KgGfltvD9AE
 SFQILMerTtLAKZ1eYcf0JaF8BmMC93YZxfHPqRmAfSYJ7aD4Uf4GTqoM8_4DKu4hB193_PDg3ZP5
 U0z90NolGNXMroDfqCtQP.utMq_zLgRFkPwLRR2V4w_JXd.fZ45ORucylJSoObtL1K02gIyMWFfm
 DiQrYbIcphYXQQFAQq6AO0xabC_sjkdlnema6gkyYzcVHxY.FSYCjU68LELVNTY9ZgB.E7gafLdM
 .ER2lUzqS9XU5aLU_eM9tpLpW19o63GQqDd4Y_ywRx_C8LzjWIUvcUoqcAldAV7Fp0MqrAFN4_fT
 mQRyyLJgrs2Q75Cd6pl_2juifRPmkw2bkHMgmfsHum7ljebBOCI2.mmBWCYYaWLvdUXPw7DjooLH
 _fLM87g2ubQU3h6zriCiIWaR8MFHWTpBcQpjEHpWdqSn8eqv5hzisGqJOKbBtCsMXtfo2ZLYQuhC
 aovynmWLUpeE9A24TzZ1LHu_YtkzzDOjOjBRFuZg9_iQRV0ucFdwJa7RU9z7a9ZdhVBRgNdY4Gan
 jpimLfMrA9TqeMQFLfG3r_jokD3U_48pYx_nk9fETnnfBubVX7P9yQX.YNLhrbuz374n6W7vAqyd
 U4WXtaykDCNI8QzZxNjJ9n.0Av86iSw3Z2sNfcxpx0BY.xGHZawmBI6_tT151Avuf7OQvjeNcz7u
 5TWTygvOYziZQ2zbtb93oX1ndaSI6Es6.3zkpT_gsQTkZksGEwuKnmGjHqqV2XjygxROktqPkmsS
 yBwEke33p0ua9NTPRiqq1Tx4TyAyUwzk4W.aXH8gtRZiU1N99.oIsyomeppeMmmXsFEf_u5K_vs_
 8fSFr5oaWzUJTH68oMXUMkgqZ_zHSvfOJhK66efH.Bjnvmm2tBpHnbsfRDa7VldSOV8MON1toKka
 .PX.ycjUKHrR9vrH3gaMGFiPWgq60YK7aCdAVu0EMJQljlaOCX_nUYiMhfMQNFL50ixbgjS2bZTN
 zHLYl4fzCGJrrCYyiNyYwexJLQhbKYEqYsptRWfUNXGehPIWUo62BkI5Km0m1PVW9YDjB6sr0lmt
 gy3bgat_pA6FGVfIx6p8vdCR3qaMV6fUwu00Du3SBhd_J7xRu2rqhe06KoAfHRo_6RE5sn.XG.u4
 .q87zYErZEsiClOF_.ISgyuCuWOeihhW28cX0WNwIPOhrojZV5hH.Mif7vmhYnmctWn_gtEnDV2f
 hFmBPSBu7QegKDEQJe8XwOIGQzeRVgL33AqqqWVM8Ma1Qzr5SveQknIchhYeOHPcp7vD2MC7nX_1
 GCTAu1Cb4Y3QV61Wp8GlnPJFQUV0g.ZlGN6Kz57AwlYJe.Dk8LVb2oYVS2SYfWNq6VCm6N_irqGU
 AJ.YCW2pNLCzstpzDM2VtdZ7v8JUCrfWH1HtvBovpj2I7kxTOrDmJRPbI4TEdEj1cd3mEr7WqHhw
 aEq9XN7N6mYxbNFrMqIZWE5Lgg6aZ3nSTTVKrXpA7DaCTT9krhUqsdk8fR3S_M5zMbm75IG0EfuL
 F_sChdl6lEyh5eLzopgj4J5GjIu9mMaCyKRZ1..kphAYUJpR5P_MLkDrOE3Q6GUUDR_zWN9kESHD
 1Yv7444Ur
X-Sonic-MF: <dterry_engineer@yahoo.com>
X-Sonic-ID: 40f454dc-967a-45c6-95d6-6692a4001e9e
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.ne1.yahoo.com with HTTP; Tue, 9 Apr 2024 21:23:31 +0000
Received: by hermes--production-bf1-7d6dbd57c9-n5bk5 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 57ee0c5bbdeccdebf2d273434bb9d60a; 
 Tue, 09 Apr 2024 21:23:27 +0000 (UTC)
Message-ID: <e2634bc6-2e68-4331-8354-49407b40f191@yahoo.com>
Date: Tue, 9 Apr 2024 16:23:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Content-Language: en-US
References: <e2634bc6-2e68-4331-8354-49407b40f191.ref@yahoo.com>
X-Mailer: WebService/1.1.22205
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yahoo.com; s=s2048; t=1712697811;
 bh=QHO/7BqEF/de9fTCLjHWbS9o4kN4ks3d+FKBvKlfINU=;
 h=Date:To:From:Subject:References:From:Subject:Reply-To;
 b=GQrA/DgmJCUwDzBm2iVEHzAGOg7UYsSrzaTO1Bkux88kJvxp/s/MfLcZ+JtP9kUyIk8qSetxOpJOFS8wAeCT6NWmmwOSeP0xlW0+dVILZe/H21DAcgY4cY+mPoWXclp+qQxSIpo3OPtfoxD+ke0XX32bKfF14lVhV6zyo8t9zbgtoG/NLDaLGMGafYdXeuyP5/gWpidUjTWgClv+qpNmnaXH4vV/ygiWi0sIHVtJTDMCtywvQZe4dA6WV8iK065H2cyJg6fMp/vM2MZC8TVC3Gg072wP6Et+LTlQmRoTvobCvgS8bNKYchm0yfCK/I8fISHNV3Kew5zWVBbRiuqk3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=yahoo.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.a=rsa-sha256 header.s=s2048 header.b=GQrA/Dgm
Subject: [Buildroot] Problem with device tree
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
From: Don via buildroot <buildroot@buildroot.org>
Reply-To: Don <dterry_engineer@yahoo.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is my first time using buildroot. Following the instructions of 
bootlin.com/doc/training/buildroot/buildroot-labs.pdf, building for 
Beaglebone Black though not the wireless of the training pdf. Under 
Kernel - selected device tree blob and in-tree device tree name I put 
am335x-boneblack. However I get

Device Tree Source (arch/arm/dts/am335x-.dtb) is not correctly specified.
Please define 'CONFIG_DEFAULT_DEVICE_TREE'
or build with 'DEVICE_TREE=<device_tree>' argument

What does it want? Something is missing but I don't know what.

Thanks.

Have a Blessed day!

Don


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
