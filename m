From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Sep 2017 14:37:30 +0200
Subject: [Buildroot] [PATCH] bash: fix static build
In-Reply-To: <e61b7469d3048416c7e3c681a75f773843fe48a6.1505759427.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 18 Sep 2017 21:30:27 +0300")
References: <e61b7469d3048416c7e3c681a75f773843fe48a6.1505759427.git.baruch@tkos.co.il>
Message-ID: <87k20u27at.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > When building bash statically, configure does not initialize the
 > SHOBJ_STATUS variable. The SHOBJ_STATUS make variable in
 > examples/loadables/Makefile.in must resolve to either 'supported' or
 > 'unsupported'. Otherwise, the install-$(SHOBJ_STATUS) target does not
 > exist.

 > This leads to the following build failure:

 > make[2]: Entering directory '.../output/build/bash-4.4/examples/loadables'
 > make[2]: *** No rule to make target 'install-', needed by 'install'.  Stop.
 > make[2]: Leaving directory '.../output/build/bash-4.4/examples/loadables'
 > Makefile:793: recipe for target 'install' failed

Hmm, while this is correct it doesn't really error out here:

( cd /home/peko/source/buildroot/output-bash/build/bash-4.4/examples/loadables && /usr/bin/make -j --jobserver-fds=3,4 --no-print-directory DESTDIR=/home/peko/source/buildroot/output-bash/target install )
make[3]: *** No rule to make target 'install-', needed by 'install'.  Stop.
Makefile:793: recipe for target 'install' failed
make[2]: [install] Error 2 (ignored)
rm -f /home/peko/source/buildroot/output-bash/target/bin/bashbug

So that probably explains why it doesn't fail in the autobuilders.

Does it really fail the build for you?

Have you looked into why SHOBJ_STATUS doesn't get expanded correctly,
and if this can fixed more nicely upstream / is already fixed?

-- 
Bye, Peter Korsgaard
