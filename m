From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Jan 2019 16:58:27 +0100
Subject: [Buildroot] [PATCH v2 6/7] tpm2-tools: do not enforce
 dependency on tpm2-abrmd
In-Reply-To: <875zuog74i.fsf@dell.be.48ers.dk>
References: <20190115101522.21042-1-peter@korsgaard.com>
 <20190115101522.21042-6-peter@korsgaard.com>
 <20190115204308.GB2556@scaer> <875zuog74i.fsf@dell.be.48ers.dk>
Message-ID: <20190117155827.GD2556@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2019-01-16 12:43 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > Peter, All,
>  > On 2019-01-15 11:15 +0100, Peter Korsgaard spake thusly:
>  >> tpm2-tools is commonly used with the resource manager, tpm2-abrmd - But it
>  >> CAN be used without, E.G.  by setting the TPM2TOOLS_TCTI_NAME environment
>  >> variable to communicate directly with the kernel driver:
>  >> 
>  >> export TPM2TOOLS_TCTI_NAME=device
>  >> 
>  >> For some use cases (E.G.  initramfs) it makes sense to use tpm2-tools
>  >> without abrmd, so downgrade the dependency from select to imply, so abrmd is
>  >> enabled by default but can be explicitly disabled.
>  >> 
>  >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>  >> ---
>  >> package/tpm2-tools/Config.in | 2 +-
>  >> 1 file changed, 1 insertion(+), 1 deletion(-)
>  >> 
>  >> diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
>  >> index cc87e2a1bf..f4622b4ec9 100644
>  >> --- a/package/tpm2-tools/Config.in
>  >> +++ b/package/tpm2-tools/Config.in
>  >> @@ -8,7 +8,7 @@ config BR2_PACKAGE_TPM2_TOOLS
>  >> select BR2_PACKAGE_LIBCURL
>  >> select BR2_PACKAGE_LIBGLIB2
>  >> select BR2_PACKAGE_OPENSSL
>  >> -	select BR2_PACKAGE_TPM2_ABRMD # run-time
>  >> +	imply BR2_PACKAGE_TPM2_ABRMD # run-time
> 
>  > Sorry, but I reiterate my position: I don't like the use of 'imply'.
> 
>  > Either the thing is mandatory, in which case we select it or depend on
>  > it, or the thing is optional, in which case we elt the user enable it.
> 
> I understand you don't like it, but what is the alternative? Just
> mention the optional-but-likely-to-be-needed dependency in the help
> text? That is IMHO worse than imply.

> For this specific case, tpm2-tools fails with a somewhat confusing error
> message if tpm2-abrmd isn't available unless a specific command line
> option / environment variable is used:
> 
> # tpm2_pcrlist
> 
> ** (process:8628): WARNING **: 11:38:39.606: Failed to create connection with service: GDBus.Error:org.freedesktop.DBus.Error.ServiceUnknown: The name com.intel.tss2.Tabrmd was not provided by any .service files
> ERROR: Failed to initialize TABRMD TCTI context: 0xa0008
> 
> The solution is to set the TCTI name to device, either through the
> TPM2TOOLS_TCTI_NAME environment variable or the --tcti option.

Well, this is very clearly explained in the man page for tpm2_pcrlist. ;-)

And it turns out that the use of tpm2-abrmd is in fact totally unneeded,
even to get proper concurrent access, when using the in-kernel manager
exposed as /dev/tmprmN (so says the man page). So, in this case, a
userland daemon is not even needed to begin with.

But since any person not completely insane would still want it, then it
should stay a select. The very minor minority who really, like
really-really, do not want tpm2-abrmd can still remove it with a
post-build script.

> This is imho exactly the kind of use cases imply has been made for.

I still think its semantics are much more fuzzy than select or depends-on,
and it can cause confusion.

Also, I'm still on the side that I prefer the user to know what they are
doing rather than us baby-sitting them.

>  > Use of imply does not sound nice to me, because it is not authoritative.
>  > I'm afraid we get reports of users complaining that "sometimes the stuff
>  > is enabled when I do X, while sometmes it is not enabled when I do the
>  > same X.'
> 
> Is that any different than changing toolchain options or toggling
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS?

Sorry, I don't follow you. When you toggle those options, they always do
the same thing.

But with imply, if you do something like:

    make distclean
    make menuconfig
        --> enable tpm2-tools

Then tpm2-abrmd is enabled.

But if you now go with:

    make distclean
    make defconfig
    make menuconfig
        --> enable tpm2-tools

Then tpm2-abrmd is not enabled, because it was already disabled in the
.config.

So, this is more confusing than anything else to me, because "sometimes
it works, sometimes it does not".

Whereas, the toolchain options or the busybox-show-others will always do
the same thing.

>  > The coutner argument has been that we were now trying to make sensible
>  > choices for the user, so that things "work out of the box". My position
>  > is that it is an illusion, because making things "just work" is more
>  > often than not more involving than just enabling a package.
> 
> I agree that we probably cannot do this perfectly, but a solution for
> E.G. 80% of the use cases is still an improvement, as long as the
> remaining 20% can still change things.
> 
>  > For example, when dealing with TPM and such: keys and certs provisionning
>  > and checking the chain of trust and such is only scratching the surface.
>  > People that want to deal with this topic better know what they *are* doing,
>  > as it is a sensible topic. Those people will have to understand what they
>  > need if they do not already know.
> 
> Sure, but we can atleast ensure that the tpm2-tools utilites do not fail
> out of the box because of a missing obscure dependency and that fairly
> common use cases are possible.

If you go that route, then you must ensure that the kernel has TPM
support configured in. That is, for the kernel we build; we're leaving
out in the cold those who build their kernel out of Buildroot...

Yes, tangential...

So, as usual, that's my opinion.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
