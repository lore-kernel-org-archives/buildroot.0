From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 31 Dec 2013 00:11:24 +0100
Subject: [Buildroot] [PATCH 1/2] Remove some absolute paths
In-Reply-To: <1388421102-29198-1-git-send-email-bjorn.forsman@gmail.com>
References: <1388421102-29198-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <52C1FD9C.9060401@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 30/12/2013 17:31, Bj?rn Forsman ha scritto:
> Buildroot fails to run on NixOS because it has no /bin/echo or
> /bin/grep. Instead of relying on absolute paths, rely on tools to be
> available in PATH. This should work for all systems.
>
> Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
> ---
>   support/dependencies/dependencies.sh | 96 ++++++++++++++++++------------------
>   1 file changed, 48 insertions(+), 48 deletions(-)
>
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index 32b8fea..d1ce918 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -7,20 +7,20 @@ export LC_ALL=C
>   # Verify that grep works
>   echo "WORKS" | grep "WORKS" >/dev/null 2>&1
>   if test $? != 0 ; then
> -	/bin/echo -e "\ngrep doesn't work\n"
> +	echo -e "\ngrep doesn't work\n"

I'm ok with the change, but while we're touching these basig commands,
why not replacing them with an ECHO and a GREP constant? Such as:
   ECHO := $(shell which grep)
or, more simply:
   ECHO := echo
and wherever it's used:
  -	/bin/echo -e "\ngrep doesn't work\n"
  +	$(ECHO) -e "\ngrep doesn't work\n"

This is what we do i.e. for sed. See package/Makefile.in.

This allows successive changes to the command definition without
the need for a massive search and replace.

-- 
Luca
