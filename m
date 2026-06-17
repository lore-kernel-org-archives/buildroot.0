Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD239CD98F6
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 17:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A53360664;
	Wed, 17 Jun 2026 17:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WTuHJz7AYI1I; Wed, 17 Jun 2026 17:11:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 860F76065C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781716260;
	bh=Fpkr7A2IZH5eYrUxBY23D6J0pPCW5QESzX48g5P2y8E=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LPzz2Aexj6rfCHrReF6YKwKjruE3tAaCMbXoEHnJNlkfiK0pL+qi/FbN14kWliCHi
	 R0MSOBYtz6n4AtXmdQeKw0SXzvzTTiuXwXMNAiU/A8UyZLcYDJzZaR33SgyAB75WL+
	 EQiLAhpCJ4BT7tRodHnaNqk+Rg/zzbq1HJVPzwcGUF17wz/Xu3r8t1v2lpWArLQ5eY
	 v3hBwhO5gvFIXatNE9uzbfBPBo5UsYIU+xnjo4MPPGhnOxCmPsJDdQCI2gH3hhqm4W
	 PU1cRXOQn19AwDi5yzS2d/KZQ8BirKIuMD/mmGdvKF1VmFCT9H8BTJch+cWAWZ0mH9
	 ncM+oftKmEpCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 860F76065C;
	Wed, 17 Jun 2026 17:11:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87ED4347
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 17:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A76E81125
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 17:10:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pzciLoj61xcV for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 17:10:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 094CE81124
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 094CE81124
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 094CE81124
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 17:10:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F2CC2BC6;
 Wed, 17 Jun 2026 10:10:48 -0700 (PDT)
Received: from [127.0.1.1] (X72Y076X74-2.nice.arm.com [10.34.125.15])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACE853F915;
 Wed, 17 Jun 2026 10:10:52 -0700 (PDT)
From: =?utf-8?q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Date: Wed, 17 Jun 2026 19:10:40 +0200
Message-Id: <20260617-pmem-v1-0-bac54881145c@arm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABDVMmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM0Nz3YLc1FxdyySj1LREY8PE1FQTJaDSgqLUtMwKsDHRsbW1AI8DMcV
 WAAAA
X-Change-ID: 20260617-pmem-9b2efa31aee4
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, 
 =?utf-8?q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=944; i=vincent.stehle@arm.com; 
 h=from:subject:message-id;
 bh=0q/VJUkfXpatm7oWLvk0z5jZQEhE43lkRZKTblxUoos=; 
 b=owEBbQGS/pANAwAKActJ+FZ2owaUAcsmYgBqMtUc7s5Z6B+wIi2sr6UW3uPOTSt22KjnRENw8
 un7fsy7EiOJATMEAAEKAB0WIQTXYBSgjlpQEXB4KmzLSfhWdqMGlAUCajLVHAAKCRDLSfhWdqMG
 lPhNB/0YldEOqe2/3oCeKrrwU8Y6Z9plywm7H27bDAUHFevDsyJp54d7dyqc0f7SbLOy5QzXQX9
 zzVjRgH6UAfiVZBor/rX5CURuijwo7ZmU9Ub6YNS9drJNV2B+BchhbZM1cRBipfjdxCInBiuasE
 Vg8bPlDhfUunrWUwikvnMmT6ZD60uOmUNz6ARAsMR+cgnCD/xo0NF4Rj6t5MiPa5Nhl73LP52R4
 MIglJDDNJp9ndDjcJLqbcpl0VRqmInzz93CTYThIUKRTLU3szv0Wn3sPd0c82YbnLWiYZsrfQjb
 kEc1YaiBJaO4RckHeLySiWZTsCXvrStq9HB5Hup1Pb/O9cG5
X-Developer-Key: i=vincent.stehle@arm.com; a=openpgp;
 fpr=D76014A08E5A501170782A6CCB49F85676A30694
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=arm.com; s=foss; 
 t=1781716253; bh=0q/VJUkfXpatm7oWLvk0z5jZQEhE43lkRZKTblxUoos=;
 h=From:Subject:Date:To:Cc:From;
 b=H+Lf4vusU/5oz4OxmQV1tBsF7dIL48wtK/4SRpV9Fehgi36XiBa1pn5/ttGg03QYS
 CzwI/fOErtFqPxxKggi4UMAcbXUjxh8uUPeZSEaSiVv1Lc+fB8qv7iMhq6HwQhfMrP
 VeJjYp3ssJKDgYpmv63LIabjpNwLyHVyKsugjQd0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256
 header.s=foss header.b=H+Lf4vus
Subject: [Buildroot] [PATCH 0/2] aarch64-efi: support net boot with
 devicetree
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

SGVyZSBhcmUgdHdvIHBhdGNoZXMgdG86CgoxLiBBZGQgbXlzZWxmIGluIERFVkVMT1BFUlMgZm9y
IHRoZSBhYXJjaDY0LWVmaSBmaWxlcywKICAgd2hpY2ggdGhlIG5leHQgcGF0Y2ggbW9kaWZpZXMu
CgoyLiBBZGQgc3VwcG9ydCBvZiBuZXQgYm9vdCB3aXRoIGRldmljZXRyZWUgdG8gYWFyY2g2NC1l
ZmksCiAgIHdoaWNoIGJvaWxzIGRvd24gdG8gYWRkaW5nIGEgc21hbGwgTGludXggY29uZmlnIGZy
YWdtZW50LgoKVGhlIHNlY29uZCBwYXRjaCBjb250YWlucyBhbGwgdGhlIHRlY2huaWNhbCBkZXRh
aWxzIGFuZCBkb2N1bWVudHMgaG93IHRvCnRlc3Qgb24gUWVtdS4KClNpZ25lZC1vZmYtYnk6IFZp
bmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KLS0tClZpbmNlbnQgU3RlaGzD
qSAoMik6CiAgICAgIERFVkVMT1BFUlM6IGFkZCBWaW5jZW50IFN0ZWhsw6kgZm9yIGFhcmNoNjQt
ZWZpIGZpbGVzCiAgICAgIGNvbmZpZ3MvYWFyY2g2NF9lZmk6IHN1cHBvcnQgbmV0IGJvb3Qgd2l0
aCBkZXZpY2V0cmVlCgogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDIgKysKIGJvYXJkL2FhcmNoNjQtZWZpL2xpbnV4LXBtZW0tbmV0Ym9vdC5mcmFnbWVu
dCB8ICAzICsrKwogYm9hcmQvYWFyY2g2NC1lZmkvcmVhZG1lLnR4dCAgICAgICAgICAgICAgICAg
IHwgMTEgKysrKysrKysrKysKIGNvbmZpZ3MvYWFyY2g2NF9lZmlfZGVmY29uZmlnICAgICAgICAg
ICAgICAgICB8ICAxICsKIDQgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQotLS0KYmFz
ZS1jb21taXQ6IDY3NDQ5MTMwZTlmZGQ3MWEzOGNhMjY1MzlkZGRmYThjODgyYjE5NzcKY2hhbmdl
LWlkOiAyMDI2MDYxNy1wbWVtLTliMmVmYTMxYWVlNAoKQmVzdCByZWdhcmRzLAotLSAKVmluY2Vu
dC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
