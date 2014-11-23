From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 23 Nov 2014 08:02:12 +0200
Subject: [Buildroot] [PATCH] infra: do not append an empty
	LD_LIBRARY_PATH
In-Reply-To: <1416610416-27914-1-git-send-email-yann.morin.1998@free.fr>
References: <1416610416-27914-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20141123060212.GG2374@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Fri, Nov 21, 2014 at 11:53:36PM +0100, Yann E. MORIN wrote:
> When we set LD_LIBRARY_PATH when building our host tools, we append any
> pre-existing value to our custom path:
>         LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)"
> 
> But then if LD_LIBRARY_PATH was previously empty, we end up with an
> LD_LIBRARY_PATH that ends with a colon.
> 
> Also, when we check that an existing LD_LIBRARY_PATH does not contain
> CWD, we previously did not look for a zero-length prefix.
> 
> Since 'man ld.so' says of LD_LIBRARY_PATH:
>     A colon-separated list of directories in which to search for ELF
>     libraries at execution-time. Similar to the PATH environment
>     variable.
> 
> And POSIX states about PATH:
>     A zero-length prefix is a legacy feature that indicates the current
>     working directory.
> 
> And bash also recognises a zero-length prefix to searh in CWD:
>     A zero-length (null) directory name in the value of PATH indicates
>     the current directory.
> 
> We may thus end up on a system where a zero-length prefix in
> LD_LIBRARY_PATH is interpreted as VWD.

s/VWD/CWD/

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
