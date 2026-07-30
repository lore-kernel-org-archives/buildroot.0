Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B505DC531D0
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 07:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 504636061C;
	Thu, 30 Jul 2026 07:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wQIa4zygUmg8; Thu, 30 Jul 2026 07:59:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42282607B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785398392;
	bh=J3aO+5hsXoYA8Q1RV+wczKYIbFNQLbYlus4GlFi9yPg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=miWAgZAnLhU5tohJdkIopFi9zvPoDlbiCXpOzyBDbFxG8ogdP55DbWrLH7ybSoJvB
	 1tkK/Ej3LxyZbGskhwyTOY1YuQBIP1fVI4Bd1Hnz15u7ewp51KYymL3rxGbs8Gtm5k
	 sl5EZY9EBYUJGq1WJSI5E2I+HY6dpjWnDnT21KzZ1dwE8LUuSZehLf+fTb05VcCYKi
	 pcELrKSw2PWY0yACCYBYTBPQ4IeUupom3f6oo4nGRzACWh25VAw7ZtyKXxhxqKaRgS
	 MpM80NlRAjznvjYMgGpkO9d8InVkuhoIQ2grOBIej505wy3drNkhrtdvIHl6Y40S4O
	 fihGO9nWqTvrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42282607B1;
	Thu, 30 Jul 2026 07:59:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0605727B
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 07:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC3A280DF6
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 07:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xlFlXvIn7_L6 for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 07:59:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A8CD280D9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8CD280D9D
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8CD280D9D
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 07:59:49 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-47f84023916so1713464f8f.3
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 00:59:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785398387; x=1786003187;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=VUH8VPQbs26J7Amm0sWE7DoSvwAxM3BzrIIvy2qRu4Q=;
 b=bdtx0VWb3PeRMSMa6j/CgC36zQneD+HtqucuvDabuGoqA110dnQVnbPzyn7qqWuh86
 5PfPqLeijG6kgrpRlIkbontpfCejX1G2VArV6BRh+JGgSHeoJYer/e+UeTdZKrPyPZQJ
 VwhF5ZLwXliyI5pusC1DR3QmNmLAJcdePFaCwNJCvlZNu9d7cSCdCq+/GU6Fg2/XXvJI
 l4pXih+t26GiYMoATqZDojqp2nQBov8X3m5nbV1F+nlz18kEAS92gyhz2cV+1odW+iKS
 EDhV8X77c//eaI0x1bafdGGM1A/TcckvGteMrza2wcojG1pckT7U5wMOo1/m8AEhU7wP
 kBjw==
X-Gm-Message-State: AOJu0Yybv5xRH+TnN3sjmsruBFieFZhhkdka4o9OBXcuQ7jeLof7UfI+
 hN1e1MB/zXmRKncc8EYWxzhN/VKPow9gNMhS3t4ti6fxXESZCLzCVHijKmEebvDnKt4=
X-Gm-Gg: AR+sD12w8zHHErYbiS4dfaO3TKp6szaFzBS3SF7Qu0qODaRbtvqsGGkBIdqJa2s/8Y3
 /8ugOvBH+XiuKzSCwt+zSl06ftdZQRWh8ICVR0ZaVYdZUqab0uyZHrIad5UImtJ/uFDVggUQ5Jy
 FMUOnQsFPu4Uli03ivWUMUfiFTfa1FEzs8+f7BQoFRbhmJHID6IT4OsCVx1KAnmA8ZhPhQ6qqXO
 6O2zFi9hCUFuc60++NPyh5VOguWuk7fU8eNbIRB8n1pvadTfJk1HFoswAuxpw2qg3joGNEbg3R/
 LLA5jI8+Xf9GnEkMGkhk7yOHNsb9SvJFS1z9iV0j/Nvy4z9trE/UtkzHgOJeyboh9tp9Mm29lUd
 FEldf80/ldJ0lZYciW+TGs9+hII9W+ZsbBoCJGDf6LjvFkDdPtuGFHNFW9HVqjlNAD2ClYcZtLh
 RsGakQiD+w0/WKENyW9qyeBAfa9a/G3Rwrk8jXzB5g16PMz9I6mT/rOXx5+J6nF5au44ijebKch
 PeR90R9YYtQSleppe+awbgxJ2nItdZ/HqzM
