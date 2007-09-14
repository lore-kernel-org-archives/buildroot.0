From: Darcy Watkins <DWatkins@tranzeo.com>
Date: Fri, 14 Sep 2007 08:01:54 -0700
Subject: [Buildroot] pciutils-2.2.6 fails to build for powerpc  405
In-Reply-To: <20070913092615.GA15641@aon.at>
References: <D61182AC8012EA4EBC531B3AF23BE1093F1374@tranzeo-mail2.12stewart.tranzeo.com>
	<20070913092615.GA15641@aon.at>
Message-ID: <D61182AC8012EA4EBC531B3AF23BE1093F1421@tranzeo-mail2.12stewart.tranzeo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernhard et al,

I checked into this.  Extracted from email response from Martin who owns
/ maintains PCI utils...

>> I believe that in order to properly support cross compiling, the 
>> configure scripts need to check the variables normally associated
with 
>> cross compiling and target architecture rather than using the "uname"
>> utility of the machine running the build (otherwise it will configure

>> for the build machine and then attempt to cross compile it for the 
>> target).
>
>Which variables do you have in mind?

I looked at the "configure" script and put in a few "echo"'s to spit out
typical cross compile variables that are set.  I notice that $ARCH and
$CROSS_COMPILE are not set when using buildroot.  It appears that the
only one reliable (I know of) is $CC.  When using buildroot to compile
for powerpc, I see something like:

  <path to my toolchain>/powerpc-linux-uclibc-gcc

So I could suggest to Martin a check of $CC for a prefix in front of the
gcc (after any path).  If so then extract contents as follows:

  Cpu <== from the prefix up to the first "-"
  Sys <== from the prefix after the first "-" to the "-" before the gcc
  Host <== I believe that this should still be derived from "uname"
since it
           describes the build machine not the target machine

If there is no prefix in front of the "gcc" then assume not cross
compiling (native compile) and use "uname" as is done at present.

I think that "linux-uclibc" will work out OK.

Ultimately, at this point, it appears that we only need sufficient logic
to ensure that $cpu takes on a value other than "i386" when cross
compiling for other architectures, because that is all the configure
script checks for now.

I don't know how this will behave for native compiling on all the other
operating systems (BSD, cygwin, etc).  Is there a better variable to use
than $CC?

Regards,

Darcy


-----Original Message-----
From: Bernhard Fischer [mailto:rep.dot.nop at gmail.com] 
Sent: Thursday, September 13, 2007 2:26 AM
To: Darcy Watkins
Cc: buildroot@uclibc.org
Subject: Re: [Buildroot] pciutils-2.2.6 fails to build for powerpc 405

--snip!--

>I think that the short solution is to patch line #23 so that it derives
>cpu from architecture variables instead of the output of uname.

Sounds ok. Is this already fixed updstream? If not it would be nice if
you could make sure that we can inherit a working version from
upstream..
