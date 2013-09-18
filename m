From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 Sep 2013 22:51:41 +0200
Subject: [Buildroot] [PATCH 1/3] gettext: fixup library permissions
In-Reply-To: <1379511483-30618-1-git-send-email-gustavo@zacarias.com.ar>
References: <1379511483-30618-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <523A125D.6000301@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/09/13 15:38, Gustavo Zacarias wrote:
> libintl.so* is installed without +x permissions thus preventing
> stripping. Fix it up in the post install target hooks.
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

  I wonder if this is the right path to take. There is really no reason 
why shared libs should be executable. And in the target of my 
allpackageyesconfig I find a lot more than these three:

$ find target -type f -a \
   \( -name \*.so -o -name \*.so.[0-9]* \) -a \
   \! -executable
target/usr/libexec/sudoers.so
target/usr/libexec/sudo_noexec.so
target/usr/lib/libisc.so.57.1.2
target/usr/lib/python2.7/site-packages/_omniidlmodule.so.4.1
target/usr/lib/libdvbsec.so
target/usr/lib/libesg.so
target/usr/lib/libacl.so.1.1.0
target/usr/lib/libCOSDynamic4.so.1.6
target/usr/lib/libomniDynamic4.so.1.6
target/usr/lib/libhogweed.so.2.5
target/usr/lib/libdns.so.113.0.1
target/usr/lib/libpci.so.3.2.0
target/usr/lib/nm-n.libdirectfb-1.6.so.0
target/usr/lib/libisccfg.so.50.0.9
target/usr/lib/lua/cjson.so
target/usr/lib/nm-n.libdirect-1.6.so.0
target/usr/lib/libattr.so.1.1.0
target/usr/lib/libomniORB4.so.1.6
target/usr/lib/nm-n.libfusion-1.6.so.0
target/usr/lib/libbind9.so.50.0.10
target/usr/lib/libucsi.so
target/usr/lib/libisccc.so.50.0.4
target/usr/lib/libdvbcfg.so
target/usr/lib/libomniConnectionMgmt4.so.1.6
target/usr/lib/libebml.so.3
target/usr/lib/libproxychains4.so
target/usr/lib/libdvben50221.so
target/usr/lib/libomniCodeSets4.so.1.6
target/usr/lib/libmatroska.so.5
target/usr/lib/liblwres.so.50.0.9
target/usr/lib/libdvbapi.so
target/usr/lib/libCOS4.so.1.6
target/usr/lib/liblockdev.1.0.3.so
target/usr/lib/libnettle.so.4.7
target/usr/lib/libomnithread.so.3.4


  In addition, such patches are not really future-safe in case a package 
adds a new library.

  So I would propose to instead change the find command to

STRIP_FIND_CMD += -type f
STRIP_FIND_CMD += \( -perm /111 -o -name \*.so -o -name \*.so.[0-9]* \)

  Regards,
  Arnout

> ---
>   package/gettext/gettext.mk | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
> index baf42ef..7af2035 100644
> --- a/package/gettext/gettext.mk
> +++ b/package/gettext/gettext.mk
> @@ -58,5 +58,12 @@ endef
>   endif
>   endif # GETTEXT_TOOLS = n
>
> +# Library lacks +x so strip skips it
> +define GETTEXT_FIX_LIBRARY_MODE
> +	-chmod +x $(TARGET_DIR)/usr/lib/libintl.so*
> +endef
> +
> +GETTEXT_POST_INSTALL_TARGET_HOOKS += GETTEXT_FIX_LIBRARY_MODE
> +
>   $(eval $(autotools-package))
>   $(eval $(host-autotools-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
