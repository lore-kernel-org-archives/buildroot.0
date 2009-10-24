From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun, 25 Oct 2009 00:06:02 +0200
Subject: [Buildroot] Autoconf still not building (M4 ) results
In-Reply-To: <87y6n0zmjp.fsf@macbook.be.48ers.dk>
Message-ID: <69D941819FAE46C2977D4B17E848F535@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi 

There seems to be a problem somewhere in the configure script of autoconf
2.64

I found a way to solve it by setting the M4 variable in the makefile (line
42) so the configure script does not have to parse and find the m4 path.



Something seems to go wrong in the tests done around line 2378 in the
configure script (compare with configure script of v2.63 )

Snip
   { test -f "$ac_path_M4" && $as_test_x "$ac_path_M4"; } || continue
      # Root out GNU M4 1.4.5, as well as non-GNU m4 that ignore -t, -F.
      ac_snippet=change'quote(<,>)in''dir(<if''def>,mac,bug)'
      ac_snippet=${ac_snippet}pat'subst(a,\(b\)\|\(a\),\1)d'nl
      echo "ac_snippet2=$ac_snippet"
      test -z "`$ac_path_M4 -F conftest.m4f </dev/null 2>&1`" \
      && test -z "`echo $ac_snippet | $ac_path_M4 --trace=mac 2>&1`" \
snip


Meanwhile it might be a good idea to update the m4 package in buildroot to
1.4.13 instead of the current 1.4.9


-----Oorspronkelijk bericht-----
Van: Peter Korsgaard [mailto:jacmet at gmail.com] Namens Peter Korsgaard
Verzonden: zaterdag 24 oktober 2009 20:15
Aan: Sagaert Johan; buildroot at uclibc.org
Onderwerp: Re: [Buildroot] Autoconf still not building (M4 ) results

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Peter

 Sagaert> ./output/host/usr/bin/m4 -F conftest.m4f </dev/null

 Sagaert> Produces a file (see attachement ) and does not complain on the
console.

 Sagaert> This
 Sagaert> echo
'changequote(<,>)indir(<ifdef>,mac,bug)patsubst(a,\(b\)\|\(a\),\1)dnl'
 Sagaert> |\
 Sagaert>  output/host/usr/bin/m4 --trace=mac

 Sagaert> Does not output anything on the console

OK, that all looks normal. This is getting strange - To summarize:

- Fails on Ubuntu (what version?), but not on Debian
- M4 check fails on autoconf2.64, works on 2.63 - But the M4 check is
  almost completely the same for the two versions
- The two tests done by the configure script succeeds when run by hand

Does it also fail if you prepend output/host/bin:output/host/usr/bin to the
path before running configure by hand (E.G. a setup very close to how it's
done in buildroot)?

It's hard for me to debug it here as I cannot reproduce it. It would be very
helpful if you could add a few debug echo lines to ./configure around line
2356, so we can see what's going on.

--
Bye, Peter Korsgaard
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: autoconf.mk
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091025/454e5528/attachment.diff>
