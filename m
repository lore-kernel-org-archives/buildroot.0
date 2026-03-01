Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DDDFD0057
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 13:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4038783D41;
	Sun,  1 Mar 2026 13:46:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NlxHGtKprpxS; Sun,  1 Mar 2026 13:46:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63CD483D5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772372783;
	bh=GhP1VoqJU8ynpETj1HFHBh+W1KUUHalH3TULAwv0MxI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=stavlekXSizfjZ39ySkNEz2FFmqxhzy7Mwb6G9SOowiQ+sJE+pFT6AwZgIAAw/AJK
	 YPyjKlYveESCi9aqVr7EpxnnA+EKgUCLeLGVOMwMKHmt6MhrtontzwNtAp8pC43vjM
	 xM2SDtRLpkeNqp7V8f2M8vDe+QE38DFiNy0zx4yCoahAlHYYmU4Q22uvfAYKUMtQRp
	 kexd7eB86Owq//1BAC8YV68dzynpu988nnEmtB/XiX/Lx5x8N+vu4PotHjWI35AkOL
	 rXeeRkVBU1heBJZHIPsDxQSLuaSD+xhcJqE61NNKX4R7iyYqQH17qfdMoUXS5r1tKP
	 snXyOKfq5k/iQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63CD483D5B;
	Sun,  1 Mar 2026 13:46:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 21679231
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 13:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07398403CB
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 13:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkHQXj3VCtWA for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 13:46:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 490844007C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 490844007C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 490844007C
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 13:46:20 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1588218888; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 01 Mar 2026 13:46:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1vwh7Z-0000000CiT1-0GQS;
 Sun, 01 Mar 2026 14:46:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Sun,  1 Mar 2026 14:45:36 +0100
Message-ID: <20260301134538.3030668-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=nSHFhmQopxsLt1ZQ20w3SJkrRIUmP8RsCBW4kmoABv35mWGeJhck7Z90XBcRjTbW3Q9fv6oS4VIlbl11nU2MVBkFjcGVBl0Alf+sjCQUQq3J9nTjeXcKXyz1LNy9hPm+K1xnzQeRJuN4SOFw13Z+Pf6Ksgnuq++WPssCorHyQKwL0qJzhmhRMLviFa3cS+9/5NlVy+QjUEkd12o12K26gvF1j97DHmSZuTQRH4yEcQcpvNsDsN7kT8mSlIHCAt/NcpeHJ6jtLQv6x4Q1QTPjdI1yVCWYdCg+xkCin3nbvbrv3cmo7LeOnPd0Pjjj9kjQiUoYsYqbvJxdDalVludi7g==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=u9ogdXXu6rhCd/w3DTDNxaXYmscBJ1x326JIfGZfb10=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=nSHFhmQo
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] support/testing/run-tests: unbreak on Debian
 testing/unstable
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 3d2141bcee("support/testing/run-tests: specify multiprocessing
method") added a call to multiprocessing.set_start_method('fork') as a
workaround for python 3.14, which changed the default start method to
forkserver - Which is incompatible with the nose2 setup.

multiprocessing.set_start_method() is only supposed to be called a maximum
of 1 time per process and throws a RuntimeError if called more than that
(even with the same arguments):

>>> import multiprocessing
>>> multiprocessing.set_start_method('fork')
>>> multiprocessing.set_start_method('fork')
Traceback (most recent call last):
  File "<python-input-2>", line 1, in <module>
    multiprocessing.set_start_method('fork')
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^
  File "/usr/lib/python3.13/multiprocessing/context.py", line 247, in set_start_method
    raise RuntimeError('context has already been set')

Debian included a similar patch in python3-nose2 0.51.1-2 (currently in
testing/unstable) which adds its own call to set_start_method():

https://salsa.debian.org/python-team/packages/nose2/-/blob/debian/0.15.1-2/debian/patches/0004-plugins-mp-set-context-to-fork-for-Python-3.14-mp-AP.patch?ref_type=tags

Which comes from:
https://github.com/nose-devs/nose2/pull/644

As discussed in the upstream PR, this is not a correct fix is wrong and
breaks various use cases.  An issue has been opened to get this fixed in the
Debian packaging at:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1129350

But until that is done, rework the patch to:

- Only override set_start_method() if needed to limit impact
- Monkey patch set_start_method() so additional calls are ignored

To unbreak run-test on affected Debian systems and add some documentation to
make it clear why this is done.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/run-tests | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/support/testing/run-tests b/support/testing/run-tests
index 1c4d2b4a85..2bbe7b140f 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -142,5 +142,15 @@ def main():
 
 
 if __name__ == "__main__":
-    multiprocessing.set_start_method("fork")
+    # python 3.14 changed default start method from fork to
+    # fork-server, which is not compatible with the nose2 setup
+    if multiprocessing.get_start_method() != 'fork':
+        multiprocessing.set_start_method("fork")
+        # set_start_method throws a RuntimeError if called more than
+        # once.
+        # Debian python3-nose2 0.15.1-2 includes a patch adding
+        # another set_start_method() call, so monkey patch it out to
+        # get rid of this
+        multiprocessing.set_start_method = lambda *args: None
+
     sys.exit(main())
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
