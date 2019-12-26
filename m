From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2019 15:49:01 +0100
Subject: [Buildroot] Potential lurking issue with host rpaths
In-Reply-To: <20191225151351.GO26395@scaer>
References: <20191225151351.GO26395@scaer>
Message-ID: <20191226154901.66683ec5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 Dec 2019 16:13:51 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> - without PPD
>   - libfoo not installed on the host system
>     - host-libfoo built before host-bar
>       - bar links to libfoo
>         - bar has an RPATH for another lib
>           => OK  
>         - bar does not have an RPATH for another lib
>           -> check-host-rpath errors out for host-bar
>           => OK  
>     - host-libfoo built after host-bar
>       -> bar not linked to libfoo
>       => OK  
> 
>   - libfoo installed on the host system
>     - host-libfoo built before host-bar
>       - bar links to host-libfoo
>         - bar has an RPATH for another lib
>           => OK  
>         - bar does not have an RPATH for another lib
>           -> check-host-rpath errors out for host-bar
>           => OK  
>     - host-libfoo built after host-bar
>       - bar links to system libfoo
>         - bar has an RPATH for another lib
>           -> check-host-rpath OK for both host-bar and host-libfoo
>           -> error at runtime: bar uses host-libfoo instead of system  
>              libfoo
>           => KO, MISSED  

True, but I'm not sure what we can do here. The only thing we can do is
to add all the appropriate --disable-<foo> options to make sure host-bar
doesn't link with any optional library that we don't have as a
dependency.

> - with PPD
>   - libfoo not installed on the host system
>     -> bar never linked to libfoo
>     => OK  
> 
>   - libfoo installed on the host system
>     -> bar always linked to system libfoo  
>       - bar has an RPATH for another lib
>         -> check-host-rpath OK for host-bar
>         -> error at runtime: bar uses host-libfoo instead of system  
>            libfoo, *but* only once the final, complete host directory
>            has been aggregated
>         => KO, MISSED  

Absolutely. This is indeed a weird thing with the PPD stuff: during the
build of Buildroot, we are never using what is going to be the final
SDK. I'm not sure what we can do about it though, except as suggested
above, ensures we have as much as possible the appropriate
--disable-<foo>, but obviously this is never going to be perfect: new
optional dependencies are going to be added by upstream, and we will
not notice them.

A (crazy?) idea is perhaps to check against which libraries host
binaries/libraries end up being linked with. They should only be linked
against:

 - Other libraries in HOST_DIR

 - A small reduced set of system libraries, which we could have a
   whitelist (libc, libm, librt, libgcc_s, libatomic, etc.).

If one of our host program links against something else from the host
system, then it is not good, and we should error out. At least this
would allow us to *detect* such issues, and hopefully thanks to that
add the appropriate --disable-<foo> options where needed. The user
would also be clearly notified that there is something not good going
on with one of the host packages.

Other ideas ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
