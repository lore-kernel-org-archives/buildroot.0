Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827DBC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AE1740F3E;
	Sun, 20 Sep 2026 17:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PxCrTDIMpqWV; Sun, 20 Sep 2026 17:16:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 794C740F50
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924603;
	b=X3t7er+pSJDq9DXlCr0Ma3z8YNMjlo/LLtekugcdsJxM/klmxL+qgZMcgspuIVG4hDA2
	 h9spjzuoF2ptbrW6nctj+ij6/CWEL6PM1I9ch8GWoX/uTfkRHj147/joLh8/h8V40Vmo9
	 fkSeZ8ZVVxZYuHKN2IR5l4YaDXemy+FsZHvAdCyZXM57ED+GclcnJWfhw2Zpi3S49rtUE
	 ynWPgK3p4KSTWjbFOJFbrG7l68UpHX2/4GNXNUj8eOzgyXAm1ziSlNegoOdi81RHWQbsT
	 EBp8bmYJZx5S69NDw/vcdhcYMUz9RORIjiQmMkhOStvXWmyWI0Qm3VPXEDR+JSDMaCw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924603;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=z+AdxNtlsPj3RpuClS5bTZOoECb0K8xDh5ikjbTSidQ=;
	b=goyhjDOKrZs7NPFxzxipOZHjrNtt8IxQTm100yQegkrnNN4YLthSy+CSkHjOnUn05HgP
	 iwzeyi7UxMHuO/y6ij90dlX3JyAxcTCCGPOtpZozqNSOodoRO8NhTFnAZu/hMDW5AqmMt
	 EsHwMtBJEd0tj90fP0C54lcEUYDcpG/AU3qx2TyLdERuogv6tTOeXv3sKnhvX/KwicVzT
	 PBXsI9hzHonVw/iOexEJ3oRYngIi6ZX/id1SitQnfzmFdU+1vQaNIA+C7qeIJZcuT7/OY
	 yfCeHnqOPBuaAfBS5CsqEPMV2bjgfju0kBnWGzJkujfP/DxSVNDCm5CZMGELRUTbqow==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924603;
	bh=z+AdxNtlsPj3RpuClS5bTZOoECb0K8xDh5ikjbTSidQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FWel7zhKHU5FzN30qvnBZV6LJg18M7LCLuI3gL99YRyCw1FcUjt21MYjqq8FrYMXP
	 qDMeLAgcKJe3cbOh71xu/S3+wVR6VZEKVe63+mt2YDbdyx0fjnur3j/Kq+zYNNbezS
	 NZNm3f1lbPmNfsoNitV78AUcwXFjGqKWx4vhu1Q6g5KeGfvTe1Daz6evurVY8GkYo6
	 7j4GM9O+m4+48U3aVjx7yGIZOGTn/ck6lkGi+BsEezsTHUQo+R3o6+nZVhFv0Nv/4Q
	 dnk4EpJEwyUg8zhgCK86KURNjjxonEJpbH/sShDHIc/5XKXUpa0dcu+p6MUmGzZV6H
	 z6PUQwnVUEwhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 794C740F50;
	Sun, 20 Sep 2026 17:16:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 78A9C3FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B216606FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:16:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0V02sOJGIIgL for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:16:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 53EEE60601
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924600;
 b=ZyrJPIW7C53l6GnIwd9ZACVqgL3aZDxiydQOtOaWHYGrGilhb9Q1sm/LYjwdWNalfsly
 LtGYd/XMxK5RByqgBpP3IMRzLfWXoIi50oi3FTBWFxLUYDN67RQQGG9Vt54P2i0sC8AZT
 7LGrr/H1HSYoZlq3VW0rIfFxrKVhlbP/zN/mneDWPB4xJqcVQBK3qRD2fKAKKU8Ye8JuS
 zYzgNBJPC/oA5020sjHY6I6/5sW0p1J512gt0rOA3FKK6TTRAX10eIicN29xLtaQRgg0H
 HAfQBdV7Z7pnlLuccyvHxwFpn45pZHyEtX0fE+UykbKKNa9SDUfvZirwLQ6erSXHshQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924600;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=t+wAoYYHyKtV+Eq97J1+gkp81w1F0wH1jS1vowMZLFg=;
 b=RSlPqL4eWG4FdQorhmP1QMi6ePoXogW2gyQyEm4Htc9D/qcEWZwAQkgwZP/JbVdjMKQa
 BBzon9JpmnIPVgu68zzqRwl2cHbMKNppR8dL7UBV0gAHjPtAhNO3lmhllTpd3Q9CbQSAJ
 fnI2Pg0HH3+OzpDol8vYFt8G4DMVMT6Kvq4Ao33FbE5viwNoGipfMDWuZ79UDneVzoCyH
 t8haYaflzLVlHOfe4/e2QxZumQMb3KfqJyHstj7cDl1ftTCw3MKjnailzaLQOqB9kb/+I
 F8deKna3QZ/V6Z8hkAuD+XNTLnyQBJ2gzTzhBnFab1ggylLtYhVJERGJLHhyDysmlnw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=NDpYzjch; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=NDpYzjch
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 53EEE60601
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924155;
 bh=t+wAoYYHyKtV+Eq97J1+gkp81w1F0wH1jS1vowMZLFg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=NDpYzjch24M2uSLAh8Wf0c72M2OrfI/rKSQB+QIpDLeMHdxCW6CDvwPhO+uu4RD1S
 QGdyiOsZluZ5zjZkon3Yu/O7ke0Tn9d/551qXoXp0eF76dLCUsKwR8G6sfAq7Q+cz+
 PsYZkyaVqBBCugfNxyn4lnZz9CN0eUsY77lg9yz+FmNtArAyN+OJByMDs4d7vD4sK6
 2SVNFtnUp+o1g21SYa+xVPgmbyH0Knvl1yd1XBeB3O1SMlFZ6o9gC7NGUQNpt8w739
 nbN8nKBAFYg3Ta5fznMnOwRZgafjacftRu4V/I9kxKEY11doUNNeSrDHnej3zmu3V+
 PXpFkNKLMyWoA==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:P6ZdCvzf0KfF+RDtIBNqEYQFAqpZnNKMP7wznKXd4y3codfvTaHQImJ/4Xx8HkPvKqx8uOnHrAvSV8403Xk8taLK92R58K4JdW9U1mraPjMnjOxHQFWhGNLtwWSC/nB7gNLz7LHmJs5zy44IRtPB2ZBlGsMPys2UvdhdQKal1RkyAOu/wu7/pqqJ4EYvDe8z4CLK4+hEs9K9/m9sIO2b+L+dZ59jb4u03OXRimKPIB6Pdct2F852Obfa95j/zs2620Suo+mYCnWlU9woaISPcHh/Wyfci2LXsdCXE9+p9vuFH4AwsPumHIXJf9czscQDZfFUG1ooief9aOsArGvwoiqh5I4wJOnS0hLNgp6xwax82BEGlCdyCNPYwJa1fMcns9GHRWhZbI/dShZWbS3PuldEQq38hUipPmLWoQaguhmZJzhY+ujIPaSD2nCW5paMdjh676fXniid+ZIAjFLI7dZcD9ucIEBJJF4red1Cf1ST+Mxvl70j+cmyyLKkRbTPdg0dS5L+ddqrO4nzz6qzaycZqNA4awXeqcEVkeQ1/NisWdL8HbBFdgOr4iSf0iLCu31cGbhmRZkUD2M1QTXv37UwbbogV0PZKNLoC0qtFAS4JB
 iCySQU+2I2B+jgZDWTsc8Tlvk9MxWSWHJqHE7oacchve6f0t2/WjWKS8EFxLENCS3oE4lHBA==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 97167A4C488A;
 Sun, 20 Sep 2026 19:09:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1a-000000000o7-0U5b;
 Sun, 20 Sep 2026 17:08:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:33 +0200
