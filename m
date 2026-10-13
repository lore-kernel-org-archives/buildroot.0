Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C646BCC6B0E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9065A80CF1;
	Tue, 13 Oct 2026 16:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wGD1NH2S3DDR; Tue, 13 Oct 2026 16:43:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AE3D280EC1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909839;
	b=e0DApPrOEzmP1eNpTOxKbxug1LuXBWg0tI1QIgR0TUSLb/HwtORQLAwa/3PL+52jA/oL
	 XNefEfBAyPufsdwP4ZmJ99MuOOUWTYoQwCS2CoMRZwr4U/fl8CwGMz6g9Tl8+XpM5MF+E
	 ttDoGwtdLaltocFDUY30oyF0h5LRzDwrFjQs1eZJa0fUeY9lJYTaIt5HCLWU0cSoGJejg
	 GpZfSp+A6YtGgxV+nosq+W7i6YqZmXyWM8zDtqdWMVvhExWjTwrShOL6qTyq1C/jj1sON
	 D5J5Ov0AQi5EUbQvUzOXSuqNKmNVZd7zP83WC7q87UFN/pTPH/trriRkXZ9XqOv0nnQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909839;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=qd40fjpQI0Wk79tfvIeGBA87qt+9Z6JgfaS2awIdBpQ=;
	b=WyLJhKqz2fXhyBxj/a+aZePjnsCmJGhuW5ucUweX2wg/Jv1Tjx6MN3QoCmEdivrbchcr
	 bEsG9aTxbJ96IR8orpEXZN388fmxSNPet6WIYlZ3e20lsshBiF5cG1J/s2Dg3DOoAg1ZL
	 CmVO9pzdEOwH9xDuTpk0OnNiuwwCFzXSA9ZLkOHtyT+aROwEfeGzhBiZpA1O5coNLI1u9
	 ETFvLyc5v2SRuCU0sikDw2HgmBCd9bV3P0qhRonVFKRFnw+tkXXwcxro9q+NE3QCNJvOL
	 8SMGcXh3vijGlZqrpi1C0aDprH9FkNM3exRQNMiOvlHP8a/YqasUxDjzrrpdHvrwknw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909839;
	bh=qd40fjpQI0Wk79tfvIeGBA87qt+9Z6JgfaS2awIdBpQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=PD/R7GukJPN0Xt81leVa0jl6QvbeySog6Ngpqw4fgoHsjjCM+nzJgZ5WDlsss8jKE
	 kecv7pD2nQ7dqKIY/rS8MsCSZWmOBPLBf5lWpwpqo5xzhKiYkskmtyONoGVJsrWJSw
	 SM3aHqMxcJgRH+vOTY/XcieC1j8DU8Z94+MiMGLJxuxXbF/6TFT+UJJiFCbWW+MC+I
	 Vw2OIMojDr4J/JOrrkJoVVPEPXdqiUsy8HCnIijfyHRDlFvJ+J2pJGtUWzkOvGO6oY
	 ZrXEIJoZxA7LvcfvLju5bujBLZUol4la6GxGZ58x2OtpebnWTXZ96KBl/3xZd56vz0
	 G9BwhHpFczq4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE3D280EC1;
	Tue, 13 Oct 2026 16:43:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 58257129B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A3E1607DC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l0k7oYvFEfhU for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 530C660789
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::31"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909831;
 b=TrqCauixIBJxzH88w4Fl6LrvpYd3qz31UbORZ3sXQd0Yo16QU8weOJViFl6noaGm6HCp
 LXA0EaLR68nQvjJdfP2HK9KVcX0SelOwXdhOUKbxjqB7Fuu1iX8YplQ+Fgeh+3hoCntmv
 aL0VTg70ea97nKZTZqNKT8PSQfTI5JFwsjLRh514jcYTtyKHEyHDs5QlglYVq53efcdRt
 3t5BhZB/T98gyFruAQuKwbjpZJhNiItp5tUiotFuhbIaJ9KbC/2lj5f5c64LG7aDypPuI
 uJMkY7sDiYr/CLYj/Cd94i7wgt3eF4lI/mvA7PgvTnLcBxiI3ajAE6O3DByXVV7PNRA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909831;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Jdgi5UIhE1KdgfHXhLwV4Mbm29uUtMkeKZ4/ww0PceM=;
 b=MIbKk8k9MUdMEsFsuV69E4GQDyd7etfxCywuQVi9XvUeQS1yFxFq2R2mKEPQHGLUgG1J
 DrwqtGoKtEyrZKB3ODWbPI6PMh6DEZAGfmJsub0g91WKXNUrzKaf8VdTG9grG+3PA+KdN
 9qxgfEfOH0F8YThgunV/rHE3UkM9oTaPZAFyCEFHH0AC1qaI3NAdx8gdB2VnOTyKAe7NG
 A8wgmydmQsatF5GMY77St+jIjMqVZJuKRay1XNV+juntRHlE+IOatPD0OinRw5Dw7zshn
 ExO06s2fUeKOOrHm27QGqJpzmPyRmsA5ucwkzXwURYhbmTAgtU771ORXcX3x9+lr3yg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=inaWs7I6; 
 arc=none smtp.remote-ip="2001:4860:4864:20::31"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::31; helo=mail-oa1-x31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=inaWs7I6
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 530C660789
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:50 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-49e0ee9e7afso951528fac.2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909830; x=1792514630; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Jdgi5UIhE1KdgfHXhLwV4Mbm29uUtMkeKZ4/ww0PceM=;
 b=inaWs7I6PIpu573vNqSrdmm7rfPHnGkTzJYvIMe4HOW3w4OcqzuBxgoYc6zH6UtgdY
 oKvnZfvDXJqeqFazU8MRlftApyNX00CeBb4hIuMKhCWyvyhBrks+/1dIh42WcVVRnQdk
 bMlyO9NdWAkN1GpjAvfIjfLWM0Pj5mApvXxL0EBbMkxr6HHF/a3c203qjktZrNMYkYQU
 rOvN0MzBjSpPJLEDX/bGXOmzQnwxWJlqDETs0+KLHldTe8tUVO7QO0m0wyq5g3spJQky
 U0qIzsRQ2O2Sqtr5WK8YTLkSplx/m6vEukygPcjidDsW2LbVFfOn+UJizl2Jvhft+7wB
 BFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909830; x=1792514630;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Jdgi5UIhE1KdgfHXhLwV4Mbm29uUtMkeKZ4/ww0PceM=;
 b=bQe2Uy0f51JfGcl4zHdHTf/1/g6IGQn3waNsQ37EFDVkdLWKSIUkBeNmiEwKfvKjdP
 4K6FZ2H4UShN48JofY/B6cKGNDRrH1ZdjD2KMfP8TWI5c5PwoND0BNTPoJQ8Lka42UjC
 i8yHWe1Bla5Z1rlsOifE2mxN+XcU1odSNbldUdfyfZRAKBNCmuSvmk7dSPVxYdIHWGVE
 /yux9BtH2upKRy31dV4R763faHntiGF3gYA3X1ONxqJ8eyczOFPb+D55vsfWnhRJmdWP
 cfa5Mt8xBLb4erLunVu8FveXk16b7OqsAah5sSUWIaDv4NsoQl01tbc37D15MNofqoIX
 o8/Q==
