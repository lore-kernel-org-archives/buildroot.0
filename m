From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Mar 2016 23:42:13 +0100
Subject: [Buildroot] [PATCH v2] gst1-av: fix cpu detection in libav
	configure
In-Reply-To: <87fuwbpxi2.fsf@dell.be.48ers.dk>
References: <1456701407-18377-1-git-send-email-arnout@mind.be>
 <87fuwbpxi2.fsf@dell.be.48ers.dk>
Message-ID: <56D61AC5.9050300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/29/16 12:27, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:
> 
>  > The configure script tries to guess a lot based on the cpu for which it
>  > is configured. Without --cpu, it will use a 'generic' cpu and disable
>  > any other options we pass to it.
> 
>  > In addition, we have to pass the --sysroot option like we do in the
>  > ffmpeg package. This makes sure that regardless of the architecture
>  > options that ffmpeg passes along, an external multilib toolchain
>  > doesn't try to use a subdirectory of the sysroot. The libav build
>  > system will pass a --isysroot argument which overrides the multilib
>  > subdir.
> 
>  > Finally, we have to properly enable/disable the architecture-specific
>  > optimisations. Autodetection of these things is completely borked in
>  > the configure script.
> 
>  > Fixes:
>  > http://autobuild.buildroot.net/results/ce83513135e7765c171353815947d715eb897d3d
> 
>  > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>  > Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>  > ---
>  > v2: improve commit message
> 
>  > The --isysroot is something we should probably do in the toolchain
>  > wrapper.
> 
> What is the advantage of --isysroot over --sysroot? I don't seem to find
> a lot about in the gcc documentation, but it seems like:
> 
> - isysroot only applied to headers, not headers+libraries like --sysroot
> - Some versions of MacOSX/llvm only support --isysroot, not --sysroot
> 
> Neither of these seems of much interest to us?

 I actually didn't do proper research, i.e. I didn't consult the man page. I
just tried:

$ .../ext-toolchain/bin/mips-img-linux-gnu-gcc --sysroot
.../usr/mips64el-buildroot-linux-gnu/sysroot -mabi=64 -EL -std=gnu99 -I./ -D...
-Os -march=mips64r6 -std=c99 -fomit-frame-pointer -fPIC -mips64 -mips64r6
-msched-weight -mload-store-pairs -funroll-loops -mhard-float ... -c
libavformat/4xm.c
In file included from ./libavutil/intreadwrite.h:22:0,
                 from libavformat/4xm.c:30:
/gentoo/home2/arnout/br-out/libav/host/opt/ext-toolchain/lib/gcc/mips-img-linux-gnu/4.9.2/include/stdint.h:9:26:
fatal error: stdint.h: No such file or directory
 # include_next <stdint.h>
                          ^
compilation terminated.
$ .../ext-toolchain/bin/mips-img-linux-gnu-gcc --sysroot
.../usr/mips64el-buildroot-linux-gnu/sysroot --isysroot
.../usr/mips64el-buildroot-linux-gnu/sysroot -mabi=64 -EL -std=gnu99 -I./ -D...
-Os -march=mips64r6 -std=c99 -fomit-frame-pointer -fPIC -mips64 -mips64r6
-msched-weight -mload-store-pairs -funroll-loops -mhard-float ... -c
libavformat/4xm.c
$


 I was also surprised that this made a difference. Previously I had done a
-print-sysroot with all of these options and it added mipsel-r1-hard to the
sysroot, so somehow I assumed that isysroot would override that.

 So I ran with -v. With just --sysroot:

#include "..." search starts here:
#include <...> search starts here:
 .
 .../opt/ext-toolchain/bin/../lib/gcc/mips-img-linux-gnu/4.9.2/include
 .../opt/ext-toolchain/bin/../lib/gcc/mips-img-linux-gnu/4.9.2/include-fixed/mipsel-r6-hard/lib64
 .../opt/ext-toolchain/bin/../lib/gcc/mips-img-linux-gnu/4.9.2/../../../../mips-img-linux-gnu/include
End of search list.

 And with the --sysroot -isysroot:

#include "..." search starts here:
#include <...> search starts here:
.
 .../opt/ext-toolchain/bin/../lib/gcc/mips-img-linux-gnu/4.9.2/include
 .../opt/ext-toolchain/bin/../lib/gcc/mips-img-linux-gnu/4.9.2/include-fixed/mipsel-r6-hard/lib64
 .../opt/ext-toolchain/bin/../lib/gcc/mips-img-linux-gnu/4.9.2/../../../../mips-img-linux-gnu/include
 .../usr/mips64el-buildroot-linux-gnu/sysroot/usr/include
End of search list.


 So clearly it does make a difference...

 So I tried with my host-gcc as well, and both gcc-4.9 and gcc-5 work as
expected, i.e. they have the --sysroot in the search path.

 So it looks like this is actually a "feature" of the Codescape IMG toolchain.



 Coming back to the patch: the idea of passing --sysroot to configure comes from
the ffmpeg package itself. It has been like that in the ffmpeg package from the
first commit.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
