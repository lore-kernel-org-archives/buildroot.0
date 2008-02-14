From: Steve Calfee <nospamcalfee@yahoo.com>
Date: Thu, 14 Feb 2008 13:57:49 -0800 (PST)
Subject: [Buildroot] pciutils-2.2.6 fails to build for powerpc  405
Message-ID: <135252.4598.qm@web58211.mail.re3.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 
A while back I tried to build a 823 system. I couldn't get the kernel to compile. The kernel has both ppc and powerpc trees - which one are you using for the 405? Do you have any idea why there are two and what is the important difference?

Thanks, Steve

----- Original Message ----
From: Darcy Watkins <DWatkins@tranzeo.com>
To: buildroot at uclibc.org
Cc: mj at ucw.cz
Sent: Wednesday, February 13, 2008 10:05:48 AM
Subject: Re: [Buildroot] pciutils-2.2.6 fails to build for powerpc  405


Hello,

Included 
/ 
attached 
is 
patch 
to 
allow 
pciutils 
to 
cross 
compile 
under
buildroot 
for 
non 
i386 
architectures.  
I 
believe 
that 
the 
pciutils
package 
will 
natively 
compile 
for 
non 
i386 
architectures.  
It 
failed 
to
cross 
compile 
due 
to 
the 
use 
of 
'uname' 
on 
the 
build 
machine 
by 
the
configure 
script 
to 
attempt 
to 
determine 
system 
information 
that 
applies
to 
the 
target 
machine.

I 
am 
including 
the 
original 
email 
thread 
at 
the 
end 
of 
the 
email 
since
it 
dates 
back 
to 
sep'07.

The 
updated 
configure 
script 
will 
now 
check 
the 
$CC 
variable.  
If 
it 
is
a 
simple 
compiler 
name 
such 
as 
"gcc" 
or 
"cc", 
it 
will 
assume 
native
compile.  
If 
is 
sees 
the 
compiler 
name 
of 
the 
form 
of
"powerpc-linux-uclibc-gcc" 
it 
will 
assume 
cross 
compiled.

For 
cross 
compile, 
I 
pipe 
the 
basename 
into 
'cut' 
and 
get 
cpu 
from 
the
first 
part 
of 
the 
name 
and 
the 
sys 
from 
the 
second.  
For 
native 
compile,
I 
just 
allow 
the 
existing 
usage 
of 
'uname' 
to 
prevail.

For 
buildroot 
project, 
the 
attached 
can 
simply 
replace:
  
 
Buildroot/package/pciutils/pciutils.patch

For 
pciutils 
(upstream 
project) 
the 
patch 
will 
update:
  
 
pciutils-2.2.6/lib/configure

The 
patch 
would 
need 
to 
be 
in 
the 
buildroot 
project 
until 
such 
a 
time
that 
the 
updated 
script 
comes 
into 
buildroot 
from 
the 
upstream 
project.

The 
patch 
is 
below 
for 
perusal, 
and 
attached 
as 
a 
file 
to 
ensure 
that
Windows 
/ 
Outlook 
doesn't 
mangle 
it 
up.

