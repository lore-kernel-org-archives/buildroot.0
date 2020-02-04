From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Feb 2020 15:22:36 +0100
Subject: [Buildroot] [PATCH v2] package/grep: fix busybox aliasing
In-Reply-To: <1580822081-3713-1-git-send-email-angelo@amarulasolutions.com>
 (Angelo Compagnucci's message of "Tue, 4 Feb 2020 14:14:41 +0100")
References: <1580822081-3713-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <87k152jutv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

 > When grep package is selected, it should be installed at the same exact
 > location where busybox installs it too, this way the grep/egrep/fgrep
 > executables will end up overwriting the busybox provided ones.
 > Busybox installs *grep executables in /bin, grep package in /usr/bin.

 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

Reworded slightly and committed, thanks.

 > ---
 > Changelog:
 > * Patch splitting as suggested by Peter

 > I tested manually chenghing the package to:

 > GREP_CONF_OPTS = SHELL=/bin/dash --exec-prefix=/

 > And this works. If /bin/sh is a link to /bin/zsh for example, it will
 > not work cause the configure is not able to run on zsh.
 > I suppose that changing the default /bin/sh to something not sh
 > compatible woulb break many other things.

But that should never happen. A bunch of stuff will break if /bin/sh
isn't working.

So what about the 2nd fix? I take it that fgrep/egrep are still
installed with a #!/bin/bash shebang?

Either we do the SHELL= workaround or simply patch fgrep / egrep as a
GREP_POST_TARGET_INSTALL_HOOK.

-- 
Bye, Peter Korsgaard
