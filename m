From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 16 May 2019 00:15:16 +0300
Subject: [Buildroot] [PATCH 4/5] package/wpewebkit: bump to version
 2.24.1
In-Reply-To: <20190515195334.GA2441@scaer>
References: <20190514114111.20424-1-aperez@igalia.com>
 <20190514114111.20424-5-aperez@igalia.com>
 <CAB0FRstZPttVSDYzYGih2nfdTdZ7UKuipDGPKWSaBJf6h_LVSw@mail.gmail.com>
 <20190515145239.GB9191@momiji> <20190515160530.234d9212@windsurf>
 <20190515211139.GB26229@momiji> <20190515195334.GA2441@scaer>
Message-ID: <20190516001516.GB4444@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

On Wed, 15 May 2019 21:53:34 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> Adrian, Thomas, All,
> 
> On 2019-05-15 21:11 +0300, Adrian Perez de Castro spake thusly:
> > On Wed, 15 May 2019 16:05:30 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> > > Adding Peter in Cc. I know he'll like it :-)
> > > Adding Yann in Cc. I know he won't like it :-)
> 
> I see the wink, but still, meh... ;-)
> 
> > Personally, I like the suggestion, but I will wait for feedback on this
> > before sending v2 of the patch set.
> 
> Well, as you said previously, what good is a browser without support for
> one of the most prominent image format on the web?
>
> If you were arguing for BMP or TGA, we'd use a conditional dependency.
> 
> But please note that openjpeg is a JPEG 2000 codec, not a JPEG one.
> JPEG 2000 is much less used on the web:
> 
>     https://en.wikipedia.org/wiki/Comparison_of_web_browsers#Image_format_support
> 
> Only Konqueror, Midori, Omniweb, and Safari are said to support it.

?and now WebKitGTK, and WPE WebKit :)

With my WebKit maintainer hat on, let me tell you a short story.

We have been forced to add support for JPEG2000 [1] because our user-agent is
similar to that of Safari (because? our WebKit ports *are* using the same Web
engine as Safari?there is no point denying it!) and a few sites started over
a year ago to send JPEG2000 images replies, then a few more, and then some.
At some point Akamai's Image Manager [2] started serving JPEG2000 images
transparently: the HTML references an URL ending in ?.png? (for example),
and Akamai will return a JPEG2000 in the response (with an appropriate
Content-Type HTTP header, of course). At this point, if we don't support
JPEG2000, a good chunk of popular websites will just look broken because
the images returned by popular CDNs or the websites themselves cannot be
decoded.

This above is what I meant with ?many websites will silently fail to
show images without [OpenJPEG support] enabled?.

I hope this helps understand why I am so insistent in having the OpenJPEG
support enabled unconditionally: preventing that the Web is broken when
browsing with a WebKit-based browser.

The rationale why we have in the CMake build files in WebKit an ?USE_OPENJPEG?
build-time option is to disable it when configuring for distributions which
either a.) do not ship an OpenJPEG package, or b.) ship an old version that
does not include some new API that WebKit needs (example: Ubuntu LTS).
Buildroot does not fall into any of the categories above, and therefore I
would argue that either we use ?select? to depend unconditionally on OpenJPEG,
or ?imply? to choose it by default while still allowing to deselect it by
hand.

> Also, Thomas, please note that NetSurf does not support it eitther. ;-]

Then again, NetSurf does not have an user-agent close enough to a WebKit
one as to be served JPEG2000 images }:-)

> So, in this case, I would argue for a conditional dependency, as Adrian
> initially suggested below:
> 
> > > On Wed, 15 May 2019 14:52:39 +0300
> > > Adrian Perez de Castro <aperez@igalia.com> wrote:
> > > > > openjpeg is an optional dependency
> > > > > ifeq ($(BR2_PACKAGE_OPENJPEG),y)
> > > > > WPEWEBKIT_CONF_OPTS += -DUSE_OPENJPEG=ON
> > > > > WPEWEBKIT_DEPENDENCIES += openjpeg
> > > > > else
> > > > > WPEWEBKIT_CONF_OPTS += -DUSE_OPENJPEG=OFF
> > > > > endif  
> 
> ... here ^^^.
> 
> Sorry, but I still dislike "imply". :-p

I hope that my little store above might help you change your mind, if
only a little bit :-)

Best regards,
?Adri?n

---
[1] https://bugs.webkit.org/show_bug.cgi?id=186272
[2] https://www.akamai.com/us/en/products/performance/image-manager.jsp
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190516/f16b44f8/attachment.asc>
