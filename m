From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Feb 2017 15:32:07 +0100
Subject: [Buildroot] [PATCH] openssh: Move key generation to the start
 function of init script.
In-Reply-To: <20170224142623.yldyeed3aif3w6de@zenon.in.qult.net>
References: <20170224142623.yldyeed3aif3w6de@zenon.in.qult.net>
Message-ID: <20170224143207.GB3908@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ignacy, All,

On 2017-02-24 15:26 +0100, Ignacy Gaw?dzki spake thusly:
> Since there's not much point in generating missing host keys when the
> init script is called with "stop", the call to ssh-keygen should not
> be done inconditionally, but in the start function instead.
> 
> Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

To be noted: there is nothing to do in the systemd service file, as it
is already a ExecStartPre action (i.e. what this patch does for SyS-V).

Regards,
Yann E. MORIN.

> ---
>  package/openssh/S50sshd | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
> index c151142..22da41d 100644
> --- a/package/openssh/S50sshd
> +++ b/package/openssh/S50sshd
> @@ -6,12 +6,12 @@
>  # Make sure the ssh-keygen progam exists
>  [ -f /usr/bin/ssh-keygen ] || exit 0
>  
> -# Create any missing keys
> -/usr/bin/ssh-keygen -A
> -
>  umask 077
>  
>  start() {
> +	# Create any missing keys
> +	/usr/bin/ssh-keygen -A
> +
>  	printf "Starting sshd: "
>  	/usr/sbin/sshd
>  	touch /var/lock/sshd
> -- 
> 2.9.3
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
