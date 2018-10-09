From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 10 Oct 2018 00:17:14 +0200
Subject: [Buildroot] [PATCH 2/5] webkitgtk: add dependency on the woff2
 package
In-Reply-To: <87tvmbw4qb.fsf@dell.be.48ers.dk>
References: <20180922235333.85642-1-aperez@igalia.com>
 <20180922235333.85642-3-aperez@igalia.com>	<20180925225255.3fe01107@windsurf>
 <20180927124148.GB16720@momiji>	<87tvmbw4qb.fsf@dell.be.48ers.dk>
Message-ID: <20181010001714.GD10287@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter (and all the mailing list members),

On Thu, 27 Sep 2018 13:37:48 +0200, Peter Korsgaard <peter@korsgaard.com> wrote:
> >>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:
> 
> Hi,
> 
>  >> However, since woff2 has very few dependencies, and
>  >> woff2+brotli+host-pkgconf build in 19 seconds, it's nothing compared to
>  >> webkitgtk, so I applied your patch.
> 
>  > I will make a follow-up patch to make WOFF2 optional. I think it should be
>  > fine to enable it by default if BR2_PACKAGE_WOFF2 is enabled, and add a line
>  > in the help description telling that it is recommended to enable it.
> 
> Correct. Now that we have updated kconfig we could even consider using
> the imply keyword to enable woff2 by default if it is really an option
> that most people should enable:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=237e3ad0f195d8fd34f1299e45f04793832a16fc

There's a small doubt I have here... How exactly would we prefer to have this?
I can think of two options. One would be the following, and would allow to
disable WOFF2 support in WebKitGTK+ even if the woff2 package is built:

  config BR2_PACKAGE_WEBKITGTK
      # ...
	  imply BR2_PACKAGE_WEBKITGTK_WOFF2

  config BR2_PACKAGE_WEBKITGTK_WOFF2
      bool "woff2 support"
	  depends on BR2_PACKAGE_WOFF2
	  imply BR2_PACKAGE_WOFF2

The other, simpler option, always enables WOFF2 support in WebKitGTK+ if the
woff2 package can be built:

  config BR2_PACKAGE_WEBKITGTK
      # ...
	  imply BR2_PACKAGE_WOFF2

With this second option, the only way of disabling WOFF2 support in WebKitGTK+
is *also* disabling the woff2 package completely. While this is not a problem
in this case right now (I think WebKitGTK+ is the only user of the woff2
package, after all), I would like to apply a similar treatment to some of the
build options.

Any preference/suggestion/comments? Thanks in advance,

-Adri?n

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181010/15a0a0cf/attachment.asc>
