Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B79ECC433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 12:58:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 468F361057
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 12:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 468F361057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11706404D0;
	Tue,  7 Sep 2021 12:58:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3_FhT47atjUR; Tue,  7 Sep 2021 12:58:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F3D440270;
	Tue,  7 Sep 2021 12:58:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AAD891BF334
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 12:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7C13828EF
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 12:58:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20150623.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eMdzMOP99AdC for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 12:58:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A8BA828DF
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 12:58:45 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id e23so5243869lfj.9
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 05:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zONzmpI+xXnnWg+/3kId1fVR4VUdAPeVktXjULtiG6Y=;
 b=Q5xn6ffuwVLsysyyJJ/sekIQHoFtaG4F2SGLSTrhz7HDXetrSBZRyuDeWrUQmCflxi
 EKwIt7p2u35/pmIls9VCOcx/j7XCy4ub8yq4VM+4TCDmpjxclu0ijPRlcWXWbeDk3w3J
 NaVmsvsPnnaVLDQ/u98ZCY0b9YTrFKYnwCInuMRaGeRJt1K5maSAcVDQ+77vQ86G7oqw
 R+Pd4pqHs7CETPA0291qN8K2uAsYfOuffor5NL+jZBNZF59NLbN89Lpitf85+gouA0GA
 mh8XlTtq4I3bLiHLmywekAYp6RT3eFZan2exiMajQ4ozX6x8h0EkVc+sKzd1akQXSCM2
 tN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zONzmpI+xXnnWg+/3kId1fVR4VUdAPeVktXjULtiG6Y=;
 b=hyxmQJbv/u+b7TynIzOalXHUDYxVdq7/DetgXR5MLt1reLTEgBNTR2ymOYw/TSd/Wc
 H+iJ5W1DmjsH3lAbQEjO4DScYf4nan0jZQyfx1C1iwpAr/gZmI0c+9HbE0hG6nKPZXuM
 wI64baliovwjP/LSi18o2PSYcU2lHOLpIlhZMdG/oibENEAq4WLH7s6W6V7B+JriJ4mf
 pKAAp79WRpsHA4EQ+k9Xs0BAl3CY0fC5GFPaR6HxWzEWZcvzkvL/EpMLXoyRybQBLJHt
 GZoS5QoOOmHOwSyNcVnQs2p3yNQ0V0Vk6WXri12t38b9PH3xfyEWqQL6JyrVTH9JKxqQ
 dq6g==
X-Gm-Message-State: AOAM5314+ZM9dw0qJEhJvIBc8aWguQhmRn6WKhDE8lrZpohp/x4V7RH8
 Lefjrdhsq6dzaA3qddR3W95WhS4HkpdEHRvK
X-Google-Smtp-Source: ABdhPJxZ/EGAHjWM/O07KJ9Mu//7/tvp3VBpKEuenxODLwJWbD605e28uYHtm3/+iMg1+WoV5UBN7A==
X-Received: by 2002:a05:6512:398c:: with SMTP id
 j12mr12305930lfu.102.1631019522730; 
 Tue, 07 Sep 2021 05:58:42 -0700 (PDT)
Received: from Unikie-T14-Gen-2i.madriguera.foxhound.fi
 (88-113-104-240.elisa-laajakaista.fi. [88.113.104.240])
 by smtp.googlemail.com with ESMTPSA id o18sm1007826lfg.109.2021.09.07.05.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 05:58:42 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@buildroot.org
Date: Tue,  7 Sep 2021 15:58:41 +0300
Message-Id: <20210907125841.509792-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/policycoreutils: Add service to handle
 selinux autorelabel
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

