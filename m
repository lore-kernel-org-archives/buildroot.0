From: James J. Dines <jdines@jdines.net>
Date: Mon, 30 Aug 2010 11:44:22 -0400
Subject: [Buildroot] Make 3.82 does behave differently than make 3.81 for
	sure, but ...
In-Reply-To: <201008301701.22856.yann.morin.1998@anciens.enib.fr>
References: <4C7B99D5.9010703@jdines.net> <87bp8kxlve.fsf@macbook.be.48ers.dk>
	<4C7BC441.3010006@jdines.net>
	<201008301701.22856.yann.morin.1998@anciens.enib.fr>
Message-ID: <4C7BD1D6.5070100@jdines.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/30/2010 11:01 AM, Yann E. MORIN wrote:
> James, All,
> 
> On Monday 30 August 2010 16:46:25 James J. Dines wrote:
>> That patch indeed gets things rolling.  For further edification it
> [--SNIP--]
>> Can anyone offer a good/thorough
>> explanation of what is going on by any chance, or do I have to figure it
>> out the old fashioned way?
> 
> Well, in this case, it had nothing to do with make-3.82. It was 'just' a
> variable definition that was spanning multiple lines, and did not have a
> back-slash at the end of one of those lines, so the next line was interpreted
> by make as a recipe without rule.


> 
> If you're suggesting that make-3.81 was not choking on this line, then this
> would have been a bug in make (which I doubt...).

Can you in fact unpack the 2010.05 tarball and successfully do a 'make
defconfig && make' using make 3.82?

I scp'ed the same exact tree that was failing to a box with make 3.81
without changing a thing and it built fine.  To be clear, I am talking
about stable released tarballs here that I am sure people have been
using regularly for quite some time, not the git repo.  If it is a bug
in make, then it has been there up until 3.82 ;-)  OTOH, I just bought
an 8 core laptop and installed the latest development version of Mandiva
Linux on the box where I get the failure, so maybe something else is amiss.

Still, that same new box builds various versions of vanilla and Ingo
realtime patched kernels without a problem.

If you look at this thread from the LKML:

http://comments.gmane.org/gmane.linux.kernel/1022928

... starting at the line "BTW seems like 2.6.27 no more combatible with
GNU Make 3.82:" you will see that there is definitely something
different between older makes and 3.82 (since I know 2.6.27 compiles
with many different make versions).  My guess is there is a bug in make
3.82, but this is only conjecture, since I cannot be sure the make team
didn't intend for the change (it may be a bugfix for a long standing bug)

In any case, users of make 3.82 can expect to grapple with this, thus
the desire to fully understand what is really gong on here.


Here is the proof that make 3.82 acts differently:

[jdines at hydra linux-2.6 (make-fix)] git checkout -b
make-3.82-shoukld-fail v2.6.26
Checking out files: 100% (21206/21206), done.
Switched to a new branch 'make-3.82-shoukld-fail'
[jdines at hydra linux-2.6 (make-3.82-shoukld-fail)] make clean && make
Makefile:1550: *** mixed implicit and normal rules.  Stop.

real    0m0.269s
user    0m0.101s
sys     0m0.097s
[jdines at hydra linux-2.6 (make-3.82-shoukld-fail)]



> 
> Or I mis-interpreted your message... :-/
> 
> Regards,
> Yann E. MORIN.
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMe9HMAAoJECSpOhdQESq6brsH/itD8LTfB1xRjwR7H5qvrUBW
VLzt226bW5dRwMYkX5Gf0SkwlmN3X4YSihhedraALwgFic9E6pEH17fnW0MqO4dc
RRIPZUImOekiZVvxRFuf+qPuckThP34yhNyMd/EAV/C0WEJBELhSRfeA0hFsaXo8
zT9de+8jn7FR5MUVPLe0JV2/GAMuFA4/DEbe1X7rbGtMH21AsjUJ04d9fa+V/u8o
USfi3KQRiV2222OxLJKpY+OZFdz/LB/k3JpudN/msTPCCFm1FuTaIhuaOduevDst
WgKbCBgwKO2Rq6JBPJegy4hxnnT+vvCIFq/XRTpqLPFVCJYBhN7vdSHJPtoGfi0=
=45cr
-----END PGP SIGNATURE-----
