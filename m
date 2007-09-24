From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 24 Sep 2007 04:43:22 +0100
Subject: [Buildroot] Qtopia4 Failure
In-Reply-To: <1190600185.4299.44.camel@cyclops.infocab.com.au>
References: <1190563965.7015.21.camel@elrond.atmel.sweden>
	<1190591711.4299.17.camel@cyclops.infocab.com.au>
	<d6cda7730709231756k273d449axed0357049468a113@mail.gmail.com>
	<1190595992.4299.27.camel@cyclops.infocab.com.au>
	<d6cda7730709231841v7ce7eec2qa801e54b049763b7@mail.gmail.com>
	<1190600185.4299.44.camel@cyclops.infocab.com.au>
Message-ID: <d6cda7730709232043k2d85bb2bi8318ef6f652a1eff@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam,

   You are fixing newer, valid and good code in the name of legacy
compatibility with a flawed work around for legacy API. The simple
fact that there are more than one way around it doesn't make the patch
the better way. And I think we should strive for the better way to fix
things ;)

   Instead, I propose talk to the uclib guys (they are hopefully here,
if not, will join the uclib mailling list) to implement the legacy
support in a proper way.
   The OpenGroup is only recomending to use a macro. The only reason
for it is to avoid a function call, which might even be optimized out
by the compiler. The code that was implemented with the index() in
mind, expected it to be a function anyway, not a macro.

something like:
#ifdef SUSv3_LEGACY_MACROS
char * index (const char *string, int c)
{  return strchr( string, c ); }
#endif

I'm not proposing to drop the workaround, but keeping the macro does
break code as we are well aware. The above has no drawbacks that I can
think of, and beats patching good code ;)

Friendly Regards

On 9/24/07, Adam Hawes <adam@infocab.com.au> wrote:
> > A define claims the name index as if it were a keyword. It is a well
> > known issue.
>
> Yes, I am well aware of that.
>
> > How about change it to a function that wrapps the strchr()?
> > According to this:
> > http://www.opengroup.org/onlinepubs/000095399/functions/index.html
> > it used to be a function anyway.
>
> It's LEGACY.  To quote the open Group page you linked:
>
> "For maximum portability, it is recommended to replace the function call
> to index() as follows:
>
> #define index(a,b) strchr((a),(b))"
>
> The recommendation is to #define index when you need it in legacy code
> because it no longer exists in the standard library.  uClibc does this
> globally with a configuration option.
>
> > One other good solution would be to patch mplayer not to use this define.
>
> A good solution: yes.
>
> The only solution: no.  There is all sorts of other code that still uses
> legacy function calls.  It's not ideal but it's the way it is.  See my
> quote below.
>
> Quoting me:
> > > Fixing uClibc would be the sensible thing to do, and uClibc actually has
> > > a configuration option to turn off the legacy macros.  Turning them off,
> > > however, breaks compatibility with a few things (mplayer was the most
> > > recent one I found that wouldn't build with SUSv3 macros disabled).
>
> It is already possible to remove the macros from uClibc by turning off
> SUSv3_LEGACY_MACROS in the configuration file before you build it.  You
> don't need to patch uClibc.   Removing the macros may break more than
> just mplayer though.
>
> Regards,
> Adam
>
>
>
