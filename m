From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 4 Mar 2021 22:42:48 +0100
Subject: [Buildroot] [PATCH] package/libopenssl does not support riscv32
In-Reply-To: <12e04566-0852-7096-c65d-ba1795b3f277@mind.be>
References: <20210304111432.1787074-1-yann.morin.1998@free.fr>
 <12e04566-0852-7096-c65d-ba1795b3f277@mind.be>
Message-ID: <20210304214248.GO2275@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2021-03-04 20:36 +0100, Arnout Vandecappelle spake thusly:
> On 04/03/2021 12:14, Yann E. MORIN wrote:
> 
> > Drop the default from the choice selection; it was anyway superfluous:
> > the default of a choice, if left unspecified, is the first entry of the
> > choice.
>  Bikeshedding time!

Aha! ;-)

>  IMHO, it is still good to have an explicit default. Its effect remains exactly
> the same (if the default cannot be selected due to missing dependencies, the
> first available options will be chosen), but it makes it clear for the reader
> what is the default, and it makes sure that inserting a new option or reordering
> the options doesn't affect the default.

OK, I see and understand your point.

Still, defaults are cumbersome to manage when said default gains or
loses dependencies; that's another location where we need to track
those...

Besides, the probability tht we gain a third implementation of openssl
is... slim. Very slim...

So, I would still drop the default here.

> [snip]
> >  config BR2_PACKAGE_HOSTAPD_WPA3
> >  	bool "Enable WPA3 support"
> > +	depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
>  We normally add a comment of depends on. But I guess it's pretty obvious here.

Yes, it is pretty obvious. So much so that it really does not warrant a
comment, because it is really is overloading.

> >  	select BR2_PACKAGE_OPENSSL
> >  	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
> >  	help
> 
> [snip]
> > diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
> > index 2fc56dbd76..b1ab00dd38 100644
> > --- a/package/tpm2-tss/Config.in
> > +++ b/package/tpm2-tss/Config.in
> > @@ -1,6 +1,7 @@
> >  config BR2_PACKAGE_TPM2_TSS
>  Unfortunately, TPM2_TSS is selected by ima-evm-utils, tpm2-abrmd, tpm2-pkcs11,
> tpm2-tools, tpm2-totp. Fortunately, it doesn't recurse any further.

Ah, right, well spotted. I was not carefull enough on that one.

>  With the propagation of the TPM2_TSS dependency (and for those, a comment
> *should* be added),

s/should/must/

> you can add my
> 
>  Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> and apply directly to master.

Since you did not insist on keeping the default as a condition for your
rev-by tag, I'll still drop it. ;-)

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
