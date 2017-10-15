From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Oct 2017 11:03:56 +0200
Subject: [Buildroot] [PATCH 1/4] fs/common.mk: support lz4 compression
In-Reply-To: <20171014073234.GA2530@scaer> (Yann E. MORIN's message of "Sat,
 14 Oct 2017 09:32:34 +0200")
References: <20171013191655.30427-1-peter@korsgaard.com>
 <20171014000503.615d7fa6@windsurf.lan> <20171014073234.GA2530@scaer>
Message-ID: <87a80sye83.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, Thomas, All,
 > On 2017-10-14 00:05 +0200, Thomas Petazzoni spake thusly:
 >> On Fri, 13 Oct 2017 21:16:52 +0200, Peter Korsgaard wrote:
 >> > Similar to the other compressors.  Notice that we use the -l (legacy format)
 >> > for Linux kernel initrd compatibility.
 >> > 
 >> > Lz4 decompression is supported by the Linux kernel since 3.11.
 >> > 
 >> > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> 
 >> I don't know in which direction we want to go, but Yann has a series
 >> doing cleanups/improvements in the filesystem stuff,

 > I already pointed Peter to this on-going work 10 days ago, while
 > discussing on IRC, and he said "ahh, nice!"  ;-)

Ahh, the discussion about fixing the issues around toplevel parallel
build and filesystem creation? I haven't looked at your patches, I just
commented that it was nice that you were taking care of it ;)


 > Indeed. It does not make sense to get a compressedd ext2/3/4 (or
 > whatever other uncompressed filesystem). That is semantically useless.

I agree that we would most likely not introduce such options today, but
they have been supported for a very long time. I have personally used
the .gz option to save archival disk space for buildbot, so they are not
completely useless ;)

It is not completely semantically useless as it can be used for
old-style initrds (but yeah, using an initramfs makes more sense).


 > One may argue that for very big images, there might not be enough place
 > to store it, but the image is first generated uncomoressed anyway, so we
 > need at least that much space to start with. Compressing the image will
 > not help for big images sanyway.

Except if you are archiving the output/images directory and want to
limit long term disk space like explained above.


 > If one still needs to compress the image (e.g. to send to Q/A), then it
 > is still possible to do it in a post-iamge script, which is even more
 > versatile (it can sign and/or encrypt as well, for example).

Indeed.


 > The cpio case is a bit different, but nonetheless the outcome is the
 > same: we don't need to compress it.

 > When used as an initramfs, the kernel will compress it anyway, so that
 > would be a double compression; bad. When used as an initrd with the
 > iso9660 filesystem, it is it that should compress it.

You are missing the external initramfs usecase (E.G. not built into the
kernel) - How just about all PC distributions boot. This usecase
probably doesn't make much sense for Buildroot, but such a setup does
make sense when you use a dm-verity / dm-crypt rootfs and need to mount
it in the initramfs.

For thes use cases, the compression options IMHO makes sense.


 > The only questionable case that remains is the cpio as used as a pure
 > initrd. Does that still exist?

Yes, that is similar to the initramfs-inside-kernel usecase, but here
the compression options do make sense. There may be some usecases where
it is interesting to keep the rootfs and kernel separately from each
other.

 > And for that single use-case, I would still suggest a post-image
 > script, because I don't see the point of having support in the infra
 > for compression, when only a single image uses it. OR at the very
 > least, that compressing cpio is entirely moved to the cpio fs.

In concept I agree, but you could use that logic on a lot of the things
Buildroot does. We have supported these options for a very long time,
and they imho add very little complexity, so I suggest we keep them for
compatibility reasons.

Regarding the question of if we should add lz4 as well.  I'm fairly
pragmatic about it. Most likely other people may also want it, so either
we add it or create a visible (Config.in.host) host package so it can be
used from post-image scripts.

For consistency I would prefer to add it to the compression options.


 >> (This has not been submitted so far I believe.)

 > I still need to do a few tests of it, and I shall submit it here by the
 > end of the week (so we can discuss it during the dev-days).

Great, thanks!

-- 
Bye, Peter Korsgaard
