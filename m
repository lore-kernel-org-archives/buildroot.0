From: =?utf-8?Q?Stefan_Fr=C3=B6berg?= <stefan.froberg@protonmail.com>
Date: Fri, 06 Nov 2020 22:25:14 +0000
Subject: [Buildroot] package: unbound
Message-ID: <RSMD6pMmH9kbwlgdtIBekjPbpmDJIJXdmW3ajKbCkH59as-Tahf0GZZ4MhGCl68PH478MEQZZa_oEhDGRXKS-phf4ugArLnKn9mo9rvFNV8=@protonmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nice of you to accept my original patch...It only took you 2 years.

My original patch:

http://buildroot-busybox.2317881.n4.nabble.com/PATCH-v2-1-1-unbound-new-package-td184477.html

And below exactly same as above but only few lines removed

https://git.buildroot.org/buildroot/tree/package/unbound/Config.in
https://git.buildroot.org/buildroot/tree/package/unbound/unbound.mk

Now at least, I don't need to patch my copy of buildroot everytime i do update.

P.S:

Improvement suggestion: Let user enable DNSSEC.

Have option in Config.in to enable DNSSEC in unbound.conf

Either by sed/grepping unbound.conf in post-install phase OR two copies of bare-bone unbound.conf:
one for unbound_non_DNSSEC.conf and one for unbound.DNSSEC.conf and then just install/cp the correct
one into target/etc/unbound/unbound.conf in post-install phase.

Also you need to patch S70unbound to run unbound-anchor to initialize the anchor file
if unbound.conf has DNSSEC enabled.
In otherwords, startup-script finds if the "auto-trust-anchor-file" line is in unbound.conf:
For example:
auto-trust-anchor-file: "/etc/unbound/root-anchors.txt"

And if auto-trust-anchor-file is in unboud.conf, then check if that /etc/unbound/root-anchors.txt file exists.
If not, then you have to run "unbound-anchor -a /etc/unbound/root-anchors.txt" in script file to create it.

Also check this howto make optimized default unboud.conf

https://nlnetlabs.nl/documentation/unbound/howto-optimise/

Stefan Fr?berg
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201106/03577720/attachment.html>