X-Gm-Message-State: AFq9FYLxvIB8j/Clyc+sIyFpcItjbbF7xv9g0eVQBKxQLxoCEtYEAMCo
 rmo0QLb5QefFtJz1hjrw7hcT9tgbUY+Ry0LP4I3hv8M+zDwKs34qBS5htBpNXg==
X-Gm-Gg: AYBFou3cZk4AzT70N7ESK9RPtyNmJ5XIGhPVTGrD+43L8MvhUfkqVlIPQQcaJt1ou86
 kttAJ76QCrhd1d9dyVnt4BoYWQvMeJ+83VzWvM5lyc0+uj9mvjcuPOsqSOGQI1tkngxk1h7laHS
 6lqo1h3WN2EXnLRkcxaEK8HASjgdtPI9t8kfUcLRj/7Wfc4zMqp6FJNXEGVfd3tVRa4LJjSPi84
 YMXBetcaV1Xz9+0ZYL7b4ymaURYFlzg1dCL9+q5GtKxkoh7rBvgkNIHpqafQeIrjx3Aw5KRrwN6
 3KnuoQ27EKXX37g9L2/wuivN9T1w9y9PgIL0wb2MpRZi+JPOGX+du0B2Iwyc5J/EHRorIkLoyOw
 qdPgZR80WcSpMHDIPEq2PajxPeRKRXDEA8rk7nCxexhe7PURIgaCQI0GW9gHxH44sIk7AWTkOHp
 7VThCws+z/waxA7+i+zX4VaHHETVFZypRi/imClYW7iJX/qo6c70z9eJA7PTsf5TT1b/ed/uZ52
 dcUhdO0POeD2ufI0W/QNZMv9QcIcAya8LXpSK0h5gnopJiKs0dWKaIxXG6yvPYCLqbIhc1UZ1ic
 Kezktm7/XlV1QOvc42POrXPOg7cQyBgo2HVq8+tDKfK7nrHaoX/8hpmIYaESgfXxjNljWEjW0rt
 AM92P4cSa3f4TZ5EApNbABfrhFI6HpTGnwBDUcNMJrzPjIRX6JJVyIA==
