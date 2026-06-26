Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2BCC43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75DBE40851;
	Fri, 26 Jun 2026 14:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pq2ahKzWItfM; Fri, 26 Jun 2026 14:55:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28C324078A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485735;
	bh=pbZvEw+pBSEVUx/OTL6cfEkc8FCSi7DHB19lIDTWxOk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mdfV1AzwjHIzu9aLdjzW8TgmNou+6zRDhAXlwcW8E2UNbrgQLoSDu4NvikWE73lC+
	 CQ3O3uqGv268ED+aTt1QqsW1DLNOBd8RmnRO7ZBf/h8aRusVy1jvCHeFBkDr3MPPgt
	 ipq4dcyxa6o9Nis7mPL26rn15D1q9S6BIiBafOBdjJgvcsJ6uNfQVaMofwhFrEZP8u
	 OS1uMLeLXK9mCk5TCbWUm0EeEUEPP/KJ4XLpJ2agRw/NMABEX5FLUGZkPvF4ms6Hmf
	 dlYgRxyT2O/vUY3ypUZ+iEggko+vf/XNruUovZIigwNCjOX+WoPMrqYzeWUB5u0TT3
	 z9x4USgAVR/3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28C324078A;
	Fri, 26 Jun 2026 14:55:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AECF3A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E75160FA9
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jy8bOjA6NggN for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:55:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8944960EA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8944960EA2
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8944960EA2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:28 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-46f34d8f888so717313f8f.2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485726; x=1783090526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Wl0DFLRcDMNIJKvHveC7dLPZlLq8VrIhOR8z+kxoHHk=;
 b=N04+KVSDkub8GPslD683EYWBEfZrnNK4R9IFRAZGOB7P/CTpKB9THYnyT89McAdShl
 qE9t9ZObnkDwYHnH16tH9JrTtASlte4lkT+4j0sKdZC1kkcXhEqzIZiJo4Y/49hlNIGX
 cXTS8slD87r4dcB4ld0+14b9vBbjHPsuRkxy2rMgvGRczJtwMMuvGLjF1svS3GR4ixES
 7eMWquGbwMuC3y9r7JP/3kuJrKaxmuyc0EJFvgpxewlNL6tn3U4p1Pegu0FOdS19UhEK
 aPMx+OVMKkC35ofuain3tf0SOeoaXsg/LvdovejIyfrKLIfYcQ1fsbCEd3l///H3q5XO
 xBHA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8vCQ1sE0gA01dZ545FYSEEDXyaVjUd8trkV7epd+TbWue67foyw/DvivOxeCqsfc9vTabHQ9BnlHI=@buildroot.org
X-Gm-Message-State: AOJu0YxkJPO6OTtLzrkYdyzbzBNMXhdTBkYqwFLlwVYJ/O9i2G7H/XnO
 PKARPwGdhWVk81AYIBHqZelZJZYadwESQP8Wp2kxWWjQ31JvCg+BNNAoccBSn5dMwIceW0ZKSux
 8ybWf
X-Gm-Gg: AfdE7clfBbuaXne5VTnzki3vf1gR/rlvm9QAHffG7/B9qHSP+6Ig+TcrfM2iudKT/i0
 G00uvSwbwL63UVvLk8nQ3x/xfiZ+JO5lOMY0j1tbFjM68WqAl99141V1LjxSjQI+jcbzKUjvH2O
 egGS6pZC9r+4mv9wFNj9yT9pdemRnX87/H53dULgImyktWmltYTW6LImSdU8WaS1SwNDYXcTozm
 QSlyWA7j0rdDxz5lsY6t6w1R3tgqeYEuZ790vihS8EEjfXbwk8LFLrldySYAie+fUx/T/7t+fYT
 2Al8O5VHrN26+jD2QCJ4/EZmL/AwBGrG2uA098CD03jEyJGQLuKsUlNPITFqRDOfhR3WqjSWa8+
 +ufsNRC6k5IWT9BhqQRK0avxNUCLgkg913J/74t22v+9NFVU0aKzv+FuSSUY8jRnFXE9ddlOGjP
 TXbDq+
X-Received: by 2002:a05:600c:3acd:b0:492:6da2:5f0e with SMTP id
 5b1f17b1804b1-4926da25f4dmr27916265e9.32.1782485726257; 
 Fri, 26 Jun 2026 07:55:26 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1ee0189esm26645367f8f.9.2026.06.26.07.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:55:26 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:55:25 +0200
Message-ID: <20260626145525.342895-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618124835.2935850-13-peter@korsgaard.com>
References: <20260618124835.2935850-13-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485726; x=1783090526; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wl0DFLRcDMNIJKvHveC7dLPZlLq8VrIhOR8z+kxoHHk=;
 b=OZW/MgBg0/u+7QdQUrcPme1LSHxmbf5rnBtfniGyh8sthFcqJS5J8+B6LrcH/Qj5KT
 Jbxm+zzYsri20zr/mqbXQ1+Fx8b1UtbXei+Fa2xMfQ7QW8mlZvOeoo6kBVGh9fJ5J7lz
 wJKv5+xZir1YW9hic6RvgLPZzK0s/+WUapcGqZUMxmx0KKM5yzzKaJsvQu4QtdU38hNw
 sx86PxzrdUe+VtGeVLsXtgy7R0B3u5/jTKGhMcdELCU4Hg2yzK2qeyn4uJzxMCrBge4E
 yJa7SxHqWnkxNw/VTooYcspc50d1a4zFN0jBpZw1NQFvY+Uk3Y0rudyJ1WakH80REshA
 6ztQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OZW/MgBg
Subject: Re: [Buildroot] [PATCH 13/29] support/testing: test_iptables.py:
 use assertRunNotOk()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Use the helper to simplify the test.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2026.05.x. Thanks

> ---
>  support/testing/tests/package/test_iptables.py | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_iptables.py b/support/testing/tests/package/test_iptables.py
> index 6e4db0ac06..72f2dd71a4 100644
> --- a/support/testing/tests/package/test_iptables.py
> +++ b/support/testing/tests/package/test_iptables.py
> @@ -68,8 +68,7 @@ class TestIptables(infra.basetest.BRTest):
>          # A ping to 127.0.0.2 is expected to fail, because our rule is
>          # supposed to drop it.
>          ping_test_cmd = ping_cmd_prefix + "127.0.0.2"
> -        _, exit_code = self.emulator.run(ping_test_cmd)
> -        self.assertNotEqual(exit_code, 0)
> +        self.assertRunNotOk(ping_test_cmd)
>  
>          # Save the current rules to test the init script later.
>          self.assertRunOk("/etc/init.d/S35iptables save")
> @@ -85,8 +84,7 @@ class TestIptables(infra.basetest.BRTest):
>          self.assertRunOk("/etc/init.d/S35iptables start")
>  
>          # Ping to 127.0.0.2 is expected to fail again.
> -        _, exit_code = self.emulator.run(ping_test_cmd)
> -        self.assertNotEqual(exit_code, 0)
> +        self.assertRunNotOk(ping_test_cmd)
>  
>          # And flush the rules again.
>          self.assertRunOk("/etc/init.d/S35iptables stop")
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
