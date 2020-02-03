From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 14:27:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/openssh: improve init script
In-Reply-To: <20200123121755.vp2n7mx3xxpbrbyz@zenon.in.qult.net>
References: <20200123121755.vp2n7mx3xxpbrbyz@zenon.in.qult.net>
Message-ID: <20200203142721.5b143c0e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ignacy,

Thanks a lot for working on the openssh init script. I'm adding in Cc:
Carlos Santos, who worked on a template for our init scripts, and is
generally trying to make our init script more consistent.

See some comments below.

On Thu, 23 Jan 2020 13:17:55 +0100
Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr> wrote:

> The current init script for sshd is too simplistic and its use of
> killall to terminate the daemon has the annoying downside of killing
> every instance of sshd, possibly including the one spawned for the
> interactive session in which the script itself is started.  If the
> intention was to simply restart the daemon, killing the current
> session ultimately kills the script and the daemon is not properly
> started again.
> 
> Improve the init script in the following ways:
> 
>   Use start-stop-daemon to avoid running the daemon more than once and
>   to safely send termination signals to the right process.
> 
>   Add a proper reload action, by sending the daemon the SIGHUP signal.

This should ideally be done in a separate patch.

>   During restart, check that the daemon has properly terminated and if
>   not, wait one second before sending it the SIGKILL signal.

We never do that in any of our other init scripts, I'm not sure we want
to do that here. Is there any reason to do that?

> Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
> ---
>  package/openssh/S50sshd | 29 ++++++++++++++++++++---------
>  1 file changed, 20 insertions(+), 9 deletions(-)

Overall, could you look at package/busybox/S01syslogd, and use it as a
template for S50openssh ?

> diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
> index 22da41d1ca..66cdd5e291 100644
> --- a/package/openssh/S50sshd
> +++ b/package/openssh/S50sshd
> @@ -13,20 +13,29 @@ start() {
>  	/usr/bin/ssh-keygen -A
>  
>  	printf "Starting sshd: "
> -	/usr/sbin/sshd
> -	touch /var/lock/sshd
> -	echo "OK"
> +	start-stop-daemon -S -q -x /usr/sbin/sshd -p /run/sshd.pid &&
> +	{ touch /var/lock/sshd; echo "OK"; } || echo "FAIL"

I am a bit confused by this touch /var/lock/sshd. Is it really
necessary? The git history was not very helpful on this, as it has been
in Buildroot since the init script was introduced years ago. The fact
that it is created *after* the sshd daemon is started makes it really
weird.

Do you have any comment/insight on this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
