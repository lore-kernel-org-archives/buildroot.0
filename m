From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 14 Mar 2018 12:08:47 +0000
Subject: [Buildroot] [Bug 10856] New: openblas on qemu_x86_64_defconfig
 fails with "sgemm_kernel.o: No such file or directory"
Message-ID: <bug-10856-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10856

            Bug ID: 10856
           Summary: openblas on qemu_x86_64_defconfig fails with
                    "sgemm_kernel.o: No such file or directory"
           Product: buildroot
           Version: 2018.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ciro.santilli at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

7d43534625ac06ae01987113e912ffaf1aec2302 post 2018.02, then:

     make qemu_x86_64_defconfig
     printf 'BR2_PACKAGE_OPENBLAS=y\n' >>.config
     make olddefconfig
     time make BR2_JLEVEL="$(nproc)"

Fails with:

   
/home/ciro/bak/git/buildroot/output/host/bin/x86_64-buildroot-linux-uclibc-ar:
sgemm_kernel.o: No such file or directory                                       

The build works however if I set:

    BR2_PACKAGE_OPENBLAS_TARGET="NEHALEM"

while the default was "SSE_GENERIC", and I am able to run a simple test program
on qemu like that.

There are a few reports on their bug tracker e.g.: 
https://github.com/xianyi/OpenBLAS/issues/502

Not sure if we should just change the default, or just update the package, or
something else.

I tried upgrading to master at 2c7392f07bb8023adbc7b85c049d16607ade77e1 but it
fails with:

```
>>> openblas 2c7392f07bb8023adbc7b85c049d16607ade77e1 Downloading
--2018-03-14 12:07:26-- 
https://github.com/xianyi/OpenBLAS/archive/2c7392f07bb8023adbc7b85c049d16607ade77e1/openblas-2c7392f07bb8023adbc7b85c049d16607ade77e1.tar.gz
Resolving github.com (github.com)... 192.30.253.113, 192.30.253.112
Connecting to github.com (github.com)|192.30.253.113|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location:
https://codeload.github.com/xianyi/OpenBLAS/tar.gz/2c7392f07bb8023adbc7b85c049d16607ade77e1
[following]
--2018-03-14 12:07:27-- 
https://codeload.github.com/xianyi/OpenBLAS/tar.gz/2c7392f07bb8023adbc7b85c049d16607ade77e1
Resolving codeload.github.com (codeload.github.com)... 192.30.253.120,
192.30.253.121
Connecting to codeload.github.com (codeload.github.com)|192.30.253.120|:443...
connected.
HTTP request sent, awaiting response... 200 OK
Length: 11773681 (11M) [application/x-gzip]
Saving to:
?/home/ciro/bak/git/buildroot/output/build/.openblas-2c7392f07bb8023adbc7b85c049d16607ade77e1.tar.gz.qhA0S2/output?

/home/ciro/bak/git/buildroot/output/build/.openblas-
100%[=====================================================================================================================>]
 11.23M  3.70MB/s    in 3.0s    

2018-03-14 12:07:30 (3.70 MB/s) -
?/home/ciro/bak/git/buildroot/output/build/.openblas-2c7392f07bb8023adbc7b85c049d16607ade77e1.tar.gz.qhA0S2/output?
saved [11773681/11773681]

ERROR: No hash found for
openblas-2c7392f07bb8023adbc7b85c049d16607ade77e1.tar.gz
--2018-03-14 12:07:30-- 
http://sources.buildroot.net/openblas-2c7392f07bb8023adbc7b85c049d16607ade77e1.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 104.27.167.48,
104.27.166.48, 2400:cb00:2048:1::681b:a730, ...
Connecting to sources.buildroot.net
(sources.buildroot.net)|104.27.167.48|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2018-03-14 12:07:31 ERROR 404: Not Found.

package/pkg-generic.mk:160: recipe for target
'/home/ciro/bak/git/buildroot/output/build/openblas-2c7392f07bb8023adbc7b85c049d16607ade77e1/.stamp_downloaded'
failed
make[1]: ***
[/home/ciro/bak/git/buildroot/output/build/openblas-2c7392f07bb8023adbc7b85c049d16607ade77e1/.stamp_downloaded]
Error 1
Makefile:79: recipe for target '_all' failed
make: *** [_all] Error 2
````

so something with the `source.buildroot.org` cache that I don't understand.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
