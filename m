From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Nov 2017 09:19:00 +0100
Subject: [Buildroot] [PATCH v4 1/1] package/libssh2: Add selectable
 crypto libraries
In-Reply-To: <87tvy92lyy.fsf@dell.be.48ers.dk>
References: <1509553376-43168-1-git-send-email-sam.voss@rockwellcollins.com>
 <9271f8cc-651b-e302-f82c-9e44a0af24d4@mind.be>
 <87tvy92lyy.fsf@dell.be.48ers.dk>
Message-ID: <20171105081900.GC2996@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2017-11-05 09:01 +0100, Peter Korsgaard spake thusly:
> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>  > On 01-11-17 17:22, Sam Voss wrote:
[--SNIP--]
> >> +++ b/package/libssh2/Config.in
>  >> @@ -1,6 +1,5 @@
>  >> config BR2_PACKAGE_LIBSSH2
>  >> bool "libssh2"
>  >> -	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_MBEDTLS || BR2_PACKAGE_LIBGCRYPT)
>  >> help
>  >> libssh2 is a client-side C library implementing the SSH2
>  >> protocol as defined by Internet Drafts: SECSH-TRANS(22),
>  >> @@ -8,3 +7,26 @@ config BR2_PACKAGE_LIBSSH2
>  >> SECSH-FILEXFER(06)*, SECSH-DHGEX(04), and SECSH-NUMBERS(10)
>  >> 
>  >> http://www.libssh2.org/
>  >> +
>  >> +if BR2_PACKAGE_LIBSSH2
>  >> +
>  >> +choice
>  >> +	prompt "Crypto Backend"
>  >> +	help
>  >> +	  Select crypto library to be used in libssh2.
>  >> +
>  >> +config BR2_PACKAGE_LIBSSH2_MBEDTLS
>  >> +	bool "mbedtls"
>  >> +	select BR2_PACKAGE_MBEDTLS
> 
>  >  Note that this changes the defaults we had previously. If openssl was already
>  > selected and you select libssh2, then openssl would be used as a backend. Now,
>  > the default is mbedtls, so if you don't take any action, it will be mbedtls.
> 
>  >  This does affect people updating Buildroot, so it needs to be mentioned in CHANGES.
> 
> Why don't we just keep the old logic instead? E.G. leave the select
> openssl if !(mbedtls || libgcrypt) and then change the selects to
> depends on in the choice:
> 
> choice
> 
> config BR2_PACKAGE_LIBSSH2_MBEDTLS
>        bool "mbedtls"
>        depends on BR2_PACKAGE_MBEDTLS
> 
> ...
> 
> Doesn't that give us the best of both worlds? Same behaviour as before
> by default and still the option to explicitly chose when multiple
> backends are available?

That's what Sam did in the initial iterations of his patchset, but
Arnout and Thomas (IIRC) both requested he replaces that with a select
instead.

Regards,
Yann E. MORIN.

> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
