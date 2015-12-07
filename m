From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 7 Dec 2015 17:54:08 -0500
Subject: [Buildroot] [psa] various server software upgrades
In-Reply-To: <87egexoqf4.fsf@dell.be.48ers.dk>
References: <20151202073542.GY23754@vapier.lan> <20151206214229.GE4023@free.fr>
 <87610bs0dv.fsf@dell.be.48ers.dk>
 <20151207015525.GH23754@vapier.lan>
 <87bna2rckx.fsf@dell.be.48ers.dk>
 <20151207185106.GF11489@vapier.lan>
 <87r3iyngfx.fsf@dell.be.48ers.dk>
 <20151207215548.GB24430@vapier.lan>
 <87egexoqf4.fsf@dell.be.48ers.dk>
Message-ID: <20151207225408.GC24430@vapier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07 Dec 2015 23:16, Peter Korsgaard wrote:
> >>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:
> 
>  >> I would actually prefer if we only enforce https where it matters,
>  >> E.G. on bugs.*. We can (and SHOULD now that we've uses the HSTS headers)
>  >> support https on the other subdomains, but I don't think we should
>  >> redirect http to https.
> 
>  > i guess we disagree on the "where it matters" part.  any unencrypted
>  > connection can be injected with ads/javascript which can redirect the
>  > content to any site or capture any state the user has.
> 
> Well, what I mean is that this is always about trade offs. The risk of
> man in the middle attacks / ads vs the risks of various breakage because
> of missing/invalid certs/old clients/whatever.
> 
> Bugzilla is a bit special as we have user authentication, the other sub
> domains less so.
> 
> Don't get me wrong, I find it very good that we are improving the
> security situation - I just would prefer we keep the amount of breakage
> to a minimum while we configure this.
> 
> So how about if we drop the global HSTS headers and http->https
> redirects for now and then move a bit more slowly forward sub domain by
> subdomain:
> 
> 1: Enable https next to http and verify that it works
> 2: Add http->https redirect and verify that it works
> 3: add HSTS header

we're already at (3).  even if we weren't, i don't see how transitioning
would affect the SNI issue.  the question is simple: how long do you want
to (try to) support old systems where people refuse to fix their setup ?
we're talking about systems that are over three years old (wget-1.14 was
released in Aug 2012).  what is your cut off ?  3 years ?  4 years ?  i'd
also highlight <wget-1.16 versions have@least one security vuln that
can be remotely exploited (when you download via ftp -- CVE-2014-4877).

>  > imo, if a dev's system is so old it doesn't support SNI, then it's their
>  > problem to workaround it.  even if they get the latest buildroot version,
>  > they're going to keep having the same problem when they try to download
>  > and build software as other servers use SNI.  are we now responsible for
>  > bootstrapping openssl/ca-certificates/wget as host tools so SNI/etc...
>  > are supported ?  how do you get the software for those packages in order
>  > to bootstrap ?  do you bundle the openssl/ca-certificates/wget tarballs
>  > inside of buildroot itself ?  let's just rip the band aid off and be done.
> 
> I agree, old systems are a pain - But we do try to keep buildroot
> working on various enterprise distributions when possible. So far we've
> worked around SNI issues by using http URLs from those locations instead
> (and verifying against our local hashes).

that doesn't help when sites transition to http->https redirects such as
uclibc.org now does.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151207/72336cb1/attachment.asc>
