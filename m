From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Jul 2015 12:25:08 +0200
Subject: [Buildroot] [PATCH] inadyn: fix init script and default config
 file
In-Reply-To: <1436109171-30701-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1436109171-30701-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <55A0EF04.7040706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/05/15 17:12, Thomas Petazzoni wrote:
> This commit does a number of fixes to the inadyn package to make it
> work properly "out of the box":
> 
>  * inadyn is installed in /usr/sbin, not /usr/bin, so we fix the path
>    in the init script
> 
>  * Use "echo -n" for the Starting and Stopping messages, so that the
>    OK / FAIL stay on the same line.
> 
>  * There is no need to pass the inadyn binary path during the stop
>    sequence, as long as we pass the appropriate -p option with the
>    path to the PID file created by inadyn, so we do this.

 Actually there is a reason to pass it: if inadyn has already died and another
process has taken over the PID, then start-stop-daemon can check that both the
PID and the process executable match. So keep it (if it works).

 With that fixed:
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> 
>  * Pass the -q option to the start sequence, since it's passed in the
>    stop sequence.
> 
>  * Fix the configuration file to use an existing dyndns_system and
>    avoid a failure at startup.
> 
> Cc: Alex Suykov <alex.suykov@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/inadyn/S70inadyn   | 10 +++++-----
>  package/inadyn/inadyn.conf |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/inadyn/S70inadyn b/package/inadyn/S70inadyn
> index b20048c..b2aaa0a 100644
> --- a/package/inadyn/S70inadyn
> +++ b/package/inadyn/S70inadyn
> @@ -14,15 +14,15 @@ VR_INADYN=/var/run/inadyn
>  
>  case "$1" in
>  	start)
> -		echo "Starting inadyn: "
> -		start-stop-daemon -S -x /usr/bin/inadyn
> +		echo -n "Starting inadyn: "
> +		start-stop-daemon -q -S -p ${VR_INADYN}/inadyn.pid -x /usr/sbin/inadyn
>  		[ $? = 0 ] && echo "OK" || echo "FAIL"
>  		;;
>  	stop)
> -		echo  "Stopping inadyn: "
> -		start-stop-daemon -q -K -x /usr/bin/inadyn
> +		echo -n "Stopping inadyn: "
> +		start-stop-daemon -q -K -p ${VR_INADYN}/inadyn.pid
>  		[ $? = 0 ] && echo "OK" || echo "FAIL"
> -		rm -f /var/run/inadyn/inadyn.pid
> +		rm -f ${VR_INADYN}/inadyn.pid
>  		;;
>  	restart)
>  		"$0" stop
> diff --git a/package/inadyn/inadyn.conf b/package/inadyn/inadyn.conf
> index b5877f7..93ad0b5 100644
> --- a/package/inadyn/inadyn.conf
> +++ b/package/inadyn/inadyn.conf
> @@ -5,7 +5,7 @@ background
>  update_period_sec 600 # Check for a new IP every 600 seconds
>  username test		# replace 'test' with your username
>  password test		# replace 'test' with your password
> -dyndns_system dyndns at dyndns.org   # replace w/ your provider
> +dyndns_system default at dyndns.org   # replace w/ your provider
>  
>  #  uncomment the alias statement below to test it on your system
>  alias test.homeip.net
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
