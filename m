From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 28 Sep 2010 18:36:39 +0200
Subject: [Buildroot] [PATCH] Makefile: generate a Makefile wrapper in
	$(O)
In-Reply-To: <8739sw41n7.fsf@macbook.be.48ers.dk>
References: <1285491372-19364-1-git-send-email-yann.morin.1998@anciens.enib.fr>
	<8739sw41n7.fsf@macbook.be.48ers.dk>
Message-ID: <201009281836.39856.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 26 September 2010 23:48:28 Peter Korsgaard wrote:
>  Yann>  - the kernel always overwrites the wrapper at each call: doing so in
>  Yann>    buildroot makes the kconfig stuff be rebuilt every time;
> Huh? We do call mkmakefile every time, but you do the extra trick about
> .Makefile (why?). I guess the reason why you have the kconfig stuff
> rebuilding is that you added the phony outputmake dependency to the
> kconfig binaries rather than the phony menuconfig/oldconfig/.. targets.

Ah, right, most probably.

>  Yann>  - the script writing the wrapper has been expunged of the few lines
>  Yann>    that were too kernel-related: in buildroot we do not need the version
>  Yann>    string in the wrapper, and we do not have a patchlevel version;
> 
>  Yann> +
>  Yann> +ifeq ($(NEED_WRAPPER),y)
>  Yann> +# outputmakefile generates a Makefile in the output directory, if using a
>  Yann> +# separate output directory. This allows convenient use of make in the
>  Yann> +# output directory.
>  Yann> +outputmakefile:
>  Yann> +	$(Q)$(SHELL) $(TOPDIR)/scripts/mkmakefile $(CURDIR) $(O)
>  Yann> +else
>  Yann> +outputmakefile:
>  Yann> +	@true
>  Yann> +endif
> 
> A makefile target without any rules is OK, so you could get rid of the
> true.

The issue with an no-rule target is that it is considered to be always re-done.
But that's no issue now the kconfig is not re-built every time.

> We use TOPDIR everywhere else instead of CURDIR, so I would prefer 
> to use it here.

I see. I used CURDIR as this is set by make, so it is sure set. But TOPDIR
is better indeed, as it makes it homogenous with the rest of the Makefiles.

> It also makes more sense to make mkmakefile executable 
> and get rid of the SHELL.

I used $(SHELL) because I was too often bitten by scripts that lacked the
execution bit set. Using $(SHELL) is a way to not care about it.

>  Yann> +
>  Yann> +if ! cmp $2/.Makefile $2/Makefile >/dev/null 2>&1; then
>  Yann> +    echo "  GEN    Makefile"
>  Yann> +    rm -f $2/Makefile
>  Yann> +    mv $2/.Makefile $2/Makefile
>  Yann> +else
>  Yann> +    rm -f $2/.Makefile
>  Yann> +fi
> I would prefer to stick as close as possible to the version in the
> kernel sources, so I'll remove this. What is the reason for it? You
> already created the Makefile, so it cannot be because of performance.

It was in order not too touch the wrapper in case it did not change, so
the kconfig was not rebuilt. With the new dependencies you fixed, it is
indeed no longer needed, and we can always overwrite it.

> I've committed a slightly tweaked version of it, thanks.

Thank you for the fixes! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
