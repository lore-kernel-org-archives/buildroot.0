From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 30 Mar 2014 20:55:35 +0400
Subject: [Buildroot] [PATCH v2 0/3] xtensa: add -mtext-section-literals to
	xtensa ABI
Message-ID: <1396198538-32628-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

these three patches are the second part of fixes for building huge sources,
like wireshark or mplayer: adding trampolines support to binutils allows
assembling of such files, but with literals placed into separate section
build fails at the linking step.

First patch allows building uclibc with -mtext-section-literals, it is
posted to the uclibc list, but not reviewed/checked in yet.
Second patch adds -mtext-section-literals flag to xtensa ABI.
Third patch removes -mtext-section-literals flag from individual packages
that used to need them.

Changes v1 -> v2:
- add comment to XTENSA_ABI variable explaining -mtext-section-literals usage
- remove -mtext-section-literals from individual package *.mk's

Max Filippov (3):
  uclibc: add missing .literal_position directives
  Makefile.in: add -mtext-section-literals to xtensa ABI
  xtensa: remove -mtext-section-literals from individual package *.mk's

 package/Makefile.in                                | 11 +++-
 package/civetweb/civetweb.mk                       |  3 --
 package/ffmpeg/ffmpeg.mk                           |  4 --
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk         |  4 --
 package/gstreamer1/gst1-libav/gst1-libav.mk        |  4 --
 package/lmbench/lmbench.mk                         |  4 --
 package/php/php.mk                                 |  4 --
 package/sqlcipher/sqlcipher.mk                     |  4 --
 package/sqlite/sqlite.mk                           |  4 --
 ...-add-missing-.literal_position-directives.patch | 62 ++++++++++++++++++++++
 10 files changed, 72 insertions(+), 32 deletions(-)
 create mode 100644 package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/uclibc-0001-xtensa-add-missing-.literal_position-directives.patch

-- 
1.8.1.4
