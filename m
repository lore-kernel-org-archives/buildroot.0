From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 11 Jun 2015 00:00:52 +0200
Subject: [Buildroot] CMake and VERBOSE variable
In-Reply-To: <9943347198fceae1227501e1d00f818a@openmailbox.org>
References: <9943347198fceae1227501e1d00f818a@openmailbox.org>
Message-ID: <5578B394.1010503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/09/15 09:54, C?dric Marie wrote:
> Hi,
> 
> CMake turns on verbose mode if VERBOSE environment variable is defined
> and not empty. VERBOSE=0, VERBOSE=1, VERBOSE=whatever all enable
> verbose mode.
> See for example: http://www.cmake.org/Bug/view.php?id=3378
> 
> If VERBOSE is defined but empty, a "light" verbose mode is enabled. It
> consists in printing this information every time xxx.c file needs to be
> recompiled:
> Dependee "xxx.c" is newer than depender "xxx.c.o".
> 
> NB: I am aware that these light verbose messages don't appear at first
> build. It is only disturbing when rebuilding packages when a source
> file is modified.
> 
> This light verbose mode is enabled in Buildroot, and I suppose this is
> not deliberate. This is caused by VERBOSE being exported in root
> Makefile (line 231), even if not set:
> export SHELL CONFIG_SHELL quiet Q KBUILD_VERBOSE VERBOSE

 The reason to export is, is to pass it to sub-makes that make use of the same
mechanism, e.g. the kernel.

 However, there's something to be said for exporting it only if V=1.

> 
> NB: All other variables in that list seems to always be not empty.
> 
> There is another environment variable, CMAKE_NO_VERBOSE, that can be
> set (=1) to disable these "dependee" messages, even if VERBOSE is
> defined and empty.
> It does not disable the full verbose mode. VERBOSE=1 can still be used,
> but the "dependee" messages will not be showned in this full (not so
> full...) verbose mode.
> 
> To disable this unexpected light verbose mode, the first solution could
> consist in adding CMAKE_NO_VERBOSE=1 in $(2)_MAKE_ENV in pkg-cmake.mk.
> 
> This would make the fix specific to CMake, which makes sense for a CMake
> specific problem :)

 The thing is, the working of CMAKE_NO_VERBOSE is not intuitive either (because
it can still be combined with VERBOSE=1).

 So I'm more in favour of not exporting VERBOSE if empty.

 Regards,
 Arnout

> 
> In fact I have not really made up my mind whether the "real" problem is
> in CMake or in Buildroot. On the one hand, CMake behaviour is strange
> (checking an empty variable), and on the other hand, Buildroot should
> not export this variable, even if this is not supposed to be harmful.
> 
> In the end, I think the right solution would be not to export VERBOSE
> if not set (remove it from the export list, and export it when
> defined).
> 
> What do you think about it? The fact that it is defined empty does not
> seem to be useful anywhere, but I might have missed something...
> 
> Regards,
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
