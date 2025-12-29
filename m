Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C15E9271B
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 09:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E85380D4E;
	Mon, 29 Dec 2025 09:07:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CG25Z62mRFFq; Mon, 29 Dec 2025 09:07:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09DAB80C8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766999258;
	bh=d4t2l7k/OVwuq+VDck4rOkaSHbrpOVEAXIiasc3bbbs=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=WBVc0LzPzZciunovLCrk/9uyw0m6xHMBfWZy4/h66uqsyOdl6sAx6rJbb+7szCnic
	 1F69XgiXvJQg8uK4tHZnLEbDxjArEOXcKlkjngIGARYarKB0Oyd42fFk8wcuCyJq+q
	 yg/orNY7q5x4CSV0TlY3qXEOdYXfFmBPK157YMOmhIqyoq7OyuVKN3j5AHOyb9mf21
	 x8fAY1yeifO+T/imtQ5JM2k53EVa1P8/kmSiBvQ0JoLrDgqt311gkAa+R0XkQuCmFZ
	 gKZfjqVQpXFpuCYmGEm2flHoPF5qRdBipAUmzkeULI41AnY3ewesz5A/ZHIDxihjFj
	 lh3UfbGw2Xkhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09DAB80C8B;
	Mon, 29 Dec 2025 09:07:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25C60B9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2106F407A2
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1hSqEfGW-YbB for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 09:07:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E5C3640797
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5C3640797
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5C3640797
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:32 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so54227555e9.1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 01:07:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766999251; x=1767604051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ShqPIkx4NXot6YIF2K7TZ4UBVj8YKI0/7lq8mm7GmOY=;
 b=feuROjNukPiI2QRSEV29Kfn7PSMf3NvP/HxMv+pIbKGaXR8TNIn3VoQHhCAvfogELG
 EIetzJcCm2G7zKazZpRX7rwLWP0nccT+CRpZyngQtjWf7165duecVU87b6M+Ezpsa9xP
 TNbOiD8LnACGiA3qbYj+4TzF6HXUsTyIe+R10GlN+HNdpLXn8v8cGB+iVqvwIWY6WSZC
 hAVBeiVrrLie5I/+b+C867cQE6aRA+ucnpES+KeXzjuryjte36SJu1OdSCZaw1qL6IYM
 qrRp2u79a5B5fcnk5DVqxtonmyr6qc8D5kd8dqByxX8ydPKycgPMB0nASHysUqqgLoU2
 owRA==
X-Gm-Message-State: AOJu0Yy2+C/LiErZEX8adoylty3PweAdFfJRJE69yRUNCr0qfO9K/3pL
 FzRLYrJiW7rywh+YT0jgHl18eQ9Ad5bxjPhjgTk6exaxS4+d5LkKvd/n2w1gN2ZmuPOOL3jN0F1
 /wDm1PMo=
X-Gm-Gg: AY/fxX5h5lAcQhwrGV3RoG5+bqdtLhL0lw+9MXUoy9bpvN/H85M92V8uviExss/jvnM
 qvrOMFS7r7x2GSiy+4RQAb67bCq3l8ibNyiuMHJL98mU+fyZzCNLXtGA91TFupwWJj0/YxqXrc6
 W33k1AmriXH+RL2OJrGidsdwbb5vnoLJHj2rgy7+yaLjf0DzJ+QTXWlCIB8YP1/151l60qRmv1n
 63qQcIOrbHdJ2vk9zUfDLBB5H2tMn7T9Yi0zV4ZhEbu4KpVtdmycYM6Vn6TiFbiD6CxHQH9WqAj
 Sg6aFkAJUFD/VqULr+rRWL22qbnbE4S4n2hj/oG/38k84JSQMaXZB95ekrU2YLE0b5NFxZn0arI
 Apfo37wteBl7I9LNOOZRq/vJK355jn6Hcs9QGdLeAaPvvydjy7g41n1tYgT0kcWnnIHVXiokF78
 rqJQlvurH+wahWx5aHeE1+RliOKXozHhH3UrqbqU55qNk4lDYrBl7WBLEJn4FGBedrQC04qruIV
 b/uWtBxtdN+
X-Google-Smtp-Source: AGHT+IGP0G8VZZHaknwzqawjn35GB8VgKLuaIGY9SZ0Zch5/HCuYi+u9Y4SxpocvI2tAkgdMRFBheA==
X-Received: by 2002:a05:600c:c493:b0:45d:5c71:769d with SMTP id
 5b1f17b1804b1-47d18ba7befmr310965175e9.8.1766999250666; 
 Mon, 29 Dec 2025 01:07:30 -0800 (PST)
Received: from mindpad (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193d4f09sm538910175e9.12.2025.12.29.01.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 01:07:29 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 10:07:12 +0100
Message-ID: <20251229090719.13291-7-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229090719.13291-1-thomas.perale@mind.be>
References: <20251229090719.13291-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766999251; x=1767604051; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ShqPIkx4NXot6YIF2K7TZ4UBVj8YKI0/7lq8mm7GmOY=;
 b=Ea5JHoO2eDNvHukLaI39qx1MUBzC/7SvD4p8pesXz/ui+03TrlgaA0bB5TmzsVDKXs
 UnhyLfMd3gl9pdAJofQs+ROKmmRiN2EDaNKFGkldKl+weOhtmjFhfprKDyWjkJvsS8Nn
 ctsCP+r7tJIVc2GACRlrJxRKJv1+6IF4i0qasMLRHrTLV01FnFJ09YK5UFQKQ07grpbx
 R7Q9l40MOipOn+zS9Szrs4WIp3/BN6mahdsfjbdwXaX155YRJ4WW3MAlcikNTkkJ6P3F
 0jeypSjcSqhydx23mV6v7WJyXx082f6fEqckET6K4mWtXWbGF8GHzxeJW+Lo/XE17m4f
 zLkg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ea5JHoO2
Subject: [Buildroot] [PATCH 07/14] package/avahi: add CVE trailer in patch
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Bernd Kuhls <bernd@kuhls.net>, Gilles Talis <gilles.talis@gmail.com>,
 Martin Kepplinger <martink@posteo.de>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Joachim Wiberg <troglobit@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header
and adds the `Upstream` trailer.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch b/package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch
index 7e191e8da7..98d5dbf633 100644
--- a/package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch
+++ b/package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch
@@ -9,6 +9,8 @@ Add missing NULL pointer checks to fix it.
 
 Introduced in #175 - merge commit 8f75a045709a780c8cf92a6a21e9d35b593bdecd
 
+CVE: CVE-2021-36217
+Upstream: https://github.com/lathiat/avahi/commit/9d31939e55280a733d930b15ac9e4dda4497680c
 [Retrieved from:
 https://github.com/lathiat/avahi/commit/9d31939e55280a733d930b15ac9e4dda4497680c]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
