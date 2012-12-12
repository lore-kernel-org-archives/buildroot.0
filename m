From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Dec 2012 12:03:41 +0100
Subject: [Buildroot] buildroot 2012.11 large file support
In-Reply-To: <20121212120159.4292d70b@skate>
References: <NDBBKLDECLOIHFJKBINACEFAFPAA.Berns@BEKA-Elektronik.de>
 <CAKvQZ_0BrzUShzUyvM50CVabtw5BUM=1CupzD0-R1mfBuc3Adg@mail.gmail.com>
 <87d2yhsoh8.fsf@dell.be.48ers.dk>
 <CAKvQZ_1KXZcriA+RTjaz1=15UEUahu=Qvq5ovA7GeVvwDyxmVw@mail.gmail.com>
 <878v95skvm.fsf@dell.be.48ers.dk>
 <CAKvQZ_2MzciYPnYw0rCv_pzhHTzOS+vn=sry7nubtHd+sha3cw@mail.gmail.com>
 <CAKvQZ_3sog-JnwOYiJWE6a8eCk-LcjSZ-txr0Z_AHTiC8NnRgw@mail.gmail.com>
 <20121211171008.3b869509@skate> <50C7D14F.4060304@mind.be>
 <20121212111628.5d1e9dba@skate> <20121212120159.4292d70b@skate>
Message-ID: <20121212120341.69a89e93@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Wed, 12 Dec 2012 12:01:59 +0100, Thomas Petazzoni wrote:
> 
> On Wed, 12 Dec 2012 11:16:28 +0100, Thomas Petazzoni wrote:
> 
> > I haven't looked into them for now.
> 
> Ok, a quick investigation shows that crtstuff.c includes auto-host.h,
> which contains _FILE_OFFSET_BITS. crtstuff.c is built for the target,
> and therefore should normally not include auto-host.h, as noted by the
> following comment:
> 
> ==
> /* FIXME: Including auto-host is incorrect, but until we have
>    identified the set of defines that need to go into auto-target.h,
>    this will have to do.  */
> #include "auto-host.h"
> ==

(sorry for not finishing the e-mail)

And this is causing problems for cross-compilation. For example:
http://www.archivum.info/gcc-patches at gcc.gnu.org/2005-11/00293/Patch-to-crtstuff.c-to-undefine-some-macros-after-auto-host.h.html.

According to http://gcc.gnu.org/bugzilla/show_bug.cgi?id=21481 it is
quite clear that crtstuff.c should not include auto-host.h, but
apparently, it is not that simple.

Thing that remains not understood is what change between 4.5 and 4.6
broke this.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
