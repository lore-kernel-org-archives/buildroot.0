Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA381C48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 10:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2190A41608;
	Thu, 29 Feb 2024 10:51:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bnqFkupAl7NN; Thu, 29 Feb 2024 10:51:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0BD9415DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0BD9415DC;
	Thu, 29 Feb 2024 10:51:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 67EB71BF420
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 10:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D83040275
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 10:51:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oz1-ZB3Mn6Hf for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 10:51:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3B0704012D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B0704012D
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B0704012D
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 10:51:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DDA59FF812;
 Thu, 29 Feb 2024 10:50:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfe0B-003Nsu-08;
 Thu, 29 Feb 2024 11:50:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240228223736.2376826-1-yann.morin.1998@free.fr>
Date: Thu, 29 Feb 2024 11:50:58 +0100
In-Reply-To: <20240228223736.2376826-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 28 Feb 2024 23:37:36 +0100")
Message-ID: <87v867ilwt.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] support/scripts/cve: fix running on older
 ijson versions
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Commit 22b69455526f (support/scripts/cve.py: switch from NVD to FKIE for
 > the JSON files) had to change the decompressor from gz to xz, as the new
 > location is using xz compression.

 > That commit mentioned that it was spawning an external xz process to do
 > the decompression, on the pretence that "there is no xz decompressor in
 > Python stdlib."

 > ijson started to accept bytes() (and str()) only with version 3.1, and
 > using a subprocess means we are now passing bytes() to ijson, which it
 > is not expecting as input on such older versions, casuing build failures
 > such as:

 >     [...]
 >       File "/usr/lib/python3/dist-packages/ijson/backends/python.py", line 25, in Lexer
 >         if type(f.read(0)) == bytetype:
 >     AttributeError: 'bytes' object has no attribute 'read'

 > Ubuntu 20.04, on which the pkg-stats run to generate the daily report,
 > only has ijson 2.3. More recent distros have more recent versions of
 > ijson, like Fedora 39 that has 3.2.3, recent enough to supoprt being fed
 > bytes().

 > However, the reasonining in 22b69455526f is wrong: there *is* the lzma
 > module, at least since python 3.3, that is, aeons ago, which is able to
 > read xz-compressed files; it also has an API similar to the gzip module,
 > and can provide a file-like object that exposes the decompressed data.

 > So, do just that: provide an lzma-wrapped file-like object to ijson, so
 > that we can eventually recover our daily reports that everything is
 > broken! :-]

 > Note that this construct still works on recent versions!

 > Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > ---
 >  support/scripts/cve.py | 5 ++---
 >  1 file changed, 2 insertions(+), 3 deletions(-)

 > diff --git a/support/scripts/cve.py b/support/scripts/cve.py
 > index 1a3c307e12..7167ecbc6a 100755
 > --- a/support/scripts/cve.py
 > +++ b/support/scripts/cve.py
 > @@ -21,8 +21,8 @@ import datetime
 >  import os
 >  import requests  # URL checking
 >  import distutils.version
 > +import lzma
 >  import time
 > -import subprocess
 >  import sys
 >  import operator
 
 > @@ -134,8 +134,7 @@ class CVE:
 >          for year in range(NVD_START_YEAR, datetime.datetime.now().year + 1):
 >              filename = CVE.download_nvd_year(nvd_dir, year)
 >              try:
 > -                uncompressed = subprocess.check_output(["xz", "-d", "-c", filename])
 > -                content = ijson.items(uncompressed, 'cve_items.item')
 > +                content = ijson.items(lzma.LZMAFile(filename), 'cve_items.item')

Are you sure this provides str()?

xz GPL-2.0
python3
Python 3.11.2 (main, Mar 13 2023, 12:18:29) [GCC 12.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import lzma
>>> lzma.LZMAFile('GPL-2.0.xz').read(100)
b'Valid-License-Identifier: GPL-2.0\nValid-License-Identifier: GPL-2.0-only\nValid-License-Identifier: G'


Whereas lzma.open() accepts a 'rt' mode:

>>> lzma.open('GPL-2.0.xz', mode='rt').read(100)
'Valid-License-Identifier: GPL-2.0\nValid-License-Identifier: GPL-2.0-only\nValid-License-Identifier: G'

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
