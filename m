Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0957CC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 23:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4897A80D6E;
	Tue, 13 Oct 2026 23:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cRrS7r7pMg7G; Tue, 13 Oct 2026 23:29:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 56A3E80D84
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791934198;
	b=K6xFeZdTCfNmI7IU5GQE092upB/tsf/Y4OziIwWqtiuqEdTOKnJd+m64oBAa71PD9AjY
	 BOH0qhuUlkpggByG1J14UjP2idn6JPgzhfe3HrdQ4EaBwYyBdYCs7HiNh13JQnSMD+Rmr
	 I/ZRTvGYurlriEiDDmAzFbagsR1gKH1KQ8Byrdl7pUS+jUQ+X+cKPN5lqKs1aeHLkAjP4
	 Sq2C+RwIMZm+gNliIR94Md3tgZ+rB3pcXIGR8fcrUZOorFB42xfGWj07RH20LKYls5e8N
	 X+oS6iihdfI8xEa55uQpHwN4ixA+11It+2mnLL+EOG4g+aT5KzDtvGFbW8nQqFcXRAg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791934198;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=FxLPJsi2S3Uprl0U1h8WlaEpUKLq7dU9O2jmrYdZUog=;
	b=AzxwJFBhYTIgBp6OTpQ1WCxfQOmxkEdAysn9PNxKgQ2lrSelBuYgL44FwH71R/iMtJJV
	 D5riptRezX1UhWZp3CbUCfzOiCYhMhLzni/lmEA30CzZYza5+NF9fLt73WfbpVls22Wp6
	 O6mfGypJUkLYhVxKfCXvw5Vx7DHw6VgbS4cdRS5hYT1EnArNWw6MMCRZ51kv+6STc2Osy
	 EuRrPfqpCzNpNVDlMnLlYTpYmqblgss8wZViWbLwLQ5QDJtEUMVNXj7hqRw+6cq+kelPL
	 4CfOtpXO+Ef9X7uAjosAhuPTBlhEy7+QIEkP+sWdGoyej5WqIEUzACIMS4Nmktts25Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791934198;
	bh=FxLPJsi2S3Uprl0U1h8WlaEpUKLq7dU9O2jmrYdZUog=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=g+69ZPo1JGlBpXJQwl2TkCZt8S4iO+H9cM60NZNAvq5bQ8TTGllV5hyS0cUgD+oV6
	 1rDsNGgUXNUpxVlkEneQ80L7kK2j98WkrQhGxHV1jVY/Ngeda2gSCD8TUwKJUyTPMS
	 3MvlffdeStDOVse0Vhv/jdfMQ+yQSmm7LVx3qJ0XLpzu9KzEzM4rccn5BDX+oTmexd
	 9kJD/3FUKwnIIgKLwvaNVa9YY+RRRC905/GZJ2I30I1m7hTJoqNpnVTF3tpmiq5gzK
	 ZJdlUyYyhT2b69+8k/JpcaLADf/5HU+zy/Xi4EVhadIh7ab98EiS+Z4sIaVlp7J9Ra
	 5S6NX9XI/A5Yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56A3E80D84;
	Tue, 13 Oct 2026 23:29:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4661F75
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D0CD4070D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J1UB0fZXwSDV for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 23:29:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 80626406E1
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c32"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791934193;
 b=YH0Bqf59K8uSd4TbFO2sIl+FEf8wgXNz5k3LQroh48pPiduwPw97CKkEAx0oyn8AilxX
 by3REIQUU2nzfSMGLHd47Oa18jrgjAZ1wlws4LzSlWqpQxrw6XOyvbE/AFIXEAZAiD+hL
 bci54N6U+H1pe7WxeIZOS2muN9Tbor1MUjN3yeWlaJfDr43VugHpfdTFt32AJ2m9uw7e4
 OwpGoLjYZZur3r+5/qpnL+vUrE2i/solv6atN1jlPovcKzjQTls6luEjW+DftTxOz9kWF
 emZSS2pXGDSlfUZIWEaX1WbrgvGDoeZTDIfV/aa850FboEYroOWDk3YS2Ooz+WJib6w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791934193;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=zKsxI0wed6HGlprP6z/a4eB/Kn8vzwMpOH0LCF0e1vk=;
 b=RT6Z7wKVKUSxHlItH7l/ihvzi79dWxbHIU8zs+o2ohALvi9HYh9+dLiwX6/qaaiXOksV
 eQR+CnJLZk3AsxFX7DrSs75a18IVvlPYWxK4M9MrZoWMyr0+fVO2CF7VnmKZ3PFWFIXxU
 nZfpHKbVDz+uz4ldRBdjnba2r8/7K2FZHPMoDyelCDRldlc9IDvyKay4U4TSZAgu3Svqo
 oKocE/+FnoyKqyDe8eEYnATnTMYMc/nbOcYd5hUqPiBW/tjb7yEtJv5GsdAdW/LHuNfyX
 pJcXlEuvNCC/ajeSOQv3gPCHaNtA7khZhj/BfFgGx47+rbBOsS9f6vbJW/BXTLKWefA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=IKp7UWaR; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c32"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c32; helo=mail-oo1-xc32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=IKp7UWaR
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80626406E1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:29:53 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-6c1983dfaffso333194eaf.2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791934192; x=1792538992; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zKsxI0wed6HGlprP6z/a4eB/Kn8vzwMpOH0LCF0e1vk=;
 b=IKp7UWaRtBKpCUp9XAItZuqJGoy5wyLzlz17Tc/htP4cuYUSTe2Pgs0Taz8Q67HcSt
 QvGYxABls1I7vBH10gPIorZlWeCJmEDiWt5CuFkZSDn7OX9IflqyylmpZotGFuTMH/5H
 pcQrNhebG/9uYcmjmpCOq7rCaQzTyOm7sW7bTLVdq4s5fMeobAAamR2AY8ki0qArSm4b
 jtw8pEbsAaComzD60NX1wQ59D4k4N7XE8aw6uLqIp5lE7GdyzH3PGIu03oOctMnGFTHh
 QNOlCDVpX/H+FBQCbUK4M7SqLCzOzpm++5Ai0uy3rfS4/+1XvccFrDcv0El/Mfp69hkz
 5Cjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791934192; x=1792538992;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zKsxI0wed6HGlprP6z/a4eB/Kn8vzwMpOH0LCF0e1vk=;
 b=FoGkCAm3cLKObxrzodc6f4xlI+79UoxaIer4JlgPxSBtT95CzGZahmK6aM49taxNXF
 brGvqInAxR5QilB8Cjd9aBH6Bo8nWG+wQV+mJ1blZ4HtsI+6vVd7oWwiKzBa5Q4JCwsn
 DZJbb8EQPLbH1TsPnpm5YCUSO+TL0zjjwZOQdVLPnbXxasnDRl+iPaJPoCDY2ui7TIy9
 wa6GmaEVAxvLS0kQLsyRiTatn+YkWQeOSEy5gBaKqoMJmxFb/QULblC8ycKJS+dA/c1K
 t+UFG1Sg4WoxUYBM7s0iTLwFt50ixhijD+SxUYFOus8YRCY3d0rcA6sNos6uMZSYI+mC
 gytQ==
