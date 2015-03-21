From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 21 Mar 2015 20:26:54 +0200
Subject: [Buildroot] [RFC 00/11] common init infrastructure
Message-ID: <cover.1426960081.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series is intended to clean up buildroot init system somewhat,
removing the need for extensive sysv and systemd handling code
in every package that installs init bits, and allowing alternative
init systems to be implemented with reasonable amount of effort.

Overview of the changes:

* drop per-package sysv and systemd files, introduce common format
  used to generate files for both of them, use a script to do
  the conversion from common format to sysv or systemd.

* remove sysv and systemd installation code from package .mk files,
  let pkg-generic handle it.

* remove sysv-specific files from skeleton, and sysv-specific hacks
  from system/system.mk. Use a dedicated script to write inittab,
  handling global conditionals (root rw/ro, serial getty and so on)

* remove user definitions from package .mk files, and mkdirs from
  per-package sysv initscript, use per-package .users and .files
  instead in a way similar to .hash files.

Expected benefits:

* (almost) all packages get both sysv and systemd files at the same
  time and without the need to support them separately.

* init-related changes can be introduced without patching
  all 70+ individual packages that install startup files.

* new init systems can be introduced with only minor effort,
  including lightweight ones with controlled (foreground) daemons.

This series includes the infrastructure changes, and a couple of
package patches to show how it looks like. Complete set of package
patches uploaded here: https://github.com/arsv/br/


This series is for reviewing, not for merging.

-- 
2.0.3
