From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 13:55:05 +0100
Subject: [Buildroot] [PATCH] utils/checkpackagelib/lib_mk.py: handle
 'else' and 'elif' statements
In-Reply-To: <20201209153219.17253-1-patrickdepinguin@gmail.com>
References: <20201209153219.17253-1-patrickdepinguin@gmail.com>
Message-ID: <20210102135505.276d62f8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  9 Dec 2020 16:32:18 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> An 'else' or 'elif' clause inside a make conditional should not be indented
> in the same way as the if/endif clause. check-package did not recognize the
> else statement and expected an indentation.
> 
> For example:
> 
> ifdef FOOBAR
> 	interesting
> else
> 	more interesting
> endif
> 
> would, according to check-package, need to become:
> 
> ifdef FOOBAR
> 	interesting
> 	else
> 	more interesting
> endif
> 
> Treat 'else' and 'elif' the same as if-like keywords in the Indent test, but
> take into account that 'else' is also valid shell, so we need to correctly
> handle line continuation to prevent complaining about the 'else' in:
> 
> ifdef FOOBAR
> 	if true; \
> 	    ... \
> 	else \
> 	    ... \
> 	fi
> endif
> 
> We don't add the 'else' and 'elif' statements to start_conditional, because
> it would cause incorrect nesting counting in class OverriddenVariable.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  utils/checkpackagelib/lib_mk.py | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
