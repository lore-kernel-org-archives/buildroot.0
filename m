From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Tue, 21 Jan 2014 09:44:51 +0100 (CET)
Subject: [Buildroot] [PATCH] prevent recursion in %_defconfig rules
In-Reply-To: <20140120235847.GA10408@free.fr>
Message-ID: <1761803788.4552868.1390293891943.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> > 
> > There is no specific setup, I used my current buildroot directory
> > and run:
> > 
> > make O=.. BR2_EXTERNAL=.. raspberrypi_defconfig
> > make: stat:
> > /home/naourr/git/buildroot/configs/../configs/../configs/..
> > [snip]
> > ../configs/raspberrypi_defconfig ?. Stop
> > 
> > Or
> > 
> > make O=../output BR2_EXTERNAL=.. raspberrypi_defconfig
> > make: stat:
> > /home/naourr/git/buildroot/configs/../configs/../configs/..
> > [snip]
> > ../configs/raspberrypi_defconfig ?. Stop
> 
> OK, we have a way to reproduce it, now. We can investigate. Good! :-)
>  

Awesome, do you still need me to run your script or are your fine ?

as a side note, i'm boucman on IRC, i'll try to ping you if I see you
around...

> > But it's ok with :
> > 
> > make O=../output BR2_EXTERNAL=../external raspberrypi_defconfig
> >  GEN
> > ../output/Makefile
> > #
> > # configuration written to ../output/.config
> > #
> > 
> > I have no solution currently, but I hope this help...
> > 
> > Yann, what's wrong with relative path for BR2_EXTERNAL or O ?
> 
> Because they do not work as you would expect. If you pass relative
> paths, they are interpreted relative to the buildroot directory.
> 

that was indeed my understanding, I am trying to have the layout at 

https://github.com/Openwide-Ingenierie/raspaudio

that is:

* Having a buildroot/ subdirectory at the root of the project
* Having a Makefile in the root of the project that correctly 
  allows to build the project
* Having BR2_EXTERNAL be the root of the project (and as much 
  as possible, all config files in the root of the project)
* Having an output/ subdirectory in the root of the project 
  with all build files
* Having everything relocatable (since I want to save it to git, I 
  can't have absolute paths)

That is currently not possible and maybe it's a bad idea, but this 
layout seems to make sense to me and the relative path requirement
makes sense too, since it's needed for other people to use my project


> In your first two cases, you would expect it would work, but not in
> the
> following case:
> 
>     make -C buildroot O=build BR2_EXTERNAL=br2.external foo_defconfig
> 
> In this case, you'd expect O and BR2_EXTERNAL to be relative to the
> current working directory. But hey are not. They are interpreted
> relative to the Buildroot dir. Bummer, that's not what you expect.
> 

actually, I did expect that not to work. I did look at everything I
could in the usermanual :P

Though I agree that it would be more sensible to have 0= and 
BR2_EXTERNAL be relative to cwd...

> So, you should only pass absolute paths to O and BR2_EXTERNAL (IMHO).
> 

see my use-case above... I need to commit the makefile to git, so no
absolute path for me...


> And ditto for O, although nothing is psecified about using relative
> paths. :-(
> 

yes, this needs to be added, i'll add a note.

note that the makefile generated in the O= directory has an absolute 
path to the buildroot directory, not a relative one, which breaks
my use case

> Now, I don't know why it fails as thus in your case... But it's late
> here. More on this tomorrow. If someone has a good idea about it...
> ;-)
> 
> But the bottom line is: relative paths are a plague! ;-]
> 

i'd call them a necessary evil, but I see your point

> Anyway, I'm all for fixing this problem you see, but the proposed
> patch
> broke another legitimate use-case. So we have to find a better fix,
> if
> possible.


fair enough. I have some clues at what's going on (the biggest one
being that the previous patch did fix my issue) but as I said I am
at the limit of my make-fu...

> 
> I for one would prefer we just forbid relative paths altogether, but
> I'm
> totaly open on keeping them, as long as:
>   - we document it's very picky, and
>   - we check for special cases such as the one mentioned above.
> 

as stated above, I need relative path for my use-case. If absolute
paths are required, we need to find a way to properly save in git a
buildroot-based project. I am not sure how to do that but i'm opened
to suggestions...

> Regards,
> Yann E. MORIN.
> 
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> |  conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
> |               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/
> |  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
> |   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
>
