From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 21:38:34 +0200
Subject: [Buildroot] [PATCH master+LTS] package/libopenssl: fix target
 architecture for MIPS64n32
In-Reply-To: <20200619065033.8982-1-patrickdepinguin@gmail.com>
References: <20200619065033.8982-1-patrickdepinguin@gmail.com>
Message-ID: <20200620213834.290a24ce@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 19 Jun 2020 08:50:33 +0200
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Commit 1ebb35ee5fb7bd5e6278a84ac2c18aa0a38056fb changed the libopenssl
> target architecture to 'linux-generic64' for 64-bit archs based on
> BR2_ARCH_IS_64. However, MIPS64n32 has BR2_ARCH_IS_64 set, but is a 32-bit
> ABI. On such board, libopenssl needs to be configured with linux-generic32
> to function properly.
> 
> One symptom of this problem is that ssh-keygen hangs on key generation,
> waiting for more random bits. See [1] for the discussion with openssl
> upstream.
> 
> Thanks to Ronny Meeus for investigating the issue and kudos to the openssl
> community for their responsive and helpful interaction!
> 
> Reported-by: Ronny Meeus <ronny.meeus@nokia.com>
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> [1] https://mta.openssl.org/pipermail/openssl-users/2020-June/012565.html
> ---
>  package/libopenssl/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks a lot for the investigation and fix! I've applied as-is as it is
the most immediate fix.

However, I am wondering if we shouldn't make BR2_MIPS_NABI32 *not*
select BR2_ARCH_IS_64. Indeed, for most packages (which are running
userspace code), mips64n32 *is* a 32-bit architecture.

We could make that even clearer by having a BR2_KERNEL_ARCH_IS_64, if
there's anything that needs to know at the kernel level the bitness.

But it overall feels incorrect for BR2_MIPS_NABI32 to select
BR2_ARCH_IS_64.

What do you think ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
