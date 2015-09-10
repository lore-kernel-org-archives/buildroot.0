From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Sep 2015 18:39:23 +0200
Subject: [Buildroot] [PATCHv3 02/15] directfb: mark as available only
 for gcc >= 4.5
In-Reply-To: <8737ymh3eb.fsf@dell.be.48ers.dk>
References: <1441144876-2628-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1441144876-2628-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <8737ymh3eb.fsf@dell.be.48ers.dk>
Message-ID: <55F1B23B.7060609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10-09-15 14:20, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > The new DirectFB version does not build with gcc 4.3 from the Blackfin
>  > toolchain. One of the reason is that va_copy has some issues, which
>  > were fixed in gcc 4.4.0
>  > (https://gcc.gnu.org/bugzilla/show_bug.cgi?id=36799). There are also
>  > some other issues, which were fixed by a patch proposed by Peter
>  > Seiderer at
>  > http://lists.busybox.net/pipermail/buildroot/2015-February/120281.html.
> 
>  > However, it probably doesn't make a lot of sense to carry patches that
>  > are not upstream for such old compilers. Instead, this commit takes
>  > the action of making DirectFB available only on toolchains using gcc
>  >> = 4.5, which was tested with the Arago toolchain. gcc 4.4 could
>  > potentially work, but wasn't tested (it is no longer supported by the
>  > internal toolchain backend, and we don't have any toolchain based on
>  > gcc 4.4), so we take the safe decision of requiring at least gcc 4.5.
> 
>  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  > ---
>  > This commit could be squashed into the DirectFB bump itself for
>  > bisectability, but was kept separate to ease the review.
> 
> Committed with the comments added as suggested by Vincente.
> 
>  > +++ b/package/gstreamer/gst-plugins-bad/Config.in
>  > @@ -263,6 +263,10 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DIRECTFB
>  >  	select BR2_PACKAGE_DIRECTFB
>  >  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  >  	depends on BR2_INSTALL_LIBSTDCPP
>  > +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
>  > +
>  > +comment "directfb needs a toolchain w/ C++, threads, gcc >= 4.5"
>  > +	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
> 
> Not directly related to this commit, but even though directfb is a
> library I think it makes more sense to use 'depends on' (and default y)
> for these options for "big libraries", as:
> 
> - People are likely to explicitly enable those libraroes if they want
>   them

 Well, except that there may be _programs_ that need that particular library.

 Except, as it turns out, in most cases we do already depend on directfb rather
than selecting it. The ones that do have a select (gstreamer and qt5) are
unlikely to have a program that needs that specific option.

> 
> - Gstreamer support size is insignificant compared to the library, and
>   people are likely to want E.G. directfb support in gstreamer if they
>   enable directfb and gstreamer, so the default y is nice
> 
> - We don't need to propagate the (often fairly complicated) library
>   dependencies to the users
> 
> This applies for E.G. wayland and Qt as well.

 For Qt it's already the case (cfr. grantlee). For wayland it's just the gst
plugin, where it indeed doesn't make sense to do it this way.


 Regards,
 Arnout

> 
> But that can (should) be handled outside this series.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
