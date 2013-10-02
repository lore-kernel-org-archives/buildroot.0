From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Oct 2013 09:13:05 +0200
Subject: [Buildroot] [PATCH 2/4] python: fix python-config for
	cross-compilation
In-Reply-To: <87y56cslfb.fsf@dell.be.48ers.dk>
References: <1380576047-21001-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1380576047-21001-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <87y56cslfb.fsf@dell.be.48ers.dk>
Message-ID: <20131002091305.354e23f7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 01 Oct 2013 23:58:32 +0200, Peter Korsgaard wrote:

> My first thought was that this should just use PYTHON_CONFIG_SCRIPTS,
> but looking closer at it, I see that it's actually a python script so it
> won't work. It would be good to add a comment about this.

Ok.

> The shebang reads:
> 
> #!/usr/bin/python2.7
> 
> Now that we go to the effort to build a host-python I think it makes
> sense to fixup the shebang as well - But:

I am not sure. We build host-python only to be able to build the Python
interpreter for the target. For all the rest, we already require a
Python interpreter to be installed on the host machine. The current
situation is a bit confusing: some packages that need a Python
interpreter at build time do depend on host-python, some other packages
do not depend on host-python, and instead rely on the fact that
Buildroot verifies that a Python interpreter is already available on
the build machine.

I believe this is something that should be clarified.

> ./output/host/usr/bin/python output/staging/usr/bin/python2.7-config --cflags
> -I/home/peko/source/buildroot/output/host/usr/include/python2.7 -I/home/peko/source/buildroot/output/host/usr/include/python2.7 -fno-strict-aliasing -O2 -I/home/peko/source/buildroot/output/host/usr/include -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes
> 
> E.G. your s/-I/-I$(STAGING_DIR)/ trick won't work (and it didn't work
> before if the host python wasn't built with --prefix=/usr).

Right, from the above, I am not sure we want to change the shebang of
this script.

>  Thomas> We also fix one of the python*-config file to actually be a symbolic
>  Thomas> link to the script, rather than a copy of it.
> 
> This I don't see here:
> 
> ls -lah output/staging/usr/bin/python*-config
> -rwxr-xr-x 1 peko peko 1.6K Oct  1 23:50 output/staging/usr/bin/python2.7-config
> lrwxrwxrwx 1 peko peko   16 Oct  1 23:50 output/staging/usr/bin/python2-config -> python2.7-config
> lrwxrwxrwx 1 peko peko   14 Oct  1 23:50 output/staging/usr/bin/python-config -> python2-config
> 
> Care to fix these issues and resubmit?

Huh? Odd, I'll have to test this once again then. However, before
resending a new version, I'd like to see how we're going to clarify the
host-python thing vs. Python as a mandatory dependency.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
