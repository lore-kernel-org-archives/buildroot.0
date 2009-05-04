From: Cyril HAENEL <chaenel@free.fr>
Date: Mon, 04 May 2009 12:39:51 +0200
Subject: [Buildroot] Problem with LZO package in ARM configuration,
 need help to solve the problem
Message-ID: <49FEC5F7.9070808@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all, I always have a problem with the LZO package when I activate the 
JFFS2 filesystem as output filesystem (generic arm target). Please read 
the entire explanation because I maybe found the problem but I don't 
know how to solve it.

When I do a make, everything is OK until the .configure script of the 
lzo package, the script blocks at this point :

[...]
checking for stdint.h... yes
checking for unistd.h... yes
checking dlfcn.h usability... yes
checking dlfcn.h presence... yes
checking for dlfcn.h... yes
checking for arm-linux-g++... arm-linux-g++
checking whether we are using the GNU C++ compiler...

I looked in the configure script, and I found the blocking point. It's 
near line 5540 (I modified the script to do different tests and I don't 
remember the exact line number) :

if { (eval echo "$as_me:$LINENO: \"$ac_compile\"") >&5
  (eval $ac_compile) 2>conftest.er1
  ac_status=$?
  grep -v '^ *+' conftest.er1 >conftest.err
  rm -f conftest.er1
  cat conftest.err >&5
  echo "$as_me:$LINENO: \$? = $ac_status" >&5
  (exit $ac_status); } &&
     { ac_try='test -z "$ac_cxx_werror_flag"             || test ! -s 
conftest.err'
  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
  (eval $ac_try) 2>&5
  ac_status=$?
  echo "$as_me:$LINENO: \$? = $ac_status" >&5
  (exit $ac_status); }; } &&
     { ac_try='test -s conftest.$ac_objext'
  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
  (eval $ac_try) 2>&5
  ac_status=$?
  echo "$as_me:$LINENO: \$? = $ac_status" >&5
  (exit $ac_status); }; }; then
  ac_compiler_gnu=yes
else
[...]


It's this line which blocks and never return : (eval $ac_compile) 
2>conftest.er1
I put the follow line before the "if", to know the content of $ac_compile :

eval echo "$as_me:$LINENO: \"$ac_compile\""

It gives me :

arm-linux-g++ -c -Os -pipe -Os  
-I/home/nlc/developpement/linuxEmbedded/buildroot/build_arm/staging_dir/usr/include 
-I/home/nlc/developpement/linuxEmbedded/buildroot/build_arm/staging_dir/include 
--sysroot=/home/nlc/developpement/linuxEmbedded/buildroot/build_arm/staging_dir/ 
-isysroot 
/home/nlc/developpement/linuxEmbedded/buildroot/build_arm/staging_dir 
-mabi=apcs-gnu  conftest.cc >&5

I opened another console, I gone into build_arm/lzo-2.03 directory, and 
I tried to launch this command line. And it blocks....
Thus I tried to delete command line options one by one.

I first deleted the "-isysroot 
/home/nlc/developpement/linuxEmbedded/buildroot/build_arm/staging_dir" 
option. After that, it doesn't block but there is an error :

cc1plus: error: invalid option `abi=apcs-gnu'
cc1plus: error: unrecognized command line option 
"-fsysroot=/home/nlc/developpement/linuxEmbedded/buildroot/build_arm/staging_dir/"

Thus I deleted the "abi=apcs-gnu" and 
"--sysroot=/home/nlc/developpement/linuxEmbedded/buildroot/build_arm/staging_dir/" 
option :

arm-linux-g++ -c -Os -pipe -Os  
-I/home/nlc/developpement/linuxEmbedded/buildroot/build_arm/staging_dir/usr/include 
-I/home/nlc/developpement/linuxEmbedded/buildroot/build_arm/staging_dir/include 
conftest.cc

No error, and no blocking !

Any idea from where the problem can come from ?

I maybe have an idea : why does the script use arm-linux-g++ compiler 
and not the complete path to the previously built arm compiler toolchain ?
Because in fact it seems the configure script uses the arm-linux-g++ 
compiler _installed_ _on_  _my_ _machine_ !! But this compiler is and 
old version (gcc3.4) and has nothing to do with buildroot normally !!??

Regards,
Cyril

-- 

Cyril Haenel
Registered Linux User #332632
