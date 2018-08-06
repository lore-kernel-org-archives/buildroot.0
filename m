From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Aug 2018 19:49:38 +0200
Subject: [Buildroot] [PATCH v2] download: fix file:// BR2_PRIMARY_SITE
 (download cache)
In-Reply-To: <05d2fcc3-9f04-863d-c370-a9d1fc487773@mentor.com>
References: <20180719034232.20746-1-hollis_blanchard@mentor.com>
 <20180805123956.GC12445@scaer>
 <05d2fcc3-9f04-863d-c370-a9d1fc487773@mentor.com>
Message-ID: <20180806174938.GB2427@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hollis, Al,

On 2018-08-06 09:25 -0700, Hollis Blanchard spake thusly:
> On 08/05/2018 05:39 AM, Yann E. MORIN wrote:
> >Hollis, All,
> >
> >On 2018-07-18 20:42 -0700, Hollis Blanchard spake thusly:
> >>As far as I can tell, wget is the only downloader currently usable with
> >>BR2_PRIMARY_SITE, and that doesn't work at all for file:// URLs. The symptoms
> >>are these:
> >Why do you need to have a primary that points to local files? Isn't it
> >sufficient to export BR2_DL_DIR and opint it to your local cache
> >instead?
> We've actually had well-meaning developers corrupt the shared download cache
> before.

Oh! I know those well-meaning devs! They are very handy indeed! ;-)

> In that case they manually repacked a kernel tarball complete with
> their experimental changes. In other cases, I've seen downloads fail when
> RHEL6 tools (e.g. curl, git) fail to download from some https site due to
> SSL compatibility problems. In both cases, not only was the tarball
> corrupted, but also there was no hash to check, since it was a custom kernel
> version.
> 
> To avoid problems like that, we have an official build job that populates
> the (otherwise read-only) download cache, and then individual developer
> builds are free to download other stuff besides (e.g. experimenting with a
> kernel versions, adding packages).

But then, that means that either users are all on the same machine (in
which case I want such a machine, as it must be very powerfull to
accustom that many devs!), or be NFS-mounted by each indicvidual devs on
their own machine.

In either case, it means that, to use the cache, you have to ensure that
users will *always* be mounted that cache in the same path, or you can't
store it in your defconfigs.

What I've (seen) done instead, was a build job like yours, populate a
directory localy, and that directory gets exported by a very simple http
server that only knows how to serve files (not even directory listing is
needed). A very lightweight ligghtd, or a vhost of an existing server or
whatever, which had proved te be much more convenient; especially for
some people behind high-latency links which were a pain to use with NFS.

But anyway, I have a few comments:

> diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> index 8d6365e08d..610dcba5a5 100755
> --- a/support/download/dl-wrapper
> +++ b/support/download/dl-wrapper
> @@ -88,7 +88,8 @@  main() {
>      download_and_check=0
>      rc=1
>      for uri in "${uris[@]}"; do
> -        backend=${uri%%+*}
> +        backend_urlencode=${uri%%+*}
> +        backend=${backend_urlencode%|*}

I see that the ${uri%%+*} expansion that you change was not quoted, but
please quote the new expansions you are adding:

    backend_urlencode="${uri%%+*}"
    backend="${backend_urlencode%|*}"

Once you do that (and only that) and respin, you can add:

    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
    Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> Hollis Blanchard
> Mentor Graphics Emulation Division
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
