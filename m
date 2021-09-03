Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C0BC433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 15:08:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 482D1608FB
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 15:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 482D1608FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEF1E83E70;
	Fri,  3 Sep 2021 15:08:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ecDbm9YlNP_F; Fri,  3 Sep 2021 15:08:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EBC583E78;
	Fri,  3 Sep 2021 15:08:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 67ED91BF2EB
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 15:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D93E42680
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 15:08:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lH5wZ8Xo-cOm for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 15:08:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F24C4267F
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 15:08:09 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id s25so8449662edw.0
 for <buildroot@buildroot.org>; Fri, 03 Sep 2021 08:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=9vxIIs3dkU1lt7+LRmcPVxRxWufIf55v6c+ZZW92How=;
 b=AZwiwulWhTcF3beyfC9J/pOEcmCUjk7KO0IICy5TVE/h3/pD9PMElDZSP9te4xeRjM
 oEK5vCzbb4kFLyhKU5/E4eDrcfHJbTZTE+gHk8L1xT3hndooD2c20RtNmon3Oqq9yrCI
 k3qy2xaXmR+1g9pRfvBX5OPj2AGfIRPE5y20DWm/anCn1AzrATFBJ4DxokozIqS1lnzL
 T20QQV3outjZlahrZfrcUtcJ6Cn0qrz0rCe2sFwViFWTDd9aDi8nKQBqX4oqKFaPAlj4
 h/EpCUXC3CZbYoxHKYSMVuPqyuQE4dhnISZZDXgG9eDJfEz/f4Kj7JjByPdUTXmzptpx
 yiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=9vxIIs3dkU1lt7+LRmcPVxRxWufIf55v6c+ZZW92How=;
 b=udaDn0yqKyOfbC/Q1EF1mwjF0OWFeUzeW6kRflzX/1yVxEcA8fNouNMfErS3bi+cwa
 Soy0rn/087HpLRX02+mX4PWvew3RGrfUfhZrX/ygPUL5zdtTj2OtwxCiaf0Et9w64+Mt
 IP+VN6E7Ifxz4X7tlnOnVSRDLR+gA/wjpjpMM8FSVd4bltkSRTcsVGWpXpw+vwMiR3TU
 HiwK7oPG/ZhkP570D/Bhy5Wje6M8q6cuD2saKbUjdCYt5xvuB9SavjvnwyPMPl3VqsWH
 9q2a8TuEsQS6g/0R83g4KFFWiSyciOVaoIZCkcgxQW3JEBcHyePxr3SStI1WyoZkukJ5
 S8bw==
X-Gm-Message-State: AOAM531rQCiUIfaSsbzVvz0g3W/yg02eg1kCkjhfmA8jpCdFqIRk+7/j
 gJk4t/gqa1FtOGhDFoT0ESfWTiOzFAs=
X-Google-Smtp-Source: ABdhPJzFLnUJyyom2NQjmVS5LTAJTxyrVTK48JQ677vWRTfaOeLcWG9qM2/m730WpVAGwULPjw49GA==
X-Received: by 2002:aa7:d304:: with SMTP id p4mr4518070edq.151.1630681687834; 
 Fri, 03 Sep 2021 08:08:07 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 c25sm2893154ejm.9.2021.09.03.08.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 08:08:07 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMAnV-00041v-Pz; Fri, 03 Sep 2021 17:08:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20210903065319.10107-1-peter@korsgaard.com>
Date: Fri, 03 Sep 2021 17:08:05 +0200
In-Reply-To: <20210903065319.10107-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 3 Sep 2021 08:53:18 +0200")
Message-ID: <87tuj1r92i.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/python3: security bump to version
 3.9.7
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Pj4+Pj4gIlBldGVyIiA9PSBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IHdy
aXRlczoKCiA+IEZpeGVzIHRoZSBmb2xsb3dpbmcgc2VjdXJpdHkgaXNzdWVzOgogPiAtIGJwby00
MjI3ODogUmVwbGFjZWQgdXNhZ2Ugb2YgdGVtcGZpbGUubWt0ZW1wKCkgd2l0aCBUZW1wb3JhcnlE
aXJlY3RvcnkgdG8KID4gICBhdm9pZCBhIHBvdGVudGlhbCByYWNlIGNvbmRpdGlvbi4KCiA+IC0g
YnBvLTQxMTgwOiBBZGQgYXVkaXRpbmcgZXZlbnRzIHRvIHRoZSBtYXJzaGFsIG1vZHVsZSwgYW5k
IHN0b3AgcmFpc2luZwogPiAgIGNvZGUuX19pbml0X18gZXZlbnRzIGZvciBldmVyeSB1bm1hcnNo
YWxsZWQgY29kZSBvYmplY3QuICBEaXJlY3RseQogPiAgIGluc3RhbnRpYXRlZCBjb2RlIG9iamVj
dHMgd2lsbCBjb250aW51ZSB0byByYWlzZSBhbiBldmVudCwgYW5kIGF1ZGl0IGV2ZW50CiA+ICAg
aGFuZGxlcnMgc2hvdWxkIGluc3BlY3Qgb3IgY29sbGVjdCB0aGUgcmF3IG1hcnNoYWwgZGF0YS4g
IFRoaXMgcmVkdWNlcyBhCiA+ICAgc2lnbmlmaWNhbnQgcGVyZm9ybWFuY2Ugb3ZlcmhlYWQgd2hl
biBsb2FkaW5nIGZyb20gLnB5YyBmaWxlcy4KCiA+IC0gYnBvLTQ0Mzk0OiBVcGRhdGUgdGhlIHZl
bmRvcmVkIGNvcHkgb2YgbGliZXhwYXQgdG8gMi40LjEgKGZyb20gMi4yLjgpIHRvCiA+ICAgZ2V0
IHRoZSBmaXggZm9yIHRoZSBDVkUtMjAxMy0wMzQwIOKAnEJpbGxpb24gTGF1Z2hz4oCdIHZ1bG5l
cmFiaWxpdHkuICBUaGlzCiA+ICAgY29weSBpcyBtb3N0IHVzZWQgb24gV2luZG93cyBhbmQgbWFj
T1MuCgogPiAtIGJwby00MzEyNDogTWFkZSB0aGUgaW50ZXJuYWwgcHV0Y21kIGZ1bmN0aW9uIGlu
IHNtdHBsaWIgc2FuaXRpemUgaW5wdXQgZm9yCiA+ICAgcHJlc2VuY2Ugb2YgXHIgYW5kIFxuIGNo
YXJhY3RlcnMgdG8gYXZvaWQgKHVubGlrZWx5KSBjb21tYW5kIGluamVjdGlvbi4KCiA+IGh0dHBz
Oi8vd3d3LnB5dGhvbi5vcmcvZG93bmxvYWRzL3JlbGVhc2UvcHl0aG9uLTM5Ny8KCiA+IFNpZ25l
ZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4KCkNvbW1pdHRl
ZCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGxpc3RzLmJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
