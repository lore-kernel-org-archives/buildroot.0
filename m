From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Oct 2013 23:58:32 +0200
Subject: [Buildroot] [PATCH 2/4] python: fix python-config for
	cross-compilation
In-Reply-To: <1380576047-21001-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 30 Sep 2013 23:20:45 +0200")
References: <1380576047-21001-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1380576047-21001-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87y56cslfb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Some packages (trace-cmd) use python-config to find out which
 Thomas> headers and libraries should be used to link against the Python
 Thomas> libraries. By default, python-config returns paths that are
 Thomas> inappropriate for cross-compilation: this patch fixes this by
 Thomas> prepending those paths by the staging directory location.

My first thought was that this should just use PYTHON_CONFIG_SCRIPTS,
but looking closer at it, I see that it's actually a python script so it
won't work. It would be good to add a comment about this.

The shebang reads:

#!/usr/bin/python2.7

Now that we go to the effort to build a host-python I think it makes
sense to fixup the shebang as well - But:

./output/host/usr/bin/python output/staging/usr/bin/python2.7-config --cflags
-I/home/peko/source/buildroot/output/host/usr/include/python2.7 -I/home/peko/source/buildroot/output/host/usr/include/python2.7 -fno-strict-aliasing -O2 -I/home/peko/source/buildroot/output/host/usr/include -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes

E.G. your s/-I/-I$(STAGING_DIR)/ trick won't work (and it didn't work
before if the host python wasn't built with --prefix=/usr).

 Thomas> We also fix one of the python*-config file to actually be a symbolic
 Thomas> link to the script, rather than a copy of it.

This I don't see here:

ls -lah output/staging/usr/bin/python*-config
-rwxr-xr-x 1 peko peko 1.6K Oct  1 23:50 output/staging/usr/bin/python2.7-config
lrwxrwxrwx 1 peko peko   16 Oct  1 23:50 output/staging/usr/bin/python2-config -> python2.7-config
lrwxrwxrwx 1 peko peko   14 Oct  1 23:50 output/staging/usr/bin/python-config -> python2-config

Care to fix these issues and resubmit?

-- 
Bye, Peter Korsgaard
