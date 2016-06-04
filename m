From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Jun 2016 18:30:49 +0200
Subject: [Buildroot] [PATCH 0/8 v3] core: add support for package help
	(branch yem/help)
Message-ID: <cover.1465056706.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series introduces the ability for packages to declare help entries,
that are added to the main help.

This is done by allowing packages to define an additional set of
commands, besides the existing configure/build/instal/... ones. Packages
can provide whatever they want as their help text, it is completely
free-form. However, to help packages present help that lines up well
with the rest of the main help, we provide a new macro to do a nice
formatting; its use is totally optional.

This is used for our bundled packages to display their kconfig rules [0]:
busybox, uClibc, linux and barebox, to replace the hard-coded entries in
our main help.

Finally, we also make use of the new macro to print our main help, to
ensure consistency in the output.


[0] we could very well move that to the kconfig infra, btw, but that can
    be done in follow-up patches.


Changes v2 -> v3:
  - don't force packages to only provide canned help text, allow them
    to provide arbitrary commands.  (Thomas)
  - make the macro a little bit simpler; only print a single line at
    each call; use a awk script that is easier to grok than the sed
    script. Enhance the commit log and comment in the code.
  - add conversion of the main help over to using the help macro.
  - drop the custom help target as it does not work (it was applied
    and then reverted).


Regards,
Yann E. MORIN.


The following changes since commit a898d5de17f4b32ee29ff47734ff5717c6b40f03

  package/nodejs: Update npm to use NODEJS_CONF_OPTS (2016-06-04 14:32:16 +0200)


are available in the git repository at:

  https://git.busybox.net/~ymorin/git/buildroot

for you to fetch changes up to f6bb545ede1f4e8692e031f48393991b0303f835

  core: use the print-help macro to print the main help (2016-06-04 18:06:01 +0200)


----------------------------------------------------------------
Yann E. MORIN (8):
      core/pkg-generic: add support for package-defined help
      core: name the package before its help text
      core/pkg-utils: add a macro to pretty-print a help entry
      package/busybox: use the generic help rules
      linux: use the generic help rules
      package/uclibc: use the generic help rules
      boot/barebox: use the generic help rules
      core: use the print-help macro to print the main help

 Makefile                                | 129 ++++++++++++++++----------------
 boot/barebox/barebox/barebox.mk         |   5 ++
 docs/manual/adding-packages-generic.txt |  16 ++++
 linux/linux.mk                          |   7 ++
 package/busybox/busybox.mk              |   5 ++
 package/pkg-generic.mk                  |   4 +
 package/pkg-utils.mk                    |  27 +++++++
 package/uclibc/uclibc.mk                |   4 +
 8 files changed, 134 insertions(+), 63 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