X-Received: by 2002:a05:6870:32ce:b0:493:bd68:526b with SMTP id
 586e51a60fabf-4a2a895691dmr10125183fac.51.1791909830074; 
 Tue, 13 Oct 2026 09:43:50 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:42:20 -0600
Message-ID: <20261013164254.1476592-34-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-tomli: bump to version 2.5.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tomli/python-tomli.hash | 4 ++--
 package/python-tomli/python-tomli.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tomli/python-tomli.hash b/package/python-tomli/python-tomli.hash
index 1de6f54504..fcb52801b9 100644
--- a/package/python-tomli/python-tomli.hash
+++ b/package/python-tomli/python-tomli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tomli/json
-md5  74df8e3714ffa480b8076c98247ae1d1  tomli-2.4.1.tar.gz
-sha256  7c7e1a961a0b2f2472c1ac5b69affa0ae1132c39adcb67aba98568702b9cc23f  tomli-2.4.1.tar.gz
+md5  655f6b8d7821da937044456ee0d527d3  tomli-2.5.0.tar.gz
+sha256  264507556cd8b8c8e7c6ee037cdf443a463f03f4c958e57195e3d369711b8ff6  tomli-2.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b80816b0d530b8accb4c2211783790984a6e3b61922c2b5ee92f3372ab2742fe  LICENSE
diff --git a/package/python-tomli/python-tomli.mk b/package/python-tomli/python-tomli.mk
index cab8c5c266..a0cea7a82a 100644
--- a/package/python-tomli/python-tomli.mk
+++ b/package/python-tomli/python-tomli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TOMLI_VERSION = 2.4.1
+PYTHON_TOMLI_VERSION = 2.5.0
 PYTHON_TOMLI_SOURCE = tomli-$(PYTHON_TOMLI_VERSION).tar.gz
-PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/22/de/48c59722572767841493b26183a0d1cc411d54fd759c5607c4590b6563a6
+PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/b0/78/9ad63712633ed3ab5cc1a648d863d7e7da371e9425e209555a0fe711b695
 PYTHON_TOMLI_LICENSE = MIT
 PYTHON_TOMLI_LICENSE_FILES = LICENSE
 PYTHON_TOMLI_SETUP_TYPE = flit
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
