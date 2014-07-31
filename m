From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Jul 2014 23:37:25 +0200
Subject: [Buildroot] [PATCH v2] Add option to copy config file to rootfs
In-Reply-To: <f9f901d7-df20-4a8e-9ef2-d0e7a7b0edcd@email.android.com>
References: <1406820398-2105-1-git-send-email-nroach44@gmail.com>
 <20140731171632.GC3960@free.fr>
 <14321197-e8a0-43d3-9bcf-2f3d53e60753@email.android.com>
 <20140731201741.7873aee9@free-electrons.com>
 <f9f901d7-df20-4a8e-9ef2-d0e7a7b0edcd@email.android.com>
Message-ID: <20140731213725.GO3960@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas?, All,

On 2014-07-31 20:40 +0200, Thomas De Schampheleire spake thusly:
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> schreef:
> >Dear Thomas De Schampheleire,
> >
> >On Thu, 31 Jul 2014 19:55:21 +0200, Thomas De Schampheleire wrote:
> >
> >> >I think the case where one would want this file in the generated
> >> >filesystem is a corner case, and that it would be better served with
> >> >a post-build script.
> >> 
> >> I think this is a feature that deserves to be in Buildroot 
> >> directly.  Just like rootfs-overlay used to be
> >>  something that people had to do manually from their
> >> post build script, but later became a supported
> >>  feature because many people found it useful, or the
> >>  feature to set the root password, this is something that is
> >> generally useful by many users, even those that don't fully know how
> >> to use the post build script to it's full ability, or did not yet
> >> realize the usefulness of the saving of the configuration.

<sarcastic>
Great! Let's include in Buildroot all the cruft that a post-build script
can do.
</sarcastic>

Sorry for the rant, really, but we introduced post-build scripts for a
reason: so that users can further customise their rootfs with whatever
they want to put/remove/tweak in there, without polluting Buildroot with
border-line behaviours.

And the root password, since you're speaking about it, is part of the
behaviour of the target system. The .config is just sitting there, and
serves no purpose in the running of the target system.

(crosstool-NG: everyone can make mistakes in their infancy! ;-) )

> >I don't really have a strong opinion on whether we should have this
> >feature or not, but what bothers me is adding yet another global config
> >option just for a small thing like that.
> >
> >If we were to include the .config file in the rootfs, could we do it
> >unconditionally? Or would the .config file size be problematic?
> 
> Not do much the size, but as specified in the help text
>  the potential root password will be readable too. So if
>  you get a hand on the rootfs image, you can
>  determine the password very easily, which is
>  probably not acceptable by all.

That, plus the fact the .config will also contain info from the packages
in br2-external, too, which might be a bit sensitive, and a definitive
no-no for production images.

And I still believe this is more of a convenience option for internal
use, or for development reasons. Production images will most probably
never ever have this file in them (no more would they have
/proc/config.gz either.)

So:
  1. _I_ still _think_ this should be handled in a post-build script;
  2. if we were to ever have this, this should *not* be unconditional;
  3. it should default to 'n';
  4. I will never ack this. :-p

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
