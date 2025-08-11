Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58F8C87FD2
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 11:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85DF141185;
	Mon, 11 Aug 2025 11:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Es5X-vKGJkrz; Mon, 11 Aug 2025 11:57:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 731A141221
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 731A141221;
	Mon, 11 Aug 2025 11:57:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 46373154
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 11:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37F2241221
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 11:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gM_qFPboB_sx for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 11:57:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A8BBE41185
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8BBE41185
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8BBE41185
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 11:57:41 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 324440580
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 11 Aug 2025 11:57:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ulR9m-008GfR-2I
 for buildroot@buildroot.org; Mon, 11 Aug 2025 13:57:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Aug 2025 13:57:38 +0200
Message-ID: <87tt2em5ot.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=FneUeAauwt2OoM9wv5z53sVA388UqPHHnq1sgVUI7wDBTCD0INeKdwFNuWnpNBnke9gi2Pf6448pJZXhap3wvpoGy/DiwdOTKlbaROXrX3saC+vFuaS4CbZCgfL6QODOUqJLZw91HAgeTulSGvCLKULq921qPoo978+3IkE/K0xAz3T1U9ud4nnbgaXazzvKkqQ6mgWoYTZF6RZE/xuuxCTl7SXGCTFgyhPMKBwAgbnTHp35A1GMNRchEZq8yyZvBineMWWRRFpUWJkjNjCE2dOae32Eur1SFxCk0J/LT/js2G7DPX7eznZpbhkQbKGrQcofDD5QUJef07/XRA9bWg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=N7FdzIUD1UQnmXs3c+snwzy+uiStn7+ZAjVi1ruM2Hk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=FneUeAau
Subject: [Buildroot] Buildroot 2025.08-rc1 released
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpCdWlsZHJvb3QgMjAyNS4wOC1yYzEgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBh
dDoKCmh0dHBzOi8vYnVpbGRyb290Lm5ldC9kb3dubG9hZHMvYnVpbGRyb290LTIwMjUuMDgtcmMx
LnRhci5negoKb3IKCmh0dHBzOi8vYnVpbGRyb290Lm5ldC9kb3dubG9hZHMvYnVpbGRyb290LTIw
MjUuMDgtcmMxLnRhci54egoKT3IgZ2V0IGl0IGZyb20gR2l0OgoKaHR0cHM6Ly9naXRsYWIuY29t
L2J1aWxkcm9vdC5vcmcvYnVpbGRyb290LmdpdCAoMjAyNS4wOC1yYzEgdGFnKQoKUGxlYXNlIGdp
dmUgaXQgYSBzcGluIGFuZCByZXBvcnQgYW55IHByb2JsZW1zIHRvIHRoZSBtYWlsaW5nIGxpc3Qg
b3IKYnVnIHRyYWNrZXIuCgpBZ2FpbiBhIHNvbWV3aGF0IHNtYWxsZXIgY3ljbGUgd2l0aCB3aXRo
IGEgYml0IG1vcmUgdGhhbiA3MDAgY2hhbmdlcwpmcm9tIDgyIHVuaXF1ZSBjb250cmlidXRvcnMh
CgpPZiBub3Rld29ydGh5IG5ldyBmZWF0dXJlcy9jaGFuZ2VzIHdlIGhhdmU6CgpOZXcgZGVmY29u
ZmlnczogQmVhZ2xlWS1BSSwgQ29vbFBJIDRCLCBGcmVlc2NhbGUgaS5NWDkxIGZyZWVkb20sCkxv
b25nQXJjaDY0IEVGSSwgUUVNVSBMb29uZ0FyY2g2NCBWaXJ0LCBSYXNwYmVycnlwaSBDb21wdXRl
IE1vZHVsZSA1IEkvTwoKTmV3IHBhY2thZ2VzOiBjb250YWluZXJzLWltYWdlLWNvbmZpZywgZGlz
dHJpYnV0aW9uLXJlZ2lzdHJ5LApsbHZtLXJ1bnRpbWVzLCBsdWEtbHJleGxpYi1wY3JlMiwgbXNn
cGFjay1jLCBvcGVuY2wtaGVhZGVycywKb3BlbmNsLWljZC1sb2FkZXIsIHBvY2tldHB5LCBweXRo
b24tYXBzY2hlZHVsZXIsIHB5dGhvbi1jcmMsCnB5dGhvbi1sb2ctcmF0ZS1saW1pdCwgcHl0aG9u
LXNkYnVzLW1vZGVtbWFuYWdlciwgc29hcHktc2RyLCB2dWxrYW4tc2RrCgpBbmQgdGhlIHVzdWFs
IHBhY2thZ2UgdmVyc2lvbiB1cGRhdGVzIGFuZCBidWcgZml4ZXMuIFNlZSB0aGUgQ0hBTkdFUwpm
aWxlIGZvciBkZXRhaWxzOgoKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRy
b290Ly0vYmxvYi8yMDI1LjA4LXJjMS9DSEFOR0VTCgpNYW55IHRoYW5rcyB0byB0aGUgcGVvcGxl
IGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hvcnRsb2cgLXMgLW4gMjAyNS4w
NS4uCgogICAxNDQJQmVybmQgS3VobHMKICAgIDQ4CVRob21hcyBQZXJhbGUKICAgIDQ0CU5lYWwg
RnJhZ2VyCiAgICAzNQlHaXVsaW8gQmVuZXR0aQogICAgMzIJTWFyY3VzIEhvZmZtYW5uCiAgICAy
OQlZYW5uIEUuIE1PUklOCiAgICAyOAlUaXRvdWFuIENocmlzdG9waGUKICAgIDI3CUp1bGllbiBP
bGl2YWluCiAgICAyNQlLYWRhbWJpbmkgTmVtYQogICAgMjQJSmFtZXMgSGlsbGlhcmQKICAgIDI0
CVBldGVyIEtvcnNnYWFyZAogICAgMTYJVGhvbWFzIFBldGF6em9uaQogICAgMTUJRGFyaW8gQmlu
YWNjaGkKICAgIDE0CUppYXh1biBZYW5nCiAgICAxMwlFbCBNZWhkaSBZT1VORVMKICAgIDEzCUZp
b25hIEtsdXRlIChXSVdBKQogICAgMTEJRmxvcmlhbiBMYXJ5c2NoCiAgICAxMAlSYXBoYcOrbCBN
w6lsb3R0ZQogICAgMTAJWWVnb3IgWWVmcmVtb3YKICAgICA4CUZyYW5jb2lzIFBlcnJhZAogICAg
IDgJUGV0ZXIgU2VpZGVyZXIKICAgICA3CU1hcmNpbiBOaWVzdHJvagogICAgIDcJVGltIFNvdWJy
eQogICAgIDYJQWRyaWFuIFBlcmV6IGRlIENhc3RybwogICAgIDYJR3dlbmhhZWwgR29hdmVjLU1l
cm91CiAgICAgNglTY290dCBGYW4KICAgICA0CUFsZXggQmVubsOpZQogICAgIDQJRmFiaWVuIExl
aG91c3NlbAogICAgIDQJRmlvbmEgS2x1dGUKICAgICA0CUhlaWtvIFRoaWVyeQogICAgIDQJTWF4
aW1lIENoZXZhbGxpZXIKICAgICA0CVBldHIgVm9yZWwKICAgICA0CVJvbWFpbiBOYW91cgogICAg
IDQJVmluY2VudCBTdGVobMOpCiAgICAgMwlBZGFtIER1c2tldHQKICAgICAzCUFuZ2VsbyBDb21w
YWdudWNjaQogICAgIDMJRWRnYXIgQm9uZXQKICAgICAzCUZsw6F2aW8gVGFwYWrDs3MKICAgICAz
CUphbWVzIEtuaWdodAogICAgIDMJSmVzc2UgVGF1YmUKICAgICAzCU1heGltZSBMZXJveQogICAg
IDMJTWljaGFlbCBOb3N0aG9mZgogICAgIDMJVGhvbWFzIENsYXZlaXJvbGUKICAgICAzCVRob21h
cyBEZXZvb2dkdAogICAgIDIJQW5kcmVhcyBaaWVnbGVyCiAgICAgMglBcm5vdXQgVmFuZGVjYXBw
ZWxsZQogICAgIDIJQmVub8OudCBNb25pbgogICAgIDIJRmVkZXJpY28gUGVsbGVncmluCiAgICAg
MglNaWNoYWVsIEZpc2NoZXIKICAgICAyCU5hdGhhbmllbCBSb2FjaAogICAgIDIJUXVlbnRpbiBT
Y2h1bHoKICAgICAyCVRob21hcyBCb25uZWZpbGxlCiAgICAgMQlBYXJvbiBTaWVycmEKICAgICAx
CUFsZXhpcyBMb3Rob3LDqQogICAgIDEJQW1lciBBbHNoYW5hd2FueQogICAgIDEJQW5keSBZYW4K
ICAgICAxCUJhZ2FzIFNhbmpheWEKICAgICAxCUJhcnVjaCBTaWFjaAogICAgIDEJQnJhbSBPb3N0
ZXJodWlzCiAgICAgMQlCcmFuZG9uIE1haWVyCiAgICAgMQlDb2xpbiBGb3N0ZXIKICAgICAxCURh
bmllbCBMYW5nCiAgICAgMQlGbG9yaWFuIEZhaW5lbGxpCiAgICAgMQlGcmVkIExlZnJhbmMKICAg
ICAxCUdhw6tsIFBPUlRBWQogICAgIDEJR2VybyBTY2h3w6RyaWNrZQogICAgIDEJSm9zZXBoIEtv
Z3V0CiAgICAgMQlKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8KICAgICAxCUp1YW4gUGFibG8gTW9u
dGVybyBDYXN0cm8KICAgICAxCUthbmFrIFNoaWxsZWRhcgogICAgIDEJTGFuY2UgRnJlZHJpY2tz
b24KICAgICAxCU1hcmt1cyBNYXllcgogICAgIDEJTWFydGluIEVsc2h1YmVyCiAgICAgMQlNYXR0
IFNpbHZhCiAgICAgMQlNaWNoYWVsIFRyaW1hcmNoaQogICAgIDEJU2Vyb3NoIERlbGphbQogICAg
IDEJU3RlZmFuIE5pY2tsCiAgICAgMQlTdGVwaGFuIEhlbm5pbmdzZW4KICAgICAxCVRob21hcyBI
dXRoCiAgICAgMQlUb3JiZW4gVm9sdG1lcgogICAgIDEJVmxhZGltaXIgS29uZHJhdGlldgogICAg
IDEJV2FsZGVtYXIgQnJvZGtvcmIKCkFuZCBhIHNwZWNpYWwgdGhhbmtzIHRvIG91ciBwYXRjaCBy
ZXZpZXdlcnM6CgpnaXQgbG9nIC0tbm8tbWVyZ2VzIC0tZ3JlcCAnKFJldmlld2VkfEFja2VkKS1i
eTonIC1FIC1pIFwKICAtLWZvcm1hdD0iJSh0cmFpbGVyczp2YWx1ZW9ubHk9dHJ1ZSxrZXk9UmV2
aWV3ZWQtYnksa2V5PUFja2VkLWJ5KSUtQygpIiBcCiAgMjAyNS4wNS4uIHwgc29ydCB8IHVuaXEg
LWMgfCBzb3J0IC1ucgoKICAgICAxNCBMdWNhIENlcmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJvb3Rs
aW4uY29tPgogICAgIDExIFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgogICAg
ICA3IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+CiAgICAg
IDMgTWF4aW0gS29jaGV0a292IDxmaWRvX21heEBpbmJveC5ydT4KICAgICAgMyBCcnlhbiBCcmF0
dGxvZiA8YmJAdGkuY29tPgogICAgICAyIE1hcmN1cyBIb2ZmbWFubiA8YnVpbGRyb290QGJ1YnUx
LmV1PgogICAgICAyIEpvYWNoaW0gV2liZXJnIDx0cm9nbG9iaXRAZ21haWwuY29tPgogICAgICAy
IEppYXh1biBZYW5nIDxqaWF4dW4ueWFuZ0BmbHlnb2F0LmNvbT4KICAgICAgMiBHaXVsaW8gQmVu
ZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KICAgICAgMSBZYW5u
IEUuIE1PUklOIDx5YW5uLm1vcmluQG9yYW5nZS5jb20+CiAgICAgIDEgVGhvbWFzIEh1dGggPGh1
dGhAdHV4ZmFtaWx5Lm9yZz4KICAgICAgMSBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFp
bC5jb20+CiAgICAgIDEgUGV0ciBWb3JlbCA8cGV0ci52b3JlbEBnbWFpbC5jb20+CiAgICAgIDEg
TGF1cmVudCBWaXZpZXIgPGxhdXJlbnRAdml2aWVyLmV1PgogICAgICAxIEp1bGllbiBPbGl2YWlu
IDxqdS5vQGZyZWUuZnI+CiAgICAgIDEgSi4gTmV1c2Now6RmZXIgPGoubmVAcG9zdGVvLm5ldD4K
ICAgICAgMSBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4KICAgICAgMSBH
aXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAbWljcm9ub3Zhc3JsLmNvbT4KICAgICAgMSBF
bCBNZWhkaSBZT1VORVMgPGVsbWVoZGkueW91bmVzQHNtaWxlLmZyPgogICAgICAxIEJvZXJnZSBT
dHJ1ZW1wZmVsIDxib2VyZ2Uuc3RydWVtcGZlbEBnbWFpbC5jb20+CiAgICAgIDEgQmFydWNoIFNp
YWNoIDxiYXJ1Y2hAdGtvcy5jby5pbD4KCldlIHdpbGwgbm93IGNyZWF0ZSBhIG5leHQgYnJhbmNo
IGFuZCBzdGFydCBtZXJnaW5nIG5ldyBmZWF0dXJlcyBmb3IKMjAyNS4xMSBhbHJlYWR5IGluIHBh
cmFsbGVsIHdpdGggdGhlIDIwMjUuMDggc3RhYmlsaXphdGlvbi4KCkV4cGVjdCB0aGUgZmluYWwg
MjAyNS4wOCByZWxlYXNlIGFyb3VuZCB0aGUgZW5kIG9mIHRoZSBtb250aCAvIGJlZ2lubmluZwpv
ZiBTZXB0ZW1iZXIuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
