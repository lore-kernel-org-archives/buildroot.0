From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Sat, 8 Sep 2012 00:32:43 -0400
Subject: [Buildroot] Fixing linux-pam build failures
Message-ID: <CADiAo4L2eUCF-2dEBWEJbw1V9z7uaQ-1=AA6z9SE4FA9v529+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

My initial assumption about the failures of linux-pam building in
autobuilder was not correct: the problem was in BerkeleyDB
configuration.

When BerkeleyDB is not built, the pam_userdb module is not built
either (via linux-pam configure). In this failed autobuilder
configuration Berkeley DB was selected. But dbm functionality was not
enabled in BerkeleyDB configure options. Thus the pam_userdb module
was attempted to build, but it failed due to the absence of dbm
functions in Berkeley DB, and this showed up in the build log.

I have submitted a series of patches which address the problem:

* if linux-pam is built, --enable-dbm is added to BerkeleyDB configure options
* BerkeleyDB is autoselected when linux-pam is selected, and
BerkeleyDB is now a dependency of linux-pam

I also included my two other patches (since linux-pam is being patched anyway):

* Provide dummy PAM config files to allow password-less logons via busybox login
* New configuration option for PAM support has been added to the
Busybox configuration menu.

Any suggestions are welcome.

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
