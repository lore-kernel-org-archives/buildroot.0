From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 May 2014 08:46:02 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-27
In-Reply-To: <20140528064358.GB3510@free.fr>
References: <20140528063007.1778D101696@stock.ovh.net>
 <20140528064358.GB3510@free.fr>
Message-ID: <20140528084602.4cc48b8d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 28 May 2014 08:43:58 +0200, Yann E. MORIN wrote:

> >       bfin |                      monit-5.7 | NOK | http://autobuild.buildroot.net/results/67623f87f8bc2c73f30bdc3943c58238686c106e/
> 
>     src/process/sysdep_LINUX.c: In function 'initprocesstree_sysdep':
>     src/process/sysdep_LINUX.c:207: error: 'GLOB_ONLYDIR' undeclared (first
>     use in this function)
> 
> Not sure, but GLOB_ONLYDIR should come from the C library. I will
> investigate.

GLOB_ONLYDIR is a GNU extension, and Blackfin toolchains have a uClibc
configuration without the appropriate option. However, GLOB_ONLYDIR is
only a hint:

       GLOB_ONLYDIR
              This  is  a hint to glob() that the caller is interested only in
              directories that match the pattern.  If the  implementation  can
              easily  determine file-type information, then nondirectory files
              are not returned to the caller.  However, the caller must  still
              check that returned files are directories.  (The purpose of this
              flag is merely to optimize performance when the caller is inter?
              ested only in directories.)

So a potential fix would be:

#ifndef GLOB_ONLYDIR
#define GLOB_ONLYDIR 0
#endif

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
