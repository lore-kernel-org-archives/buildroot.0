From: Trevor Woerner <twoerner@gmail.com>
Date: Fri, 10 Feb 2012 13:59:22 -0500
Subject: [Buildroot] [PATCH v3 directfb] directfb: font handling
	requires libbz2
In-Reply-To: <8762ff2ekh.fsf@macbook.be.48ers.dk>
References: <1328826314-30424-1-git-send-email-twoerner@gmail.com>
 <1328826314-30424-2-git-send-email-twoerner@gmail.com>
 <8762ff2ekh.fsf@macbook.be.48ers.dk>
Message-ID: <CAHUNapQLnF5MeD7x0yQuY7jG5RV4fCWbKJz4XiJmgLvVb+kn+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 10, 2012 at 5:00 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Trevor" == Trevor Woerner <twoerner@gmail.com> writes:
> ?Trevor> From: Trevor Woerner <twoerner@gmail.com>
> ?Trevor> One of the libraries which is built by directfb, libidirectfbfont_ft2.so,
> ?Trevor> requires libbz2:
>
> That's not true. Freetype might optionally have bzip2 support, but it
> isn't a requirement for directfb.

I see. Since the bzip2 headers and libraries exist in my toolchain's
sysroot my build of freetype includes bz2 support. The bz2 dependency
in the directfb library I cited wasn't due to directfb itself but
rather due to libfreetype (which is one of the listed libraries for
the cited directfb library):

./host/usr/bin/arm-angstrom-linux-gnueabi-readelf -a
target/usr/lib/libfreetype.so.6.8.0 | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [libbz2.so.1]
 0x00000001 (NEEDED)                     Shared library: [libc.so.6]

In this situation would it be worth investigating some sort of tool to
check the shared libraries in the target filesystem for any missing
dependencies from the toolchain (and include them)? I vaguely recall
there already being such a tool, but can't seem to find/remember what
it is called.

Best regards,
    Trevor
