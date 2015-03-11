From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 11 Mar 2015 16:34:50 +0200
Subject: [Buildroot] [PATCH 1/2] libpcap: bump to version 1.7.2
In-Reply-To: <1426081428-32041-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426081428-32041-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150311143450.GG2177@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Wed, Mar 11, 2015 at 10:43:47AM -0300, Gustavo Zacarias wrote:
> Drop upstream patch (uclinux), adapt libnl patch to new version.
> And add hash file.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../libpcap/0001-remove-libnl-include-path.patch   | 17 ++++++----
>  .../0002-configure.in-uclinux-is-also-linux.patch  | 39 ----------------------
>  package/libpcap/libpcap.hash                       |  2 ++
>  package/libpcap/libpcap.mk                         |  2 +-
>  4 files changed, 13 insertions(+), 47 deletions(-)
>  delete mode 100644 package/libpcap/0002-configure.in-uclinux-is-also-linux.patch
>  create mode 100644 package/libpcap/libpcap.hash
> 
> diff --git a/package/libpcap/0001-remove-libnl-include-path.patch b/package/libpcap/0001-remove-libnl-include-path.patch
> index 7b7106b..a4039ef 100644
> --- a/package/libpcap/0001-remove-libnl-include-path.patch
> +++ b/package/libpcap/0001-remove-libnl-include-path.patch
> @@ -1,16 +1,19 @@
>  Remove hardcoded path to libnl3 include directory
>  
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +[Gustavo: update for 1.7.2]
>  
> -Index: b/configure.in
> -===================================================================
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -445,7 +445,6 @@
> +diff -Nura libpcap-1.7.2.orig/configure.in libpcap-1.7.2/configure.in
> +--- libpcap-1.7.2.orig/configure.in	2015-03-11 10:02:44.416189921 -0300
> ++++ libpcap-1.7.2/configure.in	2015-03-11 10:03:03.967633673 -0300
> +@@ -466,9 +466,8 @@
>   			AC_DEFINE(HAVE_LIBNL_3_x,1,[if libnl exists and is version 3.x])
>   			AC_DEFINE(HAVE_LIBNL_NLE,1,[libnl has NLE_FAILURE])
>   			AC_DEFINE(HAVE_LIBNL_SOCKETS,1,[libnl has new-style socket api])
> --			V_INCLS="$V_INCLS -I/usr/include/libnl3"
> +-			V_INCLS="$V_INCLS ${incdir}"
>   			have_any_nl="yes"
> - 		])
> +-		],[], ${incdir} ${libnldir} -lnl-genl-3 -lnl-3 )
> ++		],[], ${libnldir} -lnl-genl-3 -lnl-3 )

That's disappointing. Upstream actually merged this patch (commit 
157330dcac5), but another commit (ee3296275f) broke it in another way. Is it 
possible to pass --with-libnl=/dev/null so that ${incdir} and ${libnldir} 
point to a non-existing place? That should allow removing this patch.

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
