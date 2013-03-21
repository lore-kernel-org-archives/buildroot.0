From: Przemyslaw Wrzos <przemyslaw.wrzos@calyptech.com>
Date: Thu, 21 Mar 2013 16:51:47 +1100
Subject: [Buildroot] Autoreconf not compatible with
	python-clean-for-reconfigure (BUG)
Message-ID: <EE5E77B503DE9A478B63A89AAD2585EDB66A72@vpane.excalyptech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've noticed that when python-clean-for-reconfigure is called, python
will subsequently fail to build.

Steps to reproduce:
    $ make python
    $ make python-clean-for-reconfigure
    $ make python

I've tried this on some other packages with <PKG>_AUTORECONF = YES,
using libtool v2.2, but so far I've only gotten the error with python.

Here's what the failure looks like:

    >>> python 2.7.3 Autoreconfiguring
    
    Applying buildroot-libtool-v2.2.patch using patch:
    patching file ltmain.sh
    Reversed (or previously applied) patch detected!  Assume -R? [n]
    Apply anyway? [n]
    Skipping patch.
    5 out of 5 hunks ignored -- saving rejects to file ltmain.sh.rej
    Patch failed!  Please fix buildroot-libtool-v2.2.patch!
    make: ***
[/home/przemyslaw/work/cassini/output/build/python-2.7.3/.stamp_configur
ed] Error 1

This doesn't seem to affect other packages with autoreconf though.

I'm not sure what a good way to fix this is. Perhaps a way to only do
the patching once using the LIBTOOL_PATCH_HOOK, since the autoreconf
doesn't seem to touch the ltmain.sh file there.

Cheers,
Przemyslaw Wrzos
