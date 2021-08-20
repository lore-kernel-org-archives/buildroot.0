Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E206C4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 11:23:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94F8E60EBD
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 11:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 94F8E60EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D0C86125A;
	Fri, 20 Aug 2021 11:23:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OIY-nuQJedBl; Fri, 20 Aug 2021 11:23:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A62F0613B7;
	Fri, 20 Aug 2021 11:23:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E876C1BF363
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 11:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D84B581022
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 11:23:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20150623.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N4NEQz343Qvn for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 11:23:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF7C28101D
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 11:23:26 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id f10so5114082lfv.6
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 04:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pnfg50UdPiNFI7zPhx0dLwsWlh8dH4Bc0HuYE2qaKTA=;
 b=INaUnGjvpGDC92B7htwl0euX0gB45dlccUxIe+PZGW7F96bYe2WDo8lZpW3aOmN0Ne
 ZSAMyFEr0isvXcY4SSYCPlKosHvvSLVbAUHCuRiY0VcLQMpiEZO/321Ez1UO0rgg23Ni
 XgYoNMuYbG8hI9WhGREGydsGII9kv4kkO2Q8ze46UjfT3fE8u8kVZLnUoRAfR4DYEZJe
 erBXZO8PmwIG0EGqsxw66wCtcIFp+4oyzYlpygVS8E9mDsylEO29TIp8d9YI0pAb2RE+
 RdLHnTb1yVlEOV46f/Jj+E63toATAHbefWvORiWQqnFVHSu/W7/WnYsvVVHljo+8DwSQ
 aN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pnfg50UdPiNFI7zPhx0dLwsWlh8dH4Bc0HuYE2qaKTA=;
 b=Cpv5z9pZ2HCfSk3/RYZEPCtDeKutfWcpmjdeF9vKcFMFqRNVeJL2/VGs91rT7fFfQH
 mRA9UicLEQ9ZevfELSWqiYCkKrm9j2zJXxJmifALYbTYSDC7k4dremdh83pr5zVXNvKZ
 q/LnPDwYYdres66HWy7f1Zn9kFpv2mGY/ZymmynobVAio4ih32Qz1G4Aaxl87HcKGFUE
 40F+8dndq5tTnmP8ALE+OI4SwqGlzV/6Su84PiBjxqp30vp5bi/5pfdCNmQYTwJeIX7e
 Zu8F7J0a7KtSmbEgE9SMnNC+HMNapCV3cwnmQi3QzBLJ3qcZoeM250kQBCdYB3wmzttb
 EN1g==
X-Gm-Message-State: AOAM531gZKxFXGPx/OiCOYJxT/BvlHGu+IwDGtp5ij/0lAa82WBiXs3v
 05EP7uhfBcyKFIMqBN7dupZ3zvCWUGwjN0Qu
X-Google-Smtp-Source: ABdhPJxl/itKxuSQ7MmLmNyb9GAd0tPvslLgjEdbypLAFm538ufI0r0joRBbjT7PqatiTUPs90hb3w==
X-Received: by 2002:a05:6512:3e2a:: with SMTP id
 i42mr14703654lfv.535.1629458604549; 
 Fri, 20 Aug 2021 04:23:24 -0700 (PDT)
Received: from Unikie-T14-Gen-2i.madriguera.foxhound.fi
 (88-113-104-240.elisa-laajakaista.fi. [88.113.104.240])
 by smtp.googlemail.com with ESMTPSA id g14sm603643lfu.61.2021.08.20.04.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 04:23:24 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@buildroot.org
Date: Fri, 20 Aug 2021 14:23:22 +0300
Message-Id: <20210820112322.5762-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/restorecond: Add new init script
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
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

