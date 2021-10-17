Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F5CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 09:33:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C115460F8F
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 09:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C115460F8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E09B82A26;
	Sun, 17 Oct 2021 09:32:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ANH1g3eyx2Yo; Sun, 17 Oct 2021 09:32:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C76C082A2E;
	Sun, 17 Oct 2021 09:32:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D5D101BF3CD
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 09:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF80960794
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 09:32:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aol.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G0ayIesoVmVy for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 09:32:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sonic315-22.consmr.mail.ne1.yahoo.com
 (sonic315-22.consmr.mail.ne1.yahoo.com [66.163.190.148])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B2C76077D
 for <buildroot@uclibc.org>; Sun, 17 Oct 2021 09:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1634463175; bh=S3hXK533fXCTYtofCC6pO2UHfxT8lilDl1kwkuSbCpw=;
 h=Date:From:Reply-To:To:Subject:References:From:Subject:Reply-To;
 b=lfNwP1K4gjuD6CMQ/2wZZNngBb5nQ5JmOIqp3kTupy/XvtZ8vaJxHcE2vkCUJ2I2VxUUzXV7CcwrnJKKOTEp5UABcMO6RLBJVTim+9TJnbxIuT67hGwZWlUUMSvLmZ0n6a1lXu0qJ42q5NWsnp6JLAKeAKvTcI6cmyZVGUng4xtWjaf9ZM7FkUM6021svV0wbt5O1aLxxgW/JBbx4+ZtxVRqRx8twpTYX7PtVy2J3X8hHGgKamUJlp5LlTpE7+x/hOPCFIV6c8z6mc/REN9OJvL1XIMX845lkrqORDLHaSDlnsZ9I8STeAiib/ZOZapYs9MaP15+QRsx5ACfTLVt6g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1634463175; bh=QfP9nLQpGp/t0XJdJM/76wMWgv9sQs4PjSll4j6BuDx=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=TdjAubYYzzhEAVuzWLCTYGS1DAtqtneQauLEfQKT2CnjTCHNkqQPIK/sAfjujYpTdkGCbWhB6CPXEu3W1bvQyWOOhdT+4ACmbGpBpN+pwZ95r+O88WHFno/QlFldafaJudEd5z1KJhfHZa9ii4HJUOP1PVbo+jz/1BxSs2lltGCM7Tq/MMfa5v9DlxLzw2B2ih9YAWYOG/vX+hoa31QBteYhQysD3WmrpiCnOlFPUke1uasQk3FKjEKRbShVBexoBEuU5u3Pil/JKT8tQbMKLIiGWNzgah/ZYuFXa8tAGY3IkWylpZXMVH213bYwaO/VhdevoKL+kMcVbPvdeUnl4A==
