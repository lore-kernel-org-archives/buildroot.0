Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18561C4345F
	for <buildroot@archiver.kernel.org>; Sun, 21 Apr 2024 21:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 825B6605DC;
	Sun, 21 Apr 2024 21:46:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zyuY7TFAc0u3; Sun, 21 Apr 2024 21:46:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5F4060625
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5F4060625;
	Sun, 21 Apr 2024 21:46:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C5A7D1BF239
 for <buildroot@lists.busybox.net>; Sun, 21 Apr 2024 21:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0292404E1
 for <buildroot@lists.busybox.net>; Sun, 21 Apr 2024 21:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VBg3fpJ8SA8s for <buildroot@lists.busybox.net>;
 Sun, 21 Apr 2024 21:46:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.163.185.148;
 helo=sonic305-22.consmr.mail.ne1.yahoo.com;
 envelope-from=dterry_engineer@yahoo.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3525D404D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3525D404D5
Received: from sonic305-22.consmr.mail.ne1.yahoo.com
 (sonic305-22.consmr.mail.ne1.yahoo.com [66.163.185.148])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3525D404D5
 for <buildroot@buildroot.org>; Sun, 21 Apr 2024 21:45:59 +0000 (UTC)
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1713735958; bh=Nd7DxT/JLaiARKZ+hbHRC/XS/NNPGO86DymfGK9vj30=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=JVZ3/DWelqDF7Ui+8sdzG2z8CnLJIvtV9R9VsoIF6eR2cR7PTU1r9TLqBWSJyfBF2O1qrDYmHNk4hcpzYxkwEDdGKthWhNErNscy5AkAAxYOcwIBEF4driTT3dGXmD8diJfBXyURXZvbVYWpUZxbGkmS9L15pyKW96gtTuO3uk35YFoTMuUmiTOGokvb0xbG+p27doFvj/+pEnkHrCiK/3BsuK+wV95PMAAVdCo9c7xeXAdP5hoI4mat8FAB4L1DLyvYFWZRO8/hLncjPUPqvbLBWTADSEGwZ/cXQfIAtVh0aB6YJpqHKxMNyHDJUNyutxryRr2V7ShiAjnChLP3Dw==
X-YMail-OSG: zZwXCBsVM1nttxHArYLFALlgZCy3MA6f4N27D_uxFlYK1P3EM6kpwLBKYVTB.rg
 .yNfnNaaWOCuEpix4QSSEEeQub4N3A7zfjj7Ega7Ud8YgcJ.BUPBlGFKlNEpNqrbv3Kwpv0P6NJ7
 YVvn9F03ddM4YNbjnTO1P8vemjOpEY5pCk0lPXe.xDyFXFRfOFDaBP6FC_Luz2D5lPuKXbiPX9YQ
 zCdP0LZGSPhLttsk2kjo7uVPECpFZc6gE3ibyDdVVZatQcW5TmFwvaaPhWINEyZm03PuJTORzMGH
 WJY4u6n.G1v2egCn8Vj9sykZy.etvF31RmlujjeOv82Y5md0FKTdngBm80OSaT7Xi8t02MdIqOk_
 8Go1mpjrFanKJePmpe_dZwHg39xqHY3bEA7NJ2AKdTGDNFNQVDff7mdKgS06oIgGFF2xTBoSPZtS
 QtPuDtn8czLOYKGSH7z3nrUVQGfATcshaqsG2XhlM_F9sKeXCNGHjNGZyma5IgILJhdhAtgncmyD
 uJAIG.DpSK2NGnvU9eNJzXzABIH3_75C62AUBG9IVzCwvJ_HnIKCZWDFfKo0CKfqlvhaov1ZQ2p6
 fpDlbvClZzOPiwLx2NcbYTNdUVj0UOP1fwlsKD_70YjHNefs5h3qWl54n53XuNKZNRivaLGFk7tT
 JDzajPX3cy3icBb0pWURXss9vSKJYpFfoZSKwMOwg2DqN1jmQUkCZ9LuooGNb.Ra1kr8goWfm5RA
 _Q9lP4xDtAtAz2WUCgpihI.68MtNPhHfzKa5joZvkce44FMueNGbYusDfnVNWc0yoCyGIrnHGdAi
 PQ4G5A6So4xvF_arhield8kzcaxZfBH4lWGmmnvsCa75inxh0DWFn_N7x89Deo8u3Y0K3d3wSAvy
 WxpeLTq2r8C20j5JihxqPWT.XvhyIDimTLvKqUcs2N3xlWf0M3pdz2T5gHMriQ5O9IR.Zry79Yfj
 UjmLtQ2_yJGJJa1J85TYId2Yad5b.ORiAmRcgNB140j5tUXB.ga_1.U2npDBAXfVMOsFAKgxCNNW
 xmlu4TxLdguTERpGmRWCNwmNYoCVZkyIr0VC8KXIJGIvyNdoXeH85zrcoVnlANLOC1YJkn6To44t
 MS5TBhQLSGSfPK1_i.cjDStocC0_PB_LslPNOpCyH9yDtNTvuhspFrdHmkZjq.3QT6w_OZIUSkPD
 D7ft__DeWVk4fIK987c5oaVAb6MHhMXeHB2H_Lqh9PyaDzm0lj5Fa9P7QYikFrJAvhvS6ze0ERrN
 BKk.1IcrLNFMwSsQyzamKoWBjPC6glltniZuG3uAQaAVc6shK8CXOKWG0vOx_ouI0DASC1ouYfks
 lR8mi7pvV7b_P9wQStI.kM5XDt3mTnP1kjCrlR0ynn6RssyoEavctdMHRb8fqUeieBhxDRy3TyBv
 vdhAClFYoO.Q2BgyfOLV_ze6Ni3PO.qyTTSWeRJWS4YQZ2RDQXqOJyYy90SBCQfv.H_34O64ZVEo
 TDqFLmOhVgDXD1jCwjA694mPOaaflhXyq7LMKBRWupPjKs30vQqWMhoP8oJ.c_aoJWA2uns950fR
 Be.ESZux1swGam_N5pWTTp29iaAl3w3_hKsX7U061mSnbVxwaV30gqxQxSL1N2bKm8IucmbC31A3
 UYnenyp6Px10o7LYkH1PHm3H.pwKjGNR4wdjqRvpRb9RVkzHfi2gHxBJ5mXks4pmwPlxot_4635X
 DXCF1ytB1cVANpyNF8RRwQlm9pxq7O7eQhFCqrODA937O0hGMyi.UgPO6KznWer3zKv2xRmps6w1
 5Sz05SOiCblvWf6mgP.X_rFc89GPaEJ36Q0a_OgGZ7syT12RsNEOHbxajG01yxWPMI_BLB_8CKMY
 KwXLphQNItL2jcea6jp63nbnIKM42MQpobdZSxEPIOCJDEoIB5.ozPBKJGNi9EPrrcaeF3enhndU
 pMDaLGLk7P9H6Qj5HicXJjVEH7IDtzhhlm1JZhWJOKHR84lgZEMKszU18xBJJoXGl86DwrlaxsOw
 HacV0irMdyYHq.5tzY67z2D1yXunCbTxvtiQa2LMUUS8KBCZeN1IUd7ASLV4cB1K90fFtoAf0nrO
 0_nH1YnVwvb36TuhZ_BcruM4yo0unpRtBbrPe.iWXXA37GgACWnPgXLAD0FriMZFNbMqwA8VwWcw
 .VYbgf3CMb9NCum1wJBkzS2iDEJxY12y..zvrhUW_edzNrTB_m.YF6I4LFrsp_VUuH75zSccw7T4
 OLyW5EzUA894jI.fgyA94AGsbCyw9c.BUqznt6J624qJSJ4UHD_tkJsF1W9dENdUmC_qAsZRcC5O
 LMsZrKLpAO4zDTgoUQQiu
