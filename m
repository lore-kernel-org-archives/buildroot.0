From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Nov 2017 22:22:59 +0100
Subject: [Buildroot] [RFCv1 2/4] core: change host RPATH handling
In-Reply-To: <ca5edb67-da78-bf4c-1578-c897a26218c6@mind.be>
References: <20171103160627.6468-1-thomas.petazzoni@free-electrons.com>
 <20171103160627.6468-3-thomas.petazzoni@free-electrons.com>
 <ca5edb67-da78-bf4c-1578-c897a26218c6@mind.be>
Message-ID: <20171107222259.4ec2548c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 7 Nov 2017 22:15:38 +0100, Arnout Vandecappelle wrote:

> > An alternative strategy would have been to keep the
> > -Wl,-rpath,$(HOST_DIR) flag, and therefore the absolute RPATH in the
> > host binaries, and fix such RPATH at the end of the build of every
> > package. However, that would require calling fix-rpath after the
> > installation of every package, which is a bit expensive.  
> 
>  As discussed, this would be the preferred approach after all.

Yes, agreed.

> > This change is independent from the per-package SDK functionality, and
> > could be applied separately.  
> 
>  Shouldn't this type of comment be below the --- ?

Well, it's not really that I expected the v1 of the patches to be
merged :-)

> > @@ -89,7 +89,8 @@ main() {
> >              cp "${PATCHELF}" "${PATCHELF}.__to_be_patched"
> >  
> >              # we always want $ORIGIN-based rpaths to make it relocatable.
> > -            sanitize_extra_args+=( "--relative-to-file" )
> > +            sanitize_args+=( "--set-rpath" )
> > +            sanitize_args+=( "\$ORIGIN/../lib" )  
> 
>  One advantage of --make-rpath-relative over --set-rpath is that the former will
> also remove rpaths that are not needed (which I guess is often the case for host
> tools).

Well, --set-rpath sets the RPATH, so I believe it entirely removes any
existing RPATH and replaces them all by just $ORIGIN/../lib. So I don't
see how it could be more "efficient", since we're down to a single
RPATH, which is the only rpath that is needed.

Perhaps the only problem that I can think of is if some host binaries
do have libraries installed in non-standard locations, and really need
a custom absolute RPATH such
as /home/foo/buildroot/output/per-package/host/lib/baz/ to be turned
into $ORIGIN/../lib/baz/. However, I don't think we have such
non-standard library locations for host packages, so I simply ignored
this possible problem for now. It is a problem that can be fixed later
on if needed by adjusting the host rpath mangling logic.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
