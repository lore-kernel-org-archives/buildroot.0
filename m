Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9466ECD3447
	for <buildroot@archiver.kernel.org>; Sat,  9 May 2026 13:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B47684259E;
	Sat,  9 May 2026 13:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NdJJxmijTmHA; Sat,  9 May 2026 13:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 631EA42555
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778333931;
	bh=FLhsItXHSK/OcS7roLtXeDa8vd1MHS3Ti5sWN8PV2HA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=dQ9+JMvRoV/mc6t3J2MVJk6FRwcy1gn5VoxUXfAEqnDM4k5NOFc0K7lFtYWpA0uKg
	 9IaVCefMgOoUQl8JejeZy9PxNcL0c4og9KAMtWw9uLfypQwo3hZoZ/HAZ753cE3hK9
	 PMHS/wiNJpkLIdBw9ppgsHjr33o8V51blE6zNikexCOjU0QRmlFp2sSfGB9x7lbcq/
	 UuMOblr/cjSgy6Jcz9u5Y+tiU75fP0Nr0a8QwkuWKPuIabu5p28f9VcZLHwobjMlcw
	 N0QACpNGbahTLy8/Xp4TKV+DdjhymYtmwuEvTHRSNpO9lX7Hyar2Sy5yoN35iA4XjN
	 h3L38Mit8qmJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 631EA42555;
	Sat,  9 May 2026 13:38:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B3C2622F
 for <buildroot@buildroot.org>; Sat,  9 May 2026 13:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5BE342555
 for <buildroot@buildroot.org>; Sat,  9 May 2026 13:38:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e5EZgY7KgX8R for <buildroot@buildroot.org>;
 Sat,  9 May 2026 13:38:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=and@gmx.li; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6E26B42550
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E26B42550
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E26B42550
 for <buildroot@buildroot.org>; Sat,  9 May 2026 13:38:48 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7zFj-1vH2k22rHH-00r9x3; Sat, 09
 May 2026 15:38:45 +0200
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Andreas Mohr <and@gmx.li>
Date: Sat,  9 May 2026 13:38:34 +0000
Message-ID: <20260509133834.937-1-and@gmx.li>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:dij1SznfvTkVyVh935WV70tNPhvV8elrLn3rtzZe7LC/9Jf6IYj
 ptCEuMmPUYTpTiFSyNHCx8lYO/7f7dA0WsLydO1cn+yCdonSCT9HTEUs2MtkivOF9V8dfG7
 IKVdxsl1oAZRtUOKc9c9vCcAbmrHM/+iYlvqOtWqqf2PluiWo/xNlwNr0Plnu2F2MiQ1/3V
 ckjxi9jRMz99qJUsFZ98g==