--- 
pciutils-2.2.6/lib/configure.theorig    
2008-02-12
10:56:24.000000000 
-0800
+++ 
pciutils-2.2.6/lib/configure    
2008-02-12 
10:59:05.000000000
-0800
@@ 
-12,6 
+12,21 
@@ 
echo_n() 
{
 
echo_n 
"Configuring 
libpci 
for 
your 
system..."
 
idsdir=${1:-/usr/share}
 
version=${2:-0.0}
+if 
[ 
$CC 
] 
; 
then
+    
# 
Cross 
compiling 
is 
assumed 
if 
$CC 
is 
of 
the 
form
$cpu-$sys[-$variant]-$compiler
+    
# 
i.e. 
not 
simply 
"gcc", 
"cc", 
etc.
+    
sys=`basename 
$CC 
| 
cut 
-d 
'-' 
-f 
2`
+    
if 
[ 
"$sys" 
== 
"`basename 
$CC`" 
] 
; 
then
+    
    
# 
Native 
compiled
+    
    
unset 
sys
+    
else
+    
    
cpu=`basename 
$CC 
| 
cut 
-d 
'-' 
-f 
1`
+    
    
rel=$4
+    
    
echo 
"cross-compiled 
for 
${cpu}-${sys} 
$rel 
using: 
$CC"
+    
fi
+fi
+
+if 
[ 
! 
$sys 
] 
; 
then
 
sys=`uname 
-s`
 
rel=`uname 
-r`
 
if 
[ 
"$sys" 
= 
"AIX" 
-a 
-x 
/usr/bin/oslevel 
-a 
-x 
/usr/sbin/lsattr 
]
@@ 
-33,6 
+48,7 
@@ 
cpu=`echo 
$host 
| 
sed 
's/^\([^-]*\)-\([^
 
sys=`echo 
$host 
| 
sed 
's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\3/'`
 
rel=${4:-$rel}
 
echo 
" 
$host 
$rel"
+fi
 
zlib=$5
 
 
c=config.h

I 
have 
tested 
this 
for 
buildroot 
cross 
compile 
on 
an 
i386 
linux 
(fc6)
build 
machine 
for 
powerpc 
target 
to 
run 
on 
embedded 
linux.  
I 
have 
not
tested 
for 
any 
other 
architecture 
(or 
build 
machine 
config).

Regards,

Darcy



-----Original 
Message-----
From: 
buildroot-bounces at uclibc.org 
[mailto:buildroot-bounces at uclibc.org]
On 
Behalf 
Of 
Darcy 
Watkins
Sent: 
Friday, 
September 
14, 
2007 
8:02 
AM
To: 
buildroot at uclibc.org
Subject: 
Re: 
[Buildroot] 
pciutils-2.2.6 
fails 
to 
build 
for 
powerpc 
405

Hello 
Bernhard 
et 
al,

I 
checked 
into 
this.  
Extracted 
from 
email 
response 
from 
Martin 
who 
owns
/ 
maintains 
PCI 
utils...

>> 
I 
believe 
that 
in 
order 
to 
properly 
support 
cross 
compiling, 
the 
>> 
configure 
scripts 
need 
to 
check 
the 
variables 
normally 
associated
with 
>> 
cross 
compiling 
and 
target 
architecture 
rather 
than 
using 
the 
"uname"
>> 
utility 
of 
the 
machine 
running 
the 
build 
(otherwise 
it 
will 
configure

>> 
for 
the 
build 
machine 
and 
then 
attempt 
to 
cross 
compile 
it 
for 
the 
>> 
target).
>
>Which 
variables 
do 
you 
have 
in 
mind?

I 
looked 
at 
the 
"configure" 
script 
and 
put 
in 
a 
few 
"echo"'s 
to 
spit 
out
typical 
cross 
compile 
variables 
that 
are 
set.  
I 
notice 
that 
$ARCH 
and
$CROSS_COMPILE 
are 
not 
set 
when 
using 
buildroot.  
It 
appears 
that 
the
only 
one 
reliable 
(I 
know 
of) 
is 
$CC.  
When 
using 
buildroot 
to 
compile
for 
powerpc, 
I 
see 
something 
like:

  
<path 
to 
my 
toolchain>/powerpc-linux-uclibc-gcc

So 
I 
could 
suggest 
to 
Martin 
a 
check 
of 
$CC 
for 
a 
prefix 
in 
front 
of 
the
gcc 
(after 
any 
path).  
If 
so 
then 
extract 
contents 
as 
follows:

  
Cpu 
<== 
from 
the 
prefix 
up 
to 
the 
first 
"-"
  
Sys 
<== 
from 
the 
prefix 
after 
the 
first 
"-" 
to 
the 
"-" 
before 
the 
gcc
  
Host 
<== 
I 
believe 
that 
this 
should 
still 
be 
derived 
from 
"uname"
since 
it
  
  
  
  
  
 
describes 
the 
build 
machine 
not 
the 
target 
machine

++++++++++
*** 
DLW 
feb13,2008 
- 
Host 
will 
be 
derived 
from 
cpu 
and 
sys 
as 
before 
for
native 
compile 
and 
not 
be 
used 
at 
all 
for 
cross 
compile.
++++++++++

If 
there 
is 
no 
prefix 
in 
front 
of 
the 
"gcc" 
then 
assume 
not 
cross
compiling 
(native 
compile) 
and 
use 
"uname" 
as 
is 
done 
at 
present.

I 
think 
that 
"linux-uclibc" 
will 
work 
out 
OK.

Ultimately, 
at 
this 
point, 
it 
appears 
that 
we 
only 
need 
sufficient 
logic
to 
ensure 
that 
$cpu 
takes 
on 
a 
value 
other 
than 
"i386" 
when 
cross
compiling 
for 
other 
architectures, 
because 
that 
is 
all 
the 
configure
script 
checks 
for 
now.

I 
don't 
know 
how 
this 
will 
behave 
for 
native 
compiling 
on 
all 
the 
other
operating 
systems 
(BSD, 
cygwin, 
etc).  
Is 
there 
a 
better 
variable 
to 
use
than 
$CC?

Regards,

Darcy


-----Original 
Message-----
From: 
Bernhard 
Fischer 
[mailto:rep.dot.nop at gmail.com] 
Sent: 
Thursday, 
September 
13, 
2007 
2:26 
AM
To: 
Darcy 
Watkins
Cc: 
buildroot@uclibc.org
Subject: 
Re: 
[Buildroot] 
pciutils-2.2.6 
fails 
to 
build 
for 
powerpc 
405

--snip!--

>I 
think 
that 
the 
short 
solution 
is 
to 
patch 
line 
#23 
so 
that 
it 
derives
>cpu 
from 
architecture 
variables 
instead 
of 
the 
output 
of 
uname.

Sounds 
ok. 
Is 
this 
already 
fixed 
updstream? 
If 
not 
it 
would 
be 
nice 
if
you 
could 
make 
sure 
that 
we 
can 
inherit 
a 
working 
version 
from
upstream..
_______________________________________________
buildroot 
mailing 
list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot


-----Inline Attachment Follows-----

--- 
pciutils-2.2.6/lib/configure.theorig    
2008-02-12 
10:56:24.000000000 
-0800
+++ 
pciutils-2.2.6/lib/configure    
2008-02-12 
10:59:05.000000000 
-0800
@@ 
-12,6 
+12,21 
@@ 
echo_n() 
{
 
echo_n 
"Configuring 
libpci 
for 
your 
system..."
 
idsdir=${1:-/usr/share}
 
version=${2:-0.0}
+if 
[ 
$CC 
] 
; 
then
+    
# 
Cross 
compiling 
is 
assumed 
if 
$CC 
is 
of 
the 
form 
$cpu-$sys[-$variant]-$compiler
+    
# 
i.e. 
not 
simply 
"gcc", 
"cc", 
etc.
+    
sys=`basename 
$CC 
| 
cut 
-d 
'-' 
-f 
2`
+    
if 
[ 
"$sys" 
== 
"`basename 
$CC`" 
] 
; 
then
+    
    
# 
Native 
compiled
+    
    
unset 
sys
+    
else
+    
    
cpu=`basename 
$CC 
| 
cut 
-d 
'-' 
-f 
1`
+    
    
rel=$4
+    
    
echo 
"cross-compiled 
for 
${cpu}-${sys} 
$rel 
using: 
$CC"
+    
fi
+fi
+
+if 
[ 
! 
$sys 
] 
; 
then
 
sys=`uname 
-s`
 
rel=`uname 
-r`
 
if 
[ 
"$sys" 
= 
"AIX" 
-a 
-x 
/usr/bin/oslevel 
-a 
-x 
/usr/sbin/lsattr 
]
@@ 
-33,6 
+48,7 
@@ 
cpu=`echo 
$host 
| 
sed 
's/^\([^-]*\)-\([^
 
sys=`echo 
$host 
| 
sed 
's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\3/'`
 
rel=${4:-$rel}
 
echo 
" 
$host 
$rel"
+fi
 
zlib=$5
 
 
c=config.h



-----Inline Attachment Follows-----

_______________________________________________
buildroot 
mailing 
list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot






      ____________________________________________________________________________________
Never miss a thing.  Make Yahoo your home page. 
http://www.yahoo.com/r/hs
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080214/a599f886/attachment.htm 