X-YMail-OSG: xOnURDIVM1kRGhwY1aKGUIjAQC706xpw1um5TRyxXOAakaGUV0h9lqxEw9usIaO
 dQH9PNXltnWNrB3u.otLylkTexLT2UFAtOirf12yXh1iM8pK6XVWu45lXED.b97Ddos7vcA3tymO
 Sp7sRkSM5u_pNL.ptB5DjHXknB3uFhGOc7yUOe4AI0Neq4MHuim.SA2zDxcl8YHPmsGjnPEADSz3
 l4xTleVy6qEgt4AbRngwjGSoBVOD1IUqExGTBkTkhhHVGpx3PiLvNwbkwF_TFTHTxB4HvMhjtcN9
 .M65LwbJVENL8GwlwprqhJmFlmkEdSc5ozN82P9kqLHVqkHPLnWe0iOln3qZKK0eHV8U3TnXzplb
 YcSFy5Mj.kMMiQTL50g6od6qZj4gZgUQg39iLmJb31L_Dk7mhg1SG0vyAEDxqpt.zok4YFM03yM6
 H8SuCDsjxTfb9j4QO4LCNlwcSd6uLmnPue_Uq82Tqhs5dqNcHP6S1MHyPNsmX0t5LONUL_qSJbHu
 0pwWVa4RvTnmte4wasYhDhEim.1_sKAn_7MZjSYgaDfphhMubXkhmdPvaR1jrwocZVnSAZPR_UB1
 wDG4WrfK_KieM1vY4JpxkFx0Cbm66ACuQPSLf9RFW5N2iygydVjKGBOQEnl4JVG6Rg2f.91ISW67
 WyNc_UMY5AXrF2v8nc5mQSfF3Uzv76Ya1cNQhcjjl6hK6AYr5m8JAfHFdxgUXwcgPutprOIF6jTz
 O0IilPWKnwP8UBGwEUyeroY2dVI1nqA0L.MdRJt5w9OrIXX83VOQnrzNyssDgwmbkuh._WTLX._y
 BYYtwTmLvQ6r5xvrxZXsP_jh363BTqghQztuO.Xf1or.jK78p6VHF2FJyPDJUJs4p4BP4s7oNyfV
 PBie74Gc6rKDKcqEFc1OJs2PbsSQvtz.Y9WxfVnnBviVakYqmB3KEUPELzvOwdCWN3XK7IRefQL_
 2CBAqVVGuiF_uuqC_pytxldwj.5aEYvMdpVsF4seN1Upbf8GJJ19hLVXoHWkX_5dbBNFOD8fAaF7
 fxjYLuegAWPtaVIR.0TkkP44.phyBux8owbRUeyYioJKCORB7g3hn5XA3yRuqhSyBNWYiNW.791.
 pl4PrxgToFiTN1P0LhYy9Yr3JR5dIIB7RktGCcso2rrb7Zq67xR5L5kjytjm.HG2iaQJel3qqA5W
 czJWVbdvsv5_0eOdjSjPMvQhLKbipSxax6_lKb4xcRfLfvhFpUqojDpbKdlIqMIQOj0YvSiu95NF
 NYzdjbpVXZITMd1asAuqQnkmHGzzY0eVvsMwe8j84cChOYMQDnHWqUs_rHzmpiobiCD6hTdpJ37m
 I22G_wn7SQeL0DUZGfHbB1MfQGDRaowJqawC8lfByp_.n_A6CHHUonppdF3seUxQPW_jkTln8Xxe
 B6KG5oJ1nsT_jsDyw0tTj6qt0xK.tbVD15j3AacmFEnpu2XQY.TvGtAM_hczZKJGUrjW8KPOM.2h
 e4BpqPVubnyj6MQ2n1AYKPIHxEWaIgoojtoCdeNP1Eyw.dP7kJ6NrlSHalMoJa6x7lhexKhidsVY
 Ft_cUdl39RflZWS1PhTPYf.eQocfvHWVcK6GxMUpSZe.ZKwqQnh8PPhRmogGeo18odzXPV7rjL70
 ebZ.EcxrJ_HbIeXbSRn1U_rWUiq75IpscLksoLCaLWsxq0hUT4lCvFoqBWf8wEdPKjPSfAckRv1j
 MnWnT8WK_Mw8LUm3U_zBE8tugJVwTS4RVL19ZHHNNlEF4ANLGXBH7uXrO5JYQuauYo.KgnxBOeOl
 yGhA3Jx4sbmoL3Eqn4xRdyfFPtxgkSLU528oliXTE.bbSCwcCardaAmTRdxMEY5xu_ZUbuxLfgJU
 zP72WEpz8qjOZN2XneOk9SLtND8VWpl61EzWDZXNU81WqnfY1Zd_9NO87_1TrnwRu4.2OLvOGL13
 fOvdGuf9WC4_CvpnUgnK7yROJG_ga0D0r9ELxZaJhx7vlT1ujwCx339THMtD4tyPHNGrsrwn7We_
 8Tq57mpowj0Qlvu.hJSwwp_jFleHiYlTPSiRe9n5sXOvAMDk9UWTLp2As6dWLv1Bbbs4G9df7OJ8
 fectE6ToCugxA3VruNyG0VZlpU8VCZDihJ9kOziCnqsLjtkVb2Yur3giVDwPHo4L11QXHHtHK6Tl
 4TiuW6BfUKcso_AJl.klcRJrHovfIfdgMu4PLLNzU38eZ
X-Sonic-MF: <xiangyu.chen@aol.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.ne1.yahoo.com with HTTP; Sun, 17 Oct 2021 09:32:55 +0000
Date: Sun, 17 Oct 2021 09:12:47 +0000 (UTC)
To: "buildroot@uclibc.org" <buildroot@uclibc.org>
Message-ID: <1553939413.3863322.1634461967644@mail.yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
 boundary="----=_Part_3863321_1784582202.1634461967644"
References: <1553939413.3863322.1634461967644.ref@mail.yahoo.com>
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

------=_Part_3863321_1784582202.1634461967644
Content-Type: multipart/alternative; 
	boundary="----=_Part_3863320_1092007306.1634461967642"

------=_Part_3863320_1092007306.1634461967642
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
------=_Part_3863320_1092007306.1634461967642
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit


<div style="color:black;font: 10pt Arial, Helvetica, sans-serif;">
<div>Dear buildroot maintainer:</div>

<div><br>
</div>

<div>&nbsp;Since more and more traditional companies are starting using buildroot&nbsp;</div>

<div>&nbsp;with AT91SAMx chipset as their product firmware, much of them are still&nbsp;</div>

<div>&nbsp;using SVN as their version control system. So add svn repository method&nbsp;</div>

<div>&nbsp;to AT91bootstrap3 package.</div>

<div><br>
</div>

<div>It's a milestone to me that i from a parasite to a buildroot contributor, if&nbsp;</div>

<div><span style="background-color: transparent; font-size: 10pt;">there is any incorrect in this patch, feel free to tell me via&nbsp;</span><span style="background-color: transparent; font-size: 10pt;">email(xiangyu.chen@aol.com).</span></div>

<div><br>
</div>

<div>Thanks!</div>

<div><span style="background-color: transparent; font-size: 10pt;"><br>
</span></div>

<div><span style="background-color: transparent; font-size: 10pt;"><br>
</span></div>

<div><span style="background-color: transparent; font-size: 10pt;">Br,</span></div>

<div>Xiangyu</div>
</div>

------=_Part_3863320_1092007306.1634461967642--

------=_Part_3863321_1784582202.1634461967644
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="=?utf-8?B?MDAwMS1ib290LWF0OTFib290c3RyYXAzLWFkZC1zdm4tcmVwb3NpdG9yeS1tZXRob2QucGF0Y2g=?="
Content-ID: <8s2QAJI5frk5Z6bv1cLJ>

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

------=_Part_3863321_1784582202.1634461967644
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

------=_Part_3863321_1784582202.1634461967644--
