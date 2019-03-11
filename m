From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 11 Mar 2019 12:59:17 +0100
Subject: [Buildroot] [PATCH 1/2] package/libfuse3: new package
In-Reply-To: <f1a7be8e-28f9-11e5-0a2a-2327a22f34cf@mind.be>
References: <20190306163054.5918-1-norbert.lange@andritz.com>
 <bfd874ad-06a2-9cf6-7783-d66979a953e0@mind.be>
 <CADYdroPJ7ahD1JH8ULH7fdPi-TejcWr8FAFJ++4Q_BUj1a7Lyw@mail.gmail.com>
 <f1a7be8e-28f9-11e5-0a2a-2327a22f34cf@mind.be>
Message-ID: <CADYdroOv=6=ZQeRL4QO6qoH1R9isnWKWwagiBvEbwh4Gy6KdUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mo., 11. M?rz 2019 um 09:46 Uhr schrieb Arnout Vandecappelle
<arnout@mind.be>:
>
>
>
> On 10/03/2019 20:32, Norbert Lange wrote:
> >>  Is there any reason not to use the normal install for target as well?
> > Yes, I would have to `rm` all unused files. This was not welcome some time ago,
>
>  TBH, we haven't decided (yet) if the best approach in general is to use
> standard install and then rm, or to use custom install commands. *Most*
> developers prefer to use the install + rm approach.
>
>  I'm surprised, though, that there would be anything to remove. Remember that
> anything in /usr/include, all man pages an all .a files in {/usr,}/lib are
> automatically removed. It is rare that something else gets installed *and* that
> it is not in fact needed on target.

for libfuse, there is for example an init script to load the correct
modules (not needed if those are kernel-static, I think with udev its
not needed too) and mount the fusectl
filesystem (i would rather have a line in fstab or inittab). IMHO its
a bad idea to add this by default, given that buildroot aims to be
minimal.

Just another thing that I consider now more important is that libfuse
right now will replace the common files from libfuse3 (staging
install),
the only sane thing for me would be to modify libfuse to stage-install
in a other/temporary directory and only copy over the files that are
unique to libfuse
(in the case the packages are co-installed).
ie. install (in the final location) + rm might affect other packages,
and thats not a theoretical thing with libfuse + libfuse3,
installing just the files you need is less likely to cause subtle
issues in the future (installing both is not the common case as well).
contrary if a file is missing, you will be fast to notice =)

Norbert