VGhlIGN1cnJlbnQgcmVzdG9yZWNvbmQgdXBzdHJlYW0gaW5pdCBzY3JpcHQgaXMgbm8KZ29vZCBm
aXQgZm9yIHRoZSB1c2VyIHNwYWNlIGdlbmVyYXRlZCBieSBidWlsZHJvb3QsCnRoaXMgc2NyaXB0
IGlzIGFuIGV4dGVuc2lvbiBvZiB0aGUgb3JpZ2luYWwsIHRoYXQKYnJpbmdzIHNvbWUgY2hhbmdl
cyBmcm9tIHRoZSBkZWJpYW4gaW5pdCBzY3JpcHQgdG8KdXNlIHN0YXJ0LXN0b3AtZGFlbW9uIGlu
c3RlYWQgb2YgZGFlbW9uLCB3aGlsZQpyZW1vdmluZyBkZXBlbmRlbmNpZXMgb24gL2V0Yy9yYy5k
L2luaXQuZC9mdW5jdGlvbnMKYW5kIC9saWIvbHNiL2luaXQtZnVuY3Rpb25zLgoKU2lnbmVkLW9m
Zi1ieTogSm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQHVuaWtpZS5jb20+Ci0tLQpb
IHYxIC0+IHYyIF0gTW92ZWQgdG8gdXBzdHJlYW0gc2NyaXB0IHRlbXBsYXRlCgogcGFja2FnZS9y
ZXN0b3JlY29uZC9TMDJyZXN0b3JlY29uZCB8IDc1ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwogcGFja2FnZS9yZXN0b3JlY29uZC9yZXN0b3JlY29uZC5tayB8ICA0ICstCiAyIGZpbGVz
IGNoYW5nZWQsIDc3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9yZXN0b3JlY29uZC9TMDJyZXN0b3JlY29uZAoKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvcmVzdG9yZWNvbmQvUzAycmVzdG9yZWNvbmQgYi9wYWNrYWdlL3Jlc3RvcmVjb25kL1Mw
MnJlc3RvcmVjb25kCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmFlNWFj
YmY3M2EKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3Jlc3RvcmVjb25kL1MwMnJlc3RvcmVj
b25kCkBAIC0wLDAgKzEsNzUgQEAKKyMhL2Jpbi9zaAorCitEQUVNT049cmVzdG9yZWNvbmQKK1BJ
REZJTEU9L3Zhci9ydW4vJERBRU1PTi5waWQKKworUkVTVE9SRUNPTkRfQVJHUz0iIgorCitzdGFy
dCgpCit7CisJIyBSZXR1cm4KKwkjICAgMCBpZiBkYWVtb24gaGFzIGJlZW4gc3RhcnRlZAorCSMg
ICAxIGlmIGRhZW1vbiB3YXMgYWxyZWFkeSBydW5uaW5nCisJIyAgIDIgaWYgZGFlbW9uIGNvdWxk
IG5vdCBiZSBzdGFydGVkCisJcHJpbnRmICdTdGFydGluZyAlczogJyAiJERBRU1PTiIKKwlzdGFy
dC1zdG9wLWRhZW1vbiAtYiAtbSAtUyAtcSAtcCAiJFBJREZJTEUiIC14ICIvdXNyL3NiaW4vJERB
RU1PTiIgXAorCQktLSAkUkVTVE9SRUNPTkRfQVJHUworCXN0YXR1cz0kPworCWlmIFsgIiRzdGF0
dXMiIC1lcSAwIF07IHRoZW4KKwkJZWNobyAiT0siCisJZWxzZQorCQllY2hvICJGQUlMIgorCWZp
CisJcmV0dXJuICIkc3RhdHVzIgorfQorCitzdG9wKCkKK3sKKwkjIFJldHVybgorCSMgICAwIGlm
IGRhZW1vbiBoYXMgYmVlbiBzdG9wcGVkCisJIyAgIDEgaWYgZGFlbW9uIHdhcyBhbHJlYWR5IHN0
b3BwZWQKKwkjICAgMiBpZiBkYWVtb24gY291bGQgbm90IGJlIHN0b3BwZWQKKwkjICAgb3RoZXIg
aWYgYSBmYWlsdXJlIG9jY3VycmVkCisJcHJpbnRmICdTdG9wcGluZyAlczogJyAiJERBRU1PTiIK
KwlzdGFydC1zdG9wLWRhZW1vbiAtSyAtcSAtcCAkUElERklMRSAtUiBURVJNLzMwL0tJTEwvNSAt
biAkREFFTU9OCisJc3RhdHVzPSQ/CisJaWYgWyAiJHN0YXR1cyIgLWVxIDAgXTsgdGhlbgorCQly
bSAtZiAiJFBJREZJTEUiCisJCWVjaG8gIk9LIgorCWVsc2UKKwkJZWNobyAiRkFJTCIKKwlmaQor
CXJldHVybiAiJHN0YXR1cyIKK30KKworcmVzdGFydCgpCit7CisJc3RvcAorCXNsZWVwIDEKKwlz
dGFydAorfQorCitjaGVja19zdGF0dXMoKQoreworCXN0YXJ0LXN0b3AtZGFlbW9uIC1LIC10IC1w
ICRQSURGSUxFIC1uICREQUVNT04KKwlzdGF0dXM9JD8KKwlpZiBbICIkc3RhdHVzIiAtZXEgMCBd
OyB0aGVuCisJCWVjaG8gIlJVTk5JTkciCisJZWxzZQorCQllY2hvICJTVE9QUEVEIgorCWZpCit9
CisKK2Nhc2UgIiQxIiBpbgorCXN0YXJ0fHN0b3B8cmVzdGFydCkKKwkJIiQxIjs7CisJc3RhdHVz
KQorCQljaGVja19zdGF0dXM7OworCWZvcmNlLXJlbG9hZHxyZXN0YXJ0fHJlbG9hZCkKKwkJcmVz
dGFydDs7CisJY29uZHJlc3RhcnQpCisJCVsgLWUgL3Zhci9sb2NrL3N1YnN5cy9yZXN0b3JlY29u
ZCBdICYmIHJlc3RhcnQgfHwgOjs7CisJKikKKwkJZWNobyAkIlVzYWdlOiAkMCB7c3RhcnR8c3Rv
cHxyZXN0YXJ0fGZvcmNlLXJlbG9hZHxzdGF0dXN8Y29uZHJlc3RhcnR9IgorCQlleGl0IDEKK2Vz
YWMKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcmVzdG9yZWNvbmQvcmVzdG9yZWNvbmQubWsgYi9wYWNr
YWdlL3Jlc3RvcmVjb25kL3Jlc3RvcmVjb25kLm1rCmluZGV4IDdhYjdlOTc4ZGQuLjNjNmZiNTdl
YTYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcmVzdG9yZWNvbmQvcmVzdG9yZWNvbmQubWsKKysrIGIv
cGFja2FnZS9yZXN0b3JlY29uZC9yZXN0b3JlY29uZC5tawpAQCAtMjcsOCArMjcsOCBAQCBkZWZp
bmUgUkVTVE9SRUNPTkRfQlVJTERfQ01EUwogZW5kZWYKIAogZGVmaW5lIFJFU1RPUkVDT05EX0lO
U1RBTExfSU5JVF9TWVNWCi0JJChJTlNUQUxMKSAtbSAwNzU1IC1EICQoQEQpL3Jlc3RvcmVjb25k
LmluaXQgXAotCQkkKFRBUkdFVF9ESVIpL2V0Yy9pbml0LmQvUzIwcmVzdG9yZWNvbmQKKwkkKElO
U1RBTEwpIC1tIDA3NTUgLUQgcGFja2FnZS9yZXN0b3JlY29uZC9TMDJyZXN0b3JlY29uZCBcCisJ
CSQoVEFSR0VUX0RJUikvZXRjL2luaXQuZC9TMDJyZXN0b3JlY29uZAogZW5kZWYKIAogZGVmaW5l
IFJFU1RPUkVDT05EX0lOU1RBTExfSU5JVF9TWVNURU1ECi0tIAoyLjI1LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
