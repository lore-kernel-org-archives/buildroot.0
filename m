Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC59CA9ED2
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 19:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1205F80AA2;
	Sun, 11 Oct 2026 19:58:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hhBFgCpUkiot; Sun, 11 Oct 2026 19:58:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2482D80ABB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791748697;
	b=D6qFEv7jNqnFLLaJPPXNl0jxsXrYJ5YCf6DJKX25sxMJ3Vjq03d14mEhxOOBy28wqWvC
	 eaPpUAmRxCmpqhqHVczgXaqqcozK6MHFYxNs4ldn3b91aUeevWM8e5zuG35QXVE+QXuY8
	 xejp3yHJj8qI56GCdWvKpvnwOaI0509ffjix7bVsbwdEPrER1jgl830JJaeOqz2TmjVt/
	 ikmZzK307ln24PhoGqv8vj7EGYWei335UGlWwb2UOPlLyIeIg7hjOaL4VexidHYJiloGw
	 qoy9CmvKoC6SGTJFso2lfvt4ZxPYVAI8rT9G50mhz+au77GGQ1/4EIw2g2a67R6WDZg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791748697;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=qXEO3oa1sCBR37JVWaVvW0jmQ/C0mw5AgfYRF5Ciotc=;
	b=ihInx9xvn7wrutcoKAymYtPEQY1KnuTugaQCHHdZ4D5gi/vmpTqXl4KvsQ0WTg1ueMxu
	 3oaSa1dxATEesJ6NWEY1Pzus9wXucuI3yThPtTPZ3WBkX6euFBGDoB8aFG0cyJ3seSvBV
	 QhVp+XyCe7IvtDteGFUdJrpwxSYVb9/5xIbYLFLN5xwRqRzpsEo9ciGbj+rZDC0TDPScK
	 ZrMHO7a8Ij8g6eAAKLWzgDjEhhN7U6heG3PLkw59ZnHaFLD2BiTssuEgvQD+fuQZZaGOs
	 ng4MgQ6VGZq7K7ImQ4T4FCbJpbu26T/NQk+H3NH3hW7qgyGlNFbUDeEsvaP1jteNmhw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791748697;
	bh=qXEO3oa1sCBR37JVWaVvW0jmQ/C0mw5AgfYRF5Ciotc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ie1k4AuUeKBzFmE5DtyXU+bYYCNyVxdJzrDB5Dsta5GMqoE28rpPv+Ttg5FqdCuUe
	 +pyRwtolMMqArNrF5cIysSiOdHc+c+nzXshSUspKzbk7ZQCsnroPjkQuuDPMlsE6zq
	 XnOc0DCjUYgYscFBx9VqNyyWkRQ83KTJYEnOlg7iZg9GZmtgVXtJGb1JAPsKIuPhlp
	 RC4/MdJfjuWiP9QG2aIq7sqLkuktwvUeQLc0CaKQ5JlAGsaQ8ShXxYCfEiimi/xo8R
	 tFc8+GMoEhesSeyxVuWwFNFdZHLAI6ngBVHtY95o+pqp0Tht3/h1glWFDGvKVoxEP2
	 po7oAKbM9Bh+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2482D80ABB;
	Sun, 11 Oct 2026 19:58:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8ACA1D5E
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70E074052F
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zdANJson3GF9 for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 19:58:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 715494052E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791748693;
 b=Mz9s6WLpV1zayajO8w8IUHmjQUg8cVHtvLTwWiBakzQC7NVQ3TxlYtl6Lr3+3vMMm6kG
 lEk+k+Bg7GKbzf1C+daszv3TO8bsvCVyH8rPqo4a1+DN8JT2aeqfXb8Wg3N9dmSHFkgyd
 Ro9wOq60/P0EzvONszjFtxqmXU6NYPnBR+rAp1rla4bu+oTIgC/HRqpJR8PW++gF1Rbdl
 EdGpyr1VqnUNQN1smToH9DqThjfozRjXKatCSjFRYPfnoqN9Xa5+aSusfJU1fOCLi//ko
 eW68iWJd5AkgqwiIznYztRaZldYfmYuThnEkEGCORMdLWLY49G+HEyTaZq0ZzWxxhlg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791748693;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=nAG2g5ppl1UoXgrBJSRLP9pD0iToHN8TMpzA0aESj2I=;
 b=S74OvXxuhYB+IVAQg8Q0uEDkOUpuDKFjdqUtK17RfDAMqEu46MtIM/9wCBQq77Dl7rDR
 kF7OYivY8mgYMJoC4FxrcEsuqodzAXhCUcLj0b8EqKxdRf3WcF8oloTcwo0YHo9jVSUxN
 SjWX96YtP9NHg2Brn5Ul6WspZjH5Fx7w/XYykJjQwvtpKwNNIXj4wDqm0zCKZoDGdZgYz
 8cikJ67gUiu+lrNZedcscfmDhzjOqV6vcjpeJQpMXufDhtE59JOyIambGjwzu6VQeluF1
 gcvr/2s4R3KUYfVFyE/A6LZ0MUQh3Uhlxgn7dqWyay+6BijdL3TFTe2hG6T56NzxSBQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=aCu26hH0; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 715494052E
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:58:12 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48af27fe287so1061058f8f.0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 12:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791748691; x=1792353491;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=nAG2g5ppl1UoXgrBJSRLP9pD0iToHN8TMpzA0aESj2I=;
 b=MTSYllhnvDebtjY2Fg1lLcGIQv7YOo0KmsB3dB4ZszrSYPCAeelnbViBQYNuxg78Iy
 l1terW30erdN7XgGTr5C8/P6tsGwKcMmrsDCUFwJIB99hW3Bbx0Ur+ibcjXN+UTiEIHa
 M4jLAPTgzHPlvNjtUiIHQDdqQVkOGQqhOKxoadTdsxK/MAcL7AELXZ5xickqLCd/fgu9
 5MPDykyRJAOhkV1JSeOQo191udyqclwTV0V/rnbOJ6s6a6Zi0lZpKv+SAxzBB6HaOxES
 BPT0Orjf9SC2KYk53WrbEP9ZncCSK6kE2ScCMqiYGVyWYY7NWY8HlEGU7xirq7W/flqA
 jmVQ==
