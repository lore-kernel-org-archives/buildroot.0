Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96082C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 18:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62E4E607DC;
	Sat, 15 Jun 2024 18:37:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nSsHwu_quDDY; Sat, 15 Jun 2024 18:37:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5535F607BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5535F607BB;
	Sat, 15 Jun 2024 18:37:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9EBA1BF2FD
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 18:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A34574044D
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 18:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5tW2ZtVKkUSZ for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 18:37:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 811694026F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 811694026F
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 811694026F
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 18:37:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 841B640005;
 Sat, 15 Jun 2024 18:37:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sIYGp-000imc-2y;
 Sat, 15 Jun 2024 20:36:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20240513213035.1738493-1-brandon.maier@collins.com>
 <8dc84ced-c9db-44f1-b576-dd80a3bf105d@mind.be>
Date: Sat, 15 Jun 2024 20:36:59 +0200
In-Reply-To: <8dc84ced-c9db-44f1-b576-dd80a3bf105d@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Thu, 6 Jun 2024 20:59:22
 +0200")
Message-ID: <87h6duqchg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] support/testing/infra/builder.py: fix
 missing $HOME during build
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > On 13/05/2024 23:30, Brandon Maier via buildroot wrote:
 >> When running a test that uses host-python-setuptools using the Buildroot
 >> Docker image, for example running the following command,
 >> 
 >>> ./utils/docker-run ./support/testing/run-tests -o output -s -k tests.package.test_python_pytest.TestPythonPy3Pytest
 >> The build fails with the following error,
 >> 
 >>> File "/home/blmaier/buildroot/output/TestPythonPy3Pytest/build/host-python-setuptools-69.2.0/setuptools/_distutils/dist.py", line 354, in _gen_paths
 >>> yield pathlib.Path('~').expanduser() / filename
 >>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 >>> File "/home/blmaier/buildroot/output/TestPythonPy3Pytest/host/lib/python3.11/pathlib.py", line 1385, in expanduser
 >>> raise RuntimeError("Could not determine home directory.")
 >>> RuntimeError: Could not determine home directory.
 >>> 
 >>> ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
 >> Python setuptools is looking for $HOME but failing to find it.
 >> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

 >  Applied to master, thanks.

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
