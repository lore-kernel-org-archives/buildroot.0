From: David De Grave <david.degrave@mind.be>
Date: Mon, 10 Sep 2018 15:00:01 +0200
Subject: [Buildroot] [PATCH 1/3] package/Makefile.in: Use '-isystem'
 instead of '-I' in HOST_CFLAGS globally
In-Reply-To: <5eeda9cf-ba1a-a83b-6413-d3e43f87dfff@mind.be>
References: <20180831142024.27548-1-david.degrave@mind.be>
 <20180909153221.6b803c9f@windsurf.home>
 <5eeda9cf-ba1a-a83b-6413-d3e43f87dfff@mind.be>
Message-ID: <CAD6XyYx9Uy4-Jpu9q7PYmmaYj-PFk44uFx9HAK_3xNomZwhTiw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, Arnout,

On Mon, Sep 10, 2018 at 11:51 AM, Arnout Vandecappelle <arnout@mind.be>
wrote:


> > Could you give a few more details about the motivation for this change.
> > Is it just because it is "cleaner" to refer to Buildroot
> > $(HOST_DIR)/include using -isystem, or does this fix some actual
> > problem/build issue ?
>

More than making things cleaner/logic, it fixes a build issue I've with the
beagle bone
black's Linux kernel: https://github.com/beagleboard/linux.git

They implemented a driver who handle DTBs overlays and what they call
"capes"
(PCB extensions to the bbb mother board). Since the update of the DTC
package few
weeks ago, my build is throwing compilation errors in linux when it starts
to compile
their own version of the dtc. Due to the way they include their headers,
some of them
were taken from the host while some others are taken from local dir.
Moreover, their
dtc version use different names in their defines (a missing underscore) and
this why
at a certain point, it throws a "function redefinition error". Maybe other
kernels are
suffering from the same problem, I don't know...

I first fixed the issue by adding a patch to my project to change the
involved sources
in the Kernel tree...

But then I thought that other people may suffers from this problem too and
decided to
make it more generic by patching buildroot itself, so that I could save
them few hours
of investigations. This is why I submitted my first patch who applied the
same kind of
change in the linux.mk file.

Then, I discussed this with Arnout and we thought it would be even more
benefit to
make it global as it's already a requirement for uboot and now linux too.
Moreover it
sounds more logic/cleaner to make it that way, but that was not the main
idea.

So, that's why I submitted this patch series.

> Doing such a change is pretty invasive, it could potentially cause
> > some build failures, so I'd like to understand the motivation.
>

I understand, no problem :-)

Regards,
David.

-- 

*David De Grave*
Senior Embedded Software Developer
Gsm : +32(0)496.364.960 | Tel : +32-16-28.65.00 | Fax : +32-16-28a.65.01
Essensium-Mind <https://www.mind.be/> - Gaston Geenslaan 9, B-3001 Leuven,
Belgium
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180910/1fdc15a7/attachment.html>
