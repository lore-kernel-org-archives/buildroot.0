From: Patrick Doyle <wpdster@gmail.com>
Date: Fri, 22 Apr 2016 09:35:41 -0400
Subject: [Buildroot] rootfs overlay best practices
In-Reply-To: <57194FA7.3020803@mind.be>
References: <CAF_dkJDPv-Z6AW8u-AsTukovBhMNLR0q-1326qOxi7RfFtBL7A@mail.gmail.com>
 <57194FA7.3020803@mind.be>
Message-ID: <CAF_dkJAfQO7gxXCb-svzqt+e0UMOSemvbuG9L19XwPdw5pu2WQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,
Thank you for your reply.

On Thu, Apr 21, 2016 at 6:09 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 04/21/16 16:24, Patrick Doyle wrote:
>>
>> Rather than invent my own, I thought I would query the list first.
>>
>
>  The usual approach is an overlayfs. Given the subject of this mail, I
> thought you'd already know about it :-)
I am aware of it, but have never set one up, and hence my questions.

> It's been upstream since 3.10 [1].
> You basically mount a layered filesystem, specifying the lower layer (= your
> initramfs) and an upper layer (= the writable overlay). Any file you write
> will be written to the upper layer, the lower layer stays unaffected. You
> can also delete files etc. as you like.
Yes.  That is exactly what I want.  What I didn't know was how to set
that up for my entire rootfs, or if it was reasonable, or even
possible to set it up for my rootfs.

>  Unfortunately, using this is a rootfs is not so trivial, because you can't
> use it as the boot-time rootfs.
Yes.  That's what I just learned when I tried:

# mount -t overlay overlay
-olowerdir=/,upperdir=/storage,workdir=/storage/work /
overlayfs: workdir and upperdir must be separate subtrees
mount: mounting overlay on / failed: Invalid argument

and

# mount -t overlay overlay -olowerdir=/,upperdir=/storage,workdir=/work /
overlayfs: workdir and upperdir must reside under the same mount
mount: mounting overlay on / failed: Invalid argument


> So you have to make an init script that
> builds the overlay and then pivot_roots it. Or limit it to a subdirectory
> (e.g. /etc). Or symlink the important bits into the overlayfs mountpoint.
Yes -- that was the intent of my email -- how do folks handle this
situation in the real word?  Which approach do you use?  Which works
the best for you? (And by "you", I mean "buildroot community", not
specifically "Arnout")

>  As an alternative to overlayfs, you can also use unionfs-fuse. It's a
> userspace (FUSE) implementation of the same concept. Useful for older
> kernels.
Thanks.  That's good to know, but I'm using a 4.1 kernel, so I think
that overlayfs would be the preferred way to go here, wouldn't it?

>  Generally, I prefer your second approach: symlinking the relevant
> files/directories to a config partition, because that gives you tight
> control about what is writable. You can combine that with a script that
> formats the writable partition if it doesn't exist and prepopulates it with
> the initramfs version of the config partition. The only problem there is
> when you do an update of the initramfs and it has a new config entry which
> doesn't exist yet in the writable partition.
OK, thanks.

--wpd
