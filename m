From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 22 Apr 2016 15:50:05 +0200
Subject: [Buildroot] rootfs overlay best practices
In-Reply-To: <CAF_dkJAfQO7gxXCb-svzqt+e0UMOSemvbuG9L19XwPdw5pu2WQ@mail.gmail.com>
References: <CAF_dkJDPv-Z6AW8u-AsTukovBhMNLR0q-1326qOxi7RfFtBL7A@mail.gmail.com>
 <57194FA7.3020803@mind.be>
 <CAF_dkJAfQO7gxXCb-svzqt+e0UMOSemvbuG9L19XwPdw5pu2WQ@mail.gmail.com>
Message-ID: <571A2C0D.6020206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/22/16 15:35, Patrick Doyle wrote:
> Hello Arnout,
> Thank you for your reply.
>
> On Thu, Apr 21, 2016 at 6:09 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 04/21/16 16:24, Patrick Doyle wrote:
[snip]
>>   Unfortunately, using this is a rootfs is not so trivial, because you can't
>> use it as the boot-time rootfs.
> Yes.  That's what I just learned when I tried:
>
> # mount -t overlay overlay
> -olowerdir=/,upperdir=/storage,workdir=/storage/work /
> overlayfs: workdir and upperdir must be separate subtrees
> mount: mounting overlay on / failed: Invalid argument
>
> and
>
> # mount -t overlay overlay -olowerdir=/,upperdir=/storage,workdir=/work /
> overlayfs: workdir and upperdir must reside under the same mount
> mount: mounting overlay on / failed: Invalid argument

  Googling (or duckducking) "overlayfs root" gives you plenty of explanations of 
how to do it properly.

  It would actually be nice if buildroot had an option in the filesystem menu to 
set up a rootfs overlay for you...


>> So you have to make an init script that
>> builds the overlay and then pivot_roots it. Or limit it to a subdirectory
>> (e.g. /etc). Or symlink the important bits into the overlayfs mountpoint.
> Yes -- that was the intent of my email -- how do folks handle this
> situation in the real word?  Which approach do you use?  Which works
> the best for you? (And by "you", I mean "buildroot community", not
> specifically "Arnout")

  Well, I work on many different project and it's different for each project 
:-). In one project, we started with unionfs-fuse but in the end switched to 
symlinking to a writable partition.

>
>>   As an alternative to overlayfs, you can also use unionfs-fuse. It's a
>> userspace (FUSE) implementation of the same concept. Useful for older
>> kernels.
> Thanks.  That's good to know, but I'm using a 4.1 kernel, so I think
> that overlayfs would be the preferred way to go here, wouldn't it?

  Yes, overlayfs has much better performance and I think it's also a bit more 
robust. unionfs-fuse can do a few things more IIRC, but probably nothing important.


  Regards,
  Arnout

[snip]

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
