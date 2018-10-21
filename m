From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Oct 2018 16:18:22 +0200
Subject: [Buildroot] [PATCH 1/3] package/Makefile.in: Use '-isystem'
 instead of '-I' in HOST_CFLAGS globally
In-Reply-To: <CAD6XyYx9Uy4-Jpu9q7PYmmaYj-PFk44uFx9HAK_3xNomZwhTiw@mail.gmail.com>
References: <20180831142024.27548-1-david.degrave@mind.be>
 <20180909153221.6b803c9f@windsurf.home>
 <5eeda9cf-ba1a-a83b-6413-d3e43f87dfff@mind.be>
 <CAD6XyYx9Uy4-Jpu9q7PYmmaYj-PFk44uFx9HAK_3xNomZwhTiw@mail.gmail.com>
Message-ID: <20181021141822.GB23085@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David, All,

On 2018-09-10 15:00 +0200, David De Grave spake thusly:
> Hello Thomas, Arnout,
> On Mon, Sep 10, 2018 at 11:51 AM, Arnout Vandecappelle < [1]arnout@mind.be> wrote:
> ?
> 
>   > Could you give a few more details about the motivation for this change.
>   > Is it just because it is "cleaner" to refer to Buildroot
>   > $(HOST_DIR)/include using -isystem, or does this fix some actual
>   > problem/build issue ?
> 
> More than making things cleaner/logic, it fixes a build issue I've with the beagle bone
> black's Linux kernel: [2]https://github.com/beagleboard/linux.git
> They implemented a driver who handle DTBs overlays and what they call "capes"
> (PCB extensions to the bbb mother board). Since the update of the DTC package few
> weeks ago, my build is throwing compilation errors in linux when it starts to compile
> their own version of the dtc. Due to the way they include their headers, some of them
> were taken from the host while some others are taken from local dir. Moreover, their
> dtc version use different names in their defines (a missing underscore) and this why
> at a certain point, it throws a "function redefinition error". Maybe other kernels are
> suffering from the same problem, I don't know...
> I first fixed the issue by adding a patch to my project to change the involved sources
> in the Kernel tree...
> But then I thought that other people may suffers from this problem too and decided to
> make it more generic by patching buildroot itself, so that I could save them few hours
> of investigations. This is why I submitted my first patch who applied the same kind of
> change in the [3]linux.mk file.
> Then, I discussed this with Arnout and we thought it would be even more benefit to
> make it global as it's already a requirement for uboot and now linux too. Moreover it
> sounds more logic/cleaner to make it that way, but that was not the main idea.
> So, that's why I submitted this patch series.

The -isystem has already been tried, and lately resurfaced in another
thread, in which it was noticed that it broke at least a few packages,
please see:

    http://lists.busybox.net/pipermail/buildroot/2018-October/232615.html

So, before we reinstate the use of -isystem, a few packages will have to
be fixed first.

Thanks!

Regards,
Yann E. MORIN.

>   > Doing such a change is pretty invasive, it could potentially cause
>   > some build failures, so I'd like to understand the motivation.
> 
> I understand, no problem :-)
> Regards,
> David.
> --
> 
> +--------------------------------------------------------------------------------------------------------+
> |        | David De Grave                                                                                |
> | ? | Senior Embedded Software Developer                                                            |
> |        | Gsm : +32(0)496.364.960 | Tel : +32-16-28.65.00?| Fax?:?+32-16-28a.65.01? |
> |        | [4]Essensium-Mind - Gaston Geenslaan 9, B-3001 Leuven, Belgium                                |
> +--------------------------------------------------------------------------------------------------------+
> 
> Links:
> 1. mailto:arnout at mind.be
> 2. https://github.com/beagleboard/linux.git
> 3. http://linux.mk
> 4. https://www.mind.be/

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
