From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 8 Mar 2007 14:56:39 +0100
Subject: [Buildroot] cp command incompatibility
In-Reply-To: <45DF2131.2020404@cs.helsinki.fi>
References: <45DF2131.2020404@cs.helsinki.fi>
Message-ID: <20070308135639.GG32231@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 23, 2007 at 07:15:29PM +0200, Heikki Lindholm wrote:
>Hi,
>
>there's some incompatilibity between GNU cp and Mac OS X (probably BSD, 
>too) cp commands. GNU cp arguments -d and -a do not exist on OS X. -a 
>can be written -pPR on OS X. -d is partly covered by -P and partly by 
>-R. -P is the --no-dereference part of -d and -R does what 
>--preserve=links does AFAICT.

There was a bug about cp -a not working on MacOS10 that (IIRC) suggested
to use cp -dpf instead.


>
>Doing a quick grep -r "cp " `find . -iname "*.mk"` reveals that there is 
>quite a bit of work to fix all the incompatible cp occurences, so, I'm 
>asking here what might be the best way to do it:
>(1) hand-edit all incompatible cp occurences to something that works on 
>both systems ("POSIXify")
>(2) introduce some menuconfig options for common cp "use cases" and use 
>shell variables to pass these configurable options to cp, for example, 
>.mk scripts might have "cp $ARCHIVE foo bar", where $ARCHIVE would, for 
>instance, be "-a" on Linux and "-pPR" on OS X.
>(3) give up and build a local copy of GNU fileutils, instead

4) ship, build and use a working install(1)

short of 4) and re 2). I'd introduce CP_A CP_F that'd do something like
cp -a (resp -dpf)  and cp -pf. I do not think that $(ARCHIVE) et al are
what we want, fwiw.

Comments?
