From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 8 Nov 2017 00:45:28 +0100
Subject: [Buildroot] [RFCv1 2/4] core: change host RPATH handling
In-Reply-To: <20171107222259.4ec2548c@windsurf>
References: <20171103160627.6468-1-thomas.petazzoni@free-electrons.com>
 <20171103160627.6468-3-thomas.petazzoni@free-electrons.com>
 <ca5edb67-da78-bf4c-1578-c897a26218c6@mind.be>
 <20171107222259.4ec2548c@windsurf>
Message-ID: <1ccab707-117d-b2d3-d8b0-97a6686d1d0d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-11-17 22:22, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 7 Nov 2017 22:15:38 +0100, Arnout Vandecappelle wrote:
[snip]
>>  One advantage of --make-rpath-relative over --set-rpath is that the former will
>> also remove rpaths that are not needed (which I guess is often the case for host
>> tools).
> 
> Well, --set-rpath sets the RPATH, so I believe it entirely removes any
> existing RPATH and replaces them all by just $ORIGIN/../lib. So I don't
> see how it could be more "efficient", since we're down to a single
> RPATH, which is the only rpath that is needed.

 In many cases, no rpath is needed because it doesn't link with any
Buildroot-built libraries. In that case, no rpath is slightly more efficient for
application startup.

> 
> Perhaps the only problem that I can think of is if some host binaries
> do have libraries installed in non-standard locations, and really need
> a custom absolute RPATH such
> as /home/foo/buildroot/output/per-package/host/lib/baz/ to be turned
> into $ORIGIN/../lib/baz/. However, I don't think we have such
> non-standard library locations for host packages, so I simply ignored
> this possible problem for now. It is a problem that can be fixed later
> on if needed by adjusting the host rpath mangling logic.

 I've taken a quick look at what I have in my build dirs, and there is no .so
file in another location except for dlopen()'d stuff.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
