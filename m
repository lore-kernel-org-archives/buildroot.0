From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2015 19:22:02 +0100
Subject: [Buildroot] [PATCHv2] core/printvars: allow dumping a set of
 variables
In-Reply-To: <1446673359-10358-1-git-send-email-yann.morin.1998@free.fr>
References: <1446673359-10358-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20151129192202.4cb70536@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed,  4 Nov 2015 22:42:39 +0100, Yann E. MORIN wrote:
> Dumping our 176164 variables can take quite some time (~12s here). What
> takes the most time is sorting the variables (~9s), followed by the
> parsing of our Makefiles (~3s), with the actual printing in the noise.
> 
> However, sometimes only one or a few variables are needed. For example,
> one may want to retrieve the Linux build dir from a post-build hook (to
> get the Linux' actual .config after our fixups and check for various
> features).
> 
> Add the possibility to only dump the variables listed in $(VAR) which
> must be passed as a make argument, like so:
> 
>     $ make -s printvars VARS="LINUX_DIR TOPDIR O"
>     LINUX_DIR=/home/ymorin/dev/buildroot/O/build/linux-4.3 ($(BUILD_DIR)/$(LINUX_BASE_NAME))
>     O=/home/ymorin/dev/buildroot/O/. (/home/ymorin/dev/buildroot/O/.)
>     TOPDIR=/home/ymorin/dev/buildroot/buildroot (/home/ymorin/dev/buildroot/buildroot)
> 
> It is also possible to use make-appterns, like:
> 
>     $ make -s printvars VARS="BUSYBOX_%"
> 
> This is much faster (the time is just about the time it takes to parse
> our Makefiles, 3s here) and easier to parse.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> ---
> Changes v1 -> v2;
>   - accept make-patterns  (Thomas)
> ---
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

I've applied to next, after slightly improving the comment above the
printvars target. It is now:

# printvars prints all the variables currently defined in our
# Makefiles. Alternatively, if a non-empty VARS variable is passed,
# only the variables matching the make pattern passed in VARS are
# displayed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
