From: Sascha Juch <Sascha.Juch@sepago.de>
Date: Mon, 21 Aug 2006 15:35:44 +0200
Subject: [Buildroot] buildroot Digest, Vol 2, Issue 17
Message-ID: <75FBAF4B06609F4BB994B92502E964EA6F611F@dc03.sepago.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Urspr?ngliche Nachricht-----
> Date: Fri, 18 Aug 2006 06:23:57 -0700
> From: "Brian C. Lane" <bcl@brianlane.com>
> Subject: Re: [Buildroot] Packages that error out during build
> To: buildroot at uclibc.org
> Message-ID: <44E5BF6D.2090508@brianlane.com>
> Content-Type: text/plain; charset=ISO-8859-1
> 
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Sascha Juch wrote:
> > Hello list members,
> > I have a problem in compiling X.org 6.8.2 with buildroot.
[...]
> > + install -c -m 0444 ZapfDingbats.pmf
> > + /home/sascha/svn/buildroot2/buildroot/build_i386/staging_dir/usr/X11R6
> > + /lib/X11/xserver/C/print/models/PSdefault/fonts
> > (mkfontscale -b -s -l
> > /home/sascha/svn/buildroot2/buildroot/build_i386/staging_dir/usr/X11R6/l
> > ib/X11/xserver/C/print/models/PSdefault/fonts)
> > mkfontscale [ -e encoding ] [ -f fuzz ] [ directory ]
> > make[10]: *** [install] Error 1
> > make[10]: Leaving directory
[...]
> `/home/sascha/svn/buildroot2/buildroot/build_i386/xc/programs/Xserver/
> > Xp
> > Config/C/print/models'
> > make[7]: *** [install] Error 2
> > make[7]: Leaving directory
> > 
[...]
> > make[1]: *** [install] Error 2
> > make[1]: Leaving directory
> > `/home/sascha/svn/buildroot2/buildroot/build_i386/xc'
> > make: ***
> > 
> [/home/sascha/svn/buildroot2/buildroot/build_i386/staging_dir/usr/X11R
> > 6/ lib/libX11.so.6.2] Error 2 
> > sascha at gulpdev:~/svn/buildroot2/buildroot$
> > 
> > Any idea what I'm missing here or is there maybe something broken?
> > 
> > Thanks a lot in advance,
> > Sascha.
> 
> Its trying to run mkfontscale, which apparently errored out. 
> I'll bet it picked up mkfontscale from your native 
> distribution and not from the buildroot system, it appears 
> from the error message that they take different command line options.
> 
> Brian
> 

Um, ok... on my host system I have xFree86 installed. So that's (I think) the reason why make produced an error.
But shouldn't buildroot use it's own version of mkfontscale and therefore not care about what I have installed as graphical host system?

Here's what I've done (after Brian's hint):

I tried to rename the local mkfontscale so it can't be found and this ends into an "command not found" after calling make. Which shows Brian's suggestion seems to be correct.

So I had a look into the make package for X.org
Within xorg.mk I found mkfontscale a few times but no hint on how to set the search path for it... I also searched for the params -b -s -l but didn't find them. As there are no pathes I think all the other tools are used from my local install too?

Actually if I found that I weren't quite sure to _which_ path to set it:

sascha at gulpdev:~$ find /home/sascha/svn/buildroot2/buildroot/ -name "mkfontscale"
/home/sascha/svn/buildroot2/buildroot/build_i386/staging_dir/usr/X11R6/bin/mkfontscale
/home/sascha/svn/buildroot2/buildroot/build_i386/root/usr/X11R6/bin/mkfontscale
/home/sascha/svn/buildroot2/buildroot/build_i386/xc/programs/mkfontscale
/home/sascha/svn/buildroot2/buildroot/build_i386/xc/programs/mkfontscale/mkfontscale
/home/sascha/svn/buildroot2/buildroot/build_i386/xc/exports/bin/mkfontscale
sascha at gulpdev:~$

These are many mkfontscales within the buildroot structure... 

Trying to determine what parameters the buildroot mkfontscale supports:
sascha at gulpdev:~/svn/buildroot2/buildroot/build_i386/xc/programs/mkfontscale$ ./mkfontscale -h
bash: ./mkfontscale: File or Directory not found

This happens with all the mkfontscales I have in my build_i386 directory...

So how can I tell buildroot's X.Org to use it's mkfontscale and actually which one and not the one from the host system?

Thanks a lot in advance,
Sascha.
