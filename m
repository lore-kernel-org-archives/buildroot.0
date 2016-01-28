From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Jan 2016 23:05:53 +0100
Subject: [Buildroot] [PATCH v2 04/17] pulseaudio: remove
 BR2_ARCH_HAS_ATOMICS dependency
In-Reply-To: <1453934861-26364-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453934861-26364-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453934861-26364-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160128220553.GC7523@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-01-27 23:47 +0100, Thomas Petazzoni spake thusly:
> pulseaudio is able to either use the atomic __sync builtins from the
> compiler, or to rely on libatomic_ops for atomic operations. However,
> since it anyway selects json-c which requires the __sync built-ins, it
> means using libatomic_ops is useless: even if you use libatomic_ops
> for pulseaudio, you'd still get a link error in pulseaudio due to the
> missing __sync built-in for the json-c library.
> 
> Also, since pulseaudio now inherits the BR2_TOOLCHAIN_HAS_SYNC_4 from
> json-c, which matches the __sync built-in from pulseaudio, this
> commit:
> 
>  - Drops the BR2_ARCH_HAS_ATOMICS dependency
>  - Forces pulseaudio to not detect libatomic_ops
>  - Propagates the removal of BR2_ARCH_HAS_ATOMICS dependency to
>    pulseaudio's reverse dependencies.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[--SNIP--]
> diff --git a/package/gstreamer/gst-plugins-good/Config.in b/package/gstreamer/gst-plugins-good/Config.in
> index c2ec5b0..36ab6cb 100644
> --- a/package/gstreamer/gst-plugins-good/Config.in
> +++ b/package/gstreamer/gst-plugins-good/Config.in
> @@ -212,7 +211,7 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE
>  
>  comment "pulseaudio support needs a toolchain w/ threads, dynamic library"
>  	depends on BR2_USE_MMU
> -	depends on BR2_ARCH_HAS_ATOMICS
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4

EWhen you move the 'depends on _SYNC_4' to the previous patch (ditto for
the other comments), you can add my:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
