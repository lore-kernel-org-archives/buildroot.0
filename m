From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Oct 2018 23:14:11 +0200
Subject: [Buildroot] PHP7.0-FPM Session
In-Reply-To: <BL2PR15MB1057C3B66260ECCD5DF119A0EDEE0@BL2PR15MB1057.namprd15.prod.outlook.com>
References: <BL2PR15MB1057C3B66260ECCD5DF119A0EDEE0@BL2PR15MB1057.namprd15.prod.outlook.com>
Message-ID: <e84a0671-3d8d-f834-78bc-415d1dd0a0ac@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/09/2018 17:15, Tony Fuller wrote:
> Hello All,
> 
> I am having a strange problem with php7.0-fpm and session management.
> After several failed iterations of trying to install NextCloud server
> on a busybox rootfs I finally narrowed down the problem to PHP session
> management.
> 
> I've tried to eliminate my web server as the problem and so I generated
> a small php snippet that checks php's session_status() return value and
> I have the same behavior on Apache + php module (which doesn't directly
> interface with /var/run/php-fpm.sock) and (Nginx which does communicate
> using /var/run/php-fpm.sock). In both webservers, session_status()
> *always* returns PHP_SESSION_NONE.

 At a risk of stating the obvious: you *do* have BR2_PACKAGE_PHP_EXT_SESSION
enabled?

 If you do, it is possible that there is some hidden runtime dependency on
something else. It would be nice to find that. So if you could just enable all
PHP options and then disable/rebuild/test until you find the one that is needed,
that would be nice.

 If you *do* have all PHP options enabled, then it's something else and it will
need more debugging... You might try your luck on the php mailing list, perhaps
someone there has an idea that allows you to shortcut to the culprit.

 Regards,
 Arnout

> 
> I can see sess_* files created in /tmp. I've changed the location to
> /var/lib/php/session (emulating debian style configuration). I've
> changed the php-fpm daemon to run as www-data (as well as Apache and
> Nginx). I've even gone so far as to chmod -R 777 / (and fixing up
> /root/.ssh and /etc/ssh folders). 
> 
> Pulling the Debian Stretch rootfs that docker uses and installing all
> above requirements yields a fully working NextCloud server instance
> (under chroot) so I'm at a total loss. I'm working on a raspberry pi
> currently but the actual target is a PowerPC 32bit processor which
> Debian dropped support which is what brought me to buildroot in the
> first place.
> 
> Any thoughts are welcome and appreciated.
> 
> Here's the simple testing script:
> # cat sessiontest.php 
> <?php
> echo(session_status());
> if (session_status() == PHP_SESSION_NONE) {
>     echo("session_status is NONE");
>     #$previous_name = session_name("WebsiteID");
>     #echo "The previous session name was $previous_name<br />";
>     session_start();
>     echo("Now session_status is" . session_status());
> }
> else
> {
>     echo("There is some type of session");
>     setcookie(session_name(),session_id(),time()+$lifetime);
> }
> 
> $_SESSION["secretword"] = "ABC123" ;
> $_SESSION["theme"] = "purple" ; 
> 
> ?>
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
