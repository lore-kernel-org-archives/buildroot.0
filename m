From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Mar 2017 18:31:46 +0100
Subject: [Buildroot] [PATCH v5 14/19] infra-libtool: drop original
 $libdir (i.e. /usr/lib) from library paths
In-Reply-To: <1482241596-31688-15-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-15-git-send-email-jezz@sysmic.org>
Message-ID: <9e03f741-dd0a-97b1-1bd4-28501d84097e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-12-16 14:46, J?r?me Pouiller wrote:
> When it compute list of directories to include in link, libtool has a
                 ^s the                            ^the
> conservative behavior. It add `$inst_prefix_dir$libdir' but also keep original
                               ^s                                      ^s the
> `$libdir'. Thus, it call:
                          ^s
>    -L/usr/lib -L/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
> 
> It works since the last path has priority. However, toolchan-wrapper consider
                                                                              ^s

 However, I think the first path has priority, no? According to man gcc: "the
directories are searched in the order specified". So I don't think this works.
In other words, I think patch 11/19 without this patch might break the build if
paranoid path is enabled. In that case, this patch should come first in the series.

> `/usr/lib' an an unsafe path.
             ^^as
> 
> This patch remove original `$libdir'.
                   ^s the
> 
> Since last versions of binutils provide `-Wpoison-system-directories' option, I
> think it make sense to try to upstream this patch.

 So, did you try to upstream it?

> 
> Note Yocto has a similar patch:
>   http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-devtools/libtool/libtool/use-sysroot-in-libpath.patch

 Well, yocto has a non-upstreamable patch :-)

> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>


Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(tested on a static arm musl build with about 20 packages)

 Regards,
 Arnout

> ---
>  support/libtool/buildroot-libtool-v1.5.patch   | 18 ++++++++++++++++++
>  support/libtool/buildroot-libtool-v2.2.patch   | 18 ++++++++++++++++++
>  support/libtool/buildroot-libtool-v2.4.4.patch |  9 +++++++++
>  support/libtool/buildroot-libtool-v2.4.patch   |  9 +++++++++
>  4 files changed, 54 insertions(+)
> 
> diff --git a/support/libtool/buildroot-libtool-v1.5.patch b/support/libtool/buildroot-libtool-v1.5.patch
> index 609006a..51d049f 100644
> --- a/support/libtool/buildroot-libtool-v1.5.patch
> +++ b/support/libtool/buildroot-libtool-v1.5.patch
> @@ -43,6 +43,24 @@
>   	  fi
>   	  # This is a shared library
>   
> +@@ -2412,7 +2419,7 @@
> + 		if test -n "$inst_prefix_dir"; then
> + 		  case "$libdir" in
> + 		    [\\/]*)
> +-		      add_dir="$add_dir -L$inst_prefix_dir$libdir"
> ++		      add_dir="-L$inst_prefix_dir$libdir"
> + 		      ;;
> + 		  esac
> + 		fi
> +@@ -2492,7 +2499,7 @@
> + 	      if test -n "$inst_prefix_dir"; then
> + 		case "$libdir" in
> + 		  [\\/]*)
> +-		    add_dir="$add_dir -L$inst_prefix_dir$libdir"
> ++		    add_dir="-L$inst_prefix_dir$libdir"
> + 		    ;;
> + 		esac
> + 	      fi
>  @@ -5487,10 +5494,13 @@
>   	  # At present, this check doesn't affect windows .dll's that
>   	  # are installed into $libdir/../bin (currently, that works fine)
> diff --git a/support/libtool/buildroot-libtool-v2.2.patch b/support/libtool/buildroot-libtool-v2.2.patch
> index 3af0604..be4e5e3 100644
> --- a/support/libtool/buildroot-libtool-v2.2.patch
> +++ b/support/libtool/buildroot-libtool-v2.2.patch
> @@ -76,3 +76,21 @@
>   	    fi
>   	    ;;
>   	  esac
> +@@ -6094,7 +6093,7 @@
> + 		if test -n "$inst_prefix_dir"; then
> + 		  case $libdir in
> + 		    [\\/]*)
> +-		      add_dir="$add_dir -L$inst_prefix_dir$libdir"
> ++		      add_dir="-L$inst_prefix_dir$libdir"
> + 		      ;;
> + 		  esac
> + 		fi
> +@@ -6167,7 +6166,7 @@
> + 	      if test -n "$inst_prefix_dir"; then
> + 		case $libdir in
> + 		  [\\/]*)
> +-		    add_dir="$add_dir -L$inst_prefix_dir$libdir"
> ++		    add_dir="-L$inst_prefix_dir$libdir"
> + 		    ;;
> + 		esac
> + 	      fi
> diff --git a/support/libtool/buildroot-libtool-v2.4.4.patch b/support/libtool/buildroot-libtool-v2.4.4.patch
> index d71669b..1458b5e 100644
> --- a/support/libtool/buildroot-libtool-v2.4.4.patch
> +++ b/support/libtool/buildroot-libtool-v2.4.4.patch
> @@ -82,3 +82,12 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>   	    fi
>   	    ;;
>   	  esac
> +@@ -8854,7 +8854,7 @@
> + 	      if test -n "$inst_prefix_dir"; then
> + 		case $libdir in
> + 		  [\\/]*)
> +-		    func_append add_dir " -L$inst_prefix_dir$libdir"
> ++		    add_dir="-L$inst_prefix_dir$libdir"
> + 		    ;;
> + 		esac
> + 	      fi
> diff --git a/support/libtool/buildroot-libtool-v2.4.patch b/support/libtool/buildroot-libtool-v2.4.patch
> index bf40c94..c2edd99 100644
> --- a/support/libtool/buildroot-libtool-v2.4.patch
> +++ b/support/libtool/buildroot-libtool-v2.4.patch
> @@ -76,3 +76,12 @@
>   	    fi
>   	    ;;
>   	  esac
> +@@ -8854,7 +8854,7 @@
> + 	      if test -n "$inst_prefix_dir"; then
> + 		case $libdir in
> + 		  [\\/]*)
> +-		    func_append add_dir " -L$inst_prefix_dir$libdir"
> ++		    add_dir="-L$inst_prefix_dir$libdir"
> + 		    ;;
> + 		esac
> + 	      fi
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
