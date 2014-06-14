From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 14 Jun 2014 09:06:10 +0200
Subject: [Buildroot] Java Runtime JRE mipsel uclibc
In-Reply-To: <E868AA1F-46ED-480D-AA22-5DBD76CED6C3@gmail.com>
References: <E868AA1F-46ED-480D-AA22-5DBD76CED6C3@gmail.com>
Message-ID: <20140614070610.GX4197@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
wreuven at gmail.com wrote,

> Can anyone suggest a good way to build a JRE to run with the JamVM
> I created using buildroot? I need Java 1.7 and the optimal JRE
> would be OpenJDK 7 headless but any advice is welcome. My target
> is uclibc on mipsel.

You have four options:
1. you port OpenJDK7 package to buildroot
2. you use OpenADK for your embedded system build, which
   includes OpenJDK7
3. you use OpenEmbedded which should have OpenJDK7
4. you just create OpenJDK7 with either OpenADK or OpenEmbedded and
   use the binaries for your buildroot build

Be aware of the fact, that uClibc is highly configurable, so that
a binary created with another system might fail to work on your
target, because of ABI or version mismatches.

root at openadk:/ # uname -a                                                      
Linux openadk 3.15.0 #2 Fri Jun 13 23:21:25 CEST 2014 mips GNU/Linux
root at openadk:/ # java HelloWorld                                               
HelloWorld
root at openadk:/ # java -version
file $(whjava version "1.7.0_55"
OpenJDK Runtime Environment (IcedTea 2.4.7) (Debian build
1.7.0_55-b14)
OpenJDK Zero VM (build 24.51-b03, interpreted mode)
root at openadk:/ # file $(which java)
/usr/bin/java: symbolic link to `../lib/jvm/jre/bin/java'
root at openadk:/ # file /usr/lib/jvm/jre/bin/java
/usr/lib/jvm/jre/bin/java: ELF 32-bit LSB executable, MIPS, MIPS32
version 1 (SYSV), dynamically linked (uses shared libs), stripped

For an example qemu-image to test your java application, try this
one:
http://www.openadk.org/qemu-mips/qemu-mips-initramfspiggyback-kernel

start with:
qemu-system-mipsel -M malta -nographic -device e1000,netdev=adk0 \
-netdev user,id=adk0 -kernel qemu-mips-initramfspiggyback-kernel

Is the buildroot project interested in OpenJDK7?

best regards
        Waldemar
