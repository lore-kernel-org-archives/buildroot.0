From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 Dec 2015 23:16:31 +0100
Subject: [Buildroot] [psa] various server software upgrades
In-Reply-To: <20151207215548.GB24430@vapier.lan> (Mike Frysinger's message of
 "Mon, 7 Dec 2015 16:55:48 -0500")
References: <20151202073542.GY23754@vapier.lan>
 <20151206214229.GE4023@free.fr> <87610bs0dv.fsf@dell.be.48ers.dk>
 <20151207015525.GH23754@vapier.lan> <87bna2rckx.fsf@dell.be.48ers.dk>
 <20151207185106.GF11489@vapier.lan> <87r3iyngfx.fsf@dell.be.48ers.dk>
 <20151207215548.GB24430@vapier.lan>
Message-ID: <87egexoqf4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

Hi,

 >> (this is with wget 1.12 from 2009).
 >> 
 >> Now, this isn't about the letsencrypt CA as such, but presumably because
 >> it doesn't understand SNI - But the end result is the same.

 > right, this has nothing to do with any CA, it's because that version lacks
 > SNI support.  the current buildroot.org cert is only for that domain, and
 > buildroot.org/downloads is off that vhost.  but the client has to support
 > SNI to select the correct vhost during the SSL handshaking otherwise it is
 > sent to the default ("bugs.busybox.net" in this case).

Indeed.

 >> I would actually prefer if we only enforce https where it matters,
 >> E.G. on bugs.*. We can (and SHOULD now that we've uses the HSTS headers)
 >> support https on the other subdomains, but I don't think we should
 >> redirect http to https.

 > i guess we disagree on the "where it matters" part.  any unencrypted
 > connection can be injected with ads/javascript which can redirect the
 > content to any site or capture any state the user has.

Well, what I mean is that this is always about trade offs. The risk of
man in the middle attacks / ads vs the risks of various breakage because
of missing/invalid certs/old clients/whatever.

Bugzilla is a bit special as we have user authentication, the other sub
domains less so.

Don't get me wrong, I find it very good that we are improving the
security situation - I just would prefer we keep the amount of breakage
to a minimum while we configure this.

So how about if we drop the global HSTS headers and http->https
redirects for now and then move a bit more slowly forward sub domain by
subdomain:

1: Enable https next to http and verify that it works
2: Add http->https redirect and verify that it works
3: add HSTS header


 > imo, if a dev's system is so old it doesn't support SNI, then it's their
 > problem to workaround it.  even if they get the latest buildroot version,
 > they're going to keep having the same problem when they try to download
 > and build software as other servers use SNI.  are we now responsible for
 > bootstrapping openssl/ca-certificates/wget as host tools so SNI/etc...
 > are supported ?  how do you get the software for those packages in order
 > to bootstrap ?  do you bundle the openssl/ca-certificates/wget tarballs
 > inside of buildroot itself ?  let's just rip the band aid off and be done.

I agree, old systems are a pain - But we do try to keep buildroot
working on various enterprise distributions when possible. So far we've
worked around SNI issues by using http URLs from those locations instead
(and verifying against our local hashes).


 >> You cannot visit lists.busybox.net right now because the website uses
 >> HSTS. Network errors and attacks are usually temporary, so this page
 >> will probably work later.
 >> 
 >> NET::ERR_CERT_COMMON_NAME_INVALID
 >> 
 >> With no option of continuing.

 > mine has an "Advanced" link after that which includes "Proceed".  i went
 > to bugs.busybox.net first, then to lists.busybox.net, and it worked fine.

I can do that as well in iceweasel, but not in Chromium :/

-- 
Venlig hilsen,
Peter Korsgaard 
