From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 28 Feb 2012 22:18:58 +0000 (UTC)
Subject: [Buildroot] Where does post-build script belong?
References: <jhub5r$smv$1@dough.gmane.org>
 <4F435977.1060001@lucaceresoli.net> <ji0b7n$2hl$1@dough.gmane.org>
 <201202282038.54757.arnout@mind.be> <jijfkp$qv0$1@dough.gmane.org>
 <4F4D4751.1030906@gmail.com> <jijhcf$a6d$1@dough.gmane.org>
 <4F4D4FE4.3020506@gmail.com>
Message-ID: <jijjsi$tuq$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-02-28, Steve Calfee <stevecalfee@gmail.com> wrote:

>>>>>> Where under board/mycompany/myproduct do you put "extra" files that
>>>>>> will be added to the standard skeleton?

>>>>> I put it in board/mycompany/myproduct/skeleton.  Although
>>>>> rootfs-additions would be a better name than skeleton.

>>>> Ah, perhaps I've misunderstood what a custom skeleton was for the past
>>>> several years.  I thought it was the basis for the filesystem.  Is the
>>>> custom skeleton something that's _added_ on top of the default
>>>> skeleton rather than used in place of it?
>>>>
>>> Perhaps, but it is your script. If you want to completely replace the
>>> existing skeleton you can, but I think it makes more sense to just
>>> overlay new stuff on top of the default skeleton.

>> I seem to be completely lost.  Is board/mycompany/myproduct/skeleton
>> above a post-build script or a custom skelecton (something you set
>> BR2_ROOTFS_SKELETON_CUSTOM_PATH to point to)?

> I was not aware of that config option. In fact there are no uses of it 
> in the current /board... stuff.

It's in the config file from buildroot-2011.05, and the docs still
talk about it:
 
  http://buildroot.uclibc.org/downloads/buildroot.html#custom_targetfs

What I may have misunderstood is whether that custom skeleton replaces
the default skeleton or is copied on top of it.  My reading of the doc
is that it replaces the default skeleton, and that wasn't what I
wanted, so I used the customize package.  I have since switched to
using a post-build script that copies my "extras" tree onto the
default skeleton present in output/target.
  
> What I and what I think others have done is create my own
> mini-skeleton in the board.... directory. I can then stick in
> scripts, /etc/ files and maybe even externally built binaries into
> /usr/bin/ in my local area. Then when the post build script is 
> executed I just copy all the files from my skeleton to the target 
> skeleton.

Yep.  That's what I was doing via the customize package and what I'm
now doing now a post-build script.

> This will overlay the default stuff (that are duplicates in my area)
> and add any new stuff. After the post-build script the target
> skeleton will get all packaged up as a rootfs for your target system.
>
> Someone else will have to describe what that option is for.

The doc says one of the options for customizing the filesystem is

 * Create your own target skeleton. You can start with the default
   skeleton available under fs/skeleton and then customize it to suit
   your needs. The BR2_ROOTFS_SKELETON_CUSTOM and
   BR2_ROOTFS_SKELETON_CUSTOM_PATH will allow you to specify the
   location of your custom skeleton. At build time, the contents of
   the skeleton are copied to output/target before any package
   installation.

I read that as meaning buildroot will use my own customized target
skeleton instead of the default one.  Previously in the thread when
people mentioned custom skeletons, I thought that option was what they
were talking about.

This is all academic at this point, since a post-build script appears
to be the recommeded method and is how I'm doing things now.


-- 
Grant Edwards               grant.b.edwards        Yow! The PILLSBURY DOUGHBOY
                                  at               is CRYING for an END to
                              gmail.com            BURT REYNOLDS movies!!
