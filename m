From: James J. Dines <jdines@jdines.net>
Date: Tue, 31 Aug 2010 14:32:05 -0400
Subject: [Buildroot] [Bug 2479] New: host-module-init-tools 3.11 fails
 to build
In-Reply-To: <4C7D300B.5080806@jdines.net>
References: <bug-2479-163@https.bugs.busybox.net/> <4C7D2AE6.10100@jdines.net>
	<4C7D300B.5080806@jdines.net>
Message-ID: <4C7D4AA5.7090101@jdines.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/31/2010 12:38 PM, James J. Dines wrote:
> On 08/31/2010 12:16 PM, James J. Dines wrote:
>> On 08/31/2010 09:52 AM, bugzilla at busybox.net wrote:
>>> https://bugs.busybox.net/show_bug.cgi?id=2479
> 
>>>            Summary: host-module-init-tools 3.11 fails to build
>>>            Product: buildroot
>>>            Version: unspecified
>> <snip>
>>> Makefile:15: *** recipe commences before first target.  Stop.
>> <snip>
> 
> 
>> These three lines in
>> output/build/host-module-init-tools-3.11/Makefile.am are causing the issue:
> 
>> SGML
>> mandir
>> TESTSUITE
> 
>> ... vim highlights them in red, and changing them to '= foo' causes the
>> build to kick off and fail when it gets to the SGML building stage.
> 
>> I haven't figured out exactly how to change th./configure: line 1930: `AX_ENABLE_BUILDDIR(build)'
> em to make them do as
>> desired yet, but hopefully this saves someone a lot of work.
> 
> 
> I forgot to mention that, after editing the aforementioned three lines,
> you need to delete the Makefile and do the following to generate new
> files with the modified Makefile.am lines:
> 
> aclocal
> autoconf
> automake
> 
> ... then edit out line 1930 of the configure script, since it gives:
> 
> ./configure: line 1930: syntax error near unexpected token `build'
> ./configure: line 1930: `AX_ENABLE_BUILDDIR(build)'
> 
> and then do a ./configure before running make in the top level directory
> 
> All of this is just to prove that those three lines cause the problem of
> course.  Obviously once they are fixed properly all these hoops will not
> need to be jumped through.

In order to get past this until a fix is available upstream or someone
here creates a patch to Makefile.am, one can disable the option to
generate documentation for the host in the menuconfig, then rather than
doing an option-less ./configure simply copy and paste the ./configure
line from the failed make and do a make from the top level directory.

The result is that docs on the target won't be available, but since the
other option is to have no target available at all this seems like a
fair trade-off :-)

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMfUqbAAoJECSpOhdQESq6cZYH/jKyl9ldos8eHg8RtiHcgLTY
hVT7dwmhPirOI/2miE348TVRPjZx1h7uquJMJFNKM+nm6HVOWc/qspq9CS2Mcbu1
8FX49uSX5mVYlFzXRO49/qVxPNNhTo+wVk26Ywq8g3hdzdrvenzfRLVx55M9lN3r
7eqULjDw09GiPQxKZnNYglh/P0OfEuyshfxfVIupnS8dqrVqKujqO1vxuAgnqNNk
cM29JuAJcMsMVfmbFRi1iyoQLccjqyfEDrpT6y2barwPS6IEHl6budfjiBJ76Uzx
bgC2hWUEClREBwPDavyTBSXIA2OPup4h8XHmaTj/+two04mq3EhI5lPs2tPLOdo=
=VPPQ
-----END PGP SIGNATURE-----