X-Gm-Message-State: AFq9FYJv18ycmYR1ml742btj2qX/1/TRc/k/7kHPKJLh69CGrFceEd4k
 0gSsFehx1NirY0mHlzqTcuSeCoxV5pkvkXtRKqHllZJrTlk/X15350zYyRXBqqSBsknBLl+ADk3
 dvTiQkVc=
X-Gm-Gg: AYBFou0+jUI+jF+JZJq892C2vOD1D9C34+vRFkP1q2qSGW9Ir7gKUwFSNmXJROOU5X0
 xBuoU7bHXiBc9nj8506QD0gsjoaiI2E5TcWDLrdluwue/EUa1ngT+up3a3u7clEMwwi8ki9CKCa
 n3uhXqEgNz4VybCkQ5wN/dXcxO0+RGS0i6p9ETFsoLZq7hEMF3YOvs+gV3/QTQhd1rsxNT30E6n
 sMfEAGykWbz1n/g5DXTdwisxvyIQrGJhZ9oEKP7RTjBxaVSc3GqEdEEUJuKouSUXV8ZWxMIDVCJ
 RTgQ9NFbf+yYf2X/7NoYutVEm5XeOCN+KqfZn0jBENxO0H3cnU+f+W/GHQj45kc0z10s3dtt/Uy
 nV48ymKrnmACe0fvrJrQZZo0xAsOCkc1BspLBkuW69nRTLcPSSsTXVyDNtp0qYkrTigEmLV0rG+
 W/OssQohOJJPknr0lPyR6jt/6to5LVol/zmXeMnWVl457Symc1XTT5wJxTHs4YzaceODegmgS4Z
 xrr8h0E
X-Received: by 2002:a05:6000:2906:b0:487:27f9:834 with SMTP id
 ffacd0b85a97d-48dbaaed8cbmr12495019f8f.41.1791748690267; 
 Sun, 11 Oct 2026 12:58:10 -0700 (PDT)
Received: from mindpad ([2a02:a020:5ce:d643:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9ac02cfsm14568240f8f.39.2026.10.11.12.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 12:58:10 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Date: Sun, 11 Oct 2026 21:58:07 +0200
Message-ID: <20261011195807.796661-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261011195807.796661-1-thomas.perale@mind.be>
References: <20261011195807.796661-1-thomas.perale@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] utils/checkpackagelib: add test for broken
 symlink
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

Test that symlinks pointing to non-existent location trigger a warning
from the `lib_symlink.py` lib.

Assisted-by: LLM
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/checkpackagelib/test_lib_symlink.py | 36 +++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 utils/checkpackagelib/test_lib_symlink.py

diff --git a/utils/checkpackagelib/test_lib_symlink.py b/utils/checkpackagelib/test_lib_symlink.py
new file mode 100644
index 0000000000..cfa9fcd4ee
--- /dev/null
+++ b/utils/checkpackagelib/test_lib_symlink.py
@@ -0,0 +1,36 @@
+import os
+import pytest
+import re
+import tempfile
+import checkpackagelib.lib_symlink as m
+
+workdir_regex = re.compile(r'/tmp/tmp[^/]*-checkpackagelib-test-symlink')
+
+
+def check_symlink(check_function, filename, target):
+    with tempfile.TemporaryDirectory(suffix='-checkpackagelib-test-symlink') as workdir:
+        link = os.path.join(workdir, filename)
+        os.symlink(target, link)
+        obj = check_function(link, 'url')
+        result = obj.before()
+        if result is None:
+            return []
+        return [workdir_regex.sub('dir', r) for r in result]
+
+
+BrokenSymlink = [
+    ('relative target',
+     'log',
+     '../tmp/log',
+     ["dir/log:0: broken symlink to '../tmp/log'"]),
+    ('absolute target',
+     'mtab',
+     '/proc/self/mounts',
+     ["dir/mtab:0: broken symlink to '/proc/self/mounts'"]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,target,expected', BrokenSymlink)
+def test_BrokenSymlink(testname, filename, target, expected):
+    warnings = check_symlink(m.BrokenSymlink, filename, target)
+    assert warnings == expected
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
