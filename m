From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 14 Dec 2014 15:45:31 +0100
Subject: [Buildroot] [PATCH] package/nmap: fix shared-only build
In-Reply-To: <1418557891-24865-1-git-send-email-yann.morin.1998@free.fr>
References: <1418557891-24865-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <548DA28B.8040207@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

Le 14/12/2014 12:51, Yann E. MORIN a ?crit :
> Changeset f1d3e09 (Build shared libraries only as the default) broke the
> nmap package.
> 
> nmap builds an internal version of libdnet, and tries to statically link
> against it. Of course, this breaks for shared-only builds, since in that
> case there is no static lib ever built.
> 
> Using an external libdnet is not really an option:
> 
>   - libdnet comes from dnprogs, from the linux-decnet project;
>     unfortunately, their build-system is not ammenable to

s/ammenable/amenable

>     cross-compilation, and is a real pain to deal with;
> 
>   - nmap's bundled libdnet is anyway heavily modified, which precludes
>     using an external libdnet.
> 
> Fix that by considering libdnet to be a purely internal library, and by
> configuring it with --enable-static, always.
> 
> nmap's ./configure uses AC_CONFIG_SUBDIRS() to configure the libdnet
> sub-directory; AC_CONFIG_SUBDIRS() calls ./configure in all the
> sub-directories it is passed as arguments. Unfortunately, it is not
> possible to specify extra ./configure arguments whith AC_CONFIG_SUBDIRS.
> 
> We are using an autoconf trick, which is, when configuring
> sub-directories with AC_CONFIG_SUBDIRS(), it will first try to execute
> configure.gnu if it exists, before it fallbacks to running plain
> configure. See:
>     https://www.gnu.org/software/autoconf/manual/autoconf.html#Subdirectories
> 
> So, we provide a configure.gnu that is just a wrapper around the real
> configure, which sole purpose is to append --enable-static when calling
> the real configure.
> 
> Note1: since this libdnet is considered a purely internal library, we
> also always pass --disable-shared, since it is not needed at all.
> 
> Note2: since this libdnet is considered a purely internal library, it
> should not be exposed to other packages, and thus nmap does not install
> it, neither in target nor in staging, neither static nor shared, which
> is what we want.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@openwide.fr>
> ---

Thanks for your help during investigation about this issue.

Indeed, the static build for libdnet must forced for shared-only case.

Acked-by: Romain Naour <romain.naour@openwide.fr>

On my side, I tried to use an external liblinear library instead of the bundled
one. It appears that the nmap's external liblinear library support is broken and
never tested. Also bundled liblinear contains some modifications to be able to
build a static library.

But, as you said, since nmap properly builds liblinear, there's no reason to
package it in Buildroot for now.

So, liblinear like libdnet, must be considered as a purely internal library.

Best regards,
-- 
Romain Naour

OPEN WIDE Ing?nierie - Paris
23/25, rue Daviel| 75013 PARIS
http://ingenierie.openwide.fr

Le blog des technologies libres et embarqu?es :
http://www.linuxembedded.fr
