From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 10:57:07 +0200
Subject: [Buildroot] [PATCH 1/1] Fix umask settings for non-bash shells
 for root user
In-Reply-To: <1434378026-15007-1-git-send-email-vorel@jablocom.com>
References: <1434378026-15007-1-git-send-email-vorel@jablocom.com>
Message-ID: <20150829105707.3d5e0fec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Petr Vorel,

Adding Yann, Arnout and Peter in Cc.

On Mon, 15 Jun 2015 16:20:26 +0200, Petr Vorel wrote:
> From: Petr Vorel <petr.vorel@gmail.com>
> 
> .bash_profile is not readed by some shells (e.g. busybox), so move umask into
> .profile. Here it's also loaded .bashrc, when presented and shell is
> bash.
> 
> CREDITS: inspired by Debian skeleton files.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  system/skeleton/root/.bash_profile |  7 -------
>  system/skeleton/root/.profile      | 10 ++++++++++
>  2 files changed, 10 insertions(+), 7 deletions(-)
>  delete mode 100644 system/skeleton/root/.bash_profile
>  create mode 100644 system/skeleton/root/.profile
> 
> diff --git a/system/skeleton/root/.bash_profile b/system/skeleton/root/.bash_profile
> deleted file mode 100644
> index 0ee04a3..0000000
> --- a/system/skeleton/root/.bash_profile
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# .bash_profile
> -
> -umask 022
> -
> -if [ -f ~/.bashrc ]; then
> -    source ~/.bashrc
> -fi
> diff --git a/system/skeleton/root/.profile b/system/skeleton/root/.profile
> new file mode 100644
> index 0000000..452ae20
> --- /dev/null
> +++ b/system/skeleton/root/.profile
> @@ -0,0 +1,10 @@
> +# ~/.profile: executed by the command interpreter for login shells.
> +# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
> +# exists.
> +umask 022
> +
> +if [ -n "$BASH_VERSION" ]; then
> +    if [ -f ~/.bashrc ]; then
> +        source ~/.bashrc
> +    fi
> +fi

Well, actually, I am wondering if we need to bundle a .profile file at
all. Our system/skeleton/root/ directory contains:

-rw-r--r--  1 thomas thomas    0 oct.   4  2014 .bash_history
-rw-r--r--  1 thomas thomas  175 oct.   4  2014 .bash_logout
-rw-rw-r--  1 thomas thomas   78 mars   5 15:40 .bash_profile

I don't really see why we need any of those three files in our default
skeleton. Maybe we should simply remove them, use the default behavior
of whatever shell is installed, and let users provide their own custom
configuration if needed through a post-build script or rootfs overlay.

Yann, Arnout, Peter, your thoughts?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
