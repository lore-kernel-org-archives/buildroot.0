Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75311C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:44:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B394860F37
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B394860F37
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8657C4028A;
	Sun, 25 Jul 2021 21:44:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8nk22J9-4aDQ; Sun, 25 Jul 2021 21:44:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C85DE40278;
	Sun, 25 Jul 2021 21:44:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 004AC1BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E458D40278
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:44:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8vNGUxEqwyHA for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:44:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D867140276
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:44:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id DB78BE000B;
 Sun, 25 Jul 2021 21:44:13 +0000 (UTC)
Date: Sun, 25 Jul 2021 23:44:12 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Message-ID: <20210725234412.4871d645@windsurf>
In-Reply-To: <20210308134542.22324-1-patrickdepinguin@gmail.com>
References: <20210308134542.22324-1-patrickdepinguin@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] utils/scanpypi: add setup.py script
 directory as sys.path[0]
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Mon,  8 Mar 2021 14:45:39 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Even though the directory containing a package's setup.py was added to
> sys.path, some setup.py implementations rely on the fact that it is placed
> in sys.path[0].
> 
> An example package is 'cram' which failed to be added with scanpypi:
> 
>     Traceback (most recent call last):
>       File "utils/scanpypi", line 756, in <module>
>         main()
>       File "utils/scanpypi", line 703, in main
>         package.load_setup()
>       File "utils/scanpypi", line 303, in load_setup
>         setup = imp.load_module('setup', s_file, s_path, s_desc)
>       File "/usr/lib/python3.8/imp.py", line 234, in load_module
>         return load_source(name, filename, file)
>       File "/usr/lib/python3.8/imp.py", line 171, in load_source
>         module = _load(spec)
>       File "<frozen importlib._bootstrap>", line 702, in _load
>       File "<frozen importlib._bootstrap>", line 671, in _load_unlocked
>       File "<frozen importlib._bootstrap_external>", line 783, in exec_module
>       File "<frozen importlib._bootstrap>", line 219, in _call_with_frames_removed
>       File "/tmp/scanpypi-2pzc5wb_/python-cram/cram-0.7/setup.py", line 44, in <module>
>         long_description=long_description(),
>       File "/tmp/scanpypi-2pzc5wb_/python-cram/cram-0.7/setup.py", line 20, in long_description
>         return open(os.path.join(sys.path[0], 'README.rst')).read()
>     FileNotFoundError: [Errno 2] No such file or directory: '.../buildroot/utils/README.rst'
> 
> The corresponding code from cram's setup.py is:
> 
>     def long_description():
>         """Get the long description from the README"""
>         return open(os.path.join(sys.path[0], 'README.rst')).read()
> 
> Indeed, the Python documentation says:
> 
> https://docs.python.org/3.8/library/sys.html#sys.path
>     "...
>     As initialized upon program startup, the first item of this list,
>     path[0], is the directory containing the script that was used to invoke
>     the Python interpreter.
>     ..."
> 
> Fix this by inserting explicitly at index 0 instead of appending to
> sys.path.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  utils/scanpypi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks a lot, I've applied both patches. I don't know exactly how that
will behave with PyPi modules in general, but nobody complained, so the
only way to know is to merge those patches, and see if they cause
problems :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
