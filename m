Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45C3C001CC
	for <buildroot@archiver.kernel.org>; Wed, 17 Apr 2024 16:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 800BB605C8;
	Wed, 17 Apr 2024 16:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V54ScGf6Hjzi; Wed, 17 Apr 2024 16:25:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81FC36062D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81FC36062D;
	Wed, 17 Apr 2024 16:25:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 094AA1BF29F
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 16:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01FC140114
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 16:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4sblObbeilg for <buildroot@lists.busybox.net>;
 Wed, 17 Apr 2024 16:25:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.163.191.205;
 helo=sonic312-24.consmr.mail.ne1.yahoo.com;
 envelope-from=dterry_engineer@yahoo.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C52BC400AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C52BC400AF
Received: from sonic312-24.consmr.mail.ne1.yahoo.com
 (sonic312-24.consmr.mail.ne1.yahoo.com [66.163.191.205])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C52BC400AF
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 16:25:39 +0000 (UTC)
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1713371138; bh=E1xw0UcLr317JaikPS1nO3wzBokST0P/SFwSRALkS/y=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=hqHZE6KxjBLhm/4s0QKA9CdzGt94a/HDrHbAlHW+dTvyaK8EKqy7clIBDRQ4KyDg/UESE/DsIAn3sIkehdXLdSzKeLnoL0dRJx2tWRRnG6T3WjgsFDSnKCkAquDEBDz6W7IcIIv4f95Q616CZxiwUohIUbNKNBOE26xj9x/aUfnnrbjWeO6p5/bMzrhEYZpj9ynvrQq1pxlaM+eC2e0eBvVY9hpuhna9YUHZ7CwdIn0H2okHyrqeKGsyMLTxNT32knKMwzO+XSB+pgS7fVn2iU1KPSWDGcWG8GNjNb4Hbg69HyzgRNQKcLGRsrnEXC+9xBsTWGpc1/7Fq3hIcXMKCQ==
X-YMail-OSG: 8T3yAK4VM1kyO9LJwb8GU6LHTsFlJav9RDcflkj.nDKT8C7zTPyZz3.79rMozUU
 _RBcFO_MpqzmW4IGMQYgycIQCz6gWp4PjDC1od99BSeHVG0L9l7sBy.8yJAzTN3Hyr2vQAEdEIV.
 qv_.6eS0Xs0mTWTXUPtlJzvZr0AW6CkoYpHWfP4X63JwXcz5hi9DrV0jmOcUc63ZXxIJTgghgkZn
 Fy1pN2z3w.nwNEe.LcHCsa9w_tBdHjOl95VbehN.aEKcM904I_Ew6eZxZKmSBymHHn0DHTg6UtlJ
 bJ2KgW5rpbDyDyU3sFp7wfs2SoEvkyb1RrVmPsl3td93e0FUkRiQ58mv2auj8z5leFbnRWXhx1D8
 3A4_CB_EzM9NxpwknV.uKd1w.40jfD_GMGjToYGOF6F8ZFWzxqOvVSZ4nkJNgftxKhehyfKS1Zgg
 hJQvaaZENC8Xove3Z4viJXoShVOax9tmg3MzilANQRapxHc6S2hc1yGD7Mg_QabStdOpBduF7Ae1
 kDyESI.BizgFRsQhhAP9dXxetItW5xKEb6XLkmQfE5dlgunDBkVaa5yLHdz42_mK2DtGE8fchCOi
 hD2rK_qjXejHRFoWzFac.bGz3nvaglyq79dwfdMIar0b6rZTX_b.CJZ62Me4CrqXbPhpG0sULai.
 dyXZ05Yt.c_77ajL7LFvU6Dknd2I2I4yfnvHt26WboAx4B1kWtcO4qcjLEvz4deKglXRJC8q41IK
 WvsafpSZ9lxynKba42F.2VEWDUzNesIp20amQ4VyKZ.E9rDcO4LR_yui1rW6GaG9uYcSKfaWdK9k
 3StqjdDM0ORMxx4jA7c8R0J.kcYj02lOXj32q9PT40WnCg0HZVgp_Bg4eo9oZQ7hYs036vEKSZsr
 2SbhDvpGYeoP3_kdoBFNIaetnGrZmCs12fvjL46F_RSQMYOKgOXJVuLEvYszJPzmLexJQGg.GJxp
 BJFajrq8GggaLdgzYMA21U_DmjyVgEkruzvRofaqt16ne9KaUq_myMu2vpg5ZDbYR79.GeHz_UFq
 DMx37RtnyIElrudA0bgHX.h8knVLigRl7lXmUt6.W1qhxOwsGcc2zvPXclMBsSxiyaIyqO_01o5Y
 F8Mhtd3hcmu_DcQI8hAoUB81L7vykUzPn699iV0FNoYbpDvrMjhfdEZXwvnYUJ3hnyECVuHdKFez
 laAuORwNYRvwTEtbERpK1rHzGJiyqVu.wHJbTkRyoQFwziwcD49fGCfd6mVCQjBMvI8Ha1pR3kjD
 Yv5O_UjtaPCLSAKaiSqbz0Fy.z_9NrCFR9RnPGHbdi_LxDK771AJdnuZKJApnTEsbSGNrvwdm0DM
 oVc8TCOG4HB3Gj3QB7ckAJtbKsNmgeMQqCPPJk1h08x2cectTPArqKq4rvxhkN1yGBrygiobrcNy
 _jcuD5rSBv7y1Fq5sgOOnohxkWLlMI.a0OWCpdyDOkrBNE09Qn8f7N5zF77M5cFmiv4n0j0XUFn.
 9sPc1Y064JyEqwnAQsiMsYFXEIVa9_gcIuH.7Mejia4ssCMt5dTqP.epWxo_W5LJ3Zvr.wQgvsQZ
 CBE4Up7M3rF8gyVw4bFL6157KtJ82kKTLdj8Lv_NrT43u6Myb2YQcrSrXRDB8i0DKMcn_59kHxc5
 NcYWjzoTshKS6vBsRtA8yMv8iEt62jsjAoVyJlBylyOyQZ6WAnIYx75nrLR8KCck5xnGbkUBSKSE
 w1pul4NLHeCJ0gC0M.Y0qCVd2IHKelUOI81pA0vWXGFCewDmRnn7Icd8Y4Ln2OOEwBdc0Ymo.61K
 Pgzh4L5tQcHkuZHC7rs5kbMjX0dT4X__X7HDMOSimy.xX.kCWdlFn2Az0ZXHbuFICe7c_ol0rTsQ
 qvJ0Y4alrBN2yhHwrv.gLGeqEh4c2pqLQEo_3c5K3fa5xiLdgiJ5QJRvfqdUvqod5G48S3ilCtMc
 G.6QCMlMpphV.i7WJNRveFEy9bmffdb3_yr0.lxrwRTaN1mrQHyFxX7kAdH9JsWDUZpYC5116IUG
 LYa.r4OBWtqtIqfR4G3KMtslC2twQI7JesHXmaXqaxZV9uIM1fi16fkBniaHNxP13lHB.0ZXT0xb
 QMog6vBAiSkuXw4leb8F4zd3PixfWeVXBS7TaP_lMKmw8SZzf0lyhPkam8zDcjPn4SEzR7qAiwBm
 HPSn.1wfaH6ftnMjXnPkFE7tiTdTvorndmrDpxn3AuzSNizsyWHYdbWyxyr3FvfrE1D5FTrjlGoi
 npvHbf73VBDkLnO7v39iKrHH3rnMSEjnf1LYKQb7f_LxLdgxXTSQfAv5ahiNA0xq0ly7d5LGomJG
 9mbSJEzhqgF7gdFaA
