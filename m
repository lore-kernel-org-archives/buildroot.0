From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 7 Dec 2015 16:55:48 -0500
Subject: [Buildroot] [psa] various server software upgrades
In-Reply-To: <87r3iyngfx.fsf@dell.be.48ers.dk>
References: <20151202073542.GY23754@vapier.lan> <20151206214229.GE4023@free.fr>
 <87610bs0dv.fsf@dell.be.48ers.dk>
 <20151207015525.GH23754@vapier.lan>
 <87bna2rckx.fsf@dell.be.48ers.dk>
 <20151207185106.GF11489@vapier.lan>
 <87r3iyngfx.fsf@dell.be.48ers.dk>
Message-ID: <20151207215548.GB24430@vapier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07 Dec 2015 21:37, Peter Korsgaard wrote:
> >>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:
> 
> >> Ok, but for sources.buildroot.net I wouldn't want to enforce TLS as
>  >> E.G. wget on ancient enterprice dists wont recognize the CA and fail.
> 
>  > are you sure about that ?  LE's CA is cross-signed and has pretty good support:
>  > https://community.letsencrypt.org/t/which-browsers-and-operating-systems-support-lets-encrypt/4394
> 
> I'm not 100% sure, but we have had various issues in the
> past. E.G. checking with an old wget version here I see it can no longer
> download our tarballs:
> 
> wget http://buildroot.org/downloads/buildroot-2015.11.1.tar.gz
> --2015-12-07 21:29:37--  http://buildroot.org/downloads/buildroot-2015.11.1.tar.gz
> Resolving buildroot.org... 140.211.167.224
> Connecting to buildroot.org|140.211.167.224|:80... connected.
> HTTP request sent, awaiting response... 301 Moved Permanently
> Location: https://buildroot.org/downloads/buildroot-2015.11.1.tar.gz [following]
> --2015-12-07 21:29:37--  https://buildroot.org/downloads/buildroot-2015.11.1.tar.gz
> Connecting to buildroot.org|140.211.167.224|:443... connected.
> ERROR: certificate common name `bugs.busybox.net' doesn't match requested host name `buildroot.org'.
> To connect to buildroot.org insecurely, use `--no-check-certificate'.
> 
> (this is with wget 1.12 from 2009).
> 
> Now, this isn't about the letsencrypt CA as such, but presumably because
> it doesn't understand SNI - But the end result is the same.

right, this has nothing to do with any CA, it's because that version lacks
SNI support.  the current buildroot.org cert is only for that domain, and
buildroot.org/downloads is off that vhost.  but the client has to support
SNI to select the correct vhost during the SSL handshaking otherwise it is
sent to the default ("bugs.busybox.net" in this case).

looking at lib/server/client support, it seems like wget is the biggest
red flag:
https://en.wikipedia.org/wiki/Server_Name_Indication
it didn't include support until 1.14 in 2012.

i can see about changing the default vhost to a stub domain so it'll be
more clear what the issue is as that log is misleading -- at its face, it
makes no sense why the client was sent to bugs.busybox.net.

> I would actually prefer if we only enforce https where it matters,
> E.G. on bugs.*. We can (and SHOULD now that we've uses the HSTS headers)
> support https on the other subdomains, but I don't think we should
> redirect http to https.

i guess we disagree on the "where it matters" part.  any unencrypted
connection can be injected with ads/javascript which can redirect the
content to any site or capture any state the user has.

imo, if a dev's system is so old it doesn't support SNI, then it's their
problem to workaround it.  even if they get the latest buildroot version,
they're going to keep having the same problem when they try to download
and build software as other servers use SNI.  are we now responsible for
bootstrapping openssl/ca-certificates/wget as host tools so SNI/etc...
are supported ?  how do you get the software for those packages in order
to bootstrap ?  do you bundle the openssl/ca-certificates/wget tarballs
inside of buildroot itself ?  let's just rip the band aid off and be done.

>  >> >> We have the same problem for lists.{buildroot,busybox,uclibc}.*, as that
>  >> >> ends up serving an osuosl certificate.
>  >> 
>  >> > those aren't a new issue ... they've always used osuosl certs.  those are
>  >> > out of my control.
> 
> Yes, but when we sent HSTS headers with includeSubDomains I atleast get
> the following error in chromium:
> 
> lists.busybox.net normally uses encryption to protect your
> information. When Chromium tried to connect to lists.busybox.net this
> time, the website sent back unusual and incorrect credentials. Either an
> attacker is trying to pretend to be lists.busybox.net, or a Wi-Fi
> sign-in screen has interrupted the connection. Your information is still
> secure because Chromium stopped the connection before any data was
> exchanged.
> 
> You cannot visit lists.busybox.net right now because the website uses
> HSTS. Network errors and attacks are usually temporary, so this page
> will probably work later.
> 
> NET::ERR_CERT_COMMON_NAME_INVALID
> 
> With no option of continuing.

mine has an "Advanced" link after that which includes "Proceed".  i went
to bugs.busybox.net first, then to lists.busybox.net, and it worked fine.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151207/9afeea0c/attachment.asc>
