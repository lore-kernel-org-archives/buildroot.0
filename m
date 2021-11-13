Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1036EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:21:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C747F60F6B
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C747F60F6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 710EF814A1;
	Sat, 13 Nov 2021 17:21:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QwHOh-KGjf0N; Sat, 13 Nov 2021 17:21:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCBB480EDD;
	Sat, 13 Nov 2021 17:21:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 892B91BF370
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77CD660651
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:21:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JeLj1Jlt9q3Y for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 17:21:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D14B60623
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 17:21:44 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id p16so30906678lfa.2
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 09:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language;
 bh=3jyXd85PtyMNGCFoskmsrJESPv/1m+b3eNeuO9hY8r8=;
 b=RifHG7UM+HpHzQJDINyHsmeaYP20Mrw2mtxhh6OS9ilJtIANAjMPvFbVhmrg5tAW9L
 iXolyzTn1pujw/n8RrwHFgMVEhjksJk6EcBupZl5wazxxPE2nDGmaxCZFCMA+Wk8tzmr
 KrZ46nfEr+TxYgotXO8Hyz1LkkjTKTv0Wbx3M4ry6+FquE8vgAE93497kqAVYMZQ54Xt
 RtQ5503ALqTzmwqgJIyRJbQIKwnTXAI8JhtD6j4l5eSkTD6rLL6w9RWiS1iAOXM9VYVr
 StWPzf6e3aNBmD5tMpVhVTKfL9P0zz985SxrnzblLCVCF6ojgzQ4XqydSSc2Gi7sWI4r
 vs5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language;
 bh=3jyXd85PtyMNGCFoskmsrJESPv/1m+b3eNeuO9hY8r8=;
 b=7SpwdoJ76umuxfGdS6D+rGDWJhw7Hr5nq9gWbYOx6qF0G2ND0XySM0UjgKnwm/gy2T
 uh4LKbTRp23lNm/5mxqnz7zKKZIu0HwFJZRZ5+73S9konvDMe++bLcKT5MgqOCC3komo
 /I4AAigVYdXL0Fu8OpOmy437HkjTT7qrY5UswuPPmM3Jli3kMYt+4qwklLKI/4O/zkFj
 LCCNElaWpTBOacw/mmKkSYhkFA64/eDZbx7pyh9d+sIDNrAsl4iIZha9Pc2y/Y+naDez
 mG+TDSaio5M2hCgQB3TzD/SpgMwRMfeA2o8punidbP/DzP1YJdpnGcaUCKbVlEA2QMT7
 p/aQ==
X-Gm-Message-State: AOAM530abIu4C70kipDstjYUltTYMJ/GJllQbHa0lfu93HlZTmqsm3b8
 eF+EGDXgIb1UMCkvqRR1ZoXGjpPC60o=
X-Google-Smtp-Source: ABdhPJyLhCSGj+FWaLc8JG9rs83gKai3X5+1Jejrv8Nnp1/531cLZpqs3Fr77Ogn6m0/QAljdti7yQ==
X-Received: by 2002:a19:9157:: with SMTP id y23mr22901667lfj.277.1636824102390; 
 Sat, 13 Nov 2021 09:21:42 -0800 (PST)
Received: from [192.168.10.7] ([178.155.5.87])
 by smtp.gmail.com with ESMTPSA id g6sm914273lfu.86.2021.11.13.09.21.41
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Nov 2021 09:21:42 -0800 (PST)
To: buildroot@buildroot.org
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Message-ID: <0ee5faa0-e4dc-a8a1-11ad-a1908a3d43aa@gmail.com>
Date: Sat, 13 Nov 2021 20:21:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------88514A6BC493EDFE7AB67DDE"
Content-Language: ru-RU
Subject: [Buildroot] Enable uart1 and uart2 on Orange pi zero
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
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--------------88514A6BC493EDFE7AB67DDE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Enable uart1 and uart2 on Orange pi zero.


--------------88514A6BC493EDFE7AB67DDE
Content-Type: application/gzip;
 name="board.tar.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="board.tar.gz"

H4sIAI/zj2EAA+2WUW/TMBDH99p8itMeeAnX2I4dbx2g8gHggS8wOU3aRmRJZTsSBfHdua7p
NiEGpKVBCP+V5CL7zmfnd3GSt8YWycVZxRjTSgFZrhXrLd/ZBwGXXKZacyU1MJ4ywS9AnXda
e3XOG0tTcaVdldvn/X7V36/jwf4jyu/5t9Y0q3JTnacQBvEnR8ZlJmTgP4a+43+4wc+lbf9U
NQzin0niryVTgf8Y+in/jfGLdelOrYNB/LUA2vxZmgb+Y+i3+NdV0306vgqG8M9YRvwF1yzw
H0MD+NOyJL798A4L73DviL0ner+d3nv/KAcFZlI+y58zfeDPpFL0/qdMStr/2RgP4D/nX1TL
JWAHaAHfg0mMXazpcpfkbesTIp24rrmqcC1wU3cH7j32KfVDPjwmQsRjck0EfRqQ0yGA6xlT
MyWmj3tITIXDojiOj5nT49gpcDGT6SyVU319vfsZ5bIfez4H5FfyJfnEvZ3PI3jRGes5fIlg
sqmahbc1NuaudPAaLotyabraX9486WTU8WofdEtt7s1NhBOqQ9/tQypn8rosKCZ+0tx+NNvd
MF/p7HOKY3KKE3K6/Lb1K8r6t+s2KCgoKOg0fQP9YQEpABQAAA==
--------------88514A6BC493EDFE7AB67DDE
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--------------88514A6BC493EDFE7AB67DDE--