X-Sonic-MF: <dterry_engineer@yahoo.com>
X-Sonic-ID: 01bdbf6a-0b0e-4fb6-abc8-cb8bca64f0b1
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.ne1.yahoo.com with HTTP; Wed, 17 Apr 2024 16:25:38 +0000
Received: by hermes--production-bf1-5cc9fc94c8-5x2g5 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 2d99abf201a68ad1ee0836c23e72bb02; 
 Wed, 17 Apr 2024 16:25:35 +0000 (UTC)
Message-ID: <d144cbba-9be6-477f-9a79-e72361487734@yahoo.com>
Date: Wed, 17 Apr 2024 11:25:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <e2634bc6-2e68-4331-8354-49407b40f191.ref@yahoo.com>
 <e2634bc6-2e68-4331-8354-49407b40f191@yahoo.com>
 <6068206a-9a0c-4ef4-a5bb-9e6f35218297@benettiengineering.com>
Content-Language: en-US
In-Reply-To: <6068206a-9a0c-4ef4-a5bb-9e6f35218297@benettiengineering.com>
X-Mailer: WebService/1.1.22256
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yahoo.com; s=s2048; t=1713371138;
 bh=z16DYrl0CR8z8+pISaeC6PWbQ+NMbXBxtqXxAGb/juU=;
 h=Date:Subject:To:References:From:In-Reply-To:From:Subject:Reply-To;
 b=UtpTIKT32CJYIdRa0xLobOm04pmO4LUzbP/anLgClHGuqFjUd5MCOYW4amjSseFdHqB2o/OZUe8Uk679Ef6jAoXRILNI7DPVLUPjWXMd4cVZtjFlYkTg8T/3pXzsLQbvwC2UH4SCvSpvl9aSKWoL9YvwnqpnpJbbyF8D2PeOnRunKpgmmD+YH2xu/JHvjisviP7UrM9Xkp24rP7+owwQi/3jExt02XwKKnXGxoC4igCEfiXTuxeq2+S3LfQfNrjUixKly7cPh01oRrqyPk12dV66+VPr/BsmXnc6HBv+JbQvyopJBXtgl/pbc5mTuDsqqWCrz+yPFz6iCBA3+3C3ww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=yahoo.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.a=rsa-sha256 header.s=s2048 header.b=UtpTIKT3
