From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 Nov 2015 23:39:10 +0100
Subject: [Buildroot] [PATCH 0/7 v3] autobuild: misc fixes and enhancements
	(branch yem/limits)
Message-ID: <cover.1448663846.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series, against the autobuilder tree, adds two new configuration
options, a sample runtime config file, and a SysV init startup script.
It also fixes an infinite loop when the host glibc is too old and the
Linaro toolchains are used.

The two new rutime options are:
  --nice N      specify the niceness of the 'make' command
  --pid-file    file where to save the main process PID

The niceness allows limitting the impact of the autobuilder on the rest
of the job, when on a shared machine. A better solution would be to
implement a container with cgroups, but a systemd unit file would be so
much convenient! ;-)

The PID file allows to simplify the startup script, and really ensure
that we get the autobuild process' PID.

A SysV init startup script, as well as a sample defaults config file are
provided, to ease running the autobuild script as a daemon.

A sample runtime configuration file is provided as well.

As for the infinite loop, the fix consist in two changes:
  - separating the check that the configuration is actually fixable
    from the actual fixup,
  - adding a safeguard that limits the loop to at most 100 iterationd,
    and ignores that configuration if the limit is reached.

Note that nothing in there is really bullet-proof, but has been running
smoothly on a private instance for about a few hours now, and the
failure/succes rate is on par with what we currently have in the
autobuilders (two patches to fix build issues due to the host
configuration have already been caught, and patches submitted)

Changes v2 -> v3:
  - add the infinite loop fixes

Changes v1 -> v2;
  - add PID file handling
  - add startup script and sample configuration files
  - typo in --nice help text

Regards,
Yann E. MORIN.


The following changes since commit 611b515aa40c635d1af24883a9eab9e1e363a33c:

  Add mips32r6 and mips64r6 toolchains (2015-11-22 15:31:07 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot-test yem/limits

for you to fetch changes up to a89f4ae40bd1f7d5600226eb0ac20f27098413fb:

  autobuild: check for Linaro toolchains earlier (2015-11-27 16:00:21 +0100)

----------------------------------------------------------------
Yann E. MORIN (7):
      autobuild: add config option to set niceness
      autobuild: store PID to PID file
      conf: add a sample run-time configuration file
      etc: add SysV-init startup script and sample config file
      autobuild: avoid infinite loop when sanitising the configuration
      autobuild: add a function to check if the configuration is fixable
      autobuild: check for Linaro toolchains earlier

 conf/buildroot-autobuild.sample |   5 ++
 etc/default/buildroot-autobuild |  23 +++++++
 etc/init.d/buildroot-autobuild  | 148 ++++++++++++++++++++++++++++++++++++++++
 scripts/autobuild-run           |  66 +++++++++++++++---
 4 files changed, 231 insertions(+), 11 deletions(-)
 create mode 100644 conf/buildroot-autobuild.sample
 create mode 100644 etc/default/buildroot-autobuild
 create mode 100755 etc/init.d/buildroot-autobuild

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
