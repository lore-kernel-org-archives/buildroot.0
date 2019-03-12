From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Mar 2019 13:33:10 +0100
Subject: [Buildroot] [PATCH] docs/manual: add note about spurious errors
 duing make printvars
In-Reply-To: <20190312105713.23968-1-martin.kepplinger@ginzinger.com>
References: <20190312105713.23968-1-martin.kepplinger@ginzinger.com>
Message-ID: <99874541-4ce3-4cb8-b7ce-a0d3d7496357@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/03/2019 11:57, Martin Kepplinger wrote:
> Add a note about errors we currently have, as discussed in
> http://lists.busybox.net/pipermail/buildroot/2019-March/244212.html
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
> ---
>  docs/manual/make-tips.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
> index ea1d825bef..475de4ffa7 100644
> --- a/docs/manual/make-tips.txt
> +++ b/docs/manual/make-tips.txt
> @@ -131,3 +131,13 @@ The output of quoted variables can be reused in shell scripts, for example:
>   $ echo $BUSYBOX_DEPENDENCIES
>   skeleton toolchain
>  ----
> +
> +Note that when using +make printvars+ you might see spurious errors like
> +the following. Please help reviewing our Makefile macros and variables
> +in order to fix this:

 I thought the conclusion of that thread is that there is no way to fix it? The
only reasonable way is to filter out macros from the .VARS. E.g. defining
PRINTVARS_FILTER and for each macro definition, append to that list.

 However, I'm not even convinced that we really want to do that. It is adding
significant complexity for little gain.

 Instead, I'm more inclined to remove the possibility of running printvars
without explicit VARS=. If you really want, you can still get all variables with
VARS=%.

 Regards,
 Arnout

> +
> +----
> +/bin/bash: support/dependencies/check-host-.sh: no such file or directory
> +/bin/bash: -c: line 0: syntax error: ')' unexpected
> +/bin/bash: -c: line 0: `set -e; TMP="$(mktemp)"; if () >/dev/null 2>&1; then echo ""; else echo ""; fi;
> +----
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
