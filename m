From: Arguin, Christopher P     UTAS <Christopher.Arguin@utas.utc.com>
Date: Wed, 20 Jul 2016 23:12:13 +0000
Subject: [Buildroot] [External] Re: Issues with cross-compiling from
 x86_64 to a different x86_64
In-Reply-To: <20160720220258.46331635@free-electrons.com>
References: <34C69F44FE4EA4498813EAECDBF40C1623A46E39@GUSALE0B.na.utcmail.com>
 <20160720000154.4132543d@free-electrons.com>
 <34C69F44FE4EA4498813EAECDBF40C1623A47405@GUSALE0B.na.utcmail.com>
 <20160720220258.46331635@free-electrons.com>
Message-ID: <34C69F44FE4EA4498813EAECDBF40C1623A483E0@GUSALE0B.na.utcmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

> However, I don't understand why on my system, ccdv doesn't get built, while it does get built for you.

I just stumbled into the answer to that. I pulled buildroot from git so I could start making changes, and did a 'mostly-default' build first. Much to my surprise, the ccdv executable didn't get built.

Switching from the default uclibc target to glibc target changed that.

Basically, the configure script in ncftp tries it's hardest to build ccdv, but if it doesn't generate a working executable it gives up on it. In my case the executable worked well enough if you didn't pass any arguments, so it passed the configure test... but then died when you try to actually use it. With uclibc as the target, ccdv may not have been successfully built because the C library was mismatched.

Now that I know what to look for, I see that you predicted this a few years ago. From http://lists.busybox.net/pipermail/buildroot/2014-February/089526.html:
> That being said, I agree that the cross-compilation test is stupid: it
> builds a program, and tries to run it. If it runs, then the configure
> script concludes that we're doing native compilation, if it doesn't
> run, we're doing cross-compilation. Except that of course when you're
> building x86 or x86-64 on x86-64 and both the target and host use
> glibc, the program may very well run.

That addressed the detection of cross-compilation in ncftp, but not the use of the host-tool.  I managed to have just the right setup to hit a pretty obscure corner case. 

Thanks,
Chris

-----Original Message-----
From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Sent: Wednesday, July 20, 2016 4:03 PM
To: Arguin, Christopher P UTAS
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] [External] Re: Issues with cross-compiling from x86_64 to a different x86_64

Hello,

On Wed, 20 Jul 2016 02:49:45 +0000, Arguin, Christopher P     UTAS
wrote:

> I dug into it more and found the source of the problem, which is in 
> ncftp itself. As part of the 'configure' script it actually creates a 
> 'ccdv.c' file and compiles it, apparently using the wrong compiler.
> Then this 'ccdv' tool is used throughout the build process instead of 
> CC. It was to make the compilation output prettier.

Thanks for the investigation!

> It's not directly AVX-related, but from the BMI instruction set...
> the actual failure is the "andn" instruction. I still need to dig into 
> it more to understand what's going on there.
> 
> There is a configure option to disable use of ccdv, so I may give that 
> shot. Then I have to go look at what is going on in openssl. I guess 
> you can probably expect a patch or two from me this week :)

Looks like indeed passing --disable-ccdv is the best way forward.

However, I don't understand why on my system, ccdv doesn't get built, while it does get built for you.

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com