VGhpcyBwYXRjaCBhZGRzIGEgc3lzdGVtIHNlcnZpY2UgdG8gY2hlY2sgd2hldGhlciB0aGUKYXV0
b3JlbGFiZWwgdmlhIGlzIHJlcXVlc3RlZCBvciBub3QsIGFuZCBwcm9kdWNlIHRoZQpsYWJlbGlu
ZyBvZiB0aGUgc3lzdGVtIHVuZGVyIHRoZSBsb2FkZWQgZmluYWwga2VybmVsLAppbmNsdWRpbmcg
YXV0b21hdGljYWxseSBwb3B1bGF0ZWQgZnMgYnkgdGhlIGtlcm5lbC4KClNpZ25lZC1vZmYtYnk6
IEpvc8OpIFBla2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPgotLS0KIC4uLi9w
b2xpY3ljb3JldXRpbHMvUzAwc2VsaW51eC1hdXRvcmVsYWJlbCAgICB8IDQ5ICsrKysrKysrKysr
KysrKysrKysKIHBhY2thZ2UvcG9saWN5Y29yZXV0aWxzL3BvbGljeWNvcmV1dGlscy5tayAgICB8
ICA1ICsrCiAyIGZpbGVzIGNoYW5nZWQsIDU0IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL3BvbGljeWNvcmV1dGlscy9TMDBzZWxpbnV4LWF1dG9yZWxhYmVsCgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9wb2xpY3ljb3JldXRpbHMvUzAwc2VsaW51eC1hdXRvcmVsYWJlbCBi
L3BhY2thZ2UvcG9saWN5Y29yZXV0aWxzL1MwMHNlbGludXgtYXV0b3JlbGFiZWwKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uN2E0N2RiODkxZgotLS0gL2Rldi9udWxsCisr
KyBiL3BhY2thZ2UvcG9saWN5Y29yZXV0aWxzL1MwMHNlbGludXgtYXV0b3JlbGFiZWwKQEAgLTAs
MCArMSw0OSBAQAorIyEvYmluL3NoCisKK0RBRU1PTj0iQXV0b3JlbGFiZWwgY2hlY2siCisKK3N0
YXJ0KCkgeworICAgIHByaW50ZiAnU3RhcnRpbmcgJXM6ICcgIiREQUVNT04iCisKKyAgICBpZiBb
IC1mIC8uYXV0b3JlbGFiZWwgXTsgdGhlbgorICAgICAgICBlY2hvICJSZWxhYmVsaW5nIgorICAg
ICAgICBlY2hvICIqKiogV2FybmluZyAtLSBTRUxpbnV4ICR7U0VMSU5VWFRZUEV9IHBvbGljeSBy
ZWxhYmVsIGlzIHJlcXVpcmVkLiIKKyAgICAgICAgZWNobyAiKioqIFJlbGFiZWxpbmcgY291bGQg
dGFrZSBhIHZlcnkgbG9uZyB0aW1lLCBkZXBlbmRpbmcgb24gZmlsZSIKKyAgICAgICAgZWNobyAi
KioqIHN5c3RlbSBzaXplIGFuZCBzcGVlZCBvZiBoYXJkIGRyaXZlcy4iCisgICAgICAgIG1vdW50
IC1hCisgICAgICAgIHNldGZpbGVzIC1tIC1yIC8KKworICAgICAgICAjIFJlbW92ZSBsYWJlbAor
ICAgICAgICBybSAtZiAgLy5hdXRvcmVsYWJlbCB8fCBmYWlsZWQgIkZhaWxlZCB0byByZW1vdmUg
dGhlIGF1dG9yZWxhYmVsIGZsYWciCisKKyAgICAgICAgIyBSZWJvb3QgdG8gYWN0aXZhdGUgcmVs
YWJlbGVkIGZpbGUgc3lzdGVtCisgICAgICAgIGVjaG8gIkF1dG9tYXRpYyByZWJvb3QgaW4gcHJv
Z3Jlc3MuIgorICAgICAgICByZWJvb3QgLWYKKyAgICBmaQorCisgICAgZWNobyAiT0siCisgICAg
cmV0dXJuIDAKK30KKworc3RvcCgpIHsKKyAgICBwcmludGYgJ1N0b3BwaW5nICVzOiAnICIkREFF
TU9OIgorICAgIGVjaG8gIk9LIgorICAgIHJldHVybiAwCit9CisKK3Jlc3RhcnQoKSB7CisJc3Rv
cAorCXNsZWVwIDEKKwlzdGFydAorfQorCitjYXNlICIkMSIgaW4KKwlzdGFydHxzdG9wfHJlc3Rh
cnQpCisJCSIkMSI7OworCXJlbG9hZCkKKwkJIyBSZXN0YXJ0LCBzaW5jZSB0aGVyZSBpcyBubyB0
cnVlICJyZWxvYWQiIGZlYXR1cmUuCisJCXJlc3RhcnQ7OworCSopCisJCWVjaG8gIlVzYWdlOiAk
MCB7c3RhcnR8c3RvcHxyZXN0YXJ0fHJlbG9hZH0iCisJCWV4aXQgMQorZXNhYwpkaWZmIC0tZ2l0
IGEvcGFja2FnZS9wb2xpY3ljb3JldXRpbHMvcG9saWN5Y29yZXV0aWxzLm1rIGIvcGFja2FnZS9w
b2xpY3ljb3JldXRpbHMvcG9saWN5Y29yZXV0aWxzLm1rCmluZGV4IDUyOTBjNWI5ZjguLmY2OTg2
OTgwNTkgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcG9saWN5Y29yZXV0aWxzL3BvbGljeWNvcmV1dGls
cy5taworKysgYi9wYWNrYWdlL3BvbGljeWNvcmV1dGlscy9wb2xpY3ljb3JldXRpbHMubWsKQEAg
LTkzLDUgKzkzLDEwIEBAIGRlZmluZSBIT1NUX1BPTElDWUNPUkVVVElMU19JTlNUQUxMX0NNRFMK
IAkpCiBlbmRlZgogCitkZWZpbmUgUE9MSUNZQ09SRVVUSUxTX0lOU1RBTExfSU5JVF9TWVNWCisJ
JChJTlNUQUxMKSAtbSAwNzU1IC1EIHBhY2thZ2UvcG9saWN5Y29yZXV0aWxzL1MwMHNlbGludXgt
YXV0b3JlbGFiZWwgXAorCQkkKFRBUkdFVF9ESVIpL2V0Yy9pbml0LmQvUzAwc2VsaW51eC1hdXRv
cmVsYWJlbAorZW5kZWYKKwogJChldmFsICQoZ2VuZXJpYy1wYWNrYWdlKSkKICQoZXZhbCAkKGhv
c3QtZ2VuZXJpYy1wYWNrYWdlKSkKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
bGlzdHMuYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