Message-ID: <20260920170815.240247-27-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v5 26/67] package/ca-certificates: Replace
 c_rehash with openssl rehash
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The upcoming bump of libopenssl to 4.0.2 removes the c_rehash script:

https://openssl-library.org/post/2026-04-14-openssl-40-final-release/
https://github.com/openssl/openssl/blob/openssl-4.0.2/CHANGES.md#openssl-40

"* Removed `c_rehash` script tool.  Use `openssl rehash` instead."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ca-certificates/ca-certificates.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index f5675b754d..0f88df3eec 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -36,7 +36,7 @@ define CA_CERTIFICATES_GEN_BUNDLE
 	done >$(BUILD_DIR)/ca-certificates.crt
 
 	# Create symlinks to the certificates by their hash values
-	$(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
+	$(HOST_DIR)/bin/openssl rehash $(TARGET_DIR)/etc/ssl/certs
 
 	# Install the certificates bundle
 	$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
@@ -65,7 +65,7 @@ define HOST_CA_CERTIFICATES_INSTALL_CMDS
 	done >$(BUILD_DIR)/ca-certificates.crt
 
 	# Create symlinks to the certificates by their hash values
-	$(HOST_DIR)/bin/c_rehash $(HOST_DIR)/etc/ssl/certs
+	$(HOST_DIR)/bin/openssl rehash $(HOST_DIR)/etc/ssl/certs
 
 	# Install the certificates bundle
 	$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
