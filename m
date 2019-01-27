From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 27 Jan 2019 16:59:35 -0200
Subject: [Buildroot] [PATCH 0/8] Detect and fix overridden variables in .mk
 files
Message-ID: <20190127185943.1136-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This series makes check-package to warn when a variable is overridden in a .mk
file.

For the general case, appending values to variables is OK and also a good
practice, like this:
|PACKAGE_VAR = value1
|ifeq ...
|PACKAGE_VAR += value2

or this, when the above is not possible:
|PACKAGE_VAR = value1
|ifeq ...
|PACKAGE_VAR := $(PACKAGE_VAR), value2

But this override is an error:
|PACKAGE_VAR = value1
|PACKAGE_VAR = value2

as well this one:
|ifeq ...
|PACKAGE_VAR += value1
|endif
|PACKAGE_VAR = value2

And this override is error-prone:
|PACKAGE_VAR = value1
|ifeq ...
|PACKAGE_VAR = value2

Patches 1 to 3 fix packages that currently overridden variables in .mk files:
s6-networking, sdl_sound, avrdude.

Patch 4 removes a unicode character from usb_modeswitch.mk. When I was about to
send this series, git send-email warned about it.

Patch 5 standardize the code by avoiding conditionally overridden variables in
usb_modeswitch.

Patch 6 adds to check-package the ability to recognize a special comment and
ignore one or more warnings that would otherwise be issued for the next line of
code. This is a common feature for static-analysis tools.

Patch 7 teaches check-package about ifdef/ifndef, problem identified while
implementing patch 8.

Patch 8 adds a new check function to check-package to warn for overridden
variables.

With the entire series applied, a check-package job:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/151812563

With only patches 6 to 8 applied, a check-package job:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/151813273

NOTE: I used git format-patch -U16 to make the review of patches 1,2,3,5 easier.

Regards,
Ricardo

Ricardo Martincoski (8):
  package/s6-networking: fix dependency when libressl is enabled
  package/sdl_sound: actually use the optional CONF_OPTS
  Revert "avrdude: add license information"
  package/usb_modeswitch: drop unicode space in comment
  package/usb_modeswitch: avoid overriding variables
  utils/check-package: allow to disable warning for a line
  utils/check-package: handle ifdef/ifndef in .mk files
  utils/check-package: warn about overridden variables

 package/avrdude/avrdude.mk               |  2 -
 package/gcc/gcc-final/gcc-final.mk       |  2 +
 package/s6-networking/s6-networking.mk   |  2 +-
 package/sdl_sound/sdl_sound.mk           | 11 ++--
 package/usb_modeswitch/usb_modeswitch.mk |  8 +--
 package/zmqpp/zmqpp.mk                   |  1 +
 utils/check-package                      |  4 ++
 utils/checkpackagelib/base.py            |  2 +
 utils/checkpackagelib/lib_mk.py          | 70 +++++++++++++++++++++++-
 9 files changed, 86 insertions(+), 16 deletions(-)

-- 
2.17.1
