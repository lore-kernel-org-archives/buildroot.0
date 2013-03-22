From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 22 Mar 2013 18:26:58 +0100
Subject: [Buildroot] Package overriding
In-Reply-To: <CAE21AQraBRp3_94Td_Gw+D9NML+-X0e+2U=cwR979ww99_aJ=w@mail.gmail.com>
References: <CAE21AQraBRp3_94Td_Gw+D9NML+-X0e+2U=cwR979ww99_aJ=w@mail.gmail.com>
Message-ID: <514C9462.9000404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/03/13 03:33, Charles Manning wrote:
[snip]
> For example, I recently needed to add two more configuration lines to
> building bluez_utils.
>
> Instead of:
>
> BLUEZ_UTILS_CONF_OPT = --enable-test --enable-tools
> I wanted
> BLUEZ_UTILS_CONF_OPT = --enable-test --enable-tools --enable-bccmd --enable-dund
>
>
> A logical way I can see to do this would be to have a mechanism
> similar to Package Override but that is applied after the packages are
> parsed.
>
> --- Makefile	(revision 20385)
> +++ Makefile	(working copy)
> @@ -319,11 +319,20 @@
>   -include $(PACKAGE_OVERRIDE_FILE)
>   endif
>
>   include package/*/*.mk
>   include hj/package/*/*.mk
>   include boot/common.mk
>   include linux/linux.mk
>
> +POST_PACKAGE_OVERRIDE_FILE=$(call qstrip,$(BR2_POST_PACKAGE_OVERRIDE_FILE))
> +ifneq ($(POST_PACKAGE_OVERRIDE_FILE),)
> +-include $(POST_PACKAGE_OVERRIDE_FILE)
> +endif
> +
> +
>
> Then have POST_PACKAGE_OVERRIDE_FILE point to a file which has
>
> # Add bluez_utils options we need
> BLUEZ_UTILS_CONF_OPT +=  --enable-bccmd --enable-dund
>
> Does that sound useful?

  The problem with this approach is that it is not reliable. It _happens_ 
to work fine for _CONF_OPT. But it would not work for _DEPENDENCIES, for 
example, because the rule that consumes that variable comes before it. 
And probably there are some variables where it doesn't work at all 
because of some weird double-dollar stuff.

  That's why we just don't want to deal with this kind of changes. The 
override file is meant to be a development tool that allows you to hack 
the source code for a package. For other stuff, you should modify the 
package's .mk file directly.


> Is there a better way?

  In this particular case, the better way is to create new Config.in 
options for bccmd and dund. And send us the patch, of course.


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
