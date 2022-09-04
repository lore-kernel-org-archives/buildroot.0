Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003E1ECAAD3
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 09:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AFF5408AA;
	Sun,  4 Sep 2022 09:27:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AFF5408AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 44rnvI0auFgj; Sun,  4 Sep 2022 09:27:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAC9D405CE;
	Sun,  4 Sep 2022 09:27:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAC9D405CE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 499FE1BF429
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 09:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FA8D405CE
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 09:27:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FA8D405CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q6OJw7DttY9a for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 09:26:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 445384055D
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 445384055D
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 09:26:58 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id az27so7684499wrb.6
 for <buildroot@buildroot.org>; Sun, 04 Sep 2022 02:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=ZaMxLUVYgb27Z3blkpJrkj1mj/67lf33NvWxwKyLGLc=;
 b=aPihOVaF+3IolDSPyXpQ7705BW7GO6vswIQgI1/jkDkDjZOWAvSr0Ag1Kbq4RKkv6a
 GSaYPbw3cF5kQfhwUm84CHZr+UHMQchKQC9AZYQ9jZzp2THxvkMyL40GGUiX0pHN8Fcy
 5/h+rfg2uB5jdmnWxZOsa2Rh7f/yLBMjNrrRI5VahIKA5d2OySlxorB3wTGYzbmbSC+p
 Px5xhCsK7xaSPfUiKR8aGDhdA/eYoFkdFJCBWc2Y3p+2HCLfSQfZeTVoH3JZRrygUsTA
 VNjWGZBcMC+30fILfwVhaJnEl1lOiOLRiVWT/DiYamR0qbAJmOmKcBDfk6x12MCJG/LB
 8p8w==
X-Gm-Message-State: ACgBeo1nEh64+CuRlX7/eaIRZVpWoVcwfRPnmZ2oIZpTSP85/0eELz57
 ieeQ3tSkQTx+rrtEim9LmfyBj/x1G88=
X-Google-Smtp-Source: AA6agR6Ox5iIzXuRZ1F0aRegnkd2my7TXaV8+BSeuzcWZY9nNB5cB7YTGuTZK4mNdUnrTRTp1uW0/A==
X-Received: by 2002:a05:6000:68c:b0:226:e12f:6ec8 with SMTP id
 bo12-20020a056000068c00b00226e12f6ec8mr14213376wrb.681.1662283615932; 
 Sun, 04 Sep 2022 02:26:55 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n6-20020a5d4006000000b00226d3e9f8f4sm5573815wrp.98.2022.09.04.02.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 02:26:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Sep 2022 11:26:29 +0200
Message-Id: <20220904092629.16495-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=ZaMxLUVYgb27Z3blkpJrkj1mj/67lf33NvWxwKyLGLc=;
 b=eTauvAU5TsxAjJHACttDZ5UHVIM2AOIGZrQU4PgK9UO1WJjuGnHnLa3uRMvTO3m3Ov
 BVzElCaQGaDO18udGxaFQOchTNRkgOPzubUPRcID+qhJti7vVG9imR7AAUfTGvBFkCJQ
 HcdyBng10GvVxCHS5gUG1BmWxkVR4eIoTDwLdnkfgw2ePLO2HOZZAVTpDpgvJW7RPTPZ
 ZamOns4FHFJSR/IzVkMJvEj8I63dY8fh4YpxCfs1ifaOn/Jisff7smEZanzoi2xJEyJ4
 VR1ymrSh9grCr/DJ7f1r6Fs15/ANbrszalgIVJ84Hw4HUub2Kn4NCkwg1njAv1yygOh0
 5eSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eTauvAU5
