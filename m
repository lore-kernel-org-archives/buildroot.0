From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Oct 2017 09:32:34 +0200
Subject: [Buildroot] [PATCH 1/4] fs/common.mk: support lz4 compression
In-Reply-To: <20171014000503.615d7fa6@windsurf.lan>
References: <20171013191655.30427-1-peter@korsgaard.com>
 <20171014000503.615d7fa6@windsurf.lan>
Message-ID: <20171014073234.GA2530@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Thomas, All,

On 2017-10-14 00:05 +0200, Thomas Petazzoni spake thusly:
> On Fri, 13 Oct 2017 21:16:52 +0200, Peter Korsgaard wrote:
> > Similar to the other compressors.  Notice that we use the -l (legacy format)
> > for Linux kernel initrd compatibility.
> > 
> > Lz4 decompression is supported by the Linux kernel since 3.11.
> > 
> > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> 
> I don't know in which direction we want to go, but Yann has a series
> doing cleanups/improvements in the filesystem stuff,

I already pointed Peter to this on-going work 10 days ago, while
discussing on IRC, and he said "ahh, nice!"  ;-)

> and as part of
> this, he is dropping the compression options:
> 
>   https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/fs-2

Indeed. It does not make sense to get a compressedd ext2/3/4 (or
whatever other uncompressed filesystem). That is semantically useless.

One may argue that for very big images, there might not be enough place
to store it, but the image is first generated uncomoressed anyway, so we
need at least that much space to start with. Compressing the image will
not help for big images sanyway.

If one still needs to compress the image (e.g. to send to Q/A), then it
is still possible to do it in a post-iamge script, which is even more
versatile (it can sign and/or encrypt as well, for example).

The cpio case is a bit different, but nonetheless the outcome is the
same: we don't need to compress it.

When used as an initramfs, the kernel will compress it anyway, so that
would be a double compression; bad. When used as an initrd with the
iso9660 filesystem, it is it that should compress it.

The only questionable case that remains is the cpio as used as a pure
initrd. Does that still exist? And for that single use-case, I would
still suggest a post-image script, because I don't see the point of
having support in the infra for compression, when only a single image
uses it. OR at the very least, that compressing cpio is entirely moved
to the cpio fs.

> (This has not been submitted so far I believe.)

I still need to do a few tests of it, and I shall submit it here by the
end of the week (so we can discuss it during the dev-days).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
