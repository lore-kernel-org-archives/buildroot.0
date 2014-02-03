From: Alan Ott <alan@signal11.us>
Date: Mon, 03 Feb 2014 11:27:03 -0500
Subject: [Buildroot] [PATCH] package/joe: Add package for the JOE editor
In-Reply-To: <874n4hp47i.fsf@dell.be.48ers.dk>
References: <1391301769-28263-1-git-send-email-alan@signal11.us>	<878uttr303.fsf@dell.be.48ers.dk>
 <52EEBC73.9030709@signal11.us> <874n4hp47i.fsf@dell.be.48ers.dk>
Message-ID: <52EFC357.5000407@signal11.us>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/02/2014 04:58 PM, Peter Korsgaard wrote:
>>>>>> "Alan" == Alan Ott <alan@signal11.us> writes:
>   >> We do have ncurses in buildroot, so it should enable support for it if
>   >> ncurses is enabled.
>
>   > What you have is fine, but it's worth mentioning that curses support
>   > doesn't actually help joe anymore. If you grep through the joe source,
>   > it only includes ncurses in one file, and doesn't actually use
>   > anything out of it. The resulting binary even from a "use curses"
>   > build doesn't actually even link to the ncurses library (it's
>   > optimized out by the linker).
>
> Ok, it would have been good to mention that in a comment.

Hi Peter,

Sorry about that. :(

>   I only did a
> test build to ensure that configure detected it and the final executable
> ended up getting linked with it, which was the case:
>
> ./output/host/usr/bin/arm-linux-readelf -a output/target/usr/bin/joe | \
>      grep NEEDED
>   0x00000001 (NEEDED)                     Shared library: [libm.so.0]
>   0x00000001 (NEEDED)                     Shared library: [libncurses.so.5]
>   0x00000001 (NEEDED)                     Shared library: [libutil.so.0]
>   0x00000001 (NEEDED)                     Shared library: [libc.so.0]

Strange. It doesn't do that on x86:

alan at ato:~/work/joe-3.7$ readelf -a joe |grep NEEDED
  0x0000000000000001 (NEEDED)             Shared library: [libm.so.6]
  0x0000000000000001 (NEEDED)             Shared library: [libtinfo.so.5]
  0x0000000000000001 (NEEDED)             Shared library: [libutil.so.1]
  0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]

And I even checked the link step with make V=1:
     gcc  -g -O2   -o joe ... -lm -lncurses -lutil

If you want me to change it from the way it is, let me know.

Alan.
