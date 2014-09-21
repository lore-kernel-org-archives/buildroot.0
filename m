From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Sep 2014 14:53:33 +0200
Subject: [Buildroot] [PATCH] package/openvmtools: do not force
 -I/usr/include in CPPFLAGS
In-Reply-To: <1411297275-6888-1-git-send-email-yann.morin.1998@free.fr>
References: <1411297275-6888-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140921125333.GB4299@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2014-09-21 13:01 +0200, Yann E. MORIN spake thusly:
> Fixes:
>     http://autobuild.buildroot.net/results/447/4473d8a99ffec1fde491d172520e86ae1e69fae7/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  .../openvmtools-04-dont-force-cppflags.patch       | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 package/openvmtools/openvmtools-04-dont-force-cppflags.patch
> 
> diff --git a/package/openvmtools/openvmtools-04-dont-force-cppflags.patch b/package/openvmtools/openvmtools-04-dont-force-cppflags.patch
> new file mode 100644
> index 0000000..8f904b1
> --- /dev/null
> +++ b/package/openvmtools/openvmtools-04-dont-force-cppflags.patch
> @@ -0,0 +1,22 @@
> +m4: do not force -I/usr/include in CPPFLAGS
> +
> +This is so horribly broken for cross-compilation. :-(
> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +
> +diff -durN openvmtools-9.4.6-1770165.orig/m4/vmtools.m4 openvmtools-9.4.6-1770165/m4/vmtools.m4
> +--- openvmtools-9.4.6-1770165.orig/m4/vmtools.m4	2014-07-02 00:21:14.000000000 +0200
> ++++ openvmtools-9.4.6-1770165/m4/vmtools.m4	2014-09-21 12:39:15.901659888 +0200
> +@@ -281,10 +281,10 @@
> +       if test "$os" = freebsd; then
> +          CUSTOM_$1_CPPFLAGS="-I/usr/local/include"
> +       else
> +-         CUSTOM_$1_CPPFLAGS="-I/usr/include"
> ++         CUSTOM_$1_CPPFLAGS=" "

I suddenly realise it is not obvious why I left a space in there.

That's on purpose, otherwise ./configure gets awfully confused, and
does not even try to find PAM headers and simply bails out before even
doing anything to detect PAM.

I can re-spin with a better commit log (and/or a comment in the patch)
if needed. Or it can be added by the committer. ;-)

Regards,
Yann E. MORIN.

> +       fi
> +       if test -n "$2"; then
> +-         CUSTOM_$1_CPPFLAGS="${CUSTOM_$1_CPPFLAGS}/$2"
> ++         : CUSTOM_$1_CPPFLAGS="${CUSTOM_$1_CPPFLAGS}/$2"
> +       fi
> +    fi
> + ])
> -- 
> 1.9.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
