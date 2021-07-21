Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36FB1C07E9B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 06:45:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E324661001
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 06:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E324661001
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB67A83104;
	Wed, 21 Jul 2021 06:45:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QA-uS-Gc-S2e; Wed, 21 Jul 2021 06:45:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E940A830E3;
	Wed, 21 Jul 2021 06:45:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6886C1BF5A5
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 06:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57C06402CB
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 06:45:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qWHZG2AUsDZF for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 06:45:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E0B5401F3
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 06:45:28 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id l7so918887wrv.7
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 23:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fxekd+MIa8ARbvLAD2Ajos2QpON6WERB44ySUZ/ofkY=;
 b=m3h8nRenMtSdZEAaz82YWbvbDeXYJfE/n0iS8hQbSjWpPqRG2ilH2A7PxkxrvIAMDW
 1kIMnshndar/m5rQX75hnzsXvDg3RCFcreNb/NP3tCCFedY4hwFCMfKI56hEuzcmFs4N
 UnhcWydgYaG1xOpgKUiXoJEhyB+P0ISyheJEvsgnAALuh8uZKcIOv8B6fFKVxlotVl82
 tdfKGuwoiulPx8SVDS2Oj36lfrqSIybIozkhMF9HKH//pRyDC07CJxwuoiLNSfDr3q1Z
 tZz7dLbvbq0hSaL37BKwcFUnK1JcHpzQdtEfW3wG1Db6gMVN2UZY9bCf0RbRUh1m1iqd
 OtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fxekd+MIa8ARbvLAD2Ajos2QpON6WERB44ySUZ/ofkY=;
 b=tXoeVz4Jf7CrVxUu8u6oGhesxYSr0q4jRspZNw7U0nQGLtnlL0ufiyUDiN/0EPdJsO
 cXmJKreutsxhLny6sefhoLMunPAjcm5V2YxMGwhr53xyQXttubGBnkBP6kpkCN/CZuLS
 Ho2+BC0QqS9ELZIr0kEa1dsaY8lVSY/yzkvuX0v+V9ZwA79IEZCs2PJVEvQ/82oMqisj
 OsCst4LjBcPeRl/jvLLd97l19AjgpmJYmALRWvwFedVt0goDZOoTPYev8E0cPStP6Nol
 xd0/Wy/P5ApYv/5KoOccIUoIHiIZ9DAXppfdK/oc6xGC9n2dqyxi5uy0wzZzdia9Hkbe
 8n+w==
X-Gm-Message-State: AOAM531IifpIOE40XDk6MEzF+iwSaCGr4gCW/oAgPGCo3Ji6p7fgF7E5
 7KWq8prPFJM/jQ6qL+buZNCaJZSjzWXPIg==
X-Google-Smtp-Source: ABdhPJyuut0mz7RQHV+75MFCkTZgT6840W6gPwpnjqZXlATxL35KYT6no92duSUSJE6FwVFUKIzo8A==
X-Received: by 2002:adf:a287:: with SMTP id s7mr40099434wra.120.1626849926105; 
 Tue, 20 Jul 2021 23:45:26 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id k24sm26938371wrh.30.2021.07.20.23.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 23:45:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 08:45:14 +0200
Message-Id: <20210721064514.440851-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210721064514.440851-1-fontaine.fabrice@gmail.com>
References: <20210721064514.440851-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/bird: bump to version 2.0.8
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: =?UTF-8?q?Adrien=20Gallou=C3=ABt?= <adrien@gallouet.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

