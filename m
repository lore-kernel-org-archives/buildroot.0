From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 2 Jan 2014 06:47:04 +0200
Subject: [Buildroot] Wrong compiler path when compiling zlib
In-Reply-To: <CA+hj=MoNYEZchBs1_34cS4eA=UYfU+2QNdbNBDOqt=u2YFsJPw@mail.gmail.com>
References: <CA+hj=MoNYEZchBs1_34cS4eA=UYfU+2QNdbNBDOqt=u2YFsJPw@mail.gmail.com>
Message-ID: <20140102044704.GF6589@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ivan,

On Wed, Jan 01, 2014 at 11:46:27PM +0100, Ivan Wagner wrote:
> I noticed that the compiler base directory is actually wrong when
> attempting to compiler the zlib library.
> 
> I've configured CodeSourcery as an external pre-installed toolchain with
> path under /opt but this is the error log I get when trying to compile zlib:
> 
> --------------------
> ./configure --shared --prefix=/usr
> Wed Jan  1 23:37:01 CET 2014
> === ztest6146.c ===
> extern int getchar();
> int hello() {return getchar();}
> ===
> /home/ivan/projects/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-gcc
> -c ztest6146.c
> ./configure: line 165:
> /home/ivan/projects/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-gcc:
> No such file or directory
> ... using
> /home/ivan/projects/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-gcc
> 
> Checking for obsessive-compulsive compiler options...
> === ztest6146.c ===
> int foo() { return 0; }
> ===
> /home/ivan/projects/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-gcc
> -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe
> -Os -fPIC ztest6146.c
> ./configure: line 343:
> /home/ivan/projects/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-gcc:
> No such file or directory
> (exit code 127)
> Compiler error reporting is too harsh for ./configure (perhaps remove
> -Werror).
> ** ./configure aborting.
> --------------------
> 
> I don't know where it gets the
> /home/ivan/projects/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-gcc
> path from...

This should be a symlink to the external toolchain wrapper. See the comment in 
toolchain/toolchain-external/toolchain-external.mk for some more information 
on this wrapper. I guess that a 'make clean' would solve your problem.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