X-Sonic-MF: <dterry_engineer@yahoo.com>
X-Sonic-ID: 61cf408b-ade3-4152-9f16-555448156e5c
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.ne1.yahoo.com with HTTP; Sun, 21 Apr 2024 21:45:58 +0000
Received: by hermes--production-bf1-5cc9fc94c8-6tdrv (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID b806dd97835d470a332ad44e6ee79052; 
 Sun, 21 Apr 2024 21:45:54 +0000 (UTC)
Message-ID: <7fa51af7-ed13-416c-85c6-cf40c1fba698@yahoo.com>
Date: Sun, 21 Apr 2024 16:45:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
References: <e2634bc6-2e68-4331-8354-49407b40f191.ref@yahoo.com>
 <e2634bc6-2e68-4331-8354-49407b40f191@yahoo.com>
 <6068206a-9a0c-4ef4-a5bb-9e6f35218297@benettiengineering.com>
 <d144cbba-9be6-477f-9a79-e72361487734@yahoo.com>
 <810bfc26-b829-42a8-8ae3-bf42ac3b7eec@benettiengineering.com>
 <5bc2b354-bcfb-407e-8d77-47ffbade5cd8@yahoo.com>
 <6e04a9f2-8d53-4fae-9c1a-9c69b4c7fbdb@grenoble.cnrs.fr>
Content-Language: en-US
In-Reply-To: <6e04a9f2-8d53-4fae-9c1a-9c69b4c7fbdb@grenoble.cnrs.fr>
X-Mailer: WebService/1.1.22256
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yahoo.com; s=s2048; t=1713735958;
 bh=NTCPvNEPF82yOoI7wN2DcNrs4KFET2UawOjlSRmLJuo=;
 h=Date:Subject:To:References:From:In-Reply-To:From:Subject:Reply-To;
 b=JMKPqH3IPui2wMKXHeaa5pwwd8xs2pdaTkduWCWe7grR9x+hnoDIqR7T/hr8/Ei3F798t2H4pHtg6PI9HMPQWazZfTV2R9FdiDW4QOuPyPZQZ9WrpWXcMM9FrqhSQKmc/KYHrEIz2BHFPcAClrGjINNpi9ukpB09GDrQ6iLyAZ6dcEYioOhwKYVE9HSeEHoHXhY1tjS/BsQ9NL7NxmdARKSzpAer7WLOIKpApRUGT3lw2LrnjvyksKYEvRYGsptfSD7/M6320zyj8PWuZl+CH96zigm8Kgeosmki84m82Q9N7rHID1syBVsLoul5/Lg0fE2uFaL1q0v4Zh+7cE05Jw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=yahoo.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.a=rsa-sha256 header.s=s2048 header.b=JMKPqH3I
Subject: Re: [Buildroot] Problem with device tree
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
From: DTrustee via buildroot <buildroot@buildroot.org>
Reply-To: DTrustee <dterry_engineer@yahoo.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thank you for your reply. I used that git site as it was the one for the 
training material and not the official site, at least that is what I 
think it is. As for the output directory I should have read the error 
message more closely as it was saying it could not make the output 
directory and that is because of permissions I had. Ran sudo mae 
menuconfig and it ran. Hopefully it will make without errors.

Again thank you for your help, everyone who answered.

Have a Blessed day!

Don


On 4/18/24 1:40 AM, Edgar Bonet wrote:

> Hi!
>
> Don wrote:
>> I cloned: git clone https://github.com/bootlin/buildroot which I think
>> is the repository for the training.
> Note that the official Buildroot git repository[1] is:
>
>      https://gitlab.com/buildroot.org/buildroot.git
>
>> How does one go about learning buildroot, the latest version, for the
>> Beaglebone Black (or any other board for that matter)?
> The latest stable version is 2024.02.1. Thus I would start by making
> sure I have all the system requirements,[2] then:
>
>      git clone https://gitlab.com/buildroot.org/buildroot.git
>      cd buildroot
>      git checkout 2024.02.1
>      make beaglebone_defconfig
>      make
>
> This would be a sanity check. If that works, then you can start
> customizing the configuration, doing out of tree builds, etc.
>
>> that is lacking the output directory
> The output directory will be created as part of the build process.
>
> Regards,
>
> Edgar.
>
> [1] https://buildroot.org/download.html
> [2] https://buildroot.org/downloads/manual/manual.html#requirement
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
