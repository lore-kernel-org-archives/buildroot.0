From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Oct 2013 09:43:23 +0200
Subject: [Buildroot] [PATCH 2/4] python: fix python-config for
	cross-compilation
In-Reply-To: <20131002091305.354e23f7@skate> (Thomas Petazzoni's message of
 "Wed, 2 Oct 2013 09:13:05 +0200")
References: <1380576047-21001-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1380576047-21001-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <87y56cslfb.fsf@dell.be.48ers.dk> <20131002091305.354e23f7@skate>
Message-ID: <878uycruck.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> The shebang reads:
 >> 
 >> #!/usr/bin/python2.7
 >> 
 >> Now that we go to the effort to build a host-python I think it makes
 >> sense to fixup the shebang as well - But:

 Thomas> I am not sure. We build host-python only to be able to build
 Thomas> the Python interpreter for the target. For all the rest, we
 Thomas> already require a Python interpreter to be installed on the
 Thomas> host machine. The current situation is a bit confusing: some
 Thomas> packages that need a Python interpreter at build time do depend
 Thomas> on host-python, some other packages do not depend on
 Thomas> host-python, and instead rely on the fact that Buildroot
 Thomas> verifies that a Python interpreter is already available on the
 Thomas> build machine.

 Thomas> I believe this is something that should be clarified.

Yes, I agree it's a bit of a mess.

As we already build host-python as a dependency of python, we presumably
might as well use it for anything building python modules as well?


 >> ./output/host/usr/bin/python output/staging/usr/bin/python2.7-config --cflags
 >> -I/home/peko/source/buildroot/output/host/usr/include/python2.7 -I/home/peko/source/buildroot/output/host/usr/include/python2.7 -fno-strict-aliasing -O2 -I/home/peko/source/buildroot/output/host/usr/include -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes
 >> 
 >> E.G. your s/-I/-I$(STAGING_DIR)/ trick won't work (and it didn't work
 >> before if the host python wasn't built with --prefix=/usr).

 Thomas> Right, from the above, I am not sure we want to change the shebang of
 Thomas> this script.

Back when we dicussed host-python, somebody (I think it was Samuel)
mentioned that 'python' has become python 3.x on some distributions, and
as this script uses internal python stuff to spit out the needed CFLAGS
/ LDFLAGS, I think we NEED to run it with the correct python version.

Same for people with 'python' not in /usr.

The script apparently doesn't even work with python 3.x:

python3 /usr/bin/python2.7-config
  File "/usr/bin/python2.7-config", line 34
    print sysconfig.PREFIX
                  ^
SyntaxError: invalid syntax

-- 
Bye, Peter Korsgaard