LSBEcm9wIHBhdGNoZXMgKGFscmVhZHkgaW4gdmVyc2lvbikKLSBVcGRhdGUgaW5kZW50YXRpb24g
aW4gaGFzaCBmaWxlICh0d28gc3BhY2VzKQoKaHR0cHM6Ly9naXRsYWIubmljLmN6L2xhYnMvYmly
ZC8tL2Jsb2IvdjIuMC44L05FV1MKClNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZv
bnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgotLS0KIC4uLjAwMS1OZXN0LUZpeC1idWlsZC13aXRo
b3V0LXByb3RvY29scy5wYXRjaCB8IDI4IC0tLS0tLS0tLS0tLS0tLQogcGFja2FnZS9iaXJkLzAw
MDItQWRkZWQtbWlzc2luZy1leHRlcm4ucGF0Y2ggIHwgMzQgLS0tLS0tLS0tLS0tLS0tLS0tLQog
cGFja2FnZS9iaXJkL2JpcmQuaGFzaCAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tCiBw
YWNrYWdlL2JpcmQvYmlyZC5tayAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogNCBm
aWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDY1IGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvYmlyZC8wMDAxLU5lc3QtRml4LWJ1aWxkLXdpdGhvdXQtcHJvdG9j
b2xzLnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9iaXJkLzAwMDItQWRkZWQtbWlz
c2luZy1leHRlcm4ucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2JpcmQvMDAwMS1OZXN0LUZp
eC1idWlsZC13aXRob3V0LXByb3RvY29scy5wYXRjaCBiL3BhY2thZ2UvYmlyZC8wMDAxLU5lc3Qt
Rml4LWJ1aWxkLXdpdGhvdXQtcHJvdG9jb2xzLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCA0OGQyMTQ0MWNhLi4wMDAwMDAwMDAwCi0tLSBhL3BhY2thZ2UvYmlyZC8wMDAxLU5l
c3QtRml4LWJ1aWxkLXdpdGhvdXQtcHJvdG9jb2xzLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEs
MjggKzAsMCBAQAotRnJvbSBmOWViOWI0Y2FiNjViODUwYzYxNzM4ZGQ1NjYzMmJhZTBlNzMyOWNh
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogRmFicmljZSBGb250YWluZSA8Zm9udGFp
bmUuZmFicmljZUBnbWFpbC5jb20+Ci1EYXRlOiBTYXQsIDE5IE9jdCAyMDE5IDEyOjUwOjI3ICsw
MjAwCi1TdWJqZWN0OiBbUEFUQ0hdIE5lc3Q6IEZpeCBidWlsZCB3aXRob3V0IHByb3RvY29scwot
Ci0oQ0hFQ0sga2V5d29yZCBhZGRlZCBieSBjb21taXRlcikKLVtSZXRyaWV2ZWQgZnJvbToKLWh0
dHBzOi8vZ2l0bGFiLmxhYnMubmljLmN6L2xhYnMvYmlyZC9jb21taXQvZjllYjliNGNhYjY1Yjg1
MGM2MTczOGRkNTY2MzJiYWUwZTczMjljYV0KLVNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFp
bmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgotLS0tCi0gbmVzdC9jb25maWcuWSB8IDEg
KwotIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQotCi1kaWZmIC0tZ2l0IGEvbmVzdC9j
b25maWcuWSBiL25lc3QvY29uZmlnLlkKLWluZGV4IGM2MjUwMWEzLi4xYmMyMDNkZCAxMDA2NDQK
LS0tLSBhL25lc3QvY29uZmlnLlkKLSsrKyBiL25lc3QvY29uZmlnLlkKLUBAIC03NSw2ICs3NSw3
IEBAIENGX0tFWVdPUkRTKEJHUCwgUEFTU1dPUkRTLCBERVNDUklQVElPTiwgU09SVEVEKQotIENG
X0tFWVdPUkRTKFJFTE9BRCwgSU4sIE9VVCwgTVJURFVNUCwgTUVTU0FHRVMsIFJFU1RSSUNULCBN
RU1PUlksIElHUF9NRVRSSUMsIENMQVNTLCBEU0NQKQotIENGX0tFWVdPUkRTKFRJTUVGT1JNQVQs
IElTTywgU0hPUlQsIExPTkcsIFJPVVRFLCBQUk9UT0NPTCwgQkFTRSwgTE9HLCBTLCBNUywgVVMp
Ci0gQ0ZfS0VZV09SRFMoR1JBQ0VGVUwsIFJFU1RBUlQsIFdBSVQsIE1BWCwgRkxVU0gsIEFTKQot
K0NGX0tFWVdPUkRTKENIRUNLLCBMSU5LKQotIAotIC8qIEZvciByX2FyZ3NfY2hhbm5lbCAqLwot
IENGX0tFWVdPUkRTKElQVjQsIElQVjRfTUMsIElQVjRfTVBMUywgSVBWNiwgSVBWNl9NQywgSVBW
Nl9NUExTLCBJUFY2X1NBRFIsIFZQTjQsIFZQTjRfTUMsIFZQTjRfTVBMUywgVlBONiwgVlBONl9N
QywgVlBONl9NUExTLCBST0E0LCBST0E2LCBGTE9XNCwgRkxPVzYsIE1QTFMsIFBSSSwgU0VDKQot
LS0gCi0yLjIxLjAKLQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9iaXJkLzAwMDItQWRkZWQtbWlzc2lu
Zy1leHRlcm4ucGF0Y2ggYi9wYWNrYWdlL2JpcmQvMDAwMi1BZGRlZC1taXNzaW5nLWV4dGVybi5w
YXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDBhYWIzZTkyYi4uMDAwMDAwMDAw
MAotLS0gYS9wYWNrYWdlL2JpcmQvMDAwMi1BZGRlZC1taXNzaW5nLWV4dGVybi5wYXRjaAorKysg
L2Rldi9udWxsCkBAIC0xLDM0ICswLDAgQEAKLUZyb20gNGJiYzEwNjE0ZjM0MzFjMzdlNjM1MmY1
YTZlYTVjNjkzYzMxMDIxZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IE1hcmlhIE1h
dGVqa2EgPG1xQHVjdy5jej4KLURhdGU6IFR1ZSwgNCBGZWIgMjAyMCAxMDoxMToxNiArMDEwMAot
U3ViamVjdDogW1BBVENIXSBBZGRlZCBtaXNzaW5nIGV4dGVybgotTUlNRS1WZXJzaW9uOiAxLjAK
LUNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAotQ29udGVudC1UcmFuc2Zl
ci1FbmNvZGluZzogOGJpdAotCi1UaGFua3MgdG8gUm9iZXJ0IFNjaGVjayA8YmlyZEByb2JlcnQt
c2NoZWNrLmRlPiB3aG8gcmVwb3J0ZWQgaXQKLWFuZCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4g
PHRva2VAdG9rZS5kaz4gd2hvIHN1Z2dlc3RlZCB0aGlzIHBhdGNoLgotCi1bUmV0cmlldmVkIGZy
b206Ci1odHRwczovL2dpdGxhYi5uaWMuY3ovbGFicy9iaXJkLy0vY29tbWl0LzRiYmMxMDYxNGYz
NDMxYzM3ZTYzNTJmNWE2ZWE1YzY5M2MzMTAyMWVdCi1TaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZv
bnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KLS0tLQotIG5lc3Qvcm91dGUuaCB8
IDIgKy0KLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKLQot
ZGlmZiAtLWdpdCBhL25lc3Qvcm91dGUuaCBiL25lc3Qvcm91dGUuaAotaW5kZXggZDJhMDdmMDku
LmI5MjdkYjVmIDEwMDY0NAotLS0tIGEvbmVzdC9yb3V0ZS5oCi0rKysgYi9uZXN0L3JvdXRlLmgK
LUBAIC00NTgsNyArNDU4LDcgQEAgdHlwZWRlZiBzdHJ1Y3QgcnRhIHsKLSAJCQkJCSAgIHByb3Rv
Y29sLXNwZWNpZmljIG1ldHJpYyBpcyBhdmFpbGFiZSAqLwotIAotIAotLWNvbnN0IGNoYXIgKiBy
dGFfZGVzdF9uYW1lc1tSVERfTUFYXTsKLStleHRlcm4gY29uc3QgY2hhciAqIHJ0YV9kZXN0X25h
bWVzW1JURF9NQVhdOwotIAotIHN0YXRpYyBpbmxpbmUgY29uc3QgY2hhciAqcnRhX2Rlc3RfbmFt
ZSh1aW50IG4pCi0geyByZXR1cm4gKG4gPCBSVERfTUFYKSA/IHJ0YV9kZXN0X25hbWVzW25dIDog
Ij8/PyI7IH0KLS0tIAotMi4yNi4yCi0KZGlmZiAtLWdpdCBhL3BhY2thZ2UvYmlyZC9iaXJkLmhh
c2ggYi9wYWNrYWdlL2JpcmQvYmlyZC5oYXNoCmluZGV4IDMwM2ZjMjEyMDUuLjJkMjA0OTFkZDYg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvYmlyZC9iaXJkLmhhc2gKKysrIGIvcGFja2FnZS9iaXJkL2Jp
cmQuaGFzaApAQCAtMSwyICsxLDIgQEAKLXNoYTI1NiA2MzFkMmI1OGFlYmRiZDY1MWFhYTNjNjhj
Mzc1NmMwMmViZmU1YjFlNjBkMzA3NzcxZWE5MDllZWFhNWIxMDY2ICBiaXJkLTIuMC43LnRhci5n
egotc2hhMjU2IDk0YzUzYzg0MzIwMDc4OTIwYWMxZjBkNDljODFhNGU5MDA0NTEyZjUzNDUyMWE1
OGJkZjE0NWFjYmNiYzJjZDIgIFJFQURNRQorc2hhMjU2ICAxOWQyZGU4M2VlMjVhMzA3YjllNWI5
ZTU4Nzk3ZGQ2ODc2NmQ0MzliY2VlMzNlM2FjNjE3ZWQ1MDIzNzBlN2Y2ICBiaXJkLTIuMC44LnRh
ci5negorc2hhMjU2ICA5NGM1M2M4NDMyMDA3ODkyMGFjMWYwZDQ5YzgxYTRlOTAwNDUxMmY1MzQ1
MjFhNThiZGYxNDVhY2JjYmMyY2QyICBSRUFETUUKZGlmZiAtLWdpdCBhL3BhY2thZ2UvYmlyZC9i
aXJkLm1rIGIvcGFja2FnZS9iaXJkL2JpcmQubWsKaW5kZXggNGQ2MTU5YjA3NS4uYThiOWIxOGI1
MCAxMDA2NDQKLS0tIGEvcGFja2FnZS9iaXJkL2JpcmQubWsKKysrIGIvcGFja2FnZS9iaXJkL2Jp
cmQubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1CSVJE
X1ZFUlNJT04gPSAyLjAuNworQklSRF9WRVJTSU9OID0gMi4wLjgKIEJJUkRfU0lURSA9IGZ0cDov
L2JpcmQubmV0d29yay5jei9wdWIvYmlyZAogQklSRF9MSUNFTlNFID0gR1BMLTIuMCsKIEJJUkRf
TElDRU5TRV9GSUxFUyA9IFJFQURNRQotLSAKMi4zMC4yCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
