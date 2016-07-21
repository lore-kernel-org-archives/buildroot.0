From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 21 Jul 2016 18:47:21 +0200
Subject: [Buildroot] bfin c++ problem
In-Reply-To: <20160721121643.GP4023@csltok.swansea.ac.uk>
References: <20160721000402.GR22524@waldemar-brodkorb.de>
 <20160721030504.GN4023@csltok.swansea.ac.uk>
 <CAH6eHdRNcLv9iT8dKN_zneVp2=P=yakUH=p8wq5dz5q2gNL-xQ@mail.gmail.com>
 <20160721111244.GO4023@csltok.swansea.ac.uk>
 <CAH6eHdT-H+4qUe3uU268uG8O_7KQLoOZchtsW3AdFAVaeuN6cg@mail.gmail.com>
 <20160721121643.GP4023@csltok.swansea.ac.uk>
Message-ID: <20160721164721.GU22524@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Oliver,
Oliver Kullmann wrote,

> On Thu, Jul 21, 2016 at 12:40:43PM +0100, Jonathan Wakely wrote:
> > On 21 July 2016 at 12:12, Oliver Kullmann wrote:
> > > On Thu, Jul 21, 2016 at 11:26:42AM +0100, Jonathan Wakely wrote:
> > >> On 21 July 2016 at 04:05, Oliver Kullmann wrote:
> > >> > Hello,
> > >> >
> > >> > a C++ compiler is not required to recognise "main(void)":
> > >>
> > >> That's incorrect.

Thanks for any advice about correct usage of C++, but I am afraid
it does not help in any way to fix my original problem.
Please open up a new thread to discuss this. Thanks.

Anyway, even a simple C application does compile with gcc, but not
with g++:

./output/host/usr/bin/bfin-buildroot-linux-uclibc-g++ -o t test.c
/home/wbx/buildroot/output/host/usr/lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/../../../../bfin-buildroot-linux-uclibc/bin/ld:
t: hidden symbol `___gtdf2' in
/home/wbx/buildroot/output/host/usr/lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/libgcc.a(_gt_df.o)
is referenced by DSO
/home/wbx/buildroot/output/host/usr/lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/../../../../bfin-buildroot-linux-uclibc/bin/ld:
final link failed: Bad value
collect2: error: ld returned 1 exit status
$ cat test.c
int main() {
 return(0);
}

$ ./output/host/usr/bin/bfin-buildroot-linux-uclibc-gcc -o t test.c
$ file t
t: ELF 32-bit LSB executable, Analog Devices Blackfin, version 1
(SYSV), dynamically linked (uses shared libs), not stripped
$ 

Any advice? Why does the hidden symbols in libgcc.a from the
first-stage gcc, doesn't make it into libstdc++ shared library?

Buildroot first compiles gcc with --disable-shared and have then a
libgcc.a. Afterwards the C library (uClibc-ng) is build. In the next
step a full --enable-shared gcc including libstdc++ is build.
This one is then somehow mislinked and then g++ can not compile 
a simple application.

It must be some architecture specific problem, because we are not
seeing this kind of issues on any other architecture at the moment.

Thanks in advance
 Waldemar
