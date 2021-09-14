Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EDFC433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 13:21:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BA9F60E9B
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 13:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3BA9F60E9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F393840369;
	Tue, 14 Sep 2021 13:21:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yGi4dy0Jr8Py; Tue, 14 Sep 2021 13:21:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27B7A40359;
	Tue, 14 Sep 2021 13:21:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6ADB61BF2FA
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 13:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AB5580E6C
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 13:21:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20150623.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tCefyJAJbDLm for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 13:21:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DB4F80F4B
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 13:21:43 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id i4so11654097lfv.4
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 06:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vLeuzS57d6Jw3C2kFdic2rAzIYvaWzPJcbtHK0oxuBU=;
 b=lIotbElWfXEfRq4z6xoSXPq5Pp4uE/v/MkfXSOdlyg1eJGunCobcSU7ZggXb+MmBvH
 xBvkQgdTZ1ceJ4PgzTq26vzUX4y/OZ1w39CFH7q2SCH5EMcOal+c2cwcfZJPXBQuKZ9k
 w0CneuT1ncOARXP4OmZd47j+7mEX18t2c13cPNhd8G+fDnCS2afOGBCCLgwEWTXW0zTy
 wzDb/zM7AJ/4tesx1RGrozWgsuY9FtAAzYUbaf2/dz1T0q641EeeYvtPIgY7FDn83q6H
 iThqnZfvkeuk/ISG0PvupUsGsGrqjgB5VmYIDhLKU2yA2iuEH+lE0nOWHFruut9C8EoP
 ZyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vLeuzS57d6Jw3C2kFdic2rAzIYvaWzPJcbtHK0oxuBU=;
 b=VPXPrlEX5qlHUI+gciyRAvpi5UJAJR7CcNbKn64ZuDWyjhs5M3h7oUfA+lvQKskC+k
 LqQOFcNmxKEBwfCTDTBzxwzE83QnzQkz2du9cZwcbA0QZZ8Fc28EiAx1WE7wOJTAkQee
 WlUwceH7MWrzXtgmf2D/KRVy0OsquNzkM+XuCPKyT/qwJfJQePaHY22cbpOMDYwqDHPq
 hiwv/M69rcRz5yngCGp1SuG/FbQ4nZdcwZg+O8EpMbNqbOh86ZUbO7XVtpx4x443X5tL
 gqw8pldDOMrBwkvF1qn4n3gFgtWQ4cUVTBBt0uv3FWSzzhUzYZUMerJR8JqMIBojvYu7
 k9Mg==
X-Gm-Message-State: AOAM5312Mm6/nR8SMwkfYrF+eaOG9uz9aDz+W3mjqI+2w6PIlmr2+hkb
 ySVSQrjLNfoy8QezuvMbAYgzNOpoDVeKVFYc
X-Google-Smtp-Source: ABdhPJzU0+QhXS64huWOcwL7a0MjATaJ50yN6p7RNLG9whx47uM6yHupsN5M79UBibi8fR/6cFdcrg==
X-Received: by 2002:a05:6512:1047:: with SMTP id
 c7mr13107279lfb.658.1631625701124; 
 Tue, 14 Sep 2021 06:21:41 -0700 (PDT)
Received: from Unikie-T14-Gen-2i.madriguera.foxhound.fi
 (88-113-104-240.elisa-laajakaista.fi. [88.113.104.240])
 by smtp.googlemail.com with ESMTPSA id f25sm40480lfk.11.2021.09.14.06.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 06:21:40 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 16:21:39 +0300
Message-Id: <20210914132139.3597322-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/iptables: add init script
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
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

