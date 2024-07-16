Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EF1C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 15:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E45AE60A8A;
	Tue, 16 Jul 2024 15:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qvgdfCb6O5hr; Tue, 16 Jul 2024 15:07:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A02260A7F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A02260A7F;
	Tue, 16 Jul 2024 15:07:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B73A31BF487
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 15:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA10A4055E
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 15:07:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EQSdFrNVtd1K for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 15:07:21 +0000 (UTC)
X-Greylist: delayed 552 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 16 Jul 2024 15:07:20 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C13DD400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C13DD400D6
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=162.248.234.2;
 helo=mail.xes-mad.com; envelope-from=vfazio@gmail.com; receiver=<UNKNOWN> 
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C13DD400D6
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 15:07:20 +0000 (UTC)
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
 by mail.xes-mad.com (Postfix) with ESMTP id 9D94E201A6;
 Tue, 16 Jul 2024 09:58:07 -0500 (CDT)
From: Vincent Fazio <vfazio@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 09:58:02 -0500
Message-Id: <20240716145802.554307-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=gmail.com
Subject: [Buildroot] [PATCH 1/1] package/python3: use depth first search for
 directory removal
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UHJldmlvdXNseSwgUHl0aG9uIGJ1aWxkcyBjb3VsZCBpbnRlcm1pdHRlbnRseSBmYWlsIHdoZW4g
cmVtb3ZpbmcgZmlsZXMKaWYgYGZpbmRgIHJlbW92ZWQgYSBkaXJlY3RvcnkgYmVmb3JlIHNlYXJj
aGluZyB3aXRoaW4gaXQgWzBdLgoKQW4gYXJiaXRyYXJ5IGV4YW1wbGU6CgogIC90bXAvdG1wLmg5
S01Vc2U1ek8gJCBmaW5kIC4gLXR5cGUgZCAtbmFtZSBfX3B5Y2FjaGVfXyAtZXhlYyBybSAtcnZm
IHt9IFw7IDsgZWNobyAtZSAiUkVUVVJOIENPREU6ICQ/IgogIHJlbW92ZWQgZGlyZWN0b3J5ICcu
L2EvYi9jL2QvZS9fX3B5Y2FjaGVfXycKICBmaW5kOiDigJguL2EvYi9jL2QvZS9fX3B5Y2FjaGVf
X+KAmTogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQogIHJlbW92ZWQgZGlyZWN0b3J5ICcuL2Ev
Yi9jL2QvZS9mL19fcHljYWNoZV9fJwogIGZpbmQ6IOKAmC4vYS9iL2MvZC9lL2YvX19weWNhY2hl
X1/igJk6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKICByZW1vdmVkIGRpcmVjdG9yeSAnLi9h
L2IvYy9kL2UvZi9nL19fcHljYWNoZV9fJwogIFJFVFVSTiBDT0RFOiAxCgpOb3csIHBhc3MgdGhl
IGAtZGVwdGhgIGFyZ3VtZW50IHRvIGBmaW5kYCBzbyBhIGRlcHRoLWZpcnN0IHNlYXJjaCBpcwpw
ZXJmb3JtZWQgdG8gYXZvaWQgdHJ5aW5nIHRvIHNlYXJjaCB3aXRoaW4gYW4gYWxyZWFkeSBkZWxl
dGVkIGZvbGRlci4KCkZpeGVzOiA1NGQ0OGM4Y2FkNGUgKCJwYWNrYWdlL3B5dGhvbjM6IG1pc2Nl
bGxhbmVvdXMgZml4dXBzIikKRml4ZXM6IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9y
ZXN1bHRzL2JhMWQ0MjEzYWU5OTEyZDUzNDEyZGVkNmQ4ZTI1N2I2N2E0ZjdjMGUvClNpZ25lZC1v
ZmYtYnk6IFZpbmNlbnQgRmF6aW8gPHZmYXppb0BnbWFpbC5jb20+Ci0tLQogcGFja2FnZS9weXRo
b24zL3B5dGhvbjMubWsgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24zL3B5dGhvbjMubWsg
Yi9wYWNrYWdlL3B5dGhvbjMvcHl0aG9uMy5tawppbmRleCBhODJiYzQ3YTU3Li5mODVkY2ZhZDMw
IDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhvbjMvcHl0aG9uMy5taworKysgYi9wYWNrYWdlL3B5
dGhvbjMvcHl0aG9uMy5tawpAQCAtMjA1LDggKzIwNSw4IEBAIGRlZmluZSBQWVRIT04zX1JFTU9W
RV9VU0VMRVNTX0ZJTEVTCiAJcm0gLWYgJChUQVJHRVRfRElSKS91c3IvYmluL3B5dGhvbiQoUFlU
SE9OM19WRVJTSU9OX01BSk9SKS1jb25maWcKIAlybSAtZiAkKFRBUkdFVF9ESVIpL3Vzci9iaW4v
cHl0aG9uMy1jb25maWcKIAlmaW5kICQoVEFSR0VUX0RJUikvdXNyL2xpYi9weXRob24kKFBZVEhP
TjNfVkVSU0lPTl9NQUpPUikvY29uZmlnLSQoUFlUSE9OM19WRVJTSU9OX01BSk9SKSovIFwKLQkJ
LXR5cGUgZiAtbm90IC1uYW1lIE1ha2VmaWxlIC1leGVjIHJtIC1yZiB7fSBcOwotCWZpbmQgJChU
QVJHRVRfRElSKS91c3IvbGliL3B5dGhvbiQoUFlUSE9OM19WRVJTSU9OX01BSk9SKS8gLXR5cGUg
ZCBcCisJCS1kZXB0aCAtdHlwZSBmIC1ub3QgLW5hbWUgTWFrZWZpbGUgLWV4ZWMgcm0gLXJmIHt9
IFw7CisJZmluZCAkKFRBUkdFVF9ESVIpL3Vzci9saWIvcHl0aG9uJChQWVRIT04zX1ZFUlNJT05f
TUFKT1IpLyAtZGVwdGggLXR5cGUgZCBcCiAJCS1uYW1lIF9fcHljYWNoZV9fIC1leGVjIHJtIC1y
ZiB7fSBcOwogZW5kZWYKIAotLSAKMi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
