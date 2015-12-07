From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 Dec 2015 21:37:22 +0100
Subject: [Buildroot] [psa] various server software upgrades
In-Reply-To: <20151207185106.GF11489@vapier.lan> (Mike Frysinger's message of
 "Mon, 7 Dec 2015 13:51:06 -0500")
References: <20151202073542.GY23754@vapier.lan>
 <20151206214229.GE4023@free.fr> <87610bs0dv.fsf@dell.be.48ers.dk>
 <20151207015525.GH23754@vapier.lan> <87bna2rckx.fsf@dell.be.48ers.dk>
 <20151207185106.GF11489@vapier.lan>
Message-ID: <87r3iyngfx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

Hi,

>> Ok, but for sources.buildroot.net I wouldn't want to enforce TLS as
 >> E.G. wget on ancient enterprice dists wont recognize the CA and fail.

 > are you sure about that ?  LE's CA is cross-signed and has pretty good support:
 > https://community.letsencrypt.org/t/which-browsers-and-operating-systems-support-lets-encrypt/4394

I'm not 100% sure, but we have had various issues in the
past. E.G. checking with an old wget version here I see it can no longer
download our tarballs:

wget http://buildroot.org/downloads/buildroot-2015.11.1.tar.gz
--2015-12-07 21:29:37--  http://buildroot.org/downloads/buildroot-2015.11.1.tar.gz
Resolving buildroot.org... 140.211.167.224
Connecting to buildroot.org|140.211.167.224|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://buildroot.org/downloads/buildroot-2015.11.1.tar.gz [following]
--2015-12-07 21:29:37--  https://buildroot.org/downloads/buildroot-2015.11.1.tar.gz
Connecting to buildroot.org|140.211.167.224|:443... connected.
ERROR: certificate common name `bugs.busybox.net' doesn't match requested host name `buildroot.org'.
To connect to buildroot.org insecurely, use `--no-check-certificate'.

(this is with wget 1.12 from 2009).

Now, this isn't about the letsencrypt CA as such, but presumably because
it doesn't understand SNI - But the end result is the same.

I would actually prefer if we only enforce https where it matters,
E.G. on bugs.*. We can (and SHOULD now that we've uses the HSTS headers)
support https on the other subdomains, but I don't think we should
redirect http to https.

 >> >> We have the same problem for lists.{buildroot,busybox,uclibc}.*, as that
 >> >> ends up serving an osuosl certificate.
 >> 
 >> > those aren't a new issue ... they've always used osuosl certs.  those are
 >> > out of my control.

Yes, but when we sent HSTS headers with includeSubDomains I atleast get
the following error in chromium:

lists.busybox.net normally uses encryption to protect your
information. When Chromium tried to connect to lists.busybox.net this
time, the website sent back unusual and incorrect credentials. Either an
attacker is trying to pretend to be lists.busybox.net, or a Wi-Fi
sign-in screen has interrupted the connection. Your information is still
secure because Chromium stopped the connection before any data was
exchanged.

You cannot visit lists.busybox.net right now because the website uses
HSTS. Network errors and attacks are usually temporary, so this page
will probably work later.

NET::ERR_CERT_COMMON_NAME_INVALID

With no option of continuing.


>> Yes, but with the HSTS headers we now force people to access it through
 >> https, and atleast my browser won't allow it because the certificate
 >> doesn't match.

 > so click through the warning message.  firefox/chrome/etc... have no problem
 > here.

See above, not possible with atleast chromium after it has seen HSTS
with includeSubDomains.


 >> > there is no need to distribute the same keys here.  just generate ones
 >> > for the domains in question using let's encrypt.
 >> 
 >> I'll have a look at generating letsencrypt keys for nightly.* and
 >> patchwork.*.
 >> 
 >> Any specific hints about it?

 > $ letsencrypt certonly --webroot --webroot-path /path/to/your/webserver/ \
 > 	-d main-dns-name -d an-alias-if-you-have-one -d more...

Thanks!

-- 
Venlig hilsen,
Peter Korsgaard 