X-Received: by 2002:a05:600c:8707:b0:493:c182:6b08 with SMTP id
 5b1f17b1804b1-49800ed12f2mr18767565e9.36.1785398387387; 
 Thu, 30 Jul 2026 00:59:47 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.69.50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4980120b42csm39007995e9.10.2026.07.30.00.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2026 00:59:47 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Jul 2026 10:59:39 +0300
Message-ID: <20260730075941.7679-2-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730075941.7679-1-flaviu.nistor@gmail.com>
References: <20260730075941.7679-1-flaviu.nistor@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785398387; x=1786003187; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=VUH8VPQbs26J7Amm0sWE7DoSvwAxM3BzrIIvy2qRu4Q=;
 b=mtKqSSJwqPsKJ/MgWFvGWo7SNF2o1i9E937nTasTEGkmo422yf/TtNhz+Vx+eqqOE2
 w/fDSV+IvskTc/LjR/fzu8YbkHYORua00vBNeI9cAYGQVSzIZry5m1vmKiJMmD2Mu5Ed
 xgWZsE9trgWQ0cYGDoDyeznOBv4NG5+YcdtbGmCV31oKIMDVg+5eJ4PuS7OwmuQ758rR
 BrqjeElXuBme3EddJB5BnmvwImTgpDlCa2vwiqmO6z5OVW7mu3Q7z+OCcZztbVBhoEOb
 6tiaPMmGURA+euXqMotD+BT+RkgN1nfb+/VySwzAak9qhcnMmOg7VWGDnjz8PCMQKt1j
 VyTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=mtKqSSJw
