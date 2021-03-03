From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Mar 2021 11:34:15 +0100
Subject: [Buildroot] [PATCH] package/openssl: fix build on riscv32
In-Reply-To: <878s74lnhs.fsf@dell.be.48ers.dk>
References: <20210302215147.1556308-1-yann.morin.1998@free.fr>
 <878s74lnhs.fsf@dell.be.48ers.dk>
Message-ID: <20210303103415.GL2275@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-03-03 08:12 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > riscv32 is (surprise!) a 32-bit architecture. But it has been 2038-safe
>  > from its inception. As such, there is no legacy binaries that may use
>  > the 32-bit time syscalls, and thus they are anot available on riscv32.
> 
>  > Code tht directly calls to the syscalls without using the C libraries
>  > wrappers thus need to handle this case by themselves.
> 
>  > Backport a patch from the upstream development branch that will
>  > eventually be openssl 3.0, but has not yet been backported to the 1.1.1
>  > stable branch.
> 
>  > Fixes:
>  >     http://autobuild.buildroot.org/results/eb9/eb9a64d4ffae8569b5225083f282cf87ffa7c681/
>  >     ...
>  >     http://autobuild.buildroot.org/results/07e/07e413b24ba8adc9558c80267ce16dda339bf032/
> 
>  > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>  > Cc: Matt Weber <matthew.weber@rockwellcollins.com>
>  > Cc: Mark Corbin <mark@dibsco.co.uk>
> 
> Did you see Arndbs comment on the upstream commit?
> 
> https://github.com/openssl/openssl/commit/5b5e2985f355c8e99c196d9ce5d02c15bebadfbc
> 
> I cannot quite figure out if this causes issues for other archs?

Indeed, in light of the comment by Arnd, this patch looks a bit fishy.

Thus, I've now reverted it.

However, what should we do now?

The failing engine is not optional; it is always built (i.e. we can't
make BR2_PACKAGE_LIBOPENSSL_ENGINES depends on !riscv32).

A quick solution is to make libopenssl depends on !riscv32. This is not
very satisfying, especially because of BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
to which we should propagate the dependency; that's 5 packages: hostapd,
ibm-sw-tpm2, softether, tpm2-tss, wpa_suplicant (for mesh networking and
for wpa3), so not totally unfesasible either, but still... :-/

Thoughts?

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
