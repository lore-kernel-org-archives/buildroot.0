From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sat, 15 May 2010 18:37:14 +0200
Subject: [Buildroot] endian issue
In-Reply-To: <201005151726.58323.korgull@home.nl>
References: <201005151547.02656.korgull@home.nl>
	<1273933182.28330.87.camel@coalu.atr> <hsmbug$d0p$1@dough.gmane.org>
	<201005151726.58323.korgull@home.nl>
Message-ID: <1273941434.28330.100.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le samedi 15 mai 2010 ? 17:26 +0200, Marcel a ?crit :
> On Saturday 15 May 2010 04:43:29 pm Grant Edwards wrote:
> > On 2010-05-15, Lionel Landwerlin <llandwerlin@gmail.com> wrote:
> > > Le samedi 15 mai 2010 ?? 15:47 +0200, Marcel a ??crit :
> > >> I'm using an Atmel sam9g45 using buildroot with linux 2.6.33.
> > >> 
> > >> I currently have most of my things working but run into an issue which
> > >> is endian related.
> > > 
> > > The endianness configuration of your processor isn't something you
> > > can usually change 'on-the-fly'. It's usually set up early in the
> > > boot process.
> > 
> > While the endian configuration of the ARM9 core can be changed, the
> > AT91 peripherals are little-endian.  In theory, he should be able to
> > run the ARM9 core in big-endian mode, but a running uC core without
> > any working peripherals is surprisingly useless.
> > 
> > > So you have to choose whether you want to compile all your system in
> > > big or little endian, you can select that from the buildroot
> > > architecture configuration (arm -> little, armeb -> big, for
> > > example).
> > 
> > In this case, he has to choose little-endian.
> 
> That's very clear. 
> 
> > [I've never seen an ARM-based uController that had peripherals with
> > configurable endianess -- are there any?]
> > 
> > >> Is there any way to compile my package in big-endian mode from
> > >> buildroot? Or is there another way I should force this?
> > > 
> > > You can't select that for 1 package, it's for the whole system or
> > > nothing. Otherwise, the smartest approch would be to make endian
> > > detection (at compile time or at running time) to adapt your
> > > processing algorithm.
> > 
> > Yep, the OP's should driver should return data in host-order.
> > 
> > Otherwise, he'll have to suffer the guilt of knowing that a few years
> > from now some poor sod who inherits the code will have a stroke from
> > the effort required to resist the urge to track down the OP and slap
> > him silly.
> 
> If I wish to do that, how do I detect the endianness of a sytem and do I need 
> to reformat my data in my drivers for this ? If so, isn't that a pure waste of 
> cpu cycles for the sake of reusable code ?
> If I can do this without any speed sacrifice than I will do it, if not....than 
> it's simply not an option for this system.
> 
> Best regards,
> Marcel
> 

A basic example of detection (copy pasta from here
http://www.allegro.cc/forums/print-thread/592785)

=>

Uint32 Value32;
Uint8 *VPtr = (Uint8 *)&Value32;

VPtr[0] = VPtr[1] = VPtr[2] = 0; VPtr[3] = 1;

if(Value32 == 1)
   printf("I'm big endian\n");
else
   printf("I'm little endian\n");

<=

Some packages make this detection within configure script using such
code (which is problematic with cross compilation because you can't run
target code on the host) and then use some #ifdef BIG_ENDIAN etc...
Of course doing endian translation costs more than doing nothing.

--
Lionel Landwerlin
