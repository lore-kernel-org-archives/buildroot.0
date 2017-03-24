From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 24 Mar 2017 09:34:04 +0100
Subject: [Buildroot] [PATCH] busybox: fix mdev.conf
In-Reply-To: <20170324075321.12384-1-joerg.krause@embedded.rocks>
References: <20170324075321.12384-1-joerg.krause@embedded.rocks>
Message-ID: <0f81e9fc-fdd2-328c-8a4a-3fce71101dc5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-03-17 08:53, J?rg Krause wrote:
> mdev does not set "/dev/snd" and "/dev/input" group and permission
> propery, because with commit c3cf1e30a3022453311a7e9fe11d94c7a381640e
  properly
> (May 2013!) the behavior of mdev has changed.

 I.e., released in busybox 1.22, added to Buildroot in 4e8dadfe4b9c. Note that
at that time we still had a version choice for busybox, so there was anyway a
problem.


> The device name is now taken directly from the uevent file and does no
> longer match the old rule.
> 
> Fix the rules for "/dev/snd" and "/dev/input" according to the example
> given in [1].
> 
> [1] http://lists.busybox.net/pipermail/busybox/2015-February/082297.html
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

 I guess almost nobody uses sound, and nowadays most GUI stuff that uses
/dev/input needs (e)udev anyway.

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/busybox/mdev.conf | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/package/busybox/mdev.conf b/package/busybox/mdev.conf
> index 241c1c27d..eaece1b73 100644
> --- a/package/busybox/mdev.conf
> +++ b/package/busybox/mdev.conf
> @@ -23,17 +23,17 @@ ttyS[0-9]*	root:root 660
>  ttyUSB[0-9]*	root:root 660
>  
>  # alsa sound devices
> -pcm.*		root:audio 660 =snd/
> -control.*	root:audio 660 =snd/
> -midi.*		root:audio 660 =snd/
> -seq		root:audio 660 =snd/
> -timer		root:audio 660 =snd/
> +snd/pcm.*	root:audio 660
> +snd/control.*	root:audio 660
> +snd/midi.*	root:audio 660
> +snd/seq		root:audio 660
> +snd/timer	root:audio 660
>  
>  # input stuff
> -event[0-9]+	root:root 640 =input/
> -mice		root:root 640 =input/
> -mouse[0-9]	root:root 640 =input/
> -ts[0-9]		root:root 600 =input/
> +input/event[0-9]+	root:root 640
> +input/mice		root:root 640
> +input/mouse[0-9]	root:root 640
> +input/ts[0-9]		root:root 600
>  
>  # load modules
>  $MODALIAS=.*	root:root 660 @modprobe "$MODALIAS"
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
