From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 6 May 2018 22:26:41 +0200
Subject: [Buildroot] [PATCH] binutils: replace hard-links with
 soft-links to fix rpath
In-Reply-To: <876040pmgy.fsf@dell.be.48ers.dk>
References: <20180422122350.16293-1-thomas.petazzoni@bootlin.com>
 <876040pmgy.fsf@dell.be.48ers.dk>
Message-ID: <20180506222641.6c1d4dc7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 06 May 2018 22:18:05 +0200, Peter Korsgaard wrote:

>  > binutils installs its binaries both as bin/<tuple>-<tool> and as
>  > <tuple>/bin/<tool>, and hardlinks are used to reduce disk space
>  > consumption. This causes a problem for host-binutils with our rpath
>  > fixing logic done by "make sdk".  
> 
>  > Indeed, the fix-rpath script starts by fixing up the rpath of
>  > bin/<tuple>-<tool>, and sets the RPATH to $ORIGIN/../lib/. Then
>  > fix-rpath moves on to <tuple>/bin/<tool>, and doesn't find the library
>  > the tool depends on, and clears the RPATH. The result is that the
>  > binutils tool are not usable.  
> 
>  > Note that this is only visible currently on the ARC architecture,
>  > because on this architecture, binutils is fetched from git, which
>  > causes host-flex to be built, and some binutils tools to use the libfl
>  > shared library. Therefore, the binutils tools don't use just the
>  > standard C library (which is provided by the system) but also libfl
>  > from $(HOST_DIR)/lib, and therefore if the RPATH isn't set correctly,
>  > those tools don't work properly.  
> 
>  > In order to address this, this comit adds a post-install hook to
>  > host-binutils that replaces those hard links by symbolic links. It is
>  > worth mentioning that library loading and RPATH usage occurs *after*
>  > resolving the symbolic links, which makes this solution work.  
> 
>  > Fixes:  
> 
>  >   http://autobuild.buildroot.net/results/b2562b05d397d4e1ffe0f8d2f4ce4c84ab6feae1/  
> 
>  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>  
> 
> Committed, thanks.

Hum, I think Yann had some second thoughts about this patch. He was not
able to reproduce the binutils tools being linked to libfl, and it also
isn't clear why they get linked to libfl in the first place.

So, the problem is real, this patch works around it, but there's still
a bit of mystery.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
