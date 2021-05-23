From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 May 2021 11:34:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: fix build with latest
 live555
In-Reply-To: <20210522214139.1245167-1-fontaine.fabrice@gmail.com>
References: <20210522214139.1245167-1-fontaine.fabrice@gmail.com>
Message-ID: <20210523093452.GO3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-22 23:41 +0200, Fabrice Fontaine spake thusly:
> Fix build failure with live555 raised since commit
> 6ad1c7f12e57ab7c6f022470e0aacec442d14267
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/83170984f96238756c45bf1f4e542363afafd45f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ive555.cpp-fix-build-with-live555-20.patch | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/vlc/0010-modules-access-live555.cpp-fix-build-with-live555-20.patch
> 
> diff --git a/package/vlc/0010-modules-access-live555.cpp-fix-build-with-live555-20.patch b/package/vlc/0010-modules-access-live555.cpp-fix-build-with-live555-20.patch
> new file mode 100644
> index 0000000000..5f046648d4
> --- /dev/null
> +++ b/package/vlc/0010-modules-access-live555.cpp-fix-build-with-live555-20.patch
> @@ -0,0 +1,36 @@
> +From eba390d13ec4089cd6b9d8687ab3f8905b9d3ac8 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 22 May 2021 22:56:04 +0200
> +Subject: [PATCH] modules/access/live555.cpp: fix build with live555 >=
> + 2020.12.11
> +
> +Since live555-2020.12.11, connectionEndpointAddress() member function
> +use a "struct sockaddr_storage" in preparation for eventual support of
> +IPv6: http://www.live555.com/liveMedia/public/changelog.txt
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/83170984f96238756c45bf1f4e542363afafd45f
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + modules/access/live555.cpp | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/modules/access/live555.cpp b/modules/access/live555.cpp
> +index 9d6e01ae32..32a6c294eb 100644
> +--- a/modules/access/live555.cpp
> ++++ b/modules/access/live555.cpp
> +@@ -850,7 +850,9 @@ static int SessionsSetup( demux_t *p_demux )
> +             if( !p_sys->b_multicast )
> +             {
> +                 /* We need different rollover behaviour for multicast */
> +-                p_sys->b_multicast = IsMulticastAddress( sub->connectionEndpointAddress() );
> ++                struct sockaddr_storage tempAddr;
> ++                sub->getConnectionEndpointAddress( tempAddr );
> ++                p_sys->b_multicast = IsMulticastAddress( tempAddr );
> +             }
> + 
> +             tk = (live_track_t*)malloc( sizeof( live_track_t ) );
> +-- 
> +2.30.2
> +
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
