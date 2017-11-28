From: Trent Piepho <tpiepho@impinj.com>
Date: Tue, 28 Nov 2017 19:09:03 +0000
Subject: [Buildroot] [PATCH 2/3] package/dvb-apps: is not parallel-safe
In-Reply-To: <87r2sj9vx9.fsf@dell.be.48ers.dk>
References: <cover.1511779719.git.yann.morin.1998@free.fr>
 <a5cb242853434b99a016d430dc3030ba10602d09.1511779719.git.yann.morin.1998@free.fr>
 <87r2sj9vx9.fsf@dell.be.48ers.dk>
Message-ID: <1511896142.9792.8.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2017-11-27 at 23:52 +0100, Peter Korsgaard wrote:
> > > > > > "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > This is invisible because the timings make it excessively difficult to
>  > hit, but the Makefile is inherently flawed for parallel build, as it
>  > contains:
> 
>  >     $(objects): atsc_psip_section.c atsc_psip_section.h
> 
>  >     atsc_psip_section.c atsc_psip_section.h:
>  >         perl section_generate.pl atsc_psip_section.pl
> 
>  > and the perl script section_generate.pl will create both the .c and .h
>  > files in one go, but given the construct above, there can be two such
>  > script that run in parallel, which can clobber the generated .c and/or
>  > .h files.

I gather this is the common parallel build issue with a recipe that
produces two outputs. This can be fixed by using a pattern rule for the
recipe that produces multiple outputs.

%section.c %section.h: %section.pl
	perl section_generate.pl $<

GNU make understands a pattern rule that produces multiple outputs to
produce all of them via a single running of the rule.

Seems like a simple patch.
