From: Pascal =?ISO-8859-1?Q?H=FCrst?= <pascal.huerst@gmail.com>
Date: Wed, 23 Apr 2014 18:12:32 +0200
Subject: [Buildroot] Adding google-breakpad to buildroot
In-Reply-To: <CAHXCMMKSGHSvYLr9JALDr0YzD4uTshQrNZYm46-0kgGpUP4Ptw@mail.gmail.com>
References: <1398262906.30640.4.camel@mbpro.localhost>
 <5357DC41.6020608@mind.be>
 <CAHXCMMKSGHSvYLr9JALDr0YzD4uTshQrNZYm46-0kgGpUP4Ptw@mail.gmail.com>
Message-ID: <1398269552.30640.13.camel@mbpro.localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mit, 2014-04-23 at 17:52 +0200, Samuel Martin wrote:
> Hi Pascal, Arnout, all,
> 
> On Wed, Apr 23, 2014 at 5:29 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> > On 23/04/14 16:21, Pascal H?rst wrote:
> >> Hi everyone,
> >>
> >> we are planing to add google-breakpad to buildroot.
> >>
> >> From the project description at
> >> http://code.google.com/p/google-breakpad/:
> >>
> >> [...] "Breakpad is a library and tool suite that allows you to
> >> distribute an application to users with compiler-provided debugging
> >> information removed, record crashes in compact "minidump" files, send
> >> them back to your server, and produce C and C++ stack traces from these
> >> minidumps." [...]
> >>
> >> Adding a package to buildroot is easy, but in this case we will have to
> >> find a way to extract all symbols from the target binaries, before they
> >> get stripped.
> 
> Here, you mean adding the host-breakpad package, right?

I acutally mean both sides. Right now it (*.mk) looks something like
that:

GOOGLE_BREAKPAD_VERSION = 1276
GOOGLE_BREAKPAD_SITE = http://google-breakpad.googlecode.com/svn/trunk
GOOGLE_BREAKPAD_SITE_METHOD = svn
 
GOOGLE_BREAKPAD_CONF_OPT = --disable-processor --disable-tools 
$(eval $(host-autotools-package))
$(eval $(autotools-package))

> IIRC, the handler in integrated at the source code level in the
> projects. Do you plan to provide something for the target?

exactly, host and target are needed

> >> My idea was to add a new target to the Makefile, just
> >> before "target-finalize:" and check against an option in the config
> >> like:
> >>
> >> ifeq ($(BR2_ENABLE_BREAKPAD),y)
> >>         TARGETS+=target-generate-breakpad-symbols
> >> endif
> >>
> >> and then:
> >>
> >> target-generate-breakpad-symbols:
> >>         extract symbols and deploy result to output/images
> >>
> >> Is this basically the way to go, or is there a better way to achieve
> >> this?
> >
> >  It is easier to add it to the target-finalize target. Then you can be
> > sure that the ordering is correct (target-finalize already has all the
> > needed dependencies). You can also easily use conditions there (it's not
> > inside a define).
> >
> >  However, I think it will be more appropriate to implement breakpad as an
> > additional strip alternative. You probably don't want to combine strip
> > with breakpad...
> 
> I think breakpad is more like a pre-strip hook, that one can enable or
> not. But in the end, the target image will be stripped most of the
> time (at least, this is the way I would use such a feature).

I agree, since the extraction of the symbols should always happen, when
breakpad is used, no mater what strip alternative is selected

> > Currently we have none, strip or sstrip, it should be
> > relatively easy to add breakpad as an additional option. Note, however,
> > that the strip code is very old, it doesn't satisfy our coding style so
> > we'll probably want you to do some cleanup first. Also, it is currently
> > untested in the autobuilders AFAIK.
> >
> 
> Regards,
> 
> 

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 198 bytes
Desc: This is a digitally signed message part
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140423/a29df25c/attachment.asc>
