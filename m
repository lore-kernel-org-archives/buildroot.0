From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 12 Apr 2019 10:06:46 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2019-04-11 (libcamera-uClibc support)
In-Reply-To: <5cb02eac.1c69fb81.6a317.08faSMTPIN_ADDED_MISSING@mx.google.com>
References: <5cb02eac.1c69fb81.6a317.08faSMTPIN_ADDED_MISSING@mx.google.com>
Message-ID: <96eb1348-eeef-8fee-9b82-053fc10b2097@ideasonboard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 12/04/2019 07:00, Thomas Petazzoni wrote:
> Hello,
> 
> This is the list of Buildroot build failures that occured on
> 2019-04-11, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
> 
> Results for the 'master' branch
> ===============================
> 
> Build failures related to your packages:
> 
>          arc | libcamera-d5ca33f6c7b0cd1ca... | http://autobuild.buildroot.net/results/8517fe8fc197769285babf4c0915423d98c64d9c


I've had a quick look into this failure - and the log reports the following:


> [16/33] Compiling C++ object 'src/libcamera/4ab8042@@camera at sha/utils.cpp.o'.
> FAILED: src/libcamera/4ab8042@@camera at sha/utils.cpp.o 
> /home/buildroot/autobuild/instance-3/output/host/bin/arc-linux-g++ -Isrc/libcamera/4ab8042@@camera at sha -Isrc/libcamera -I../src/libcamera -Iinclude -I../include -I../src/libcamera/include -I/home/buildroot/autobuild/instance-3/output/host/usr/bin/../arc-buildroot-linux-uclibc/sysroot/usr/include -fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wnon-virtual-dtor -Wextra -Werror -std=c++11 -O3 -Wno-unused-parameter -fPIC -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -matomic -Os -MD -MQ 'src/libcamera/4ab8042@@camera at sha/utils.cpp.o' -MF 'src/libcamera/4ab8042@@camera at sha/utils.cpp.o.d' -o 'src/libcamera/4ab8042@@camera at sha/utils.cpp.o' -c ../src/libcamera/utils.cpp
> ../src/libcamera/utils.cpp:9:10: fatal error: sys/auxv.h: No such file or directory
>  #include <sys/auxv.h>
>           ^~~~~~~~~~~~
> compilation terminated.


This stems from the use of getauxval(AT_SECURE) in our replicated
implementation of secure_getenv(), which itself was provided to support
non-gnu-c-libraries (well, MUSL):

char *secure_getenv(const char *name)
{
	if (getauxval(AT_SECURE))
		return NULL;

	return getenv(name);
}


I believe this implementation lets us function with MUSL, but now this
error shows that uClibc does not provide <sys/auxv.h>.

In that event we could either:

 - Make secure_getenv():
	- always return NULL
	- always return getenv(name)
 - Disable support for libcamera against uClibc.

Alternatively, we could extend our secure_getenv() such that on uClibc
we use 'issetugid()' which was added at [0]:

> [0] https://git.busybox.net/uClibc/commit/?id=94246e65e20b5390d53858447526b231ef1afd67


In fact, that commit references a commit [1] at MUSL with a very well
written commit message describing the issue:

> [1] http://git.musl-libc.org/cgit/musl/commit/?id=ddddec106fd17c3aca3287005d21e92f742aa9d4

Then there is also a very good write up of this topic at [2] showing why
this complexity has come to exist...

> [2] issetugid() sadness 
>     https://gist.github.com/nicowilliams/4daf74a3a0c86848d3cbd9d0cdb5e26e

And that one makes me just want to disable libcamera for uClibc or any
other unsupported system instead.


Thomas, I assume other projects have to deal with this same issue, how
do they do it? Is there a generic way to solve this for all platforms?

I'm leaning towards just disabling builds on uClibc for now as we are
unlikely to get many users of libcamera with uClibc ... ? And we could
always revisit the topic later if someone decided they did want to use
it there.

-- 
Regards
--
Kieran
