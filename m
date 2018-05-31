From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 31 May 2018 23:28:01 +0200
Subject: [Buildroot] wireshark failure (was: [autobuild.buildroot.net] Build
 results for 2018-05-29)
In-Reply-To: <20180530060038.E361F20D99@mail.bootlin.com>
References: <20180530060038.E361F20D99@mail.bootlin.com>
Message-ID: <85e276a9-676f-168f-898c-8605adc0aa51@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi all,

On 30-05-18 08:00, Thomas Petazzoni wrote:
>          arm |               wireshark-2.2.14 | NOK | http://autobuild.buildroot.net/results/7384adae1e15ef8361fe60d6119f9c0bf925b26b | ORPH

 wireshark + qt5 + gcc6+ has been failing since November 11 last year
http://autobuild.buildroot.net/results/6326b6fdebc5ed56b60f45c231edce07b3ac801e
with
In file included from
/accts/mlweber1/instance-2/output/host/opt/ext-toolchain/x86_64-amd-linux-gnu/include/c++/6.2.0/bits/stl_algo.h:59:0,
...
/accts/mlweber1/instance-2/output/host/opt/ext-toolchain/x86_64-amd-linux-gnu/include/c++/6.2.0/cstdlib:75:25:
fatal error: stdlib.h: No such file or directory
 #include_next <stdlib.h>

 This is because gcc 6 has started providing stdlib.h itself, but wireshark
changes all -I options into -isystem which makes the include_next not find
stdlib.h any more. (Note, I have not found out why it didn't fail before
November 11; the autobuilders were already using GCC6, and wireshark itself was
bumped months before...).

 There are two possible solutions for this:

1. Revert upstream commit 67d9daa65b9d "autotools: Fix extra-compiler-warnings
for system headers". It's a rather big commit, though, and it doesn't revert
cleanly.

2. Switch to CMake, which anyway has to happen at some point since newer
releases have dropped autotools.

 I've started doing the latter, but it turns out that the CMake infrastructure
no longer supports GTK2. So, that would also imply removing GTK2 support from
wireshark.

 Since we're just before the 2018.05 release, and since this should also be
backported to 2018.02, I wasn't sure whether that was acceptable...

 Basically, it's choosing between supporting GTK2, or supporting QT5 + GCC6, or
a possibly very complicated configure.ac + Makefile.am patch.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