VGhpcyBwYXRjaCB3aWxsIGFkZCBhbiBpbml0IHNjcmlwdCB0aGF0IGFsbG93cwp0byBzZXQgYSBy
dWxlc2V0IGluIC9ldGMvaXB0YWJsZXMuY29uZiB0byBiZSBsb2FkZWQKb24gYm9vdCwgb3IgZmx1
c2hlZCBvbiBzdG9wLCBhcyB3ZWxsIGFzIGEgc2F2aW5nCmNvbW1hbmQgdG8gZ2VuZXJhdGUgYSBu
ZXcgZmlsZS4KClNpZ25lZC1vZmYtYnk6IEpvc8OpIFBla2thcmluZW4gPGpvc2UucGVra2FyaW5l
bkB1bmlraWUuY29tPgotLS0KW3YxIC0+IHYyXSBzL3RvdWNoICQoREVTVERJUikvdG91Y2ggJChU
QVJHRVRfRElSKS8KCiBwYWNrYWdlL2lwdGFibGVzL1M0MWlwdGFibGVzIHwgNTggKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiBwYWNrYWdlL2lwdGFibGVzL2lwdGFibGVzLm1r
IHwgIDYgKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA2NCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS9pcHRhYmxlcy9TNDFpcHRhYmxlcwoKZGlmZiAtLWdpdCBhL3BhY2th
Z2UvaXB0YWJsZXMvUzQxaXB0YWJsZXMgYi9wYWNrYWdlL2lwdGFibGVzL1M0MWlwdGFibGVzCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjkzOTk4Yjc4ZGUKLS0tIC9kZXYv
bnVsbAorKysgYi9wYWNrYWdlL2lwdGFibGVzL1M0MWlwdGFibGVzCkBAIC0wLDAgKzEsNTggQEAK
KyMhL2Jpbi9zaAorCitEQUVNT049ImlwdGFibGVzIgorCitJUFRBQkxFU19BUkdTPSIiCisKK3N0
YXJ0KCkgeworCXByaW50ZiAnU3RhcnRpbmcgJXM6ICcgIiREQUVNT04iCisJaXB0YWJsZXMtcmVz
dG9yZSA8IC9ldGMvaXB0YWJsZXMuY29uZgorCXN0YXR1cz0kPworCWlmIFsgIiRzdGF0dXMiIC1l
cSAwIF07IHRoZW4KKwkJZWNobyAiT0siCisJZWxzZQorCQllY2hvICJGQUlMIgorCWZpCisJcmV0
dXJuICIkc3RhdHVzIgorfQorCitzdG9wKCkgeworCXByaW50ZiAnU3RvcHBpbmcgJXM6ICcgIiRE
QUVNT04iCisJaXB0YWJsZXMgLUYKKwlzdGF0dXM9JD8KKwlpZiBbICIkc3RhdHVzIiAtZXEgMCBd
OyB0aGVuCisJCWVjaG8gIk9LIgorCWVsc2UKKwkJZWNobyAiRkFJTCIKKwlmaQorCXJldHVybiAi
JHN0YXR1cyIKK30KKworcmVzdGFydCgpIHsKKwlzdG9wCisJc2xlZXAgMQorCXN0YXJ0Cit9CisK
K3NhdmUoKSB7CisJcHJpbnRmICdTYXZpbmcgJXM6ICcgIiREQUVNT04iCisJaXB0YWJsZXMtc2F2
ZSA+IC9ldGMvaXB0YWJsZXMuY29uZgorCXN0YXR1cz0kPworCWlmIFsgIiRzdGF0dXMiIC1lcSAw
IF07IHRoZW4KKwkJZWNobyAiT0siCisJZWxzZQorCQllY2hvICJGQUlMIgorCWZpCisJcmV0dXJu
ICIkc3RhdHVzIgorfQorCitjYXNlICIkMSIgaW4KKwlzdGFydHxzdG9wfHJlc3RhcnR8c2F2ZSkK
KwkJIiQxIjs7CisJcmVsb2FkKQorCQkjIFJlc3RhcnQsIHNpbmNlIHRoZXJlIGlzIG5vIHRydWUg
InJlbG9hZCIgZmVhdHVyZS4KKwkJcmVzdGFydDs7CisJKikKKwkJZWNobyAiVXNhZ2U6ICQwIHtz
dGFydHxzdG9wfHJlc3RhcnR8cmVsb2FkfSIKKwkJZXhpdCAxCitlc2FjCmRpZmYgLS1naXQgYS9w
YWNrYWdlL2lwdGFibGVzL2lwdGFibGVzLm1rIGIvcGFja2FnZS9pcHRhYmxlcy9pcHRhYmxlcy5t
awppbmRleCBkYzAxNDY2NjA3Li4xZDM2MTJkYmY2IDEwMDY0NAotLS0gYS9wYWNrYWdlL2lwdGFi
bGVzL2lwdGFibGVzLm1rCisrKyBiL3BhY2thZ2UvaXB0YWJsZXMvaXB0YWJsZXMubWsKQEAgLTU3
LDQgKzU3LDEwIEBAIGRlZmluZSBJUFRBQkxFU19MSU5VWF9DT05GSUdfRklYVVBTCiAJJChjYWxs
IEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfTkVURklMVEVSX1hUQUJMRVMpCiBlbmRlZgogCitk
ZWZpbmUgSVBUQUJMRVNfSU5TVEFMTF9JTklUX1NZU1YKKwkkKElOU1RBTEwpIC1tIDA3NTUgLUQg
cGFja2FnZS9pcHRhYmxlcy9TNDFpcHRhYmxlcyBcCisJCSQoVEFSR0VUX0RJUikvZXRjL2luaXQu
ZC9TNDFpcHRhYmxlcworCXRvdWNoICQoVEFSR0VUX0RJUikvZXRjL2lwdGFibGVzLmNvbmYKK2Vu
ZGVmCisKICQoZXZhbCAkKGF1dG90b29scy1wYWNrYWdlKSkKLS0gCjIuMjUuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAbGlzdHMuYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
