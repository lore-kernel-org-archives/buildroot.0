From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Wed, 22 Jan 2014 15:16:12 +0100 (CET)
Subject: [Buildroot] [PATCH] prevent recursion in %_defconfig rules
In-Reply-To: <20140121183820.GB3455@free.fr>
Message-ID: <686484103.4612359.1390400172918.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> > 
> > * Having a buildroot/ subdirectory at the root of the project
> > * Having a Makefile in the root of the project that correctly
> >   allows to build the project
> > * Having BR2_EXTERNAL be the root of the project (and as much
> >   as possible, all config files in the root of the project)
> > * Having an output/ subdirectory in the root of the project
> >   with all build files
> > * Having everything relocatable (since I want to save it to git, I
> >   can't have absolute paths)
> > 
> > That is currently not possible and maybe it's a bad idea, but this
> > layout seems to make sense to me and the relative path requirement
> > makes sense too, since it's needed for other people to use my
> > project
> 
> But your Makefile already does not use relative paths:
>     MAKEARGS := -C $(CURDIR)/buildroot
>     MAKEARGS += O=$(CURDIR)/output
>     MAKEARGS += BR2_EXTERNAL=$(CURDIR)
> 
> which is IMHO the way to go.
> 

ok, good. i'll stay with that approch (that doesn't use the br
generated makefile nor the .br-external file) for my project


> [--SNIP--]
> > Though I agree that it would be more sensible to have 0= and
> > BR2_EXTERNAL be relative to cwd...
> 
> But since we may call 'make -C /bla/bla', CWD is lost long before we
> even get to the point our Makefile is parsed.
> 

indeed. so no CWD, then. makes sense

<snip>


> 
> Well, just look at your repository! ;-)
> Unles I missed something obvious, that is... :-)
> 

yes, indeed. I didn't realize that it was working for me :)

BR2_EXTERNAL does indeed do what I want now. I'll move foward
with the next step in my proof of concept project: relocating
the various .config files

but that's a story for another day :)


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