UI-OutboundReport: notjunk:1;M01:P0:lSH3rCbfgiE=;s1d/U2o/z+1ZBhX2xPSF/2JwSAJ
 v/ABi1h4Kaj5olfCTCyBTn7/YhF3ZoQLP1FaZWJGKt4K/np+SCkPTXZkZXwN7CVCPs5Ug5PEU
 PVRZdNpT6MgbcOoH1dvz/ezrvg3gEP+8jV6xReecwV86riK9h5Ts21BEw7iUxkJAYdlEG34WK
 6TNKU1aAYcczA8P33xL7fvfoyVyZH8X/GSTq//2DDBnOjKMPxIzWLUczfd7r5FSy07M5xlfeQ
 kOqzBVCsgr/Db7VBszUZrOH2+R/ql9VdZ2G11neairnHBMIlNIAz4WB+nM4ewPPl17Cb/MyBW
 ENAkRcg7Z4/4Cys5XiY+FQwMqPjukVM1Ao5L5TVgNLLO2VEa1Knkdbv+3iTPaLJftFwAFCUyK
 H4I3RkCQDcBUFun/5Z1j++8SYUu55Lxvquz3ShS19+rQbTplZ0ZNuwj78PhmKHX0QOAKVcxI4
 WujHgErKY4Vfe4ueniivISbU9IEN7zrpCjeFORFPf0O3GJSAl51BQ3zdZGhOw6guzIxCriWxn
 d8172u6u73dp0kLXmCWxE/N2NjLbvw6f5D3F5loHQFz/2eQKAQzcGiSaDKVXnj1GhopIcRUYd
 Bn+saIGmklN73aaYpw+4uW/NdcrqKy1oMPtqh+KxBFP9COInkAhADR1TjPhTV0JSBDIsggIMk
 ukpXCIdjLpQJwXY4Pu53LGTfjkb4mPgqH0DCO1poB+8bcvKX39ge4f8CjhfqRD2oHgIS2ESaJ
 J2OpMAAx/Ba7AjY4p+GZl+iRN+zoxyE9yQIFz4vebMnQINYHcgr0sQmGzd6KqbwyL9SmgbOsk
 wp4QPkNwo0oyzkO4/4ADdwfhXJsKsi9x6sEkT6Kc4nfSYtJiTMe9hurTj0NaUSKbKkknCp65P
 XBtqsvKui/oUE8aLq0oZm9EAxluj1DuW48VeIcrkWOXc7be+6Or4EXBnYJmJ06A3SeKOvJl8p
 4o0b+rUJgYGp2HVSVOGzs4ijBnlBiZPE1nZawneXf330cc+BOYE2DMV1mAXx9SNSBvYhiis32
 4eV7GnDeNQynHFn+TIebbJX7SlzbGgovrTQxdF5+cQuvlhhaHIFy9AA6ovog4ehSGs1jG2I4x
 JRBJGjtCuClpI85djD0FiiDD+0kpjwVkKIF/4cp+geG659n6EpU9q8UZVyTUnC6WUyf0clUJB
 yPA88MHH0VfGiqcaOU0UzLA2ofBdu0DQhn8S+fqkY2ClLZ/ybN1IO6NbmsY+jmEv/1bpyL7js
 HE7Yt9u6dhpAelZGPfadJhDg551PaVi2kOH0nJkfj8Y8jRs9QOhsXpKaY9e72C5vLOax6Yt3B
 TzpbM9jBWAZNYBAHkz4/+x1prUnFh/lyD7/+8WYZjn8iaSrUDhUTkl1paVeYbr/bJ9pzzICy1
 5DFAbWOeWF5vj1ng3BZBAMwmSMQERUk2Ta92wNg7ZLQJg6mq7QGHeaLk3yJ+gYHfAeWgzy1Vg
 n0XCop9DLANAtNNRxSB82CXsQtN/yeNJVCSQ7zRDyAjhMvpXoISR/LgXlfMKQNPAPBBt/VwSW
 kEF8vgILyTY/NFsG2VaQIDH4MPPkJw77jxLh8qXyrd2ZBdT4Y59S9XPfzANNP/QPDzT1+klRL
 EKS3GX/KkiKwGA171UKy1CZsZ/xZNgWZ+Dxa0Mo9sXsRnUaC/41CbYTzAqKLHnR8WwjNg/G3k
 nI7lqyzqTPMTdd6CFQwsR12jW14jvR/3B0dBT35kxrk41loTYC8RKBW1UmyQdMGjn2fKghAtf
 IcrW/9lHz1I/80ZJ5rOzF/+XNNFLM4iqJntsz0c+AKQ3ubgWqsCdhKzxS760xZ5WfUUWFf+cC
 BFOkisjjQgG+/VfpFb3/v5vsV+u8IXxJ9J35c8w3seJq/R78U5N4uMDdFsuuTszKWj1H7Et2b
 8058mP1+NXwzl15sVE117UaH8/ujsPrEi9VhO1vx5G2lLeZ+4Gt40bzARg2PynsWHxxhh9kcS
 72Jb3lWtLFaRLYt3XeuFlq6wr0JTLyZZC5rn1610iiXVUFfWUBsJBHRbVFLnRAP/rVWvkv5Cc
 3I2EZl2cvFsrWqd6IGNcu1JYt3f7SrQFAJASsyn3eAPHw4seCRNdZGniqyOnfqFXzqWahfkeF
 heCNQ74quBs2XaOwDs3mPELmzyM2jBZAzwk/d68lU5590NddrsMjeMiT3ttUbL85NDbm4lS8l
 jSz+GZwr59bFMICXGPqozBrCrzQKRBwhx+YzF7WwRMggCx8fqKpIOUdudPuwl7wZ0krCDw7Jo
 v18MyfiQs2O553WGG9DrAwsuz0N6DNYmAZfZ/y4EAs4C+GnRmeBFEgOCo+pEHR4VrRm9obUPg
 ZprJexB7DYOFxdDkreTWmxy50iBBfg+PXNTBG5dL3q1560H4OFGCQy2wcJ1xn6FGb7qwtLghq
 tu1PRy88wimdLsEMsnaRdot+dGP1aeZdjN2wAk7Bl1ZbmQLmuHGpgW6mbZBWKwiOJ/K5JCZEl
 roc7OebTMwxLDzFmOesHsN31IVZJZUBBK/ChGaJHDxssKvqZOTFUfrdIhKY6OoCF01Suf8nBd
 Fmz/8Nl0auC2cw787ha5/S42NOTKE0UtTNtJnda65+dolp7gnMQzWLTID+U9HOkOB0nysMjGT
 +mbStj+dIfsGA35TCNmvD+I5lLf7n4wy+Db1loxBDzEVLOkpt+GPq+FD4MHZJ18Aqn/JOj2Ty
 e5fk9PveC1c9gNWtCdHIo5YeO9YADT0yuPhN+udPOm2xL6YoUi008BT/cF92/aHOQAn2eh8UZ
 kOvg0rk/wTVJJVeivlfY2T7BIi4850JzMdgJFTi8YKycHVIYLw9iYENdm5AjegR16/7d+NM1g
 YNihVxSWfhFBIrjJUuSIcVBXd4hkiS3d3qoZyYG0T58pNECRTMzHqpOSw9DFBKmoQ/0jPgjnu
 TPHKleqrPNVjlChH5f+a1WravfVBbQ3Fbk6c55G3Mlp0C590iKmCbbQEE4nGfMBVNWin9Hwmv
 IKMoOST2Dfta4PUBIP9Ip24dMZqb6h8NxAPCIub7tG306Q3qE1LheCMBrITdIAbh4pSL3y/tV
 KGJWWnzgLHpoNeQ60qKO63YjuVfPA8f17tyAqoYROjgtxQ0cDNGp7CFPyw8QTT6UywJxfqGkc
 LeWQ58Yc2YEYbJeN5AHBdZimFXO/wD+8TV/3Z4zFP9vVshz9cMDL6ZMzXsLYXL5Zg8T+fWaCO
 kAqMp8hYBnoZcqDJXXUOhtlauPvWCihf2bMigh4bIPftyBRVReiCPEqpbFM7VPT6btkWbSzYe
 muJSFwEB0UCEOVDmsvYshpwZWBXsKLRYJO6vkNwNSWsiZYlDW8IKOUs0p+ngu8ttwihmmQFbL
 8aol94B5mk6EEJZ/601WZUjqirGKxCJZm9mXW2NDM2qXM72QnHqrVrfJVfe68ZEces9iZc1kn
 0VA71XyVemvxeRNRNfz13ggNBAkldD1QhTJf+uYzJlrdIGaEdblmF/Im22D8ESmCfl2mDrMw8
 U9hvqGeJPp3ZmXisrz34iBEzo1nkbGmFYeCbm9vCpBU/fhOj3i4Mbw2fTZu82XhENC2q+GC1y
 RoT9l90GE1CDZFjxwkDw9t42sDiEqkzG0VrLyml6kYyQnwbLfdId+LbCckOfE/IvvLvyltIwE
 Mk7LzLjJR75z+IuO8mAKuT83VMovAPGZBD4qQh53qugM3YUwTjbD0gAD8Nm3YCeMF7es6JySL
 +SL4xh+vC2qyColNUr7LJK4YKBs1Ll0UB6WCi8AEqU65m6FPK7uYLFyMd8UyTZjgnXTLRYD2t
 8bcqqwWj4cb4MOVC+/TfeZ6Abf90feFmfZhCjK9YuFFIHRVg1sCbjBe1nAZEilRle2i3eYyuv
 otbvHiVp71j4vzzeWWbRMAbgWsBOzonlvJEwH5WSTJRl67yzhBFZQfcvZZ4sF7GZchbKA4py9
 XyUYtCr/FdDkea3AwSVKQ93DmExM6foN/jojTXXSTi4HQG8o+guAcgFPQtriEKcKV81LqJ0bu
 qUBlhyRIxWN8sPqcpX6Eua+qmrhA7EaNmqeMKjML5PLgYyAhPTAF07KeL+K32S0jlAQ8AX1B2
 yhePiXf8XpK2E8FUzprE5kXybjfQvjonjcY20++WR2b+NYN41eMOK0HLdjhCFB8myYFoPF0N0
 /F7BCDxGLaPQfmHFMTHF5SoL/8qorwQbWi9+WwBQ9jZYeacvKkb2WexJ3Jqu2vzTRUcHL0WKr
 STL7io6HA5EJCCQ6dVPYIExJQRL5KOU/QZNOBN9dQvwsnk6C5aE+e5EnywkP+ml3HsJkaUqzx
 RPgs5gbLwH2eOsGocNLyd0UVUobDw2VWehK/kzSCWPSopKnu0KxWgqExJ4VTAdZ5C0/cSOwzL
 70a+jtVba9czosK6tDX9neaCDjglyLN63Es1jWzrEMfqlZmLDczn9qf0AfpXw+pHWoY7N0LkM
 usRxPGdw5JqopTRPHiqfHNnt609jUORnhZjVodnDkGZuJs/BnWVfVO2eoPskN5QvERxx2j2Cl
 kxCEDLIeySAX3egZx106V4/AM+cGgP/5Z865DHXeDgtbC0rtc4vGL4MlW4lCeB7p0geaBSCoF
 MxR07PnpuhOWXw6xwwsZz0hSCqZi9WEOeUAhnjt3/IIHLq3YlSTfX412NAV2kPT0iDqBIl/Aw
 ZnFN5+J9SrgYoLK604p91M9xRMjR+Wtj2p+n/ZvcsaThgop6abpO3ok8RTyNsgfxp7sigD+oU
 x5ZvQ5KlundWR1U6kimJDpgIObHGIi5kVJDwu+/UIqM77iL+IGV4u44VgIkwL8L869wKddZGf
 xQGroDcjNAAUWyfs26DT4rFAxmkuzUkmhzEf0+xjJKCRxgDs3KvIbIYBIZkY+06CNmTYKGB3G
 LiwCo/ws2AfRwCs2htuocgMCwA9GK/FgBFQrXlztWprw+MoYmxH8wu+lmzO3VQTA2wrqNixu1
 KuGC81nGRbRV3HVQaiKheWVIXEXselIV3ih5b66qjuooWgQmEUWwI7eZF3+r4eiP0MmwNTVU9
 QxyFNYYX023AN/N7od1YKCieZgbO0Lqzv0d0/nKkfqJdw+sretGCAqrdBWoRqiVy2OYK1NF4c
 tVWZtUeobvbIjDqIeYyKZVc1INdUj1qKvLB0CsAMQ72gH375gKkK3f5RGOy9LPF9Jp589f+qT
 nDhr5bw41Zj7JgrO0pisrjcHzp7ya1PFEpqyF1aKhdT5yOV8lXIuG0PDd/euIGRTEDJi4LeTv
 yitOgcLAWbjWtkrvF2bh+hE/0S+FJgHIix2btGjYQmend/DoCoSmhBnxgCoJHtKasKaG1mhc6
 RXva31+uohu5X8LGkIK1uKQmDHXuLLqMnSMenri9sX7hvSE2zU1MbJ78T68Z+b6JOgHR2cyCn
 8lschG1duDGUOt8dz8CWBRWT8ZuqflrCs3HgS8OupD4+jlLy6hCJdARTeUL1PeNK3y9exsyZI
 b75WC4AVY6qQtID6XdYPBNIv/rIkiGOPYLpLY2UTYdFM4UjWq5a/0FUzvyEbcwDwqQ4ueez12
 fm7lXbrxXhhJrEBxQt0T2RWcSqC3QoqbD7sM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.li; 
 s=s31663417; t=1778333925; x=1778938725; i=and@gmx.li;
 bh=QW/XdFzxXvhIt8WJ7uhOAnTT9JU2awaflyj7JtOKdoc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=YJvmf0q3RPt+R+lrghrNH/SFqiYh/8LmB2bNyeDWKnCu/Q5pOLseWb8gq0yEcaiY
 VrMiPkw5TPDN6EEQFM7lPqrwfrv7V+dAK1AYXcBMQWKSN2Vli+7OP5S394K8b98dB
 zKs+0SSMFhgoVDcc/GTTmWzORHxo90+X+D8vDDgjEBtSenez9nXq4A4WTYaT+Vp/k
 VqSUkAxy92eEGkzYa9xW5EiPq6w/DC9Xa+uilN0Z8FCV80S6EuQBnVRnlTFkbeeH3
 7l4YS/EO2qliyClP6aQjxPYBx21whzyvXXxmhjmJKIZqh195dcsGUd9SGId42EOH4
 C59X5nmdzLoAhUughA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.li
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.li header.i=and@gmx.li header.a=rsa-sha256
 header.s=s31663417 header.b=YJvmf0q3
Subject: [Buildroot] [PATCH 1/1] package/cryptsetup: add Mbed-TLS crypto
 backend support
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
From: Andreas Mohr via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Mohr <and@gmx.li>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cryptsetup support Mbed-TLS/mbedtls since 2.8.0

Signed-off-by: Andreas Mohr <and@gmx.li>
---
 package/cryptsetup/cryptsetup.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 716a244915..22c564feab 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -41,6 +41,9 @@ CRYPTSETUP_CONF_OPTS += --with-crypto_backend=nettle
 else ifeq ($(BR2_PACKAGE_LIBNSS),y)
 CRYPTSETUP_DEPENDENCIES += libnss
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=nss
+else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+CRYPTSETUP_DEPENDENCIES += mbedtls
+CRYPTSETUP_CONF_OPTS += --with-crypto_backend=mbedtls
 else
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=kernel
 endif
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
