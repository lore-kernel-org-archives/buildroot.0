From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu,  6 Mar 2014 17:54:48 +0100
Subject: [Buildroot] [PATCH 0/2] Adding exim
Message-ID: <1394124890-29254-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm resuming a patchset from 2011 [0], that was never merged, since Bernd
Kuhls recently expressed interest a part of it [1].

The original patchset goal was to add cyrus-imapd, cyrus-sasl and exim to
Buildroot, along with their dependencies. That required a lot of patching
because none of these packages are cross-compilation-friendly. The quality
of my original patches was not very good, but there was apparently not much
interest in them, and eventually I quite forgot about them.

The mentioned software are still up and running in my local buildroot-based
projects, and they have been kept up-to-date.

I am now resending only the exim-related patches, updated and with references
to cyrus packages removed, because that's what Bernd expressed interest for.
This makes exim not usable out of the box, because in my original patches it
shipped a config file tailored for cyrus-imapd.

However note an MTA is usually configured to deliver mail to a specific mail
server, so in order to exploit exim it is necessary to add such a package.
Bernd wrote he's working on dovecot, so he may add an exim config for it.
Or I may resurrect and cleanup my cyrus-imapd patches and send them again
after exim is in Buildroot.
Or both.

For the time being, here's my current best effort for bringing exim into
Buildroot.

Changes since the 2011 patchset:
 - use the exim user, not the cyrus user (makes no sense without cyrus-imapd);
 - do not ship a cyrus-centric configuration file;
 - bump to 4.82 (latest upstream release).

[0] http://lists.busybox.net/pipermail/buildroot/2011-August/045128.html
[1] http://lists.busybox.net/pipermail/buildroot/2014-March/091094.html

Luca

Luca Ceresoli (2):
  system/skeleton: add mail group
  exim: new package

 package/Config.in                                  |  1 +
 package/exim/Config.in                             |  9 +++++
 package/exim/Local-Makefile                        | 15 ++++++++
 package/exim/S86exim                               | 26 ++++++++++++++
 .../exim/exim-Build-buildconfig-for-the-host.patch | 23 ++++++++++++
 ...n-t-make-backup-copies-of-installed-files.patch | 40 +++++++++++++++++++++
 ...ip-version-check-and-symlink-installation.patch | 40 +++++++++++++++++++++
 package/exim/exim.mk                               | 41 ++++++++++++++++++++++
 system/skeleton/etc/group                          |  1 +
 9 files changed, 196 insertions(+)
 create mode 100644 package/exim/Config.in
 create mode 100644 package/exim/Local-Makefile
 create mode 100644 package/exim/S86exim
 create mode 100644 package/exim/exim-Build-buildconfig-for-the-host.patch
 create mode 100644 package/exim/exim-Don-t-make-backup-copies-of-installed-files.patch
 create mode 100644 package/exim/exim-Skip-version-check-and-symlink-installation.patch
 create mode 100644 package/exim/exim.mk

-- 
1.8.3.2
