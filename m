From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2016 11:53:26 +0200
Subject: [Buildroot] [PATCH v2] build: fix umask test
In-Reply-To: <20160531074622.GB26685@airbook>
References: <20160531074622.GB26685@airbook>
Message-ID: <20160531115326.5b360fcb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 31 May 2016 09:46:22 +0200, Kurt Van Dijck wrote:
> Some shells' builtin umask does not print 2 leading 0's for the umask.
> Not doing so would break the comparison.
> zsh does not parse 022 as octal, so it is easier to compare the umask
> as ascii string.
> This patch fixes the umask comparison across different shells.
> 
> Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 63502d0..846343d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -26,7 +26,7 @@
>  
>  # Trick for always running with a fixed umask
>  UMASK = 0022
> -ifneq ($(shell umask),$(UMASK))
> +ifneq (00$(shell umask | sed -e "s/^0*//g"),$(UMASK))

Doesn't this makes the assumption that "umask" will always return a
value that starts with two zeros ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
