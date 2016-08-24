From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Aug 2016 16:12:24 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain/wrapper: extend paranoid
	check to -isystem
In-Reply-To: <4a80aa4c-4bbf-55ca-e310-2c4e1dcad3c4@mind.be>
References: <1471444962-32200-1-git-send-email-yann.morin.1998@free.fr>
 <1471444962-32200-2-git-send-email-yann.morin.1998@free.fr>
 <4a80aa4c-4bbf-55ca-e310-2c4e1dcad3c4@mind.be>
Message-ID: <20160824141224.GA5730@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-08-24 03:18 +0200, Arnout Vandecappelle spake thusly:
> On 17-08-16 16:42, Yann E. MORIN wrote:
> > Some packages, like libbsd, use -isystem flags to provide so-called
> > overrides to the system include files. In this particular case, this
> > is used in a .pc file, then used by antoher package; pkgconf does not
> > mangle this path; and eventually that other package ends up using
> > /usr/include/bsd to search for headers.
> > 
> > Our current toolchain wrapper is limited to looking fo -I and -L, so
> > the paranoid check does not kick in.
> > 
> > Extend the paranoid check to also look for the -isystem option.
> 
>  While we're at it: -idirafter, -iprefix, -iwithprefix, -iwithprefixbefore,
> -isysroot, -imultilib, -iquote.

Did you meant we should handle all of them now? Are were you listing
them for the future, when we encoutner issues with any if them?

>  And then there is -B, but if someone passes that, it's really broken :-) And
> --sysroot, also interesting if that is passed. But I guess these things are
> going a bit too far.

--sysroot is even more fun, as it can be written: --sysroot=dir , so
we'd need to take care of this as well...

Lotta fun in sight! ;-)

> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > ---
> >  toolchain/toolchain-wrapper.c | 18 ++++++++++--------
> >  1 file changed, 10 insertions(+), 8 deletions(-)
> > 
> > diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
> > index b8b3cbe..8a9c3b3 100644
> > --- a/toolchain/toolchain-wrapper.c
> > +++ b/toolchain/toolchain-wrapper.c
> > @@ -241,17 +241,19 @@ int main(int argc, char **argv)
> >  	/* Check for unsafe library and header paths */
> >  	for (i = 1; i < argc; i++) {
> >  
> > -		/* Skip options that do not start with -I and -L */
> > -		if (strncmp(argv[i], "-I", 2) && strncmp(argv[i], "-L", 2))
> > +		/* Skip options that do not start with -I, -isystem or -L */
> > +		if (   strncmp(argv[i], "-I", 2)
> > +		    && strncmp(argv[i], "-L", 2)
> > +		    && strcmp(argv[i], "-isystem"))
> >  			continue;
> >  
> > -		/* We handle two cases: first the case where -I/-L and
> > -		 * the path are separated by one space and therefore
> > -		 * visible as two separate options, and then the case
> > -		 * where they are stuck together forming one single
> > -		 * option.
> > +		/* We handle two cases: first the case where -I/-L/-isystem
> > +		 * and the path are separated by one space and therefore
> > +		 * visible as two separate options, and then the case  where
> > +		 * they are stuck together forming one single option.
> > +		 * -isystem is necessarily in the first case.
> 
>  Unfortunately, that's not true. You can pass something like -isystemfoo and it
> will add ./foo to the search path. Ain't gcc fun... I'll leave it as an exercise
> to the reader to handle that case :-P

I think we should not care too much about this, should we? In the end,
this would not be an unsafe path...

But I think my next iteration should cover all your comments (as well as
on the previous patch).

Thanks! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
