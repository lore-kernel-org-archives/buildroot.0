Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61528C5DF97
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 14:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16B15605EB;
	Wed, 26 Aug 2026 14:04:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id soceqAxW1qXU; Wed, 26 Aug 2026 14:04:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787753062;
	bh=bKBOgxjG0rjyIoxZDk6LTya9XIqttCyHWN4kzwxAzT0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=bGDHzgk2zCPXk95tSa6MXzs9bRmLwNaXUzFmA2wwR7aA5yxb5cVSelqph/rVK1bb0
	 UHWqbMn1L/WwmUPLew7atPBhKylMR1Z1rOUGTY/mEYQEbCsZiugS5KPlVBoXTq6hMg
	 ti+ftSfeT3BF8D4HsZXryBXLxXNnlOqXb0ODwnvkCRcW7mwd2nGZPCbB6xhEFaUyJf
	 ww7VUjxzabyZ6UKbYc9eeFlq5SAFFhTWIASk9JtXXz7eNafQ9ijJ+0/0R8niDORny9
	 2ujp05oNVgalQDhgtbkw/IzCcJF3Yj9QYXokuW8ouDZdcUd0x0rQIj9UF3CnG2NO1v
	 ljQ2w2mq5DMDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B3C96067B;
	Wed, 26 Aug 2026 14:04:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A0335334
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 14:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8744A40108
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 14:04:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCmmHnTOfkDT for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 14:04:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6BFA54005F
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 14:04:18 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4998590d392so6465925e9.0
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 07:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787753056; x=1788357856;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=kj+lRjckaLHE9DUtEeSzv6fsqD1c7awQoxlRLCRGUeE=;
 b=a87wdSLk4EmL5yEAZ3fr+8YCYm3kPMXBUt+O5RCAJ98EzdyhDlsfc5m5fiUL8bC7ih
 N30qiSzKw5dVFVZdGfGXGGBUdtLnRuMill1KXG8B/yW6Sj2n9XLdcfkgzZO42C1DeOwd
 wQgM5wBhXd/F/zpJ/9LyrkYFdlnKLU4WPwR48IaZx5MATU7LtbMOE9MXH25o2O0LkkgX
 7JFgTlm6zoOBCskiwq/ugn/ueDOjxsHs8bSsH00lPlgvrfo4jSQrwWwW4h1aC6NJgKrq
 TmeHYmzX4bDyWAKoZs39gCA/tyvd14MEsthI67lC+ZJu2h2v3qGsWqO3QJ73Eci+JnAB
 Mz6Q==
X-Gm-Message-State: AFuF++m4Y7K7rDrLl0ZZwKrpFxpK1TsxYHqOxfDa4xJ/DkpW33QvEl3l
 QSgijcBuM6TmeiFAydhiqpjX0QzRSBpeLmtXu647TM1Bv+KEBQmsLbl1IsTnHx0Y00owZ7t/YNd
 eD4lN
X-Gm-Gg: AR+sD102y85+RjISM4I1sFnfKybhmaNEa8GkhbBC1VbaChRax7agPz42xUyM5kgInqd
 xYB6NEzTmXO7SMMorYhepXrwm6eaQnjfoYCTk43gemU+Vm4P/X62KSKvaxJUrdwK/GCWRE0SUYX
 DPIi6s4U/bIDtlixrfUS3d1RDdOTKdIZwPeGfwd60nN6m1v8SlcBvzLpy8vCeUzrPEgSdgIXU6+
 2Vx7gedsfy2aepfvXB/abhAp00splQt9VT5weLaS/W3bdg7gzgFNBNYwBdDZv8gpeLY5SbxyFvL
 TV41zh61bNc0nh4Hs/2nVoughoUuzawxYu8Y3jTGNBhq1sobXjhVm3vj/x/WCpC4U/Si6FJM+Mt
 MP7Uc/n71Ywk3J1DGSQMKpJY+8/m9qUPvZE4Kw5ODFZ4+OZ4zvfl2EWAuAb/VgtYrF/+0JmV4ia
 dlMzL9U3KFXNNlKc/0KDzOHqtutG8gnQt+fZiAemoIai8PBRvqrG0SMq+y3uEbPfbe
