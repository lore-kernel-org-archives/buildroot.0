From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Oct 2017 15:05:45 +0200
Subject: [Buildroot] [PATCH 1/4] fs/common.mk: support lz4 compression
In-Reply-To: <87a80sye83.fsf@dell.be.48ers.dk>
References: <20171013191655.30427-1-peter@korsgaard.com>
 <20171014000503.615d7fa6@windsurf.lan>
 <20171014073234.GA2530@scaer> <87a80sye83.fsf@dell.be.48ers.dk>
Message-ID: <20171015130545.GB2918@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2017-10-15 11:03 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > Peter, Thomas, All,
>  > On 2017-10-14 00:05 +0200, Thomas Petazzoni spake thusly:
>  >> On Fri, 13 Oct 2017 21:16:52 +0200, Peter Korsgaard wrote:
>  >> > Similar to the other compressors.  Notice that we use the -l (legacy format)
>  >> > for Linux kernel initrd compatibility.
>  >> > 
>  >> > Lz4 decompression is supported by the Linux kernel since 3.11.
>  >> > 
>  >> > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[--SNIP--]
>  > Indeed. It does not make sense to get a compressedd ext2/3/4 (or
>  > whatever other uncompressed filesystem). That is semantically useless.
> 
> I agree that we would most likely not introduce such options today, but
> they have been supported for a very long time. I have personally used
> the .gz option to save archival disk space for buildbot, so they are not
> completely useless ;)

But since the filesystem infra does not get rid of the uncompresed
image, surely you have a post-image (or post-buildroot) script that gets
rid of the uncompressed stuff, don't you? In which case that archival
script could very well be the one doing the compresion...

And Buildroot should not be concerned about the archiving requirements
of the users: there will be almost as many such archiving requirements
as there are users.

> It is not completely semantically useless as it can be used for
> old-style initrds (but yeah, using an initramfs makes more sense).

The external initrd is what I was talking about below, yes.

>  > One may argue that for very big images, there might not be enough place
>  > to store it, but the image is first generated uncomoressed anyway, so we
>  > need at least that much space to start with. Compressing the image will
>  > not help for big images sanyway.
> 
> Except if you are archiving the output/images directory and want to
> limit long term disk space like explained above.

That should not be the responsibility of Buildroot. And if you want to
archive something, then you have much more to take care of than just the
images, so you'll anyway have to provide a post-image (or post-buildroot)
script anyway...

>  > If one still needs to compress the image (e.g. to send to Q/A), then it
>  > is still possible to do it in a post-iamge script, which is even more
>  > versatile (it can sign and/or encrypt as well, for example).
> Indeed.
> 
>  > The cpio case is a bit different, but nonetheless the outcome is the
>  > same: we don't need to compress it.
> 
>  > When used as an initramfs, the kernel will compress it anyway, so that
>  > would be a double compression; bad. When used as an initrd with the
>  > iso9660 filesystem, it is it that should compress it.
> 
> You are missing the external initramfs usecase (E.G. not built into the
> kernel) - How just about all PC distributions boot. This usecase
> probably doesn't make much sense for Buildroot, but such a setup does
> make sense when you use a dm-verity / dm-crypt rootfs and need to mount
> it in the initramfs.
> 
> For thes use cases, the compression options IMHO makes sense.

Well, the compression is indeed only valid when using an initrd (cpio,
ext, whatev') or an external initramfs.

But again, I still think that it's better to offload that to an external
script.

>  > The only questionable case that remains is the cpio as used as a pure
>  > initrd. Does that still exist?
> 
> Yes, that is similar to the initramfs-inside-kernel usecase, but here
> the compression options do make sense. There may be some usecases where
> it is interesting to keep the rootfs and kernel separately from each
> other.
> 
>  > And for that single use-case, I would still suggest a post-image
>  > script, because I don't see the point of having support in the infra
>  > for compression, when only a single image uses it. OR at the very
>  > least, that compressing cpio is entirely moved to the cpio fs.
> 
> In concept I agree, but you could use that logic on a lot of the things
> Buildroot does. We have supported these options for a very long time,
> and they imho add very little complexity, so I suggest we keep them for
> compatibility reasons.

Well, we historically had support for the toolchain on the target as
well, but we did eventually get rid of it! ;-)

> Regarding the question of if we should add lz4 as well.  I'm fairly
> pragmatic about it. Most likely other people may also want it, so either
> we add it or create a visible (Config.in.host) host package so it can be
> used from post-image scripts.
> 
> For consistency I would prefer to add it to the compression options.

Note: I am not arguing against adding lz4. I'm arguing against keeping
the compresion options altogether. Slight difference.

What I find cumbersome to maintain is the duplication of compression
lists in each filesystem types.

Maybe a middle ground would be to remove all the compression options,
and move them to the top-level filesystem menu, something like:

    Image compression:
      (X) none
      ( ) gzip
      ( ) bzip2
      ( ) xz
      ( ) lzo
      ( ) lz4
      ( ) lzp

With this help text:

    For filesystems that inherently do not support compression
    (e.g. ext2, cpio, tarball...), compress them with this
    compresion algorithm (using the default compression level)

    Filesystem that already support internal compression (e.g.
    squashfs, cramfs...) are not impacted by this option.

Note that we can *not* remove the uncompresed image, because it may
serve as input to another filesystem.

Regards,
Yann E. MORIN.

>  >> (This has not been submitted so far I believe.)
>  > I still need to do a few tests of it, and I shall submit it here by the
>  > end of the week (so we can discuss it during the dev-days).
> Great, thanks!

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
