Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5A9CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06D2940E31;
	Sat,  3 Oct 2026 07:12:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aHy-xj3BniVi; Sat,  3 Oct 2026 07:12:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 124A040F1B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011571;
	b=gIVR1qWNFh9dXYLRcC153FaD73+OyGhCMA/MSj54mRe4faA/Md0+htf9s5CoMAT81eTe
	 i0tpL+cfr2qpVAfD2lUIZg0iZoS3qf9JFK8Gac39TNY8Y7xn9MLfD0rEfPdKdk4cU7aG5
	 0pWvnMsgaHo+dc0pEEkV7GyIiXxtFFjXz5jm05IDtVo0Wy4LeKc/rizZoxCLjocfXJ2/o
	 saOPflLfuSbkwNimxkZ1LnV51C0PbtvAOv9ZWKpL1sKv659TBeP7N2W24GCZzdGrIQJcW
	 z8h0K8FHE9h/asG3pj3dnQyFmSiIBA0xWIYo/Hsk6O5LQNuXT3M2HgKXd9xpXQLfFQw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011571;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wwvjA01MnrKCChZKYoW4ZwtpZLq6pw6TpbR7Aq+3yec=;
	b=VMk3duGpco0j/G3vIgRFtV5vTxtFkNCfnhxhFOqNNm4HHXyXqc41lEkzfBUGbv/vIg6B
	 ShWy9VZkte3iZujHE6oiMBBAJHOeiGWb2rhCSgmicNHUN4WeU71XpFYy55CaTssXkeWQX
	 atL7l/Sl9XCTjOhcNzUtPn0p5honKsxtL4wyp/kwshRlJGdDSe0QQWIK1DUOasdaqfawF
	 9sA1L//KPnMYx38oLbYrK09lZiInz0HJ+QExihsO8AuC6oRU9T6gCevMZ3YUTLl2U7szT
	 azw7J38r/8kBuKGA7vfhdVmtD3AmCa2ywqdLFCP2bCz5bZHwllapk1JvEvZdtx19QUw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011571;
	bh=wwvjA01MnrKCChZKYoW4ZwtpZLq6pw6TpbR7Aq+3yec=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qDM/uw/DEqAjiRDucvh+vlvYNYipMpLczZ6RFX98JdvAxi6lKDX3QUjN7+tITgYQC
	 J5n/PkieXQrgvpDdJTN5nZoJMuMY1zlXqQRBIG92O/ANvz1JKyKnTeGUmYOhxrZ0UT
	 JC7zxLABQzjpzkaIGllJZ2I0hXJnUBVoKUkJN9l9PFr51n/XsloBDvEjzk1vu9KE0+
	 DUhoek8Rz6lg2dzYkOFNDdXKFMGQfb4Wxr3HjHISOi4HDPlkUh5Cd7LM+Ea8J8HEPf
	 q8iamTrXQhch3JWDufVLtc7ZceGVsORswS4PHY4CKCawYZ2uAcObsiH+9mlRp9QqwY
	 6EBm8Xu2o1TAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 124A040F1B;
	Sat,  3 Oct 2026 07:12:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5634A435
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C72240059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:12:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id scxQVwRFBkhi for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:12:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org DE4E040050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011568;
 b=CmeAmx4dyG4tRiJ79mK1b8mRFAEB7ajicHgshVQ7cV0468cGJfOvKB8dQKLNuPOLaGPG
 l7ZfastwAUwdrcWi0POdfD/l9P+rb4JkyWLe5AG6d8QFfi2FURs8tlzAIKRMmhoxbCiiQ
 Z4Yf94qhkI2xpkkQV2I7TYt8jy/qUx2SOF0mUZj7oUKFBEIy7cvBkXFJFamhCwmT2gq7y
 Iz+tinlWoWbAGzfm+SJ76WboDO7VinU9SMXb16J30kQAejWJVLs8qkVKRGIhKr/NDAewM
 4tYh30o+A0n5zeAOfIB6Eh4qQl4GY6Pw4ndHo1GqoQ61o0rfIVomFJEt4svt5LYue+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011568;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=qdbJOkNwhm/rtKD4lGW2HpiG3YHEzrhWDZuHrGHKffA=;
 b=BExh6g4Go5C0pNogXIwFl4w0Eere+qEMJ+RHY71jESL7B+G64pXwgWiYnHy8k5sijnao
 q0jmN18TnKW411PQyYuFYa4AajmRW5J3V539N5jA9KLtEsx8WvCm82sFtXnw5X9COn3XL
 SQy3E6EDW2aOQi8WbQuSopkmjdjhZnqK/J6966ogpcjtXoFD81bhWwnJQS/jv3psnBDjT
 lhAtfmQOnXzJKqSaFeT+5eJkNox4359ZGB4FBp9jIbC0ttaPNQ1+XlsQsggfSXmT6m7UM
 /+07joTld+i+hcE9WrUrCkpobfY8msmAbHeeHfiRDmwOJGAX4fAbO8kdvOPTB64euyA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=LTMqxSH9; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=LTMqxSH9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE4E040050
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010932;
 bh=qdbJOkNwhm/rtKD4lGW2HpiG3YHEzrhWDZuHrGHKffA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=LTMqxSH97xKdQVyU4C4J+zTS7UX8APmtqMmbDUR5sU6aLUBqC9M8URaBmJ/hpOf8w
 P4fefLC7iJ0f6lXwyq5zj0VclMeNDuMhFVra3FqlZpRp+c0JxO+ac+IPo9/MBROLu2
 Qks7w6tVKcopcshajPNDSSi6i3mVA7lhIBQOqEUVrcJ0EOR5VJGBamlsprGcyAPGlD
 z9UlCYnMJfL8a1jz85LbdOg368hQ2P52PxtYYpHbBOSoOWvxqbNNNuxt6fCYDhPuEn
 BxXxyJ3spZBrFptG1Tlx/z28sk0JqMyx979NBhFIj6QlFxUi4YELk+8WpApbRUyJ+p
 9lVx6h58pCeBg==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 CIZaNcMt7crlkI4YQgRTv6VQxHromhmqKRPw4EWVaPhvUCTjzH7xej4D0jGHsgqS3W2HAKjBAFF
 5svS6MWqWrnsY9sDaJRvkBgXjqjomEVc6SefO5+2JXAbRK93eUvxT7/asrnklgGoNWBPkXsgb1I
 Uv5tGTZUvPS9ACpVndF3w/eQXCjyJWZNK0u4z5KCSiBknFlLLEvS2oxI1MxGxgFUR/BouWgzdjp
 eF737TvZFnp9ufRlYM/qgUX0WXO3dN/RfGtwbWua/eqGN9cYdmsvG9EzoojLEG0ZgbHSP7BpEIx
 pFr0/zR/NeDnCxhDBEDYYUTRiBEdemOV0SM2QKqcXJtuzTQ0FEMacUqQha1lZfB43fx0zJNsoIx
 p2upV3XGBfolw6AK0VPilI+PaKUY2Z4xHhzTtKrZEIo9NDGDS01gwzWIH0cvfWkUB9Dw5deS47t
 SshSNluFQWlXrMDi0+YGVwRXwt8ezxKM0fyEPYCJ8JjfC7WP676dVuumfWyH5yFZhWlg6ndf/4S
 prb9y+iWhzN2JTUzixdsZVFway9z+Ldgm6Nr7Sv+c20Ix0xzn7Vdx6T8vidO3D+K2B1V3Jjm3bN
 DZDsQwQZfT3Im0HFYs/OQbQ63/Cal0pffGwEjc/Jb0dtDAHrFAzfdEmO8hRXX4Sn
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0189AA4C5440;
 Sat,  3 Oct 2026 09:02:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtki-000000007Zo-13IU;
 Sat, 03 Oct 2026 07:01:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:01:04 +0200
