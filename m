From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 5 Jan 2020 20:23:48 +0100
Subject: [Buildroot] [Bug 12441] qt5webengine build error: asm/errno.h:
 No such file or directory
In-Reply-To: <bug-12441-163-ZJAE0X3iGy@https.bugs.busybox.net/>
References: <bug-12441-163@https.bugs.busybox.net/>
 <bug-12441-163-ZJAE0X3iGy@https.bugs.busybox.net/>
Message-ID: <5569e07a-bdc0-de9e-68ad-ca6f3740e990@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 [Taking this to the list since it's more discussion now than a bug report]

On 04/01/2020 08:56, bugzilla at busybox.net wrote:
> https://bugs.busybox.net/show_bug.cgi?id=12441
> 
> Yann E. MORIN <yann.morin.1998@free.fr> changed:
> 
>            What    |Removed                     |Added
> ----------------------------------------------------------------------------
>                  CC|                            |yann.morin.1998 at free.fr
> 
> --- Comment #8 from Yann E. MORIN <yann.morin.1998@free.fr> ---
> Thanks for the report and the investigation. :-)
> 
> Note: sometimes, a package will need to build its own tools
> during the build (e.g. to generate a table of values), and
> those tools are built with the host compiler. Hence the
> error. But qt5webengine already selects BR2_HOSTARCH_NEEDS_IA32_COMPILER
> when needed, so this is strange...

 There was a 32-bit compiler installed, but it was incomplete (libc6-dev:i386
missing). The following would work:

int main() { return 0; }

because it doesn't need anything other than the compiler, but the following doesn't:

#include <errno.h>
int main() { return -ENOENT; }

because it needs the kernel headers.

 So I think we should extend our check in dependencies.sh.


 Regards,
 Arnout
