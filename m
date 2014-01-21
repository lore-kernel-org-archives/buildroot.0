From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Jan 2014 19:38:20 +0100
Subject: [Buildroot] [PATCH] prevent recursion in %_defconfig rules
In-Reply-To: <1761803788.4552868.1390293891943.JavaMail.root@openwide.fr>
References: <20140120235847.GA10408@free.fr>
 <1761803788.4552868.1390293891943.JavaMail.root@openwide.fr>
Message-ID: <20140121183820.GB3455@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?my, Romain, All,

On 2014-01-21 09:44 +0100, Jeremy Rosen spake thusly:
> > > make: stat:
> > > /home/naourr/git/buildroot/configs/../configs/../configs/..
> > > [snip]
> > > ../configs/raspberrypi_defconfig ?. Stop
> > OK, we have a way to reproduce it, now. We can investigate. Good! :-)
> Awesome, do you still need me to run your script or are your fine ?

Of course not, now we now how to reproduce the error.

> > > Yann, what's wrong with relative path for BR2_EXTERNAL or O ?
> > Because they do not work as you would expect. If you pass relative
> > paths, they are interpreted relative to the buildroot directory.
> that was indeed my understanding, I am trying to have the layout at 
> 
> https://github.com/Openwide-Ingenierie/raspaudio

He, nice! :-)

> that is:
> 
> * Having a buildroot/ subdirectory at the root of the project
> * Having a Makefile in the root of the project that correctly 
>   allows to build the project
> * Having BR2_EXTERNAL be the root of the project (and as much 
>   as possible, all config files in the root of the project)
> * Having an output/ subdirectory in the root of the project 
>   with all build files
> * Having everything relocatable (since I want to save it to git, I 
>   can't have absolute paths)
> 
> That is currently not possible and maybe it's a bad idea, but this 
> layout seems to make sense to me and the relative path requirement
> makes sense too, since it's needed for other people to use my project

But your Makefile already does not use relative paths:
    MAKEARGS := -C $(CURDIR)/buildroot
    MAKEARGS += O=$(CURDIR)/output
    MAKEARGS += BR2_EXTERNAL=$(CURDIR)

which is IMHO the way to go.

[--SNIP--]
> Though I agree that it would be more sensible to have 0= and 
> BR2_EXTERNAL be relative to cwd...

But since we may call 'make -C /bla/bla', CWD is lost long before we
even get to the point our Makefile is parsed.

> > So, you should only pass absolute paths to O and BR2_EXTERNAL (IMHO).
> see my use-case above... I need to commit the makefile to git, so no
> absolute path for me...

See my answer above: you already use absolute paths, but with a
variable. Which commits just fine, and is fully relocatable at
check-out.

> > And ditto for O, although nothing is psecified about using relative
> > paths. :-(
> yes, this needs to be added, i'll add a note.

Thanks.

> note that the makefile generated in the O= directory has an absolute 
> path to the buildroot directory, not a relative one, which breaks
> my use case

Indeed. But I don;t see why you need to be relocatable once you called
one of the *config targets. Relocation at check-out time is perfectly
understandable, yes, and already works with your repository.

> > I for one would prefer we just forbid relative paths altogether, but
> > I'm
> > totaly open on keeping them, as long as:
> >   - we document it's very picky, and
> >   - we check for special cases such as the one mentioned above.
> > 
> 
> as stated above, I need relative path for my use-case. If absolute
> paths are required, we need to find a way to properly save in git a
> buildroot-based project. I am not sure how to do that but i'm opened
> to suggestions...

Well, just look at your repository! ;-)
Unles I missed something obvious, that is... :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
