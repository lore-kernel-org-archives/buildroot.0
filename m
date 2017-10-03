From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 3 Oct 2017 18:42:22 +0200
Subject: [Buildroot] [PATCH] host-lzo: default liblzo2.a install to
 host/lib
In-Reply-To: <1507038558-27163-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1507038558-27163-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20171003164222.GG4753@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew, All,

On 2017-10-03 08:49 -0500, Matt Weber spake thusly:
> Discovered the issue on a RHEL7.4 machine where
> the cmake build dynamically selected HOST_DIR/lib64
> as the installation path for the library.
> 
> Fixes failures like the following:
> host-mtd
> http://autobuild.buildroot.net/results/d31/d31581d2e60f35cf70312683df99c768e2ea8516/
> host-squashfs
> http://autobuild.buildroot.net/results/d9c/d9c95231ac774ed71580754a15ebb3b121764310/
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/lzo/lzo.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
> index 27ca459..0cafba2 100644
> --- a/package/lzo/lzo.mk
> +++ b/package/lzo/lzo.mk
> @@ -11,6 +11,9 @@ LZO_LICENSE_FILES = COPYING
>  LZO_INSTALL_STAGING = YES
>  LZO_SUPPORTS_IN_SOURCE_BUILD = NO
>  
> +# Prevent dynamically using lib64 as install libdir
> +HOST_LZO_CONF_OPTS += -DCMAKE_INSTALL_LIBDIR=lib

So, probably other packages would have the same issue, then? And indeed,
we've just had Jan on IRC reporting the same issue with a new package
he's adding.

So I suggest that we simply symlink lib64 -> lib like we do for the
target, and be done with it.

Thoughts?

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
>  LZO_CONF_OPTS += -DENABLE_SHARED=ON
>  else
> -- 
> 1.8.3.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
