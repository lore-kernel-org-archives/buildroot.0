From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 16:47:12 +0100
Subject: [Buildroot] [PATCH] core/pkg-infra: tweak only .la files that
 need it
In-Reply-To: <20190210213818.5232-1-yann.morin.1998@free.fr>
References: <20190210213818.5232-1-yann.morin.1998@free.fr>
Message-ID: <20190317164712.65f9476f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Feb 2019 22:38:18 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Currently, when we tweak the .la files, we do so unconditionally on all
> .la files, even those we already fixed in a previous run.
> 
> This has the nasty side effect that each .la file will be reported as
> being touched by all packages that are installed after the package that
> actually installed said .la file.
> 
> Since we can't easily know what files were installed by a package (that
> is an instrumentation hook, and comes after the mangling), we use a
> trick (like is done in libtool?): we do mangle all files, each into a
> temporary location; if the result is identical to the input, we remove
> the temporary, while if the result differs from the output, we move
> the temporary to replace the input.
> 
> Reported-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> 
> ---
> Changes v1 -> v2:
>   - drop spurious trailing semicolon on sed command line  (Thomas DS.)
>   - use $$(find ...) instead of $(find ...), as we don't want it to be
>     evaluated by the Makefile, but by the shell
>   - silence the output of cmp
>   - typoes in commit log  (Thomas DS.)
> ---
>  package/pkg-generic.mk | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

Applied to master, thanks. Long term, it would be nicer if we could
leverage the list of files installed by the package, in order to only
tweak the files that really need to be tweaked. But that requires more
work in the common infrastructure.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
