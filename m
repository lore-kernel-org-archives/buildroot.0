From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 7 Dec 2015 13:51:06 -0500
Subject: [Buildroot] [psa] various server software upgrades
In-Reply-To: <87bna2rckx.fsf@dell.be.48ers.dk>
References: <20151202073542.GY23754@vapier.lan> <20151206214229.GE4023@free.fr>
 <87610bs0dv.fsf@dell.be.48ers.dk>
 <20151207015525.GH23754@vapier.lan>
 <87bna2rckx.fsf@dell.be.48ers.dk>
Message-ID: <20151207185106.GF11489@vapier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07 Dec 2015 07:34, Peter Korsgaard wrote:
> >>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:
> 
>  >> > Unfortunately, we do have subdomains that are not https-enabled, and are
>  >> > on another machine:
>  >> >     http://autobuild.buildroot.org/
>  >> 
>  >> sources.buildroot.{org,net} is another example (even though that it
>  >> normally only accessed from wget, so less critical).
> 
>  > there's really no reason you can't generate a cert for those domains using
>  > let's encrypt.  let's encrypt doesn't require you to own the root domain,
>  > just be in control of the web server the domain resolves to.
> 
> Ok, but for sources.buildroot.net I wouldn't want to enforce TLS as
> E.G. wget on ancient enterprice dists wont recognize the CA and fail.

are you sure about that ?  LE's CA is cross-signed and has pretty good support:
https://community.letsencrypt.org/t/which-browsers-and-operating-systems-support-lets-encrypt/4394

>  >> We have the same problem for lists.{buildroot,busybox,uclibc}.*, as that
>  >> ends up serving an osuosl certificate.
> 
>  > those aren't a new issue ... they've always used osuosl certs.  those are
>  > out of my control.
> 
> Yes, but with the HSTS headers we now force people to access it through
> https, and atleast my browser won't allow it because the certificate
> doesn't match.

so click through the warning message.  firefox/chrome/etc... have no problem
here.

>  >> Then we might
>  >> consider if we could HTTPS enable some of these subdomains, but they are
>  >> on different hosts, which complicates stuff (E.G. we presumably need to
>  >> distribute the buildroot.org private keys and update everywhere every 90
>  >> days).
> 
>  > there is no need to distribute the same keys here.  just generate ones
>  > for the domains in question using let's encrypt.
> 
> I'll have a look at generating letsencrypt keys for nightly.* and
> patchwork.*.
> 
> Any specific hints about it?

$ letsencrypt certonly --webroot --webroot-path /path/to/your/webserver/ \
	-d main-dns-name -d an-alias-if-you-have-one -d more...

so for bugzilla i used:
$ letsencrypt certonly --webroot \
	--webroot-path /var/www/bugstest.busybox.net/htdocs/ \
	-d bugstest.busybox.net -d bugstest.uclibc.org -d bugstest.buildroot.net \
	-d bugstest.buildroot.org
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151207/b2df0a80/attachment.asc>
