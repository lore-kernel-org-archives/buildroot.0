From: Matias Garcia <mgarcia@rossvideo.com>
Date: Fri, 06 May 2011 14:38:59 -0400
Subject: [Buildroot] Codesourcery multi-lib selection in buildroot
In-Reply-To: <20110505211023.142dec32@surf>
References: <4DC1BC78.4050103@rossvideo.com> <20110505211023.142dec32@surf>
Message-ID: <4DC44043.9030904@rossvideo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11-05-05 03:10 PM, Thomas Petazzoni wrote:
> On Wed, 04 May 2011 16:52:08 -0400
> Matias Garcia<mgarcia@rossvideo.com>  wrote:
>
>> I'm building an OS for a PowerPC e500v2 core. Originally, I used a
>> stock buildroot toolchain (uclibc), but was not able to optimize a
>> time-critical section of our application. With the CodeSourcery
>> compiler, I am. Unfortunately, even setting -te500v2 in the buildroot
>> optimizations (and hacking it into the TARGET_LDFLAGS) doesn't fix
>> all cases. Certain packages within buildroot seem to link against the
>> wrong library (linker complains that one library is compiled with
>> hard-float and another with soft-float, etc). Is there a way to tell
>> buildroot (or Make in general) to always link against a certain
>> library set?
> We have to make sure that this -te500v2 flag is passed to all packages
> during their build process. Which packages are causing problems
> exactly ?
Among others, freetype, jpeg-8b, liblockfile, libsysfs, libusb, 
libusb-compat, liblzo, and imlib2 (which I've hacked into the build 
based on ImageMagick). Most often, the error is 'Warning: 
<...>/cr[blah].o uses hard float, <...>/blah uses soft float'.
> Another solution is to try the recent proposal of Peter Korsgaard to
> use a wrapper for external toolchain components, that would enforce the
> use of selected compiler flags so that the selected sysroot would
> always be correct.
That would be magical. I'm testing Peter's patch right now with a tree 
updated to his commit removing CFLAGS (yesterday), but I've hit a snag. 
It looks to me like unless I define some variables to tell buildroot I 
want -mcpu=854[0|8] -mabi=spe -mspe -mhard-float -mgprs-float=double (if 
memory serves), the wrapper will assume I want generic powerpc, as the 
target optimizations don't seem to be passed in. I'd even prefer to tell 
the compiler that I want -te500v2 instead since it's a handy-dandy 
shortcut that CodeSourcery provides for the above options, but I'll take 
what I can get. Any suggestions for a simple solution? I've defined an 
e500 option under target arch before, but I'd rather avoid that if possible.

Thanks,
Matias

> Thomas
