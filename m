Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CBECC433FE
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 08:38:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D5EC611CC
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 08:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D5EC611CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEE9340001;
	Fri, 15 Oct 2021 08:38:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GHWeaWh1QLa2; Fri, 15 Oct 2021 08:38:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E782D401F4;
	Fri, 15 Oct 2021 08:38:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AFE071BF334
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 08:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E9414016D
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 08:38:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LVLSv0lA2_sP for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 08:38:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37251400FF
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 08:38:34 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id y15so38650292lfk.7
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 01:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aCfV2alKiJPJaJ3FDx7RWD2Me77wX7DryfatLDVeuYE=;
 b=FsweDwjxEEnoWjdI5dGf8lZ+46/7kCwdMXNa0xhumrRBVBst022wOa0GlTaJpahxWh
 j7Jl+PTPHh8uOexYx9HV4j+RLqXd/CoGXFSWWrBcfKfx7neqS/HjxdPlwnS91jKsQmkT
 Icd2txUN37cYMOsbM8SUiPEfEEue9PGfCnGtoJqiXierEYYONSR6bmGOI14J9Xe5MDIn
 mDbQ0DjxJO7BSBlvC3gQr7Kj/Uk2ewGOs/QDCLgnbCDKRC9DTX3qowIZuAY3Dk0VlM2S
 5DWSAIdeY5y72PuIXMj0zeG71jDD0RmS2fjnsd3v8NLW8ERtDtYGgc4BVlMPtGJHmWtI
 OoTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aCfV2alKiJPJaJ3FDx7RWD2Me77wX7DryfatLDVeuYE=;
 b=NqbGKxJ1TdtccqxCNGfeqq3DQ+GYt2eY54SmIuVb2ZYS+Gund1sPvqDuLnn7v3/JGc
 IUsOqJeVyBPTHiBLGp8UOr+y4M5RtfWSDocZ0IfmQpEzJ896RrxpRJLb4Y/KfUIYZINU
 /OaYIO4lfLyYKaPPf1/IVRpuQ7YnqS7y0Atri1NILOUpY7yITQR3DBbJcEOg91XaDkdd
 +yUkboBgpddKXmohiFM8YGwppK0qoj1NpDQR7h1xNlFIG4RGnBB9uCeVE00UD+a3mzVK
 3ho3y09nZM0Svboj0+wvF2fMJmizVnVnprCooYqertRR9eazWxKznkNn6KZTGrSGo62n
 P4Yw==
X-Gm-Message-State: AOAM530ldlkPHA93Oa0gf+chXMMWJWQJZR7EK0tVyOwbcxFduSZy5HBL
 wZaAtk2Zu/pzDfOUi4ITrJ/eIh4F2DSKXhez
X-Google-Smtp-Source: ABdhPJwD3wLg7V4Do9nlU3Uk4H8FIw+On9Zqw/vx3ETlMW1Ic3b2Cbd3B0CYm4sMucneQau8CsD0uQ==
X-Received: by 2002:a2e:a7ca:: with SMTP id x10mr11829393ljp.484.1634287111890; 
 Fri, 15 Oct 2021 01:38:31 -0700 (PDT)
Received: from Unikie-T14-Gen-2i.madriguera.foxhound.fi
 (88-113-104-240.elisa-laajakaista.fi. [88.113.104.240])
 by smtp.googlemail.com with ESMTPSA id r10sm446336lfr.46.2021.10.15.01.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 01:38:31 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 11:38:30 +0300
Message-Id: <20211015083830.1971193-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/softhsm2: new package
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
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHBhdGNoIGFkZHMgYSBiYXNpYyBjb25maWcgZmlsZSBhbmQgYSBiYXNpYwpyZWNpcGUgdG8g
YnVpbGQgc29mdGhzbTIuCgpTaWduZWQtb2ZmLWJ5OiBKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBl
a2thcmluZW5AdW5pa2llLmNvbT4KLS0tCiBwYWNrYWdlL3NvZnRoc20yL0NvbmZpZy5pbiAgIHwg
IDggKysrKysrKysKIHBhY2thZ2Uvc29mdGhzbTIvc29mdGhzbTIubWsgfCAxNSArKysrKysrKysr
KysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2Uvc29mdGhzbTIvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2Fn
ZS9zb2Z0aHNtMi9zb2Z0aHNtMi5tawoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc29mdGhzbTIvQ29u
ZmlnLmluIGIvcGFja2FnZS9zb2Z0aHNtMi9Db25maWcuaW4KbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMC4uMTBjOWYwZTU1NwotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uv
c29mdGhzbTIvQ29uZmlnLmluCkBAIC0wLDAgKzEsOCBAQAorY29uZmlnIEJSMl9QQUNLQUdFX1NP
RlRIU00yCisJYm9vbCAic29mdGhzbTIiCisJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9MSUJPUEVO
U1NMCisJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQlRPT0wKKwloZWxwCisJCVNvZnRIU00gaXMgYW4g
aW1wbGVtZW50YXRpb24gb2YgYSBjcnlwdG9ncmFwaGljIHN0b3JlIGFjY2Vzc2libGUgdGhyb3Vn
aCBhIFBLQ1NcIzExIGludGVyZmFjZS4gWW91IGNhbiB1c2UgaXQgdG8gZXhwbG9yZSBQS0NTXCMx
MSB3aXRob3V0IGhhdmluZyBhIEhhcmR3YXJlIFNlY3VyaXR5IE1vZHVsZS4KKworCQlodHRwczov
L2dpdGh1Yi5jb20vb3BlbmRuc3NlYy9Tb2Z0SFNNdjIKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc29m
dGhzbTIvc29mdGhzbTIubWsgYi9wYWNrYWdlL3NvZnRoc20yL3NvZnRoc20yLm1rCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjQ0OTZkNzBjM2QKLS0tIC9kZXYvbnVsbAor
KysgYi9wYWNrYWdlL3NvZnRoc20yL3NvZnRoc20yLm1rCkBAIC0wLDAgKzEsMTUgQEAKKyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjCisjCisjIHNvZnRoc20yCisjCisjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIworCitTT0ZUSFNNMl9WRVJTSU9OID0gMi42LjEKK1NPRlRIU00yX1NJVEUgPSAkKGNhbGwg
Z2l0aHViLG9wZW5kbnNzZWMsU29mdEhTTXYyLCQoU09GVEhTTTJfVkVSU0lPTikpCitTT0ZUSFNN
Ml9MSUNFTlNFID0gR1BMLTIKK1NPRlRIU00yX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCitTT0ZU
SFNNMl9ERVBFTkRFTkNJRVMgPSBsaWJ0b29sIG9wZW5zc2wKK1NPRlRIU00yX0FVVE9SRUNPTkYg
PSBZRVMKK1NPRlRIU00yX0lOU1RBTExfVEFSR0VUID0gWUVTCisKKyQoZXZhbCAkKGF1dG90b29s
cy1wYWNrYWdlKSkKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
