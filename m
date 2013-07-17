From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Jul 2013 09:45:41 +0200
Subject: [Buildroot] [PATCH] toolchain: check ARM EABI vs. EABIhf for
	external toolchains
In-Reply-To: <20130717092519.7543da71@skate>
References: <1374012366-27612-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20130716223952.GB7947@free.fr> <20130717092519.7543da71@skate>
Message-ID: <201307170945.41870.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Wednesday 17 July 2013 09:25:19 Thomas Petazzoni wrote:
> On Wed, 17 Jul 2013 00:39:53 +0200, Yann E. MORIN wrote:
> > >  	EXT_TOOLCHAIN_TARGET=`LANG=C $${__CROSS_CC} -v 2>&1 | grep ^Target | cut -f2 -d ' '` ; \
> > > -	if ! echo $${EXT_TOOLCHAIN_TARGET} | grep -qE 'eabi(hf)?$$' ; then \
> > > -		echo "External toolchain uses the unsuported OABI" ; \
> > > +	if echo $${EXT_TOOLCHAIN_TARGET} | grep -qE 'eabi$$' ; then \
> > > +		EXT_TOOLCHAIN_ABI="eabi" ; \
> > > +	elif echo $${EXT_TOOLCHAIN_TARGET} | grep -qE 'eabihf$$' ; then \
> > > +		EXT_TOOLCHAIN_ABI="eabihf" ; \
> > 
> > That's not always the case. You can well have a toolchain which tuple
> > ends in eabi, but the toolchain uses the hard-float ABI.
> > 
> > That's the case by default for crosstool-NG toolchains, for example.
> > Since the *eabihf is recent, not all gcc or binutils versions recognise
> > it, while they are absolutely capable of emitting EABI using the
> > hard-float ABI. Hence, ct-ng allows adding the 'hf' suffix as an option.
> > (see attachment for an example of 'gcc -v' dump).
> > 
> > Checking for EABI, it is better and more reliable to run the
> > preprocessor, and check some defines are available or not (I always
> > need a bit of googling to get this):
> >     ARM_TUPLE-gcc -E -dM -xc - </dev/null |grep __ARM_EABI__
> > 
> > However, I could not find a #define about the float ABI... :-(
> 
> Ah, interesting. Originally, I wasn't planning on checking the tuple,
> and I was instead thinking of using a specific tag in the ELF headers.
> 
> A binary compiled with an EABIhf toolchain:
> 
> $ arm-linux-gnueabihf-readelf -A toto.o | grep Tag_ABI_VFP_args
>   Tag_ABI_VFP_args: VFP registers

Woot! I learned something! :-)

> A binary compiled with an EABI toolchain:
> 
> $ arm-linux-gnueabihf-readelf -A toto.o | grep Tag_ABI_VFP_args
> $
> 
> I would run this on the libc or ld.so provided with the toolchain.
> 
> What do you think?

Yes, great! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
