From: =?UTF-8?Q?C=C3=A9dric_Marie?= <cedric.marie@openmailbox.org>
Date: Tue, 09 Jun 2015 09:54:54 +0200
Subject: [Buildroot] CMake and VERBOSE variable
Message-ID: <9943347198fceae1227501e1d00f818a@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

CMake turns on verbose mode if VERBOSE environment variable is defined
and not empty. VERBOSE=0, VERBOSE=1, VERBOSE=whatever all enable
verbose mode.
See for example: http://www.cmake.org/Bug/view.php?id=3378

If VERBOSE is defined but empty, a "light" verbose mode is enabled. It
consists in printing this information every time xxx.c file needs to be
recompiled:
Dependee "xxx.c" is newer than depender "xxx.c.o".

NB: I am aware that these light verbose messages don't appear at first
build. It is only disturbing when rebuilding packages when a source
file is modified.

This light verbose mode is enabled in Buildroot, and I suppose this is
not deliberate. This is caused by VERBOSE being exported in root
Makefile (line 231), even if not set:
export SHELL CONFIG_SHELL quiet Q KBUILD_VERBOSE VERBOSE

NB: All other variables in that list seems to always be not empty.

There is another environment variable, CMAKE_NO_VERBOSE, that can be
set (=1) to disable these "dependee" messages, even if VERBOSE is
defined and empty.
It does not disable the full verbose mode. VERBOSE=1 can still be used,
but the "dependee" messages will not be showned in this full (not so
full...) verbose mode.

To disable this unexpected light verbose mode, the first solution could
consist in adding CMAKE_NO_VERBOSE=1 in $(2)_MAKE_ENV in pkg-cmake.mk.

This would make the fix specific to CMake, which makes sense for a CMake
specific problem :)

In fact I have not really made up my mind whether the "real" problem is
in CMake or in Buildroot. On the one hand, CMake behaviour is strange
(checking an empty variable), and on the other hand, Buildroot should
not export this variable, even if this is not supposed to be harmful.

In the end, I think the right solution would be not to export VERBOSE
if not set (remove it from the export list, and export it when
defined).

What do you think about it? The fact that it is defined empty does not
seem to be useful anywhere, but I might have missed something...

Regards,

-- 
C?dric
