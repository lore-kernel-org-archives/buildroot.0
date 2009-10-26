From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Mon, 26 Oct 2009 07:37:10 +0100
Subject: [Buildroot]  Autoconf still not building (M4 ) results
Message-ID: <1531E53627F1F749B4FE809BF2A4EB67013CF4C7@WETMEX10.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Repost .. mail did not reach mailing-list.

Noel,
________________________________

From: Noel Vellemans  
 Sent: 26Oct09 00:16
To: Peter Korsgaard
Cc: Sagaert Johan; buildroot at uclibc.org; llandwerlin at gmail.com;
Vellemans, Noel
Subject: Re: [Buildroot] Autoconf still not building (M4 ) results


Hi all,

Been DIGGING into the configure script ...And I have found SOMETHING
that possibly is the problem.

(have put a lot of echo's into the code to find-out something wierd)

I think the problem is that the LINE 
'echo
'changequote(<,>)indir(<ifdef>,mac,bug)patsubst(a,\(b\)\|\(a\),\1)dnl' |
/buildhome/20091024/buildroot/output/host/usr/bin/m4 --trace=mac' is not
empty/zero but a strange character printed as a small funny-thing a "00
01" (graphic thing) , due to this the 'test -z' fails .

A second test I did was remove the '&& test -z "`echo $ac_snippet |
$ac_path_M4 --trace=mac 2>&1`"line in the script and then everything
runs normal (no errors).


<snip .. echo stuff >

  test -z "$as_dir" && as_dir=.
    for ac_prog in m4 gm4 gnum4; do
    for ac_exec_ext in '' $ac_executable_extensions; do
      ac_path_M4="$as_dir/$ac_prog$ac_exec_ext"

#      echo "\n(0) $ac_path_M4,  $as_dir,  $ac_prog,   $ac_exec_ext,
$as_test_x"
 
      { test -f "$ac_path_M4" && $as_test_x "$ac_path_M4"; } || continue
      # Root out GNU M4 1.4.5, as well as non-GNU m4 that ignore -t, -F.
      ac_snippet=change'quote(<,>)in''dir(<if''def>,mac,bug)'
      ac_snippet=${ac_snippet}pat'subst(a,\(b\)\|\(a\),\1)d'nl
      
      echo "\n(1) $ac_path_M4"
      echo "$ac_snippet | $ac_path_M4 --trace=mac"
#      $ac_path_M4 -F conftest.m4f
#      cat conftest.m4f
#      rm -f conftest.m4f
      echo "$ac_snippet | $ac_path_M4 --trace=mac."
      echo
'changequote(<,>)indir(<ifdef>,mac,bug)patsubst(a,\(b\)\|\(a\),\1)dnl' |
/buildhome/20091024/buildroot/output/host/usr/bin/m4 --trace=mac
## THE ABOVE line prints a strange CHARACTER bug here ???????

      test -z "`$ac_path_M4 -F conftest.m4f </dev/null 2>&1`" \
      && test -z "`echo $ac_snippet | $ac_path_M4 --trace=mac 2>&1`" \
      && test -f <snip .. echo stuff >
conftest.m4f \
      && ac_cv_path_M4=$ac_path_M4 ac_path_M4_found=:
      rm -f conftest.m4f
      $ac_path_M4_found && break 3
    done
<snip .. echo stuff >


Greetz...... Noel


PS: upgrading to a newer version (> 1.4.9) has the same problem (double
checked it)



On Sun, Oct 25, 2009 at 5:47 PM, Peter Korsgaard <jacmet@uclibc.org>
wrote:


	>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be>
writes:
	
	
	 Sagaert> Hi
	
	 Sagaert> There seems to be a problem somewhere in the configure
script
	 Sagaert> of autoconf 2.64
	
	Exactly.
	
	 Sagaert> I found a way to solve it by setting the M4 variable
in the
	 Sagaert> makefile (line 42) so the configure script does not
have to
	 Sagaert> parse and find the m4 path.
	
	Ok, that's atleast a workaround, but I would like to understand
what the
	problem is exactly.
	
	 Sagaert> Something seems to go wrong in the tests done around
line 2378 in the
	 Sagaert> configure script (compare with configure script of
v2.63 )
	
	 Sagaert> Snip
	 Sagaert>    { test -f "$ac_path_M4" && $as_test_x
"$ac_path_M4"; } || continue
	 Sagaert>       # Root out GNU M4 1.4.5, as well as non-GNU m4
that ignore -t, -F.
	 Sagaert>
ac_snippet=change'quote(<,>)in''dir(<if''def>,mac,bug)'
	 Sagaert>
ac_snippet=${ac_snippet}pat'subst(a,\(b\)\|\(a\),\1)d'nl
	 Sagaert>       echo "ac_snippet2=$ac_snippet"
	 Sagaert>       test -z "`$ac_path_M4 -F conftest.m4f </dev/null
2>&1`" \
	 Sagaert>       && test -z "`echo $ac_snippet | $ac_path_M4
--trace=mac 2>&1`" \
	 Sagaert> snip
	
	Indeed. Could you try sticking in a few debug echo lines, to
figure out
	what's going on?
	
	 Sagaert> Meanwhile it might be a good idea to update the m4
package in buildroot to
	 Sagaert> 1.4.13 instead of the current 1.4.9
	
	Indeed. But you wrote something earlier about that not having
any effect
	on the above problem, right?
	
	--
	Bye, Peter Korsgaard
	


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091026/f2c6a74d/attachment.htm>
