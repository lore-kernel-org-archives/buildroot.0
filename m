From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 20 Sep 2018 23:48:59 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] brltty: use gcc instead of ld to link shared objects
In-Reply-To: <20180920210109.179978c4@windsurf>
References: <20180920172809.19993-1-fontaine.fabrice@gmail.com>
 <20180920210109.179978c4@windsurf>
Message-ID: <CAPi7W81sP0HvhtrJs4m+RMsJ1o_P1HMvZ8hg4hkqL94xqe5a+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Le jeu. 20 sept. 2018 ? 21:01, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a ?crit :

> Hello,
>
> On Thu, 20 Sep 2018 19:28:09 +0200, Fabrice Fontaine wrote:
> > Bump to version 5.6 has reintroduced the issue fixed by patch 854093 on
> > version 5.5.
> >
> > Indeed, third patch was merged upstream but it was then reverted:
> >
> https://github.com/brltty/brltty/commit/9e7d62c869d3c1cbe12dda8b0291a4692c193416
> >
> > Moreover, since commit 3a2e3f6fa5ef0a210ffeba5ed05c79965d0cc3c7, MKOBJ
> > was renamed into MKREL. So, instead of patching again brltty, overwrite
> > MKREL to use "gcc -shared -o" instead of "ld -r -o".
>
> Are you really sure gcc -shared -o does the same thing as ld -r -o ?
>
I didn't think about it, I basically backported the behavior of third patch
(upstream commit 4c8aba42e246b96d10ffcbd57653682375499e46). The third patch
applied to brltty 5.5 (https://patchwork.ozlabs.org/patch/854093/) was
replacing MKOBJ ($(LD) -r -o) by MKMOD defined as (CC)
${brltty_mkmod_gcc_make=-shared}
BRLTTY_OPTIONS_LD2CC([${brltty_mkmod_ld_options}]) -o" with
brltty_mkmod_ld_make="-shared" on linux (see
https://github.com/brltty/brltty/blob/4c8aba42e246b96d10ffcbd57653682375499e46/configure.ac
).
More information can be found here:
https://github.com/brltty/brltty/pull/113
However, I don't know why this commit was reverted one week later.
Mario, you told us in the review of the first patch that the upstream
author decided to "fix" the issue in a different way but actually the issue
is not fixed. Do you know why this commit was reverted? If needed, I can
create an issue to get more info.

>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180920/86bb4c11/attachment.html>
