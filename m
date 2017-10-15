From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Oct 2017 22:45:35 +0200
Subject: [Buildroot] [PATCH 1/4] fs/common.mk: support lz4 compression
In-Reply-To: <20171015130545.GB2918@scaer> (Yann E. MORIN's message of "Sun,
 15 Oct 2017 15:05:45 +0200")
References: <20171013191655.30427-1-peter@korsgaard.com>
 <20171014000503.615d7fa6@windsurf.lan> <20171014073234.GA2530@scaer>
 <87a80sye83.fsf@dell.be.48ers.dk> <20171015130545.GB2918@scaer>
Message-ID: <87shekw368.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> > Indeed. It does not make sense to get a compressedd ext2/3/4 (or
 >> > whatever other uncompressed filesystem). That is semantically useless.
 >> 
 >> I agree that we would most likely not introduce such options today, but
 >> they have been supported for a very long time. I have personally used
 >> the .gz option to save archival disk space for buildbot, so they are not
 >> completely useless ;)

 > But since the filesystem infra does not get rid of the uncompresed
 > image, surely you have a post-image (or post-buildroot) script that gets
 > rid of the uncompressed stuff, don't you? In which case that archival
 > script could very well be the one doing the compresion...

Correct. This was just a (poor) example where I personally have used the
option.


 > And Buildroot should not be concerned about the archiving requirements
 > of the users: there will be almost as many such archiving requirements
 > as there are users.

 >> It is not completely semantically useless as it can be used for
 >> old-style initrds (but yeah, using an initramfs makes more sense).

 > The external initrd is what I was talking about below, yes.

Ok. Keep in mind that there's 3 variants:

- Initramfs built into the kernel
- External initramfs (separate cpio archive)
- External initrd (filesystem image, E.G. extN)


 >> You are missing the external initramfs usecase (E.G. not built into the
 >> kernel) - How just about all PC distributions boot. This usecase
 >> probably doesn't make much sense for Buildroot, but such a setup does
 >> make sense when you use a dm-verity / dm-crypt rootfs and need to mount
 >> it in the initramfs.
 >> 
 >> For thes use cases, the compression options IMHO makes sense.

 > Well, the compression is indeed only valid when using an initrd (cpio,
 > ext, whatev') or an external initramfs.

 > But again, I still think that it's better to offload that to an external
 > script.

Tradeoffs, a script is more flexible, but an option is more user friendly.


 >> In concept I agree, but you could use that logic on a lot of the things
 >> Buildroot does. We have supported these options for a very long time,
 >> and they imho add very little complexity, so I suggest we keep them for
 >> compatibility reasons.

 > Well, we historically had support for the toolchain on the target as
 > well, but we did eventually get rid of it! ;-)

The reason why we got rid of it was that it was hard to test, nontrivial
to maintain and against the philosophy of Buildroot (cross compilation).

I don't think those things really applies here. Sure, it could be done
by a script, but so could E.G. the root password option, remount rw,
purge locales, ..


 >> Regarding the question of if we should add lz4 as well.  I'm fairly
 >> pragmatic about it. Most likely other people may also want it, so either
 >> we add it or create a visible (Config.in.host) host package so it can be
 >> used from post-image scripts.
 >> 
 >> For consistency I would prefer to add it to the compression options.

 > Note: I am not arguing against adding lz4. I'm arguing against keeping
 > the compresion options altogether. Slight difference.

I understand that.


 > What I find cumbersome to maintain is the duplication of compression
 > lists in each filesystem types.

I agree that it isn't very nice, but we only rarely add new filesystem
types or compression algorithms (and if we do, the patches are trivial
as this lz4 series).


 > Maybe a middle ground would be to remove all the compression options,
 > and move them to the top-level filesystem menu, something like:

 >     Image compression:
 >       (X) none
 >       ( ) gzip
 >       ( ) bzip2
 >       ( ) xz
 >       ( ) lzo
 >       ( ) lz4
 >       ( ) lzp

 > With this help text:

 >     For filesystems that inherently do not support compression
 >     (e.g. ext2, cpio, tarball...), compress them with this
 >     compresion algorithm (using the default compression level)

 >     Filesystem that already support internal compression (e.g.
 >     squashfs, cramfs...) are not impacted by this option.

Hmm, I don't really like this. It still breaks the build for existing
users, and it doesn't really simplify anything in our infrastructure
(except for a few Config.in entries).

-- 
Bye, Peter Korsgaard
