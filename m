From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Feb 2018 14:00:29 +0100
Subject: [Buildroot] Analysis of build results for 2018-02-25
In-Reply-To: <87fu5nsyrg.fsf@dell.be.48ers.dk>
References: <20180226070010.28C8620727@mail.bootlin.com>
 <20180226113319.7e3bcf6b@windsurf.lan>
 <87fu5nsyrg.fsf@dell.be.48ers.dk>
Message-ID: <20180226140029.45325514@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Feb 2018 13:48:03 +0100, Peter Korsgaard wrote:

>  > Compiler error. It's on PowerPC, with a toolchain from 2017.11. Could
>  > someone retry with a newer gcc, and see if it is fixed ?  
> 
> Notice that this happened on gcc67, so on the Ryzen CPU (and nowhere
> else), so I'm afraid the Ryzen crashes are _STILL_ not fixed. I'll stop
> the autobuilder again.

Ah, ok. Good to know.

>  > Readline is now needed. We have a patch to add readline as a
>  > dependency (https://patchwork.ozlabs.org/patch/860386/), but Baruch
>  > (and me) asked to ask upstream about it, because it looked like a
>  > possibly unintentional change. Since nobody investigated further, I
>  > propose that we apply Bernd's patch adding the readline dependency. If
>  > someone is unhappy with it, we can always revert when the problem is
>  > fixed.  
> 
> Yes, I guess this is the best solution for 2018.02.

ACK, I'll apply tonight if nobody does so in the mean time.

>  > Meh, a compiler failure. Bernd, could you test with various gcc
>  > versions, and see if the problem has been fixed ?  
> 
> Once more on gcc67 (and no other autobuilders), please ignore.

ACK.

>  >> i686 | mplayer-1.3.0 | NOK |
>  >> http://autobuild.buildroot.net/results/ec4e7e975c2e8f978a771a1702933d0612e95a9c
>  >> |  
> 
>  > I guess this is fixed by the old patches submitted by Bernd, which are
>  > still in patchwork. I'm still not super happy about these patches,
>  > though (as I already expressed as a reply to those patches).  
> 
> Agreed, but what are the alternatives? Make the package unavailable for
> x86 or drop it completely, as it is afaik dead upstream.

mplayer upstream is dead ? If that is the case, then indeed we should
just take those patches as-is.

>  >> powerpc | qt-4.8.7 | NOK |
>  >> http://autobuild.buildroot.net/results/b0ff91d12a569ae9f6a78b1c62c75fb64e207be3
>  >> | ORPH  
> 
>  > tools/qtextboundaryfinder.cpp:444:1: internal compiler error: in
>  > validate_condition_mode, at config/rs6000/rs6000.c:18074  
> 
>  > Someone to test this with newer gcc versions ?  
> 
> Or deprecate qt4?

Just because it's broken on powerpc?

So, I remembered I did some testing, and apparently the result of my
testing is that gcc 6.x has the issue, but gcc 7.x compiles Qt4
correctly. I believe my idea was then to bisect which commit *fixed*
the problem, but you can imagine that within gcc, it's going to take a
while.

But bottom line is: problem doesn't exist with gcc 7.x anymore.

>  >> arm | systemd-237 | NOK |
>  >> http://autobuild.buildroot.net/results/c2985c0471cfb8e396991bce125222d15474d0d0
>  >> |  
> 
>  > The infamous locale issue. Unless someone comes up with a better
>  > solution than https://patchwork.ozlabs.org/patch/876880/, I think I'm
>  > going to go ahead and apply this fix.  
> 
> Agreed, considering how close we are getting to 2018.02.

We also have the issue that systemd is currently broken anyway (see the
report from J?r?my Rosen, the attempt to fix it from Jan and Romain). I
don't think we can release until this problem is resolved.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