X-Gm-Message-State: AFq9FYLhyRF8y0XKBCccDOuWSR1VoidcRo1/duiJwTGeF+W5BMSuR7tC
 j7Njka0YRHMrrp6wGDFCEUZy04UerMXUrCG6eE2Giu+/mIzRPsBRri9yJ4nW0xQn
X-Gm-Gg: AYBFou3RODlMhnL+qUWKZcxhlD4kh16R7013QcZoC8fQNugaXox23PAYg2bQkaH5QIt
 3Hw55Lr1RaizE9o9brrNkOyRalyzr+3CkRwXv+aU7APbJIul8mBkMpEtmnTm5/00HLP9MZ0YOaI
 ulG9TNw+DwM5cWjzqEHWZhcCYOk2vkvOYlj1IuOxCjOOjcL5wO6rmyddwgAHtN5QEbZf2vD+ZRo
 t0CeCVgpf6CZ4j6uCRj27xwimOfJsSOPWrtxXgQybXZvvSK5I9309T/ViXqWO+TtkpjFKayyKm5
 h41bVAsLOKZ7R1qeV0zpeLWESiOg5+hAjhQ6zjOjYk5n8COA3RPCzOUANhsONwPnoL4VLrqnVOH
 42KOmFGhccN/tdBYPvpbAojcxDoTa56y7DqAwD7LyvLsLr8wQ58fesrSCRYxy03BBCRPn5lkzAf
 edGB0jbESdwkqWw6VgCoVffpn9WyqPD6O9XFJKYGG7hWmMI2jVmDitVPiojHg0lZ1Cs0Qkh8WMf
 Kmq4G5iLug7y8XCt+Y255i+DNDoC2/hNs8zGSNW1f7UZ5MWhKYaQaVcISD6dahUI6hdue0AQc6x
 viVgHI3hVu5SUuoSNYqX0nODhiNKTFxwC1GDUZR7n4Yxc3881LisalaHCZoRiR5ZFJ3LFAvQ7Zd
 g5qk89X/ZVnpx3rxZIx+mz3hDYu7qLEy5XXxEMv8o/P6WzHXRJLzogw==
X-Received: by 2002:a05:6820:818a:b0:6b7:2cab:be91 with SMTP id
 006d021491bc7-6ef08c78d30mr10102410eaf.10.1791934192243; 
 Tue, 13 Oct 2026 16:29:52 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6dfbd6a92sm828514fac.9.2026.10.13.16.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 16:29:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 17:29:37 -0600
Message-ID: <20261013232940.2690456-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013232940.2690456-1-james.hilliard1@gmail.com>
References: <20261013232940.2690456-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 6/9] package/python-jaraco-text: add host variant
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable a host variant for the standalone pkg_resources package.
Include its runtime dependencies as well as setuptools-scm, which is
needed to build the package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jaraco-text/python-jaraco-text.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/python-jaraco-text/python-jaraco-text.mk b/package/python-jaraco-text/python-jaraco-text.mk
index 2d612196a6..75536c6e3f 100644
--- a/package/python-jaraco-text/python-jaraco-text.mk
+++ b/package/python-jaraco-text/python-jaraco-text.mk
@@ -11,5 +11,12 @@ PYTHON_JARACO_TEXT_SETUP_TYPE = setuptools
 PYTHON_JARACO_TEXT_LICENSE = MIT
 PYTHON_JARACO_TEXT_LICENSE_FILES = LICENSE
 PYTHON_JARACO_TEXT_DEPENDENCIES = host-python-setuptools-scm
+HOST_PYTHON_JARACO_TEXT_DEPENDENCIES = \
+	host-python-autocommand \
+	host-python-jaraco-context \
+	host-python-jaraco-functools \
+	host-python-more-itertools \
+	host-python-setuptools-scm
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