Subject: [Buildroot] [PATCH v4 2/3] package/python-snappy: bump version to
 0.7.2
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
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RXZlbiBpZiB0aGVyZSBpcyBhIDAuNy4zIG9uIFB5cGksIHRoZXJlIGlzIG5vIDAuNy4zIHJlbGVh
c2UKb24gdGhlIHByb2plY3QgaG9tZXBhZ2UsIGhlbmNlIHRoZSBidW1wIHRvIDAuNy4yLgpTaW5j
ZSAwLjcuMCBpcyBzd2l0Y2hlZCBmcm9tIHNuYXBweSBsaWJyYXJ5IHRvIGNyYW1qYW0gc28KdXBk
YXRlIHRoZSBQWVRIT05fU05BUFBZX0RFUEVOREVOQ0lFUy4KQWRkIGFsc28gUFlUSE9OX1NOQVBQ
WV9TT1VSQ0UgZm9yIGNvcnJlY3QgcGFja2FnZSBvbiBQeXBpLgoKU2lnbmVkLW9mZi1ieTogRmxh
dml1IE5pc3RvciA8Zmxhdml1Lm5pc3RvckBnbWFpbC5jb20+Ci0tLQpDaGFuZ2VzIGluIHY0Ogot
IEFkZCBhbHNvIHRlc3RzIGZvciBweXRob24tc25hcHB5IGFzIGluZGljYXRlZCBieSBKdWxpZW4g
T2xpdmFpbi4KLSBNb3JlIGNsZWFuIHBhY2thZ2UgQ29uZmlnLmluCi0gTGluayB0byB2MzogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNzI0MDY1MDA0LjIxNzQxMS0xLWZsYXZpdS5u
aXN0b3JAZ21haWwuY29tLwpDaGFuZ2VzIGluIHYzOgotIEFkZCBuZXcgcGFja2FnZSBjcmFtamFt
IGFuZCB0byBmaXggZXJyb3IgaW5kaWNhdGVkIGJ5IEp1bGllbiBPbGl2YWluLgotIExpbmsgdG8g
djI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDcxNzA2MTk0My40NDkxLTEtZmxh
dml1Lm5pc3RvckBnbWFpbC5jb20vCkNoYW5nZXMgaW4gdjI6Ci0gRml4IGVycm9yIGluZGljYXRl
ZCBieSBKdWxpZW4gT2xpdmFpbiB3aGVuIHJ1bm5pbmcgbWFrZSBweXRob24tc25hcHB5LWxlZ2Fs
LWluZm8uCi0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNDA5
MTUyNTIwLjU4OTQtMS1mbGF2aXUubmlzdG9yQGdtYWlsLmNvbS8KCiBERVZFTE9QRVJTICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArKysrCiBwYWNrYWdlL3B5dGhvbi1zbmFwcHkv
Q29uZmlnLmluICAgICAgICAgIHwgNyArKy0tLS0tCiBwYWNrYWdlL3B5dGhvbi1zbmFwcHkvcHl0
aG9uLXNuYXBweS5oYXNoIHwgNCArKy0tCiBwYWNrYWdlL3B5dGhvbi1zbmFwcHkvcHl0aG9uLXNu
YXBweS5tayAgIHwgNyArKysrLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyks
IDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmlu
ZGV4IDkzNTE5NTc0YzkuLmRiZTA1Yjc4MDYgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIv
REVWRUxPUEVSUwpAQCAtMTEzNSw3ICsxMTM1LDExIEBAIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0
cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX25ldHdvcmttYW5hZ2VyX2dvaS5weQogRjoJc3VwcG9ydC90
ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fcHlyb3V0ZTIucHkKIAogTjoJRmxhdml1
IE5pc3RvciA8Zmxhdml1Lm5pc3RvckBnbWFpbC5jb20+CitGOglwYWNrYWdlL3B5dGhvbi1jbGlj
ay8KIEY6CXBhY2thZ2UvcHl0aG9uLWNyYW1qYW0vCitGOglwYWNrYWdlL3B5dGhvbi1yaWNoLwor
RjoJcGFja2FnZS9weXRob24tc21tYXAyLworRjoJcGFja2FnZS9weXRob24tc25hcHB5LwogCiBO
OglGbMOhdmlvIFRhcGFqw7NzIDxmbGF2aW8udGFwYWpvc0BuZXd0ZXNjLmNvbS5icj4KIEY6CWNv
bmZpZ3MvYXN1c190aW5rZXItc19yazMyODhfZGVmY29uZmlnCmRpZmYgLS1naXQgYS9wYWNrYWdl
L3B5dGhvbi1zbmFwcHkvQ29uZmlnLmluIGIvcGFja2FnZS9weXRob24tc25hcHB5L0NvbmZpZy5p
bgppbmRleCBmZDdmODQwNTBmLi5lMTNjNmFiYWRiIDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhv
bi1zbmFwcHkvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvcHl0aG9uLXNuYXBweS9Db25maWcuaW4K
QEAgLTEsMTIgKzEsOSBAQAogY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9TTkFQUFkKIAlib29s
ICJweXRob24tc25hcHB5IgotCWRlcGVuZHMgb24gQlIyX0lOU1RBTExfTElCU1REQ1BQICMgc25h
cHB5Ci0Jc2VsZWN0IEJSMl9QQUNLQUdFX1NOQVBQWQorCWRlcGVuZHMgb24gIUJSMl9BUk1fQ1BV
X0FSTVY1CSNjcmFtamFtCisJc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9DUkFNSkFNCiAJaGVs
cAogCSAgUHl0aG9uIGxpYnJhcnkgZm9yIHRoZSBzbmFwcHkgY29tcHJlc3Npb24gbGlicmFyeSBm
cm9tCiAJICBHb29nbGUuCiAKIAkgIGh0dHA6Ly9naXRodWIuY29tL2FuZHJpeC9weXRob24tc25h
cHB5Ci0KLWNvbW1lbnQgInB5dGhvbi1zbmFwcHkgbmVlZHMgYSB0b29sY2hhaW4gdy8gQysrIgot
CWRlcGVuZHMgb24gIUJSMl9JTlNUQUxMX0xJQlNURENQUApkaWZmIC0tZ2l0IGEvcGFja2FnZS9w
eXRob24tc25hcHB5L3B5dGhvbi1zbmFwcHkuaGFzaCBiL3BhY2thZ2UvcHl0aG9uLXNuYXBweS9w
eXRob24tc25hcHB5Lmhhc2gKaW5kZXggYzRkYmM3MjA3Ny4uMmY0MGI2YzUzMSAxMDA2NDQKLS0t
IGEvcGFja2FnZS9weXRob24tc25hcHB5L3B5dGhvbi1zbmFwcHkuaGFzaAorKysgYi9wYWNrYWdl
L3B5dGhvbi1zbmFwcHkvcHl0aG9uLXNuYXBweS5oYXNoCkBAIC0xLDUgKzEsNSBAQAogIyBtZDUs
IHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9weXRob24tc25hcHB5L2pzb24KLW1k
NSAgZmM4NGNmYTM1MjZmYmEwNmQ2NmYwZDBiMmU3NjQzMDAgIHB5dGhvbi1zbmFwcHktMC42LjEu
dGFyLmd6Ci1zaGEyNTYgIGI2YTEwN2FiMDYyMDZhY2M1MzU5ZDRjNTYzMmJkOWIyMmQ0NDg3MDJh
NzliMzE2OWIwYzYyZTBmYjgwOGJiMmEgIHB5dGhvbi1zbmFwcHktMC42LjEudGFyLmd6CittZDUg
IDA0YTRlNThiMGE5MzI0MDNiYjI4NTkwMGU2N2M3NzhkICBweXRob25fc25hcHB5LTAuNy4yLnRh
ci5negorc2hhMjU2ICAwNGJmMTgyZjlkOWY2N2I3YTg0NmRhZTJmMWRmMzYxODBjZWVlZThkMzM4
MGU0YjY3OTlkZWZmNTI3MmM0OTc4ICBweXRob25fc25hcHB5LTAuNy4yLnRhci5negogIyBMb2Nh
bGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKIHNoYTI1NiAgZDAwN2NiMDVmMTQzZDk5ZDE2
ZDVjZDBkMWJmMjkxZGFmMDM3YWRiMzY4MDAzNDRlNDQwZWMyNmVkYjkzOGY5YSAgTElDRU5TRQpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tc25hcHB5L3B5dGhvbi1zbmFwcHkubWsgYi9wYWNr
YWdlL3B5dGhvbi1zbmFwcHkvcHl0aG9uLXNuYXBweS5tawppbmRleCBlODBhYTg2MWRmLi41ZDM0
YjZkNDkzIDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhvbi1zbmFwcHkvcHl0aG9uLXNuYXBweS5t
aworKysgYi9wYWNrYWdlL3B5dGhvbi1zbmFwcHkvcHl0aG9uLXNuYXBweS5tawpAQCAtNCwxMSAr
NCwxMiBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotUFlUSE9OX1NOQVBQWV9WRVJT
SU9OID0gMC42LjEKLVBZVEhPTl9TTkFQUFlfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9z
dGVkLm9yZy9wYWNrYWdlcy85OC83YS80NGEyNGJhZDk4MzM1YjJjNzJlNGNhZGNkZWNmNzlmNTAx
OTdkMWJhYjlmMjJmODYzYTI3NGYxMDRiOTYKK1BZVEhPTl9TTkFQUFlfVkVSU0lPTiA9IDAuNy4y
CitQWVRIT05fU05BUFBZX1NPVVJDRSA9IHB5dGhvbl9zbmFwcHktJChQWVRIT05fU05BUFBZX1ZF
UlNJT04pLnRhci5negorUFlUSE9OX1NOQVBQWV9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25o
b3N0ZWQub3JnL3BhY2thZ2VzL2NiLzUyL2FjZDg3NTgzMTc1ZmE5MzBlNDM4NWY4YTYxNjRlYjU5
MDlhY2Q2ODNjMGU2MmVlMDFkNDFkZTgxOTVhMgogUFlUSE9OX1NOQVBQWV9TRVRVUF9UWVBFID0g
c2V0dXB0b29scwogUFlUSE9OX1NOQVBQWV9MSUNFTlNFID0gQlNELTMtQ2xhdXNlCiBQWVRIT05f
U05BUFBZX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCi1QWVRIT05fU05BUFBZX0RFUEVOREVOQ0lF
UyA9IHNuYXBweQorUFlUSE9OX1NOQVBQWV9ERVBFTkRFTkNJRVMgPSBob3N0LXB5dGhvbi1jcmFt
amFtIHB5dGhvbi1jcmFtamFtCiAKICQoZXZhbCAkKHB5dGhvbi1wYWNrYWdlKSkKLS0gCjIuMzQu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
