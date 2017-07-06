From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 6 Jul 2017 19:16:13 +0200
Subject: [Buildroot] [PATCH] package/linuxptp: remove incdefs.sh to
 avoid cross-compilation issues
In-Reply-To: <20170706041648.p546saeul5pdr576@sapphire.tkos.co.il>
References: <20170705141028.28194-1-romain.naour@smile.fr>
 <20170706041648.p546saeul5pdr576@sapphire.tkos.co.il>
Message-ID: <10286088-bb25-4728-5a62-fb26ca6bece4@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 06/07/2017 ? 06:16, Baruch Siach a ?crit :
> Hi Romain,
> 
> On Wed, Jul 05, 2017 at 04:10:28PM +0200, Romain Naour wrote:
>> incdefs.sh try to define some flags based on some build tests and
>> by checking a kernel header. It doesn't work well while cross-compiling.
> 
> Can you elaborate on why that doesn't work with cross compiling? Since commit 
> 85bf5750fe641 (linuxptp: don't check host headers for target features), 
> incdefs.sh only searches the target headers.
> 

Sure.

Indeed you patch fixes the first issue but there is another one when
KBUILD_OUTPUT is empty:

see this line in the log file:
grep: /usr/include/linux/net_tstamp.h: No such file or directory

It means that the kernel_flags() check is looking at the kernel headers
installed on the host. When no kernel headers are installed on the host,
HAVE_ONESTEP_SYNC is not set on the command line so the missing.h define
HWTSTAMP_TX_ONESTEP_SYNC which is also present in the kernel headers installed
in STAGING_DIR (toolchain w/ headers >= 3.2).

error: redeclaration of enumerator 'HWTSTAMP_TX_ONESTEP_SYNC'

I'll send a v2 shortly.

Best regards,
Romain
