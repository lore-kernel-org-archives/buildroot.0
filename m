Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716A8C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 13:06:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB17F61131
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 13:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB17F61131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CEAC4052D;
	Wed, 15 Sep 2021 13:06:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QkT8Htbmba7h; Wed, 15 Sep 2021 13:06:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE079405C5;
	Wed, 15 Sep 2021 13:06:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A96601BF3CC
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 13:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5B8282798
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 13:06:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20150623.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5PWFlX2G58Bh for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 13:06:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C80A98272C
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 13:06:24 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id i7so5803183lfr.13
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 06:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8TWc6Beubw03+QkuOFZyVyMgYHpML1Y1MCrEWywovl8=;
 b=dRlgRDhGTZWrB52ZrjZtChgiehhE0xqIKTE1CKgq4tB0GF1GEQMyiq7lNjnYGqKIKh
 qS0UZOLyr1jr0DdB1K+9gnB8xJ/5/6Gt3wabDiyKnf5e15uyl1EXC1rZ/YRfMGAVQZZU
 svHSMtaNl0bUNGJA/xD1I989HDSRnvsxoevphtennHcHvyH02HM6oKCefkoOjhwDbnnA
 m5WuSdqE77PganxOPWggKcJxBwwOJu9BHDuRRwoxUPUlzU82/Dk/ymh3bSCuoSgvPsUX
 8Rd8NED950yPseL8tIv61WB50hOVxxauYOAqrEYvpnmRIf4X6/xFAmeV4YRjKgLgpqMg
 7wZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8TWc6Beubw03+QkuOFZyVyMgYHpML1Y1MCrEWywovl8=;
 b=NrSYos4dI5IE9t99fpCID6ma8kEs9mkjMjddiXw1LRyZFZsLJS+2eRI3SFBwBxdBJn
 Kbw0oKCC0T/J+p3k77kJDxjrl6oeZS+RCBN6ebYrIWsEu8sZ1GhSEaX49t67ZoTL+PM/
 1C/sGtUtJRLe5oeQT3UcJNE0ew6zK4jPX9ZB7f2Dlst1UhGyqIOao6f4stupYG3faLqL
 o6ut5i5FWTqMyqqb8zq7pZX/DVi26ncHIS3eS2EWzW+xIqgI3eLTAqFQLscDViEyobOf
 /I4hb6CgqAKgxDyh8BH3FvdyZp7sRruCGpvwT3NHcB9uT9JGFcWRxtWECplYPm+/nuc6
 BUuw==
X-Gm-Message-State: AOAM531DDF4pJL2sOqpgDRZAU6eHMSM+HR/slzOz2FuewKU91ym0CroC
 bGhPiCkjcrCjeF83dtL7UmteuMTbc6asJ7tm
X-Google-Smtp-Source: ABdhPJwRasmIm8oTeTnGYrSkZyv8j2Yaj3bZh+Ae35HB2j47Stj1cpBmhBg84Hw0fehS7IZV1ZN8CQ==
X-Received: by 2002:ac2:5547:: with SMTP id l7mr14252447lfk.458.1631711182619; 
 Wed, 15 Sep 2021 06:06:22 -0700 (PDT)
Received: from Unikie-T14-Gen-2i.madriguera.foxhound.fi
 (88-113-104-240.elisa-laajakaista.fi. [88.113.104.240])
 by smtp.googlemail.com with ESMTPSA id bu8sm1364812lfb.216.2021.09.15.06.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 06:06:22 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@buildroot.org