X-Received: by 2002:a05:600c:1382:b0:493:f140:c3fb with SMTP id
 5b1f17b1804b1-499dc70b76dmr58776675e9.7.1787753056228; 
 Wed, 26 Aug 2026 07:04:16 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499dc9c0270sm28328365e9.15.2026.08.26.07.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 07:04:15 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Aug 2026 16:04:14 +0200
Message-ID: <20260826140414.347415-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/nodejs: security bump to v22.23.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2VlIHRoZSByZWxlYXNlIG5vdGVzOgoKLSBodHRwczovL2dpdGh1Yi5jb20vbm9kZWpzL25vZGUv
cmVsZWFzZXMvdGFnL3YyMi4yMy4yCi0gaHR0cHM6Ly9naXRodWIuY29tL25vZGVqcy9ub2RlL3Jl
bGVhc2VzL3RhZy92MjIuMjMuMQotIGh0dHBzOi8vZ2l0aHViLmNvbS9ub2RlanMvbm9kZS9yZWxl
YXNlcy90YWcvdjIyLjIyLjEKLSBodHRwczovL2dpdGh1Yi5jb20vbm9kZWpzL25vZGUvcmVsZWFz
ZXMvdGFnL3YyMi4yMi4yCi0gaHR0cHM6Ly9naXRodWIuY29tL25vZGVqcy9ub2RlL3JlbGVhc2Vz
L3RhZy92MjIuMjIuMwoKSXQgZml4ZXMgdGhlIGZvbGxvd2luZyB2dWxuZXJhYmlsaXRpZXM6Cgot
IChDVkUtMjAyNi01Njg0NikgaHR0cDI6IHJldGFpbiBoZWFkZXIgbWVtb3J5IGluIHNlc3Npb24g
YWNjb3VudGluZyAoTWF0dGVvIENvbGxpbmEpIOKAkyBIaWdoCi0gKENWRS0yMDI2LTU2ODQ4KSBo
dHRwMjogZGVmZXIgcnN0IHN0cmVhbSB3aGlsZSBpbiBzY29wZSAoTWF0dGVvIENvbGxpbmEpIOKA
kyBIaWdoCi0gKENWRS0yMDI2LTU4MDQzKSBwZXJtaXNzaW9uOiBhdm9pZCBncmFudGluZyByYWRp
eCBzcGxpdCBub2RlcyAoUmFmYWVsR1NTKSDigJMgSGlnaAotIChDVkUtMjAyNi01Njg1MCkgaHR0
cHM6IGRpc3Rpbmd1aXNoIFBGWCBvYmplY3QtYXJyYXkgYWdlbnQga2V5cyAoUmFmYWVsR1NTKSDi
gJMgTWVkaXVtCi0gKENWRS0yMDI2LTU4MDQwKSBodHRwczogYmluZCBpZGVudGl0eSBjaGVja3Mg
dG8gc2Vzc2lvbiByZXVzZSAoTWF0dGVvIENvbGxpbmEpIOKAkyBNZWRpdW0KLSAoQ1ZFLTIwMjYt
NTgwNDIpIGRuczogaGFuZGxlIGxhcmdlIHJlc29sdmVBbnkgYWRkcmVzcyByZXBsaWVzIChSYWZh
ZWxHU1MpIOKAkyBNZWRpdW0KLSAoQ1ZFLTIwMjYtNTgwNDUpIHpsaWI6IHRocm93IG9uIG91dC1v
Zi1ib3VuZHMgd3JpdGUgYnVmZmVycyAoUmFmYWVsR1NTKSDigJMgTWVkaXVtCi0gKENWRS0yMDI2
LTU2ODQ3KSBwZXJtaXNzaW9uOiBlbmZvcmNlIGZzIHdyaXRlIHBlcm1pc3Npb24gZm9yIHRyYWNl
IGV2ZW50cyAoUmFmYWVsR1NTKSDigJMgTG93Ci0gKENWRS0yMDI2LTU4MDM5KSBwZXJtaXNzaW9u
OiBjaGVjayBmaW5hbCByZXBvcnQgb3V0cHV0IHBhdGggKFJhZmFlbEdTUykg4oCTIExvdwotIChD
VkUtMjAyNi01ODA0NCkgaHR0cDogcmVqZWN0IHJlcXVlc3RzIGV4Y2VlZGluZyBtYXggaGVhZGVy
IGNvdW50IChNYXR0ZW8gQ29sbGluYSkg4oCTIExvdwoKVGhlIExJQ0VOU0Ugd2FzIGNoYW5nZWQg
aW4gMjIuMjIuMSwgc2VlIFsxXS4KClsxXSBodHRwczovL2dpdGh1Yi5jb20vbm9kZWpzL25vZGUv
Y29tbWl0LzljYWZlYzA4NGU0ODU2ZTJmMDNkMDY1MjNlYWVlYzBjOGJhMzUyYjIKClNpZ25lZC1v
ZmYtYnk6IFRob21hcyBQZXJhbGUgPHRob21hcy5wZXJhbGVAbWluZC5iZT4KLS0tCiBwYWNrYWdl
L25vZGVqcy9ub2RlanMuaGFzaCB8IDE1ICsrKysrKysrLS0tLS0tLQogcGFja2FnZS9ub2RlanMv
bm9kZWpzLm1rICAgfCAgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDgg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9ub2RlanMvbm9kZWpzLmhhc2ggYi9w
YWNrYWdlL25vZGVqcy9ub2RlanMuaGFzaAppbmRleCBjMzM3MmY0NDNjLi5iZjdhODM1OGJhIDEw
MDY0NAotLS0gYS9wYWNrYWdlL25vZGVqcy9ub2RlanMuaGFzaAorKysgYi9wYWNrYWdlL25vZGVq
cy9ub2RlanMuaGFzaApAQCAtMSw4ICsxLDkgQEAKLSMgRnJvbSBodHRwczovL25vZGVqcy5vcmcv
ZGlzdC92MjIuMjIuMC9TSEFTVU1TMjU2LnR4dC5hc2MKLXNoYTI1NiAgMWJmMWViOWVlNjNmZmM0
ZTVkMzI0YzBiOWI2MmNmNGEyODlmNDQzMzJkZmVmOTYwN2NlYTFhMGQ5NTk2YmE2ZiAgbm9kZS12
MjIuMjIuMC1saW51eC1hcm02NC50YXIueHoKLXNoYTI1NiAgYThiNGYxNWY2ZTFmMzcxNDIyZjFm
N2FiY2NhNGM0NmJkN2FiYzFjNzMyYzI3NGJjNWNiMTA4Yjg0MWMxZjBmZiAgbm9kZS12MjIuMjIu
MC1saW51eC1hcm12N2wudGFyLnh6Ci1zaGEyNTYgIGQ4M2I5OTU3NDMxY2MxOGUxZmMxNDNhNGI5
OWY4OWNkZTdiOGExOGY1M2VmMzkyMjMxYjQzMzZhZmQwNTg4NjUgIG5vZGUtdjIyLjIyLjAtbGlu
dXgtcHBjNjRsZS50YXIueHoKLXNoYTI1NiAgOWFhOGU5ZDIyOThhYjY4YzYwMGJkNmZiODZhNmMx
M2JjZTExYTRlY2ExYmE5YjM5ZDc5ZmEwMjE3NTVkN2MzNyAgbm9kZS12MjIuMjIuMC1saW51eC14
NjQudGFyLnh6Ci1zaGEyNTYgIDRjMTM4MDEyYmI1MzUyZjQ5ODIyYThmM2U2ZDFkYjcxZTAwNjM5
ZDBjMzZkNWI2NzU2ZjkxZTRjNmYzMGI2ODMgIG5vZGUtdjIyLjIyLjAudGFyLnh6CisjIEZyb20g
aHR0cHM6Ly9ub2RlanMub3JnL2Rpc3QvdjIyLjIzLjIvU0hBU1VNUzI1Ni50eHQuYXNjCitzaGEy
NTYgIGZmZjQwNzhjNWRlZjY1ODU3N2Y5MmM4OGRiN2RiM2JjMDA3MjkyNGJmYjkzZmU1MmMxZTc0
NGE1NGU5NGFiYjggIG5vZGUtdjIyLjIzLjItbGludXgtYXJtNjQudGFyLnh6CitzaGEyNTYgIGVm
OGYyNmEzZGUxOWFjZDhjMjM1NDhlNmMzY2ZjMjA1MjYxMGIwZTY3YWJiNWZkNjRkYmQ5MmM4YjFj
MTI0NWIgIG5vZGUtdjIyLjIzLjItbGludXgtYXJtdjdsLnRhci54egorc2hhMjU2ICBlMmJhMTAx
MTBhZDM0MDk2YzA1MWZlNDcxMzRmY2QxMjE3NWVjYzQ4ZTdlODc5ZDdkNGM3OGI3MGNmNjY0NDJj
ICBub2RlLXYyMi4yMy4yLWxpbnV4LXBwYzY0bGUudGFyLnh6CitzaGEyNTYgIGQ2MGFjZmUwMGEy
OTMyMjU0YmIwYWQyMGUwMWIwZDc0Mzk3YTA4NzU1OTVkZTcxOTY1NGIyMTRmNGIwM2YzMDcgIG5v
ZGUtdjIyLjIzLjItbGludXgteDY0LnRhci54egorc2hhMjU2ICBiYmU3NjhkZjhkNTgxNWQ3ZmE3
NjEyNDA1Mjk4NTMzMjQ1MmUwYTQ3NDJkMzlmMzIwMjc1NTBkMWFhYjhmNmZiICBub2RlLXYyMi4y
My4yLnRhci54egorCiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICBlOTkxZDgxNDk3YTg1
YmIyNGZjNmJmZmFlMGEzNjM3YTZhY2NkNmM2YmM1Y2UxZjJjNTY5OGJkNTU1Y2Y5ZDQ5ICBMSUNF
TlNFCitzaGEyNTYgIGM3MzhhZTQxM2NmNTYxZjE3NGUzNGY2OTYxZjhjYTQ1OGFhZTIzNjlhNzM2
NDBkZGE2MjM0YzYyOWI5OGJjYzQgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvbm9kZWpz
L25vZGVqcy5tayBiL3BhY2thZ2Uvbm9kZWpzL25vZGVqcy5tawppbmRleCA5ZjAxZDYwYmFhLi4x
MTQ3MjQ1NTA0IDEwMDY0NAotLS0gYS9wYWNrYWdlL25vZGVqcy9ub2RlanMubWsKKysrIGIvcGFj
a2FnZS9ub2RlanMvbm9kZWpzLm1rCkBAIC01LDcgKzUsNyBAQAogIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKIAogIyBfVkVSU0lPTiwgX1NPVVJDRSBhbmQgX1NJVEUgbXVzdCBiZSBrZXB0IGVtcHR5
IHRvIGF2b2lkIGRvd25sb2FkaW5nIGFueXRoaW5nCi1OT0RFSlNfQ09NTU9OX1ZFUlNJT04gPSAy
Mi4yMi4wCitOT0RFSlNfQ09NTU9OX1ZFUlNJT04gPSAyMi4yMy4yCiBOT0RFSlNfQ09NTU9OX1NP
VVJDRSA9IG5vZGUtdiQoTk9ERUpTX0NPTU1PTl9WRVJTSU9OKS50YXIueHoKIE5PREVKU19DT01N
T05fU0lURSA9IGh0dHBzOi8vbm9kZWpzLm9yZy9kaXN0L3YkKE5PREVKU19DT01NT05fVkVSU0lP
TikKIAotLSAKMi41NS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
