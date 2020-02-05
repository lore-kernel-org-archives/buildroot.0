From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Feb 2020 16:10:03 +0100
Subject: [Buildroot] [PATCH] linux/linux.hash: remove hash for COPYING
In-Reply-To: <20200204231310.22132-1-mmayer@broadcom.com>
References: <20200204231310.22132-1-mmayer@broadcom.com>
Message-ID: <20200205151003.GD3131@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus, All,

On 2020-02-04 15:13 -0800, Markus Mayer spake thusly:
> The hash for "COPYING" changed between v4.16 and v4.17. Since kernels
> before and after the change are supported, storing the hash for this
> file will cause an error during "make legal-info" when a kernel with the
> respective other hash is being used.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>

After discussing this at the devdays today, I've reworked it with
another solution which allows us to notice those changes in the future:
the license files are only added for the latest known version.

I've also applied the same semantic to other packags that would exhibit
the same problem.

http://lists.busybox.net/pipermail/buildroot/2020-February/thread.html#273348

Thanks for the report! :-)

Regards,
Yann E. MORIN.

> ---
> 
> One way to reproduce the problem:
> 
> 1) Download and extract
>    https://mirrors.edge.kernel.org/pub/linux/kernel/v4.x/linux-4.9.212.tar.xz
> 2) Configure buildroot as usual
> 3) Point LINUX_OVERRIDE_SRCDIR to the 4.9.212 directory created above
> 4) make && make legal-info
> 
> [...]
> >>> linux-tools  Collecting legal info
> >>> linux custom Collecting legal info
> ERROR: COPYING has wrong sha256 hash:
> ERROR: expected: ee5808b032a67f587d3541099d46de34f5bec8cd5976114ba07f1299ee6001ff
> ERROR: got     : af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> linux/linux.mk:606: recipe for target 'linux-legal-info' failed
> 
>  linux/linux.hash | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/linux/linux.hash b/linux/linux.hash
> index 940a90ed9dea..289171987aa1 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -8,4 +8,3 @@ sha256 be26156abdb38ac0576a34a235ef456bb8ca67fbbe56fc6649b8d069159f8bc4  linux-4
>  # Locally computed
>  sha256 6d60ce76bce2e1938f64027d12b1988c95245751feb635adfc551a021d5b3f26  linux-cip-4.19.88-cip16.tar.gz
>  sha256 74ec782e11344e5c5db8e48899b464e296ef37acfb43ce7dfb01c09ea8d3e959  linux-cip-4.19.82-cip14-rt5.tar.gz
> -sha256 ee5808b032a67f587d3541099d46de34f5bec8cd5976114ba07f1299ee6001ff  COPYING
> -- 
> 2.17.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
