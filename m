From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 30 Jun 2012 14:53:42 +0200
Subject: [Buildroot] [PATCH] dependencies: ensure that DESTDIR isn't set
 when running Buildroot
In-Reply-To: <1340964896-12899-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1340964896-12899-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <4FEEF6D6.6030701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/29/12 12:14, Thomas Petazzoni wrote:
> Having DESTDIR set in the environment before running Buildroot creates
> some funky problems in the build process. Prevent users from running
> into this kind of troubles.
>
> Cc: Michael Opdenacker<michael.opdenacker@free-electrons.com>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
> ---
>   support/dependencies/dependencies.sh |    6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index c47ffcf..43ec3cc 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -48,6 +48,12 @@ if test -n "$PERL_MM_OPT" ; then
>       exit 1
>   fi
>
> +if test -n "$DESTDIR" ; then
> +    /bin/echo -e "\nYou have the DESTDIR environment variable set. Please"
> +    /bin/echo -e "unset it so that Buildroot can work properly."
> +    exit 1
> +fi

  Why not just override and export DESTDIR from the top-level Makefile?

  Regards,
  Arnout

> +
>   # Verify that which is installed
>   if ! which which>  /dev/null ; then
>   	/bin/echo -e "\nYou must install 'which' on your build machine\n";

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
