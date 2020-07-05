From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun, 5 Jul 2020 14:40:29 -0300
Subject: [Buildroot] [PATCH] package/dvb-apps: add hash file
In-Reply-To: <20200705145430.20cc4911@windsurf.home>
References: <20200704010533.1854-1-sergio.prado@e-labworks.com>
 <20200705145430.20cc4911@windsurf.home>
Message-ID: <CANu7NGvssmqH8S9joP3-8hsgDNP6Q_1BP8PwR8s5Xx6knfWbnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

> > diff --git a/package/dvb-apps/dvb-apps.hash
b/package/dvb-apps/dvb-apps.hash
> > new file mode 100644
> > index 000000000000..a618cd7765d3
> > --- /dev/null
> > +++ b/package/dvb-apps/dvb-apps.hash
> > @@ -0,0 +1,6 @@
> > +# Locally computed:
> > +sha256
 099ccbad8dc7263cbeae4c8439f181fb0c031624d8afb40d00bb7462aa1ea645
 dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz
>
> Unfortunately, this doesn't work: it seems like our hashes for
> Mercurial fetched packages are not reproducible:
>
> ERROR: dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz has wrong
sha256 hash:
> ERROR: expected:
099ccbad8dc7263cbeae4c8439f181fb0c031624d8afb40d00bb7462aa1ea645
> ERROR: got     :
926208b7e711b4bab1a909ff9bf4e6ae54acdd30a46f5d5bd700ecb088fe1f57
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> dl-wrapper: Re-downloading
'dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz'...
> real URL is https://linuxtv.org/hg/dvb-apps
> requesting all changes
> adding changesets
> adding manifests
> adding file changes
> added 1506 changesets with 6093 changes to 2111 files
> new changesets d9fe7e17226f:3d43b280298c
> ERROR: dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz has wrong
sha256 hash:
> ERROR: expected:
099ccbad8dc7263cbeae4c8439f181fb0c031624d8afb40d00bb7462aa1ea645
> ERROR: got     :
926208b7e711b4bab1a909ff9bf4e6ae54acdd30a46f5d5bd700ecb088fe1f57
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> --2020-07-05 14:51:38--
http://sources.buildroot.net/dvb-apps/dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz
> Resolving sources.buildroot.net (sources.buildroot.net)...
2606:4700:20::681a:25, 2606:4700:20::681a:125, 2606:4700:20::ac43:4838, ...
> Connecting to sources.buildroot.net (sources.buildroot.net)|2606:4700:20::681a:25|:80...
connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 453406 (443K) [application/x-gtar-compressed]
> Saving to:
?/home/thomas/projets/buildroot/output/build/.dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz.MM0BzY/output?
>
> /home/thomas/projets/bui 100%[================================>] 442,78K
 1,82MB/s    in 0,2s
>
> 2020-07-05 14:51:38 (1,82 MB/s) -
?/home/thomas/projets/buildroot/output/build/.dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz.MM0BzY/output?
saved [453406/453406]
>
> dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz: OK (sha256:
099ccbad8dc7263cbeae4c8439f181fb0c031624d8afb40d00bb7462aa1ea645)
>
> Basically, your hash only matches the tarball on sources.buildroot.net,
> but not the tarball I can generate locally after cloning from the
> Mercurial repository.

Indeed I removed sources.buildroot.net from the mirrors location and got
the same error. What's interesting is that I got the same hash as you. So
the tar generated in our machines was exactly the same, but it is different
from the one hosted in sources.buildroot.net.

>>> dvb-apps 3d43b280298c39a67d1d889e01e173f52c12da35 Downloading
real URL is https://linuxtv.org/hg/dvb-apps
requesting all changes
adding changesets
adding manifests
adding file changes
added 1506 changesets with 6093 changes to 2111 files


new changesets d9fe7e17226f:3d43b280298c
ERROR: dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz has wrong
sha256 hash:
ERROR: expected:
099ccbad8dc7263cbeae4c8439f181fb0c031624d8afb40d00bb7462aa1ea645
ERROR: got     :
926208b7e711b4bab1a909ff9bf4e6ae54acdd30a46f5d5bd700ecb088fe1f57
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
package/pkg-generic.mk:167: recipe for target
'/opt/build/buildroot/build/dvb-apps/qemu_arm_uclibc_ext/build/dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35/.stamp_downloaded'
failed
make[1]: ***
[/opt/build/buildroot/build/dvb-apps/qemu_arm_uclibc_ext/build/dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35/.stamp_downloaded]
Error 1
Makefile:23: recipe for target '_all' failed
make: *** [_all] Error 2

I also notice that there is a path in the tar file metadata fetched from
sources.buildroot.net (the generated locally doesn't have this path).

$ xxd dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz
00000000: 1f8b 0808 6c92 2c53 02ff 2f68 6f6d 652f  ....l.,S../home/
00000010: 7065 6b6f 2f73 6f75 7263 652f 6275 696c  peko/source/buil
00000020: 6472 6f6f 742f 6f75 7470 7574 2f62 7569  droot/output/bui
00000030: 6c64 2f2e 6476 622d 6170 7073 2d33 6434  ld/.dvb-apps-3d4
00000040: 3362 3238 3032 3938 6333 3961 3637 6431  3b280298c39a67d1
00000050: 6438 3839 6530 3165 3137 3366 3532 6331  d889e01e173f52c1
00000060: 3264 6133 352e 7461 722e 677a 2e38 7363  2da35.tar.gz.8sc
00000070: 326a 6f2f 6f75 7470 7574 00ec bd6b 7b1b  2jo/output...k{.
00000080: 3792 28bc 5fd5 bf02 af66 662d 6629 8a17  7.(._....ff-f)..
00000090: dd6c c599 5014 6571 425d 4252 76bc 3939  .l..P.eqB]BRv.99

Best regards,

Sergio Prado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200705/019ca6b4/attachment.html>
