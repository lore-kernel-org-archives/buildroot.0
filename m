Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B567C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 09:21:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74E8161054
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 09:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 74E8161054
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35EDB40368;
	Sun, 17 Oct 2021 09:21:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PP5dDFDQTSHc; Sun, 17 Oct 2021 09:21:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AC5640364;
	Sun, 17 Oct 2021 09:21:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CFDFF1BF3CD
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 09:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEADA6076C
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 09:21:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aol.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KKqtPntWVcIR for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 09:21:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sonic301-31.consmr.mail.ne1.yahoo.com
 (sonic301-31.consmr.mail.ne1.yahoo.com [66.163.184.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A4B360689
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 09:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1634462499; bh=wtDabjIIIvHshHxiC1rJM9Bk0Ayi4G/mRwTXHRmpA64=;
 h=Date:From:Reply-To:To:Subject:References:From:Subject:Reply-To;
 b=WdYSilssMNrANFcBHycnA2cbTViTot3uxJvB0xWpYZzq62LS7Gdn4FHsPiK2Du95N4w5A64GJm6n+uuepPrQ6yEsAyhs87U/9XVycyLwDwWwUQ+wus5lR2G76dXr2WNpftKnJSEsgcMtyLw2CpfxsV/oJNHqStf3VukccR9IAD7EkeXhventRcaO0hkAi0njN+zPVNtElYMHzrbz2AasIZProdVeXyJm9XuqahW9CPiB5Luvn2IPnCRASdVAw7BWne6nIsuP4fBzfeBvwI5o2yMsWslZ344HJH6OdzqZA0tEP7b3CdMY6WuEBu0AbdBIFgfMq274H/uIE8zv8aJgYw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1634462499; bh=pnxdFHpXIdkljy7+FphL3J3WV7sQfbXAG7VCOWzEOcX=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=dgM/Eg14ldyecHQ/4ZS2MLvKfSQezcamxsiSCr9b/K67GB+Nu0J2vjgm90MEh0Kcrjt2qF+xgnrJk8puDt0EmV/Qsb7l/+dS/XONXICL2WQiYbvA4GWQCGwuQ9y/n7RnOdvaLvR997YKcTGo4Uh3Y4MR8Ke+kvb5yf0vl9eNW/xEryA4gQX8QIO0xEZPvsHXHzb6JTUHWQ1RLz663F7Tb9z1ghpGrXQOWWfXXU1sAAbndeMZoT2vD6xqGS6MpFumn27urSSia+UCw1aSJTlv/UWR9k6o4slMxX061SKpZR8Bb+D5xSQuyT7rI5OQvf5/1BHaLmrlmZeEdqsQ4lgFQA==
X-YMail-OSG: _pavW_gVM1nCFCBUykMCxNRgMB7g2KGfx50Se4kno1tQPLZjz.ZUmkrqvvGFGCB
 x8LXJNbR6FdGl.bmLzr3jX3Ttkd3noZM56aI7m9deaAFSH16NKqf3JeU0BKNWMdcScJ0EnjCKOXf
 vDRNOinjm4_EC5b.YxPH8bewhlt2sSGlXf67Sr5fBK0IKCQjkLaQan.xZzgK07c6LzuvmZwA2skC
 94RTiNvRYxSgaGAlOv2pSsF0EhB1wKuMd2fNZY0c8NF2CT4lDSEw0tVZDANTfo65HfPaKvUCV.T2
 h_7.xup9cZ7MK90taxrzEVavkU_p_SX_Pt.5JBp6BdCeDxymMzvSv8W2RCS2RUs9a4qDTS6NzCeV
 z.wF3Uc6mEXaPbshD.XwNp3BnaZHsqPHwl7v4oAk2bZmr6If3.2YxT.QmGIK0ST1dTJOhd_RvBk8
 9n.4DhiC4eeXcEPk.eB44WTipoLtOYTi0t06jlRJWTlu3Wb0BTtlg_s7NZ8TBBup_Tu.ivT8tiWM
 eUIqOHb7783rh85mRQjQ9zHgctU_oUsIG.vSpLbp0tfiPggfJmgK5hYmXth_YlVmzF0R_62CN.Q9
 Z_44RIxSdCIISKlQqAPN.eFGlV3aH6fQ5V4yhcbXKTucEnQhE2NHa83GVSnCYPhhT.Nf8_ECAIvF
 0v7f0HtXF8sWrdr1OYpO6lC07hvoTAQ4HClhjGatmW5m7HsC6ss1YBqrpZV6DpmiAWV2egMfNCPI
 CAAyNardXmDZ78xTAuq0CmjsJUlAaqO5CXNVtREQURygheB91gy0ic7x.Gc9gc7C0l4V1UkyuAma
 AlCrx5Liv5xPy2lT8dABkcqmK6zqdZV8z_RuDa.huaJzn46z0XWLTmxcwWtijWhXA0Ml_QIY_O74
 gAOR53E5O7PdatKNoj7hR1lxHHmcjlhJYqMLZ1_iEvdtS_j3C.W6tsigAExMiPuugyWeogWhDSVy
 wrM0LmuilX_L8Q4CWlQcIXW7_N9xb19kyW6jAJw3Efhw9l6kFM789Ov_l2m7JwsiJ9dq3ljoDhVI
 vjzpZKAD1vSSg0daR_96FuhT.j9YgxOKw_nTJ48rmAF36TjKwk_JLjiIDi0GOjjnMx0f_9Tj0b2U
 QHhu_cS15saPT8j1ONuja97.4mXMPp06wqoFpsg3XbPAlCu.gRzvPkTgoWwr1DsBw32.Lb9o2rZI
 PTmm_scywdBQyYYG7aE5r1XqB1XZnXTv0EALuo0LXBmUAsLeH.dIXySYC6HZXwQHO2BU9GCzgO2n
 j0InUrrAqdA2TipP.PRXryGOLRG2dbz39ggF4I.UYFmmXr0n920c1LmyyB0_12JaisVoaC9DIVVo
 xqeBDwKFkhc9mL7CYzNiPKpECi9GMMyE2eU83czkuurhKzgZwr_bp7.D6dA0IJYVSPXTCQbLKpCZ
 di0yWo99nb_WCVHyVsv1v8yUIRdMW9Pde4_N3Fg2dh1V0Hrj5t4EEiaG5reH3M5wl.m_xztlovn_
 XF70Y8.BYK2nFtbRWdU2g1Z4UMaErhmkAKiT_gA2qHbiMe4C1c59k71z6nZKLDEO_EiuVYCoiHIu
 ZkLuiR0HJGRdklBJiHm6PadsGBjEJMob2SiaZ13qMUjCdUith.U7yhnmLBgQAZLFD6sFFEhBX6eC
 iGzIKOQxMOq7ld8yMhJpIZAEL1Bt5YHvzIA_SPo0PFfEIXx.Rwbpy68_G2IWc9k2wIkkLLatC.bu
 jM1KMsPYjcw43drg4DkqaKrdDRWrEozswpOjYjBNcX0.rz9eaWOh2lylQqPWtJpd3jYGjfu19RLa
 CkuGhATY14Si1FAXwJVehYJnmyJW_8lhqdiluDLtN6oMywLyX6_bGhNgI51Y_52KxUwfPEAZkH0w
 wikkDtf9gEADrVtPBkcF4WOMVyM6gvV0lVrOBycQ8Xra.D.3f2cCxoK9IMDvFk29cOsoUZyOzAs8
 5Jp5gHSWVKOS1n73ktTMOk9VYjZxeV6vzmBlXlpaGi9HkQDBmZ0Ep7TathmLD1GgfWN3Ps7ZBJ1.
 ZEk3qXQT8AfDGb1iYvPkDcwUZ_v4VrhtXQ2SkcEP21fMc9n_iz1C3UA90L9.ko7OjWPlMC30ski1
 HKk9UD4ZvJRAkwJh9Rpp04II3ZxPGNN_njFQD_mQSYgo19ujcA2GVPAA1IPHHP_.gDyoKIBRKD_m
 ok073ODvqhUP.2rXgO1nM2jYI1DxHWyK.9iBw93Lu.k8hUQ--
X-Sonic-MF: <xiangyu.chen@aol.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.ne1.yahoo.com with HTTP; Sun, 17 Oct 2021 09:21:39 +0000
Date: Sun, 17 Oct 2021 09:21:34 +0000 (UTC)
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <810116346.3867627.1634462494722@mail.yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
 boundary="----=_Part_3867626_2121339250.1634462494721"
References: <810116346.3867627.1634462494722.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.19116 aolwebmail
Subject: [Buildroot] [PATCH] boot/at91bootstrap3: add svn repository method
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
From: Xiangyu Chen via buildroot <buildroot@buildroot.org>
Reply-To: Xiangyu Chen <xiangyu.chen@aol.com>
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

------=_Part_3867626_2121339250.1634462494721
Content-Type: multipart/alternative; 
	boundary="----=_Part_3867625_1783800515.1634462494720"

------=_Part_3867625_1783800515.1634462494720
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Dear buildroot maintainer:
=C2=A0Since more and more traditional companies are starting using buildroo=
t=C2=A0=C2=A0with AT91SAMx chipset as their product firmware, much of them =
are still=C2=A0=C2=A0using SVN as their version control system. So add svn =
repository method=C2=A0=C2=A0to AT91bootstrap3 package.
It's a milestone to me that i from a parasite to a buildroot contributor, i=
f=C2=A0there is any incorrect in this patch, feel free to tell me via=C2=A0=
email(xiangyu.chen@aol.com).
Thanks!

Br,Xiangyu
------=_Part_3867625_1783800515.1634462494720
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit


<div style="color:black;font: 10pt Arial, Helvetica, sans-serif;">
<div style="font-size: 13.3333px;">Dear buildroot maintainer:</div>

<div style="font-size: 13.3333px;"><br>
</div>

<div style="font-size: 13.3333px;">&nbsp;Since more and more traditional companies are starting using buildroot&nbsp;</div>

<div style="font-size: 13.3333px;">&nbsp;with AT91SAMx chipset as their product firmware, much of them are still&nbsp;</div>

<div style="font-size: 13.3333px;">&nbsp;using SVN as their version control system. So add svn repository method&nbsp;</div>

<div style="font-size: 13.3333px;">&nbsp;to AT91bootstrap3 package.</div>

<div style="font-size: 13.3333px;"><br>
</div>

<div style="font-size: 13.3333px;">It's a milestone to me that i from a parasite to a buildroot contributor, if&nbsp;</div>

<div style="font-size: 13.3333px;"><span style="background-color: transparent; font-size: 10pt;">there is any incorrect in this patch, feel free to tell me via&nbsp;</span><span style="background-color: transparent; font-size: 10pt;">email(<a href="mailto:xiangyu.chen@aol.com" rel="noopener noreferrer" style="text-decoration-line: underline; color: blue;">xiangyu.chen@aol.com</a>).</span></div>

<div style="font-size: 13.3333px;"><br>
</div>

<div style="font-size: 13.3333px;">Thanks!</div>

<div style="font-size: 13.3333px;"><span style="background-color: transparent; font-size: 10pt;"><br>
</span></div>

<div style="font-size: 13.3333px;"><span style="background-color: transparent; font-size: 10pt;"><br>
</span></div>

<div style="font-size: 13.3333px;"><span style="background-color: transparent; font-size: 10pt;">Br,</span></div>

<div style="font-size: 13.3333px;">Xiangyu</div>
</div>

------=_Part_3867625_1783800515.1634462494720--

------=_Part_3867626_2121339250.1634462494721
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="=?utf-8?B?MDAwMS1ib290LWF0OTFib290c3RyYXAzLWFkZC1zdm4tcmVwb3NpdG9yeS1tZXRob2QucGF0Y2g=?="
Content-ID: <QBM4N4xL7dkUr4RCaGw9>

RnJvbSBkZmQ2NGY3NDBiMzQ2ZDYwODVhM2Q1YWYxMzRiZDhmNDRjODRiMDg1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBDSEVOIFhpYW5neXUgPHhpYW5neXUuY2hlbkBhb2wuY29tPgpE
YXRlOiBTdW4sIDE3IE9jdCAyMDIxIDE2OjQ1OjMzICswODAwClN1YmplY3Q6IFtQQVRDSF0gYm9v
dC9hdDkxYm9vdHN0cmFwMzogYWRkIHN2biByZXBvc2l0b3J5IG1ldGhvZAoKU2luY2UgbW9yZSBh
bmQgbW9yZSB0cmFkaXRpb25hbCBjb21wYW5pZXMgYXJlIHN0YXJ0aW5nIHVzaW5nIGJ1aWxkcm9v
dAp3aXRoIEFUOTFTQU14IGNoaXBzZXQgYXMgdGhlaXIgcHJvZHVjdCBmaXJtd2FyZSwgbXVjaCBv
ZiB0aGVtIGFyZSBzdGlsbAp1c2luZyBTVk4gYXMgdGhlaXIgdmVyc2lvbiBjb250cm9sIHN5c3Rl
bS4gU28gYWRkIHN2biByZXBvc2l0b3J5IG1ldGhvZAp0byBBVDkxYm9vdHN0cmFwMyBwYWNrYWdl
LgotLS0KIGJvb3QvYXQ5MWJvb3RzdHJhcDMvQ29uZmlnLmluICAgICAgICAgfCAxNCArKysrKysr
KysrKy0tLQogYm9vdC9hdDkxYm9vdHN0cmFwMy9hdDkxYm9vdHN0cmFwMy5tayB8ICAzICsrKwog
MiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2Jvb3QvYXQ5MWJvb3RzdHJhcDMvQ29uZmlnLmluIGIvYm9vdC9hdDkxYm9vdHN0cmFw
My9Db25maWcuaW4KaW5kZXggNjUwZDNhMjNjOC4uM2NmYzBiYmUxNCAxMDA2NDQKLS0tIGEvYm9v
dC9hdDkxYm9vdHN0cmFwMy9Db25maWcuaW4KKysrIGIvYm9vdC9hdDkxYm9vdHN0cmFwMy9Db25m
aWcuaW4KQEAgLTMwLDYgKzMwLDE0IEBAIGNvbmZpZyBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAz
X0NVU1RPTV9HSVQKIAkgIFRoaXMgb3B0aW9uIGFsbG93cyBCdWlsZHJvb3QgdG8gZ2V0IHRoZSBB
VDkxIEJvb3RzdHJhcCAzCiAJICBzb3VyY2UgY29kZSBmcm9tIGEgR2l0IHJlcG9zaXRvcnkuCiAK
K2NvbmZpZyBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0NVU1RPTV9TVk4KKwlib29sICJDdXN0
b20gU1ZOIHJlcG9zaXRvcnkiCisJaGVscAorCSAgVGhpcyBvcHRpb24gYWxsb3dzIEJ1aWxkcm9v
dCB0byBnZXQgdGhlIEFUOTEgQm9vdHN0cmFwIDMKKwkgIHNvdXJjZSBjb2RlIGZyb20gYSBTdWJ2
ZXJzaW9uIHJlcG9zaXRvcnkKKworCisKIGNvbmZpZyBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAz
X0NVU1RPTV9UQVJCQUxMCiAJYm9vbCAiQ3VzdG9tIHRhcmJhbGwiCiAKQEAgLTM5LDcgKzQ3LDcg
QEAgY29uZmlnIEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDNfQ1VTVE9NX1RBUkJBTExfTE9DQVRJ
T04KIAlzdHJpbmcgIlVSTCBvZiBjdXN0b20gQVQ5MUJvb3RzdHJhcCB0YXJiYWxsIgogCWRlcGVu
ZHMgb24gQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQM19DVVNUT01fVEFSQkFMTAogCi1pZiBCUjJf
VEFSR0VUX0FUOTFCT09UU1RSQVAzX0NVU1RPTV9HSVQKK2lmIEJSMl9UQVJHRVRfQVQ5MUJPT1RT
VFJBUDNfQ1VTVE9NX0dJVCB8fCBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0NVU1RPTV9TVk4K
IAogY29uZmlnIEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDNfQ1VTVE9NX1JFUE9fVVJMCiAJc3Ry
aW5nICJVUkwgb2YgY3VzdG9tIHJlcG9zaXRvcnkiCkBAIC00Nyw3ICs1NSw3IEBAIGNvbmZpZyBC
UjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0NVU1RPTV9SRVBPX1VSTAogY29uZmlnIEJSMl9UQVJH
RVRfQVQ5MUJPT1RTVFJBUDNfQ1VTVE9NX1JFUE9fVkVSU0lPTgogCXN0cmluZyAiQ3VzdG9tIHJl
cG9zaXRvcnkgdmVyc2lvbiIKIAloZWxwCi0JICBSZXZpc2lvbiB0byB1c2UgaW4gdGhlIHR5cGlj
YWwgZm9ybWF0IHVzZWQgYnkgR2l0CisJICBSZXZpc2lvbiB0byB1c2UgaW4gdGhlIHR5cGljYWwg
Zm9ybWF0IHVzZWQgYnkgR2l0IG9yIFNWTgogCSAgRS5HLiBhIHNoYSBpZCwgYSB0YWcsIGJyYW5j
aCwgLi4KIAogZW5kaWYKQEAgLTU3LDcgKzY1LDcgQEAgY29uZmlnIEJSMl9UQVJHRVRfQVQ5MUJP
T1RTVFJBUDNfVkVSU0lPTgogCWRlZmF1bHQgInY0LjAuMCIgaWYgQlIyX1RBUkdFVF9BVDkxQk9P
VFNUUkFQM19MQVRFU1RfVkVSU0lPTgogCWRlZmF1bHQgInYzLjEwLjMiIGlmIEJSMl9UQVJHRVRf
QVQ5MUJPT1RTVFJBUDNfTEFURVNUX1ZFUlNJT05fM1gKIAlkZWZhdWx0IEJSMl9UQVJHRVRfQVQ5
MUJPT1RTVFJBUDNfQ1VTVE9NX1JFUE9fVkVSU0lPTiBcCi0JCWlmIEJSMl9UQVJHRVRfQVQ5MUJP
T1RTVFJBUDNfQ1VTVE9NX0dJVAorCQlpZiBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0NVU1RP
TV9HSVQgfHwgQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQM19DVVNUT01fU1ZOCiAJZGVmYXVsdCAi
Y3VzdG9tIglpZiBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0NVU1RPTV9UQVJCQUxMCiAKIGNv
bmZpZyBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0NVU1RPTV9QQVRDSF9ESVIKZGlmZiAtLWdp
dCBhL2Jvb3QvYXQ5MWJvb3RzdHJhcDMvYXQ5MWJvb3RzdHJhcDMubWsgYi9ib290L2F0OTFib290
c3RyYXAzL2F0OTFib290c3RyYXAzLm1rCmluZGV4IDFlMmEzYTQ0YjAuLmY2MDkxNzZhM2YgMTAw
NjQ0Ci0tLSBhL2Jvb3QvYXQ5MWJvb3RzdHJhcDMvYXQ5MWJvb3RzdHJhcDMubWsKKysrIGIvYm9v
dC9hdDkxYm9vdHN0cmFwMy9hdDkxYm9vdHN0cmFwMy5tawpAQCAtMTUsNiArMTUsOSBAQCBlbHNl
IGlmZXEgKCQoQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQM19DVVNUT01fR0lUKSx5KQogQVQ5MUJP
T1RTVFJBUDNfU0lURSA9ICQoY2FsbCBxc3RyaXAsJChCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAz
X0NVU1RPTV9SRVBPX1VSTCkpCiBBVDkxQk9PVFNUUkFQM19TSVRFX01FVEhPRCA9IGdpdAogQlJf
Tk9fQ0hFQ0tfSEFTSF9GT1IgKz0gJChBVDkxQk9PVFNUUkFQM19TT1VSQ0UpCitlbHNlIGlmZXEg
KCQoQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQM19DVVNUT01fU1ZOKSx5KQorQVQ5MUJPT1RTVFJB
UDNfU0lURV9NRVRIT0QgPSBzdm4KK0JSX05PX0NIRUNLX0hBU0hfRk9SICs9ICQoQVQ5MUJPT1RT
VFJBUDNfU09VUkNFKQogZWxzZQogQVQ5MUJPT1RTVFJBUDNfU0lURSA9ICQoY2FsbCBnaXRodWIs
bGludXg0c2FtLGF0OTFib290c3RyYXAsJChBVDkxQk9PVFNUUkFQM19WRVJTSU9OKSkKIGVuZGlm
Ci0tIAoyLjI2LjIKCg==

------=_Part_3867626_2121339250.1634462494721
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

------=_Part_3867626_2121339250.1634462494721--
