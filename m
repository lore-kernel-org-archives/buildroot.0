From: Carlos Santos <casantos@datacom.com.br>
Date: Wed, 6 Jun 2018 09:46:17 -0300 (BRT)
Subject: [Buildroot] [PATCH] fs: allow extra arguments to common tarball
 extraction
In-Reply-To: <20180605172345.GB29058@scaer>
References: <20180603022145.14222-1-casantos@datacom.com.br>
 <20180605172345.GB29058@scaer>
Message-ID: <625048322.1426556.1528289177741.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Yann Morin" <yann.morin.1998@free.fr>
> To: "DATACOM" <casantos@datacom.com.br>
> Cc: "buildroot" <buildroot@buildroot.org>, "Thomas De Schampheleire" <thomas.de_schampheleire@nokia.com>
> Sent: Tuesday, June 5, 2018 2:23:45 PM
> Subject: Re: [Buildroot] [PATCH] fs: allow extra arguments to common tarball extraction

> Carlos, All,
> 
> On 2018-06-02 23:21 -0300, Carlos Santos spake thusly:
>> Since commit 118534fe54b (fs: use a common tarball as base for the other
>> filesystems) Buildroot creates a .tar filesystem image and re-extracts
>> it in a private directory to create each format-specific image. Add an
>> option to pass extra arguments to tar when that commom root image is
>> extracted.
>> 
>> This option is useful when the root filesystem is volatile (e.g. initrd)
>> or read-only but a read-write subtree is still necessary for persistent
>> data modified by programs as they run.
>> 
>> For example, one can pass "--exclude='./var/lib/*'" to exclude that path
>> from the rootfs image and use a post-fakeroot script to make a separate
>> filesystem image for /var/lib.
> 
> Well, I am not too fond of this extra option. But see below...
> 
>> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
>> ---
>> Additional explanation
>> 
>> This change solves a real-life problem of my current project. Before
>> buildroot 2018.05 I had to use a trickier approach:
>> 
>> 1. Add a post-fakeroot script to
>>    1.1. Create a filesystem image (ext4) from $(TARGET_DIR)/var/lib.
>>    1.2. Move $(TARGET_DIR)/var/lib to a backup path under $(BUILD_DIR).
>>    1.3. Create an empty $(TARGET_DIR)/var/lib.
>> 2. Add a post-image script to
>>    2.1. Copy the rootfs and /var/lib images to the disk image.
>>    2.2. Remove the empty $(TARGET_DIR)/var/lib.
>>    2.3. Restore $(TARGET_DIR)/var/lib from the backup path.
>> 
>> That solution is fragile: if something goes wrong during the execution
>> of the post-image script it can lead to a cripled $(TARGET_DIR) with an
>> empty var/lib subdir. Rebuilding a package without restoring the backup
>> can easily cause a kaboom and force me to run a lengthy clean build.
> 
> What prevents you from providing your own filesystem mechanism at all?

I'm already doing this with the post-fakeroot and post-image scripts.

> Since you have post-scripts, it means you do have an existing tree
> where they are stored (even probably a git trre, at that).
> 
> So you could use that location as a br2-external, if that's not what
> you already do. And then, you can add a new filesystem type in that
> br2-external tree.
> 
> Jsut make your filesystem depend on rootfs-tar, then you can basically
> do something like:
> 
>    $ cat my-mkfs-tool
>    #!/bin/sh
>    if [ $(id -u) -ne 0 ]; then
>        exec fakeroot "${0}" "${@}"
>    fi
> 
>    mktempdir && cd tempdir # You get the idea
>    tar xf $(IMAGES_DIR)/rootfs.tar
>    do-soemthing
> 
> And then you have a mechanism that cleanly and reliably fits in
> Buildroot's filesystem infra.
> 
> I don't think the overhead would be big, since you anyway already have
> to have some scripts doing the separation properly, so making those into
> a filesystem is probably not too much, I guess.
> 
> For a (basic) example, see slide 16 (shameless self-reference):
>    https://elinux.org/images/8/8e/2017-10-24_-_ELCE-Buildroot.pdf
> 
> (note: the macro to call has changed in master since that presentation,
> but you get the idea.)

The inner-rootfs macro does not seem to be generic enough but I can
give it a try. Notice, however, that it is an internal thing, like
the common tarball. The BR2_ROOTFS_COMMON_UNTAR_ARGS confing, OTOH,
would be documented. If the corresponding infrastructure changes in
the future we can move it to Config.in.legacy, preventing the user
from using an unsupported feature.

> In the end, I believe this is more robust and more generic than this
> extra option to the intermediate tarball, which is purely an internal
> detail. We may tomorrow decide on another solution for the internal
> state in the future...
> 
> My 2 cents...
> 
> Regards,
> Yann E. MORIN.

[...]

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
