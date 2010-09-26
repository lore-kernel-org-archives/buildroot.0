From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 26 Sep 2010 23:48:28 +0200
Subject: [Buildroot] [PATCH] Makefile: generate a Makefile wrapper in
	$(O)
In-Reply-To: <1285491372-19364-1-git-send-email-yann.morin.1998@anciens.enib.fr>
	(Yann E. MORIN's message of "Sun, 26 Sep 2010 10:56:12 +0200")
References: <1285491372-19364-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <8739sw41n7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> If building out-of-tree, add a Makefile wrapper that calls-out to the real
 Yann> Makefile with proper args.

 Yann> Avoids having to pass -C and O= every time we call make.

 Yann> This is highly inspired from how the Linux kernel does it, and portions of
 Yann> it have been used. We can't use exactly the same implementation as the
 Yann> kernel does, because:

 Yann>  - the kernel always overwrites the wrapper at each call: doing so in
 Yann>    buildroot makes the kconfig stuff be rebuilt every time;

Huh? We do call mkmakefile every time, but you do the extra trick about
.Makefile (why?). I guess the reason why you have the kconfig stuff
rebuilding is that you added the phony outputmake dependency to the
kconfig binaries rather than the phony menuconfig/oldconfig/.. targets.

 Yann>  - the script writing the wrapper has been expunged of the few lines
 Yann>    that were too kernel-related: in buildroot we do not need the version
 Yann>    string in the wrapper, and we do not have a patchlevel version;

 Yann> +
 Yann> +ifeq ($(NEED_WRAPPER),y)
 Yann> +# outputmakefile generates a Makefile in the output directory, if using a
 Yann> +# separate output directory. This allows convenient use of make in the
 Yann> +# output directory.
 Yann> +outputmakefile:
 Yann> +	$(Q)$(SHELL) $(TOPDIR)/scripts/mkmakefile $(CURDIR) $(O)
 Yann> +else
 Yann> +outputmakefile:
 Yann> +	@true
 Yann> +endif

A makefile target without any rules is OK, so you could get rid of the
true. We use TOPDIR everywhere else instead of CURDIR, so I would prefer
to use it here. It also makes more sense to make mkmakefile executable
and get rid of the SHELL.

 Yann> +
 Yann> +if ! cmp $2/.Makefile $2/Makefile >/dev/null 2>&1; then
 Yann> +    echo "  GEN    Makefile"
 Yann> +    rm -f $2/Makefile
 Yann> +    mv $2/.Makefile $2/Makefile
 Yann> +else
 Yann> +    rm -f $2/.Makefile
 Yann> +fi

I would prefer to stick as close as possible to the version in the
kernel sources, so I'll remove this. What is the reason for it? You
already created the Makefile, so it cannot be because of performance.

I've committed a slightly tweaked version of it, thanks.

-- 
Bye, Peter Korsgaard
