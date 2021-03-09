From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 9 Mar 2021 21:33:56 +0100
Subject: [Buildroot] [RFC/next v2 1/2] package/rpi-firmware: rework
 boot/config file handling
In-Reply-To: <20210309212525.2c57f6ce@gmx.net>
References: <20210216201148.26688-1-ps.report@gmx.net>
 <20210308220431.GC2737665@scaer> <20210309212525.2c57f6ce@gmx.net>
Message-ID: <20210309203356.GO2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-03-09 21:25 +0100, Peter Seiderer spake thusly:
> On Mon, 8 Mar 2021 23:04:31 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > On 2021-02-16 21:11 +0100, Peter Seiderer spake thusly:
> > > +ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN),y)
> > > +RPI_FIRMWARE_FILES += bootcode.bin
> > > +endif
> > > +
> > > +ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI),y)
> > > +RPI_FIRMWARE_FILES += start.elf fixup.dat
> > > +endif
[--SNIP--]
> > What about:
> >     RPI_FIRMWARE_FILES = \
> >         $(if $(BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN),bootcode.bin) \
> >         $(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI),start.elf fixup.dat) \
> >         $(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X),startx.elf fixupx.dat) \
> >         $(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_CD),start_cd.elf fixup_cd.dat) \
> >         $(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4),start4.elf fixup4.dat) \
> >         $(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_X),start4x.elf fixup4x.dat) \
> >         $(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_CD),start4cd.elf fixup4cd.dat)
> Unsettled which of the three versions is the nicest one, seems a matter of
> taste (and a matter of trading more lines against long lines), and personal not
> much of a friend of the '.._y' pattern...

Then I think the one-assignment (kept above) is the one I'd prefer over
the many-conditional-assignments.

[--SNIP--]
> > Use a make-level $(foreach) loop rather than a shell loop (see example
> > above).
> Definitely an improvement as it avoids the '|| exit 1;' part...
> Will rework the patch accordingly...

Thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