Date: Wed, 15 Sep 2021 16:06:20 +0300
Message-Id: <20210915130620.3162787-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3] package/iptables: add init script
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
QVJHRVRfRElSKS8KW3YyIC0+IHYzXSBFeGVjdXRlIGJlZm9yZSBuZXR3b3JraW5nIHNjcmlwdCwg
aGFuZGxlIHJvIHJvb3RmcwoKIHBhY2thZ2UvaXB0YWJsZXMvUzM1aXB0YWJsZXMgfCA2MiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHBhY2thZ2UvaXB0YWJsZXMvaXB0YWJs
ZXMubWsgfCAgNiArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKykKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2lwdGFibGVzL1MzNWlwdGFibGVzCgpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9pcHRhYmxlcy9TMzVpcHRhYmxlcyBiL3BhY2thZ2UvaXB0YWJsZXMvUzM1aXB0YWJs
ZXMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNjAyMzI5NzIzNgotLS0g
L2Rldi9udWxsCisrKyBiL3BhY2thZ2UvaXB0YWJsZXMvUzM1aXB0YWJsZXMKQEAgLTAsMCArMSw2
MiBAQAorIyEvYmluL3NoCisKK0RBRU1PTj0iaXB0YWJsZXMiCisKK0lQVEFCTEVTX0FSR1M9IiIK
Kworc3RhcnQoKSB7CisJcHJpbnRmICdTdGFydGluZyAlczogJyAiJERBRU1PTiIKKwlpcHRhYmxl
cy1yZXN0b3JlIDwgL2V0Yy9pcHRhYmxlcy5jb25mCisJc3RhdHVzPSQ/CisJaWYgWyAiJHN0YXR1
cyIgLWVxIDAgXTsgdGhlbgorCQllY2hvICJPSyIKKwllbHNlCisJCWVjaG8gIkZBSUwiCisJZmkK
KwlyZXR1cm4gIiRzdGF0dXMiCit9CisKK3N0b3AoKSB7CisJcHJpbnRmICdTdG9wcGluZyAlczog
JyAiJERBRU1PTiIKKwlpcHRhYmxlcyAtRgorCXN0YXR1cz0kPworCWlmIFsgIiRzdGF0dXMiIC1l
cSAwIF07IHRoZW4KKwkJZWNobyAiT0siCisJZWxzZQorCQllY2hvICJGQUlMIgorCWZpCisJcmV0
dXJuICIkc3RhdHVzIgorfQorCityZXN0YXJ0KCkgeworCXN0b3AKKwlzbGVlcCAxCisJc3RhcnQK
K30KKworc2F2ZSgpIHsKKwlwcmludGYgJ1NhdmluZyAlczogJyAiJERBRU1PTiIKKwlpZiBpcHRh
Ymxlcy1zYXZlID4gL2V0Yy9pcHRhYmxlcy5jb25mOyB0aGVuCisJCXN0YXR1cz0kPworCQlpZiBb
ICIkc3RhdHVzIiAtZXEgMCBdOyB0aGVuCisJCQllY2hvICJPSyIKKwkJZWxzZQorCQkJZWNobyAi
RkFJTCIKKwkJZmkKKwllbHNlCisJCXN0YXR1cz0kPworCQllY2hvICJTS0lQIChyZWFkLW9ubHkg
ZmlsZSBzeXN0ZW0gZGV0ZWN0ZWQpIgorCWZpCisJcmV0dXJuICIkc3RhdHVzIgorfQorCitjYXNl
ICIkMSIgaW4KKwlzdGFydHxzdG9wfHJlc3RhcnR8c2F2ZSkKKwkJIiQxIjs7CisJcmVsb2FkKQor
CQkjIFJlc3RhcnQsIHNpbmNlIHRoZXJlIGlzIG5vIHRydWUgInJlbG9hZCIgZmVhdHVyZS4KKwkJ
cmVzdGFydDs7CisJKikKKwkJZWNobyAiVXNhZ2U6ICQwIHtzdGFydHxzdG9wfHJlc3RhcnR8cmVs
b2FkfSIKKwkJZXhpdCAxCitlc2FjCmRpZmYgLS1naXQgYS9wYWNrYWdlL2lwdGFibGVzL2lwdGFi
bGVzLm1rIGIvcGFja2FnZS9pcHRhYmxlcy9pcHRhYmxlcy5tawppbmRleCBkYzAxNDY2NjA3Li5m
MGRkY2E4ZjlhIDEwMDY0NAotLS0gYS9wYWNrYWdlL2lwdGFibGVzL2lwdGFibGVzLm1rCisrKyBi
L3BhY2thZ2UvaXB0YWJsZXMvaXB0YWJsZXMubWsKQEAgLTU3LDQgKzU3LDEwIEBAIGRlZmluZSBJ
UFRBQkxFU19MSU5VWF9DT05GSUdfRklYVVBTCiAJJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxD
T05GSUdfTkVURklMVEVSX1hUQUJMRVMpCiBlbmRlZgogCitkZWZpbmUgSVBUQUJMRVNfSU5TVEFM
TF9JTklUX1NZU1YKKwkkKElOU1RBTEwpIC1tIDA3NTUgLUQgcGFja2FnZS9pcHRhYmxlcy9TMzVp
cHRhYmxlcyBcCisJCSQoVEFSR0VUX0RJUikvZXRjL2luaXQuZC9TMzVpcHRhYmxlcworCXRvdWNo
ICQoVEFSR0VUX0RJUikvZXRjL2lwdGFibGVzLmNvbmYKK2VuZGVmCisKICQoZXZhbCAkKGF1dG90
b29scy1wYWNrYWdlKSkKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlzdHMu
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
