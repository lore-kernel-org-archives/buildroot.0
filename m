From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Aug 2020 00:14:51 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Analysis of build results
In-Reply-To: <20200816000914.5ad801d9@windsurf.home>
References: <20200815080146.EBD3186EA1@fraxinus.osuosl.org>
 <20200816000914.5ad801d9@windsurf.home>
Message-ID: <20200816001451.54c7b1d3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 16 Aug 2020 00:09:14 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> >     arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/07dca0689044777cd6533dfe244f22abc7c3084d | ORPH
> >   powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/50e314b341fb46acfc81c84b6aff3381cb89cf75 | ORPH
> >    xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/718dd77dd44cd4bc43761900c1e0746074de038c | ORPH  
> 
> socket.h:289:33: error: flexible array member 'cmsghdr::__cmsg_data' not at end of 'struct<unnamed>'
> 
> Reported in Debian as well:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=954636, but not fixed.

I had a closer look. Our old/legacy version of Kismet does this:

typedef struct {
	struct cmsghdr header;
	int            fd;
} __attribute__((packed)) cmsg_fd;

struct cmsghdr is defined in socket.h like this:

struct cmsghdr
  {
    size_t cmsg_len;            /* Length of data in cmsg_data plus length
                                   of cmsghdr structure.
                                   !! The type should be socklen_t but the
                                   definition of the kernel is incompatible
                                   with this.  */
    int cmsg_level;             /* Originating protocol.  */
    int cmsg_type;              /* Protocol specific type.  */
#if __glibc_c99_flexarr_available
    __extension__ unsigned char __cmsg_data __flexarr; /* Ancillary data.  */
#endif
  };

So, if __glibc_c99_flexarr_available, there is a flexible array member
at the end of cmsghdr, which makes it illegal to have a "int fd" field
after "struct cmsghdr header" in the cmsg_fd structure defined by
kismet.

It seems like the (old) kismet code was written before
__glibc_c99_flexarr_available. This __glibc_c99_flexarr_available
define is defined like this in <sys/cdefs.h>

/* Support for flexible arrays.
   Headers that should use flexible arrays only if they're "real"
   (e.g. only if they won't affect sizeof()) should test
   #if __glibc_c99_flexarr_available.  */
#if defined __STDC_VERSION__ && __STDC_VERSION__ >= 199901L
# define __flexarr      []
# define __glibc_c99_flexarr_available 1
#elif __GNUC_PREREQ (2,97)
/* GCC 2.97 supports C99 flexible array members as an extension,
   even when in C89 mode or compiling C++ (any version).  */
# define __flexarr      []
# define __glibc_c99_flexarr_available 1
#elif defined __GNUC__
/* Pre-2.97 GCC did not support C99 flexible arrays but did have
   an equivalent extension with slightly different notation.  */
# define __flexarr      [0]
# define __glibc_c99_flexarr_available 1
#else
/* Some other non-C99 compiler.  Approximate with [1].  */
# define __flexarr      [1]
# define __glibc_c99_flexarr_available 0
#endif

So it seems like by playing with a -std= gcc option, we could
potentially get rid of this. It would however be good to understand
starting which gcc version this started failing (at least gcc 9.x fails
to build) and therefore which change of default standard caused the
breakage.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
