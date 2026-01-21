Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A67EC44501
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 08:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24C97403FB;
	Wed, 21 Jan 2026 08:41:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KuKNB0Mn2uBJ; Wed, 21 Jan 2026 08:41:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30F3841455
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768984916;
	bh=l414/mdOam1D8P75YNHOnxJvXVzz0ckT111L2g15xxo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a2WVlWm5Hfs8Jx9ek3fb2HeB08GN6ZyUpldfYDIYTPKRDtCJUTyk4cHX2x6BsRheA
	 T9JDSjoEnEgLwiE1U7KO4SpOT9N3dfFwnD7E/GmsFRJ96gIqqIWd8a9l8rCYQ+uCpB
	 /roZnXz64tCwmhSPM7+mIeJJC7hgzNlqYj9QCB1sok1ZWVWRjJQLUeNKx5rJMGdHM+
	 L3pONkVUDBbyrd5b87aGxtnCOQyFO/Yp+bDU8TL/Fl6KnnL4MszwhGCH98vHZbE4au
	 svXjFpa174l9ZdrTtHkzoJfnGnkpRRG+NzO8amQKYYxX0A3J3vvVP7TZg2ylItVjrB
	 26xpl1gWxz0cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30F3841455;
	Wed, 21 Jan 2026 08:41:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F4138160
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 08:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA99D610FB
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 08:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o6Jat3zvRRM7 for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 08:41:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=nolange79@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 04669610F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04669610F9
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04669610F9
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 08:41:53 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-4359249bbacso334552f8f.0
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 00:41:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768984912; x=1769589712;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lZdDyxRkSAi8JGi9Ufw2kaw7OR4jL8lpi28NmwpB/6s=;
 b=Wkd6iRk3sPcmoeTxvuxM74b/DQ8cFx+gC56e+9cgZ3AskPI3QYucjw94MO5za/myUG
 DfEBBlKPYjFXuTGBKjyGfN2SLOXtGoazXGuwmsTmEpgYyj0czy+/H0nFrBFKpaWymhMG
 JHmnU4vmnRN1rfHAnYaBKL0z9xRPK6ydLWpJoe9YZzZ0qKBNAJh3Lqn01AMhI7FRWQRU
 Iu24uAlW9jxKdoOjCKEXw0TccF4RgnbDPAEz/RuIvwzypK5TtKaM5kVwA6ypZP5d4jHK
 LqVK258j3xulX2spCo5juopGuAtmFahMdboLUAd2qvdE/K7I98zMsb3oXbqjb9KllnY/
 c+Ww==
X-Gm-Message-State: AOJu0YxRnRVg1codYcqZuyzRBzAZp2yKmv9CNqCMekQAJJFMANMxlSNq
 xvCAZ/6DLxtvRajl7ufFkhiwJYmK+3mdyXhe0iTPO5w+VBNLq7JJxPjh/cZnrw==
X-Gm-Gg: AZuq6aIZHkQiqQ1sXNemXDEZGE4mjG+suvFuBqhaXkLRvQZYx28ActVANErf0q04idM
 6GDbdVj6Zk4V6LHjXGxtk/UMLZuxUReLcoh+z9TjhuaW+phRPbkl0huYtb+jS1csUqFdBQHM0j+
 zfJ/Dv/UnZca/iWFkwa6wqMiPNrZK/6yA2c1Bl6Yyj0xWLMi0W3rovn+mUXXmH6O4txYso8Rhlu
 cms6XKXukvuK6S/+ISSyUVwcfztX9kscgT2OvkZkXwhb7AhD/x5PC4LMMBdyqI1J1cfCd2FpyCn
 u1E0zW6PCc9TPP490+9kWGuttsZlAoAC1n16rIFn8oToHHANOJ3it6CXEYyWEaT6udnjIgQ9/sU
 FzLSLTPRsuksjqj5LFrxAcIcPlxRxVNu5hBeiG3W3JM5PWnSdOzZMcbHSo6bjbi0ajt7ynGytcP
 3JUyyfZ6UPvclhxOgwGtS8K89YGxZvvZgkpjBBNy6V63D6NJpIufupEA==