Subject: [Buildroot] [PATCH 1/1] package/wolfssl: security bump to version
 5.5.0
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4IHRoZSBmb2xsb3dpbmcgc2VjdXJpdHkgdnVsbmVyYWJpbGl0aWVzOgogLSBbTG93XSBGYXVs
dCBpbmplY3Rpb24gYXR0YWNrIG9uIFJBTSB2aWEgUm93aGFtbWVyIGxlYWRzIHRvIEVDRFNBIGtl
eQogICBkaXNjbG9zdXJlLiBVc2VycyBkb2luZyBvcGVyYXRpb25zIHdpdGggcHJpdmF0ZSBFQ0Mg
a2V5cyBzdWNoIGFzCiAgIHNlcnZlciBzaWRlIFRMUyBjb25uZWN0aW9ucyBhbmQgY3JlYXRpbmcg
RUNDIHNpZ25hdHVyZXMsIHdobyBhbHNvCiAgIGhhdmUgaGFyZHdhcmUgdGhhdCBjb3VsZCBiZSB0
YXJnZXRlZCB3aXRoIGEgc29waGlzdGljYXRlZCBSb3doYW1tZXIKICAgYXR0YWNrIHNob3VsZCB1
cGRhdGUgdGhlIHZlcnNpb24gb2Ygd29sZlNTTCBhbmQgY29tcGlsZSB1c2luZyB0aGUKICAgbWFj
cm8gV09MRlNTTF9DSEVDS19TSUdfRkFVTFRTLgogLSBbTG93XSBJbiB3b2xmU1NMIHZlcnNpb24g
NS4zLjAgaWYgY29tcGlsZWQgd2l0aAogICAtLWVuYWJsZS1zZXNzaW9uLXRpY2tldCBhbmQgdGhl
IGNsaWVudCBoYXMgbm9uLWVtcHR5IHNlc3Npb24gY2FjaGUsCiAgIHdpdGggVExTIDEuMiB0aGVy
ZSBpcyB0aGUgcG9zc2liaWxpdHkgb8OgZiBhIG1hbiBpbiB0aGUgbWlkZGxlIHBhc3NpbmcKICAg
YSBsYXJnZSBzZXNzaW9uIHRpY2tldCB0byB0aGUgY2xpZW50IGFuZCBjYXVzaW5nIGEgY3Jhc2gg
ZHVlIHRvIGFuCiAgIGludmFsaWQgZnJlZS4gVGhlcmUgaXMgYWxzbyB0aGUgcG90ZW50aWFsIGZv
ciBhIG1hbGljaW91cyBUTFMgMS4zCiAgIHNlcnZlciB0byBjcmFzaCBhIGNsaWVudCBpbiBhIHNp
bWlsYXIgbWFubmVyIGV4Y2VwdCBpbiBUTFMgMS4zIGl0IGlzCiAgIG5vdCBzdXNjZXB0aWJsZSB0
byBhIG1hbiBpbiB0aGUgbWlkZGxlIGF0dGFjay4gVXNlcnMgb24gdGhlIGNsaWVudAogICBzaWRl
IHdpdGgg4oCTZW5hYmxlLXNlc3Npb24tdGlja2V0IGNvbXBpbGVkIGluIGFuZCB1c2luZyB3b2xm
U1NMCiAgIHZlcnNpb24gNS4zLjAgc2hvdWxkIHVwZGF0ZSB0aGVpciB2ZXJzaW9uIG9mIHdvbGZT
U0wuCiAtIFtMb3ddIElmIHVzaW5nIHdvbGZTU0xfY2xlYXIgdG8gcmVzZXQgYSBXT0xGU1NMIG9i
amVjdCAodnMgdGhlIG5vcm1hbAogICB3b2xmU1NMX2ZyZWUvd29sZlNTTF9uZXcpIGl0IGNhbiBy
ZXN1bHQgaW4gcnVudGltZSBpc3N1ZXMuIFRoaXMKICAgZXhpc3RzIHdpdGggYnVpbGRzIHVzaW5n
IHRoZSB3b2xmU1NMIGNvbXBhdGliaWxpdHkgbGF5ZXIKICAgKC0tZW5hYmxlLW9wbmVzc2xleHRy
YSkgYW5kIG9ubHkgd2hlbiB0aGUgYXBwbGljYXRpb24gaXMgbWFraW5nIHVzZQogICBvZiB3b2xm
U1NMX2NsZWFyIGluc3RlYWQgb2YgU1NMX2ZyZWUvU1NMX25ldy4gSW4gdGhlIGNhc2Ugb2YgYSBU
TFMKICAgMS4zIHJlc3VtcHRpb24sIGFmdGVyIGNvbnRpbnVpbmcgdG8gdXNlIHRoZSBXT0xGU1NI
IG9iamVjdCBhZnRlcgogICBoYXZpbmcgY2FsbGVkIHdvbGZTU0xfY2xlYXIsIGFuIGFwcGxpY2F0
aW9uIGNvdWxkIGNyYXNoLiBJdCBpcwogICBzdWdnZXN0ZWQgdGhhdCB1c2VycyBjYWxsaW5nIHdv
bGZTU0xfY2xlYXIgdXBkYXRlIHRoZSB2ZXJzaW9uIG9mCiAgIHdvbGZTU0wgdXNlZC4KIC0gUG90
ZW50aWFsIERvUyBhdHRhY2sgb24gRFRMUyAxLjIuIEluIHRoZSBjYXNlIG9mIHJlY2VpdmluZyBh
CiAgIG1hbGljaW91cyBwbGFpbnRleHQgaGFuZHNoYWtlIG1lc3NhZ2UgYXQgZXBvY2ggMCB0aGUg
Y29ubmVjdGlvbiB3aWxsCiAgIGVudGVyIGFuIGVycm9yIHN0YXRlIHJlcG9ydGluZyBhIGR1cGxp
Y2F0ZSBtZXNzYWdlLiBUaGlzIGFmZmVjdHMgYm90aAogICBzZXJ2ZXIgYW5kIGNsaWVudCBzaWRl
LiBVc2VycyB0aGF0IGhhdmUgRFRMUyBlbmFibGVkIGFuZCBpbiB1c2UKICAgc2hvdWxkIHVwZGF0
ZSB0aGVpciB2ZXJzaW9uIG9mIHdvbGZTU0wgdG8gbWl0aWdhdGUgdGhlIHBvdGVudGlhbCBmb3IK
ICAgYSBEb1MgYXR0YWNrLgoKaHR0cHM6Ly9naXRodWIuY29tL3dvbGZTU0wvd29sZnNzbC9yZWxl
YXNlcy90YWcvdjUuNS4wLXN0YWJsZQoKU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8
Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Ci0tLQogcGFja2FnZS93b2xmc3NsL3dvbGZzc2wu
aGFzaCB8IDIgKy0KIHBhY2thZ2Uvd29sZnNzbC93b2xmc3NsLm1rICAgfCAyICstCiAyIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9w
YWNrYWdlL3dvbGZzc2wvd29sZnNzbC5oYXNoIGIvcGFja2FnZS93b2xmc3NsL3dvbGZzc2wuaGFz
aAppbmRleCAwMWIyMTU5NmU3Li5mMTQwMWU0Y2RhIDEwMDY0NAotLS0gYS9wYWNrYWdlL3dvbGZz
c2wvd29sZnNzbC5oYXNoCisrKyBiL3BhY2thZ2Uvd29sZnNzbC93b2xmc3NsLmhhc2gKQEAgLTEs
NSArMSw1IEBACiAjIExvY2FsbHkgY29tcHV0ZWQ6Ci1zaGEyNTYgIGRjMzZjYzE5ZGFkMTk3MjUz
ZTVjMmVjYWE0OTBjN2VlZjU3OWFkNDQ4NzA2ZTU1ZDczZDc5Mzk2ZTgxNDA5OGIgIHdvbGZzc2wt
NS40LjAudGFyLmd6CitzaGEyNTYgIGMzNGI3NGI1ZjY4OWZhYzdiZWNiMDU1ODNiMDQ0ZTg0ZDNi
MTBkMzlmMzg3MDlmMDA5NWRkNWQ0MjNkZWQ2N2YgIHdvbGZzc2wtNS41LjAudGFyLmd6CiAKICMg
SGFzaCBmb3IgbGljZW5zZSBmaWxlczoKIHNoYTI1NiAgODE3N2Y5NzUxMzIxMzUyNmRmMmNmNjE4
NGQ4ZmY5ODZjNjc1YWZiNTE0ZDRlNjhhNDA0MDEwNTIxYjg4MDY0MyAgQ09QWUlORwpkaWZmIC0t
Z2l0IGEvcGFja2FnZS93b2xmc3NsL3dvbGZzc2wubWsgYi9wYWNrYWdlL3dvbGZzc2wvd29sZnNz
bC5tawppbmRleCA1MzZmZDg2M2ZlLi5jYTM2MDMxMmM5IDEwMDY0NAotLS0gYS9wYWNrYWdlL3dv
bGZzc2wvd29sZnNzbC5taworKysgYi9wYWNrYWdlL3dvbGZzc2wvd29sZnNzbC5tawpAQCAtNCw3
ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLVdPTEZTU0xfVkVSU0lPTiA9
IDUuNC4wCitXT0xGU1NMX1ZFUlNJT04gPSA1LjUuMAogV09MRlNTTF9TSVRFID0gJChjYWxsIGdp
dGh1Yix3b2xmU1NMLHdvbGZzc2wsdiQoV09MRlNTTF9WRVJTSU9OKS1zdGFibGUpCiBXT0xGU1NM
X0lOU1RBTExfU1RBR0lORyA9IFlFUwogCi0tIAoyLjM1LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
