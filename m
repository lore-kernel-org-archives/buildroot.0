From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Nov 2013 12:26:18 +0100
Subject: [Buildroot] [PATCH v2 1/1] openpgm: disable on AVR32
In-Reply-To: <CAHt8ZCO2OEtWe8NrDYSTkmu7uqQGpQbWjAEJg+jHVGzsWsF9Mg@mail.gmail.com>
References: <1383329548-8528-1-git-send-email-alexander.lukichev@gmail.com>
 <20131101192027.1ea4c1bc@skate>
 <CAAHaz6GXiQAMuoK2eo0=EjmE509P98zuuAuN7f_T5TYeK6W1QA@mail.gmail.com>
 <CAHt8ZCO2OEtWe8NrDYSTkmu7uqQGpQbWjAEJg+jHVGzsWsF9Mg@mail.gmail.com>
Message-ID: <20131102122618.18eb2f00@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Simon Dawson,

On Sat, 2 Nov 2013 08:03:51 +0000, Simon Dawson wrote:
> Hi Alexander.
> 
> On 1 November 2013 20:21, Alexander Lukichev
> <alexander.lukichev@gmail.com> wrote:
> > The compiler (that particular toolchain) has those intrinsic functions but
> > is able to generate them only if the exact CPU sub architecture is
> > specified, not just AVR32 (their implementations differ for each of the two
> > sub architectures). This is impossible to specify unless we introduce it in
> > the buildroot configuration system (like several flavors of ARM). And this,
> > in turn, seems too much to make just one package happy.
> 
> I might be wrong, but is it not the case that only one of the two
> micro-architectures --- specifically, avr32b as used by the ap7 core
> --- is relevant for Buildroot? (I'm not aware of a Linux port for the
> avr32a architecture, as used by the uc3 core.)
> 
> If so, then it seems to me that it would be well worth calling the
> compiler with the precise micro-architecture specified. This might be
> expected to have a positive impact beyond just the openpgm package.

I did a minimal test case, and even by specifying -march and -mpart,
sync_add_and_fetch_2 remains an undefined symbol. Interestingly, if you
use sync_add_and_fetch() on a pointer to a 4 bytes value, there's no
problem, but if it's a pointer to a 2 bytes value, then the intrinsics
uses sync_add_and_fetch_2, which doesn't work.

Test case with a pointer to a 4 bytes value
===========================================

$ cat toto.c 
int foo(void) {
	unsigned int *ptr;
	return __sync_add_and_fetch(ptr, 2);
}
$ avr32-linux-gcc -march=ap -mpart=ap7200 -fPIC -c toto.c 
$ avr32-linux-gcc -march=ap -mpart=ap7200 -fPIC -shared -Wl,-soname,libtoto.so.1 -o libtoto.so.1 toto.o 
$ avr32-linux-readelf -a libtoto.so.1 | grep sync_add
$

 => no problem

Test case with a pointer to a 2 bytes value
===========================================

$ cat toto.c 
int foo(void) {
	unsigned short *ptr;
	return __sync_add_and_fetch(ptr, 2);
}
$ avr32-linux-gcc -march=ap -mpart=ap7200 -fPIC -c toto.c 
$ avr32-linux-gcc -march=ap -mpart=ap7200 -fPIC -shared -Wl,-soname,libtoto.so.1 -o libtoto.so.1 toto.o 
$ avr32-linux-readelf -a libtoto.so.1 | grep sync_add
0000149c  00000b29 R_AVR32_GLOB_DAT  00000000   __sync_add_and_fetch_2 + 0
    11: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __sync_add_and_fetch_2
    43: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __sync_add_and_fetch_2
$

 => unresolved symbol

Any idea?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
