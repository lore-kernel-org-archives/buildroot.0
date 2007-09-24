From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 24 Sep 2007 02:41:24 +0100
Subject: [Buildroot] Qtopia4 Failure
In-Reply-To: <1190595992.4299.27.camel@cyclops.infocab.com.au>
References: <1190563965.7015.21.camel@elrond.atmel.sweden>
	<1190591711.4299.17.camel@cyclops.infocab.com.au>
	<d6cda7730709231756k273d449axed0357049468a113@mail.gmail.com>
	<1190595992.4299.27.camel@cyclops.infocab.com.au>
Message-ID: <d6cda7730709231841v7ce7eec2qa801e54b049763b7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sure. There are all sort of valid code that a define breaks:

class MyClass
{
    MyClass() : index( 0 )
    {}
};

class MyOtherClass
{
    int index() const { return 0; }
}


A define claims the name index as if it were a keyword. It is a well
known issue.

How about change it to a function that wrapps the strchr()?
According to this:
http://www.opengroup.org/onlinepubs/000095399/functions/index.html
it used to be a function anyway.

At least it would give the compiler a chance to figure out by the scope.

One other good solution would be to patch mplayer not to use this define.


On 9/24/07, Adam Hawes <adam@infocab.com.au> wrote:
> On Mon, 2007-09-24 at 01:56 +0100, Thiago A. Corr?a wrote:
> > shouldn't you patch uClib instead? Claiming index with a define is
> > really stupid on the part of the library. Others, including myself use
> > index as variable names quite often.
>
> Do you use index()?  The macro accepts 2 arguments and the pre-processor
> only seems to baulk when you use a function or method called index(...).
> Variable names appear unproblematic.
>
> Fixing uClibc would be the sensible thing to do, and uClibc actually has
> a configuration option to turn off the legacy macros.  Turning them off,
> however, breaks compatibility with a few things (mplayer was the most
> recent one I found that wouldn't build with SUSv3 macros disabled).
>
> I found it easier to patch Qtopia because it was the only thing that
> didn't like the macros that I have found thus far.
>
> So please keep in mind that there is not one universal solution - there
> are a few options depending on the needs.  My patch fixes Qtopia for
> those people who need the SUSv3 legacy macros in other places.  For
> everyone else there's the configuration option of the library!
>
> Regards,
> A
>
>
>
