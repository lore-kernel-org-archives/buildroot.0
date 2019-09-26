From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Thu, 26 Sep 2019 17:50:06 +0100
Subject: [Buildroot] Chromium v7 test
In-Reply-To: <d86c4082-efed-c7e8-e081-d6ff81583ec3@codethink.co.uk>
References: <CAD0+TpAh1V=ztZfNAGzF34DAW=6f-JSzkJ0SvhwNWqu3vw_5HQ@mail.gmail.com>
 <ab26bc45-d159-f10b-bfbd-9ad676d7d75d@codethink.co.uk>
 <CAMWSM7iW0FxukQi3kV7njD_bgFXVyQoWSwHC8Nnz_r0iQOZb4g@mail.gmail.com>
 <d86c4082-efed-c7e8-e081-d6ff81583ec3@codethink.co.uk>
Message-ID: <81221875-e7dd-4dc9-4740-9926fc0f164c@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joseph, all,

On 11/09/2019 17:50, Thomas Preston wrote:
> On 11/09/2019 17:29, Joseph Kogut wrote:
>> Thanks for starting the work on this, and I'm happy to contribute
>> however I can. If you push your work to a public repository, I'd be
>> happy to look it over, and you can CC me on any patches you send to
>> the mailing list.
>
> Will do, much appreciated! There's nothing stopping us from working in the
> open so we'll get patches out as soon as we can.

We're still working through our initial CEF build and we're hoping to use the
chromium-v6 branch as a "working" reference. However we can't get it to build
for x86_64 because the generated ninja files have some crazy cflag includes
(from pkg-config):

    STAGING_DIR=/mnt/output/host/x86_64-buildroot-linux-gnu/sysroot

    $ grep "cflags =" output/build/chromium-67.0.3396.79/out/Release/obj/dbus/dbus.ninja
    cflags =
    [snip]
    -isystem../../../../host/x86_64-buildroot-linux-gnu/sysroot/mnt/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/dbus-1.0
    -isystem../../../../host/x86_64-buildroot-linux-gnu/sysroot/mnt/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/dbus-1.0/include
    -isystem../../../../host/x86_64-buildroot-linux-gnu/sysroot/mnt/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/glib-2.0
    -isystem../../../../host/x86_64-buildroot-linux-gnu/sysroot/mnt/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/glib-2.0/include
    -isystem../../../../host/x86_64-buildroot-linux-gnu/sysroot/mnt/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include
    [snip]

See how there is a relative path to the sysroot, then the full path. I have a
branch with a single fixup here [0]. There's a Debian 9 build container there
too because this branch is quite old now.

Joseph, I don't know if you saw a similar error, or could advise on the above?
It looks like pkg-config isn't using `target_sysroot` correctly.
Thanks


# CEF
Regarding the CEF package we're actually working on, we're having issues
deciding which values to use for `use_sysroot` and `use_custom_libcxx`.

We've gone with `use_sysroot=false` and we're trying to get pkg-config to give
us the right buildroot host/target includes, which we're having some success
with.

For `use_custom_libcxx=true`, we have an issue with both true and false cases:
With true, gn uses pkg-config to generate the following include paths in the
ninja files:

    -I/mnt/output/host/bin/../x86_64-buildroot-linux-gnu/sysroot/usr/include/glib-2.0
    -I/mnt/output/host/bin/../x86_64-buildroot-linux-gnu/sysroot/usr/lib/glib-2.0/include
    -I/mnt/output/host/bin/../x86_64-buildroot-linux-gnu/sysroot/usr/include
    [snip]
    -isystem../../buildtools/third_party/libc++/trunk/include
    -isystem../../buildtools/third_party/libc++abi/trunk/include

There is a GNU C math.h inside sysroot/usr/include which overrides (I think!)
the bundled LLVM libc++ cmath, which causes lots of global namespace errors to
do with math symbols.  Our client has a working build and their pkg-config does
not generate this `sysroot/usr/include` include path, so one solution might be
to fix the includes returned from pkg-config.

For `use_custom_libcxx=false`, the build gets a lot further but we see some
incorrect linking. For example:

    $ ldd output/build/libcef/out/Release/host/generate_colors_info
    [snip]
    libjpeg.so.8 => not found

    $ find output/host/ -name "*jpeg*"
    [snip]
    output/host/lib/pkgconfig/libjpeg.pc
    output/host/lib/libjpeg.so.9
    output/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig/libjpeg.pc
    output/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libjpeg.so.8

See how the host utility was incorrectly linked against the sysroot libjpeg. We
intend to get around this with the `pkg_config` and `host_pkgconfig` gn
arguments.

If anyone can advise on how the above is looking that would be useful. Once we
get a binary built, we'll send an RFC for people to take a look at.

Many thanks!
Thomas

[0] https://github.com/tompreston/buildroot/commits/tpreston/chromium-v6
