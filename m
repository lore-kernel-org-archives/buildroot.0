From: Adam Hawes <adam@infocab.com.au>
Date: Mon, 24 Sep 2007 11:46:25 +0930
Subject: [Buildroot] Qtopia4 Failure
In-Reply-To: <d6cda7730709231841v7ce7eec2qa801e54b049763b7@mail.gmail.com>
References: <1190563965.7015.21.camel@elrond.atmel.sweden>
	<1190591711.4299.17.camel@cyclops.infocab.com.au>
	<d6cda7730709231756k273d449axed0357049468a113@mail.gmail.com>
	<1190595992.4299.27.camel@cyclops.infocab.com.au>
	<d6cda7730709231841v7ce7eec2qa801e54b049763b7@mail.gmail.com>
Message-ID: <1190600185.4299.44.camel@cyclops.infocab.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> A define claims the name index as if it were a keyword. It is a well
> known issue.

Yes, I am well aware of that.

> How about change it to a function that wrapps the strchr()?
> According to this:
> http://www.opengroup.org/onlinepubs/000095399/functions/index.html
> it used to be a function anyway.

It's LEGACY.  To quote the open Group page you linked:

"For maximum portability, it is recommended to replace the function call
to index() as follows:

#define index(a,b) strchr((a),(b))"

The recommendation is to #define index when you need it in legacy code
because it no longer exists in the standard library.  uClibc does this
globally with a configuration option.

> One other good solution would be to patch mplayer not to use this define.

A good solution: yes.

The only solution: no.  There is all sorts of other code that still uses
legacy function calls.  It's not ideal but it's the way it is.  See my
quote below.  

Quoting me:
> > Fixing uClibc would be the sensible thing to do, and uClibc actually has
> > a configuration option to turn off the legacy macros.  Turning them off,
> > however, breaks compatibility with a few things (mplayer was the most
> > recent one I found that wouldn't build with SUSv3 macros disabled).

It is already possible to remove the macros from uClibc by turning off
SUSv3_LEGACY_MACROS in the configuration file before you build it.  You
don't need to patch uClibc.   Removing the macros may break more than
just mplayer though.

Regards,
Adam