Subject: Re: [Buildroot] Problem with device tree
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
From: DTrustee via buildroot <buildroot@buildroot.org>
Reply-To: DTrustee <dterry_engineer@yahoo.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SSBrbm93IHlvdSBhcmUgYWxsIGJ1c3ksIGRvbid0IG1lYW4gdG8gYnVnIGFueW9uZSBidXQgSSBj
YW5ub3QgZ2V0IApidWlsZHJvb3QgdG8gbWFrZSB3aXRob3V0IGVycm9ycy4gSSBoYXZlIG5vIGlk
ZWEgd2h5ICJvcGVyYXRvciAnPCcgaGFzIApubyBsZWZ0IG9wZXJhbmQiIGlzIGdlbmVyYXRlZCBv
ciB3aGljaCBpbmNsdWRlIGZpbGUgaXMgdGhlIGNhdXNlLiBJIAp0cnVseSBhcHByZWNpYXRlIHlv
dXIgaGVscC4gSXMgdGhlcmUgZG9jdW1lbnRhdGlvbiB0aGF0IHdhbGtzIHRocm91Z2ggCnRoZSBi
dWlsZCBwcm9jZXNzPyBJIGhhdmUgbG9va2VkIGF0IHRoZSBCb290bGluIHRyYWluaW5nIGJ1dCBp
dCBpcyAKc2V2ZXJhbCB5ZWFycyBvbGQgbm93IGFuZCBvdXQgb2YgZGF0ZS4KCkJ1aWxkbG9nIGlz
CgpodHRwczovL3Bhc3RlYmluLmNvbS9FcXQ2emk5YQoKY29uZmlnIGlzCgpodHRwczovL3Bhc3Rl
YmluLmNvbS84UDJoQjl1WQoKYnVpbGRyb290IDIwMjQuMDIuMQoKSGF2ZSBhIEJsZXNzZWQgZGF5
IQoKRG9uCgoKCk9uIDQvOS8yNCA0OjU5IFBNLCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPiBIaSBE
b24sCj4KPiBPbiAwOS8wNC8yNCAyMzoyMywgRG9uIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4+IFRo
aXMgaXMgbXkgZmlyc3QgdGltZSB1c2luZyBidWlsZHJvb3QuIEZvbGxvd2luZyB0aGUgaW5zdHJ1
Y3Rpb25zIG9mIAo+PiBib290bGluLmNvbS9kb2MvdHJhaW5pbmcvYnVpbGRyb290L2J1aWxkcm9v
dC1sYWJzLnBkZiwgYnVpbGRpbmcgZm9yIAo+PiBCZWFnbGVib25lIEJsYWNrIHRob3VnaCBub3Qg
dGhlIHdpcmVsZXNzIG9mIHRoZSB0cmFpbmluZyBwZGYuIFVuZGVyIAo+PiBLZXJuZWwgLSBzZWxl
Y3RlZCBkZXZpY2UgdHJlZSBibG9iIGFuZCBpbi10cmVlIGRldmljZSB0cmVlIG5hbWUgSSBwdXQg
Cj4+IGFtMzM1eC1ib25lYmxhY2suIEhvd2V2ZXIgSSBnZXQKPj4KPj4gRGV2aWNlIFRyZWUgU291
cmNlIChhcmNoL2FybS9kdHMvYW0zMzV4LS5kdGIpIGlzIG5vdCBjb3JyZWN0bHkgCj4+IHNwZWNp
ZmllZC4KPj4gUGxlYXNlIGRlZmluZSAnQ09ORklHX0RFRkFVTFRfREVWSUNFX1RSRUUnCj4+IG9y
IGJ1aWxkIHdpdGggJ0RFVklDRV9UUkVFPTxkZXZpY2VfdHJlZT4nIGFyZ3VtZW50Cj4+Cj4+IFdo
YXQgZG9lcyBpdCB3YW50PyBTb21ldGhpbmcgaXMgbWlzc2luZyBidXQgSSBkb24ndCBrbm93IHdo
YXQuCj4KPiBTdGFydGluZyBmcm9twqAgTGludXggdmVyc2lvbiA2LjVbMF0geW91IGhhdmUgdG8g
c3BlY2lmeSB0aGUgCj4gbWFudWZhY3R1cmVyIGZvbGRlciB0b28gY29tcGFyZWQgdG8gcHJldmlv
dXMgdmVyc2lvbnMoaS5lLiA2LjRbMV0pLiBTbyAKPiBpZiB5b3UncmUgdXNpbmcgYSBrZXJuZWwg
bmV3ZXIgdGhhbiA2LjUgeW91IGhhdmUgdG8gc3BlY2lmeSBzb21ldGhpbmcgCj4gbGlrZToKPiBh
cmNoL2FybS9kdHMvdGkvb21hcC9hbTMzNXgtLmR0Ygo+Cj4gSG9wZSB0aGlzIGhlbHBzLgo+Cj4g
WzBdOiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni41LXJjMS9zb3VyY2UvYXJj
aC9hcm0vYm9vdC9kdHMKPiBbMV06IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2
LjQuMTYvc291cmNlL2FyY2gvYXJtL2Jvb3QvZHRzCj4KPiBCZXN0IHJlZ2FyZHMKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