Message-ID: <20261003070128.1295458-92-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 092/114] package/python-tqdm: bump version to
 4.70.1
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Louis Aussedat <aussedat.louis@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-tqdm/python-tqdm.hash | 4 ++--
 package/python-tqdm/python-tqdm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tqdm/python-tqdm.hash b/package/python-tqdm/python-tqdm.hash
index 4bb81e11e7..33a1e08675 100644
--- a/package/python-tqdm/python-tqdm.hash
+++ b/package/python-tqdm/python-tqdm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tqdm/json
-md5  e1be20b64fdb913d2246c635cdf97b28  tqdm-4.67.3.tar.gz
-sha256  7d825f03f89244ef73f1d4ce193cb1774a8179fd96f31d7e1dcde62092b960bb  tqdm-4.67.3.tar.gz
+md5  2f74946f88e128654c7c03cc89570e38  tqdm-4.70.1.tar.gz
+sha256  cefd0eca11b2a37a3aee776544d4f4ae913f02688135b5556b8788dfa474afc4  tqdm-4.70.1.tar.gz
 # Locally computed sha256 checksums
 sha256  fcff87c3a47ce8028a8512aa182d4fcf0ad1c90544ee75cf9b343684cac194de  LICENCE
diff --git a/package/python-tqdm/python-tqdm.mk b/package/python-tqdm/python-tqdm.mk
index df455973f4..6c7e762ce9 100644
--- a/package/python-tqdm/python-tqdm.mk
+++ b/package/python-tqdm/python-tqdm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TQDM_VERSION = 4.67.3
+PYTHON_TQDM_VERSION = 4.70.1
 PYTHON_TQDM_SOURCE = tqdm-$(PYTHON_TQDM_VERSION).tar.gz
-PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/09/a9/6ba95a270c6f1fbcd8dac228323f2777d886cb206987444e4bce66338dd4
+PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/0d/ea/b2a5bd54b28a324dae8211928b2d730b6547500342c7e6c6dea08bd0a485
 PYTHON_TQDM_SETUP_TYPE = setuptools
 PYTHON_TQDM_LICENSE = MPL-2.0, MIT
 PYTHON_TQDM_LICENSE_FILES = LICENCE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
