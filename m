From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 Mar 2014 22:28:28 +0100
Subject: [Buildroot] [PATCH] support: properly check for bash as a
	dependency
In-Reply-To: <1395052954-1567-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Mon, 17 Mar 2014 11:42:34 +0100")
References: <1395052954-1567-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87k3bs5xc3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > The way we are checking for bash is to look if "$SHELL --version"
 > will return a string containing "^GNU bash".

 > In case the system shell is dash (eg. /bin/sh -> /bin/dash), but
 > the user's login shell is bash, dash will not override the SHELL
 > variable:

 >     $ echo $SHELL
 >     /bin/bash
 >     $ /bin/dash
 >     $$ echo $SHELL
 >     /bin/bash

 > The same happens when called as the interpreter for a shell script:

 >     $ cat foo.sh
 >     #!/bin/dash
 >     echo $SHELL

 >     $ echo $SHELL
 >     /bin/bash
 >     $ ./foo.sh
 >     /bin/bash

 > So, calling "$SHELL --version" will still return "^GNU bash" no matter
 > what shell is actually running.

 > Since quite a lot of #!/bin/sh scripts are in fact bash scripts, we
 > really want to ensure that /bin/sh is bash.

Is that really still an issue? I just checked a few of the machines I
often do buildroot builds on and they all have /bin/sh == dash.


 > -# Check bash
 > -if ! $SHELL --version 2>&1 | grep -q '^GNU bash'; then
 > +# Check bash is the system shell
 > +if ! /bin/sh --version 2>&1 | grep -q '^GNU bash'; then

FYI, dash doesn't even understand a --version argument:

sh --version
sh: 0: Illegal option --

-- 
Bye, Peter Korsgaard