X-Received: by 2002:a05:6000:4387:b0:431:2ff:128f with SMTP id
 ffacd0b85a97d-4356953f817mr26012133f8f.6.1768984911865; 
 Wed, 21 Jan 2026 00:41:51 -0800 (PST)
Received: from vcllano-01.. ([80.120.136.76]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569921dddsm36249438f8f.6.2026.01.21.00.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 00:41:51 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>
Date: Wed, 21 Jan 2026 09:41:48 +0100
Message-ID: <20260121084148.3613545-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768984912; x=1769589712; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lZdDyxRkSAi8JGi9Ufw2kaw7OR4jL8lpi28NmwpB/6s=;
 b=SvN12QUMzD7wCsRstm+JOIJWl0TP1zc+qn/H0FcsKpEZDezpTKlVhqorsXY3+borOU
 1saQ1GDg4IWq3Bj33GxitgcgoCxy5oj0qgJPiuvMY+77Xhm0jrX4wWtuP8qP/y4GelY3
 ZkW2P6IbLhi68cmQ9R4Pz13YMkteMhXSb2EG/v+eJvAK9ytV6eF9tZUF+WuVvhyk1bz5
 euY/P/kPreUudzOWCoXZaBUJmz4KMV668n6ichJQGuFwnMS8T4DB3wbXstRUqL6xjfE+
 Smy2ngRTQcxBHm88nk+UgOLQgOsGfvKhTwRYirCuWiqakU6zZIQbFqcSChhP5QPERt5u
 rHtg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SvN12QUM
Subject: [Buildroot] [PATCH 1/1] package/dbus-broker: install dbus.socket
 for session bus
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The unit file for the per-user session bus was missing,
copy the file from the dbus package and install it.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/dbus-broker/dbus-broker.mk   | 5 +++++
 package/dbus-broker/dbus-user.socket | 6 ++++++
 2 files changed, 11 insertions(+)
 create mode 100644 package/dbus-broker/dbus-user.socket

diff --git a/package/dbus-broker/dbus-broker.mk b/package/dbus-broker/dbus-broker.mk
index 7e029879f9..b3723a1114 100644
--- a/package/dbus-broker/dbus-broker.mk
+++ b/package/dbus-broker/dbus-broker.mk
@@ -62,8 +62,13 @@ define DBUS_BROKER_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/share/dbus-1/system.conf
 	$(INSTALL) -D -m 0644 $(DBUS_BROKER_PKGDIR)/dbus.socket \
 		$(TARGET_DIR)/usr/lib/systemd/system/dbus.socket
+	$(INSTALL) -D -m 0644 $(DBUS_BROKER_PKGDIR)/dbus-user.socket \
+		$(TARGET_DIR)/usr/lib/systemd/user/dbus.socket
+	mkdir -p $(TARGET_DIR)/usr/lib/systemd/user/sockets.target.wants
 	$(HOST_MAKE_ENV) ln -sf ../dbus.socket \
 		$(TARGET_DIR)/usr/lib/systemd/system/sockets.target.wants/dbus.socket
+	$(HOST_MAKE_ENV) ln -sf ../dbus.socket \
+		$(TARGET_DIR)/usr/lib/systemd/user/sockets.target.wants/dbus.socket
 endef
 
 $(eval $(meson-package))
diff --git a/package/dbus-broker/dbus-user.socket b/package/dbus-broker/dbus-user.socket
new file mode 100644
index 0000000000..dc5ed8995d
--- /dev/null
+++ b/package/dbus-broker/dbus-user.socket
@@ -0,0 +1,6 @@
+[Unit]
+Description=D-Bus User Message Bus Socket
+
+[Socket]
+ListenStream=%t/bus
+ExecStartPost=-/usr/bin/systemctl --user set-environment DBUS_SESSION_BUS_ADDRESS=unix:path=%t/bus
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
