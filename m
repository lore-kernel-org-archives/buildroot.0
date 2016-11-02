From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Wed, 2 Nov 2016 10:42:17 -0700
Subject: [Buildroot] distributable Buildroot BSPs
Message-ID: <55a57fe4-1542-6b61-64ce-4ed10dd7d005@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Can anybody point me to an example of a prebuilt Buildroot-generated 
SDK/BSP distributed in the wild? I'm looking for something that includes 
binaries for host executables so I can see how they did it.

My users primarily care about target code. I want to both provide 
prebuilt target binaries and let my users patch/rebuild them. That part 
seems to be pretty clear; I can 'make && cp output/images/* prebuilt/', 
and also provide the defconfig.

However, I also want to provide a few host executables, and that's 
raising a lot of questions for me:

 1. The fact that host binaries are non-relocatable (can only be run
    where they were built) seems to be well-known. For now I'm content
    to manually run "output/host/usr/bin/patchelf --set-rpath
    '$ORIGIN/../lib'" in a post-processing step...
 2. I really only want to distribute a couple key host binaries, like
    adb and dtc. However, since these depend on other host packages,
    output/host/usr/bin ends up full of other binaries from gettext,
    autoconf/automake/etc, flex, etc. That's dead weight as far as I'm
    concerned; it takes up space, and encourages people to actually use
    them, but I don't want to support them.
 3. That suggests I should manually extract the things I care about from
    inside output/host, just like I did with the "prebuilt" directory I
    mentioned above for target code.
     1. Simplest would be to symlink, but then a "make clean" will
        suddenly make the host tools disappear, which would be unexpected.
     2. So I should copy them out, again like the "prebuilt" directory.
        But then I'd also need to copy out the output/host/usr/lib files
        they depend on (and the libs the libs depend on...). I could
        write a readelf-based script to find the dependencies and copy
        them, but that's starting to sound complicated. If only I had a
        tool that could build me an SDK... ;-)
     3. Host tools are built with options like these:
        --sysconfdir=/absolute/path/to/output/host/etc (so they can find
        output/host/etc/mke2fs.conf, for example). Huh. Readelf won't
        help me find those dependencies, and no rpath will help me
        relocate that. I'm not even sure what directory structure I
        would want for those files in an ideal BSP.
 4. The likelihood that my users will need to rebuild host tools is
    slim, and they take a long time to rebuild, since they pull in
    dependencies like host-autoconf, host-flex, and even host-python.
    Again, unnecessary overhead. So should the defconfig I distribute
    include BR2_PACKAGE_HOST_*?
     1. Yes: but then users typing "make" will spend lots of time
        rebuilding host executables that they're extremely unlikely to
        change.
     2. No: OK, I can treat the host tools completely separately, and
        nobody even needs to know they came from Buildroot. But then I
        need to maintain two defconfigs, one that builds target code and
        one that builds host code.


So anyways, that's why I'm looking for examples of how others have dealt 
with these problems.

I'd appreciate thoughts on any of these points, even if no one person 
has The Answers to all of them. Thanks!

-- 
Hollis Blanchard <hollis_blanchard@mentor.com>
Mentor Graphics Emulation Division

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161102/f1bfed00/attachment.html>
