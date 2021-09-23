Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 410B6C433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 11:56:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFAA861107
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 11:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFAA861107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D2EF61403;
	Thu, 23 Sep 2021 11:56:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wqMcKdHoy-Da; Thu, 23 Sep 2021 11:56:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A035A607B0;
	Thu, 23 Sep 2021 11:56:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A9E211BF2BE
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 11:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 994B28426D
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 11:56:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XIUc8LP1kfOI for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 11:56:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 519C583E96
 for <buildroot@busybox.net>; Thu, 23 Sep 2021 11:56:13 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id b20so25751511lfv.3
 for <buildroot@busybox.net>; Thu, 23 Sep 2021 04:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=VBzO/00u+iAtqbL6Ac5Td1gOU7f/ZWOXH15dy74/IBY=;
 b=k9Jx+mIpr7HU7mKnzL5bBtpwzo5l0ld8UXsTQbeWx8SxYfbsdH5iTsaR21w3f3RpSG
 n12rKd2VsdPPcInqOc8pt/oxIen2aSjHFsiyY+4TmG6iCZv9Fi93U9LI/IaLLTKoKNkx
 rVO+B+yO/ZZupAjQSN3J7yNZ7vqYn8QUycznix+Fn4l2DXReHxSDsJxBywvJA1QtXXIR
 yObaRnD0X+inCbG31KLBxAZft90AACydnE3pTt2NbrGF03g0U727IKPx37y60QA8wZYO
 dW54pQEQOZpHwKICMS6cZZO01BSgEsscXcbDyui6xqXCasIbzHQsn+XpMOt9nrgkuEKR
 3wTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=VBzO/00u+iAtqbL6Ac5Td1gOU7f/ZWOXH15dy74/IBY=;
 b=kgsGB5meY1h8Yld0t6D8nfXnPjTKO04kffioU0n9neejxTzOb7erEt6mqON+WeQPCQ
 B4838cDfSELeub6AWMJkRGQyABWvs9iGbsVVgFHbQ1Ip5gLkqzfYl0PV7+fFn6UsWOAn
 h8+wJubxr1Y6BcatkXk12HP/EX1O3zHjOPE/SYucCKLQsVzphhGS5hwB6934C36mz2ZK
 e4iaXfTAPhpz0ieEZ1AxFa7Vw0s48dA/pOQC155zUbO8wzKeivCxyZmhjq1hr+q8HUwc
 LvfSyCkkelZu5TdiVNVkN9usphzua+2jrUiqztpQoW5Ca9gW/Yk0wf19xy35z9xNEU/j
 hMtA==
X-Gm-Message-State: AOAM5320W80y7fHK/il8ohysL72bKq1/4R08vmkmnZ8z4YTVPv9KDZ02
 SokRBq0PilhKNFtw7I9lMB/TyCArsuqQqsMjWPUFx6emCht2ig==
X-Google-Smtp-Source: ABdhPJw7mTzIIaV2su8CIQjbgNBZieUZVUfNHoqPUiihWphm8eYcs2sRswBCXU+Fi5BXC3yotp1BqruG4+GuR9fJupM=
X-Received: by 2002:a05:6512:2386:: with SMTP id
 c6mr3638178lfv.573.1632398170491; 
 Thu, 23 Sep 2021 04:56:10 -0700 (PDT)
MIME-Version: 1.0
From: Ivan Riabtsov <ivriabtsov@gmail.com>
Date: Thu, 23 Sep 2021 14:55:59 +0300
Message-ID: <CAKAnv4E=JmqtbHR_EM8hL9QTjrSbjNKsBjvA5Ogiv1BYqGDVEQ@mail.gmail.com>
To: buildroot@busybox.net
Subject: [Buildroot] buildroot u-boot.nand oob size
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

SSBoYXZlIGEgc3lzdGVtIG9uIGFuIG14MjhldmsgY2hpcCwgSSBoYXZlIHR3byB0eXBlcyBvZiBu
YW5kIG1lbW9yeSwKb25lIHdpdGggNjQgYnl0ZXMsIHRoZSBvdGhlciAxMjggYnl0ZXMsIEkgYW0g
YnVpbGRpbmcgYSBidWlsZHJvb3QsIEkKbmVlZCBhIHVuaXZlcnNhbCBmaXJtd2FyZSBmb3IgYm90
aCB0eXBlcyBvZiBtZW1vcnksIEkgZm91bmQgaG93IHRvCnBhdGNoIHVib290IHNvIHRoYXQgaXQg
d29ya3Mgd2l0aCBib3RoIG1lbW9yeSB0eXBlcywgYnV0IGJ1aWxkcm9vdCBoYXMKYW4gb3B0aW9u
IGZvciB1LWJvb3QubmFuZCBOQU5EIE9PQiBzaXplLCB3aGljaCBpcyBub3QgcmVjb2duaXplZCBi
eQp0aGUgYm9vdGxvYWRlciBkdXJpbmcgYm9vdCwgYnV0IGlzIGhhcmRjb2RlZCBpbiB1LWJvb3Qu
bmFuZCwKCmFjY29yZGluZ2x5LCBpZiBJIHNldCB1LWJvb3QubmFuZCBvb2Igc2l6ZSB0byAxMjgg
Ynl0ZXMsIHRoZW4gdGhlCnN5c3RlbSB3aXRoIDY0IG1lbW9yeSB3aWxsIG5vdCBib290IGFuZCB2
aWNlIHZlcnNhLCB0ZWxsIG1lLCBpcyBpdApwb3NzaWJsZSB0byBzb21laG93IGNyZWF0ZSBhIHVu
aXZlcnNhbCBmaXJtd2FyZSBmb3IgYm90aCB0eXBlcyBvZiBuYW5kCm1lbW9yeT8KCnBzIGkgY2Fu
dCB3cml0ZSBtZXNzYWdlIHRvIGJ1aWxkcm9vdEBsaXN0cy5idWlsZHJvb3Qub3Jn0LEgaSBnZXQg
YQptZXNzYWdlICJVbmRlbGl2ZXJlZCBNYWlsIFJldHVybmVkIHRvIFNlbmRlciIKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAbGlzdHMuYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
