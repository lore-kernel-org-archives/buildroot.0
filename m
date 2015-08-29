From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 15:53:48 +0200
Subject: [Buildroot] [PATCH 1/1] gnuradio: stat.h is need for mode_t
In-Reply-To: <20150829155227.54561ee9@x230.trabucayre.com>
References: <1440773264-14999-1-git-send-email-gwenj@trabucayre.com>
 <20150828193146.58c943bc@free-electrons.com>
 <20150829155227.54561ee9@x230.trabucayre.com>
Message-ID: <20150829155348.436b42e2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Aug 2015 15:52:27 +0200, gwenhael.goavec wrote:

> > mode_t is according to the standard
> > (http://pubs.opengroup.org/onlinepubs/007908799/xsh/sysstat.h.html)
> > defined in <sys/types.h>. Can you try including <sys/types.h> instead?
> > 
> Ok It's working with sys/types.h

Good.

> > If that works as well, then please submit the patch upstream: it is
> > valid for all toolchains.
> > 
> I've checked all the autobuild for 07/2015 and 08/2015. The missing
> mode_t only appears if the toolchain is based on musl.

Yes. It's just because with uClibc and glibc, <sys/types.h> is pulled
in by another header that gets included by gnuradio.

However, using mode_t without <sys/types.h> is incorrect. It happens to
be working by chance with uClibc and glibc, but is not technically
correct: as the POSIX standard specifies, mode_t is defined in
<sys/types.h>, so this file should be included when mode_t is used.

See
http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/sys_types.h.html

So the fix of including <sys/types.h> is not musl specific at all. It
makes the code more correct.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
