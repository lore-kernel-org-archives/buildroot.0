From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Dec 2012 20:35:43 +0100
Subject: [Buildroot] [PATCH] package/crosstool-ng: update to 1.17.0
In-Reply-To: <201212041909.25267.yann.morin.1998@free.fr>
References: <1354564065-24388-1-git-send-email-c.schoenert@t-online.de>
 <1354564065-24388-2-git-send-email-c.schoenert@t-online.de>
 <20121204101228.2e78f9a1@skate>
 <201212041909.25267.yann.morin.1998@free.fr>
Message-ID: <20121204203543.2e75e44b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 4 Dec 2012 19:09:24 +0100, Yann E. MORIN wrote:

> > Thanks for doing this work. I think ct-ng now supports minimal
> > defconfig files. Would it make sense to use that instead of
> > full .config files in order to reduce the amount of churn when
> > updating between ct-ng versions? Yann?
> 
> Indeed, but the defconfig support in crosstool-NG is not perfect yet,
> so I think we should keep complete .config files for this release.
> 
> The problem with defconfigs in crosstool-NG is that there is no
> guarantee about new symbols coming and going between versions, so
> this can result in strange behaviors when a new version comes out,
> and a defconfig from a previous version is used. Here's what may
> happen:
> 
> In version X, we use the latest stable 3.6 linux kernel, which is
> 3.6.2. This is also the absolute latest version of the kernel. So we
> have this symbol: LINUX_VER_3_6_2
> 
> The user did select this version. As 3.6.3 is the latest version, it
> is the first item in the choice, so it does not appear in the
> defconfig, being the default of the choice.
> 
> Now, version X+1 is out, and the stable 3.6 kernel is updated to
> 3.6.7, so we get a new symbol, but the previous one no longer exists.
> Also, kernel 3.7 is out, so the 3.6.7 is not the latest version
> available.
> 
> Now, the default symbol in the choice is not 3.6.x, but 3.7.x, which
> is probably not what the user expected.
> 
> Thus, using the defconfig from the previous version will yield a
> completely different .config.
> 
> This can be even more anoying with the gcc version, as we only have
> one linaro release per gcc /generation/ (eg. 4.7). If the user did
> select the latest linaro version (eg. 4.7) which was the default of
> the choice, qnd the new release has a more recent mainstream version
> (eg. 4.8), but no corresponding linaro version, then the gcc version
> will be bumnped to 4.8, when the user did in fact want the linaro 4.7.
> 
> I have a pending change to fix this issue for all components, but it
> will go in only for the next release, and that shall make using
> defconfigs from a previous version relatively safe to use with a
> newer version.
> 
> Then, we can switch buildroot to using the ct-ng defconfigs, but until
> then I think it is safer to use full .config files.

To me, it is also the point of using defconfig from the first place: to
benefit from the new default values for configuration options that we
leave undefined.

Note that the crosstool-ng.config-* don't necessarily need to be pure
defconfig files: you can add a few explicit options, whose value is
currently the default one, but since you don't want them to change to
newer default values, you explicit their value in the defconfig. We
have this for a few options in Buildroot defconfig files as well.

defconfig files do not necessarily need to be the direct output of
"savedefconfig", they can be hand-edited to enforce the value of
certain options.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
