From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 21:49:28 +0100
Subject: [Buildroot] [PATCH 1/2] core: don't reset MAKEOVERRIDES when
 re-entering make
In-Reply-To: <20161103015517.15943-1-arnout@mind.be>
References: <20161103015517.15943-1-arnout@mind.be>
Message-ID: <20161103214928.24ed6ba4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 3 Nov 2016 02:55:16 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> We reset MAKEOVERRIDES to avoid passing down variables that are
> overridden on the command line to the package build systems. Indeed,
> the variables overridden on the command line will be Buildroot
> variables and not relevant to the package build system. In particular
> the O option is used by some packages and the value passed in on the
> command line is plain wrong for the individual package.
> 
> However, in commit 916e614b, MAKEOVERRIDES was moved earlier and it
> was reset _before_ re-entering make in the cases when something has
> to be fixed up (incorrect umask, non-absolute paths in O or CURDIR).
> Therefore, if make is re-entered, any command line overrides are lost.
> 
> This particularly bites the autobuilders, because they use
> O=<relative path> to specify the output directory, and they add
> BR2_JLEVEL=... to avoid starting too many jobs in parallel. The
> BR2_JLEVEL override is lost.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
> I have a little worry, because there are two other places where we re-
> enter top-level make and those are not handled: silentoldconfig and
> external-deps. BR2_JLEVEL is not relevant for those, but other command-
> line overridden options may be. However, this hasn't changed from before
> commit 916e614b so I guess it's OK.
> ---
>  Makefile | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
