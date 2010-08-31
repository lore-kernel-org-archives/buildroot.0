From: James J. Dines <jdines@jdines.net>
Date: Tue, 31 Aug 2010 12:38:35 -0400
Subject: [Buildroot] [Bug 2479] New: host-module-init-tools 3.11 fails
 to build
In-Reply-To: <4C7D2AE6.10100@jdines.net>
References: <bug-2479-163@https.bugs.busybox.net/> <4C7D2AE6.10100@jdines.net>
Message-ID: <4C7D300B.5080806@jdines.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/31/2010 12:16 PM, James J. Dines wrote:
> On 08/31/2010 09:52 AM, bugzilla at busybox.net wrote:
>> https://bugs.busybox.net/show_bug.cgi?id=2479
> 
>>            Summary: host-module-init-tools 3.11 fails to build
>>            Product: buildroot
>>            Version: unspecified
> <snip>
>> Makefile:15: *** recipe commences before first target.  Stop.
> <snip>
> 
> 
> These three lines in
> output/build/host-module-init-tools-3.11/Makefile.am are causing the issue:
> 
> SGML
> mandir
> TESTSUITE
> 
> ... vim highlights them in red, and changing them to '= foo' causes the
> build to kick off and fail when it gets to the SGML building stage.
> 
> I haven't figured out exactly how to change th./configure: line 1930: `AX_ENABLE_BUILDDIR(build)'
em to make them do as
> desired yet, but hopefully this saves someone a lot of work.
> 

I forgot to mention that, after editing the aforementioned three lines,
you need to delete the Makefile and do the following to generate new
files with the modified Makefile.am lines:

aclocal
autoconf
automake

... then edit out line 1930 of the configure script, since it gives:

./configure: line 1930: syntax error near unexpected token `build'
./configure: line 1930: `AX_ENABLE_BUILDDIR(build)'

and then do a ./configure before running make in the top level directory

All of this is just to prove that those three lines cause the problem of
course.  Obviously once they are fixed properly all these hoops will not
need to be jumped through.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMfTAAAAoJECSpOhdQESq6DbkH+gN/BS2qMshsN8DJE08X70s0
l8iNEhXfEavycOYNuxF4rvx7bbiB+zKFEfIWPCsicD24xFmxJNN+lfoEIsZ5zjKR
dmXfGu4BwPzB87d/RdJrLDLK45MyNrh5QjodEGCpJip8r8kNvcekEA9v/njixnvQ
79pwIVTRO+X9lxqUsSooGW40ao6tMoCbJSQp7QyGPzmvWeJYo5FmAHBWRftlyqFG
cBo7bWlcx2DtyO6tVEngzrUC3+T+n4JvKu98DoQqEjyNNxKGGeEjs5SDXkO9aHH8
pwTIqWPqTBbzhbkUb2b556182j1UVIHGW9xZsb+i2UkfrzwsXqszdEQX3ZYx/G8=
=lMg5
-----END PGP SIGNATURE-----
