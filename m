From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Sun, 7 Jun 2020 12:35:00 +0200
Subject: [Buildroot] [PATCH] package/haveged: Allow service to run early
In-Reply-To: <20200605225421.13494-1-nolange79@gmail.com>
References: <20200605225421.13494-1-nolange79@gmail.com>
Message-ID: <CAFvCimXjptaExo7ia5XWRxrQrAYEhJqEZisTyp2_uUbWwu40uA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le sam. 6 juin 2020 ? 00:55, Norbert Lange <nolange79@gmail.com> a ?crit :

> Drop default dependencies, haveged needs nothing but
> local sockets and /dev/random.
> This allows the entropy to be available earlier.
>
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/haveged/haveged.service | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/package/haveged/haveged.service
> b/package/haveged/haveged.service
> index 91035c6711..ed9f043a91 100644
> --- a/package/haveged/haveged.service
> +++ b/package/haveged/haveged.service
> @@ -1,10 +1,13 @@
>  [Unit]
>  Description=Entropy Harvesting Daemon
>  Documentation=man:haveged(8)
> +DefaultDependencies=no
> +Conflicts=shutdown.target
> +Before=sysinit.target shutdown.target systemd-update-done.service
>
> Since v243 (quoting  systemd's NEWS file) :

* systemd-random-seed.service is now a synchronization point for full
          initialization of the kernel's entropy pool. Services that require
          /dev/urandom to be correctly initialized should be ordered after
this
          service.

so... in that case it might make sense to add
Before=systemd-random-seed.service
(assuming that works. This a very early point, so it needs some testing)

 [Service]
>  ExecStart=/usr/sbin/haveged -F -w 1024 -v 1
>  SuccessExitStatus=143
>
> I could not find any documentation on haveged return codes, so i'll trust
you on that one

>  [Install]
> -WantedBy=multi-user.target
> +WantedBy=sysinit.target
> --
> 2.26.2
>
> Apart from my earlier remark, you can add my ReviewedBy


> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
[image: SMILE]  <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine
*J?r?my ROSEN*
Architecte technique

[image: email] jeremy.rosen at smile.fr
[image: phone]  +33 6 88 25 87 42
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
<https://www.facebook.com/smileopensource> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

[image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
<https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200607/ae7af58a/attachment.html>
