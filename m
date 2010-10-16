From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sat, 16 Oct 2010 14:34:34 +0200
Subject: [Buildroot] [PATCH] Makefile: generate a Makefile wrapper in
 $(O)
In-Reply-To: <1285491372-19364-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1285491372-19364-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1287232474.3927.190.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

I'm having a problem with the last buildroot on git. I'm not sure this
is related to your patches.
In a clean buildroot repository (no output directory already present),
if you do :
	$ make menuconfig 

The .config files are created in the root of the buildroot tree instead
of in the output/ directory.

I might be wrong, but I was used to the second behavior.
Could you check this isn't a problem introduced by your patches ?
Otherwise I will try figure this out later.

Thanks,

--
Lionel Landwerlin

Le dimanche 26 septembre 2010 ? 10:56 +0200, Yann E. MORIN a ?crit :
> If building out-of-tree, add a Makefile wrapper that calls-out to the real
> Makefile with proper args.
> 
> Avoids having to pass -C and O= every time we call make.
> 
> This is highly inspired from how the Linux kernel does it, and portions of
> it have been used. We can't use exactly the same implementation as the
> kernel does, because:
> 
>  - the kernel always overwrites the wrapper at each call: doing so in
>    buildroot makes the kconfig stuff be rebuilt every time;
> 
>  - the script writing the wrapper has been expunged of the few lines
>    that were too kernel-related: in buildroot we do not need the version
>    string in the wrapper, and we do not have a patchlevel version;
> 
>  - "in-tree build" does not have the same meaning for the kernel and for
>    buildroot: for the kernel, $(O) point to the $(TOPDIR), while for
>    buildroot $(O) points to $(TOPDIR)/output.
> 
> For more complete explnanations, see:
>   http://lists.busybox.net/pipermail/buildroot/2010-September/037815.html
