From: Weber, Bernd <BWEBE@dolby.com>
Date: Mon, 15 Sep 2008 15:43:56 -0700
Subject: [Buildroot] Problem cross compiling for MIPS and shared libgcc_s
	not found
Message-ID: <05BB196AB3DA6C4BBE11AB6C957581FE0FBECF4F@sfo-exch-01.dolby.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

 

I'm trying to get a buildroot cross compiling for MIPS. In general it
works, meaning it compiles everything and the toolchain is working
correctly. Well, apart the fact that one important thing for me is
missing in the final build.

Important to mention that I am not using the current top-of-tree
versions of the toolchain in my setup here. The versions I'm using are:

-         uClibc 0.9.38.2

-         gcc 4.0.4

-         ccache 2.3

-         binutils 2.17

-         linux-libc-headers 2.6.11.0

I have an older version of buildroot here running, should be from
March/April 2005, that I use as a golden reference. But I'm trying to
get these old packages working with the current version of buildroot so
I can utilize all the great work that has been done for all the
packages.

Here the problem:

It seems out of whatever reason that in the libc++ the define
_GLIBCXX_SYMVER is not set. From what I could see that happens since
configure cannot find libgcc_s.so when checking for shared libgcc. In
the older version of buildroot this works, however. When comparing both
I can see that the invocation at this particular check is different. By
the way, I checked, libgcc_s.so is existing in staging_dir/lib in both
buildroots. So it is there it's just not found. Following are excerpts
from
/path_to_[new_]toolchain/toolchain_build_mipsel/gcc-4.0.4-final/mipsel-l
inux-uclibc/libstdc++-v3/config.log

 

Call latest version:

configure:98228: checking for shared libgcc

configure:98253:
/path_to_new_toolchain/build_mipsel/staging_dir/usr/bin/mipsel-linux-ucl
ibc-gcc -o conftest  -lgcc_s   conftest.c -lm  >&5

/path_to_new_toolchain/build_mipsel/staging_dir/bin/../lib/gcc/mipsel-li
nux-uclibc/4.0.4/../../../../mipsel-linux-uclibc/bin/ld: cannot find
-lgcc_s

collect2: ld returned 1 exit status

 

Call old version:

configure:98228: checking for shared libgcc

configure:98253:
/path_to_toolchain/toolchain_build_mipsel/gcc-4.0.4-final/gcc/xgcc
-B/path_to_toolchain/toolchain_build_mipsel/gcc-4.0.4-final/gcc/
-B/path_to_toolchain/build_mipsel/staging_dir/mipsel-linux-uclibc/bin/
-B/path_to_toolchain/build_mipsel/staging_dir/mipsel-linux-uclibc/lib/
-isystem
/path_to_toolchain/build_mipsel/staging_dir/mipsel-linux-uclibc/include
-isystem
/path_to_toolchain/build_mipsel/staging_dir/mipsel-linux-uclibc/sys-incl
ude -o conftest  -lgcc_s   conftest.c -lm  >&5

 

Obviously the calls are completely different. I just don't understand
where the system gets the information from in the old buildroot and not
in the newer version...

Does anybody have a hint for me what could be wrong in the setup? Maybe
something in the configuration? Maybe a change in the Makefiles
somewhere?

Any help is greatly appreciated!!!

Thanks!

 

-Bernd

 




-----------------------------------------
This message (including any attachments) may contain confidential
information intended for a specific individual and purpose.  If you
are not the intended recipient, delete this message.  If you are
not the intended recipient, disclosing, copying, distributing, or
taking any action based on this message is strictly prohibited.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080915/21add291/attachment.htm 
